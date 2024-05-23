Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DBD6C25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 09:06:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MTJ00bVvWLth5dywcnrtV10ciJJ+kJuW4UWutke9wZ8=; b=FvSvxOhH4d+jMI
	gsDTT65OiB7Bnjr8HQ2Ig/QDqQV3olynJE8ElpqNpjpjRFJyHMdEbId5C67r+P5l+zJGGWfGXxKT8
	/y8OjcKmsVPRpKkoF6a15WtFkDkwN/cjXxa3lKFa9a03T+685v9ar3Dk8/jqh3nbw/trkf4lvY/hQ
	Si8nvBX62zZr/c3UaozZr62bBbmAbURPAQISzrBjQtRJQfPO/7pjVyi1UTk6JR+s9oXi7g6wYDByh
	joeKksVmHyYkRTUyby1yOFsFEGx+3NOUJ0/vbqzAjFemg/sMylKbcXD3hpvNwKAXsOIRtz61JPGcm
	2dWYUaKLXFbly+yt/MVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA4Op-00000005bb3-3Xja;
	Thu, 23 May 2024 09:06:11 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sA4Om-00000005ba4-0INU
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 09:06:09 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-a5a5c930cf6so1110353466b.0
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 02:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1716455165; x=1717059965; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4l5zU20cndw6hYAB3MUXx+3Gbe6LL2k71CJyaDseujw=;
        b=XEUXtYMJtoFnl2OTUZCMRoEQ+KLna8Dw4ZK6Air7+zKWcisrLNcxC9KvUeJT03C2gw
         LDQVuAf68/aKQPUOQdmEkJpYjEoYmFOaiL2qWTCPX4AhzsaN40dBc97uMulYPcTAylpH
         OzfEeT7t70+BBPv5N3M6w2ZQCINtvMsb1kRHLBVX8fEOSFCtTwZdATOttLM2bOv3X+75
         SXSpQY75sOcMBmZ3ZRtxqPowHzGP4rVHCx8Va0OG8q5VuPtk41kIlO+aXa/5OAcplmc4
         1sZZ0VLtPNEAM5GWtADhyZck2yChbmHojI9YM+ssRTdDl1Uefa859upxveLhP88+T1Wl
         sO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716455165; x=1717059965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4l5zU20cndw6hYAB3MUXx+3Gbe6LL2k71CJyaDseujw=;
        b=dZjKtc998BRoafWo9J+vcgMJ61AmmOGUK+EtgGYPc7nZzR4+cj0yhFNwAyyMLQAzdZ
         unBDqDCWidSXefv4ca04oq2t6hVzE6sntHHXtf/Bev9osBYf0bGM3uzuQy0FZHyNQcaA
         0IZ0aE7b31SY3IBt+n+GwVnAlixYZUtblkDZIGvLA7mJ6jZ8SkfdWK78Ed20oiPOsODp
         9pxScQwV2558VxtWgKDsatm87KApsWtlR7YsDk291tYQ+6NGFyjix1ieOjlZvu7FoYoD
         1cimtGSmD3DBn5e9VQzkSssWhpAlvCttw+stLrnik/Erq1KHZ9k288ifP27hNOW8zsGg
         d7tA==
X-Forwarded-Encrypted: i=1; AJvYcCXlXBGn4TyaWWqppjBkvSlLdNJai8eXbTAsQsJihnuVVqzPwrBjw0bOVvmPlI1WRRs1MGrN6redVpjkOB/El6SIGzg+3kctMnbXrQlUs88L
X-Gm-Message-State: AOJu0Yz/5Ig5kjJE0XOMpmYnJLa/TyNrihXRTv3BaO7AUZyJ93SiSxiU
	7uLK1wvR1T6bsG31pkh4nNSPeWsQtBlme6Fw9U2lCbfm8b6baxam0AUuzm9e2WU=
X-Google-Smtp-Source: AGHT+IG/+kNSZwH/WitEGN5akql9DZcvaGdZF5htf4Rc1hKQs5Ev4o2xODzuMiJrZHse607olITOWA==
X-Received: by 2002:a17:907:9148:b0:a59:a5c3:819e with SMTP id a640c23a62f3a-a622805e75cmr232911766b.11.1716455165190;
        Thu, 23 May 2024 02:06:05 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a622bd91be5sm213204766b.33.2024.05.23.02.06.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 02:06:04 -0700 (PDT)
Date: Thu, 23 May 2024 11:06:03 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] RISC-V: KVM: Fix incorrect reg_subtype labels in
 kvm_riscv_vcpu_set_reg_isa_ext function
Message-ID: <20240523-9c0425e6b3c697abc1009123@orel>
References: <ff1c6771a67d660db94372ac9aaa40f51e5e0090.1716429371.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ff1c6771a67d660db94372ac9aaa40f51e5e0090.1716429371.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_020608_119381_D60E4F77 
X-CRM114-Status: GOOD (  16.15  )
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

On Thu, May 23, 2024 at 10:13:34AM GMT, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> In the function kvm_riscv_vcpu_set_reg_isa_ext, the original code
> used incorrect reg_subtype labels KVM_REG_RISCV_SBI_MULTI_EN/DIS.
> These have been corrected to KVM_REG_RISCV_ISA_MULTI_EN/DIS respectively.
> Although they are numerically equivalent, the actual processing
> will not result in errors, but it may lead to ambiguous code semantics.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index c676275ea0a0..62874fbca29f 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -724,9 +724,9 @@ static int kvm_riscv_vcpu_set_reg_isa_ext(struct kvm_vcpu *vcpu,
>  	switch (reg_subtype) {
>  	case KVM_REG_RISCV_ISA_SINGLE:
>  		return riscv_vcpu_set_isa_ext_single(vcpu, reg_num, reg_val);
> -	case KVM_REG_RISCV_SBI_MULTI_EN:
> +	case KVM_REG_RISCV_ISA_MULTI_EN:
>  		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, true);
> -	case KVM_REG_RISCV_SBI_MULTI_DIS:
> +	case KVM_REG_RISCV_ISA_MULTI_DIS:
>  		return riscv_vcpu_set_isa_ext_multi(vcpu, reg_num, reg_val, false);
>  	default:
>  		return -ENOENT;
> 
> base-commit: 29c73fc794c83505066ee6db893b2a83ac5fac63
> -- 
> 2.34.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
