Return-Path: <SRS0=RxHG=PP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D7B9C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:06:36 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A2B660F56
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Oct 2021 23:06:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A2B660F56
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=29UFWj1P/G4S3Jx3GXA7lR68M9tgKznx6x/mXA2XVec=; b=QRBe6VfoRHwG+K4fE4z2LgTTwl
	tDGcKcUCGHdGJzyz53UJ/7CZd8rz5NuKArK7QP7I3EufPkV+wcEhobcIoX+RZLmglZepSCNoaCp5R
	I22ds2wl58pWWIdYbDHF9HRzeNT6uOsAlXBCIBj5Yd/BcZGEYgc9+yjHjOQPM3KVDAdxL5Gejhqxy
	BxBmFG1laYvDhXwLXdrnv7hHNUEGEJ75wEvXcTRAKUxHYjFBn/ktVij7fBERtuMTeucI8q/uI/UPC
	O4vgRtPY8e4/Y7g2kL5deM2XQbHxSLNg9N+i0AvR8WTEjlZxuh0+tE1Guo96Mv71I50pYGLP3STw3
	cGqjqFeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mfs05-006Skp-ET; Wed, 27 Oct 2021 23:06:29 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mfs02-006Sk7-1f
 for linux-riscv@lists.infradead.org; Wed, 27 Oct 2021 23:06:27 +0000
Received: by mail-pg1-x529.google.com with SMTP id r28so4537588pga.0
 for <linux-riscv@lists.infradead.org>; Wed, 27 Oct 2021 16:06:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qq3Zte+b3gvW8aVUSoj11hufNXWtcNy5WKvRt4opsbo=;
 b=7y5UZL3rxbZp4tvqsYjA0PSihfwGo2dxmv9dANT4KDkwtKlsd4EoZH5BgFjkxWwrJE
 2/gCrvWOjjaEVpOr6/JrF6H+ZzfKQox2Vg9ZHvu9PXip1qdGjyF8mUGSQEqhxy/YUnBa
 IrpRZJuZPA/8znNDIcvJBYFnlOS8M6mdo1HVcNspkw2G737P6sBVl923LGfWRi2k1/OK
 jQfkqKacsO5o+iNweytFnLyVs6V9iBR3RnJ6zjCInvvzrw4SAFPkJ2VIpeLXj1Yc5ome
 Tp6cF3kgiluFW/TayK9FlC+IsK/GJwSP9fnxFwx97BTeLHMDp1HvQAch5PPeqqY/cv6M
 ImcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qq3Zte+b3gvW8aVUSoj11hufNXWtcNy5WKvRt4opsbo=;
 b=WfH7hqTl3tN/OyDScK9xRZ8H83m0ITBleqUvhd9HFMZrxc0QKJ35F6BtwosZul7Ehe
 2Cjkdl+v8caks0XttNeZzZXeX2o+kTpP/JV8GcVzPTZhEuhEn1oF6dRGdsdtFNgWF/A7
 bNlk2MSG3hZV2P06ooFL+HZlUQPJQ+VSIlRVdx16T/UL0izblkcpd13srLHueNpo4j5U
 tmoQEpdX+0a9AaGgVQ9tMc0ZiSucIgNp1ndeWGP+J3Po9B3yDyQ1fLJbpEQdmYQ4V4xz
 VVQviZQ5A8CQipOdKDN0XxuiWpxx4fG3wHWRFmBmHWaoWzMTJzDXzFdbsNI12qaRI46d
 UKRA==
X-Gm-Message-State: AOAM531/mxj5ePN84vczpQm2E672v29SdjbJDGRMI2OvicYi3dhxOEfL
 n/7SkaDRqxNKfSgx2IUutlGSzw==
X-Google-Smtp-Source: ABdhPJyEhOalg4/dY/3KpRqiR/tNPNHZi5ofV+HXu1SYzAcPhIDj9GCXCztUYI7qBkfpEe/S5DxTVQ==
X-Received: by 2002:a63:84c6:: with SMTP id k189mr479739pgd.245.1635375984652; 
 Wed, 27 Oct 2021 16:06:24 -0700 (PDT)
Received: from localhost ([2620:0:1000:5e10:60fc:a50:6d27:9fd3])
 by smtp.gmail.com with ESMTPSA id j1sm751742pgb.5.2021.10.27.16.06.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Oct 2021 16:06:24 -0700 (PDT)
Date: Wed, 27 Oct 2021 16:06:24 -0700 (PDT)
X-Google-Original-Date: Wed, 27 Oct 2021 16:06:21 PDT (-0700)
Subject: Re: [PATCH 1/2] riscv: Fix asan-stack clang build
In-Reply-To: <20211027045843.1770770-1-alexandre.ghiti@canonical.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 ryabinin.a.a@gmail.com, glider@google.com, andreyknvl@gmail.com,
 dvyukov@google.com, 
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 kasan-dev@googlegroups.com, 
 alexandre.ghiti@canonical.com, nathan@kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: alexandre.ghiti@canonical.com
Message-ID: <mhng-41b64d3e-5a5a-4d59-86fc-80f2148823e8@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211027_160626_174666_D5627EBC 
X-CRM114-Status: GOOD (  21.37  )
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

On Tue, 26 Oct 2021 21:58:42 PDT (-0700), alexandre.ghiti@canonical.com wrote:
> Nathan reported that because KASAN_SHADOW_OFFSET was not defined in
> Kconfig, it prevents asan-stack from getting disabled with clang even
> when CONFIG_KASAN_STACK is disabled: fix this by defining the
> corresponding config.
>
> Reported-by: Nathan Chancellor <nathan@kernel.org>
> Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
> ---
>  arch/riscv/Kconfig             | 6 ++++++
>  arch/riscv/include/asm/kasan.h | 3 +--
>  arch/riscv/mm/kasan_init.c     | 3 +++
>  3 files changed, 10 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c1abbc876e5b..79250b1ed54e 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -162,6 +162,12 @@ config PAGE_OFFSET
>  	default 0xffffffff80000000 if 64BIT && MAXPHYSMEM_2GB
>  	default 0xffffffe000000000 if 64BIT && MAXPHYSMEM_128GB
>
> +config KASAN_SHADOW_OFFSET
> +	hex
> +	depends on KASAN_GENERIC
> +	default 0xdfffffc800000000 if 64BIT
> +	default 0xffffffff if 32BIT

I thought I posted this somewhere, but this is exactly what my first 
guess was.  The problem is that it's hanging on boot for me.  I don't 
really have anything exotic going on, it's just a defconfig with 
CONFIG_KASAN=y running in QEMU.

Does this boot for you?

> +
>  config ARCH_FLATMEM_ENABLE
>  	def_bool !NUMA
>
> diff --git a/arch/riscv/include/asm/kasan.h b/arch/riscv/include/asm/kasan.h
> index a2b3d9cdbc86..b00f503ec124 100644
> --- a/arch/riscv/include/asm/kasan.h
> +++ b/arch/riscv/include/asm/kasan.h
> @@ -30,8 +30,7 @@
>  #define KASAN_SHADOW_SIZE	(UL(1) << ((CONFIG_VA_BITS - 1) - KASAN_SHADOW_SCALE_SHIFT))
>  #define KASAN_SHADOW_START	KERN_VIRT_START
>  #define KASAN_SHADOW_END	(KASAN_SHADOW_START + KASAN_SHADOW_SIZE)
> -#define KASAN_SHADOW_OFFSET	(KASAN_SHADOW_END - (1ULL << \
> -					(64 - KASAN_SHADOW_SCALE_SHIFT)))
> +#define KASAN_SHADOW_OFFSET	_AC(CONFIG_KASAN_SHADOW_OFFSET, UL)
>
>  void kasan_init(void);
>  asmlinkage void kasan_early_init(void);
> diff --git a/arch/riscv/mm/kasan_init.c b/arch/riscv/mm/kasan_init.c
> index d7189c8714a9..8175e98b9073 100644
> --- a/arch/riscv/mm/kasan_init.c
> +++ b/arch/riscv/mm/kasan_init.c
> @@ -17,6 +17,9 @@ asmlinkage void __init kasan_early_init(void)
>  	uintptr_t i;
>  	pgd_t *pgd = early_pg_dir + pgd_index(KASAN_SHADOW_START);
>
> +	BUILD_BUG_ON(KASAN_SHADOW_OFFSET !=
> +		KASAN_SHADOW_END - (1UL << (64 - KASAN_SHADOW_SCALE_SHIFT)));
> +
>  	for (i = 0; i < PTRS_PER_PTE; ++i)
>  		set_pte(kasan_early_shadow_pte + i,
>  			mk_pte(virt_to_page(kasan_early_shadow_page),

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
