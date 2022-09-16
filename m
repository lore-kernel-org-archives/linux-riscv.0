Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A33EECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 07:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U/gMOec+GRFCNfzhYKs9kdwpevgG2ehQKOuuod3gvrU=; b=m0hc3lp+t0cNto
	mfZLr/3LsffMscVclLBf+tuPwmlO42tQ45ZB84gMlhARRHkpp1vrRDke9Fw1CJiSz3i6Ao53iu6w8
	7OwM4bijydsT1X8qn2uhsfUnDRdQSHxnVzawFkreY3nw5KQ4jygaAa8vJCkqMX4pqFIG12CfkkNi/
	dP14taVKJGhKCiVzufRIhl/SqIeR8LSpTNrxEcl7K2m0+BD5botbOQpEN0MRwFSfihvIdfjmwKaFI
	sAKdsQ/2oK8zcgl7L7ve+tVF6CkM7K+FSDYVpNK4MvZ/m+wn072th8aWlYLtHRL4n46s7T+98QcOD
	WGhdiNO4V5j2z6Hntttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ5pr-009ypu-QS; Fri, 16 Sep 2022 07:32:27 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ5po-009yjM-Qh
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 07:32:26 +0000
Received: by mail-wr1-x436.google.com with SMTP id e16so34569640wrx.7
        for <linux-riscv@lists.infradead.org>; Fri, 16 Sep 2022 00:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=CQ6S4i3OcSHvZ8/Sf/ufdbIn+e+c0M19OQiY0FbyOLU=;
        b=FDz85kubD8ENWiVtjJ7YjW81kq7TZ58WBPNnegEAqMGaDTJ3IpY/j3cxnOGfhyojI9
         qi34oOtmAiNnQJsMfGNWEEbiYPtXFNTPXlGfxExOPKjIR7VgjZaL/jiWTgMOIQpi1sMZ
         A0ToAQQ/0HnCBqjZIjucwdWMNxF6fN3sYBxEnZuYnlYgqKVpFiFrhEHDek27860U/emQ
         hmuKKEFA/GkN6GNbAnS0/7dOWuQ8n7tAFblCw2uo2p1M+K4M99w3YF9MTseYYR4eXoCG
         stHo5byL0tSwkAOV0Sekt38BLuDp8ynwJ0T1YRDRVyYVadxXtNxez0As4OKu4bHtlsFm
         IpiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=CQ6S4i3OcSHvZ8/Sf/ufdbIn+e+c0M19OQiY0FbyOLU=;
        b=tBrWVMiTXdLa6+F7kDdXnEjYqUmkN5JViYqt2opBKfRx4eGOgCIyw1FlpwfYLyYuNF
         D4eLOl6g7bKKA8+7lbihi+1eXpuwivaC4UlZXhTHD0kitwxR4OHtGQONq/7KCRPuu3DP
         Q9GCAfwW2SOCwX0YGsMv1BwU2yzHGI6muQ9JVZlrxhSf0JVVSXVguIq49heLXXi4yrus
         L4++PP9kksKHOsfDJjd9/yUgMchFiHXkcCBqKstUnyEVPQccewYNiKzbXhv6EE6BaEwz
         lXl6BpJQcw/X5tjWWQRtA4mHonYM+5ZhvbWlZmrRKDGWd2UH+nNM24L6sx/t3sVXNvAe
         8fmg==
X-Gm-Message-State: ACrzQf1j86VnaHwUDg/0L8Kw3CDk0eQTvmFvQBTUx1GlrB7y2UadcO1w
	HYoG4qOO8GamrXV0kiE3t1Yl9A==
X-Google-Smtp-Source: AMsMyM6PY0064czUc5ygPI2lVgEmSyCL5C7OYdJYekJ9VpLcYNA+PVPGFhTgCCBQzaUBS0GUSSVZ7Q==
X-Received: by 2002:adf:d1c9:0:b0:225:f98:d602 with SMTP id b9-20020adfd1c9000000b002250f98d602mr1934494wrd.419.1663313537994;
        Fri, 16 Sep 2022 00:32:17 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id r17-20020a05600c425100b003a62400724bsm1480080wmm.0.2022.09.16.00.32.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Sep 2022 00:32:17 -0700 (PDT)
Date: Fri, 16 Sep 2022 09:32:16 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>,
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1] RISC-V: KVM: Allow Guest use Zihintpause extension
Message-ID: <20220916073216.l2mm6ydq2asf7ogd@kamzik>
References: <20220916054637.24133-1-mchitale@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220916054637.24133-1-mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_003224_933787_72490AD0 
X-CRM114-Status: GOOD (  14.17  )
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

On Fri, Sep 16, 2022 at 11:16:37AM +0530, Mayuresh Chitale wrote:
> We should advertise Zihintpause ISA extension to KVM user-space whenever
> host supports it. This will allow KVM user-space (i.e. QEMU or KVMTOOL)
> to pass on this information to Guest via ISA string.
> 
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> ---

Applies to riscv_kvm_queue.

>  arch/riscv/include/uapi/asm/kvm.h | 1 +
>  arch/riscv/kvm/vcpu.c             | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
> index b6770ee08872..9085b90cf324 100644
> --- a/arch/riscv/include/uapi/asm/kvm.h
> +++ b/arch/riscv/include/uapi/asm/kvm.h
> @@ -99,6 +99,7 @@ enum KVM_RISCV_ISA_EXT_ID {
>  	KVM_RISCV_ISA_EXT_SVPBMT,
>  	KVM_RISCV_ISA_EXT_SSTC,
>  	KVM_RISCV_ISA_EXT_SVINVAL,
> +	KVM_RISCV_ISA_EXT_ZIHINTPAUSE,
>  	KVM_RISCV_ISA_EXT_MAX,
>  };
>  
> diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
> index 901bb5c0cb50..0de0dd22e734 100644
> --- a/arch/riscv/kvm/vcpu.c
> +++ b/arch/riscv/kvm/vcpu.c
> @@ -54,6 +54,7 @@ static const unsigned long kvm_isa_ext_arr[] = {
>  	RISCV_ISA_EXT_SVPBMT,
>  	RISCV_ISA_EXT_SSTC,
>  	RISCV_ISA_EXT_SVINVAL,
> +	RISCV_ISA_EXT_ZIHINTPAUSE,
>  };
>  
>  static unsigned long kvm_riscv_vcpu_base2isa_ext(unsigned long base_ext)
> @@ -89,6 +90,7 @@ static bool kvm_riscv_vcpu_isa_disable_allowed(unsigned long ext)
>  	case KVM_RISCV_ISA_EXT_M:
>  	case KVM_RISCV_ISA_EXT_SSTC:
>  	case KVM_RISCV_ISA_EXT_SVINVAL:
> +	case KVM_RISCV_ISA_EXT_ZIHINTPAUSE:
>  		return false;
>  	default:
>  		break;
> -- 
> 2.34.1
> 
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
