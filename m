Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00D47C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  3 May 2022 23:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=beYWQLRQIfh7BYS5oqpvZG8Fr857YqPUJgdWmMNdiBA=; b=VgkM25gJAJm+Q3
	TFRTtsP0/eLRtjdz4DE8BXj/y4S2wsUxmcQVX9AhUp/py1fppw3lG4e7QRa8leC/RHwYuDB0gNMhA
	XjoQShwJrBaGqFcjqem28clzrQiTH7P7ndgZX+3381HsH+UgNraqboEYFiH6zWS8fXy3PqX8CUzGK
	7PlHQYQdAd+cYDHJSTl4e/moXItnar6pKU0bhILThC7dePyuGgSQCNrJD4AtZRyxnSuH0p8Eys0Iv
	KKs42eaYvURC9wS5NTleGWH8ihrvrx7ZhZPy9lUvSeMzFX9+OyV1YGhMFZeCZOqMvtfremX/8eM3q
	2w70WMX0gle4uCeXhGHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nm1kx-00823j-83; Tue, 03 May 2022 23:16:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nm1ku-00823I-7X
 for linux-riscv@lists.infradead.org; Tue, 03 May 2022 23:16:33 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.localnet)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nm1kp-0004W4-AH; Wed, 04 May 2022 01:16:27 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Greentime Hu <greentime.hu@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-kernel@vger.kernel.org,
 Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] riscv: Fix irq_work when SMP is disabled
Date: Wed, 04 May 2022 01:16:26 +0200
Message-ID: <11970543.O9o76ZdvQC@phil>
In-Reply-To: <20220430030025.58405-1-samuel@sholland.org>
References: <20220430030025.58405-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220503_161632_317242_3C6CE1F2 
X-CRM114-Status: GOOD (  18.20  )
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

Am Samstag, 30. April 2022, 05:00:23 CEST schrieb Samuel Holland:
> irq_work is triggered via an IPI, but the IPI infrastructure is not
> included in uniprocessor kernels. As a result, irq_work never runs.
> Fall back to the tick-based irq_work implementation on uniprocessor
> configurations.
> 
> Fixes: 298447928bb1 ("riscv: Support irq_work via self IPIs")
> Signed-off-by: Samuel Holland <samuel@sholland.org>

That uniprocessor part seems a tiny bit neglected - as I saw previously
with alternatives not getting applied as well, so

Reviewed-by: Heiko Stuebner <heiko@sntech.de>

Though somehow I find the arm32 style a tad nicer by defining
an is_smp() function [0] that holds the necessary checks.

But I guess that is a style preference.


Heiko


[0] https://elixir.bootlin.com/linux/latest/source/arch/arm/include/asm/smp_plat.h#L18
> ---
> This was found while bringing up cpufreq on D1. Switching cpufreq
> governors was hanging on irq_work_sync().
> 
>  arch/riscv/include/asm/irq_work.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/irq_work.h b/arch/riscv/include/asm/irq_work.h
> index d6c277992f76..b53891964ae0 100644
> --- a/arch/riscv/include/asm/irq_work.h
> +++ b/arch/riscv/include/asm/irq_work.h
> @@ -4,7 +4,7 @@
>  
>  static inline bool arch_irq_work_has_interrupt(void)
>  {
> -	return true;
> +	return IS_ENABLED(CONFIG_SMP);
>  }
>  extern void arch_irq_work_raise(void);
>  #endif /* _ASM_RISCV_IRQ_WORK_H */
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
