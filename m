From: zongbox@gmail.com (Zong Li)
Date: Sat, 27 Oct 2018 00:13:05 +0800
Subject: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
In-Reply-To: <CAHk-=wiHy+39PkEjUuQRJdOO7aNytYXeAGD-tZwOfOEj6ZhTKg@mail.gmail.com>
References: <mhng-80deacac-267f-4b3a-ac60-4e24f120d86e@palmer-si-x1c4>
 <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
 <41b34e47-57de-bcc1-c86e-8b98f663367a@sifive.com>
 <CAHk-=wiHy+39PkEjUuQRJdOO7aNytYXeAGD-tZwOfOEj6ZhTKg@mail.gmail.com>
Message-ID: <CA+ZOyagSZHXXy_ViTg7Po3qOVgUschzuvDXrhuiAkr-dg-svig@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Linus Torvalds <torvalds@linux-foundation.org> ? 2018?10?26? ?? ??9:51???
>
> On 10/25/18 6:12 PM, Linus Torvalds wrote:
> >
> > Almost always, the 64-bit divide turns out to be entirely pointless,
> > and the code can be written as a (much cheaper) 64-by-32 divide
> > instead using the functions in <asm/div.h> instead.
>
> The other common situation for the kernel is that something was
> written as "xyz / abc", when it turns out that abc is really just a
> power-of-two.
>
> So it's not necessarily always that the 64-bit divide can be
> re-written as a 64-by-32 divide, sometimes it can be rewritten as
> simply a shift. Which is even cheaper.
>
> That's the reason I try to actively discourage full 64-by-64 divides.
> We have had situations where people end up using a divide that can
> take hundres of cycles, where alarmingly often it can be rewritten as
> one that takes tens of cycles or even just _single_ cycles.
>
> People don't sometimes appreciate just how expensive 64-by-64 divides
> are when you don't have direct hardware support for them, and how
> often there are much simpler and faster ways to avoid them.
>

Our driver guys implement the DMA driver which has a full 64-bit
divide in its initialization function. I had checked the code, it
could use the 64-by-32 divides in fact of the situation. I was not
conscious of the mistake and naively thought that umoddi3 is useful
for the other drivers which need the 64-by-64 divide. I would submit a
patch to get rid of these routines.
