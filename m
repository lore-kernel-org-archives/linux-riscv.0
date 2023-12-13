Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D852C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 14:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hI8ge69rADwZeew2xvKzHAUESfiKvHyBQ5ExInlXkzc=; b=zoMN3bGm140x4M
	nYyHNj419m0ho4fZsqP4zGp5fLt0MnElcXuFBvEgq7Q/AUshzA9OyAr7dM5Y0dExxDXWXyu04HyaO
	+dxg6vLZtTWQN0AiwMEKLhIzu6kt6BX07NCx+j7LrfglxuaV8utINFB44kJQtyfCOwoVD3ZYjZjlP
	/RhtdhbZhkCFJXNYCMpzwc4mHfAi+SNmIbNThjHYsOsNIgbmA7YVZn13lCvu918YtnPaof/fl5PC8
	bZTsfeOmFpAwLcPgMS8AADPGwoovGx6diM9p44TzDQM7uuGFetfN7/FgGecPFPQIQ4KIVV26QpnKs
	77SUMJeyMIc9NKqcfpXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQcG-00F6Tk-1V;
	Wed, 13 Dec 2023 14:53:40 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDQcE-00F6T6-08
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 14:53:39 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-3333224c7b9so5985395f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 13 Dec 2023 06:53:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1702479216; x=1703084016; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AhlOkscoUfjpVGzLbSN2huPD+4bK2j9Udj5/KiwJMTU=;
        b=AAKq3FBH0eZW7ocdhLG7JyoxgP6bcfDbdtXDtZ6bSKCGfT0nZMIgmPLCJ12cYRbt5s
         C52wj3YNTXDEWg0/sS5Ed5RsGxkRAAzUROKSwXIa/cl8rxS0vSk+eFGH0C6goAf7LP92
         Cd4/amAU6NiZslzt3o0xLpIUMKAq+CGMAnwE8vIAbpLCReINJF1UY+1gT8aREuemhQ7c
         MNubxAsD1nkxbiAEWQWcL0JA+RMDm+lhcL8ncawSytxnsEgD4984nfCJPButFPi0cARp
         b7pT6pKRCTyEr85MWU+NEPBwuU0R+RdFcF8qSxOzrrbpDHSFgl3IvTiLk4qvKiX3K/W3
         8IvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702479216; x=1703084016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AhlOkscoUfjpVGzLbSN2huPD+4bK2j9Udj5/KiwJMTU=;
        b=UnKvcAaTfM67vHjpRmCaJuNAgdb/HHlQF44xnxwdPXthu5bJoPrZEXsCJixtQxfhWa
         nN1rUDC6rGkMXz+AwuiRPaxHAlTgoDned1GVsGx+3yLkYMeCl+mgzOJcdBx58Gq/zZAA
         m4hhkcxBkfO3z3cd/R7x7YEg0Q1O+ZBhdLRLy4tqCFGFeFAGedfOd7g7XAZ/S7Yp4O7l
         ZhiUMEuIEswY9iAwPrDT8exvz8aKOsRzJ57urTbAjofEUD8moO9VOFYw4xN1Oz+9jIXZ
         Hy8bvdmds/GNwdQXk9ktoddb/27J3PL9f2gTWkxzyfGntB5uAqrYb4ZMpkmWp8KTylm4
         fF0g==
X-Gm-Message-State: AOJu0Yxd2Q3g8ZZDCiGLEpb8Y7bj64GR3nRgX/1U3f3wBhFR7QmYAAIf
	tk++EtrY6n2wis7lmczS84P7tw==
X-Google-Smtp-Source: AGHT+IFJaHAGSF4+C+q14MpFvBK1EjMX0mkGLB00ScBYwZtJnyS3hfOb1jvveNLZlYXxoeDIuOj4CQ==
X-Received: by 2002:adf:ebd0:0:b0:333:4fd1:1c6d with SMTP id v16-20020adfebd0000000b003334fd11c6dmr4089376wrn.31.1702479215933;
        Wed, 13 Dec 2023 06:53:35 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k14-20020a5d524e000000b00333479734a7sm13480574wrc.99.2023.12.13.06.53.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Dec 2023 06:53:35 -0800 (PST)
Date: Wed, 13 Dec 2023 15:53:34 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Yong-Xuan Wang <yongxuan.wang@sifive.com>
Subject: Re: [PATCH v3 1/4] RISC-V: Detect and Enable Svadu Extension Support
Message-ID: <20231213-0160e1e392ad2172c27807c2@orel>
References: <20231102120129.11261-1-yongxuan.wang@sifive.com>
 <20231102120129.11261-2-yongxuan.wang@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231102120129.11261-2-yongxuan.wang@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_065338_086949_D1CB1232 
X-CRM114-Status: GOOD (  18.83  )
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
Cc: Heiko Stuebner <heiko@sntech.de>, Kemeng Shi <shikemeng@huaweicloud.com>, Daniel Henrique Barboza <dbarboza@ventanamicro.com>, conor.dooley@microchip.com, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Qinglin Pan <panqinglin2020@iscas.ac.cn>, linux-riscv@lists.infradead.org, alex@ghiti.fr, David Hildenbrand <david@redhat.com>, "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, tjytimi@163.com, greentime.hu@sifive.com, Sergey Matyukevich <sergey.matyukevich@syntacore.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, Charlie Jenkins <charlie@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, linux-kernel@vger.kernel.org, vincent.chen@sifive.com, Evan Green <evan@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>, kvm-riscv@lists.infradead.org, Andrew Morton <akpm@linux-foundation.org>, Rick Edgecombe <rick.p.edgecombe@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Nov 02, 2023 at 12:01:22PM +0000, Yong-Xuan Wang wrote:
> Svadu is a RISC-V extension for hardware updating of PTE A/D bits.
> 
> In this patch we detect Svadu extension support from DTB and
> add arch_has_hw_pte_young() to enable optimization in MGLRU and
> __wp_page_copy_user() if Svadu extension is available.
> 
> Co-developed-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>
> Signed-off-by: Yong-Xuan Wang <yongxuan.wang@sifive.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/include/asm/csr.h     | 1 +
>  arch/riscv/include/asm/hwcap.h   | 1 +
>  arch/riscv/include/asm/pgtable.h | 6 ++++++
>  arch/riscv/kernel/cpufeature.c   | 1 +
>  4 files changed, 9 insertions(+)
> 
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index 777cb8299551..e6935fd48c0c 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -194,6 +194,7 @@
>  /* xENVCFG flags */
>  #define ENVCFG_STCE			(_AC(1, ULL) << 63)
>  #define ENVCFG_PBMTE			(_AC(1, ULL) << 62)
> +#define ENVCFG_ADUE			(_AC(1, ULL) << 61)
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
