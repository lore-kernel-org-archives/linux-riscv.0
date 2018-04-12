From: bruno@clisp.org (Bruno Haible)
Date: Thu, 12 Apr 2018 09:45:52 +0200
Subject: kernel hangs after running program that uses a custom SIGSEGV
 handler
In-Reply-To: <CADJ6UvOs+2OVmRhJThhNufg-jPT2UwaP=HNuvV_V=tuJ=fFi_w@mail.gmail.com>
References: <3428122.ik0p8hGU2m@omega>
 <CADJ6UvOs+2OVmRhJThhNufg-jPT2UwaP=HNuvV_V=tuJ=fFi_w@mail.gmail.com>
Message-ID: <38107857.CMqZCF1x8R@omega>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

Stef O'Rear wrote:
> The bug is caused by mishandling of PROT_NONE (failing to distinguish
> between PROT_NONE and non-present pages)

Indeed, this sounds like a possible bug cause: clisp is one of the few
programs that uses mprotect not only with PROT_READ and PROT_READ_WRITE
but also occasionally with PROT_NONE.

Bruno
