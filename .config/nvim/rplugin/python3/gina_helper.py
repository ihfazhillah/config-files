"""additional helper for gina nvim plugin"""
import pynvim


@pynvim.plugin
class GinaHelper():
    """additional helper for gina"""
    def __init__(self, nvim):
        self.nvim = nvim

    @pynvim.command('ThisBranch', sync=True)
    def this_branch(self):
        """get this branch"""
        current_branch = self.nvim.command_output('echo gina#component#repo#branch()')

        branch_name_list = current_branch.split('/')
        current_line = self.nvim.current.line

        if not current_line:
            self.nvim.current.line = f"[{branch_name_list[-1]}] "
        else:
            self.nvim.current.line = f"[{branch_name_list[-1]}] {current_line}"

        # change cursor into end of line
        self.nvim.command(f'call cursor(0, col("$"))')
