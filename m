Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D21C433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 21 May 2022 20:47:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=skI3ohpvsTSo0Vv/C/G85FQX0ioZF5aKIMiq2ToSAug=; b=B2vMtqB24tM0fZCP8jR1obEPQW
	9Ri9dQakTUgH5+UW7WfD5AQSCiMSnmqMG/pW6An9sRvfslf6ZGS1cODWsKmQniTX5hSg5IbRXfR8W
	4AkRBznqT6t5S2iNqLAPwPJJAxJ8dpIQ/FiaGQIe2N1kz8dwWT6m63kZDcl7/0fjglCvjTSUBWRsE
	goi8D84yrG4+4TJQPvcD58Xzs1J7U9Obh64nshTrmEw4EOS/mFFiZxZFlaIV8KgOeWX7kvk2uC8lM
	ZD93taF6NYDcGsFYgLGTKvEI3I/BCDT3sL5h1VBow+rLAubs3LDNWNt+IIMcRSeofEFqqJQj4pQs0
	EmjPLPrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nsVzx-00HUXv-E3; Sat, 21 May 2022 20:46:53 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nsVzp-00HUUz-VX
 for linux-riscv@lists.infradead.org; Sat, 21 May 2022 20:46:47 +0000
Received: by mail-pl1-x636.google.com with SMTP id bh5so9972246plb.6
 for <linux-riscv@lists.infradead.org>; Sat, 21 May 2022 13:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=GkpZ+7p6UgDi5bp1a2XJcOwojkIxmdHqECo5kKyMHUs=;
 b=4TUBgGi+q9WSq2INiqgU0pRoUIRRAcghqLe5bcRQSDopoPIj++mD2UoGoUkBMetHHm
 JGC1wcyzmL3rG4Oe43034uGcmmZc5PpqUM8SY10nfhBDhRb6QwxKTHiNUiezwGcd1x3+
 ZeturRlSKjuP0+s1f8n+SPEicsK4E36S9RkPAUucyBCZBFd/ERvJfsiDs32Adzf3tmij
 jCnUIKNW3WA7BUwE5nbk9v8TCAGWp0519w7pWqLxJMfijOEmodF0+E99xD+smhjvzno4
 ougQYKC0bQdVw3379+rVaRgP+2VLQxqPbUSj+94x2Bli3JoIaNHmFm0V1z+zTlL4i40c
 0grA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=GkpZ+7p6UgDi5bp1a2XJcOwojkIxmdHqECo5kKyMHUs=;
 b=6iUvJoHhJgbCOlrKXjJQZbpdAGCH8mZvtOQjYa7euSGdeP8gxb24wYM4lpsZQZy2sx
 4lpKayiM3WiCHhoxKcKr42mCxJmQtSt44TAGZk8GpI28ND3BEmnWkHI1iPXwjqSkCmZU
 9xVEhrgJMm+m2M20A5DU0+OvWctzAmVvzGltzlAs1gykk5jdq/0g8uPbuauU9eSvTLuQ
 NimuAYhJkyaNYmIhCj8ZpTCoIFjVSyjb+A4LyTfH1G9W057fReiLeces+2HqZj7oG4lq
 H1tPmRzeayNdU37ghUsevFj9ecxwc1ilH2QwkgyF1NOptE84EnHApNxA41BQp5u/1eFi
 8cyw==
X-Gm-Message-State: AOAM533kdJJathnqCIaI3O93sm5TvGT2dCFq30oxvAyDlzz5h2xZUbUb
 UKCioVNYEb6YX08LeFtOnMSEwQ==
X-Google-Smtp-Source: ABdhPJzGLNBlGQX03sMzs0Bf+UWP+e1fFlFMKXVIFBIJlrNQRch5a4mnkLeyKVK0MKdha7RDYbJDsw==
X-Received: by 2002:a17:90a:c90e:b0:1df:53ff:e149 with SMTP id
 v14-20020a17090ac90e00b001df53ffe149mr13395233pjt.210.1653166004243; 
 Sat, 21 May 2022 13:46:44 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 z11-20020aa7958b000000b005103abd2fdbsm4067639pfj.206.2022.05.21.13.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 May 2022 13:46:43 -0700 (PDT)
Date: Sat, 21 May 2022 13:46:43 -0700 (PDT)
X-Google-Original-Date: Sat, 21 May 2022 13:00:04 PDT (-0700)
Subject: Re: [PATCH] riscv: Don't output a bogus mmu-type on a no MMU kernel
In-Reply-To: <20220414173037.1381927-1-niklas.cassel@wdc.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 niklas.cassel@wdc.com, linux-riscv@lists.infradead.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: niklas.cassel@wdc.com
Message-ID: <mhng-f33607d6-1b1f-4cd4-b90b-d25f16900881@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220521_134646_064876_A2803274 
X-CRM114-Status: GOOD (  21.98  )
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

On Thu, 14 Apr 2022 10:30:36 PDT (-0700), niklas.cassel@wdc.com wrote:
> Currently on a 64-bit kernel built without CONFIG_MMU, /proc/cpuinfo will
> show the current MMU mode as sv57.
>
> While the device tree property "mmu-type" does have a value "riscv,none" to
> describe a CPU without a MMU, since commit 73c7c8f68e72 ("riscv: Use
> pgtable_l4_enabled to output mmu_type in cpuinfo"), we no longer rely on
> device tree to output the MMU mode. (Not even for CONFIG_32BIT.)
>
> Therefore, instead of readding code to look at the "mmu-type" device tree
> property, let's continue with the existing convention to use fixed values
> for configurations where we don't determine the MMU mode at runtime.
>
> Add a new fixed value for !CONFIG_MMU in order to output the correct
> MMU mode in cpuinfo.

There's really two ideas as to what /proc/cpuinfo should be: do we show 
what the HW has, or what we userspace sees.  This sort of thing is a 
perfect example of that split.  We've been kind of vague about this in 
the past, but IMO putting what userspace sees in /proc/cpuinfo (and 
HWCAP, etc) is the right way to go.  That does hide a bit from userspace 
WRT what hardware it's running on, but it's more in line with the design 
of RISC-V (ie, a lot is hidden from userspace).

I've put this on for-next.

Thanks!

> Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
> ---
>  arch/riscv/kernel/cpu.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
> index ccb617791e56..ecfb3e85ffb2 100644
> --- a/arch/riscv/kernel/cpu.c
> +++ b/arch/riscv/kernel/cpu.c
> @@ -138,6 +138,7 @@ static void print_mmu(struct seq_file *f)
>  {
>  	char sv_type[16];
>
> +#ifdef CONFIG_MMU
>  #if defined(CONFIG_32BIT)
>  	strncpy(sv_type, "sv32", 5);
>  #elif defined(CONFIG_64BIT)
> @@ -148,6 +149,9 @@ static void print_mmu(struct seq_file *f)
>  	else
>  		strncpy(sv_type, "sv39", 5);
>  #endif
> +#else
> +	strncpy(sv_type, "none", 5);
> +#endif /* CONFIG_MMU */
>  	seq_printf(f, "mmu\t\t: %s\n", sv_type);
>  }

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
