Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FBF8C001DC
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 12:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PfUw+UpZyO72JssvKqhnUVWpV1ZeogpB501jFK9i9s0=; b=4X++4qGnBcGMZY
	7enlTYkg0/nNYz5DLLpM57zGfrtFuEPbgfuNXqAzIxtgnm880qVjNKAhZ9VAgovG7gkmeIv3lWFID
	8bwF96z7wsV4OmX3thfbV7h8wJLfK8W+qk1E9oqgRv0DCdxlSwxrGcMZ2T5REj84wYfX8+sHR/Pn0
	TnscT7iMJcOtKe7dx5Q7yib6gwlg2fZtOx9zM+rFbvPLQjtyZdtfnHFcW0Aa0syWRuxtg9TQ1wIiu
	dhWCPnRqOJXo2ZAF63qHaGijmpWU9/yT7dBOOKCWucvHfoYaSleX28hI9wC6yMgCseiy0+7YoQthP
	0EL9ahXIA7yQ7BQ7TEog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSSf-00FdDr-2v;
	Mon, 31 Jul 2023 12:57:21 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQSSc-00Fd14-1V
	for linux-riscv@lists.infradead.org;
	Mon, 31 Jul 2023 12:57:19 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4fe21e7f3d1so4382534e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 31 Jul 2023 05:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1690808234; x=1691413034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RFhza85n34YdBGQ3np4adGOz+d7KJkgXl8a6XQ2Pqag=;
        b=erDK9JS6y/odZNp7MFqiC3ckDq18Ca7KxVQDGdN/6+yuEuwMa3AshB+5L9mkNa8fO2
         GU0TPg8BNT08GwRTZpPNHsv/5LXaqMm98sL7xNp74dGctl70MDRQPKk2QyI1640dvulm
         JVvt7o5KFizQ0ewetP+MaC/BYntC6BPcTvNreBOfokkp+WtjRABGGlsSzQtEO6xBUOea
         0utId7+hoKiyqFTvY9+sQ0J7YsXLo3xJX1cBDq+Z6Qex7rSgn9Gb51uFJN0vTQRu41SI
         GY2qQnDqb+6hOIe6aaAzdatfBgb+DZC1frG82OLxNnydI/ZvB9XqBxMwWzZe98+sckdG
         kY2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690808234; x=1691413034;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RFhza85n34YdBGQ3np4adGOz+d7KJkgXl8a6XQ2Pqag=;
        b=Bj7y82EbcEmS1IqbtbZO3nSccn3eRi558XNuafM4mieGOI56p9HbXmIXhd0Zv50fuf
         azEdcGcYGjItkYUHbijTtPhyf794EPLbpgO2m/IkaCqNip7HrgijhYdcYggbMjgRAVwl
         SDp3m2lbZzNdChT/95SuwepBAlesVlyvE7s+oDiyiZHjScIpv2lC32xQbJeMWvncCZ4M
         w2As4N0QkuK5vh0ojATtnsD2yAY0R7laBFtN2W1eEpf1DtvyF976LjxJBLiTEDQVtG9P
         B7VqUeVAdRiwiqB7Bt+kueKwCXD4ljaQp7NKCztrgn7z0mhMnkOyy0krreegoSNaEQCP
         RmYw==
X-Gm-Message-State: ABy/qLYfG2VyPUX+BoGxhlN4UGbYxo6s7GoIAFpnkx6t4v/x2o16cfxa
	EKnY0a1QthaucBKNT1NCpVzQ8A==
X-Google-Smtp-Source: APBJJlENWc7vvjXU8g36et3FnRv9uFXJFmcy0z1jxOVP2hZ1bVoYR79Vf2/YMrKCabfqfqdXvobgjA==
X-Received: by 2002:a05:6512:348f:b0:4fb:8616:7a03 with SMTP id v15-20020a056512348f00b004fb86167a03mr4974177lfr.4.1690808234457;
        Mon, 31 Jul 2023 05:57:14 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x4-20020aa7d6c4000000b0051e2cde9e3esm5454619edr.75.2023.07.31.05.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Jul 2023 05:57:13 -0700 (PDT)
Date: Mon, 31 Jul 2023 14:57:12 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Cc: kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	kvm@vger.kernel.org, anup@brainfault.org, atishp@atishpatra.org
Subject: Re: [PATCH 5/6] RISC-V: KVM: use EBUSY when
 !vcpu->arch.ran_atleast_once
Message-ID: <20230731-a4cd05af8a738c2d1fe8a120@orel>
References: <20230731120420.91007-1-dbarboza@ventanamicro.com>
 <20230731120420.91007-6-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230731120420.91007-6-dbarboza@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_055718_503775_BBA3043E 
X-CRM114-Status: GOOD (  19.15  )
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

On Mon, Jul 31, 2023 at 09:04:19AM -0300, Daniel Henrique Barboza wrote:
> vcpu_set_reg_config() and vcpu_set_reg_isa_ext() is throwing an
> EOPNOTSUPP error when !vcpu->arch.ran_atleast_once. In similar cases
> we're throwing an EBUSY error, like in mvendorid/marchid/mimpid
> set_reg().
> 
> EOPNOTSUPP has a conotation of finality. EBUSY is more adequate in this
> case since its a condition/error related to the vcpu lifecycle.
> 
> Change these EOPNOTSUPP instances to EBUSY.
> 
> Suggested-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
> ---
>  arch/riscv/kvm/vcpu_onereg.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kvm/vcpu_onereg.c b/arch/riscv/kvm/vcpu_onereg.c
> index 42bf01ab6a8f..07ce747620f9 100644
> --- a/arch/riscv/kvm/vcpu_onereg.c
> +++ b/arch/riscv/kvm/vcpu_onereg.c
> @@ -209,7 +209,7 @@ static int kvm_riscv_vcpu_set_reg_config(struct kvm_vcpu *vcpu,
>  			vcpu->arch.isa[0] = reg_val;
>  			kvm_riscv_vcpu_fp_reset(vcpu);
>  		} else {
> -			return -EOPNOTSUPP;
> +			return -EBUSY;
>  		}
>  		break;
>  	case KVM_REG_RISCV_CONFIG_REG(zicbom_block_size):
> @@ -477,7 +477,7 @@ static int riscv_vcpu_set_isa_ext_single(struct kvm_vcpu *vcpu,
>  			return -EINVAL;
>  		kvm_riscv_vcpu_fp_reset(vcpu);
>  	} else {
> -		return -EOPNOTSUPP;
> +		return -EBUSY;
>  	}

I think we should allow these ran_atleast_once type of registers to be
written when the value matches, as we now do for the other registers.
EBUSY should still be returned when the value doesn't match, though.

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
