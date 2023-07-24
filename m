Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA58BC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 13:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GWNJ1ZuWCtGuQJnP+TKpaXkvcurSiS1u3g/rcXDmclI=; b=LbkOAPDJhfRIBg
	tGAfsR+Sce1h0volQKafDSr77N0bc8OlJbjZPeGipZEiGyO+iZ/lj+p41bFZ/B1kT2ypNGkDwJQH2
	dfT7YCzoWX+JNX88aofJqGFgURryzEfML7hCnROecY9uqwingzkL4CJ/N5lPmbp2KEl296k80dbDa
	g1MUtnCYY25jQpd6bMb7NkWtJ3GMCV12Oc63ht+hId37Itnk0uELy7gcNKGA62j8VHgxnVJXaKMRo
	1sH62efgfaR6Y501q6TgE5jz17kFcPENbvVtECyzULE/x5VjRNbhW4sbzjqFp6bE45AKLQcPGa9D3
	xPcG9I4f/HjmKk+T/4sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNvq2-004Uy9-25;
	Mon, 24 Jul 2023 13:43:02 +0000
Received: from imap4.hz.codethink.co.uk ([188.40.203.114])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNvpz-004Uwi-30
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 13:43:01 +0000
Received: from [167.98.27.226] (helo=[10.35.4.179])
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qNvpr-002awt-2z; Mon, 24 Jul 2023 14:42:51 +0100
Message-ID: <e75d0e92-1e6e-43c2-1935-00f22df5579d@codethink.co.uk>
Date: Mon, 24 Jul 2023 14:42:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH] riscv: Fix local irq restore when flags indicates irq
 disabled
Content-Language: en-GB
To: "luxu.kernel" <luxujoy@gmail.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 luxu.kernel@bytedance.com
References: <20230724132736.124106-1-luxu.kernel@bytedance.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230724132736.124106-1-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_064259_971282_4C8AFCE4 
X-CRM114-Status: GOOD (  18.52  )
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

On 24/07/2023 14:27, luxu.kernel wrote:
> When arch_local_irq_restore() is called with flags indicating irqs
> disabled, we need to clear SR_IE bit in CSR_STATUS, whereas current
> implementation based on csr_set() function only sets SR_IE bit of
> CSR_STATUS when SR_IE bit of flags is high and does nothing when
> SR_IE bit of flags is low.
> 
> This commit supplies csr clear operation when calling irq restore
> function with flags indicating irq disabled.
> 
> Signed-off-by: luxu.kernel <luxu.kernel@bytedance.com>

real-names are required for signoff

> ---
>   arch/riscv/include/asm/irqflags.h | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/irqflags.h b/arch/riscv/include/asm/irqflags.h
> index 08d4d6a5b7e9..7c31fc3c3559 100644
> --- a/arch/riscv/include/asm/irqflags.h
> +++ b/arch/riscv/include/asm/irqflags.h
> @@ -49,7 +49,10 @@ static inline int arch_irqs_disabled(void)
>   /* set interrupt enabled status */
>   static inline void arch_local_irq_restore(unsigned long flags)
>   {
> -	csr_set(CSR_STATUS, flags & SR_IE);
> +	if (flags & SR_IE)
> +		csr_set(CSR_STATUS, SR_IE);
> +	else
> +		csr_clear(CSR_STATUS, SR_IE);
>   }
>   
>   #endif /* _ASM_RISCV_IRQFLAGS_H */

I think this is correct, I wonder how long this has been going on
without anyone noticing?

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
