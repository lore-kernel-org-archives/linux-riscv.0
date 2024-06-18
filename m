Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C6FFC27C4F
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Jun 2024 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1IDwuYYPDkuW6OgZuZW5AInf0NmhZF5xbWu2iHvtzkA=; b=hEkTg5iTsorCPm
	iNL8VVYUYrQaNUfU/i0eLmXMrpNhjs09sS2glwwj8wH06A9XKsmMHkWOUH9t2xTO3V0HZ8NJCmkbB
	fMBkxUTfzeYkMvl+EOJ1E6aEtcH/OSiqH2BOYtPWGeuhuD9spPCMGsCYK4iCAxippayOQcipAb50E
	CN7FiaPxchQiwv89gGF2x3HXdIh3Ueo2X8oyqLALcHWfcHbf6UPRWaO64JwIPqACxf5ntib9dCCHs
	VUQN8wiHWOXThc5UYdEpzd26+udF+CnE8UPFv6dZda6nw4RpkmZ9JlqImejFQVgpUN7AEy8rfcpl3
	43T3NEzQu4wabHyCje2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXbt-0000000Emn5-1zkN;
	Tue, 18 Jun 2024 12:06:49 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJXbq-0000000Eml7-0rJp
	for linux-riscv@lists.infradead.org;
	Tue, 18 Jun 2024 12:06:47 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AEF0DA7;
	Tue, 18 Jun 2024 05:07:08 -0700 (PDT)
Received: from J2N7QTR9R3 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 551573F64C;
	Tue, 18 Jun 2024 05:06:42 -0700 (PDT)
Date: Tue, 18 Jun 2024 13:06:39 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: alex@ghiti.fr, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Fix local irq restore when flags indicates irq
 disabled
Message-ID: <ZnF4T51VPhJ4C5su@J2N7QTR9R3>
References: <20240618103803.40578-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240618103803.40578-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_050646_372118_8EC1B644 
X-CRM114-Status: GOOD (  19.43  )
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

On Tue, Jun 18, 2024 at 06:38:03PM +0800, Xu Lu wrote:
> When arch_local_irq_restore() is called with flags indicating irqs
> disabled, we need to clear SR_IE bit in CSR_STATUS, whereas current
> implementation based on csr_set() function only sets SR_IE bit of
> CSR_STATUS when SR_IE bit of flags is high and does nothing when
> SR_IE bit of flags is low.

That shouldn't matter; arch_local_irq_restore() should *never* be called
from a context with IRQs enabled, and so arch_local_irq_restore() never
needs to disable IRQs. Either it enables IRQs or it leaves IRQs
disabled, but it never needs to explicitly disable IRQs.

See CONFIG_DEBUG_IRQFLAGS and the commit that introduced it:

  997acaf6b4b59c6a ("lockdep: report broken irq restoration")

I don't believe this patch is necessary.

Mark.

> 
> This commit supplies csr clear operation when calling irq restore
> function with flags indicating irq disabled.
> 
> Fixes: 6d60b6ee0c97 ("RISC-V: Device, timer, IRQs, and the SBI")
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  arch/riscv/include/asm/irqflags.h | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
> index 6fd8cbfcfcc7..f3aad7bfadb7 100644
> --- a/arch/riscv/include/asm/irqflags.h
> +++ b/arch/riscv/include/asm/irqflags.h
> @@ -48,7 +48,10 @@ static inline int arch_irqs_disabled(void)
>  /* set interrupt enabled status */
>  static inline void arch_local_irq_restore(unsigned long flags)
>  {
> -	csr_set(CSR_STATUS, flags & SR_IE);
> +	if (flags & SR_IE)
> +		csr_set(CSR_STATUS, SR_IE);
> +	else
> +		csr_clear(CSR_STATUS, SR_IE);
>  }
>  
>  #endif /* _ASM_RISCV_IRQFLAGS_H */
> -- 
> 2.20.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
