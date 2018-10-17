From: jimw@sifive.com (Jim Wilson)
Date: Tue, 16 Oct 2018 19:01:10 -0700
Subject: next-nofpu build breakage
Message-ID: <CAFyWVab2uSy4Br_V5++_iJ+KdbJonFfx2j8wg7FVQq-uGwsA1Q@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Building from Palmer's for-next branch gives an error for an invalid
-march option.  This bug came in via the next-nofpu branch.  In
arch/riscv/Makefile I had to change
riscv-march-$(CONFIG_FPU)               := fd
to
riscv-march-$(CONFIG_FPU)               := $(riscv-march-y)fd
to get past this problem.

Jim
