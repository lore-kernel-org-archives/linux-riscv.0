From: palmer@sifive.com (Palmer Dabbelt)
Date: Wed, 17 Oct 2018 11:44:43 -0700 (PDT)
Subject: next-nofpu build breakage
In-Reply-To: <CAFyWVab2uSy4Br_V5++_iJ+KdbJonFfx2j8wg7FVQq-uGwsA1Q@mail.gmail.com>
Message-ID: <mhng-06031d48-53f1-4ecf-9ea7-d70bb469c129@palmer-si-x1c4>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Tue, 16 Oct 2018 19:01:10 PDT (-0700), Jim Wilson wrote:
> Building from Palmer's for-next branch gives an error for an invalid
> -march option.  This bug came in via the next-nofpu branch.  In
> arch/riscv/Makefile I had to change
> riscv-march-$(CONFIG_FPU)               := fd
> to
> riscv-march-$(CONFIG_FPU)               := $(riscv-march-y)fd
> to get past this problem.

Thanks.  Someone else had pointed this out as well, it turns out I'd merged the 
wrong version of a patch set.  This should be fix on both next-nofpu and 
for-next now.
