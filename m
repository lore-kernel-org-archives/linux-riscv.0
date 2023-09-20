Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A98E1CE79AC
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Sep 2023 05:03:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dWwMcGWEZlvri+dikAAVS5k02WTYsLe+OUsIeG/f1SQ=; b=UwNHgzXrTDYDE4
	kXDTHrbN1Uxly13U5YKRtIfinaOYyQxEkxtAcSVRJCTxqWfbEzcdDR0QZKSppwucN7RWOiKJdUahC
	HQYxEu2ZNRtN6BILbgLdDBr6hDSg8nTsOqY+6KVGooPvPElfl94c9AGxVpx0+5pg/wlU3P70qY4jA
	G61jJlPRGWhJMt0LeIWqHh1c7wLP0rYMvwsl9c9T2Cz6aAjZKt0JM1uUbrSdNUJ2g+yU2e2drHaxl
	7jolVxUjU4BBag/TaoAoR6i3KmlaczbABy0KEQXFXiDvXVhnS7jr79vCiLkhSFERhu162Hz9xDA+f
	WUov018ydUlpQ/wfZdpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qipMw-001sgI-06;
	Wed, 20 Sep 2023 05:03:22 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qipMt-001seV-1t
	for linux-riscv@lists.infradead.org;
	Wed, 20 Sep 2023 05:03:21 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-32003aae100so297235f8f.0
        for <linux-riscv@lists.infradead.org>; Tue, 19 Sep 2023 22:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695186193; x=1695790993; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=c+3/wOOicjYC2xAjvdjrTiizxDM62+8wq1jD8pVAYJM=;
        b=O1UMvEZxvKcdKuKgaWR0tjNckYxLPGDTgR0Un74j7ZIqbxHK/1bSdYmjfgIsNasJjI
         /LHgYjknlZr4+xoWxCcmW3TCrWK7xrojIiCH7Carc+qLmq4rpwT2LBmuW22K+Tgua7XP
         CCVFcesRwHNgkJ2iIPrU82SJcK/bSfMxPMofjY+pGl/o3l/DvC5TMkn9ESBVbyRCPvTK
         tFOoHMFFqXVL61/ReV3paWIdi4YseDYdDs6eoX+xOzxfk0NubwmOsCAbKt8gn0+WM2A/
         RspcxcIfXtu9CzCFf3NTQsvOeE25PEO6m0Oa1slLOMI5sUhzeZhbJ7chF+9uwP+nFxS/
         I2NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695186193; x=1695790993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c+3/wOOicjYC2xAjvdjrTiizxDM62+8wq1jD8pVAYJM=;
        b=kM4gHwKEZMfFramPePRlfgA7Q/QEsFpzK6y9+PIDihlrbXwI28Hkfluq6M2wyyIG/Q
         Amx6Xfnfrn1eYrrtp61G8yR9Jyc2LG8/4j8ooKKkm4dCNJuMGePKFIsjtJlTnQWCuNIG
         u0OJRRmwxci0AD2+YWAK1R9cWkjTNtDjOkwnZ6kCBK+MqxYyUpPf6PQmbvPTWdRTZq8U
         CVtUoW2Fk427IsjF399HnYXekII8DAehhbTII5TyFxOjCrzpHwR5Iet3aXQUYv/SOatS
         sfLr/mLYxJoBoH0MG35imq6YQWqxo/TxRxaRZVjJtRDpMfYpZw8prnoRwCEzNOH9IUFr
         uM4Q==
X-Gm-Message-State: AOJu0YxP6pjXhmORd4OkZajy1eON/b3R+4j9M/Od9xnwcnNtrr+bsSFd
	ZqpDWnHfg02dnrEhpYuJ6bYtTg==
X-Google-Smtp-Source: AGHT+IES2JCsdwAJKjskK6b48tRhcrGtknKDz0H9fUak3sptmBQ8p70dRsJQ4y4NQvgiGitKUcLV4A==
X-Received: by 2002:adf:e6d1:0:b0:315:a235:8aa8 with SMTP id y17-20020adfe6d1000000b00315a2358aa8mr3313895wrm.2.1695186193391;
        Tue, 19 Sep 2023 22:03:13 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id q24-20020a7bce98000000b003fbca942499sm834220wmj.14.2023.09.19.22.03.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Sep 2023 22:03:13 -0700 (PDT)
Date: Wed, 20 Sep 2023 07:03:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Shuah Khan <shuah@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, kvm@vger.kernel.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 1/4] RISC-V: KVM: Fix KVM_GET_REG_LIST API for ISA_EXT
 registers
Message-ID: <20230920-6ef044ecc94ec729f2f6ca37@orel>
References: <20230918180646.1398384-1-apatel@ventanamicro.com>
 <20230918180646.1398384-2-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230918180646.1398384-2-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230919_220319_628105_CF8F6313 
X-CRM114-Status: GOOD (  18.29  )
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

On Mon, Sep 18, 2023 at 11:36:43PM +0530, Anup Patel wrote:
> The ISA_EXT registers to enabled/disable ISA extensions for VCPU
> are always available when underlying host has the corresponding
> ISA extension. The copy_isa_ext_reg_indices() called by the
> KVM_GET_REG_LIST API does not align with this expectation so
> let's fix it.
> 
> Fixes: 031f9efafc08 ("KVM: riscv: Add KVM_GET_REG_LIST API support")
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 1b7e9fa265cb..e7e833ced91b 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -842,7 +842,7 @@ static int copy_isa_ext_reg_indices(const struct kvm_vcpu *vcpu,
>  		u64 reg = KVM_REG_RISCV | size | KVM_REG_RISCV_ISA_EXT | i;
>  
>  		isa_ext = kvm_isa_ext_arr[i];
> -		if (!__riscv_isa_extension_available(vcpu->arch.isa, isa_ext))
> +		if (!__riscv_isa_extension_available(NULL, isa_ext))
>  			continue;
>  
>  		if (uindices) {
> -- 
> 2.34.1
>


Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
