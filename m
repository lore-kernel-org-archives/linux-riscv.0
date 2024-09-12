Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B40EEE271
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 23:01:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pfGjw5dcw0RT83D13MLJSn1Ee7xHlkRp0f2X/PyTln4=; b=JslOTh7jI6bzg9
	AV+1hJbyQhgEbCf19fHoyoOio93AyMLfdZlKjExznZ7er/6Mb2+zwJV0dsZE1aRlgRJ3BocV1OnJX
	DIlIjWjA7g4MZVjhig+ePprHWxg19iPpCFq1xWiGtX6BYF6Th0m2k38YZ1a6kSX1FIeJ0+NM38Hy/
	B0+m29jZ6ykWHXoAC6uKY9Rkkz4atNW2u4iuSXrduXbhTDWLCP4rvG8HBtgSSH9WilYVQr4UUhib/
	qddAhl194igZCvHcle+WtPuQBs6N6Amt0C8BLRL7PGD6I+r8nlgKd39YOWcnE6u+0ErlvBFsbZD0M
	Wlr6zPZHVqoDguWm+OQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sosoo-0000000EPg8-3oqx;
	Thu, 12 Sep 2024 23:01:42 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sosol-0000000EPeo-0PsS
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 23:01:40 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-7191fb54147so1074533b3a.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Sep 2024 16:01:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726182098; x=1726786898; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gXcV8jbFts4t9XD/hggH3giDaMs3zJsjMShL2Y10OZY=;
        b=sXbZAaCMF0PUgLkyY2TmvegoBsBpaIJ654xVTj9wBC6DTKwbd4qjTzcqjBL3hFiIXH
         xC/KfB2WszsbwapXyEe1EIsimCVfHjZdOaPqCO217OJLfcFzaye4Q0XXkTb2Cf8q4vzL
         TvHpp/2S+dcLEarg8Akz1UiV8wmRvaalydHsvVFCruuVc3vNdyhKkDblomHzS5xXJF6l
         urzeZEhaPxYY31Anq+ByltjAqiabcMQ8CfTHry4Z+G+gQF3Fyws2zHYZDVMPvnU+YuJS
         YT2UkynYp6aCTJbObD++yxMhJE+4Ayo5wpJgVR9F7EvuiwQb53uMsxnWJv5hWOlFG8BJ
         +84w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726182098; x=1726786898;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gXcV8jbFts4t9XD/hggH3giDaMs3zJsjMShL2Y10OZY=;
        b=X2CHhEktTnKxxHxGuzNaVUEiUPJpXTGyQOFAhtVJU+koaJIpOzn1gkeqwzkQPRGAyO
         j3/1CHUQXYMgjjShwKMcFvhEX2U5N9WKGaRXo8sOtvC7HmI+kghmAh+tzlk7TYHXZz2b
         Q3jI+zIcHKIAmimqzo+A9E8Kf0f0LWQe5auepmTS1SnmiHXZ7Xf9kBipaXyHZoR0CYEp
         yasZi0EpAoU6wnO320ivTkRNH1ZfpC8JJu1qfQiFG6VTLjOMPh7zKHgJMqCkbnGdgX9y
         dvGZ5Np8YEpHclpL3jsnqJd7ix4YhfREKsP7f6tlTVgOufegxw4i/NsrtHV9DUS/YlyW
         JQlg==
X-Gm-Message-State: AOJu0YxnSdAskvWB5FFeY3trSgWVNBc4DY0L5VdV0Xs3ZFn0g4dZA2mV
	5g34nkWICPguec0y16k/8S4VrpBweK5Lad6v5MKRM6fXk9aYPfR1z27uHWOaq6s=
X-Google-Smtp-Source: AGHT+IGA0ZtiOG8+WbEJ7rjuu0f8eCrPbZ5QeaMeNPlHl9dVMItuTHlOjdo8kxxxxAZ9gUAw9fT6bA==
X-Received: by 2002:a05:6a00:1906:b0:70d:2621:5808 with SMTP id d2e1a72fcca58-7192607fcb9mr6715512b3a.9.1726182097519;
        Thu, 12 Sep 2024 16:01:37 -0700 (PDT)
Received: from ghost ([50.145.13.30])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7db1fddd86asm2221706a12.68.2024.09.12.16.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Sep 2024 16:01:36 -0700 (PDT)
Date: Thu, 12 Sep 2024 16:01:34 -0700
From: Charlie Jenkins <charlie@rivosinc.com>
To: Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH v4 1/3] riscv: Enable cbo.zero only when all harts
 support Zicboz
Message-ID: <ZuNyztqpH09ns0ws@ghost>
References: <20240814081126.956287-1-samuel.holland@sifive.com>
 <20240814081126.956287-2-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240814081126.956287-2-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_160139_170495_E3227839 
X-CRM114-Status: GOOD (  37.61  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, Andy Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>, =?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <cleger@rivosinc.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>, Deepak Gupta <debug@rivosinc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Aug 14, 2024 at 01:10:54AM -0700, Samuel Holland wrote:
> Currently, we enable cbo.zero for usermode on each hart that supports
> the Zicboz extension. This means that the [ms]envcfg CSR value may
> differ between harts. Other features, such as pointer masking and CFI,
> require setting [ms]envcfg bits on a per-thread basis. The combination
> of these two adds quite some complexity and overhead to context
> switching, as we would need to maintain two separate masks for the
> per-hart and per-thread bits. Andrew Jones, who originally added Zicboz
> support, writes[1][2]:
> 
>   I've approached Zicboz the same way I would approach all
>   extensions, which is to be per-hart. I'm not currently aware of
>   a platform that is / will be composed of harts where some have
>   Zicboz and others don't, but there's nothing stopping a platform
>   like that from being built.
> 
>   So, how about we add code that confirms Zicboz is on all harts.
>   If any hart does not have it, then we complain loudly and disable
>   it on all the other harts. If it was just a hardware description
>   bug, then it'll get fixed. If there's actually a platform which
>   doesn't have Zicboz on all harts, then, when the issue is reported,
>   we can decide to not support it, support it with defconfig, or
>   support it under a Kconfig guard which must be enabled by the user.
> 
> Let's follow his suggested solution and require the extension to be
> available on all harts, so the envcfg CSR value does not need to change
> when a thread migrates between harts. Since we are doing this for all
> extensions with fields in envcfg, the CSR itself only needs to be saved/
> restored when it is present on all harts.
> 
> This should not be a regression as no known hardware has asymmetric
> Zicboz support, but if anyone reports seeing the warning, we will
> re-evaluate our solution.
> 
> Link: https://lore.kernel.org/linux-riscv/20240322-168f191eeb8479b2ea169a5e@orel/ [1]
> Link: https://lore.kernel.org/linux-riscv/20240323-28943722feb57a41fb0ff488@orel/ [2]
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Deepak Gupta <debug@rivosinc.com>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---

I realized I was looking at v4 but responding to v3, whoops. I will put
my tags here as well.

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Tested-by: Charlie Jenkins <charlie@rivosinc.com>

> 
> (no changes since v3)
> 
> Changes in v3:
>  - Rebase on riscv/for-next
> 
>  arch/riscv/kernel/cpufeature.c | 7 ++++++-
>  arch/riscv/kernel/suspend.c    | 4 ++--
>  2 files changed, 8 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index b427188b28fc..0139d4ea8426 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,6 +28,8 @@
>  
>  #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
>  
> +static bool any_cpu_has_zicboz;
> +
>  unsigned long elf_hwcap __read_mostly;
>  
>  /* Host ISA bitmap */
> @@ -98,6 +100,7 @@ static int riscv_ext_zicboz_validate(const struct riscv_isa_ext_data *data,
>  		pr_err("Zicboz disabled as cboz-block-size present, but is not a power-of-2\n");
>  		return -EINVAL;
>  	}
> +	any_cpu_has_zicboz = true;
>  	return 0;
>  }
>  
> @@ -918,8 +921,10 @@ unsigned long riscv_get_elf_hwcap(void)
>  
>  void riscv_user_isa_enable(void)
>  {
> -	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICBOZ))
>  		csr_set(CSR_ENVCFG, ENVCFG_CBZE);
> +	else if (any_cpu_has_zicboz)
> +		pr_warn_once("Zicboz disabled as it is unavailable on some harts\n");
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index c8cec0cc5833..9a8a0dc035b2 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -14,7 +14,7 @@
>  
>  void suspend_save_csrs(struct suspend_context *context)
>  {
> -	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
>  		context->envcfg = csr_read(CSR_ENVCFG);
>  	context->tvec = csr_read(CSR_TVEC);
>  	context->ie = csr_read(CSR_IE);
> @@ -37,7 +37,7 @@ void suspend_save_csrs(struct suspend_context *context)
>  void suspend_restore_csrs(struct suspend_context *context)
>  {
>  	csr_write(CSR_SCRATCH, 0);
> -	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_XLINUXENVCFG))
>  		csr_write(CSR_ENVCFG, context->envcfg);
>  	csr_write(CSR_TVEC, context->tvec);
>  	csr_write(CSR_IE, context->ie);
> -- 
> 2.45.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
