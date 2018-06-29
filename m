From: hch@infradead.org (Christoph Hellwig)
Date: Fri, 29 Jun 2018 00:26:36 -0700
Subject: [PATCH v2] riscv: Add support to no-FPU systems
In-Reply-To: <20180629072229.GE12956@infradead.org>
References: <1530073346-5341-1-git-send-email-alankao@andestech.com>
 <20180629072229.GE12956@infradead.org>
Message-ID: <20180629072636.GA4416@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Btw, I wonder if we just just move __restore_d_state/__save_d_state
to assembly.  They just call assembly routines to start with, so
they might be a natural fit for the new fpu.S file.
