Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF69C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Oct 2022 13:39:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/nBk1Edp+tgiopAy4/9yJxdMLAmmLvZo49dfX3GqZE=; b=Cc/xkGsCVnfWf2
	aL3vEvzjMIx2I0loIfrEZC4v1z4EocSy7qKOr5thafClhtD+5Nfm3oPLF8o38KB2BuprsCVC/lkv0
	bsHE9BzSJs5QUQMsndoAyHzDFtyzx4x9lBa3ofeC2yW6jZ+7iy296GBJLpDN75tRop/VwZZgEb4vm
	Ik4SIRI5vrOvZMsDrRxBq+nWIhwRG164KWxDlNwV5hP//bPtSMGIV8XwrPM3H7nN5d4JSV0Y/LSzS
	zPwd8OqVoDXEjBN8mMcE94sMo9g5w3TqWw5iMpFlo4utqph9N3WyDmNmw4vDXeRYHf1NzhSzfiG15
	D1hFwqSWTpNckung9Q0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogR5W-002k2d-8S; Thu, 06 Oct 2022 13:38:58 +0000
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogR5T-002jyX-GQ
	for linux-riscv@lists.infradead.org; Thu, 06 Oct 2022 13:38:56 +0000
Received: by mail-ej1-x62f.google.com with SMTP id q9so106910ejd.0
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 06:38:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sUDJFwpi3D9p54FCGhtc/TJtBY99tL98QNMdHSax0Nw=;
        b=O4jzZcjYNcIZT7UDHuBzKPGPtHMrh/6Z5hwV4bb1unQUPxIovugk8H1NvFxz8iSEgv
         jSn3cjGLo/uuMLBVPmnzyT1cZzeUuETKt4B08tNhMFXnOij7PYbcWjZ+qJuHFpo6dbeE
         Kiz3226r6+pGi1kuDflonGZa2V7FZbD0ta/fc666m94jv/GnmjkavvLQIqUOR9F9BcUk
         K43LzAJtlxdyOMLuKmS5uFKAbhRytFx4Ynp8T7ErDikGMherBB6+UJHjsW2y/mRrhGtW
         Sc3cINu9Az9PFVPB56DjlQ6sU9KDyamomme3E6p54QnWpD9eXrw22RWJpPZgSv65dS9B
         m1bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sUDJFwpi3D9p54FCGhtc/TJtBY99tL98QNMdHSax0Nw=;
        b=6QPd5n6WstGYSs0e0zJ0hqKeEyYXmsOE8WVbiFq45mNVUt+TLLR/Q61qNgo+TOZmSw
         s/bp89tx82WxcZPu/bNL5RZKsKKI9drVReGukneQdCaFZoWIhEIVcekO5ACeZg2AG+pL
         YvmUZm9+Au5yxwVbYdjGuW/54kCUqNeJGH5eFqEssn3V+EwdadAMJA6R+Gq1fQhsgbw8
         rrxDhJkykFHkYt+ww0kkryuT2rtOCcQwqMPwbQGbpdc8d15dw1pTvUgfw3ghBi+dAIPe
         AmPsfMtDyaDmT5sBWw0bQvcw7QkohVXQKMBBaXcMiE3gHxAjsnp6vi3I7TFIiLQ7tSc7
         4RCA==
X-Gm-Message-State: ACrzQf0OIb1+aNeCkPzpCl0LcWgY/m7loV7YlOS3ew1oX4y31en+ARs4
	jutmGmP8ogs1Foa0/yhk+z5jZ30jzkRgMQ==
X-Google-Smtp-Source: AMsMyM4zztHFjkSy6dGW91nxRT6YpzNMD5p9mKeSvTg+RiDwHxlP/A3a0eV47w38Rix7Cny4p7qGng==
X-Received: by 2002:a17:907:2719:b0:782:b261:e9eb with SMTP id w25-20020a170907271900b00782b261e9ebmr4202845ejk.104.1665063531988;
        Thu, 06 Oct 2022 06:38:51 -0700 (PDT)
Received: from localhost (cst2-173-61.cust.vodafone.cz. [31.30.173.61])
        by smtp.gmail.com with ESMTPSA id oz35-20020a1709077da300b0073022b796a7sm10495703ejc.93.2022.10.06.06.38.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Oct 2022 06:38:51 -0700 (PDT)
Date: Thu, 6 Oct 2022 15:38:50 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 8/8] riscv: remove riscv_isa_ext_keys[] array and related
 usage
Message-ID: <20221006133850.vkmy466uuzliobjw@kamzik>
References: <20221006070818.3616-1-jszhang@kernel.org>
 <20221006070818.3616-9-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221006070818.3616-9-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_063855_568320_64155FEB 
X-CRM114-Status: GOOD (  19.76  )
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

On Thu, Oct 06, 2022 at 03:08:18PM +0800, Jisheng Zhang wrote:
> All users have switched to riscv_has_extension_*, removed unused
> definitions, vars and related setting code.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  arch/riscv/include/asm/hwcap.h | 28 ----------------------------
>  arch/riscv/kernel/cpufeature.c |  9 ---------

Nice stats :-)

>  2 files changed, 37 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 54b88ee6cae1..f52fbc121ebe 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -62,18 +62,6 @@ enum {
>  
>  extern unsigned long elf_hwcap;
>  
> -
> -/*
> - * This enum represents the logical ID for each RISC-V ISA extension static
> - * keys. We can use static key to optimize code path if some ISA extensions
> - * are available.
> - */
> -enum riscv_isa_ext_key {
> -	RISCV_ISA_EXT_KEY_FPU,		/* For 'F' and 'D' */
> -	RISCV_ISA_EXT_KEY_ZIHINTPAUSE,
> -	RISCV_ISA_EXT_KEY_MAX,
> -};
> -
>  struct riscv_isa_ext_data {
>  	/* Name of the extension displayed to userspace via /proc/cpuinfo */
>  	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
> @@ -81,22 +69,6 @@ struct riscv_isa_ext_data {
>  	unsigned int isa_ext_id;
>  };
>  
> -extern struct static_key_false riscv_isa_ext_keys[RISCV_ISA_EXT_KEY_MAX];
> -
> -static __always_inline int riscv_isa_ext2key(int num)
> -{
> -	switch (num) {
> -	case RISCV_ISA_EXT_f:
> -		return RISCV_ISA_EXT_KEY_FPU;
> -	case RISCV_ISA_EXT_d:
> -		return RISCV_ISA_EXT_KEY_FPU;
> -	case RISCV_ISA_EXT_ZIHINTPAUSE:
> -		return RISCV_ISA_EXT_KEY_ZIHINTPAUSE;
> -	default:
> -		return -EINVAL;
> -	}
> -}

Yay! One less extension mapping to track!

> -
>  static __always_inline bool
>  riscv_has_extension_likely(const unsigned long ext)
>  {
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 2b1f18f97253..6bc3fb749274 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -28,9 +28,6 @@ unsigned long elf_hwcap __read_mostly;
>  /* Host ISA bitmap */
>  static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  
> -DEFINE_STATIC_KEY_ARRAY_FALSE(riscv_isa_ext_keys, RISCV_ISA_EXT_KEY_MAX);
> -EXPORT_SYMBOL(riscv_isa_ext_keys);
> -
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -242,12 +239,6 @@ void __init riscv_fill_hwcap(void)
>  		if (elf_hwcap & BIT_MASK(i))
>  			print_str[j++] = (char)('a' + i);
>  	pr_info("riscv: ELF capabilities %s\n", print_str);
> -
> -	for_each_set_bit(i, riscv_isa, RISCV_ISA_EXT_MAX) {
> -		j = riscv_isa_ext2key(i);
> -		if (j >= 0)
> -			static_branch_enable(&riscv_isa_ext_keys[j]);
> -	}
>  }
>  
>  #ifdef CONFIG_RISCV_ALTERNATIVE
> -- 
> 2.37.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
