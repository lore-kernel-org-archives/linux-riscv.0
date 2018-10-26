From: zongbox@gmail.com (Zong Li)
Date: Sat, 27 Oct 2018 00:19:38 +0800
Subject: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
In-Reply-To: <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
References: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
 <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
 <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
Message-ID: <CA+ZOyaiPpM4gBHGqRcus_TtH-mqZHkvApj1xP0ep5-p81_ffeg@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Paul Walmsley <paul.walmsley@sifive.com> ? 2018?10?26? ?? ??9:35???
>
> + Zong Li
>
> Zong,
>
> On 10/25/18 6:12 PM, Linus Torvalds wrote:
> > On Wed, Oct 24, 2018 at 1:42 PM Palmer Dabbelt <palmer@sifive.com> wrote:
> >> I'm pretty sure this is our largest patch set since the original kernel
> >> contribution, and it's certainly the one with the most contributors.
> >> While I don't have anything else I know I'm going to submit for the
> >> merge window, I would be somewhat surprised if I didn't screw anything
> >> up.
> > So I'm not entirely sure this is a screw-up, but it does have some
> > signs of being one:
> >
> >>        lib: Add umoddi3 and udivmoddi4 of GCC library routines
> > We have *actively* tried to avoid needing umoddi3 and friends, and
> > have so far succceeded in doing that across many different
> > architectures, and many many years.
> >
> > And when we _have_ added it, we've added it as architecture-specific
> > optimized routines when people really need it.
> >
> > The reason to avoid a full 64-by-64 divide is that
> >
> >   (a) it is really expensive
> >
> >   (b) code that needs it is almost always actually wrong
> >
> > Almost always, the 64-bit divide turns out to be entirely pointless,
> > and the code can be written as a (much cheaper) 64-by-32 divide
> > instead using the functions in <asm/div.h> instead.
> >
> > Does RISC-V _really_ need that disgusting full 64-bit divide, or was
> > the addition of that simply a "we didn't know better, and didn't
> > realize just how expensive and wrong it is"?
>
>
> I believe the request for those routines came from you:
>
>
> https://lore.kernel.org/lkml/779b0b25cc96101a525402f38053db5e2f360d6f.1538535528.git.zongbox at gmail.com/
>
>
> Do you in fact need a full 64-by-64 bit divide in your DMA driver, or
> can you
>
> get away with using div_u64() et al.?
>
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/math64.h#n123
>

Thanks for the information. The DMA driver could use the 64-by-32
divides in fact of the situation. I would submit a patch to drop this.
