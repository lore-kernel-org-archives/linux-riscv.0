Return-Path: <SRS0=/0GP=II=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97E2DC433E0
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3DF264FEF
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Mar 2021 04:40:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3DF264FEF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=lylIWH8c0xRXF3GZFvRxMAEDbNiX/CwNSyIQAs9WYBc=; b=fiWnk0PNn2gr6KN2C9gYLQnI4
	AkjkDbV9aUsuEYv2cOfLE+yL0OeMKcYc9OTFZL34DwVXP+xbCWmXdkkMR4FmEeK5BtAr0NQOkEDKH
	1WxH7EyHaxdHOwOasJiB3A97HOWe8PjweWrCpcFKH/h5KcMudy/N6FTVWUjo5RdH9/HEKL8WFV3iQ
	hezlv9F59lHD8D3J48Y9h/YKQ2d/TKg0ejxmX+whE0dJWs3QqeH2DDHqnffie+XQB3jxvHjZHvGhO
	O4swazmr+oZOyIjFozxu1NDEqRNtCXlRK457ESA5sCZ9JnlS5KVpJjtkWo14sTpNqdBWI489roeDH
	2YR4GMmng==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lJqdM-0060do-Q4; Wed, 10 Mar 2021 04:39:44 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lJqcs-0060Zy-Lu
 for linux-riscv@lists.infradead.org; Wed, 10 Mar 2021 04:39:19 +0000
Received: by mail-pl1-x62b.google.com with SMTP id c16so7870202ply.0
 for <linux-riscv@lists.infradead.org>; Tue, 09 Mar 2021 20:39:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6pvTeopMKfMzpOHniPqNbn4Xb8JVpmpRQHVDJ/FMFSs=;
 b=BolWxSsOr9u11lbeuvWSrObCwnH9P/Thh2e7ozTwGAHXuuaUoR5VjWA+i8cBxQD8K6
 gh8v8G3a9yXR79wnXK/BNT2laLdsZvWGMLfFzLL/eTX61lEvFF1r1KMOlF6LPCd/5ow5
 7xvTVOm0rXEnAimnYtkUrBcHLteGs3djFBBuPdPcgik90SqVvRs9/NTb9Il91Y2bIZBc
 Tqg0aTvljabsl68LNht4j7GLt+g5083HxGLm1Ix6GhgsBuLmH+aeQIxKnqOTE14upMoD
 m2LvoVWLyvFmEACN0LzK4/m79lIYTxbFkA4j4YBaOFGF/2bZ/4KBCgKYgD/PMYv7G8XD
 nAFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6pvTeopMKfMzpOHniPqNbn4Xb8JVpmpRQHVDJ/FMFSs=;
 b=LZDCBiAaSnMRDIZxpP9Ra8DSaeP9E0m+hvFRY66Bu+0LqL1ughIF6LNm2Ie+IzGGYy
 2dTPymufmjCeEBSy1zRLvadCJKNtdXfAs59f6vW64vZLJq/lYC4X2uK6lD4udndcd8of
 rxrNpcfD6EXvGuZPpoMFBj6WGwxy69Gp9oi4i9TQ2yaTMptrcLihGx+r9hKFiR5xWNGW
 u385uqcWXzwQYt1iHg6Cj2/LZioO4idfQGiuFeg31YIw9qyWTZbYNZ0IzFtV1JcZ8LN+
 8vucHZKa7MHh4aSK5t/seTczxir3EZM5LisQDFzpNu3IrCzv+SFK4rzRGI1T6Ibt3uQn
 kjYw==
X-Gm-Message-State: AOAM531H5rBWjap3A3aJ6lvRkMPEgLWNccuGCJIfSEH2UIfucUgct6cQ
 83fNx0S9AYQ52Vzs2NV4uJf+gcct5CRUbw==
X-Google-Smtp-Source: ABdhPJwq5Ufv6gjsH1VHicWNjRY7SmIf0gx4DRNeKgUPS0VrCsbhTIwGl6UnhYDTbTk8DOrZYTpW6Q==
X-Received: by 2002:a17:903:189:b029:e5:d7c3:a264 with SMTP id
 z9-20020a1709030189b02900e5d7c3a264mr1184709plg.6.1615351153032; 
 Tue, 09 Mar 2021 20:39:13 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j17sm12917517pfn.70.2021.03.09.20.39.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Mar 2021 20:39:12 -0800 (PST)
Date: Tue, 09 Mar 2021 20:39:12 -0800 (PST)
X-Google-Original-Date: Tue, 09 Mar 2021 19:42:35 PST (-0800)
Subject: Re: [RFC patch 2/4] riscv: Get CPU manufacturer information
In-Reply-To: <1615175897-23509-3-git-send-email-vincent.chen@sifive.com>
CC: linux-riscv@lists.infradead.org, Frank.Zhao@starfivetech.com,
 Atish Patra <Atish.Patra@wdc.com>, Anup Patel <Anup.Patel@wdc.com>,
 guoren@kernel.org, alankao@andestech.com, 
 Paul Walmsley <paul.walmsley@sifive.com>, vincent.chen@sifive.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: vincent.chen@sifive.com
Message-ID: <mhng-ce914c4e-9a1d-4ea5-b034-38fca5abb8fc@penguin>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210310_043917_451864_1E5936E9 
X-CRM114-Status: GOOD (  20.60  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 07 Mar 2021 19:58:15 PST (-0800), vincent.chen@sifive.com wrote:
> Issue 3 SBI calls to get the vendor ID, architecture ID and implementation
> ID early in boot so we only need to take the SBI call overhead once.
>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> ---
>  arch/riscv/include/asm/csr.h       |  3 +++
>  arch/riscv/include/asm/hwcap.h     |  6 ++++++
>  arch/riscv/include/asm/processor.h |  2 ++
>  arch/riscv/include/asm/soc.h       |  1 +
>  arch/riscv/kernel/cpufeature.c     | 17 +++++++++++++++++
>  arch/riscv/kernel/setup.c          |  2 ++
>  arch/riscv/kernel/soc.c            |  1 +
>  7 files changed, 32 insertions(+)
>
> diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
> index caadfc1d7487..87ac65696871 100644
> --- a/arch/riscv/include/asm/csr.h
> +++ b/arch/riscv/include/asm/csr.h
> @@ -115,6 +115,9 @@
>  #define CSR_MIP			0x344
>  #define CSR_PMPCFG0		0x3a0
>  #define CSR_PMPADDR0		0x3b0
> +#define CSR_MVENDORID		0xf11
> +#define CSR_MARCHID		0xf12
> +#define CSR_MIMPID		0xf13
>  #define CSR_MHARTID		0xf14
>
>  #ifdef CONFIG_RISCV_M_MODE
> diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
> index 5ce50468aff1..b7409487c9d2 100644
> --- a/arch/riscv/include/asm/hwcap.h
> +++ b/arch/riscv/include/asm/hwcap.h
> @@ -44,6 +44,12 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, int bit);
>  #define riscv_isa_extension_available(isa_bitmap, ext)	\
>  	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
>
> +struct cpu_manufacturer_info_t {
> +	unsigned long vendor_id;
> +	unsigned long arch_id;
> +	unsigned long imp_id;
> +};
> +
>  #endif
>
>  #endif /* _ASM_RISCV_HWCAP_H */
> diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
> index 3a240037bde2..4e11a9621d14 100644
> --- a/arch/riscv/include/asm/processor.h
> +++ b/arch/riscv/include/asm/processor.h
> @@ -72,6 +72,8 @@ int riscv_of_parent_hartid(struct device_node *node);
>
>  extern void riscv_fill_hwcap(void);
>
> +void riscv_fill_cpu_manufacturer_info(void);
> +
>  #endif /* __ASSEMBLY__ */
>
>  #endif /* _ASM_RISCV_PROCESSOR_H */
> diff --git a/arch/riscv/include/asm/soc.h b/arch/riscv/include/asm/soc.h
> index f494066051a2..03dee6db404c 100644
> --- a/arch/riscv/include/asm/soc.h
> +++ b/arch/riscv/include/asm/soc.h
> @@ -10,6 +10,7 @@
>  #include <linux/of.h>
>  #include <linux/linkage.h>
>  #include <linux/types.h>
> +#include <asm/hwcap.h>
>
>  #define SOC_EARLY_INIT_DECLARE(name, compat, fn)			\
>  	static const struct of_device_id __soc_early_init__##name	\
> diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
> index ac202f44a670..389162ee19ea 100644
> --- a/arch/riscv/kernel/cpufeature.c
> +++ b/arch/riscv/kernel/cpufeature.c
> @@ -12,6 +12,8 @@
>  #include <asm/hwcap.h>
>  #include <asm/smp.h>
>  #include <asm/switch_to.h>
> +#include <asm/sbi.h>
> +#include <asm/csr.h>
>
>  unsigned long elf_hwcap __read_mostly;
>
> @@ -22,6 +24,8 @@ static DECLARE_BITMAP(riscv_isa, RISCV_ISA_EXT_MAX) __read_mostly;
>  bool has_fpu __read_mostly;
>  #endif
>
> +struct cpu_manufacturer_info_t cpu_mfr_info;
> +
>  /**
>   * riscv_isa_extension_base() - Get base extension word
>   *
> @@ -149,3 +153,16 @@ void riscv_fill_hwcap(void)
>  		has_fpu = true;
>  #endif
>  }
> +
> +void riscv_fill_cpu_manufacturer_info(void)
> +{
> +#ifndef CONFIG_RISCV_M_MODE
> +	cpu_mfr_info.vendor_id = sbi_get_vendorid();
> +	cpu_mfr_info.arch_id = sbi_get_archid();
> +	cpu_mfr_info.imp_id = sbi_get_impid();
> +#else
> +	cpu_mfr_info.vendor_id = csr_read(CSR_MVENDORID);
> +	cpu_mfr_info.arch_id = csr_read(CSR_MARCHID);
> +	cpu_mfr_info.imp_id = csr_read(CSR_MIMPID);
> +#endif
> +}
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index e85bacff1b50..03621ce9092c 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -278,6 +278,8 @@ void __init setup_arch(char **cmdline_p)
>  #endif
>
>  	riscv_fill_hwcap();
> +
> +	riscv_fill_cpu_manufacturer_info();
>  }
>
>  static int __init topology_init(void)
> diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
> index a0516172a33c..58f6fd91743a 100644
> --- a/arch/riscv/kernel/soc.c
> +++ b/arch/riscv/kernel/soc.c
> @@ -6,6 +6,7 @@
>  #include <linux/libfdt.h>
>  #include <linux/pgtable.h>
>  #include <asm/soc.h>
> +#include <asm/hwcap.h>
>
>  /*
>   * This is called extremly early, before parse_dtb(), to allow initializing

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
