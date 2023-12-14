Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D23CC4167B
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Dec 2023 07:52:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fO4QJpUVkkURNZM1faqcWJ8cPVLDRvt17zMS0M9bgJ8=; b=IOAXwlv4LwnMHN
	Sma2yhnwX3cb3UnBL4I+8aGVzaM5unt9GxQ5axZKTGuXJXzfMYTcN8SyF/WTPaZMFeDcsWuTnYmBb
	Gjc/ZAQSIsIIaoDJjqlUaPPrNpqrD8z9nvuWP93QasMh4X2e0sy3W5B1+DPjIPJ5ADIeSsW4OH7nU
	BZMPFbIW2PgRLl7hrPWUxTMq0lgj21UnsG5k1JXRBw4RhjSpfVnJy8HLKYLbzVAX3FR21TaPXeORS
	UoFsOYAdziMsy50b4lJOTLH0C3SeRh/c500ke/6sp+E+NT9b0xjepf4QT/vCvS6LneUqNzexPyvMS
	X3D1OCfIqFLsyCP7UkWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDgWS-00HAhv-3C;
	Thu, 14 Dec 2023 07:52:44 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDgWP-00HAfl-2l
	for linux-riscv@lists.infradead.org;
	Thu, 14 Dec 2023 07:52:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3363aa2bbfbso1386399f8f.0
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 23:52:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702540358; x=1703145158; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=kKmbX2YPpXuRY6IHo6cBzkg+NMrJJvxaEEC8NjKnxGY=;
        b=CuGRB0q4eRZRsJ3hvJyrFj3XUDPimvaj0vGiRGSmaj1WzNutX4nXGfQ0/zGI8ZEHIe
         KDTcn3pZH1e5N0zQsZ7DRnNdihTzp1gswRn5hGNtW6dxJCJDShxQ431+IWXxnkPq9Y6I
         fH4CrNW4diHmYcTfT36x4X3ZIdR/p2vzBnazYK1kzKao6y0LEbKNeDjS8YdvrXqUDEwL
         h2pBjj035+i5bA7mvNxQQAMwaRz46OjPIZKvJmUKXQqQDggG7zRgAfeVMkd5DEoU9x06
         KrCTHgObpEweNgUtMxuXpSyXK7H5s98Z7O+Xn4DiDmyy06XIqCYsfNFZsn9L1TRx+eJ/
         tjnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702540358; x=1703145158;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKmbX2YPpXuRY6IHo6cBzkg+NMrJJvxaEEC8NjKnxGY=;
        b=uYSqf9V5NToieKXp2/mC4kGcpXRPO+bllXVDCaXcA0pyzCd/3AqkE6X/djZpBQ863q
         +4LpDIJe31EgZa7kD7ohlejqBrnVUFSgZ31YgnI3ma8uYzYHfxYIq+XOi+AiK6nZX2EJ
         NY/YWpE9uZGVs5D6RUqWMulfS9s3Yv1qfESmP4Bdo+GWzscJY6JBmC4jEOrEMpXrrms0
         rHbGXlIGEo1Uqg1ACv8yNVcdXNXDtgsokBry9EYT3/tk3pwujKYciKYvzSd4GxukgBK4
         pNAdQuEE1DvypsUBfQSou9/6ypY0LjaLtcRfArcexMZwkNLz4qhA6l62swtqnKmzzbJ+
         +lIQ==
X-Gm-Message-State: AOJu0Yxc4TtVgxDQXmrU3wv2h8IP6hVIqZ9tncgOAz0M0foNgDKnzP5B
	+x8csz1AUHL99BIhxdQydW3bug==
X-Google-Smtp-Source: AGHT+IEcg4w5zPjg1p98QCYf6W1xFs9iv4IikObE4ZRhGgbZ28NqkIVLjUjAV+O24f828odOwuc64g==
X-Received: by 2002:a05:6000:4c6:b0:333:1c97:48c4 with SMTP id h6-20020a05600004c600b003331c9748c4mr4411047wri.7.1702540357383;
        Wed, 13 Dec 2023 23:52:37 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x14-20020adfdd8e000000b0033630da3528sm5702110wrl.25.2023.12.13.23.52.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 23:52:36 -0800 (PST)
Date: Thu, 14 Dec 2023 08:52:35 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org, palmer@dabbelt.com
Subject: Re: [PATCH v3 3/3] RISC-V: KVM: add vector CSRs in KVM_GET_REG_LIST
Message-ID: <20231214-315a8cd86b5eeb5a1a4ebd88@orel>
References: <20231205174509.2238870-1-dbarboza@ventanamicro.com>
 <20231205174509.2238870-4-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231205174509.2238870-4-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_235241_895684_CE0BA0E9 
X-CRM114-Status: GOOD (  21.69  )
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

On Tue, Dec 05, 2023 at 02:45:09PM -0300, Daniel Henrique Barboza wrote:
> Add all vector CSRs (vstart, vl, vtype, vcsr, vlenb) in get-reg-list.

We should add another patch for the test for these
(tools/testing/selftests/kvm/riscv/get-reg-list.c)

Thanks,
drew

> 
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 55 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index f8c9fa0c03c5..2eb4980295ae 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -986,6 +986,55 @@ static int copy_sbi_ext_reg_indices(u64 __user *uindices)
>  	return num_sbi_ext_regs();
>  }
>  
> +static inline unsigned long num_vector_regs(const struct kvm_vcpu *vcpu)
> +{
> +	if (!riscv_isa_extension_available(vcpu->arch.isa, v))
> +		return 0;
> +
> +	/* vstart, vl, vtype, vcsr, vlenb and 32 vector regs */
> +	return 37;
> +}
> +
> +static int copy_vector_reg_indices(const struct kvm_vcpu *vcpu,
> +				u64 __user *uindices)
> +{
> +	const struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
> +	int n = num_vector_regs(vcpu);
> +	u64 reg, size;
> +	int i;
> +
> +	if (n == 0)
> +		return 0;
> +
> +	/* copy vstart, vl, vtype, vcsr and vlenb */
> +	size = IS_ENABLED(CONFIG_32BIT) ? KVM_REG_SIZE_U32 : KVM_REG_SIZE_U64;
> +	for (i = 0; i < 5; i++) {
> +		reg = KVM_REG_RISCV | size | KVM_REG_RISCV_VECTOR | i;
> +
> +		if (uindices) {
> +			if (put_user(reg, uindices))
> +				return -EFAULT;
> +			uindices++;
> +		}
> +	}
> +
> +	/* vector_regs have a variable 'vlenb' size */
> +	size = __builtin_ctzl(cntx->vector.vlenb);
> +	size <<= KVM_REG_SIZE_SHIFT;
> +	for (i = 0; i < 32; i++) {
> +		reg = KVM_REG_RISCV | KVM_REG_RISCV_VECTOR | size |
> +			KVM_REG_RISCV_VECTOR_REG(i);
> +
> +		if (uindices) {
> +			if (put_user(reg, uindices))
> +				return -EFAULT;
> +			uindices++;
> +		}
> +	}
> +
> +	return n;
> +}
> +
>  /*
>   * kvm_riscv_vcpu_num_regs - how many registers do we present via KVM_GET/SET_ONE_REG
>   *
> @@ -1001,6 +1050,7 @@ unsigned long kvm_riscv_vcpu_num_regs(struct kvm_vcpu *vcpu)
>  	res += num_timer_regs();
>  	res += num_fp_f_regs(vcpu);
>  	res += num_fp_d_regs(vcpu);
> +	res += num_vector_regs(vcpu);
>  	res += num_isa_ext_regs(vcpu);
>  	res += num_sbi_ext_regs();
>  
> @@ -1045,6 +1095,11 @@ int kvm_riscv_vcpu_copy_reg_indices(struct kvm_vcpu *vcpu,
>  		return ret;
>  	uindices += ret;
>  
> +	ret = copy_vector_reg_indices(vcpu, uindices);
> +	if (ret < 0)
> +		return ret;
> +	uindices += ret;
> +
>  	ret = copy_isa_ext_reg_indices(vcpu, uindices);
>  	if (ret < 0)
>  		return ret;
> -- 
> 2.41.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
