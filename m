Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF520C433FE
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 05:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cfqAsWJPvsEPb1QbFLLVMsRZ402cTgMM/ZEPj1z6hmY=; b=w3YH9RYyUPZfwr
	B//xliQXGQaopSj0EeMZj4P6yHpz+AM4WWnl1gCEfWaaT5Rx5NeF52DjFZ9j8BWM1F2TxbOHi1gRA
	env4JCOj30KR9hM8VvgMuO55v45c7Ct3K6vlW4inLhg2k6JYtOumC2aLxNDu4GdRfeGO9KmIglbvF
	Xlox6p/dQ3qTWS67j4WI0plAQrrNPPEIWRRh1Zcii1NyogZ+AmL3HZ4cZRq355J2SBnoDMrCuD43I
	2p39/77XuQmQDHnZmvjKakuQCKapNJJoOQqUKU1wkdkhQrUTDt1N6JszyVS4P7AngFnxyS7VPAz8b
	yKjrHhCKDe+sn53zn8wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oztRn-006XfG-Lj; Tue, 29 Nov 2022 05:46:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oztRk-006Xcj-Q4
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 05:46:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id o7-20020a05600c510700b003cffc0b3374so10003671wms.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Nov 2022 21:46:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=HD7x5LbR33AXrxQu51beO1G2A7rcknzhC17f6V/q6WA=;
        b=BQUjUq/abpPMUKx7kDHWQPniuBMZ/SoyzcNBUx+f61DXcq6lSMqogL/vR9GTx1b939
         2YdZRlidock6vR4dUKjdGaX1xxBOWzKRsTRZ7LyY81iHEF4Cywyt81UTBUHfZaf1Esgi
         5U7sVwtZXhI/g3l55sBpTDvQSEPJProgt8GPRmuT9iaRHuZn6tv4s0l+wltoN+suBxkp
         Y5tNNpgPmgU+EtXvzQuTtrfqW3zDgfCshKEU1hTnDmkf5/z+dqx7FuhmpQ1sLoubRqUt
         6lWKhqbiArdmKg01wCgdKTAvnmtrUOV25vIfP2uEXzd95oKg/MjB/HrKjHOKLSBvBq26
         X7ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HD7x5LbR33AXrxQu51beO1G2A7rcknzhC17f6V/q6WA=;
        b=IALU6GXQsA+pnADT6Buv1zZQAde/uY0DJ33JndO/leZxA5db0WFvELTYzK1fZ+/sPu
         wB+sBTnIhyhdg7CCUls4PwgvF3AU+7Jp2uE6+tVNHJCgpGXJnocFUAlu5XlOCCWB4gZn
         kYBUnyo27EEd3KQoD4cZ2V7Hzhe1NDsF5dvwTJ221WxGnFs/BlpTR8eSwdT3fkGIoG7P
         j8wOGXXQKRv+oBQ/ExGygjk9YjOkbeo4IKA7JXZHOTUNSo/8enTjjFQ4jNgp1VuLrR3v
         LlCV9aAuKz1x+RhQ6VvRMmusysfAcaeNOGbBxuICrpUFsiPDGjjyzmd6lYJJm3Oil9lR
         eLpg==
X-Gm-Message-State: ANoB5pkeM0l6tZuy1jG4kRpFeXyaYm9wzjqygeJFMkABxmLQM0eJhUaQ
	KxFwrVj0dQkVuBXRO8aANWTBVTRzd/UCMA==
X-Google-Smtp-Source: AA0mqf5KLXL6iv9L9l1kcDPpytL/st2EhbV/q40zSXAbSz7I3BYA93wtvFGhaOW/fH+TVZ8dwXatug==
X-Received: by 2002:a05:600c:3d18:b0:3cf:b7bf:352d with SMTP id bh24-20020a05600c3d1800b003cfb7bf352dmr32068568wmb.106.1669700777581;
        Mon, 28 Nov 2022 21:46:17 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p21-20020a1c5455000000b003b4cba4ef71sm698389wmi.41.2022.11.28.21.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Nov 2022 21:46:17 -0800 (PST)
Date: Tue, 29 Nov 2022 06:46:16 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Anup Patel <anup@brainfault.org>, kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/9] RISC-V: KVM: Add ONE_REG interface for mvendorid,
 marchid, and mimpid
Message-ID: <20221129054616.4zju5z7ipg6wki7l@kamzik>
References: <20221128161424.608889-1-apatel@ventanamicro.com>
 <20221128161424.608889-9-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221128161424.608889-9-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_214620_853016_7057CE04 
X-CRM114-Status: GOOD (  20.63  )
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

On Mon, Nov 28, 2022 at 09:44:23PM +0530, Anup Patel wrote:
> We add ONE_REG interface for VCPU mvendorid, marchid, and mimpid
> so that KVM user-space can change this details to support migration
> across heterogeneous hosts.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  3 +++
>  arch/riscv/kvm/vcpu.c             | 27 +++++++++++++++++++++++++++
>  2 files changed, 30 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 8985ff234c01..92af6f3f057c 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -49,6 +49,9 @@ struct kvm_sregs {
>  struct kvm_riscv_config {
>  	unsigned long isa;
>  	unsigned long zicbom_block_size;
> +	unsigned long mvendorid;
> +	unsigned long marchid;
> +	unsigned long mimpid;
>  };
>  
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 312a8a926867..7c08567097f0 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -276,6 +276,15 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  			return -EINVAL;
>  		reg_val = riscv_cbom_block_size;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> +		reg_val = vcpu->arch.mvendorid;
> +		break;
> +	case KVM_REG_RISCV_CONFIG_REG(marchid):
> +		reg_val = vcpu->arch.marchid;
> +		break;
> +	case KVM_REG_RISCV_CONFIG_REG(mimpid):
> +		reg_val = vcpu->arch.mimpid;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> @@ -338,6 +347,24 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
>  		return -EOPNOTSUPP;
> +	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
> +		if (!vcpu->arch.ran_atleast_once)
> +			vcpu->arch.mvendorid = reg_val;
> +		else
> +			return -EBUSY;
> +		break;
> +	case KVM_REG_RISCV_CONFIG_REG(marchid):
> +		if (!vcpu->arch.ran_atleast_once)
> +			vcpu->arch.marchid = reg_val;
> +		else
> +			return -EBUSY;
> +		break;
> +	case KVM_REG_RISCV_CONFIG_REG(mimpid):
> +		if (!vcpu->arch.ran_atleast_once)
> +			vcpu->arch.mimpid = reg_val;
> +		else
> +			return -EBUSY;
> +		break;
>  	default:
>  		return -EINVAL;
>  	}
> -- 
> 2.34.1
>

At some point we should patch Documentation/virt/kvm/api.rst to describe
the possible errors we have. It's missing EOPNOTSUPP and EBUSY.

Also, I see a couple places were we use EOPNOTSUPP that would be better
as EBUSY. And finally I wonder if we shouldn't use ENOENT when the reg_num
is wrong/unknown, which would allow us to differentiate between bad
reg_num and bad reg_val in set-one ioctls.

I can send an RFC series to better describe these thoughts.

And for this patch,

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
