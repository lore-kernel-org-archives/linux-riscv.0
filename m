Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ACECE80A9A
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 07:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cFXqdZ8ar+lKuTymWT+yXtVC/BpMhS+l3gmwYRi/ZFM=; b=WbKjLdw2l893uf
	P02HX50zetje0C+yqtw7FTN6Jq0jxFSoEJe9TVU65gQEi2JsWri/rzpgCYYNRBJWseFACHQRV4+iX
	4sKu5zG+0DXnI0MPTd6NjV0QXyfHfv1dMYFAz2HvlUbD4lAgzASBt7YLnVKNuvjH/3wcmZcRl8ifA
	q4GFNBAaL8+jdXtLyhCGAGDLNFW7i4DTpP4wHNFt8aAIsuh+KC2ixpEEqfWzsipMH7X/EQcLv1YPS
	d4Bbsvk59QDUtrzQQZUL6cHaOyo3zfqd8O8e0cCBPBZicietN4ysH/taXPmXMlJ8A52piZRV1JJ5a
	HEC4HWTqOe75o0V0tlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOaH-0008xj-2h;
	Wed, 27 Sep 2023 07:03:45 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlOaF-0008wR-0B
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 07:03:44 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-5346b64f17aso3353245a12.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 00:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695798220; x=1696403020; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=abujtVG6p0xZNC8A7dBvKw/44lCK9FG1V8Q7D6GoWec=;
        b=egQIIZI1thScotxV4Rp0d+yE8H9zL2LtX2bMjGpWQSESMZzkCqewmGRkxZFEtQQgGS
         FifaAQETY5hTisUb109xpAorpoZYgvRo+eGXx2uob+jziEi9P1wx9kR0q0aVnVgF6USm
         3JDv3JtTCN7HsHtTIUkfxaiCejofj+nf6psG9EvD3527eqkVsnCIWzAbZtC6wPexBK+u
         W7AyzHRSU/ktSPXK5PfI4PnnrVyS18qngKSE+v0UAItHrrtGQM8PbU5zmQ9RXeZLDwq0
         PC7gF39lam0/+BppvxkJGL1CImNrzf1ra/LtTw1fhc2vc9kcFYLsBgLRJSZUH6MipdVM
         joDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695798220; x=1696403020;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=abujtVG6p0xZNC8A7dBvKw/44lCK9FG1V8Q7D6GoWec=;
        b=T5ISRINfSaR3AmThZg4IY/zkmDo1xFla4Cqms33ZQJDQNqRGamuRLAmVI/MscOfO9T
         estE8dqo/USUthSKb7sjr3PR8RyrRWHKjlwZtVZyT/2rTJ4Wy4OsMQHG3jDpCs965lzZ
         Uq9GqtM7zkIfjbE5jr0iG+CKQDXg7+hu8jKwAuJjs5sxDiw7WSYluhwar/fXv5pfcbd4
         YOc9tT58vxBup9kBDiQgZvsm4VHtwXd6amZTc7SMXlN6mQ+XAznOEi/c6nmRXDtbphaj
         EmLsHGP1R6XCUCbgNqsYOixp1nizm2xkBYDSfxutFQYQqzpvg9S1eMWof0HdB43nga1l
         Tt+g==
X-Gm-Message-State: AOJu0YzrdLYwdMBbian22B1NiVoBVG/KJxuC/wD2BvnHn4qtvVsXZwoR
	OC8ic+myDPAlJcTztqxPeh4AZg==
X-Google-Smtp-Source: AGHT+IH8VW5TdXtmFHV3864zObtC+fVmQP9NlxTvcQk4+iFSRrMMkuD0mYj2kUeikFz+QLPU2Yu/1g==
X-Received: by 2002:a05:6402:1b1b:b0:530:f74d:f4ab with SMTP id by27-20020a0564021b1b00b00530f74df4abmr1093293edb.11.1695798220413;
        Wed, 27 Sep 2023 00:03:40 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id a25-20020aa7d759000000b0051dd19d6d6esm7749118eds.73.2023.09.27.00.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 00:03:39 -0700 (PDT)
Date: Wed, 27 Sep 2023 09:03:38 +0200
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH v2 1/3] RISC-V: Detect and Enable Svadu Extension Support
Message-ID: <20230927-62fbd3d63f4c6ffada90b7ee@orel>
References: <20230922085701.3164-1-yongxuan.wang@sifive.com>
 <20230922085701.3164-2-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230922085701.3164-2-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_000343_092101_2C50FF40 
X-CRM114-Status: GOOD (  18.67  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, wchen <waylingii@gmail.com>, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Sep 22, 2023 at 08:56:47AM +0000, Yong-Xuan Wang wrote:
> We detect Svadu extension support from DTB and add arch_has_hw_pte_young()
> to enable optimization in MGLRU and __wp_page_copy_user() if Svadu
> extension is available.
> 
> Co-developed-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> ---
>  arch/riscv/include/asm/csr.h     | 1 +
>  arch/riscv/include/asm/hwcap.h   | 1 +
>  arch/riscv/include/asm/pgtable.h | 6 ++++++
>  arch/riscv/kernel/cpufeature.c   | 1 +
>  4 files changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 777cb8299551..10648b372a2a 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -194,6 +194,7 @@
>  /* xENVCFG flags */
>  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> +#define ENVCFG_HADE			(_AC(1, ULL) << 61)

This bit is named 'ADUE' in the spec. Why are we calling it HADE?

>  #define ENVCFG_CBZE			(_AC(1, UL) << 7)
>  #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
>  #define ENVCFG_CBIE_SHIFT		4
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index b7b58258f6c7..1013661d6516 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -58,6 +58,7 @@
>  #define RISCV_ISA_EXT_ZICSR		40
>  #define RISCV_ISA_EXT_ZIFENCEI		41
>  #define RISCV_ISA_EXT_ZIHPM		42
> +#define RISCV_ISA_EXT_SVADU		43
>  
>  #define RISCV_ISA_EXT_MAX		64
>  
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index b2ba3f79cfe9..028b700cd27b 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -629,6 +629,12 @@ static inline pgprot_t pgprot_writecombine(pgprot_t _prot)
>  	return __pgprot(prot);
>  }
>  
> +#define arch_has_hw_pte_young arch_has_hw_pte_young
> +static inline bool arch_has_hw_pte_young(void)
> +{
> +	return riscv_has_extension_unlikely(RISCV_ISA_EXT_SVADU);
> +}
> +
>  /*
>   * THP functions
>   */
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index 1cfbba65d11a..ead378c04991 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -178,6 +178,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
>  	__RISCV_ISA_EXT_DATA(ssaia, RISCV_ISA_EXT_SSAIA),
>  	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
>  	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
> +	__RISCV_ISA_EXT_DATA(svadu, RISCV_ISA_EXT_SVADU),
>  	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
>  	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
>  	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
> -- 
> 2.17.1
>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
