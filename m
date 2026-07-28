Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6F14C531F9
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Jul 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MUPeB6e45k8VEhVhtDuNywydYkz6zMOezddVMMhO9+I=; b=K0sRjToUubdFWR
	d/AEbfybLW0x05JK0bkJFb4CpbznSojnzOa/CnHRu/uqUy4VLQKGAEUM1LIkNp342BwlPRdqXFAfK
	FsTK9m1NU976R1FHQBrASwx+IMrJ/Tb/IG+OwdM3Cyc3BV30eJ0dgH2rBfW1OOmcUHHxP8Q7NjW4n
	p1a2Juj+ElvQCe7208cyUQPB5LBdjxqvtrzCeaGLOCXWDWLpZdaD4KDylv9w9spj03hKSDjUatdl/
	B2Dz0X6PDEpzBNjr2UFS0YOq8AzFAAaSlt7vsVQ4mhbFWJ89uaR85L5jGAo6HSEa9nfNzV7dGgChB
	cyQxKoqO1d/bTlgp/ZpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofop-000000053Qx-1ySt;
	Tue, 28 Jul 2026 11:17:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wofoo-000000053Qo-27mB
	for linux-riscv@lists.infradead.org;
	Tue, 28 Jul 2026 11:17:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4643640B9F;
	Tue, 28 Jul 2026 11:17:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A90631F000E9;
	Tue, 28 Jul 2026 11:17:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785237474;
	bh=VJB5QQyhbCwyyIdOpL3gynrSH4a3kKTKTWVbCcBni5A=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=iPbDKVLvhJ3Bbmuqo41XqwB3PUgWJ5xG7VipP4LoMGUPUb43CDwZq+AdvhLUSUYhM
	 YyYazR3MI6PqbARXesyT4GrfCXFQsZB4XAH+AgmuXFZ2BOBGsV5/pKyeqBV7pF1p45
	 jzyPk32keo7QYSeuKIrruK7Rwm6Zy3MlGB+2eaFc6zG/lIw6MxlEeA/xzCqD4T+KL3
	 PEuLrs6R3u3WCfYMUnskrSFVURQ1VufcjNHbxA/UB2mp9TKBeyrds8imt2QzryfSii
	 LXZ2vOtYIbLIYYr/TAJvxLcbNdGTCCTM13a3AK3DnxhJTwJhzVWyBJFCSJ5TA09cNH
	 LycsdkAlFu0/Q==
Date: Tue, 28 Jul 2026 11:17:51 +0000
From: Yixun Lan <dlan@kernel.org>
To: Peixin Xie <peixin.xie@linux.spacemit.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Oza Pawandeep <quic_poza@quicinc.com>,
	Will Deacon <will@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev,
	stable@vger.kernel.org
Subject: Re: [PATCH] riscv: acpi: Handle LPI architectural context loss flags
Message-ID: <20260728111751-GKC76518@kernel.org>
References: <20260728-riscv-acpi-lpi-timer-v1-1-c722bce01e48@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260728-riscv-acpi-lpi-timer-v1-1-c722bce01e48@linux.spacemit.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Peixin,

On 17:36 Tue 28 Jul     , Peixin Xie wrote:
> Commit 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for
> broadcast timer") replaced the generic nonzero check for LPI
> architectural context loss flags with arch_get_idle_state_flags().
> RISC-V does not implement the helper, so it falls back to the stub
> that returns 0. Consequently, CPUIDLE_FLAG_TIMER_STOP is not set when
> an LPI state loses the hart timer context, preventing cpuidle from
> using a broadcast timer for that state.
> 
> Implement the RISC-V helper and map the hart timer context loss flag
> to CPUIDLE_FLAG_TIMER_STOP.
> 
> Fixes: 4785aa802853 ("cpuidle, ACPI: Evaluate LPI arch_flags for broadcast timer")
> Cc: stable@vger.kernel.org
> Signed-off-by: Peixin Xie <peixin.xie@linux.spacemit.com>
Looks good to me, with one minor comment

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/include/asm/acpi.h | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index 26ab37c171bc..3a3da834c340 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -12,6 +12,8 @@
>  #ifndef _ASM_ACPI_H
>  #define _ASM_ACPI_H
>  
> +#include <linux/cpuidle.h>
> +
>  /* Basic configuration for ACPI */
>  #ifdef CONFIG_ACPI
>  
> @@ -67,6 +69,23 @@ int acpi_get_riscv_isa(struct acpi_table_header *table,
>  
>  void acpi_get_cbo_block_size(struct acpi_table_header *table, u32 *cbom_size,
>  			     u32 *cboz_size, u32 *cbop_size);
> +
> +/*
> + * RISC-V Functional Fixed Hardware Specification Version v1.0.1
> + * Table 4: LPI Arch. Context Lost Flags

As I checked https://docs.riscv.org/reference/acpi-ffh/v1.0.1/ffh_use_cases.html
It's table 3, and I'd suggest to put more precisely as:

"Chapter 2.1.1.2. Arch. Context Lost Flags, Table 3"

> + */
> +#define RISCV_LPI_HART_TIMER_CTXT_LOST		BIT(0)
> +
> +static inline unsigned int arch_get_idle_state_flags(u32 arch_flags)
> +{
> +	if (arch_flags & RISCV_LPI_HART_TIMER_CTXT_LOST)
> +		return CPUIDLE_FLAG_TIMER_STOP;
> +
> +	return 0;
> +}
> +
> +#define arch_get_idle_state_flags arch_get_idle_state_flags
> +
>  #else
>  static inline void acpi_init_rintc_map(void) { }
>  static inline struct acpi_madt_rintc *acpi_cpu_get_madt_rintc(int cpu)
> 
> ---
> base-commit: 1d6f0a217c662693d2307ee06851cb4bfcbf9529
> change-id: 20260727-riscv-acpi-lpi-timer-6f1739a6c831
> 
> Best regards,
> --  
> Peixin Xie <peixin.xie@linux.spacemit.com>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
