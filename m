Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C28EC433E0
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:17:24 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E9D2920672
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:17:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="aGktu+5F";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="bpm55zll"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E9D2920672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=pGc4mYCs8xf73Ab1jfTcnI2bTPPrMKHBTiR48Y90NAo=; b=aGktu+5FlrfxPY8otzmqJmhqx
	DaeJelBdx77l3NoTgbFVV8QcTYnzmXu11IMuDjxQmtJD2JGBSdGOjvuyjPZYv4HO8jE04KysSYmSO
	8jIu68CZPph7bYscNiVLlQ50mT3c8+H/NJVRz+VstrPzCyfnRz5XfAQTf9zKU+D79KTELgFyH0KQO
	Xt0+bJ3aagbnotQblexxiXbGglPfUQ/wFi0IxmUoKemKAoP0tYy6VSO5uuvTQUhkT1nLOtphn9FI3
	m0mesc/uLiDl2sIbJZavnHLtfmc6UVwLsb4Dv0EeAbh8C/kglZ89Z9YcnXKpSvaa4KjTVFy2VC/Qq
	7BGw/lLrA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtduv-0002jr-OZ; Thu, 09 Jul 2020 21:17:17 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcq5-0003tJ-Au
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 20:08:14 +0000
Received: by mail-pf1-x442.google.com with SMTP id u18so1466526pfk.10
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=pLBedoQfpK2DgMyeYFLuVKUfBSYZwpag97/6iT786IQ=;
 b=bpm55zllAw8nlwKFmlpsqohQxm+EGW1RynZKF6buhnF4wFWwIploavQVBhMNxTThgZ
 pPIXgo28wYGMXRTU+PACEPxc+h26RmY8IWB+OHozzHXYyhBiF1S7hDaudJ04X41mqHli
 liIixSh/td8GVnVZNWIXKRxB5ag9lLKr2aWWAZsW+qbiQKT+s+lxPq1boL27HeCEjFzh
 vVvOZodoVauBt2UCj1TCW2+4bqGEDwtbNv7Gy/okhNRVvEe4prOUZm8sKf274iuMS/+Y
 fs0GYwPVAMwzla5KWSAK5Q2E45oh8HWiJpEpt5FffbTzC4otOb2Qu4h1ixxJZMG3Zh1w
 dL8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=pLBedoQfpK2DgMyeYFLuVKUfBSYZwpag97/6iT786IQ=;
 b=gXNj7Qhjbk/H9yXDdeAGeRtdKYr20aWCSnPQgu14RrHFZ23qAUkGE0npxFCht9l9l2
 f9sQSOx+C8p818fOE8vYS/k0MoTv0QOiovR1kt97tudiHGFnne1pyg4r4D6NIP6tANI3
 ok9rWtvTjpmedZM0bh9he1IE601n2B2Ogi9+c5XcxWLaPMdW5SW+NHQHeiaQCDnFVSOv
 RfWmBqAaNVzZIG57dqwcBW02bykKWS1iBBteZOhMc6+ijHmyJ3ImtoQptYZ5Vm1sf//s
 2GypPGrf8ElA3TaZi5C99CgW+SVp2BwErJIkOJBiHN9jwaxA2OBAZGpx4ozY/St8Vc3C
 42Fg==
X-Gm-Message-State: AOAM533V3qOwxNFws5jhA1wNttbPmiOYxlTRYGHwsON6B3VuNWy/u5M2
 GDWMrzzSp2ncb7OyBSCaOtX0Mg==
X-Google-Smtp-Source: ABdhPJwH2yZXuMK1v2nxYBAcKR39mYEbzR2YVH8DdjjrdNSd3OZRm+a651q/IpIL/WcPFQJKnzhu0Q==
X-Received: by 2002:a05:6a00:2bb:: with SMTP id
 q27mr58904437pfs.176.1594325290692; 
 Thu, 09 Jul 2020 13:08:10 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b18sm3467144pju.10.2020.07.09.13.08.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:08:10 -0700 (PDT)
Date: Thu, 09 Jul 2020 13:08:10 -0700 (PDT)
X-Google-Original-Date: Thu, 09 Jul 2020 12:31:05 PDT (-0700)
Subject: Re: [PATCH 2/2] riscv: Support CONFIG_STRICT_DEVMEM
In-Reply-To: <7faa60aa4a606b5c5c1ae374d82a7eee6c764b38.1592292685.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-d4637494-2072-41f6-9a8a-1b222d89d6c4@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_160813_480135_72BA96AC 
X-CRM114-Status: GOOD (  25.42  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 zong.li@sifive.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 16 Jun 2020 00:45:47 PDT (-0700), zong.li@sifive.com wrote:
> Implement the 'devmem_is_allowed()' interface for RISC-V, like some of
> other architectures have done. It will be called from range_is_allowed()
> when userpsace attempts to access /dev/mem.

In fact, it's exactly the same (down to a few words of the comment) to the
others that I checked.  I'm going to put a generic version in lib/ instead,
I've sent out the patches.

> Access to exclusive IOMEM and kernel RAM is denied unless
> CONFIG_STRICT_DEVMEM is set to 'n'.
>
> Test it by devmem, the result as follows:
>
>  - CONFIG_STRICT_DEVMEM=y
> 	$ devmem 0x10010000
> 	0x00000000
> 	$ devmem 0x80200000
> 	0x0000106F
>
>  - CONFIG_STRICT_DEVMEM is not set
> 	$ devmem 0x10010000
> 	devmem: mmap: Operation not permitted
> 	$ devmem 0x80200000
> 	devmem: mmap: Operation not permitted
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> ---
>  arch/riscv/Kconfig          |  1 +
>  arch/riscv/include/asm/io.h |  2 ++
>  arch/riscv/mm/init.c        | 19 +++++++++++++++++++
>  3 files changed, 22 insertions(+)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 128192e14ff2..ffd7841ede4c 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -16,6 +16,7 @@ config RISCV
>  	select ARCH_HAS_BINFMT_FLAT
>  	select ARCH_HAS_DEBUG_VIRTUAL if MMU
>  	select ARCH_HAS_DEBUG_WX
> +	select ARCH_HAS_DEVMEM_IS_ALLOWED
>  	select ARCH_HAS_GCOV_PROFILE_ALL
>  	select ARCH_HAS_GIGANTIC_PAGE
>  	select ARCH_HAS_MMIOWB
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 3835c3295dc5..04ac65ab93ce 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -147,4 +147,6 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
>
>  #include <asm-generic/io.h>
>
> +extern int devmem_is_allowed(unsigned long pfn);
> +
>  #endif /* _ASM_RISCV_IO_H */
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index bbe816e03b2f..5e7e61519acc 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -517,6 +517,25 @@ void mark_rodata_ro(void)
>  }
>  #endif
>
> +#ifdef CONFIG_STRICT_DEVMEM
> +#include <linux/ioport.h>
> +/*
> + * devmem_is_allowed() checks to see if /dev/mem access to a certain address
> + * is valid. The argument is a physical page number.
> + *
> + * Disallow access to system RAM as well as device-exclusive MMIO regions.
> + * This effectively disable read()/write() on /dev/mem.
> + */
> +int devmem_is_allowed(unsigned long pfn)
> +{
> +	if (iomem_is_exclusive(pfn << PAGE_SHIFT))
> +		return 0;
> +	if (!page_is_ram(pfn))
> +		return 1;
> +	return 0;
> +}
> +#endif
> +
>  void __init resource_init(void)
>  {
>  	struct memblock_region *region;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
