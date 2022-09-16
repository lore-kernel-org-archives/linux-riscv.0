Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA5C32771
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 02:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LdnDdsrcoUw0eVV1tGBTbC+D33jS1vgi+p4JnYuBQjo=; b=jJ82EA36h0f0qc
	eCL99AWcDMA+ALTQBVPRVMrtXLBswAr74WDu713mD1oc9D9DK5VTdUc4MozF/sIJd7ILeSRslrvG8
	k9fRcjx2z0l7Tj4p3WOb/UkYdID8aXD89xtXFhyX1VCf9pOeC/f3aB9OZoTURwH0y0mzc6SeOCPkh
	GR+NFgfjjGn0JNYBxdBOjMq0tu0Asb8vVt3/elve3kR+oxhzRKyN/ka/5XLCWAOLJaqDt1mHL1ndh
	5IM9PhC3t6YKezyEVLI50LemehPHlkx0vY76X4YWfuUiSZ4oKIv48AyRp3IC5Dtt6Md3dMhaRvMs4
	mQXkAnWNlLnrRGiUyEyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ12Z-005M6V-EK; Fri, 16 Sep 2022 02:25:15 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ12W-005M1H-57
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 02:25:13 +0000
Received: by mail-lf1-x12d.google.com with SMTP id j16so6292403lfg.1
        for <linux-riscv@lists.infradead.org>; Thu, 15 Sep 2022 19:25:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=3g1pfChMrPCGzoHDLIuvi7goXUtH2xCwrvM79pUzgzI=;
        b=UexWPpGvsEPgSXmhTRD96BEdU4Hf13I3c8OciXhz/Sa3MFOgO521TrTUbeY0UuMgZp
         XnSOlcg/cSLXpo/XQ+Ie5yi/r7bZC+mM9oOlfL2/60EOcI0DnDtxq58FsDKkeQa5AkBB
         4khgpj3XcbQTW6IApIy2gCVgMFsxhL2VgyX4jpNd2eqHd22VbEX3BQHLRCA9D39R+2ux
         aUHDYeI0mRxvBCw2Hae2frsvx6o5NeDkyTfZkNoU2nXmNmd95CPVgzVFOVWruCMazfCw
         0VPrObFG/Ws9LzrH7odPWBTAl0VF7sGqo9FYkqX7Tuiv0CzAAMW4bFi9BdSCm9+bVCbB
         hGMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=3g1pfChMrPCGzoHDLIuvi7goXUtH2xCwrvM79pUzgzI=;
        b=jvzTQSzoa9Jtu0GnkK3ds3sbG56cvLw8aoQHfTl0hlG5YnSoAvYCi1hrHWKiDtGHdG
         Z4UhF4RY+SO5gpO4mptPzjwMPpz4KUm8dZyoNP2HqE4c+0QmS03gHsZESxMP0uo0LITa
         mUuKeuCM9wkbY3QnO52OxE0p0JBMhtbyfkBamC92wQfRuHK00HQvRuJSabPGkj+PhCIW
         kNToYTuZzMqIK3i+3koNHGqHNpuO5PYZd7XBLywAEs/z7n+T8+BjAuLogule0I7snSSL
         PSAd/CJS0OTKEL70MqaQQ8SNd5d+1QDk4qQmBzCw3EY72Jn7eG13hwBna2wUA4RaA/RR
         cHmg==
X-Gm-Message-State: ACrzQf1TCxi8f4AMl3WU2syjUqNaFLCFfHccmEIyzMp4qTcX0IPUdZZ7
	IPNNFvzvUNNX8josLEn4TdnelFmhL4AcBUbzIZ0Iig==
X-Google-Smtp-Source: AMsMyM42n1q8iE4ZmVyKUgfz7ioTW4GZ7ESC6v+9tbZSKZ7yah0eBdk7Dhde71sBFjrXQ4ud6gbmk83C3a1tNDyopw0=
X-Received: by 2002:a05:6512:401f:b0:49e:ea65:cd49 with SMTP id
 br31-20020a056512401f00b0049eea65cd49mr877570lfb.419.1663295109005; Thu, 15
 Sep 2022 19:25:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220830044642.566769-1-apatel@ventanamicro.com> <20220830044642.566769-2-apatel@ventanamicro.com>
In-Reply-To: <20220830044642.566769-2-apatel@ventanamicro.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Fri, 16 Sep 2022 07:54:55 +0530
Message-ID: <CAK9=C2WkqVgg58sKyDEMWue_vL8Pz7bCfERuaW_4DGnYTpcSMw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for
 systems with Svpbmt
To: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>
Cc: Atish Patra <atishp@atishpatra.org>, Heiko Stuebner <heiko@sntech.de>, 
	Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Mayuresh Chitale <mchitale@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220915_192512_227558_083506A5 
X-CRM114-Status: GOOD (  16.93  )
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

Hi Palmer,

On Tue, Aug 30, 2022 at 10:17 AM Anup Patel <apatel@ventanamicro.com> wrote:
>
> Currently, all flavors of ioremap_xyz() function maps to the generic
> ioremap() which means any ioremap_xyz() call will always map the
> target memory as IO using _PAGE_IOREMAP page attributes. This breaks
> ioremap_cache() and ioremap_wc() on systems with Svpbmt because memory
> remapped using ioremap_cache() and ioremap_wc() will use _PAGE_IOREMAP
> page attributes.
>
> To address above (just like other architectures), we implement RISC-V
> specific ioremap_cache() and ioremap_wc() which maps memory using page
> attributes as defined by the Svpbmt specification.
>
> Fixes: ff689fd21cb1 ("riscv: add RISC-V Svpbmt extension support")
> Co-developed-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>

This is a crucial RC fix. Can you please take this ?

Regards,
Anup

> ---
>  arch/riscv/include/asm/io.h      | 10 ++++++++++
>  arch/riscv/include/asm/pgtable.h |  2 ++
>  2 files changed, 12 insertions(+)
>
> diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
> index 69605a474270..07ac63999575 100644
> --- a/arch/riscv/include/asm/io.h
> +++ b/arch/riscv/include/asm/io.h
> @@ -133,6 +133,16 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
>  #define outsq(addr, buffer, count) __outsq((void __iomem *)addr, buffer, count)
>  #endif
>
> +#ifdef CONFIG_MMU
> +#define ioremap_wc(addr, size)         \
> +       ioremap_prot((addr), (size), _PAGE_IOREMAP_WC)
> +#endif
> +
>  #include <asm-generic/io.h>
>
> +#ifdef CONFIG_MMU
> +#define ioremap_cache(addr, size)      \
> +       ioremap_prot((addr), (size), _PAGE_KERNEL)
> +#endif
> +
>  #endif /* _ASM_RISCV_IO_H */
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..346b7c1a3eeb 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -182,6 +182,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
>  #define PAGE_TABLE             __pgprot(_PAGE_TABLE)
>
>  #define _PAGE_IOREMAP  ((_PAGE_KERNEL & ~_PAGE_MTMASK) | _PAGE_IO)
> +#define _PAGE_IOREMAP_WC       ((_PAGE_KERNEL & ~_PAGE_MTMASK) | \
> +                                _PAGE_NOCACHE)
>  #define PAGE_KERNEL_IO         __pgprot(_PAGE_IOREMAP)
>
>  extern pgd_t swapper_pg_dir[];
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
