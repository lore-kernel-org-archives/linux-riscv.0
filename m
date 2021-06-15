Return-Path: <SRS0=FzV5=LJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE31DC48BDF
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 13:46:02 +0000 (UTC)
Received: from bombadil.infradead.org (unknown [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9DCCB61439
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jun 2021 13:46:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9DCCB61439
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I/9nnNcliN/cEDGaBW/5IqZlx2wOplEmIJtqlejbZX0=; b=LFacpWLo6jwIRh
	7FuuDgydVNNBIQMGFmDY4UejdMDAi+R4yDvPPa6vA7r+61fqH5IgwxDuZNlt8S2/PXbfxgkRCW9KT
	Uub4FBmZwNLmqHlhnx5oM8xwIOhpCQnsk2CIgcrsH2xVQDpoZeRvUXzt3U3x/B/P6Hw77lpyKB5lo
	X/ftnSPPgFo0GpsZP01vMg+fU6BpU1ZEGLhLCVjL+2eapHwBtXaVchVfAIolvj5K9yN0e0AeIvB4a
	KJHSl/bu9s0F39QLdF6IKPVX5KS/NkiO/hIJS7JQguwCoPsSjhQuw9tDhAwztJKh/Sfx7W0ZtGU0e
	15y6Pq3MwSV8LOTmFhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lt9NP-000HfV-G0; Tue, 15 Jun 2021 13:45:11 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt9FT-000DDm-GZ; Tue, 15 Jun 2021 13:36:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:Subject:Message-ID:
 Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=6cLFWPwpottSL5NyBrmyH12rIdn1diKeLgL8Kz1B3hs=; b=AooooCytbEtikfWad9REvA5F8O
 9wVwqx4Hc7rlDYlttgdpnlkjyDTbMKVU0/eG3GDETDUCzlP7pZGFVKY3Qo9SFJ87lZjW2s/gY78mz
 IAh0K3KoZQmIv9EFUW9Je/zNDTxH20ZMMn9Mf5a5+IouRV7jKZExXx4CG7leaE1KIHvCUnxPynORc
 3ex39H7L26l1Pblq+gDK22RU9Cc+ukziS5Ph6PlUMGs6AIXP/HIAMfM6M9Yb2iS4PFn18roKEUI68
 MDQnurzXT9tvxxXIXOHYfqev6qficCVRb++4zEGkzskQukwW9/ac7PcVaTeonLCKGpcdnSxNFS8ft
 UzqdRT8A==;
Received: from mail-vs1-f43.google.com ([209.85.217.43])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lt7SJ-007oO4-0d; Tue, 15 Jun 2021 11:42:15 +0000
Received: by mail-vs1-f43.google.com with SMTP id j8so4715828vsd.0;
 Tue, 15 Jun 2021 04:42:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6cLFWPwpottSL5NyBrmyH12rIdn1diKeLgL8Kz1B3hs=;
 b=oO6mPzo6QLkE7qDamKzcHJaPbZqvKP8ypToGi8viOuAuG9I+7ykjRCm8HDsISvWjxd
 TFELByv2l4i6tNn+I88wtfHIq3/yMReIBj8MopxdWy47keAJIGnvZwrQEdz12e8Bp76E
 UfEcs4rDJFsB+vnyGs6yRYHS1AqczrbJvg4Bp47ZxZsxMAszETqch28BjNNxUPLev3dh
 gG6FspMKLm3Me6vvj9qGf+xJuA1EvX/uYhKJdUcIIktnKh1hZOeJN5GjsiG4dYfH8cd2
 88JPWdxraponNaxE9mf+ortAfuYdK7lJmlqxm84t1nen25dh5FSemxJxl8zv5og6JA47
 W6/g==
X-Gm-Message-State: AOAM530sZ1qXHHrimCGqePwX18ZZe91h1ycCPDTb3zZoP0SY7ae5zit/
 txFcLmgZtckNbwW4D3rfflq2UamxpIOCxi2XM+w=
X-Google-Smtp-Source: ABdhPJznuEjA8rihIMbbzhrVXLV05AmmQE+goCl46rfP2wIOnP/fUciGjhBT/1Kzp4dchtm5tTMtBoSZNwhqYUvmAU8=
X-Received: by 2002:a67:3c2:: with SMTP id 185mr4432436vsd.42.1623757324455;
 Tue, 15 Jun 2021 04:42:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210615110859.320299-1-aneesh.kumar@linux.ibm.com>
In-Reply-To: <20210615110859.320299-1-aneesh.kumar@linux.ibm.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 15 Jun 2021 13:41:53 +0200
Message-ID: <CAMuHMdVdG10w4mUP_nLpPkDCP-tb3waPg_AOSJPch9b7AsLGsw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] mm: rename pud_page_vaddr to pud_pgtable and make
 it return pmd_t *
To: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
Cc: Linux MM <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Linus Torvalds <torvalds@linux-foundation.org>,
 alpha <linux-alpha@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 Linux ARM <linux-arm-kernel@lists.infradead.org>, 
 "linux-ia64@vger.kernel.org" <linux-ia64@vger.kernel.org>,
 linux-m68k <linux-m68k@lists.linux-m68k.org>, 
 "open list:BROADCOM NVRAM DRIVER" <linux-mips@vger.kernel.org>,
 Parisc List <linux-parisc@vger.kernel.org>, 
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux-sh list <linux-sh@vger.kernel.org>, 
 sparclinux <sparclinux@vger.kernel.org>,
 linux-um <linux-um@lists.infradead.org>, 
 Linux-Arch <linux-arch@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210615_124213_921484_5EE8C000 
X-CRM114-Status: GOOD (  16.30  )
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

On Tue, Jun 15, 2021 at 1:32 PM Aneesh Kumar K.V
<aneesh.kumar@linux.ibm.com> wrote:
> No functional change in this patch.

> Signed-off-by: Aneesh Kumar K.V <aneesh.kumar@linux.ibm.com>

>  arch/m68k/include/asm/motorola_pgtable.h     | 2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
