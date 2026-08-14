Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 347DEC5CFDB
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Aug 2026 12:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mndkR0AQNt6a8xhMiq1LmvNNmcYbdPugQhF1NIW8ZKI=; b=YBVc8G3hVDcMR3
	HreAihPOEbU9mcLS0y8NHB/A7gPVLihG0EjsDgKOxD6LzI1vYSrsWBNOKgyRYXF6BxUVkKylEPNeG
	v7AbGEmGzgnFY1kS/+twdnSn8ld/MCaT/N/Np6YSrmUVtNhgzRu0bbd1sTcS6rcVuCCBVKfFbdcAw
	R9gJCRvyy27nmKM7axW7VbWthzlPTPkqeQY/TULB0KTy+oFb2HSvDfr4vBD1Qn7d8GyGnquLncGO7
	u651BA9hNlLkfXBFWC+zPvPtc/5mo4wycHTOIFYNcy1lBbzVjutx6668PCOOo1cenHT8Aj460gDC3
	uDk+jy7OOZBUQahqjh/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqei-00000002cyZ-2zbq;
	Fri, 14 Aug 2026 12:05:00 +0000
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuqef-00000002cy5-21ty
	for linux-riscv@lists.infradead.org;
	Fri, 14 Aug 2026 12:04:59 +0000
Received: by mail-lj1-x235.google.com with SMTP id 38308e7fff4ca-39c74c469e8so5860631fa.0
        for <linux-riscv@lists.infradead.org>; Fri, 14 Aug 2026 05:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786709095; x=1787313895; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=K95ykzEShOLEivVx29SWjU23KHeS4yVUrSdELipcQNA=;
        b=Pojv9+TySW5Vthr34WJLATEllwwTvStZKWmEcKG1ycnN6x9/PA/orJ2GVikyvpfGC6
         ZSw09j4UJaWizYCChk3BwFYa8fmyCLGVohagx55bYXUTP2oNaLEuJHN906MEwUZR5xg1
         043USZ/OfT4uE5+0Wzxf2Zq0rKlXNq1dQYjp2Lzb4FgWXVTylAgHrAH44zeW+EfuyC5k
         VJGYAp8iec8I1iVZS7m2f/qi8pPezkB2A+C1mayma2JY48QUNwv3AQqQ+lDJDjkvXZH9
         t7xDL23e4csL1YEC/685yJTwqhXuWb3P8ahcdS5hUAQZncyjkHfGdD3ZlCaM5KUDgh+k
         xplw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786709095; x=1787313895;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K95ykzEShOLEivVx29SWjU23KHeS4yVUrSdELipcQNA=;
        b=bJIYk8DCen80VaK2Kluf5GXxU6y1knlRBzC1t6Y9ovPhWD+f9oCjQeUvmrH7GhCOQs
         ijUsRHr98aeyQ7hGSokWUG+ZhSTzdyjZvPGhdQJ0T7eKENybFzXFQNTikscCVw4Phs9Z
         dIlGw+hkbAJOm6In3H1og0kP1gtKQVLv6wCiHKr43JWXjK9J7Orf1Sl/Gx8exWf/zCAh
         oeN3cExw6d5MXHmRMPXilfDyXWeagqcn3zztgee8ZRVsacwvvTHtXal/CAKn3N28rqkw
         bDxVOtZG9sS3+hNmDMYSUO9jSBKink5ryeY2bDw5J56ajRxrxYzHs6vS1+Zadwag4iyH
         GbsA==
X-Forwarded-Encrypted: i=1; AHgh+RpaDuLsm+H6IH3bQiEm7W4R51pPtkCkDd9xvDKVNKwbISWPaETHJLWVNtY3wto0Xl+ys6w41iie8zKYow==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/gzPou/hVKh+uwyj+KHCN5pqsAcXRHQ/Q4kemJ5MrA/L2bx76
	BWIsvfa5WHGq98anOdKBo2xNFGy+iPx/YfXWxshG5svVNPwZ1mcPVT3/
X-Gm-Gg: AR+sD111uTxcv0+q7dGUtUKKEHSbxFzLwChfvNqWG1e9f5C6GPP9VU1RnkJYAjTVz1g
	ykz/fnd2tIQIcVYBjlDCAJtB0WfiT151i7QJnxg/dZ7g3rdupFvVZhME0F3E92KcpUOt46Q5DOv
	29erttqqYt/GTg44/bclbAL3Pz12zJeux8JSSlSdtU/RGYMSt3S58F1EhQlcQJNC3A5cGpe59Wr
	JDoTdDuw2NzM/Asn0Fb87Wcdo6yuc0eCnHxYUpqh6tmG/zExE3fSkrxqH9dU4HKN51kjF0K0ywM
	s/AUgz/9/x1At1Tf3vObyl/dXXhHcrTBp2l83h4HxfwA1bfq6Ea8LN+9DsxrW9d2LnxqaLEOH6y
	J+Q0IMqmD26ofwOvMKgyuhgVZi38uZRXwtz3BLw5zwaOu8av0eTuVdW+kOBnJSMg8c7YJV9ORcD
	TSfpKUutsw/sNAydg+o9QyUWFxHeJk/JvzIouxM39tru2FHwTTDDo2e+CBbKOnH9epHYeUxdDiW
	VMs
X-Received: by 2002:a05:651c:a346:b0:39d:b5b9:f0f4 with SMTP id 38308e7fff4ca-3a1324053d9mr5759571fa.10.1786709094349;
        Fri, 14 Aug 2026 05:04:54 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a130872f9csm5614151fa.7.2026.08.14.05.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 05:04:53 -0700 (PDT)
Date: Fri, 14 Aug 2026 14:04:53 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Xiaofeng Yuan <xiaofengmian@163.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Nam Cao <namcao@linutronix.de>, 
	Klara Modin <klara@kasm.eu>, prabhakar.csengg@gmail.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] riscv: patch: skip fixmap mapping when kernel
 text is already writable
Message-ID: <an8ECsGLdzDgRafU@soda.int.kasm.eu>
References: <20260814082742.148403-1-xiaofengmian@163.com>
 <20260814082742.148403-3-xiaofengmian@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260814082742.148403-3-xiaofengmian@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_050457_541579_1F410348 
X-CRM114-Status: GOOD (  20.64  )
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

On 2026-08-14 08:27:42 +0000, Xiaofeng Yuan wrote:
> patch_map() always creates a temporary writable mapping via fixmap for
> kernel text addresses, even when CONFIG_STRICT_KERNEL_RWX is disabled
> and the kernel text is already mapped with _PAGE_WRITE.
> 
> This is unnecessary overhead at best, and on minimal configurations
> it can cause page faults.
> 
> Skip the fixmap path for kernel text when CONFIG_STRICT_KERNEL_RWX
> is not enabled, since the text pages are already writable in that case.
> The module text path is already gated on CONFIG_STRICT_MODULE_RWX and
> is kept unchanged.
> 
> Reported-by: Klara Modin <klara@kasm.eu>
> Closes: https://lore.kernel.org/all/ant_8TaBbov_GS4i@soda.int.kasm.eu/
> Reported-by: Lad Prabhakar <prabhakar.csengg@gmail.com>
> Closes: https://lore.kernel.org/all/CA+V-a8tQK8rih9SGGTyqrEBGpNkx4H0eX2YccCRrgkVAPr+EBg@mail.gmail.com/
> ---
> v5: fix the fixmap gating for kernel text. The v4 early return on
>     CONFIG_STRICT_MODULE_RWX wrongly skipped the fixmap for kernel text
>     too, which panics on configs with CONFIG_MODULES=n where
>     CONFIG_STRICT_MODULE_RWX is unavailable but CONFIG_STRICT_KERNEL_RWX
>     is still enabled and kernel text is read-only.
> v3: early return when !CONFIG_STRICT_MODULE_RWX (per Nam Cao's suggestion)
> v2: add commit description
> 
> Signed-off-by: Xiaofeng Yuan <xiaofengmian@163.com>

This version works fine for me.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>

> ---
>  arch/riscv/kernel/patch.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 16b243376f..2239c28981 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -45,6 +45,8 @@ static __always_inline void *patch_map(void *addr, const unsigned int fixmap)
>  	phys_addr_t phys;
>  
>  	if (core_kernel_text(uintaddr) || is_kernel_exittext(uintaddr)) {
> +		if (!IS_ENABLED(CONFIG_STRICT_KERNEL_RWX))
> +			return addr;
>  		phys = __pa_symbol(addr);
>  	} else if (IS_ENABLED(CONFIG_STRICT_MODULE_RWX)) {
>  		struct page *page = vmalloc_to_page(addr);
> -- 
> 2.43.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
