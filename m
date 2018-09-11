From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 10 Sep 2018 18:35:03 -0700
Subject: [PATCH v3 02/12] RISC-V: Filter ISA and MMU values in cpuinfo
In-Reply-To: <20180910112418.GB12979@infradead.org>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-3-git-send-email-atish.patra@wdc.com>
 <20180910112418.GB12979@infradead.org>
Message-ID: <4633e2a9-868c-40bb-a6b3-366842c93f0a@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/10/18 4:24 AM, Christoph Hellwig wrote:
> On Thu, Sep 06, 2018 at 01:05:25AM -0700, Atish Patra wrote:
>> +#elif defined(CONFIG_64BIT)
>> +	if ((strcmp(mmu_type, "riscv,sv39") != 0)
>> +	    && (strcmp(mmu_type, "riscv,sv48") != 0))
>> +		return;
> 
> This should be:
> 
> 	if (strcmp(mmu_type, "riscv,sv39") != 0 &&
> 	    strcmp(mmu_type, "riscv,sv48") != 0)
> 		return;
> 
> Otherwise looks good:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Fixed.

Regards,
Atish
