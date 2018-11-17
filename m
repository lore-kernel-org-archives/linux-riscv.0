From: olof@lixom.net (Olof Johansson)
Date: Fri, 16 Nov 2018 19:09:36 -0800
Subject: [PATCH] riscv: fix warning in arch/riscv/include/asm/module.h
In-Reply-To: <mhng-1888c072-5274-457c-aa26-b9fa9cb246dd@palmer-si-x1c4>
References: <20181108190700.30825-1-david.abdurachmanov@gmail.com>
 <mhng-1888c072-5274-457c-aa26-b9fa9cb246dd@palmer-si-x1c4>
Message-ID: <CAOesGMjzOkPNv7v_uMMsCw=20NuebPvkLBS5b5eaS9Z6=p1qKg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Nov 8, 2018 at 11:32 AM Palmer Dabbelt <palmer@sifive.com> wrote:
>
> On Thu, 08 Nov 2018 11:07:00 PST (-0800), david.abdurachmanov at gmail.com wrote:
> > Fixes warning: 'struct module' declared inside parameter list will not be
> > visible outside of this definition or declaration
> >
> > Signed-off-by: David Abdurachmanov <david.abdurachmanov@gmail.com>
> > ---
> >  arch/riscv/include/asm/module.h | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/arch/riscv/include/asm/module.h b/arch/riscv/include/asm/module.h
> > index 349df33808c4..cd2af4b013e3 100644
> > --- a/arch/riscv/include/asm/module.h
> > +++ b/arch/riscv/include/asm/module.h
> > @@ -8,6 +8,7 @@
> >
> >  #define MODULE_ARCH_VERMAGIC    "riscv"
> >
> > +struct module;
> >  u64 module_emit_got_entry(struct module *mod, u64 val);
> >  u64 module_emit_plt_entry(struct module *mod, u64 val);
>
> Works for me.  Looks like arm64 might have exactly the same issue.  I'll roll
> it up into the next RC.

Looks like it's still here in -next. So, patch:

Acked-by: Olof Johansson <olof@lixom.net>

(and it'd be great to pickup together with the 32-bit build fix).


-Olof
