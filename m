Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D03C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 17:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JunrYJC1I9qwJbVHQl0Puuo/S84ro55DFdMAbeRzrNw=; b=viJXN+Q6J8xo1y
	cE061TmbkqZDD5lUyVgg50AseYSEux3a4w4tLMyM9YwN7evMhEEnR4M4EgCRIQ87oFgZUKkSdAg57
	UrUHysNSbTHD83BDwCQd+wdcV0hKrPTZsJrK6QEnZ1dwsKkjhDVp6tO1tYyrvPrCmMWcUSc4QyLcj
	VGe/ccPMEdpYt0+BnBB+XobizVQ3SinOJnjYx+uQE8k3yAtFjegrJZzIEqN+R5mSR1k4V6JdHtxXP
	qGTvWxPH0pQL6hoG0blKf4T6AfBIW3IqZ4+3NhVY7llSJauY5hg18vGboykbYjAdo/TKlU8pYkj6b
	5lXGWSjnR349usWso89A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDStb-00FZnm-1G;
	Wed, 13 Dec 2023 17:19:43 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDStX-00FZmC-33
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 17:19:41 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40c32df9174so63766575e9.3
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 09:19:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702487978; x=1703092778; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W3BG24W610lJuKV/MW/fbLfcOspFMJtOeERiQaIiRWM=;
        b=J4tgbWqOqYqUnNBHoLZoy7bJeN7QqQoe3nVQa3t0yARyGpF9pl+KKEiGbM9niBUAa7
         flzHJipN37zrBEXhqlBt9Ev2PCUUoPW8OUJ/tFT7IQjT3xnYH0VVOIOl7GlWB5L+b5cV
         P9UgPsiNx3weWeoIzLtqdtcMzjQELaO7zBgVuVosbgeqZTqb84KiWTpEx6CAUGufWA9b
         pWmorx4TQQAw3JZJBb9VmV1rHJymWefuTFv3ZibRtIsQple3ZZ+ktIXqGtLExiij4P18
         o6GtCyYw7CFObT0nKwjLsRryQq5YkqRJ28iUoJY8NYMTlUARGZX92jWc2X2JerZnfrT+
         oelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702487978; x=1703092778;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W3BG24W610lJuKV/MW/fbLfcOspFMJtOeERiQaIiRWM=;
        b=iHtcIg4YQNg/LvrUUFl43lJkOgKhgok6i41Now558nl2hQUTEugl548ZTRveNJD/wd
         lYuGlfCLfjmFXP2Yudk4o3vNN2XilE5NgTbeDUL4K701IWa7wh+hnCQ29omQ3bnZZ5pu
         vXat7VamaFN9/qDtHilY34y+M+x6w4WRbHLubCbYtSqHkjqqwGzZy/npSz0T3jT73KBT
         NtySTltKu2uhEVgN/R6Vqi4PxNwQiZfXwkLV2h6J1TzTL/Wb8LMxqv2Ozrm6uknPNlzg
         zutLrJKBX7WHL1q8OaCEPua2+GnrXJWhrJDGcm+01Fdmu9PCV75NDMxgQSSTITmA7E7d
         lIbw==
X-Gm-Message-State: AOJu0Yxp0aH9MiMuAqar5eCcKAS+iB9C3NAMy6P3syxUbxZWMDksTs9O
	NKj4+pK4SBisudRwjhYM7K7VOQ==
X-Google-Smtp-Source: AGHT+IFLcGLrThHqoGdIdS0RECHOQeVt4478xU7EiOcPPKGKy3QIAr+KLDIgxCltoydbRPGDwIQ3TA==
X-Received: by 2002:a05:600c:4749:b0:40c:a11:19df with SMTP id w9-20020a05600c474900b0040c0a1119dfmr2878247wmo.180.1702487978245;
        Wed, 13 Dec 2023 09:19:38 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id r20-20020a05600c459400b0040b349c91acsm23318063wmo.16.2023.12.13.09.19.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 09:19:37 -0800 (PST)
Date: Wed, 13 Dec 2023 18:19:37 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, 
	Atish Patra <atishp@atishpatra.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Shuah Khan <shuah@kernel.org>, Anup Patel <anup@brainfault.org>, 
	devicetree@vger.kernel.org, kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 03/15] KVM: riscv: selftests: Add Zbc extension to
 get-reg-list test
Message-ID: <20231213-1082f104e8ba65ee3db6aa3a@orel>
References: <20231128145357.413321-1-apatel@ventanamicro.com>
 <20231128145357.413321-4-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231128145357.413321-4-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_091939_984935_70CB14D0 
X-CRM114-Status: GOOD (  13.95  )
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

On Tue, Nov 28, 2023 at 08:23:45PM +0530, Anup Patel wrote:
> The KVM RISC-V allows Zbc extension for Guest/VM so let us add
> this extension to get-reg-list test.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  tools/testing/selftests/kvm/riscv/get-reg-list.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/tools/testing/selftests/kvm/riscv/get-reg-list.c b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> index b6b4b6d7dacd..4b75b011f2d8 100644
> --- a/tools/testing/selftests/kvm/riscv/get-reg-list.c
> +++ b/tools/testing/selftests/kvm/riscv/get-reg-list.c
> @@ -44,6 +44,7 @@ bool filter_reg(__u64 reg)
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_SVPBMT:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBA:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBB:
> +	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBC:

Assuming this gets rebased on [1] then this line becomes

  case KVM_REG_RISCV_ISA_EXT | KVM_REG_RISCV_ISA_SINGLE | KVM_RISCV_ISA_EXT_ZBC:

[1] https://lore.kernel.org/linux-riscv/20231213170951.93453-8-ajones@ventanamicro.com/

>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZBS:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOM:
>  	case KVM_REG_RISCV_ISA_EXT | KVM_RISCV_ISA_EXT_ZICBOZ:
> @@ -361,6 +362,7 @@ static const char *isa_ext_id_to_str(const char *prefix, __u64 id)
>  		KVM_ISA_EXT_ARR(SVPBMT),
>  		KVM_ISA_EXT_ARR(ZBA),
>  		KVM_ISA_EXT_ARR(ZBB),
> +		KVM_ISA_EXT_ARR(ZBC),
>  		KVM_ISA_EXT_ARR(ZBS),
>  		KVM_ISA_EXT_ARR(ZICBOM),
>  		KVM_ISA_EXT_ARR(ZICBOZ),
> @@ -739,6 +741,7 @@ KVM_ISA_EXT_SIMPLE_CONFIG(svnapot, SVNAPOT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(svpbmt, SVPBMT);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zba, ZBA);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbb, ZBB);
> +KVM_ISA_EXT_SIMPLE_CONFIG(zbc, ZBC);
>  KVM_ISA_EXT_SIMPLE_CONFIG(zbs, ZBS);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicbom, ZICBOM);
>  KVM_ISA_EXT_SUBLIST_CONFIG(zicboz, ZICBOZ);
> @@ -761,6 +764,7 @@ struct vcpu_reg_list *vcpu_configs[] = {
>  	&config_svpbmt,
>  	&config_zba,
>  	&config_zbb,
> +	&config_zbc,
>  	&config_zbs,
>  	&config_zicbom,
>  	&config_zicboz,
> -- 
> 2.34.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
