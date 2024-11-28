Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 930D8D690EE
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Nov 2024 08:57:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FVqfznoKLa8HeEfUmWhZQdQwIUc9ZCIcDM63mYwID9w=; b=KWNERcQkosqJbe
	+8Z4ufV75x57vaO03qIe3q3JF+3AkxaKzj3AN+7pzT57KuvH9pHPrO04tAN5PvVS04eOWFLO3FSY/
	MGblMbL+8xCz/PT5a/x3Tlg2oziwXMhutLnjkJ1cSGcmwIZze4Gw4YdU8kigmRus1A3o+GDwji+k5
	qhMct4ojrBc8s2LTAIgQXQoS9TD86Sw/z0ZgvM33og47ft3i8nZnLfjAZk7Mxt0c/emC29cz4XgeP
	wec3Cd37olXdhpNDreSCDPRWuR1qWlxMCMpP4LEB7WCXowYvGCqbFnSiy/WosCMSbtKkmsf5VSVnz
	Yk52/fNhAXTsoqnvC6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaKj-0000000F5KR-1bxo;
	Thu, 28 Nov 2024 08:57:09 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaFy-0000000F4Sm-1XLV
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Nov 2024 08:52:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Q2iPe56MayituZcdhfXf2NviKcI0B6w7DTgpAVLjkFQ=; b=CdTnfJtC5Z4Q/F/Jkc0ayVMxrd
	53uGintyVgD2Ge2wiSymlR2ffjbu+AmImYhsVcCg+xpKeoSmhtgNreTy1UzWnwITmNX1INB1pgyJh
	WEEB8fAqJUvY48TZgBn2siwKMTMxv5YpUjenHaDcfUo/rAXkHZIi5OzhpUkzCU8WJHnQlAXASSO5G
	ubFPMJr2xURjgDFyA8JChRnSCleL3eB/pQzN5r531U1cjOvkMdziUYteeXa+JlqRLsHtNf3Y1uIfz
	S8BNUkCJ+Tz1iEvNOtO66wUhC5hc5J200A+B7Hj5VQgl1D4jsWM9maEOJo7St760g8D/P4Bjgo3/a
	Y8vfJWqg==;
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaFv-00000001ZJn-24C6
	for linux-riscv@lists.infradead.org;
	Thu, 28 Nov 2024 08:52:13 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4349e4e252dso5146935e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Nov 2024 00:52:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1732783929; x=1733388729; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q2iPe56MayituZcdhfXf2NviKcI0B6w7DTgpAVLjkFQ=;
        b=k90GW/gyEwfW2IqcdloGpIBCvq5kguHTjQv2+2lsxgBNA2Ub+xDDUhqWjCo7upLh1O
         ZQGyq+dY0lbUQ2/AALanDVW7kgmTUPU2XB8HyIEWMOcXg3YiETUwLdbnsPO1MrkYNSS4
         /I30iqZazWAQEc5fZBt+ibvG0XLy+XWN9qao19chLGN75NwBJwrfEa7Zice3jbvS+xWU
         a6jmVYld5mFP2H64/pOKurt8lfYYLkHtOTswbjNVj7Z7xorvjmYx0hO8pMPqnbxllLM2
         xTxUwN6RhcGdZm2EcE5gC7PRscVv4vwrEe2e3XHraA9ZPD1t/Z2z6sXJS+1Z785vaD7Z
         Q1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732783929; x=1733388729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q2iPe56MayituZcdhfXf2NviKcI0B6w7DTgpAVLjkFQ=;
        b=PIkExj3NUHX9c0xo4CkKaS51fl1JgMJZS1jVHnWhw3BLBFAtozHW74F3O2b07V7Ww0
         mq/C2sz+HWLCtPgvjFZ8Ry9QlZ1uaqJA0YkLyeARGYqC9OlLGDvhYEqKvtir8hmXjHOy
         u4rxkJVKHl+31r4eZb9YgLFzjU2pZ8aJ9eSwVI4k0QRsMK1CdC/W+jvHwhV9wfcytsxF
         liPnuNJFj14PWQ96sR7JM+1MJ3RJ5wuyoeaSqYaeOPu+NJQXe3JYwhA/ZpE56D6/pytg
         g/m7hWAeViLUa2gHRVj8/2nMtGplHwzAf8JNXyasr02DVmFw0vEUInnpkJNeLg9/yCSN
         zxKw==
X-Forwarded-Encrypted: i=1; AJvYcCUKvlRxJ75sdYBSXgdtecp73nWwpDs9Liz83E2OKuDl67hakJ5CBF6S21jIrS+cDe5cLtQs6ZkesgnU1w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7cZ13OuunngzOEHjYG9Eg1RLN6HLBpeDA8OK3/9zVNSPfhBc4
	1XQBVQsh4Wq0/O/Bp5emUuU1lSJhWmGAeEhQ4nf6205TLOkCwWvflUyYFjzEwuLX1NhowOPoZXU
	Sa10=
X-Gm-Gg: ASbGncsL7aJRQcgRA1buSfxB+SIYliRenxTpmh6VFDNI8iKZTkkfsPnjw4U3iRw0OwO
	NqkPHdQG6LYYCTgTmPwR20UZNWgQogw4RbK/BVu/MQ8MY08xJBwDZ0iPib9E/HczuA4U/agtf9+
	qnCyYi9cY6MOcgpIMAZG53zDq8jAKCs32nv9fYWSq8SjTrCb2gXaImYr1gpUswJvp8sSnLPaKGU
	JrIqQeVVYkuSCQs5pJiUd4WpK7iqrbJn1inpRn17ebr9L+UvozyUrWiVBQjHSKsaPAHdX9FvS97
	6VnzkgrkXKX3aBGNg8AvknYiwTGGLHPeaas=
X-Google-Smtp-Source: AGHT+IEQ7usI6WzT1Sy/dDzpS2PmYGgrjtEHrwwaKksPUcfWEtHLCN5lr8kos91EccHetXt6QvrFmA==
X-Received: by 2002:a05:600c:3b16:b0:434:a4fe:cd6d with SMTP id 5b1f17b1804b1-434a9dc02c5mr57820965e9.12.1732783928908;
        Thu, 28 Nov 2024 00:52:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434b0f7dd78sm14832355e9.44.2024.11.28.00.52.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Nov 2024 00:52:07 -0800 (PST)
Date: Thu, 28 Nov 2024 09:52:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 2/4] RISC-V: KVM: Allow Zabha extension for Guest/VM
Message-ID: <20241128-4d652d29ba99a3e8ffa8121a@orel>
References: <cover.1732762121.git.zhouquan@iscas.ac.cn>
 <ea2918b299348aca0f5a45630b7b7c9889f47fa6.1732762121.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ea2918b299348aca0f5a45630b7b7c9889f47fa6.1732762121.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_085211_767840_A95090AF 
X-CRM114-Status: GOOD (  14.08  )
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

On Thu, Nov 28, 2024 at 11:21:26AM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> Extend the KVM ISA extension ONE_REG interface to allow KVM user space
> to detect and enable Zabha extension for Guest/VM.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 9db33f52f56e..340618131249 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -178,6 +178,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SMNPM,
>  	KVM_RISCV_ISA_EXT_SSNPM,
>  	KVM_RISCV_ISA_EXT_SVVPTC,
> +	KVM_RISCV_ISA_EXT_ZABHA,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 67965feb5b74..9a30a98f30bc 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -44,6 +44,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SVVPTC),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> +	KVM_ISA_EXT_ARR(ZABHA),
>  	KVM_ISA_EXT_ARR(ZACAS),
>  	KVM_ISA_EXT_ARR(ZAWRS),
>  	KVM_ISA_EXT_ARR(ZBA),
> @@ -138,6 +139,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_SVINVAL:
>  	case KVM_RISCV_ISA_EXT_SVVPTC:
>  	case KVM_RISCV_ISA_EXT_SVNAPOT:
> +	case KVM_RISCV_ISA_EXT_ZABHA:
>  	case KVM_RISCV_ISA_EXT_ZACAS:
>  	case KVM_RISCV_ISA_EXT_ZAWRS:
>  	case KVM_RISCV_ISA_EXT_ZBA:
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
