       use iso_c_binding
       implicit none
       interface
         subroutine pyset(name) bind(C, name='Py_SetProgramName')
           import
           character(kind=c_char),  intent(in) :: name(*)
         end subroutine pyset
         subroutine pyinit() bind(C, name='Py_Initialize')
           import
         end subroutine pyinit
         subroutine pyrun(command) bind(C, name='PyRun_SimpleString')
           import
           character(kind=c_char),  intent(in) :: command(*)
         end subroutine pyrun
         subroutine pyfinalize() bind(C, name='Py_Finalize')
           import
         end subroutine pyfinalize
       end interface
       call pyset(c_char_"xs")
       call pyinit()
       call pyrun(c_char_"import yt"//NEW_LINE(''))
       call pyrun(c_char_"ds = yt.load('IsolatedGalaxy/galaxy0030/&
                    &galaxy0030')"//NEW_LINE(''))
       call pyrun(c_char_"p = yt.SlicePlot(ds, 'x', 'temperature')&
                    &"//NEW_LINE(''))
       call pyrun(c_char_"print p.save()"//NEW_LINE(''))
       call pyrun(c_char_""//NEW_LINE(''))
       call pyfinalize()
       end
