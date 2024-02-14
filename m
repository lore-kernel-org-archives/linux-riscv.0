Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B119C48BC4
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Feb 2024 09:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KvpteX4aNV4BYvva4XGm21AcnM8E68PtCDIVqwTfmbo=; b=fXVjH+zrAnP+kC
	d4bqFFIEQaePoqxQTotUEqWCd9eHbGiKNPEAAbJBLpxvFdeZMtG7+vGYI/XlgQbb1pIIozTr3qMZk
	K4DaNub92k0hbaKoX1rEEKjKmInmlzHm7tsysqsGosSUm29iXivwjpF2ryrh7JNCLQcuooQslKSty
	JD6O/kC8CFmNx+F59j7OO3eNztTSYG7XbziQodkXBl6n/MRBhzl8Z+CzZnWsqihtD1RcIeUSa1Ltz
	mrl8xLtydMJ8SiEOAomQNcGdM70Ck5kCWZqrOFkNlmWeosiBDc4QbGD/enGiUFSJTeeYVftTmx/D+
	uqGVDKKaJuj6jxIBDjwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBZu-0000000CIMp-09Zt;
	Wed, 14 Feb 2024 09:29:18 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raBZr-0000000CIJy-1vcB
	for linux-riscv@lists.infradead.org;
	Wed, 14 Feb 2024 09:29:17 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-411d231ea71so8558705e9.1
        for <linux-riscv@lists.infradead.org>; Wed, 14 Feb 2024 01:29:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707902953; x=1708507753; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0IDjaBFrcqK08V4TvukbGfzSrUeUUgCPpW8iYr8qsNw=;
        b=jml0g+yubS4KAjRaEf/MYTDj1hzOFrGVyyDHGfmbB0inc5zYSaNSUcdpJujAod6qcx
         fy8uXxlYiKGgQR90FR5Z2/lOj6aEAOLOaF65aTUsgn8SGuowOqCReUDF30YYCZ7Xq5Eo
         YEEoKyGrdeCHm3T7KXaTdcQxGNksApBiudLrIiiRqd3BtYbfnbvwO5mh63HrUK3PKfVQ
         jzNCqYsLmdGMp/WYa0XV9cK8jTXN+ap7VJalSX8kuxeIihHwA6XM4ZC44nCjTumXdPoO
         m9f3f6Iho37E9RMe7/c0fdfausleDH9LFKvdZoS7q9aRYaYD/yDZ+YA2qREGMYZL342j
         9rjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707902953; x=1708507753;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0IDjaBFrcqK08V4TvukbGfzSrUeUUgCPpW8iYr8qsNw=;
        b=dk5uM87vye70q7vfXKcLBuKKZ1TTT9aryrMOcQiqeQ2ZgWnFaeQru4M76ZT5lOaeCA
         7Dge4ejfxMWK/dk+FAbpkp3nv+aZpu0mRLUUdUIVP8aSdrRPPO9jwJshNaHpD7bBSRkl
         h9R9+ixyYi1idsZGUinIHxqTXUjm1ehiYtqWhPnJ3/c7QDITxGS0067tzQpxmcF20lrQ
         EuEFxx8ErSlUVqcfYshr8LjtrCvxCFdul9R6LTfLjiBfUsV/9C3iBb+wdm0D7MRJJEhe
         KogVa0kZ/J1JvfUKSYNPhPoopYPVpJz+XdnqCpgcPeEj5fRVopvWUSWO2t8nqklqiCeY
         X+Xg==
X-Forwarded-Encrypted: i=1; AJvYcCUD786m7A2ZnbD3+OIjIXLp2ThIPyAWCeHPCCzidw51XE/Vv7YyMGvdFYvjfouJ1d7Awn6PTgAyxIg6tcLt8JZRyCX/QTtOwGOz19YfmX1Z
X-Gm-Message-State: AOJu0Yx2lc3LrhwPdh1+a3qgL8jg8R3A2GSQ8k01/lNM6atTO2dlsOnw
	10+uwZGakG3Hihi8xg9pVyaUYVvP++P/n5sBvJsclPSUXOB9Yav0Bh2Z5ZAG8TQ=
X-Google-Smtp-Source: AGHT+IF35kx8fDcqPegx+LX9rbLQtQ9LFkKnwSLkrtYsJzFgxf26jqeRQbcx5k1Pg7huYacEIrcXHQ==
X-Received: by 2002:a05:600c:a48:b0:410:cc53:a358 with SMTP id c8-20020a05600c0a4800b00410cc53a358mr1975751wmq.16.1707902953626;
        Wed, 14 Feb 2024 01:29:13 -0800 (PST)
Received: from localhost (cst-prg-65-8.cust.vodafone.cz. [46.135.65.8])
        by smtp.gmail.com with ESMTPSA id u3-20020a05600c00c300b00411ec07674esm1012499wmm.31.2024.02.14.01.29.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Feb 2024 01:29:13 -0800 (PST)
Date: Wed, 14 Feb 2024 10:29:11 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, 
	Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v3 2/2] riscv: Save/restore envcfg CSR during CPU
 suspend
Message-ID: <20240214-cd40380c3969dc9450f05848@orel>
References: <20240214090206.195754-1-samuel.holland@sifive.com>
 <20240214090206.195754-3-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240214090206.195754-3-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_012915_523614_0420D23C 
X-CRM114-Status: GOOD (  21.29  )
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

On Wed, Feb 14, 2024 at 01:01:57AM -0800, Samuel Holland wrote:
> The value of the [ms]envcfg CSR is lost when entering a nonretentive
> idle state, so the CSR must be rewritten when resuming the CPU.
> 
> The [ms]envcfg CSR was added in version 1.12 of the privileged ISA, and
> is used by extensions other than Zicboz. However, the kernel currenly
> has no way to determine the privileged ISA version. Since Zicboz is the
> only in-kernel user of this CSR so far, use it as a proxy for
> determining if the CSR is implemented.
> 
> Cc: <stable@vger.kernel.org> # v6.7+
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v3:
>  - Check for Zicboz instead of the privileged ISA version
> 
> Changes in v2:
>  - Check for privileged ISA v1.12 instead of the specific CSR
>  - Use riscv_has_extension_likely() instead of new ALTERNATIVE()s
> 
>  arch/riscv/include/asm/suspend.h | 1 +
>  arch/riscv/kernel/suspend.c      | 4 ++++
>  2 files changed, 5 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> index 02f87867389a..491296a335d0 100644
> --- a/arch/riscv/include/asm/suspend.h
> +++ b/arch/riscv/include/asm/suspend.h
> @@ -14,6 +14,7 @@ struct suspend_context {
>  	struct pt_regs regs;
>  	/* Saved and restored by high-level functions */
>  	unsigned long scratch;
> +	unsigned long envcfg;
>  	unsigned long tvec;
>  	unsigned long ie;
>  #ifdef CONFIG_MMU
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index 239509367e42..28166006688e 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -15,6 +15,8 @@
>  void suspend_save_csrs(struct suspend_context *context)
>  {
>  	context->scratch = csr_read(CSR_SCRATCH);
> +	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> +		context->envcfg = csr_read(CSR_ENVCFG);
>  	context->tvec = csr_read(CSR_TVEC);
>  	context->ie = csr_read(CSR_IE);
>  
> @@ -36,6 +38,8 @@ void suspend_save_csrs(struct suspend_context *context)
>  void suspend_restore_csrs(struct suspend_context *context)
>  {
>  	csr_write(CSR_SCRATCH, context->scratch);
> +	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_ZICBOZ))
> +		csr_write(CSR_ENVCFG, context->envcfg);
>  	csr_write(CSR_TVEC, context->tvec);
>  	csr_write(CSR_IE, context->ie);
>  
> -- 
> 2.43.0
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
