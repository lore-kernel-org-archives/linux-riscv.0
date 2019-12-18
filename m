Return-Path: <SRS0=W2t6=2I=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AEC3C43603
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 03:46:56 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4E8E321835
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 18 Dec 2019 03:46:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="BF5INADl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="0Sfc9XE1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4E8E321835
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:To:
	Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=CdnaDzCOwk6rsvAnZaC2ZQiQdFaLBqTLLfNDRQQhxDY=; b=BF5INADlkVcMNdV+DXwJXzK4n
	RBl6yotZ5V400u1g2UjVrLJKVMwuDE8sSB26wVPiUVAcy/qC3Feu63gratwOJP8gHCfgO0jbitoLC
	qUvhLThGYG41OQ2YkZ9mU8mA1K7PStoJdxuzAT6uOT/ZuqgEv2ZIAZQO5JLIqUSkBB5DDoQn+dbXp
	VW54qlo/jD1CH9k/P1F3jESxxdyEj/J+zRXVATL/D0Dg2uJGCIztGIeTaJBQJF2Y0L3+zp8UsMqXR
	u3kImeusbQBLC+m20x8+aXyhXyzgyY/cGjR67VItWFoHroH9kV9PPWjGJ8ka9YrWXyxJghPyWdIKQ
	CScAedC0Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ihQIX-0006Px-S4; Wed, 18 Dec 2019 03:46:53 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ihQIT-0006La-JV
 for linux-riscv@lists.infradead.org; Wed, 18 Dec 2019 03:46:51 +0000
Received: by mail-ed1-x541.google.com with SMTP id b8so459450edx.7
 for <linux-riscv@lists.infradead.org>; Tue, 17 Dec 2019 19:46:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CdnaDzCOwk6rsvAnZaC2ZQiQdFaLBqTLLfNDRQQhxDY=;
 b=0Sfc9XE1NLZKY1AjonAflMTtDQWATJDMN8BqCfGb/vIJfHOC/8e+lQM7Qg6qgKCuaB
 +d/mO6J86NRZ9L/kHkZW4o+ZLyQseWjWWeqGBju0tC5bj3DrOnaL2nby/yGprCCryis6
 cc8dD9ouyxGvgDQSCrViqtnRJGEtx6JThso+u/FzcxlzNOz66FIxKXGq8HmfxVa4wB2X
 tSNAE2F1kQHp46OErkzrqCAZ+FPTCPfwVKJinjo0w9vPF7DKJ8l0jEq5bvE/fUekZo1J
 puEkMLlWKk06/WR4mRNlKSmY17fVxQ/TEKDNuZgYh6pujaNvt5rWgxEhkI0vRBRusz6F
 xCZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CdnaDzCOwk6rsvAnZaC2ZQiQdFaLBqTLLfNDRQQhxDY=;
 b=eR8DrTBYIN6Eu9m+xDfZX3V//BTQy7eT3iXN0xb9YfiKXKz83iMEPtdSzTbrBSgF2G
 F0oSwMU6SXWO0uPVdftuofofZJL/yRstOJAq92d3bXWPMa6QFbnc5Ho0nyy44Ikf8zlV
 xKSasepkc4yPLToROjh1L+n+7qhLaRmO1fil7MYDmjQWXwkIONGC5Hnt2aPT7Vd5RPUc
 W9KgOuDk38gri0E0xDpywmsZulRMoJmy1/8eyI2vM0BIfl7WDn6GlynS2llo6n5okIGx
 EyydaDaXwGmhEfObt5ykb2ZDPkMaSxni0dW0A4OKs3TnKH4n7ITp78qH3n61YOHsg3mC
 dylQ==
X-Gm-Message-State: APjAAAVC/KN1ykjuR15j5kRCgHvY2sYsYHaxCFgU6/pGPTOEj+MAWrpG
 2T1jvM1ZJ+hDYvv49dkNucNMrU+HC9Ho2yAXQwTMMv+8
X-Google-Smtp-Source: APXvYqwnXYt4Bap4c3JgnA1rGM1rIMpopW/Ik54jWZRHcz4V745vaH7UU1cjgUvTyzjCOtVFJQWW8JXoMBfA3U/NSBk=
X-Received: by 2002:adf:dfc2:: with SMTP id q2mr1333231wrn.251.1576640806047; 
 Tue, 17 Dec 2019 19:46:46 -0800 (PST)
MIME-Version: 1.0
References: <20191217131530.513096-1-david.abdurachmanov@sifive.com>
In-Reply-To: <20191217131530.513096-1-david.abdurachmanov@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 18 Dec 2019 09:16:34 +0530
Message-ID: <CAAhSdy1pz5Zmrdm6hBxugjbBiw3d25XZJ47rpKgVk7fHaoEr6Q@mail.gmail.com>
Subject: Re: [PATCH] define vmemmap before pfn_to_page calls
To: David Abdurachmanov <david.abdurachmanov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191217_194649_694084_73BE16CA 
X-CRM114-Status: GOOD (  15.15  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Mike Rapoport <rppt@linux.ibm.com>, Yash Shah <yash.shah@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 Logan Gunthorpe <logang@deltatee.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 17, 2019 at 6:45 PM David Abdurachmanov
<david.abdurachmanov@gmail.com> wrote:
>
> pfn_to_page call depends on `vmemmap` being available before the call.
> This caused compilation errors in Fedora/RISCV with 5.5-rc2 and was caused
> by NOMMU changes which moved declarations after functions definitions.
>
> Signed-off-by: David Abdurachmanov <david.abdurachmanov@sifive.com>
> Fixes: 6bd33e1ece52 ("riscv: add nommu support")
> ---
>  arch/riscv/include/asm/pgtable.h | 34 ++++++++++++++++----------------
>  1 file changed, 17 insertions(+), 17 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ff0ed4f292e..d8c89e6e6b3d 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -90,6 +90,23 @@ extern pgd_t swapper_pg_dir[];
>  #define __S110 PAGE_SHARED_EXEC
>  #define __S111 PAGE_SHARED_EXEC
>
> +#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> +#define VMALLOC_END      (PAGE_OFFSET - 1)
> +#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> +
> +/*
> + * Roughly size the vmemmap space to be large enough to fit enough
> + * struct pages to map half the virtual address space. Then
> + * position vmemmap directly below the VMALLOC region.
> + */
> +#define VMEMMAP_SHIFT \
> +       (CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> +#define VMEMMAP_SIZE   BIT(VMEMMAP_SHIFT)
> +#define VMEMMAP_END    (VMALLOC_START - 1)
> +#define VMEMMAP_START  (VMALLOC_START - VMEMMAP_SIZE)
> +
> +#define vmemmap                ((struct page *)VMEMMAP_START)
> +
>  static inline int pmd_present(pmd_t pmd)
>  {
>         return (pmd_val(pmd) & (_PAGE_PRESENT | _PAGE_PROT_NONE));
> @@ -400,23 +417,6 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>  #define __pte_to_swp_entry(pte)        ((swp_entry_t) { pte_val(pte) })
>  #define __swp_entry_to_pte(x)  ((pte_t) { (x).val })
>
> -#define VMALLOC_SIZE     (KERN_VIRT_SIZE >> 1)
> -#define VMALLOC_END      (PAGE_OFFSET - 1)
> -#define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
> -
> -/*
> - * Roughly size the vmemmap space to be large enough to fit enough
> - * struct pages to map half the virtual address space. Then
> - * position vmemmap directly below the VMALLOC region.
> - */
> -#define VMEMMAP_SHIFT \
> -       (CONFIG_VA_BITS - PAGE_SHIFT - 1 + STRUCT_PAGE_MAX_SHIFT)
> -#define VMEMMAP_SIZE   BIT(VMEMMAP_SHIFT)
> -#define VMEMMAP_END    (VMALLOC_START - 1)
> -#define VMEMMAP_START  (VMALLOC_START - VMEMMAP_SIZE)
> -
> -#define vmemmap                ((struct page *)VMEMMAP_START)
> -
>  #define PCI_IO_SIZE      SZ_16M
>  #define PCI_IO_END       VMEMMAP_START
>  #define PCI_IO_START     (PCI_IO_END - PCI_IO_SIZE)
> --
> 2.23.0
>

Can you add a comment for "#define vmemmap" about your findings ?

Otherwise looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

