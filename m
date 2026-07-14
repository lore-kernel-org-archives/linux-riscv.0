Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 586DBC43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 12:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gofb4GJPW5hQgQuX6dEjlN2VJBsgK3z7EQ9+dkE8xds=; b=dRY/E7QSk+17Iz
	zNmybG46bSv1uBTvioheswC6sG8wGsCgCMQm0GIGJ91pZuRB9PLddjao483OCB9qG+ESZ6Zso6Tzr
	7e3T2LC9Y1FXqK7dTATi7J5I+ZRSeREA6rACQihQdNEEDd7gJs7rLtqTxblzB70+OmeoE4MOKcGF7
	5P04RRfrig8CTUBiyG6iRLyjAfD6zeuc7cceQ9BJYEGO417nB7jAw4VwGHEX/mnuZl9MOjAuUBaIR
	KBytUYIlfHfx5kvRs3TVJfpzU0h9MP7vPbRYgW8nBXJ0+Kd1Sigi+C6ndqrQ2OjUQOV7cloURpMhO
	0NOuVE0epma4hipKRlGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcF1-0000000BvaO-1SC5;
	Tue, 14 Jul 2026 12:28:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcEx-0000000BvYn-3wEl
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 12:28:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23AE11476;
	Tue, 14 Jul 2026 05:27:53 -0700 (PDT)
Received: from [10.2.212.23] (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 224FE3F7B4;
	Tue, 14 Jul 2026 05:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784032077; bh=zzEYaVVhSuGCuAAvI0y0XEVUpmDQVjrHVxuT2tgpuUk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DsN8zTDveK+mVBpv6T2NXbyfwS9iLZFlYhMP6iJHbw5XNQF6IRrdDhP2N2W2jVV0T
	 oyemgLXS4Eeupb/X2xIpG0ZH/ptgErYr6CN/H5wqksizy12oqfoMVHzDWP3N6RiPwI
	 WV1hcCRMd24mHGvGYJELvV4RKgwKnzUuWWMh9e+g=
Message-ID: <3591a185-d0b5-4cb0-a0d5-ae9608a4e244@arm.com>
Date: Tue, 14 Jul 2026 13:27:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] iommu/riscv: Use 32-bit MMIO accesses for 64-bit
 registers
To: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>,
 Tomasz Jeznach <tomasz.jeznach@linux.dev>, Joerg Roedel <joro@8bytes.org>,
 Will Deacon <will@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 Guo Ren <guoren@kernel.org>, David Laight <david.laight.linux@gmail.com>,
 Vivian Wang <wangruikang@iscas.ac.cn>, Zong Li <zong.li@sifive.com>,
 cuiyunhui@bytedance.com, yuanzhu@bytedance.com, iommu@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com>
 <20260713122903.9458-1-zhangzhanpeng.jasper@bytedance.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260713122903.9458-1-zhangzhanpeng.jasper@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052800_074198_9A9DFF5F 
X-CRM114-Status: GOOD (  26.02  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 13/07/2026 1:29 pm, Zhanpeng Zhang wrote:
> The RISC-V IOMMU specification [1] permits 64-bit registers to be accessed
> using two 32-bit transactions, high half first, and leaves the single-copy
> atomicity of 8-byte IOMMU register accesses unspecified.
> 
> Use the generic hi_lo_readq_relaxed() and hi_lo_writeq_relaxed() helpers
> for ordinary 64-bit IOMMU registers. For DDTP, poll BUSY in the low half,
> then read the high half and compose the register value from the polled low
> half. HPM counter reads require a rollover-aware sequence and remain
> outside these accessors.
> 
> This follows the 32-bit access direction proposed by Guo Ren [2] and uses
> the generic non-atomic MMIO helpers suggested by David Laight.
> 
> [1] https://docs.riscv.org/reference/iommu/
> [2] https://lore.kernel.org/r/20250903144217.837448-1-guoren@kernel.org
> 
> Suggested-by: Guo Ren <guoren@kernel.org>
> Suggested-by: David Laight <david.laight.linux@gmail.com>
> Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
> ---
> Changes in v3:
> - Use the DDTP access sequence from [1]: retain the low half returned by
>    BUSY polling, read only the high half, and compose the DDTP value from
>    those two 32-bit reads.
> 
> Changes in v2:
> - Rework the patch based on Guo Ren's earlier proposal [1].
> - Drop the build-time option and use 32-bit accesses unconditionally.
> - Drop the global lock and use the generic high-low MMIO helpers, as
>    suggested by David Laight.
> - Poll DDTP.BUSY through its low half.
> 
> Link to v1: [2]
> Specification discussion: [3]
> 
> [1]: https://lore.kernel.org/r/20250903144217.837448-1-guoren@kernel.org
> [2]: https://lore.kernel.org/r/20260615064855.90316-1-zhangzhanpeng.jasper@bytedance.com
> [3]: https://github.com/riscv-non-isa/riscv-iommu/issues/765
> 
>   drivers/iommu/riscv/iommu.c | 9 ++++++---
>   drivers/iommu/riscv/iommu.h | 9 +++------
>   2 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
> index cec3ddd7ab1..d647b71ebec 100644
> --- a/drivers/iommu/riscv/iommu.c
> +++ b/drivers/iommu/riscv/iommu.c
> @@ -670,9 +670,12 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu)
>   
>   #define riscv_iommu_read_ddtp(iommu) ({ \
>   	u64 ddtp; \
> -	riscv_iommu_readq_timeout((iommu), RISCV_IOMMU_REG_DDTP, ddtp, \
> -				  !(ddtp & RISCV_IOMMU_DDTP_BUSY), 10, \
> +	u32 ddtp_lo, ddtp_hi; \
> +	riscv_iommu_readl_timeout((iommu), RISCV_IOMMU_REG_DDTP, ddtp_lo, \
> +				  !(ddtp_lo & RISCV_IOMMU_DDTP_BUSY), 10, \
>   				  RISCV_IOMMU_DDTP_TIMEOUT); \
> +	ddtp_hi = riscv_iommu_readl((iommu), RISCV_IOMMU_REG_DDTP + 4); \

It looks like whenever you read DDTP you're only really looking at the 
BUSY/MODE fields anyway, so does this actually need to read the upper 
bits of PPN at all? (The spec says they don't even need to be written on 
RV32 either)

> +	ddtp = ((u64)ddtp_hi << 32) | ddtp_lo; \
>   	ddtp; })
>   
>   static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
> @@ -1501,7 +1504,7 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
>   	 * regular boot flow and disable translation when we boot into a kexec
>   	 * kernel and the previous kernel left them enabled.
>   	 */
> -	ddtp = riscv_iommu_readq(iommu, RISCV_IOMMU_REG_DDTP);
> +	ddtp = riscv_iommu_read_ddtp(iommu);
>   	if (ddtp & RISCV_IOMMU_DDTP_BUSY)
>   		return -EBUSY;
>   
> diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
> index 46df79dd549..1b03790fbe1 100644
> --- a/drivers/iommu/riscv/iommu.h
> +++ b/drivers/iommu/riscv/iommu.h
> @@ -11,6 +11,7 @@
>   #ifndef _RISCV_IOMMU_H_
>   #define _RISCV_IOMMU_H_
>   
> +#include <linux/io-64-nonatomic-hi-lo.h>
>   #include <linux/iommu.h>
>   #include <linux/types.h>
>   #include <linux/iopoll.h>
> @@ -70,17 +71,13 @@ void riscv_iommu_disable(struct riscv_iommu_device *iommu);
>   	readl_relaxed((iommu)->reg + (addr))
>   
>   #define riscv_iommu_readq(iommu, addr) \
> -	readq_relaxed((iommu)->reg + (addr))
> +	hi_lo_readq_relaxed((iommu)->reg + (addr))

This seems unnecessary (similarly for writeq() below) - once you've 
included the header, then it automatically provides readq{_relaxed}() 
for RV32 via the non-atomic implementation, and wherever atomicity 
doesn't matter, then as written there seems to be no reason for RV64 to 
stop using the regular arch readq().

Not that it makes any difference to me either way, but I don't see any 
real issue with the spec - if software *may* make a 64-bit access to any 
64-bit register unconditionally, then that can only imply that hardware 
*must* be able to accommodate RV64 software choosing to do so, and 
therefore must support *both* 32b and 64b accesses in general, except 
perhaps on RV32-only systems if software could never make 64b accesses 
in the first place. If 64b single-copy atomicity is not 
required/specified then it should be valid to achieve that by just 
sticking a downsizer in the upstream interconnect to split 64b accesses 
into 32bx2 incremental bursts.

If do actually you need this as an erratum workaround to support 
specific hardware which has misinterpreted the spec then I think you 
should be clear about that. Otherwise, adding speculative "workarounds" 
which (slightly) penalise hardware that got it right, while inviting 
future hardware to get it wrong, doesn't seem like the right way to go 
at all...

Thanks,
Robin.

>   
>   #define riscv_iommu_writel(iommu, addr, val) \
>   	writel_relaxed((val), (iommu)->reg + (addr))
>   
>   #define riscv_iommu_writeq(iommu, addr, val) \
> -	writeq_relaxed((val), (iommu)->reg + (addr))
> -
> -#define riscv_iommu_readq_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
> -	readx_poll_timeout(readq_relaxed, (iommu)->reg + (addr), val, cond, \
> -			   delay_us, timeout_us)
> +	hi_lo_writeq_relaxed((val), (iommu)->reg + (addr))
>   
>   #define riscv_iommu_readl_timeout(iommu, addr, val, cond, delay_us, timeout_us) \
>   	readx_poll_timeout(readl_relaxed, (iommu)->reg + (addr), val, cond, \


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
