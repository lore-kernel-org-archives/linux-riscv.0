From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 15 Oct 2018 09:01:03 -0700
Subject: [PATCH] RISC-V: Add futex support.
In-Reply-To: <CAFyWVaZaXd8GZYSrMqZh+zQ+3CDghpumjo2ETezXcR93OXXSZg@mail.gmail.com>
References: <20181012200350.5258-1-jimw@sifive.com>
 <20181015083439.GA11826@infradead.org>
 <CAFyWVaZaXd8GZYSrMqZh+zQ+3CDghpumjo2ETezXcR93OXXSZg@mail.gmail.com>
Message-ID: <20181015160103.GA19517@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Oct 15, 2018 at 08:57:24AM -0700, Jim Wilson wrote:
> __riscv_atomic is a predefined macro from the compiler.  It is defined
> when the target has atomic instructions, e.g. -march=rv64ia.  It is
> not defined when the target has no atomic instructions, e.g.
> -march=rv64i.  The idea here was that we only used atomic instructions
> if the target has them.  I didn't think to check for a more proper
> kernel solution.  I see that there is a CONFIG_RISCV_ISA_A so it looks
> like I should be testing that instead.

Actually CONFIG_RISCV_ISA_A is dead code as well.  We assume A
extensions in the kernel, so there should be no conditionals.
