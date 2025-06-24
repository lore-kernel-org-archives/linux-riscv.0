Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB3D5C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 14:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyLFpamoqXCln0cAEaKgSzBkCT5mJLl/OyGTjB2Y52A=; b=BywCW86C10UFwE
	c1cuuIPfXB51Kj3niCQj+WRDL30X/xPRYUaFFtetZ00WwXycNmas94PqnYPOSS5OSUKu4aVhpcm9B
	k0eGDAH1RW1iGX4M3ALFM7ypjegCkfQd7tas0wVFxkap9jCKQKOWFc/0D3w1YtxLn/iFvfweQYsLe
	3gBH1QciXUso274esIKQQFaMsRf4iwLeG/e3nHkHysHfltC0xlo1NsYUq4X7cV9gfi6YdwZoOnOpT
	SgnBLi2QlgJCKECohP49n1xcOJqs8PpFwSz1uYLL7iuz4H6Z5mrD1FD/f75sTct2QhMceUxe2GZ5r
	cs7XCttkTgmJYN46lcTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU4Pa-00000005r2S-2MR3;
	Tue, 24 Jun 2025 14:14:10 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uU3xj-00000005l75-17Fg
	for linux-riscv@lists.infradead.org;
	Tue, 24 Jun 2025 13:45:24 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso314461f8f.2
        for <linux-riscv@lists.infradead.org>; Tue, 24 Jun 2025 06:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750772721; x=1751377521; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hhHOBARS9lr0Jne2Zdn1kpqzowPhY12GIzjucW3MJHM=;
        b=Ghh+26T3S6afK7/JW+doMvqd066E7zC+pksgjruBpXasMwrKsKqYLmwcRPPHq3DPNf
         Ioe3swcpjpg0/DDHLAduE+GN6guBMhgHxQ3djn3krovf/MmbI0iqqORG3G5bOMjU+sAa
         tsQsEFQ/Q3nn8Uvgc713QZvyYeEbUuus9vhdMKvvio21+tAxhApGK1/1Mr75AsXCzXRk
         zoUoC7ZFiwExIcl9WMi/7DfRR1EHav3WyCEJiwr3NjF2+D89gw7d826tCvFQQ9ZrzKDr
         X7urLJCBNTl4csfNKaMiNFNR+A/yMxtW8fOkTmENevL+5cHSgrfehDvgZFInqPBONUMk
         Cgeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750772721; x=1751377521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hhHOBARS9lr0Jne2Zdn1kpqzowPhY12GIzjucW3MJHM=;
        b=jhIY2BMMcOj3G8H6owDqi8CNnED6+YvU3cMPs/Jl+289+C84A1LXebYcJB+mnVnesy
         9KINNR2NWXQhpaxyWbxD12XtegtTlRgjSNG4wC8TVfYvQrZVFeMn7feOt7zWhtsxUfD6
         +/OzRz7jqMItTWfvlpuqbGe+4Tie/G8Q7nSLEWLbO+cys5ng2dyeWq+9t/XD69/+gAeB
         gZnZxBBkY3e9zWqBfbSAaOGPKTm2RwSKT7uIE71dLRxZ2JL3Oc5tSFnzEJ5OsJvqpSir
         iUw8WGC1XJuoG4cGCp5XXlpCr7QtdPMINXoeU5D2ZTaqdzsGvaJ2B0GueG7yHbtK4aGI
         N9sg==
X-Forwarded-Encrypted: i=1; AJvYcCWdra1Qgm6NDR7MavnM8b6Iiv97sW++uTkFErrZlA7bQBe+TK3AgfD5lv73V33nu3/XETm/gM4FfkrveQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx1WqoEGeKUIj771+eFO6ADtmBRub+evy6Pt4FYvTjgcSLv4CN/
	NZMRPQkzfJdjDoPoVUSrljlJn2ejK6AOF4N+036ECZjZ+Vh2HBD0OuJV0TidGZOQGDg=
X-Gm-Gg: ASbGncviORbhripY9vAex3mdQOLgZ58EfaAhcCzhKyuXvfQH1XkCd9hGJicLcib6LgH
	9/RU4k4srTBmFb9H3fYg4Vu8hycfn76dePjcoJcA5qLDfHcMHbY75Z9VupKQfQ7wIurp1lGspNS
	0OZyvPQyo7UK24bnLi3VvbfAGHuC7TFfkL9oq61BcyoZ/KhYN4/18nxQHlgaRZUa53lZBP/ypoR
	6CpK2frmMOoYqekZVD53zPXKxayARdQbH9Iu1mq2YZnkLg4n2oh5uo6M02ZMq/OWzzPCqVN6zdI
	brAMCqhFTaI94KgxP0oHcl45r+o/bfIEXuTqWgZfjW9oOMzbnw==
X-Google-Smtp-Source: AGHT+IEU5StVqiMNMsimuk7TXSreScYWyjj3lITH71NZEaq/8EdSLIayk4NRO4nj9hFeb35RGbbQ/A==
X-Received: by 2002:a05:6000:2405:b0:3a5:1410:71c0 with SMTP id ffacd0b85a97d-3a6d12e1329mr12765077f8f.38.1750772721155;
        Tue, 24 Jun 2025 06:45:21 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::5485])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-453632312a3sm153049215e9.1.2025.06.24.06.45.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 06:45:20 -0700 (PDT)
Date: Tue, 24 Jun 2025 15:45:19 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: zhouquan@iscas.ac.cn
Cc: anup@brainfault.org, atishp@atishpatra.org, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, kvm-riscv@lists.infradead.org
Subject: Re: [PATCH 1/5] RISC-V: KVM: Provide UAPI for Zicbop block size
Message-ID: <20250624-c01c528dd9ec524ed3f5e17e@orel>
References: <cover.1750164414.git.zhouquan@iscas.ac.cn>
 <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <553bacc4f66e815975bb8ee0e4696397407b0a82.1750164414.git.zhouquan@iscas.ac.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_064523_297391_AF077CF5 
X-CRM114-Status: GOOD (  26.59  )
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

On Tue, Jun 17, 2025 at 09:10:22PM +0800, zhouquan@iscas.ac.cn wrote:
> From: Quan Zhou <zhouquan@iscas.ac.cn>
> 
> We're about to allow guests to use the Zicbop extension.
> KVM userspace needs to know the cache block size in order to
> properly advertise it to the guest. Provide a virtual config
> register for userspace to get it with the GET_ONE_REG API, but
> setting it cannot be supported, so disallow SET_ONE_REG.
> 
> Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
> ---
>  arch/riscv/include/uapi/asm/kvm.h |  1 +
>  arch/riscv/kvm/vcpu_onereg.c      | 11 +++++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index 5f59fd226cc5..0863ca178066 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -55,6 +55,7 @@ struct kvm_riscv_config {
>  	unsigned long mimpid;
>  	unsigned long zicboz_block_size;
>  	unsigned long satp_mode;
> +	unsigned long zicbop_block_size;
>  };
>  
>  /* CORE registers for KVM_GET_ONE_REG and KVM_SET_ONE_REG */
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 2e1b646f0d61..b08a22eaa7a7 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -256,6 +256,11 @@ static int kvm_riscv_vcpu_get_reg_config(struct kvm_vcpu *vcpu,
>  			return -ENOENT;
>  		reg_val = riscv_cboz_block_size;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))

I realize this is the same as what we do for zicbom and zicboz, but I
think we should actually check riscv_isa_extension_available(NULL, ZICBOP)
instead. The reason is that we otherwise create an ioctl order dependency
on the VMM.

I suggest adding a patch to this series, which would come first, to change
zicbom and zicboz block size registers to depend on the host, not the
guest, isa. The patch should also change the reg list filtering in
copy_config_reg_indices() to use the host isa. And then this patch should
change to also use the host isa. Also, this patch is missing the reg list
filtering for zicbop, so it should be added too.

Thanks,
drew

> +			return -ENOENT;
> +		reg_val = riscv_cbop_block_size;
> +		break;
>  	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
>  		reg_val = vcpu->arch.mvendorid;
>  		break;
> @@ -347,6 +352,12 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  		if (reg_val != riscv_cboz_block_size)
>  			return -EINVAL;
>  		break;
> +	case KVM_REG_RISCV_CONFIG_REG(zicbop_block_size):
> +		if (!riscv_isa_extension_available(vcpu->arch.isa, ZICBOP))
> +			return -ENOENT;
> +		if (reg_val != riscv_cbop_block_size)
> +			return -EINVAL;
> +		break;
>  	case KVM_REG_RISCV_CONFIG_REG(mvendorid):
>  		if (reg_val == vcpu->arch.mvendorid)
>  			break;
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
