From: jimw@sifive.com (Jim Wilson)
Date: Mon, 11 Jun 2018 20:27:52 -0700
Subject: [PATCH] RISC-V: Fix PTRACE_SETREGSET bug.
In-Reply-To: <mhng-7a581ed4-d7ab-4188-92e6-3a8002f3c8d1@palmer-si-x1c4>
References: <20180611214822.8539-1-jimw@sifive.com>
 <mhng-7a581ed4-d7ab-4188-92e6-3a8002f3c8d1@palmer-si-x1c4>
Message-ID: <CAFyWVaawEbKmccfRsFiooJeGxX6P4xDXqvWiCyiJnfTAK2g0pA@mail.gmail.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Jun 11, 2018 at 5:46 PM, Palmer Dabbelt <palmer@sifive.com> wrote:
> Whoops, that's embarassing :).  I poked around and didn't see this anywhere
> else, so I'm not sure where we managed to obtain this particular pathology.

Comment say it was copied from tile which I think was just recently
removed.  But looking at older copy, tile has "struct pt_regs regs"
whereas riscv has "struct pt_regs *regs" and so tile needed the & and
riscv does not, but only one of the two ampersands was removed in the
riscv port.  My patch removes the other one.

Jim
