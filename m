From: rostedt@goodmis.org (Steven Rostedt)
Date: Tue, 8 May 2018 23:02:00 -0400
Subject: [PATCH] riscv/ftrace: Fix the problem modules cannot find _mcount
In-Reply-To: <20180509023605.GB7303@andestech.com>
References: <1525749717-384-1-git-send-email-alankao@andestech.com>
 <20180508091142.12b5231a@gandalf.local.home>
 <20180509023605.GB7303@andestech.com>
Message-ID: <20180508230200.69fbf110@vmware.local.home>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, 9 May 2018 10:36:05 +0800
Alan Kao <alankao@andestech.com> wrote:

> This EXPORT_SYMBOL and the _mcount body was inside a
> "#ifndef CONFIG_DYNAMIC_FTRACE" section, so if the config has dynamic ftrace
> disabled, _mcount is visible.
> 
> For the dynamic ftrace case, there is a code snippet in this file:
> 
> > ENTRY(ftrace_stub)
> > #ifdef CONFIG_DYNAMIC_FTRACE         
> >       .global _mcount
> >       .set    _mcount, ftrace_stub
> > #endif
> >        ret 
> > ENDPROC(ftrace_stub)  

I missed that, thanks.

> 
> Talking about some bigger issues here, there will be twofold.
> 
> 1. This patch lacks call-site collecting mechanism.
> 
> This feature requires a pattern check in recordmcount.pl.  With this,
> section __mcount_loc is properly constructed, and the call-sites will be
> registered during the loading stage.
> 
> However, the loading will then fail at the first try of make_nop, due to
> the instruction check.  This is thus the second issue.
> 
> 
> 2. The instruction check for kernel texts is not applicable to module texts.
> 
> The check expects a call instruction to _mcount, but here it is a call to
> the .plt section of the module.  After referencing the implementation of arm64,
> I think it would need much more work to have make_nop's and make_call's behavior
> right.

And powerpc64 I believe does something similar (which I think arm64
based it's work from).

> 
> 
> Quick summary: This patch ensures that a kernel build will not fail because of
> the _mcount-missing problem.  But ftrace cannot trace loading modules for now
> due to the stated reasons.

Probably why they had modules break to begin with ;-)

-- Steve
