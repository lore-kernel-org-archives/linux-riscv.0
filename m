From: hch@infradead.org (Christoph Hellwig)
Date: Wed, 8 Aug 2018 23:31:24 -0700
Subject: [PATCH v5 5/5] Auto-detect whether a FPU exists
In-Reply-To: <1533796003-680-6-git-send-email-alankao@andestech.com>
References: <1533796003-680-1-git-send-email-alankao@andestech.com>
 <1533796003-680-6-git-send-email-alankao@andestech.com>
Message-ID: <20180809063124.GA26062@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

>  extern unsigned long elf_hwcap;
> +extern bool has_fpu;
>  #endif

Doesn't this conflict with the !CONFIG_CPU stub in switch_to.h?

It seems like we should only have this definition in one place to start
with.

Otherwise this looks fine to me:

Reviewed-by: Christoph Hellwig <hch@lst.de>
