Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D68DCC54791
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Mar 2024 08:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=C0ut5FFh1OTEWvoIuO/xiQyHORhailcbCDfUTYzjJa8=; b=qbAdh4cUPL1UfW
	bLbeMjm6O9ngP73aKLo6SB/B1Gr+B50A38UO6y/FUy5L+XP1nmkNSqSsXrMRSxCsZKFKF0VhsCEST
	qDaIxNIiCYP6RtC3K3N81Fc2IQRz+KoDCxyEMp5xaJrl/qD73BSkAVjXNkY8FLyNnF5/wlp+ATpyv
	AG1yEeMbp8sgMH5FUcyE72E322tsl9Sj4+/wRIl4jh0xfnjAtF/1Ut48ADd+P80o0D2OactO09uPP
	h2JBbgR2NwirMABiBPWLg1x5/g9IEBGZ1EHIYVBhS5/7cyqohvV/ZGO9mAcLbFvhH3vgm2c3gF74G
	fcJ1cj9tevXndcQzs9OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKDo-00000009MSn-283E;
	Wed, 13 Mar 2024 08:44:24 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkKDl-00000009MRm-1upO
	for linux-riscv@lists.infradead.org;
	Wed, 13 Mar 2024 08:44:23 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-33e93514a6aso2146016f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Mar 2024 01:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1710319459; x=1710924259; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TVnlgrSA1iDIweojaV3vTulnCmsG1cIXseUx2d2oWFw=;
        b=o0aL6LnjtBWVzIKWIspzNnU3osJnhfm6WHwtyfx4zKZPg3vOWRbRCwNpSfgtYjjjR4
         Z8GbbX4aIxEpOE/cyEUVz2+mgncogKlmvxFErit/bzHBeQFMBT8VDnqcO7HZsQUyF0iu
         XXH/t4Wln7vQ3LiZeeV1MWVLAY7t0KKxn/bJEnHHguxgfyQncTlA2UhHDPBxNwCHIKtW
         nh2JljKLzI7Saac6MlRh1+UZOoJJDzNhZe+l25TDWmWNviVFO6dHu/8aedG1QhDL0T7v
         /Q59j/mc3ujNfGKSGwLBKp8F8ouDxQRqRl3dIpOZJSgcd81KM0BItUyoVZBmSRu2uh76
         ed0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710319459; x=1710924259;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVnlgrSA1iDIweojaV3vTulnCmsG1cIXseUx2d2oWFw=;
        b=lMuAHmgL4rRIuO5/n4wioNg0kRsOMl1OI3h0rIdOuKvUXDUH7ERvnYxi427dqwZ0yd
         dD4hKuabMr3DH9eVzPM3/Aq9Au4EDZK1Rbl9piDi7mMy+TZSNfl6pB+SNkxwCDKF63tQ
         R1EAiDEaa1/Fk1pdtS+daD6idJtzlRYNg92H45PbOYruPuS1g1VOxFsH46CgVtC2WLHf
         BgkELN52B/OcB42LC6m7jJWZgDlQOkpDM4d26P+kDfl8kh/yCzZ8t8pWXwiclRf7rMVJ
         pDqAO6dunG7lqCb3gt0yU+DJKAbiMDWrgG/1780ivos/XAVMbaL5bSsHC4VO005DLPRf
         DjtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUyPevhcjixIsUA+vbWsrAlnnFcpBjFxn+CUYFkg3dNR2/sI5zvjX6yT5h0o3RUnMU2JKFl33iK5LQRZ0tUECH1B08el93Nam5tgITpjBSD
X-Gm-Message-State: AOJu0YwkNhHjzzJ3RCjYtX+6omy8j4ir4D0JfJHitadJKdQLuZKekh+w
	nMFLuY1gwFEPwNN0cM7qVj6i4egN/XcU05ECjenPBjBjdr/v+kwigZm2f7G+TH8=
X-Google-Smtp-Source: AGHT+IF6PXsG6ZxE+60qwQnTwNT8NyXVLUagjQgwFnk02BeNPnrpuv1g9j6Sj2PCDpibbr6u0xH1bA==
X-Received: by 2002:adf:ab12:0:b0:33e:b6a9:a7f7 with SMTP id q18-20020adfab12000000b0033eb6a9a7f7mr792595wrc.43.1710319459333;
        Wed, 13 Mar 2024 01:44:19 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id bq7-20020a5d5a07000000b0033e95794186sm7787748wrb.83.2024.03.13.01.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Mar 2024 01:44:18 -0700 (PDT)
Date: Wed, 13 Mar 2024 09:44:18 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor.dooley@microchip.com>, 
	Ley Foon Tan <leyfoon.tan@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Pavel Machek <pavel@ucw.cz>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Sia Jee Heng <jeeheng.sia@starfivetech.com>, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH] riscv: Do not save the scratch CSR during suspend
Message-ID: <20240313-a1837dd45cb20198ef5ceae6@orel>
References: <20240312195641.1830521-1-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240312195641.1830521-1-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_014421_533019_C7F7B956 
X-CRM114-Status: GOOD (  18.39  )
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

On Tue, Mar 12, 2024 at 12:56:38PM -0700, Samuel Holland wrote:
> While the processor is executing kernel code, the value of the scratch
> CSR is always zero, so there is no need to save the value. Continue to
> write the CSR during the resume flow, so we do not rely on firmware to
> initialize it.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
>  arch/riscv/include/asm/suspend.h | 1 -
>  arch/riscv/kernel/suspend.c      | 3 +--
>  2 files changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/suspend.h b/arch/riscv/include/asm/suspend.h
> index 491296a335d0..6569eefacf38 100644
> --- a/arch/riscv/include/asm/suspend.h
> +++ b/arch/riscv/include/asm/suspend.h
> @@ -13,7 +13,6 @@ struct suspend_context {
>  	/* Saved and restored by low-level functions */
>  	struct pt_regs regs;
>  	/* Saved and restored by high-level functions */
> -	unsigned long scratch;
>  	unsigned long envcfg;
>  	unsigned long tvec;
>  	unsigned long ie;
> diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
> index 299795341e8a..3d306d8a253d 100644
> --- a/arch/riscv/kernel/suspend.c
> +++ b/arch/riscv/kernel/suspend.c
> @@ -14,7 +14,6 @@
>  
>  void suspend_save_csrs(struct suspend_context *context)
>  {
> -	context->scratch = csr_read(CSR_SCRATCH);
>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
>  		context->envcfg = csr_read(CSR_ENVCFG);
>  	context->tvec = csr_read(CSR_TVEC);
> @@ -37,7 +36,7 @@ void suspend_save_csrs(struct suspend_context *context)
>  
>  void suspend_restore_csrs(struct suspend_context *context)
>  {
> -	csr_write(CSR_SCRATCH, context->scratch);
> +	csr_write(CSR_SCRATCH, 0);
>  	if (riscv_cpu_has_extension_unlikely(smp_processor_id(), RISCV_ISA_EXT_XLINUXENVCFG))
>  		csr_write(CSR_ENVCFG, context->envcfg);
>  	csr_write(CSR_TVEC, context->tvec);
> -- 
> 2.43.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
