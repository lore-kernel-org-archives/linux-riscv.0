From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 29 Jun 2018 00:12:00 -0700
Subject: [PATCH v2 3/4] RISC-V: Add definiion of extract symbol's index
 and type for 32-bit
In-Reply-To: <4c4def99db5e0392238947dc878c5018cc7aca3e.1529915117.git.zong@andestech.com>
References: <cover.1529915117.git.zong@andestech.com>
 <4c4def99db5e0392238947dc878c5018cc7aca3e.1529915117.git.zong@andestech.com>
Message-ID: <20180629071200.GC12956@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Mon, Jun 25, 2018 at 04:49:39PM +0800, Zong Li wrote:
> Use generic marco to get the index and type of symbol.

Why do we even need this in a uapi header?  Shouldn't ELF_RISCV_R_SYM
and ELF_RISCV_R_TYPE move to module.c?  In that case we could just
use CONFIG_64BIT.
