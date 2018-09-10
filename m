From: hch@infradead.org (Christoph Hellwig)
Date: Mon, 10 Sep 2018 04:24:18 -0700
Subject: [PATCH v3 02/12] RISC-V: Filter ISA and MMU values in cpuinfo
In-Reply-To: <1536221135-182613-3-git-send-email-atish.patra@wdc.com>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-3-git-send-email-atish.patra@wdc.com>
Message-ID: <20180910112418.GB12979@infradead.org>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On Thu, Sep 06, 2018 at 01:05:25AM -0700, Atish Patra wrote:
> +#elif defined(CONFIG_64BIT)
> +	if ((strcmp(mmu_type, "riscv,sv39") != 0)
> +	    && (strcmp(mmu_type, "riscv,sv48") != 0))
> +		return;

This should be:

	if (strcmp(mmu_type, "riscv,sv39") != 0 &&
	    strcmp(mmu_type, "riscv,sv48") != 0)
		return;

Otherwise looks good:

Reviewed-by: Christoph Hellwig <hch@lst.de>
