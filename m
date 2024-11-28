Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91474D690ED
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 09:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Hv63w+WtYlnSSEWzgkCzMnvpAbFOMn2JI4EhLzqUoE=; b=vO8EvNvz2rmjmn
	z3wxHGW+6iqKHJVvjz9rUT3OSLwa83VFdTT/UuHIeHDAYeeEFWpa17CXZDVZw2qFlNPKKvV1ltkBs
	NK62J09L4kxFDyjxyB5YU/uQV+Q4lJjXx4eeJfBPe2rkyBb3yUQJ03e36mhaNasvggkicw/xAK3dg
	5FJt6Pwq1fbceU5ypOR3KNocnTaBRhiMAr5yz8gXS0GpKpZzI9LDLyqzPdfRWYsT5WcfOwqNUkkd6
	sG3hAt06UCEDkJrPv24wyxGUYQEKmXRLcd9CXrD86Dgl3vBzRqtzpz3Nn1SFJ5e2ZZOeABLkmdiVS
	7icCtDL2Cb4m4lYq+5NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaNc-0000000F60b-2PbQ;
	Thu, 28 Nov 2024 09:00:08 +0000
Received: from mail-lf1-x132.google.com ([2a00:1450:4864:20::132])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaNZ-0000000F5zU-38nC
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 09:00:06 +0000
Received: by mail-lf1-x132.google.com with SMTP id 2adb3069b0e04-53dd9e853ccso468157e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 01:00:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732784404; x=1733389204; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oRwUYsVAjpoLFct6AU+sl41M7ai7g8VdSrVmZPLTLdY=;
        b=IQVF2DokTwr1tKXJ6O8twgB5dwd9pEyX/tmqeWOORJM4RYmntYYzy+Yq0nxS6W8vFi
         wN6l4USwY8H6gKT5SoLL657NXyoGsZQo8UMgU0b2pVCs8t38AP1WOMcGW8QloZnXTWNF
         va3ZN7pNa/QU0Qbur1/n8NPcFLDmKL1Xt2k5Ftltvn/GDr7NYRdtRod60CKxCwUJAyJW
         DKvuttU4nbRhWR0NTZbO/+J+Kl/gbWOHrlUPl+lpnzKjMZTAGzRpoRDmCLDM1yAB27C0
         IE8KS4S386mfrTFb0UpGgJHuhL3YyEGfoe6/U+Ne/w5Rp0+5hEEVhRUI2mPTVpzJ8PQ7
         9Twg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732784404; x=1733389204;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oRwUYsVAjpoLFct6AU+sl41M7ai7g8VdSrVmZPLTLdY=;
        b=jKmZdHQqtftd9f8iOFQpA22Tpde2RoIZ8BRUq2rGpbnuARXSzr8ud5gSSCiqfZhk4A
         Z+3KynbaCbSRa9AQqtgaYPKEoASoxEgap34m8dkAU5n4nkQRBwPJWEiNwZC3ZhcFKkfj
         H2R+9EaJnsh1evEs9U3nB5qA+RY2myvS8vmJXIZZBIfpjkInr0Nq8MBd8a3TD2vpR/Hg
         YTMdD/7mbXUN7tIIeFGRsw9tCCrajWk56f2huqpnJX7eD0dBRRgZnmCIU4yZvCAOr1NQ
         T2SVqSSwX+ybGeWkKeDUtHgyMRbvv5yQSJX+okImonAaW39FhhH06W5PEpji3hjRiIr3
         VHBA==
X-Forwarded-Encrypted: i=1; AJvYcCUr+urssW+xusefrCfc5v82pUk57dzyZCBIZwmthzvNqu++4/c8itdlrFLHX9IQaV0VnyiFakFjOcua+Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+s421TEp1Pj0S4UiofYiMbB9FTs2u3V04V58gai6Tp7mDmbNl
	igBatFaGGAgdatWQI9/1cVscgJGc/IZaYupm8U44qhvA55X1GK1dIbS4Zc8HWX0=
X-Gm-Gg: ASbGncvTXYOuNLh+gKZ6nWMFQut1+ALLs9fE3puI+OhujWLeeIj3jnIEKeKZY5kLjhQ
	5COPO2PXZ6APYfF0QC/BAh43FLblVqtx7p6nYpnOZ8DqG+XC5/JFsmJ8j8P1sQlZZv4S+fLSp+p
	TyJl8jqZIhYZDvPIrdHt/reDaKaaAa7226mlDusQyibwthgrl711xmmMtIcuekKT6KxLTQOQckP
	+F3SWNov2sK7bKt7DBSLremD33TWXKx7XhjbRbKqaAY5XzDFQobOmJcaBZLV2a4wfKiqTy+KSgA
	hUXmy6s62k4NwX/23iHP1DzzDl77adjcBKo=
X-Google-Smtp-Source: AGHT+IFvUjDbauPTmEibS/pMaTmIPzKett7QupGp+AywDNDr/16hkqdHs/Gybk1MALYq8E3o2q+udg==
X-Received: by 2002:a05:6512:3b25:b0:53d:d12c:2f02 with SMTP id 2adb3069b0e04-53df00d1b38mr3726286e87.18.1732784403699;
        Thu, 28 Nov 2024 01:00:03 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0dbf95fsm15201885e9.15.2024.11.28.01.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 01:00:03 -0800 (PST)
Date: Thu, 28 Nov 2024 10:00:02 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 4/4] KVM: riscv: selftests: Add Svvptc/Zabha/Ziccrse exts
 to get-reg-list test
Message-ID: <20241128-846f2b5fdfda9e1aa9e373ee@orel>
References: <cover.1732762121.git.zhouquan@iscas.ac.cn>
 <21d3a5314a9cd6ac5b3aa445060ae2679a44c792.1732762121.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <21d3a5314a9cd6ac5b3aa445060ae2679a44c792.1732762121.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_010005_781452_8F112CC6 
X-CRM114-Status: GOOD (  14.04  )
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

On Thu, Nov 28, 2024 at 11:22:14AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> The KVM RISC-V allows Svvptc/Zabha/Ziccrse extensions for Guest/VM
> so add them to get-reg-list test.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index 54ab484d0000..a697db1ff411 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -48,8 +48,10 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSNPM:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVINVAL:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVVPTC:

Alphabetic order, please.

>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVNAPOT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_SVPBMT:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZABHA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZACAS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZAWRS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBA:
> @@ -69,6 +71,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZFHMIN:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOM:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICBOZ:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICCRSE:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICNTR:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICOND:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZICSR:
> @@ -423,8 +426,10 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(SSNPM),
>  		KVM_ISA_EXT_ARR(SSTC),
>  		KVM_ISA_EXT_ARR(SVINVAL),
> +		KVM_ISA_EXT_ARR(SVVPTC),

Same comment as above.

>  		KVM_ISA_EXT_ARR(SVNAPOT),
>  		KVM_ISA_EXT_ARR(SVPBMT),
> +		KVM_ISA_EXT_ARR(ZABHA),
>  		KVM_ISA_EXT_ARR(ZACAS),
>  		KVM_ISA_EXT_ARR(ZAWRS),
>  		KVM_ISA_EXT_ARR(ZBA),
> @@ -444,6 +449,7 @@ static const char *isa_ext_single_id_to_str(__u64 reg_off)
>  		KVM_ISA_EXT_ARR(ZFHMIN),
>  		KVM_ISA_EXT_ARR(ZICBOM),
>  		KVM_ISA_EXT_ARR(ZICBOZ),
> +		KVM_ISA_EXT_ARR(ZICCRSE),
>  		KVM_ISA_EXT_ARR(ZICNTR),
>  		KVM_ISA_EXT_ARR(ZICOND),
>  		KVM_ISA_EXT_ARR(ZICSR),
> @@ -956,8 +962,10 @@ KVM_ISA_EXT_SIMPLE_CONFIG(sscofpmf, SSCOFPMF);
>  KVM_ISA_EXT_SIMPLE_CONFIG(ssnpm, SSNPM);
>  KVM_ISA_EXT_SIMPLE_CONFIG(sstc, SSTC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svinval, SVINVAL);
> +KVM_ISA_EXT_SIMPLE_CONFIG(svvptc, SVVPTC);

Same comment as above.

>  KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zabha, ZABHA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zacas, ZACAS);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zawrs, ZAWRS);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
> @@ -977,6 +985,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(zfh, ZFH);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zfhmin, ZFHMIN);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
> +KVM_ISA_EXT_SIMPLE_CONFIG(ziccrse, ZICCRSE);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicntr, ZICNTR);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicond, ZICOND);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zicsr, ZICSR);
> @@ -1021,8 +1030,10 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_ssnpm,
>  	&config_sstc,
>  	&config_svinval,
> +	&config_svvptc,

Same comment as above.

>  	&config_svnapot,
>  	&config_svpbmt,
> +	&config_zabha,
>  	&config_zacas,
>  	&config_zawrs,
>  	&config_zba,
> @@ -1042,6 +1053,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_zfhmin,
>  	&config_zicbom,
>  	&config_zicboz,
> +	&config_ziccrse,
>  	&config_zicntr,
>  	&config_zicond,
>  	&config_zicsr,
> -- 
> 2.34.1
> 

Otherwise,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
