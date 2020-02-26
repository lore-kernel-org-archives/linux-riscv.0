Return-Path: <SRS0=fzfn=4O=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 683E3C4BA0B
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2020 07:09:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E71721556
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 26 Feb 2020 07:09:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VwqYDnFX";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="aLXV00WG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E71721556
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=bFY18KMGRElgr/hdP4Y9wzX+1S5s4NU+3wRIGSgae9U=; b=VwqYDnFXTtdnzFSYD3ovSP5+T
	j0ok3LF8ydVuvfEAJcWKzjtO9AB37rY/Gh/2Jq/iDdm8zRt7WLIE3LFMgMszriWcXDGw9oTM4jgxK
	ctx8/DXb4UL4IMJ2bu9EKrhjCI9IIb9qV3k/4PqR+U8KQ/xz2zSfKrFXrtM3dMS1QmT1LYRFB6aif
	mKb7V1NNa/mABNk4g8t8UpppCJb+qpbUnzQN0YXAxo4ko/Pus5STF1X6r7wrMn3ygVzYUdmG8lUkP
	Vee3MDEP1UqqfC9kqEj/QfOwOMT49AJ2ur/XyiCb4uvE6GA4SjY2quEO3DOWDLoLDcSYuN6S+nBV5
	CopaeUw3w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1j6qod-0002fT-4L; Wed, 26 Feb 2020 07:09:07 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1j6qoZ-0002ek-KT
 for linux-riscv@lists.infradead.org; Wed, 26 Feb 2020 07:09:04 +0000
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com
 [209.85.128.53])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0048F2467D
 for <linux-riscv@lists.infradead.org>; Wed, 26 Feb 2020 07:09:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1582700943;
 bh=BdvukjoB3WBnGxQuMkXsAyznS/yxxSlgLx6C/Lh+O5s=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=aLXV00WGNbPLHXgt1q6/H3/GVzQFXdwh6tHYzbPOgypdiAlt3vP/fGyZQrHx8mSxE
 /Xrq/zq1RkklN4cocFA1Hae36qAzR3g6ChMWulwQWOy2JQcTCIidyU6lZztqBrS3os
 1MvQ7Rex4Tm3nmfMV9H1IR8j8w0hYofJf/Tvxxpg=
Received: by mail-wm1-f53.google.com with SMTP id p17so1782506wma.1
 for <linux-riscv@lists.infradead.org>; Tue, 25 Feb 2020 23:09:02 -0800 (PST)
X-Gm-Message-State: APjAAAVwy0pQR5qqdKOn1fyhj8+k8eFBsPKAshNDPxmwGyUeu+bi/C04
 tipLwPdqD+Tx7DM+jPzFtoSfDdKjvVgQNZXomthS3A==
X-Google-Smtp-Source: APXvYqygd/ulFA+LBYcE+02wpHVNjovd2gznC4M9/EIQzEGIl8/sG8qvkHkL/jt8pXKkT3+TfT6z5RSmn21ULS3+N40=
X-Received: by 2002:a7b:cb93:: with SMTP id m19mr72538wmi.133.1582700941221;
 Tue, 25 Feb 2020 23:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20200226011037.7179-1-atish.patra@wdc.com>
 <20200226011037.7179-4-atish.patra@wdc.com>
In-Reply-To: <20200226011037.7179-4-atish.patra@wdc.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 26 Feb 2020 08:08:50 +0100
X-Gmail-Original-Message-ID: <CAKv+Gu8HdRa5k=h1XF2fm80VEgvuxa_tX_P0qFSdkk=CVc6ffA@mail.gmail.com>
Message-ID: <CAKv+Gu8HdRa5k=h1XF2fm80VEgvuxa_tX_P0qFSdkk=CVc6ffA@mail.gmail.com>
Subject: Re: [RFC PATCH 3/5] RISC-V: Define fixmap bindings for generic early
 ioremap support
To: Atish Patra <atish.patra@wdc.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200225_230903_713695_B9E97686 
X-CRM114-Status: GOOD (  19.27  )
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
Cc: Kate Stewart <kstewart@linuxfoundation.org>,
 linux-efi <linux-efi@vger.kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Russell King <linux@armlinux.org.uk>,
 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
 linux-riscv@lists.infradead.org, Will Deacon <will@kernel.org>,
 Ingo Molnar <mingo@kernel.org>, "Chang,
 Abner \(HPS SW/FW Technologist\)" <abner.chang@hpe.com>,
 Michal Simek <michal.simek@xilinx.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Greentime Hu <greentime.hu@sifive.com>, Borislav Petkov <bp@suse.de>,
 Mao Han <han_mao@c-sky.com>, "Schaefer,
 Daniel \(DualStudy\)" <daniel.schaefer@hpe.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Arnd Bergmann <arnd@arndb.de>, Alexios Zavras <alexios.zavras@intel.com>,
 Alexander Graf <agraf@csgraf.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Allison Randal <allison@lohutok.net>,
 "leif@nuviainc.com" <leif@nuviainc.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Anup Patel <Anup.Patel@wdc.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 26 Feb 2020 at 02:10, Atish Patra <atish.patra@wdc.com> wrote:
>
> UEFI uses early IO or memory mappings for runtime services before
> normal ioremap() is usable. This patch only adds minimum necessary
> fixmap bindings and headers for generic ioremap support to work.
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>

Looks reasonable to me,

Acked-by: Ard Biesheuvel <ardb@kernel.org>

although I wonder why it is part of this series?

> ---
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/Kbuild   |  1 +
>  arch/riscv/include/asm/fixmap.h | 21 ++++++++++++++++++++-
>  arch/riscv/include/asm/io.h     |  1 +
>  4 files changed, 23 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 27bfc7947e44..42c122170cfd 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -65,6 +65,7 @@ config RISCV
>         select ARCH_HAS_GCOV_PROFILE_ALL
>         select HAVE_COPY_THREAD_TLS
>         select HAVE_ARCH_KASAN if MMU && 64BIT
> +       select GENERIC_EARLY_IOREMAP
>
>  config ARCH_MMAP_RND_BITS_MIN
>         default 18 if 64BIT
> diff --git a/arch/riscv/include/asm/Kbuild b/arch/riscv/include/asm/Kbuild
> index ec0ca8c6ab64..517394390106 100644
> --- a/arch/riscv/include/asm/Kbuild
> +++ b/arch/riscv/include/asm/Kbuild
> @@ -4,6 +4,7 @@ generic-y += checksum.h
>  generic-y += compat.h
>  generic-y += device.h
>  generic-y += div64.h
> +generic-y += early_ioremap.h
>  generic-y += extable.h
>  generic-y += flat.h
>  generic-y += dma.h
> diff --git a/arch/riscv/include/asm/fixmap.h b/arch/riscv/include/asm/fixmap.h
> index 42d2c42f3cc9..7a4beb7e29a3 100644
> --- a/arch/riscv/include/asm/fixmap.h
> +++ b/arch/riscv/include/asm/fixmap.h
> @@ -25,9 +25,28 @@ enum fixed_addresses {
>  #define FIX_FDT_SIZE   SZ_1M
>         FIX_FDT_END,
>         FIX_FDT = FIX_FDT_END + FIX_FDT_SIZE / PAGE_SIZE - 1,
> +       FIX_EARLYCON_MEM_BASE,
> +
>         FIX_PTE,
>         FIX_PMD,
> -       FIX_EARLYCON_MEM_BASE,
> +       /*
> +        * Make sure that it is 2MB aligned.
> +        */
> +#define NR_FIX_SZ_2M   (SZ_2M / PAGE_SIZE)
> +       FIX_THOLE = NR_FIX_SZ_2M - FIX_PMD - 1,
> +
> +       __end_of_permanent_fixed_addresses,
> +       /*
> +        * Temporary boot-time mappings, used by early_ioremap(),
> +        * before ioremap() is functional.
> +        */
> +#define NR_FIX_BTMAPS          (SZ_256K / PAGE_SIZE)
> +#define FIX_BTMAPS_SLOTS       7
> +#define TOTAL_FIX_BTMAPS       (NR_FIX_BTMAPS * FIX_BTMAPS_SLOTS)
> +
> +       FIX_BTMAP_END = __end_of_permanent_fixed_addresses,
> +       FIX_BTMAP_BEGIN = FIX_BTMAP_END + TOTAL_FIX_BTMAPS - 1,
> +
>         __end_of_fixed_addresses
>  };
>
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 0f477206a4ed..047f414b6948 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -14,6 +14,7 @@
>  #include <linux/types.h>
>  #include <asm/mmiowb.h>
>  #include <asm/pgtable.h>
> +#include <asm/early_ioremap.h>
>
>  /*
>   * MMIO access functions are separated out to break dependency cycles
> --
> 2.24.0
>

