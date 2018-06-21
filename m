From: alankao@andestech.com (Alan Kao)
Date: Thu, 21 Jun 2018 15:19:16 +0800
Subject: [PATCH] riscv: Add support to no-FPU systems
In-Reply-To: <20180621063938.GB19319@infradead.org>
References: <1529544276-28103-1-git-send-email-alankao@andestech.com>
 <20180621063938.GB19319@infradead.org>
Message-ID: <20180621071915.GA5053@andestech.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Wed, Jun 20, 2018 at 11:39:38PM -0700, Christoph Hellwig wrote:
> > +ifeq ($(CONFIG_FPU),y)
> >  KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)fd$(KBUILD_ARCH_C)
> > +else
> > +KBUILD_AFLAGS += -march=$(KBUILD_MARCH)$(KBUILD_ARCH_A)$(KBUILD_ARCH_C)
> > +endif
> 
> Can we refactor that KBUILD_ARCH code into something like
> 
> riscv-march-y				:=
> riscv-march-$(CONFIG_ARCH_RV32I)	+= rv32im
> riscv-march-$(CONFIG_ARCH_RV64I)	+= rv64im
> riscv-march-$(CONFIG_RISCV_ISA_A)	+= a
> riscv-march-$(CONFIG_FPU)		+= fd
> riscv-march-$(CONFIG_RISCV_ISA_C)	+= c
> 
> KBUILD_CFLAGS += -march=$(riscv-march-y)
> 

That's neat, sure.

> > +#ifdef CONFIG_FPU
> >  	regs->sstatus = SR_SPIE /* User mode, irqs on */ | SR_FS_INITIAL;
> > +#else
> > +	regs->sstatus = SR_SPIE | SR_FS_OFF;
> > +#endif
> 
> Having the comment in one branch, but not the other is odd.  I'd be
> tempted to just remove t entirely, but if not it should be move up
> or duplicated.
> 

I'll move that comment up.

> >  int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src)
> >  {
> > +#ifdef CONFIG_FPU
> >  	fstate_save(src, task_pt_regs(src));
> > +#endif
> 
> Please provide a !CONFIG_FPU stub for fstate_save, please.
> 
> >  }

It's OK to do this to fstate_save/restore, and

> > +#endif
> >  
> >  static long restore_sigcontext(struct pt_regs *regs,
> >  	struct sigcontext __user *sc)
> > @@ -63,6 +65,7 @@ static long restore_sigcontext(struct pt_regs *regs,
> >  	err = __copy_from_user(regs, &sc->sc_regs, sizeof(sc->sc_regs));
> >  	if (unlikely(err))
> >  		return err;
> > +#ifdef CONFIG_FPU
> >  	/* Restore the floating-point state. */
> >  	err = restore_d_state(regs, &sc->sc_fpregs.d);
> >  	if (unlikely(err))
> > @@ -76,6 +79,7 @@ static long restore_sigcontext(struct pt_regs *regs,
> >  		if (value != 0)
> >  			return -EINVAL;
> >  	}
> > +#endif
> 
> Same here.
> 

it's also OK to do so to restore_d_state/save_d_state.  But what to do with the
following __get_user/__put_user calls?

Can I rename existing restore_d_state to __restore_d_state, and create a new
function restore_d_state which includes the original restore_d_state/__get_user
pair, and the same to save_d_state?

> > @@ -127,11 +131,13 @@ static long setup_sigcontext(struct rt_sigframe __user *frame,
> >  	size_t i;
> >  	/* sc_regs is structured the same as the start of pt_regs */
> >  	err = __copy_to_user(&sc->sc_regs, regs, sizeof(sc->sc_regs));
> > +#ifdef CONFIG_FPU
> >  	/* Save the floating-point state. */
> >  	err |= save_d_state(regs, &sc->sc_fpregs.d);
> >  	/* We support no other extension state at this time. */
> >  	for (i = 0; i < ARRAY_SIZE(sc->sc_fpregs.q.reserved); i++)
> >  		err |= __put_user(0, &sc->sc_fpregs.q.reserved[i]);
> > +#endif
> 
> Same here.
> 

Thanks,
Alan
