From: atish.patra@wdc.com (Atish Patra)
Date: Mon, 17 Sep 2018 19:23:02 -0700
Subject: [RFC 2/3] RISC-V:Support per-hart timebase-frequency
In-Reply-To: <20180917142308.GB15588@infradead.org>
References: <1536962096-233842-1-git-send-email-atish.patra@wdc.com>
 <1536962096-233842-3-git-send-email-atish.patra@wdc.com>
 <20180917142308.GB15588@infradead.org>
Message-ID: <4d7c1d3d-df0b-df7c-aabd-8ce9fd9dc623@wdc.com>
To: linux-riscv@lists.infradead.org
List-Id: linux-riscv.lists.infradead.org

On 9/17/18 7:23 AM, Christoph Hellwig wrote:
> On Fri, Sep 14, 2018 at 02:54:55PM -0700, Atish Patra wrote:
>> Follow the updated DT specs and read the timebase-frequency
>> from the boot cpu. Keep the old DT reading as well for backward
>> compatibility. This patch is rework of old patch from Palmer.
>>
>> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> 
> This setup looks a bit odd because it keeps blindly overwriting
> riscv_timebase for every cpu found.  Shouldn't we at least check that
> they all match for now as the rest of the port assumes that?
> 

It will be only updated for boot cpu as it is done after this check.

if (cpuid != smp_processor_id())
  		return 0;

Regards,
Atish
