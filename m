From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 10 Sep 2018 18:35:45 -0700
Subject: [PATCH v3 11/12] RISC-V: Use Linux logical cpu number instead of
 hartid
In-Reply-To: <20180910112909.GJ12979@infradead.org>
References: <1536221135-182613-1-git-send-email-atish.patra@wdc.com>
 <1536221135-182613-12-git-send-email-atish.patra@wdc.com>
 <20180910112909.GJ12979@infradead.org>
Message-ID: <517a8d3f-afb4-faa9-2acf-458d1a23bd21@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/10/18 4:29 AM, Christoph Hellwig wrote:
> On Thu, Sep 06, 2018 at 01:05:34AM -0700, Atish Patra wrote:
>> Setup the cpu_logical_map during boot. Moreover, every SBI call
>> and PLIC context are based on the physical hartid. Use the logical
>> cpu to hartid mapping to pass correct hartid to respective functions.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
>> Reviewed-by  : Anup Patel <anup@brainfault.org>
> 
> Same whitespace issue here.
> 
> Otherwise looks fine:
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>
> 

Fixed. Thanks for the review.

Regards,
Atish
