Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47236C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Oct 2022 12:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zqOJatBDWrWLOAHZSS9hqPRydORSNwaibi4HGpElVL4=; b=GcRz2y2RAOFdQK
	zu8y7X0N22AjHXm0dTRkPheMkIuffXoPx1yYaFBnZw3ToJ/FF/B+j3iYndBPWA7HNLNJ0MPpep4IK
	k9Iiaeuvg6ghQdXowhs2ZyJxWIh3I8tFNWeO2hOjhTaiTpZTK6DbsrgHzAC99Gcb+zg/1Wi84PwKy
	HuZ2L/phlLoFXE3I8Xv1IaKX7XkNzO2Xh5hDYhaKE2ae95RVTVxrJfT5EZy1gCmDMx1o+dwMxM3Gj
	tUapdSEfMNRblrNvmny6ZiCjQAmYwP8JiGHQMb4xe2VnLI/Y3NdY0QuQXAGlG8VPE+C0BWjKP4ZHU
	6ZqQYeLpsBObtbZ2cNyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol86G-001QqR-CY; Wed, 19 Oct 2022 12:23:08 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ol86C-001QfO-U3
	for linux-riscv@lists.infradead.org; Wed, 19 Oct 2022 12:23:06 +0000
Received: by mail-ej1-x634.google.com with SMTP id k2so39552900ejr.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Oct 2022 05:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=QMeiIZiyblteVRq78CiV17LjNnwkts3YE/C63wZ/Nwc=;
        b=BOfrgwQgEzrrFhKlFXE5x9tOZKfxASj6ILDrcwagHhpNJzX2kSs2Pfwaq05XnINQrP
         l9Dcw6XLRGkIV/RuE9xQwi3EOMuw+8BlM+Ttw8VcjZ1tO542VMZUeok+gYu6K2Oxcoyv
         JCS7h9hBMXUcEQpLUiz14l5B1rJUeimFAXFYKlVtg6KB/j5ZC3t1NvKNhYliUgE/09kP
         FvO3ZTD6PyMJqSljuEY6tvCuYO8TVwCyijjZjXl1Zj1l3BP5xzgYzNvZ72LIeSl75qJE
         gAVd+M+YBGvhGKF3dsq+fGiSHDVzzhN+pJS4OGO8eaYTaC3lfevZaCl2XTNxkVAAcOI0
         oi8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QMeiIZiyblteVRq78CiV17LjNnwkts3YE/C63wZ/Nwc=;
        b=6r2ajEjWhWXJ4+XlGY/SJHzbT6ntwv/hQglb2nA/1EI1rkVNZdRNy5foH7oa6+jjVc
         2YBgAWPpCeTR9peQS4z0ajITjClDytSO2v8hLxkGIjVu6oT21XVUrwgTvu6rT981PiA2
         75Z3r/bUXh3gviEDOJ0KKBHMvAbxaabHQQV/81HTqELuSP0Z4D0nOuTbcuLwrl4UWJoC
         MoTF7R0HZYKDe8no1sEuwpQzDK2xrl5h3v9r+4pDknSketesOUxFVsI9MlX3fm/7iQ2X
         1HHZ0S3IS7dIZav7zZ7ZWgUcx+MtYf2ldxrK7X9mtinqe+JueTDkdKEobJhbrwJN1J0a
         k+Tw==
X-Gm-Message-State: ACrzQf0IKlm0SKQo1ToQCMNm8yQCXRGEyxBVUDWaM8cCdaVAOXM8rsna
	AcyBKmaLPR2HD0yquXnwZSCWpBNjZiqmSIKItghPFw==
X-Google-Smtp-Source: AMsMyM549WtB2Hp0Bg2is6s2aYzKVD5TFE9cKOvyf0h+dgbaICCawPeNl7yp77ABZoj2vRJfgHQWT34GvNzmBoECr2U=
X-Received: by 2002:a17:906:ee81:b0:77e:829a:76e9 with SMTP id
 wt1-20020a170906ee8100b0077e829a76e9mr6852093ejb.207.1666182176287; Wed, 19
 Oct 2022 05:22:56 -0700 (PDT)
MIME-Version: 1.0
References: <20221019121622.179024-1-apatel@ventanamicro.com> <20221019121622.179024-2-apatel@ventanamicro.com>
In-Reply-To: <20221019121622.179024-2-apatel@ventanamicro.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 19 Oct 2022 17:52:42 +0530
Message-ID: <CAAhSdy1bjD15c-xnhHv6K9Zsy_fvmNU6w=TyM1hS41MYtJkmTg@mail.gmail.com>
Subject: Re: [PATCH v3 1/4] RISC-V: Fix compilation without RISCV_ISA_ZICBOM
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Andrew Jones <ajones@ventanamicro.com>, 
	kernel test robot <lkp@intel.com>, Anup Patel <apatel@ventanamicro.com>, 
	Conor Dooley <conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221019_052305_207446_17CEF999 
X-CRM114-Status: GOOD (  25.77  )
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

On Wed, Oct 19, 2022 at 5:46 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> From: Andrew Jones <ajones@ventanamicro.com>
>
> riscv_cbom_block_size and riscv_init_cbom_blocksize() should always
> be available and riscv_init_cbom_blocksize() should always be
> invoked, even when compiling without RISCV_ISA_ZICBOM enabled. This
> is because disabling RISCV_ISA_ZICBOM means "don't use zicbom
> instructions in the kernel" not "pretend there isn't zicbom, even
> when there is". When zicbom is available, whether the kernel enables
> its use with RISCV_ISA_ZICBOM or not, KVM will offer it to guests.
> Ensure we can build KVM and that the block size is initialized even
> when compiling without RISCV_ISA_ZICBOM.
>
> Fixes: 8f7e001e0325 ("RISC-V: Clean up the Zicbom block size probing")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Currently, the KVM RISC-V compilation is broken for toolchains not
having Zicbom support.

I plan to take this patch through the KVM RISC-V tree and I will be
sending a PR by the end of this week. Let me know if you want this
patch to go through the RISC-V tree.

Regards,
Anup

> ---
>  arch/riscv/mm/cacheflush.c      | 41 +++++++++++++++++++++++++++++++++
>  arch/riscv/mm/dma-noncoherent.c | 41 ---------------------------------
>  2 files changed, 41 insertions(+), 41 deletions(-)
>
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index 6cb7d96ad9c7..f318b2553612 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2017 SiFive
>   */
>
> +#include <linux/of.h>
> +#include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>
>  #ifdef CONFIG_SMP
> @@ -86,3 +88,42 @@ void flush_icache_pte(pte_t pte)
>                 flush_icache_all();
>  }
>  #endif /* CONFIG_MMU */
> +
> +unsigned int riscv_cbom_block_size;
> +EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> +
> +#ifdef CONFIG_RISCV_ISA_ZICBOM
> +void riscv_init_cbom_blocksize(void)
> +{
> +       struct device_node *node;
> +       unsigned long cbom_hartid;
> +       u32 val, probed_block_size;
> +       int ret;
> +
> +       probed_block_size = 0;
> +       for_each_of_cpu_node(node) {
> +               unsigned long hartid;
> +
> +               ret = riscv_of_processor_hartid(node, &hartid);
> +               if (ret)
> +                       continue;
> +
> +               /* set block-size for cbom extension if available */
> +               ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> +               if (ret)
> +                       continue;
> +
> +               if (!probed_block_size) {
> +                       probed_block_size = val;
> +                       cbom_hartid = hartid;
> +               } else {
> +                       if (probed_block_size != val)
> +                               pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> +                                       cbom_hartid, hartid);
> +               }
> +       }
> +
> +       if (probed_block_size)
> +               riscv_cbom_block_size = probed_block_size;
> +}
> +#endif
> diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
> index b0add983530a..d919efab6eba 100644
> --- a/arch/riscv/mm/dma-noncoherent.c
> +++ b/arch/riscv/mm/dma-noncoherent.c
> @@ -8,13 +8,8 @@
>  #include <linux/dma-direct.h>
>  #include <linux/dma-map-ops.h>
>  #include <linux/mm.h>
> -#include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <asm/cacheflush.h>
>
> -unsigned int riscv_cbom_block_size;
> -EXPORT_SYMBOL_GPL(riscv_cbom_block_size);
> -
>  static bool noncoherent_supported;
>
>  void arch_sync_dma_for_device(phys_addr_t paddr, size_t size,
> @@ -77,42 +72,6 @@ void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
>         dev->dma_coherent = coherent;
>  }
>
> -#ifdef CONFIG_RISCV_ISA_ZICBOM
> -void riscv_init_cbom_blocksize(void)
> -{
> -       struct device_node *node;
> -       unsigned long cbom_hartid;
> -       u32 val, probed_block_size;
> -       int ret;
> -
> -       probed_block_size = 0;
> -       for_each_of_cpu_node(node) {
> -               unsigned long hartid;
> -
> -               ret = riscv_of_processor_hartid(node, &hartid);
> -               if (ret)
> -                       continue;
> -
> -               /* set block-size for cbom extension if available */
> -               ret = of_property_read_u32(node, "riscv,cbom-block-size", &val);
> -               if (ret)
> -                       continue;
> -
> -               if (!probed_block_size) {
> -                       probed_block_size = val;
> -                       cbom_hartid = hartid;
> -               } else {
> -                       if (probed_block_size != val)
> -                               pr_warn("cbom-block-size mismatched between harts %lu and %lu\n",
> -                                       cbom_hartid, hartid);
> -               }
> -       }
> -
> -       if (probed_block_size)
> -               riscv_cbom_block_size = probed_block_size;
> -}
> -#endif
> -
>  void riscv_noncoherent_supported(void)
>  {
>         WARN(!riscv_cbom_block_size,
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
