Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EBEAC43334
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Jul 2022 08:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X7Y0mVKkaw69ukiNQ4LbTVLKis5Ib8HAHcVIteI1zMk=; b=MLRZ2RswuqOYDM
	yOeO2v6vb6tygNawqo9RZ+uEDZ1B/isVSJs3a9hTMb0Wd+WaqVyAcbRW3WARMhV9rWJV/+0Xh94SP
	1hOvc2sb2wGAqmpajSfGBG6O2q2SAy8uCmHlcdBmtW23iGZeD1uAwH4BP0/QN14VijnCYSMb2DjuC
	QnIUM4hEhLgWMpCImEiACd2j3IaRoaf1Ku0MfsHL8NAw4F7PMU9LtNR2WrPEHNgok9mV8KVwTPBQD
	i2FCR00zk7foghI0eFZxDqGePB2E+llQ8bj0w2Mg2ZI+MWSLGfmruNahJKUnuEudo6kh5r7x6DSvy
	g+ulkCA++Ujg/BkN0M7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jhY-002g78-Oz; Fri, 08 Jul 2022 08:51:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9jhW-002g42-NF
	for linux-riscv@lists.infradead.org; Fri, 08 Jul 2022 08:51:04 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o9jhQ-0003qp-19; Fri, 08 Jul 2022 10:50:56 +0200
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: palmer@rivosinc.com, linux-riscv@lists.infradead.org
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>, Guo Ren <guoren@kernel.org>, guoren@kernel.org
Subject: Re: [RFC PATCH 2/4] riscv: Cleanup ERRATA_THEAD_PBMT for rv32 svpbmt compile
Date: Fri, 08 Jul 2022 10:50:53 +0200
Message-ID: <3498257.R56niFO833@diego>
In-Reply-To: <20220705100523.1204595-3-guoren@kernel.org>
References: <20220705100523.1204595-1-guoren@kernel.org> <20220705100523.1204595-3-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220708_015102_809558_C2A007C3 
X-CRM114-Status: GOOD (  20.39  )
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

Hi Guo,

Am Dienstag, 5. Juli 2022, 12:05:21 CEST schrieb guoren@kernel.org:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> Make compile cleaner and don't reference the THEAD_PBMT data struct when
> CONFIG_ERRATA_THEAD_PBMT=y. Next, we could cleanly make svpbmt to
> support rv32.
> 
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> ---
>  arch/riscv/include/asm/errata_list.h | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
> index 416ead0f9a65..47175d91773d 100644
> --- a/arch/riscv/include/asm/errata_list.h
> +++ b/arch/riscv/include/asm/errata_list.h
> @@ -47,6 +47,8 @@ asm(ALTERNATIVE("sfence.vma %0", "sfence.vma", SIFIVE_VENDOR_ID,	\
>   * in the default case.
>   */
>  #define ALT_SVPBMT_SHIFT 61
> +
> +#ifdef CONFIG_ERRATA_THEAD_PBMT

I don't really think that is necessary and actually makes the code
more complex than needed.

Each alternative-entry already has the dependency on
CONFIG_* ... i.e. CONFIG_RISCV_ISA_SVPBMT and CONFIG_ERRATA_THEAD_PBMT

When you look at alternative-macros.h you'll see this translating to the
enable argument in ALT_NEW_CONTENT.

So only when that is active is the alternative section added to the build.
I.e. that translates to:

	.if IS_ENABLED(CONFIG_ERRATA_THEAD_PBMT)
	.pushsection .alternative, "a"
	...

So when CONFIG_ERRATA_THEAD_PBMT is disabled the whole alternative
part never gets added already, so there shouldn't be any need to make the
source more complicated.


Heiko

>  #define ALT_THEAD_PBMT_SHIFT 59
>  #define ALT_SVPBMT(_val, prot)						\
>  asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
> @@ -60,7 +62,6 @@ asm(ALTERNATIVE_2("li %0, 0\t\nnop",					\
>  		  "I"(ALT_SVPBMT_SHIFT),				\
>  		  "I"(ALT_THEAD_PBMT_SHIFT))
>  
> -#ifdef CONFIG_ERRATA_THEAD_PBMT
>  /*
>   * IO/NOCACHE memory types are handled together with svpbmt,
>   * so on T-Head chips, check if no other memory type is set,
> @@ -90,6 +91,14 @@ asm volatile(ALTERNATIVE(						\
>  	  "I"(ALT_THEAD_PBMT_SHIFT)					\
>  	: "t3")
>  #else
> +#define ALT_SVPBMT(_val, prot)						\
> +asm(ALTERNATIVE("li %0, 0\t\nnop",					\
> +		 "li %0, %1\t\nslli %0,%0,%2", 0,			\
> +			CPUFEATURE_SVPBMT, CONFIG_RISCV_ISA_SVPBMT)	\
> +		: "=r"(_val)						\
> +		: "I"(prot##_SVPBMT >> ALT_SVPBMT_SHIFT),		\
> +		  "I"(ALT_SVPBMT_SHIFT))
> +
>  #define ALT_THEAD_PMA(_val)
>  #endif
>  
> 





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
