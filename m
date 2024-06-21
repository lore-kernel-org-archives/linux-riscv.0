Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51510C27C4F
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 08:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KO7dZmn3wp0k3BcW5jT7OIhdJmw4SgZE6OEWHxgTgos=; b=Qwv9IshSzxOYCb
	lI7foc0XPFKphMMYKatLOKfLYD34a4Zw8cNoJOFKZbpHBHH0BEduqqnW7gWbdu1JDwQKiRiPPCFxR
	BUXcP5RxnY9rWx3sCXIPKJH7hPpUmMWpbFcZ/6sOvyFrbNyKsUjfxlcyI9niUGMmr6r+LBZBSeBhZ
	dB9nb5QBiNFZHIHdSNd+7FobRJzzjlQPixKsqZNikX7+D/mlQicDsa7NxERRX/VppdUBU/ZUTtF8o
	Rc4DHjQHuSToB9NMpYp/A17pRp2YFGlu3sqiqm4ndwJu3xjcIRJDQiU/L8oW7KF/ht7+xhNYaJYi6
	ZahLDPsjYTOh7cT2RRkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKa0O-00000008QM3-1XHh;
	Fri, 21 Jun 2024 08:52:24 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKa0K-00000008QK4-0U26
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 08:52:21 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-57d203d4682so2146604a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 01:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1718959938; x=1719564738; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ukPXaU0glvKU/7I3AqPS9+256PDmrqJDsAc1cKI4X+E=;
        b=eyFx5ec6YIdMF0AR6h9OeYPu07ujmh6AzeRHV+sQF/Dejug5sii850RraybqTBuAdp
         r5VAhTPbkJDkB5bxVcAkYw5B6YhEjzbPI71U9IFtSlkeRpY2X4MA35MDcftC8Ng1IEx6
         O6nSN3weGLXbkQUUGteKuzWGMtXdXJ9qGJpG2tu3BN+pSaXmEWvw0NjxVMMFbap3gcAt
         QSkqxStVoz4cSaSzjAEMWTHLknTpyB/Kuym2jZolPnUIyR2m0DIJkIjiUM3TblLPTiwC
         quaI/zRg9ftd/dcXDMA8Hmm5jB9EqibSHcWDVLNWYh+MIraZgxKOiuF00eL/xUE1bipH
         1SBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718959938; x=1719564738;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ukPXaU0glvKU/7I3AqPS9+256PDmrqJDsAc1cKI4X+E=;
        b=KjTItqWcOfHqNy8rPCC611EaUl3RftkMmPhhaqBkX+Sx3I0oREt5unyozA1FnjQLBE
         CrSLxHVmfQ8polnnl1i0Q1eN9DqWncFtDB/VTodC6BDuRd6ClaTux7BG1B+gaw6ZBtJp
         G+S/wac9vwh0ISG9e31nRBPEkG/OyvWq7bJL8A6gYsCrUi5rTuSg079/+bKdSJA5lfzD
         izkqMSyuEU9B8z+67spbzSbLw8q7TQ4cGzl0AuVatZSlvCNnBIKvIYgLowUs13LuMDqf
         xkNXl7BowciAJzZiMOVFKfmGYuvPNWhIvGkoNlZMDYoABccMBC6xYYUJqCNKvL8jqqsK
         fo2w==
X-Forwarded-Encrypted: i=1; AJvYcCXFaB2wuWj1sNRvV8dCX1AqCTMuA3rpS0GgbkCHeTAOdsXwnj6YUzoGGIXHJMsuXgg+iwBnopmLzCxgZfnEyLkBJSfp/ID1XuBrnJ0nyOot
X-Gm-Message-State: AOJu0YxMa8hQMjD7tV5EuNSwJCC7SLuLtMxVhbhOecz6qlzOoXLsb+0d
	rUnZHMuFmGIbeV2ErLhRyMkts9lcClKZKP6W4+SLtBSDDR4ubULZE/ZSAK3GbMo=
X-Google-Smtp-Source: AGHT+IEOv3FuOP7yCRAQOMLITeYFGmCeSmvpsPwwBR+OGalAkovKxddKBE/uIo2uXeSYC7CiBt7kXA==
X-Received: by 2002:a50:ed07:0:b0:57c:bf3b:76f5 with SMTP id 4fb4d7f45d1cf-57d07edce7amr5090452a12.35.1718959937580;
        Fri, 21 Jun 2024 01:52:17 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-57d30535010sm630961a12.59.2024.06.21.01.52.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Jun 2024 01:52:17 -0700 (PDT)
Date: Fri, 21 Jun 2024 10:52:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	kvm-riscv@lists.infradead.org, kvm@vger.kernel.org, apatel@ventanamicro.com, alex@ghiti.fr, 
	greentime.hu@sifive.com, vincent.chen@sifive.com, Anup Patel <anup@brainfault.org>, 
	Atish Patra <atishp@atishpatra.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v5 3/4] RISC-V: KVM: Add Svade and Svadu Extensions
 Support for Guest/VM
Message-ID: <20240621-2c3ffd345cba1317bc0f5f9d@orel>
References: <20240605121512.32083-1-yongxuan.wang@sifive.com>
 <20240605121512.32083-4-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240605121512.32083-4-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_015220_198845_13A2FAC3 
X-CRM114-Status: GOOD (  18.01  )
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

On Wed, Jun 05, 2024 at 08:15:09PM GMT, Yong-Xuan Wang wrote:
> We extend the KVM ISA extension ONE_REG interface to allow VMM tools to
> detect and enable Svade and Svadu extensions for Guest/VM. Since the
> henvcfg.ADUE is read-only zero if the menvcfg.ADUE is zero, the Svadu
> extension is available for Guest/VM only when arch_has_hw_pte_young()
> is true.
> 
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/include/uapi/asm/kvm.h | 2 ++
>  arch/riscv/kvm/vcpu.c             | 6 ++++++
>  arch/riscv/kvm/vcpu_onereg.c      | 6 ++++++
>  3 files changed, 14 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index e878e7cc3978..a5e0c35d7e9a 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -168,6 +168,8 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_ZTSO,
>  	KVM_RISCV_ISA_EXT_ZACAS,
>  	KVM_RISCV_ISA_EXT_SSCOFPMF,
> +	KVM_RISCV_ISA_EXT_SVADE,
> +	KVM_RISCV_ISA_EXT_SVADU,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 17e21df36cc1..21edd60c4756 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -540,6 +540,12 @@ static void kvm_riscv_vcpu_setup_config(struct kvm_vcpu *vcpu)
>  	if (riscv_isa_extension_available(isa, ZICBOZ))
>  		cfg->henvcfg |= ENVCFG_CBZE;
>  
> +	if (riscv_isa_extension_available(isa, SVADU))
> +		cfg->henvcfg |= ENVCFG_ADUE;
> +
> +	if (riscv_isa_extension_available(isa, SVADE))
> +		cfg->henvcfg &= ~ENVCFG_ADUE;

nit: I'd write this as

	if (!riscv_isa_extension_available(isa, SVADE) &&
	    riscv_isa_extension_available(isa, SVADU))
		cfg->henvcfg |= ENVCFG_ADUE;

> +
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SMSTATEEN)) {
>  		cfg->hstateen0 |= SMSTATEEN0_HSENVCFG;
>  		if (riscv_isa_extension_available(isa, SSAIA))
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index c676275ea0a0..06e930f1e206 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -15,6 +15,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
>  #include <asm/kvm_vcpu_vector.h>
> +#include <asm/pgtable.h>
>  #include <asm/vector.h>
>  
>  #define KVM_RISCV_BASE_ISA_MASK		GENMASK(25, 0)
> @@ -38,6 +39,8 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	KVM_ISA_EXT_ARR(SSAIA),
>  	KVM_ISA_EXT_ARR(SSCOFPMF),
>  	KVM_ISA_EXT_ARR(SSTC),
> +	KVM_ISA_EXT_ARR(SVADE),
> +	KVM_ISA_EXT_ARR(SVADU),
>  	KVM_ISA_EXT_ARR(SVINVAL),
>  	KVM_ISA_EXT_ARR(SVNAPOT),
>  	KVM_ISA_EXT_ARR(SVPBMT),
> @@ -105,6 +108,9 @@ static bool kvm_riscv_vcpu_isa_enable_allowed(unsigned long ext)
>  		return __riscv_isa_extension_available(NULL, RISCV_ISA_EXT_SSAIA);
>  	case KVM_RISCV_ISA_EXT_V:
>  		return riscv_v_vstate_ctrl_user_allowed();
> +	case KVM_RISCV_ISA_EXT_SVADU:
> +		/* The henvcfg.ADUE is read-only zero if menvcfg.ADUE is zero. */
> +		return arch_has_hw_pte_young();
>  	default:
>  		break;
>  	}
> -- 
> 2.17.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
