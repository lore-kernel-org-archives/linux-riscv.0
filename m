Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57863D5806E
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 12:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7cVUlvt35+CBoOh3CHrARx+kQtGrF2BQjLIri2jHvr8=; b=D9DtxMd8s1wDHq
	WdLZONoaxhDib9CTTeL2Ymq5TZOQA1ITeDVhBLTdTgYYD0qAE54X7nGNEDnO5IWlaaPyagTSEqHlQ
	ma15db5BrFTjmI8DEBpJLrN+6qv+2dgSQiPWcU175l0peGStGvvGwkpB3Z+jzJoAX6lardxZJsxjX
	jHbULR2HAr5hyVjr2lNehV9AtVDPRMlHyXNotqn8fActVjRnyE/KAi9bCyzRh9cqdEc+8m7aM6cRm
	wYPWeGxdV7zJL6Nzc9UVNWAL+xNf0wz8N7oFPOQQT+6ggfD8Z28DBki+T5YR1utNBEsWz2H3e8AkN
	znCMeRuKZvXvk0XxwU1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXtd-00000007yVH-0Cv1;
	Mon, 25 Nov 2024 12:08:53 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFXta-00000007yUM-3QXQ
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 12:08:51 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-434a099ba95so5356785e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 25 Nov 2024 04:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732536528; x=1733141328; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rtGYra4ZiucyLvI8CA3+YqcIlZT99r5pBwc2AIGV96M=;
        b=MSW4FTFz4fMRL4PGpiGurwXwI9GWAVRkh6Sj4TdcFBvfL2CQtz/qQ2VrkdJ8FXC5iJ
         bTpDCGiY3MsksGh0fcYOphwjfVTq8VopnP5UU8TS8PEyn8uQnR6Eezp7l20dy5wxE82C
         iIAJnBtVDyHdrualKqZgW93FH40NkchjTabLlCNeSM+6x8HA9/r/g1h3O2TEaK/4f8Nh
         mPDXnrdCrPEqG+eF6oJuYzcGEDuz2+2Dl9ALekLSw++mPaf7KEjDslIfAThpV9uFQ+2P
         Xjga2K53/MSIJgzSkkuK9a4rHNT8Eh24EcREnJg+8f+Ea6eX3DSHAZZMf2WgQg0/1KYq
         i89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732536528; x=1733141328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rtGYra4ZiucyLvI8CA3+YqcIlZT99r5pBwc2AIGV96M=;
        b=QublkYi9kllGSDEkOQQVAgoHyWyxksPhl5Q+0Ju7eMZNC58WYHuTbNf8WZr1AqIeti
         P3oqnsqCRJKDFjt8L4EHdZKOXUEoT4ZoBQRUvsBq4jYIaPN1QZnHkg4OQzwiFCMEWxkV
         RMaJ+I4tkzp/qkHuJQ9HmNlVAzqJQVVFttULfEnvB28gEuKUBEZgN0qPrsESTXGEnAZz
         GFkmY1jhDd5iIGSNWfvryt+GA0jDHdAYibeZxuhF8i4fxrKpqsqEEMEhbs3NCF3++cnw
         PbT1ExirjhWQwB/nDaBoOpAqseMi8K0rYM2wmEr0dV3MKUEvs0J8XLRMPzBxjz2Gjf7G
         KdXg==
X-Forwarded-Encrypted: i=1; AJvYcCXX1abm6Dr6u8yXpSL1+vUMapq6Jmeat4rQKTFlrRL8r+QNhA3BgT2nrqEuJlyGg68MMrF3Iur7OF9gbA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQiI1D1YWUxgXJg81z1rNH3TPn7XHufbiruMLzTD/9x8lW3IMQ
	MPtIlrkMsyQBqRTr0/Fbvw8MZnIGwJ9g+kBdWG4i4ladUTJ3R5CK/3eYUIps+cLw2Sdu+qjiqaL
	p048=
X-Gm-Gg: ASbGncs7TWv8+zRbxmmVl6TKfxvb22Cco9k8CgmWOkfAD62igMrN711CoSP+OmE83E5
	+LDz/E/xArvxoxvDTvaK2hO8MDRl75DMw2+m2490dVz3HCD1K2bCuoPAqsKfRVAd3Kxl50xrZSv
	UJj7IVvmZZvemvJdrh0RNDIASzME5RcK/ujfPfV/z68y+I6MR72r03E2QpA2EtBZrzDlvQ8Gbtk
	s4dNfT3S3QZx9k9JTRsD3g1NaCaW1+y5YnrFT35xb2f2ALIDUxcK1Im27sTLWggJeKaSJniQeaa
	9Zm7KF4ZVmadXDOIdfEPV/eP5yWepkpZ0iQ=
X-Google-Smtp-Source: AGHT+IEcHSdgJj5nANfMThAU2OGxyIx79hhPO8lC6bsUu2hPonUhJGs8xsqe5h4w4zgbyjw1N3+XCw==
X-Received: by 2002:a7b:ce91:0:b0:434:9de2:b101 with SMTP id 5b1f17b1804b1-4349de2b333mr40945755e9.2.1732536528430;
        Mon, 25 Nov 2024 04:08:48 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434a02f2ea1sm29588115e9.34.2024.11.25.04.08.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Nov 2024 04:08:48 -0800 (PST)
Date: Mon, 25 Nov 2024 13:08:47 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Max Hsu <max.hsu@sifive.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, 
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	Samuel Holland <samuel.holland@sifive.com>
Subject: Re: [PATCH RFC v3 3/3] riscv: KVM: Add Svukte extension support for
 Guest/VM
Message-ID: <20241125-7cfad4185ec1a66fa08ff0f0@orel>
References: <20241120-dev-maxh-svukte-v3-v3-0-1e533d41ae15@sifive.com>
 <20241120-dev-maxh-svukte-v3-v3-3-1e533d41ae15@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241120-dev-maxh-svukte-v3-v3-3-1e533d41ae15@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_040850_859225_D2F60C33 
X-CRM114-Status: GOOD (  18.45  )
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

On Wed, Nov 20, 2024 at 10:09:34PM +0800, Max Hsu wrote:
> Add KVM_RISCV_ISA_EXT_SVUKTE for VMM to detect the enablement
> or disablement the Svukte extension for Guest/VM
> 
> Reviewed-by: Samuel Holland <samuel.holland@sifive.com>
> Signed-off-by: Max Hsu <max.hsu@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 4f24201376b17215315cf1fb8888d0a562dc76ac..158f9253658c4c28a533b2bda179fb48bf41e1fc 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -177,6 +177,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZAWRS,
>  	KVM_RISCV_ISA_EXT_SMNPM,
>  	KVM_RISCV_ISA_EXT_SSNPM,
> +	KVM_RISCV_ISA_EXT_SVUKTE,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 5b68490ad9b75fef6a18289d8c5cf9291594e01e..4c3a77cdeed0956e21e53d1ab4e948a170ac5c5c 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -43,6 +43,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> +	KVM_ISA_EXT_ARR(SVUKTE),
>  	KVM_ISA_EXT_ARR(ZACAS),
>  	KVM_ISA_EXT_ARR(ZAWRS),
>  	KVM_ISA_EXT_ARR(ZBA),
> 
> -- 
> 2.43.2

Anup raised the missing entry in kvm_riscv_vcpu_isa_disable_allowed() in
the last review. An additional paragraph was added to the cover letter for
this review, but I think there's still a misunderstanding. If the guest
can always use the extension (whether it's advertised in its ISA string
or not), then that means it cannot be disabled from the perspective of
the VMM. The only ISA extensions which may be disabled are the ones that
trap on their use, allowing KVM to emulate responses which a physical hart
without the extension would produce.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
