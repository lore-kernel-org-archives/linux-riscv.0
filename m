From: palmer@sifive.com (Palmer Dabbelt)
Date: Fri, 26 Oct 2018 12:32:47 -0700 (PDT)
Subject: [GIT PULL] RISC-V Patches for the 4.20 Merge Window, Part 1
In-Reply-To: <CAHk-=wimJ+g2O7DND0XZ54XZSrY_aiVWsiyyAXL9T1+=BG9Ptg@mail.gmail.com>
Message-ID: <mhng-5d10d061-df2c-4077-9ff3-4e3845f85293@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, 25 Oct 2018 18:12:46 PDT (-0700), Linus Torvalds wrote:
> On Wed, Oct 24, 2018 at 1:42 PM Palmer Dabbelt <palmer@sifive.com> wrote:
>>
>> I'm pretty sure this is our largest patch set since the original kernel
>> contribution, and it's certainly the one with the most contributors.
>> While I don't have anything else I know I'm going to submit for the
>> merge window, I would be somewhat surprised if I didn't screw anything
>> up.
>
> So I'm not entirely sure this is a screw-up, but it does have some
> signs of being one:
>
>>       lib: Add umoddi3 and udivmoddi4 of GCC library routines
>
> We have *actively* tried to avoid needing umoddi3 and friends, and
> have so far succceeded in doing that across many different
> architectures, and many many years.
>
> And when we _have_ added it, we've added it as architecture-specific
> optimized routines when people really need it.
>
> The reason to avoid a full 64-by-64 divide is that
>
>  (a) it is really expensive
>
>  (b) code that needs it is almost always actually wrong
>
> Almost always, the 64-bit divide turns out to be entirely pointless,
> and the code can be written as a (much cheaper) 64-by-32 divide
> instead using the functions in <asm/div.h> instead.
>
> Does RISC-V _really_ need that disgusting full 64-bit divide, or was
> the addition of that simply a "we didn't know better, and didn't
> realize just how expensive and wrong it is"?
>
> I've pulled this, but I really _really_ hope that I will get a second
> pull request that gets rid of this again, and fixes whatever RISC-V
> code that triggered this to just do not do an insane full 64-bit
> divide on a 32-bit architecture.

Thanks.  We'll go figure out how to remove it.
