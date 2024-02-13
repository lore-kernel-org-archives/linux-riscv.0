Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 797ACC48260
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 14:49:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vXH4s+afnG7SyuyrmAc8LPQaqK6lhxgWSRhSKxQLpk=; b=iY1NldbXdZ1+Q/
	ZL82F/61MC6zfjAc1OE4rInsmmnngXWlWIRRWdWmjW4yTcpVxA6lW6imWtLXaLhwCqtOL91Pkrbct
	uqxBvRZCgb+OJ+bEOa2ghI0GNHmeMqEwuy5d+P27yPU/xPlPamKPx52GUhFr+0oIkspvrXprFkoj7
	fbkTrNtZ4XTnPKinkhdsWSBYYZ4/+12aP7piy/mGO0Xfy/VejFJcG4He2zsOtHBksg3d9bpCXiA1q
	vwjDdrh/T97k7FGRVgjPM7basNPH14Cw7zJ9XnaR7KL3ep9kLyZCRSQZswQnyBfbWg6+DO2QbPwPu
	sjv2G2w/p0qlqjKbxmSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZu63-00000009a2D-0WFN;
	Tue, 13 Feb 2024 14:49:19 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZu60-00000009a1t-2PWv
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 14:49:17 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-33adec41b55so577879f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 13 Feb 2024 06:49:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1707835755; x=1708440555; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CXJQUoDdwS+iTPfnGRrbEe+K9eyw1etfn33Hywo3Ilo=;
        b=dji2mNSSFPeUcN9HTj8Pj0kbJsW8Vt/noO96JlwnbfUMM/+vBGBq3Vi2+i8VLlraKN
         ZsQJT+0R9zh3XpYAiCr5kPWiJj9j8I8+c7DAWkGCpREVyE/J8kp0PxWwhEOA8N3XONNY
         lF6V1whzXOB4bECLHxAQ2TeRUrTfiiXbw8rHuzsiLfMXkfHBH7wso86ZTtIi1nUDlhHo
         NMWRZCpDGdaKOhXUwKXjt/sc09z7KTR3aGkUbNFVV6vQY+ASD6j7DfKKEATRrIq1F9ez
         uNMv4B+Oyj1F/82d6m09WtjEbIGASrqUe6R+b1oFFkpSKUWzbItm2wTEmMdFRZ90FHo7
         C9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707835755; x=1708440555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CXJQUoDdwS+iTPfnGRrbEe+K9eyw1etfn33Hywo3Ilo=;
        b=vuYUK8BjiNJ7Kkv3yZI0EofIRuZr2t5lRmWka2blr7IvuxLqNbhaV1L7Ougk4RZ5LE
         X1SE1HqeBr34SQaQQz6bXWWZKheU+GC90kubZ2AhD2oGlIyYVAvmKDQskCrjMog7ntuB
         jSGPCVs0a+OGeMioQ267rUoD+LWThDsykt5seG/nndgmzh70G5Tck/DIjOzmAB2MzBYz
         nvi8NKi6wYZbHl1fawv3P5BsSYzeXNuPCb066jvctHPZG2H6O6/rYCqPcNnhk6bH6yQp
         0GUilRnTSmtBU0yovx50bGclerCJqJ701jeKr6t61NrJXTGOsvkUtIpG9gTkOQz9b6KJ
         DVcg==
X-Forwarded-Encrypted: i=1; AJvYcCVyThpR64BxITaeuoJr8d+2Xt34yKBugJggOKM/+GmAAieVemS7Jy1ubeyy0R8wj4NyLDMa0TSIirbU+uBXFRFqlmiPARJRvdztYeyO8q8D
X-Gm-Message-State: AOJu0YxzQ3IGfKR+LZ1zAGbaTPQdbk3WDaxrabUHB1IO8I2DyNSspGoP
	TNihPm0j5/6bd/TpP+RDOoK3bz3g3O34OwvsOW966iUnp/Wr2R0fpvF6naNGc8Y=
X-Google-Smtp-Source: AGHT+IG9C7SAShtPGr5zsMTscSXEtgpO3XA5ia8oUuLsEgFn9vYz7E19Z3TxoVMOdiJ8hl68kJVMhw==
X-Received: by 2002:a5d:5750:0:b0:33c:e2d7:79d1 with SMTP id q16-20020a5d5750000000b0033ce2d779d1mr380838wrw.69.1707835754661;
        Tue, 13 Feb 2024 06:49:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVH748q7wAhr5L6ObVJfyI8Pj0jD0Qb1kE812vewtgBqH/Np1Ym/ZVQ03YOT45fC1GJU25rvnQodmlyht86tbJ9rYLpL2NVZz6PfZPX/bWXatoHnCeudMvTH3l+gIr05rjZ8Kmh4mvlp/hDHuKr8yrYKrbf6tqjIUN8ODuV82PBcqBgMXFP/fpd/a0UdAw9zpc/Sm5f2m8/IL2P
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id i14-20020a5d558e000000b0033929310ae4sm9749747wrv.73.2024.02.13.06.49.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Feb 2024 06:49:14 -0800 (PST)
Date: Tue, 13 Feb 2024 15:49:13 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Stefan O'Rear <sorear@fastmail.com>, stable@vger.kernel.org
Subject: Re: [PATCH -fixes v2 4/4] riscv: Save/restore envcfg CSR during CPU
 suspend
Message-ID: <20240213-86af3b49821630b5bdd76c0a@orel>
References: <20240213033744.4069020-1-samuel.holland@sifive.com>
 <20240213033744.4069020-5-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240213033744.4069020-5-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240213_064916_637573_14802668 
X-CRM114-Status: GOOD (  18.26  )
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

On Mon, Feb 12, 2024 at 07:37:35PM -0800, Samuel Holland wrote:
> The value of the [ms]envcfg CSR is lost when entering a nonretentive
> idle state, so the CSR must be rewritten when resuming the CPU.
> 
> Cc: <stable@vger.kernel.org> # v6.7+
> Fixes: 43c16d51a19b ("RISC-V: Enable cbo.zero in usermode")
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
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
> index 239509367e42..be03615486ed 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -15,6 +15,8 @@
>  void suspend_save_csrs(struct suspend_context *context)
>  {
>  	context->scratch = csr_read(CSR_SCRATCH);
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_Sx1p12))
> +		context->envcfg = csr_read(CSR_ENVCFG);
>  	context->tvec = csr_read(CSR_TVEC);
>  	context->ie = csr_read(CSR_IE);
>  
> @@ -36,6 +38,8 @@ void suspend_save_csrs(struct suspend_context *context)
>  void suspend_restore_csrs(struct suspend_context *context)
>  {
>  	csr_write(CSR_SCRATCH, context->scratch);
> +	if (riscv_has_extension_likely(RISCV_ISA_EXT_Sx1p12))
> +		csr_write(CSR_ENVCFG, context->envcfg);
>  	csr_write(CSR_TVEC, context->tvec);
>  	csr_write(CSR_IE, context->ie);
>  
> -- 
> 2.43.0
>

We're still exposing Zicboz to userspace in hwprobe when only
RISCV_ISA_EXT_ZICBOZ is present, which will be the case for anything that
either doesn't implement 1.12, but does implement Zicboz, or maybe does
implement 1.12, but hasn't started putting Ss1p12 in its ISA string yet
(e.g. QEMU). We should either stop exposing Zicboz to userspace in those
cases (since it won't work) or rethink how we want to determine whether
or not we have envcfg CSRs.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
