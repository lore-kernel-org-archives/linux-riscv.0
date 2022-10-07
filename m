Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B020C433FE
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Oct 2022 05:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pkRNAukh9KJtG3gHRnNs5aTjQR44z4hGKUVoWn7FdUU=; b=ZPBZEtWaO91kaJ
	pPZOBlkfwu3QpuNnioVx9N/9b7n71lna3dmsx+RiU3ba4EAR0B4+DgKcuUGtigQAHzwzNAYQtfnXj
	/RZzEH+qf+JNtdLpkwhAAqVnFl3UtkEfk1VypaYQrezlN3iWaB3LdhRRL3mWSFbDGYbpWXFDV+Cms
	B8uMD01w6bdvaNokM8t5xZfGqrnQlQ0129ZDWchK8yyDJ9e9OkGdRZWyvae8eDxgEEiGbdWhVVY06
	DgeqVockPa2DyAhG8ubdkY3k6Zl/XUbKVih1zAtEMdamhkY5HtyIckqhHlPEbqpBB6v2B/BizdbXs
	vSqeaUPlRyUXnNWHTbgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogg0U-007Nc0-9F; Fri, 07 Oct 2022 05:34:46 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ogg0R-007NZR-DV
	for linux-riscv@lists.infradead.org; Fri, 07 Oct 2022 05:34:44 +0000
Received: by mail-ej1-x62a.google.com with SMTP id k2so9027263ejr.2
        for <linux-riscv@lists.infradead.org>; Thu, 06 Oct 2022 22:34:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4jbGxKrMNyFrPT2wGOijm8eTvwIabIkBrKxbAT6PEw4=;
        b=NMpqMafEZGLvFJinUjEMNwJc2rAJJOzrQbQOdjP2MzhyXzyrJ7ONGhlRfnm+bbla5q
         sT8r8tD2/aeMk/7D03Qpt2KVlLPIVxIigH5u6rby7moU9u9Rm4VwU1xHsx2+tktlldI7
         rESt98Ls4SirQGWP1FIGErVL3pTdrdstlH2UALxf52V6Uz6Fv5WkqRYuVBXje0laTjkJ
         6703B25OkSBwK0jz35y4duOLKSSyr4Pzs/pXSu14Xi3FpUM4xo6BCY9T8Ri3NNYn7r3H
         RvY3X04CLMGzbgNJdbK87hyKsXtt0vc6uvU689NZN5KTT30VRWwj3kyD5cW2G3hyh886
         5ViQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4jbGxKrMNyFrPT2wGOijm8eTvwIabIkBrKxbAT6PEw4=;
        b=CBmp5IzBVrD9w9Y1zOn0nIa/hPXlUmCv1JYb9xKbmeKluROSkcIJo4S5mO921XuVZW
         vJG3zLBMoK8AvVYit9C+l/3gF44BMJUO3JBXsMcNJRUhbkNdtJdbybWyaw2LZeVXlnuu
         TOZN/NY/2rtLVW3eu8w36PX9yXnWbvtJiu9NkVxo539k7qcEWWSSmlbvUEDNs9KypfkQ
         yQ0ocJZN4Mri3NeWmQxwpYd43dXR5PyKOr8ZJiW/e77bRiYDEft5erAjv9JsZ9yAyrKS
         aKkEOz0TDkIoU9CJHbb4sYJsHjtol0en1TvfogolLHJ2CWXav8oH1tOqzwXyWl0TGWxc
         PfxQ==
X-Gm-Message-State: ACrzQf09VtR2ufUqk40ZEV0bkKVU/AmMzeSMw6PaDs+jqD9XkMxH5jtB
	KFIjban0qbHjpF2B76vgDx7mxquu/VQ1NAsS9JnfuQ==
X-Google-Smtp-Source: AMsMyM4aSI6BLQ/jCjVUkOo/hk2Rn1u7Y9p8ashAYqUw9TKQwDP4g3OmF6ynWNhT3kG/v6Q8x93bRBFLbXHIqmfrKLE=
X-Received: by 2002:a17:906:eec7:b0:733:189f:b07a with SMTP id
 wu7-20020a170906eec700b00733189fb07amr2774018ejb.230.1665120879890; Thu, 06
 Oct 2022 22:34:39 -0700 (PDT)
MIME-Version: 1.0
References: <YzQ6pqykLhJVeD2p@infradead.org> <mhng-96bfb7a5-6579-4ebc-9517-db2e62d2f82b@palmer-ri-x1c9>
In-Reply-To: <mhng-96bfb7a5-6579-4ebc-9517-db2e62d2f82b@palmer-ri-x1c9>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 7 Oct 2022 11:04:28 +0530
Message-ID: <CAAhSdy15JqNAiuv84OogmoxyxwXE3EJzadfZk-wNcoUUXJ-fJQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] RISC-V: Fix ioremap_cache() and ioremap_wc() for
 systems with Svpbmt
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Christoph Hellwig <hch@infradead.org>, apatel@ventanamicro.com, 
	Paul Walmsley <paul.walmsley@sifive.com>, atishp@atishpatra.org, heiko@sntech.de, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	mchitale@ventanamicro.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221006_223443_691556_2A4CEE20 
X-CRM114-Status: GOOD (  18.51  )
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

On Fri, Oct 7, 2022 at 9:20 AM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> On Wed, 28 Sep 2022 05:14:30 PDT (-0700), Christoph Hellwig wrote:
> > On Thu, Sep 22, 2022 at 09:35:56AM -0700, Palmer Dabbelt wrote:
> >> Sorry I missed this, I thought it was just part of the rest of this patch
> >> set.  That said, I'm not actually sure this is a critical fix: sure it's a
> >> performance problem, and if some driver is expecting ioremap_cache() to go
> >> fast then possibly a pretty big one, but the only Svpmbt hardware that
> >
> > More importantly nothing should be using ioremap_cache at all.  It is
> > an API that has long been deprecated in favor of memremap.
>
> There's a few uses of it, I just send along a patch to make it
> arch-specific and make the users depend on it.  That should let us stop
> adding this to ports just to get the drivers building.

I agree, ioremap_cache() should not be used by drivers.

I encountered this issue with the PMEM driver which uses devm_memremap()
which in-turn calls memremap() (kernel/iomem.c). The kernel memremap()
still expects arch-specific ioremap_xyz() functions/macros to implement various
MEMREMAP_xyz flags which is why we need these RISC-V specific ioremap_xyz().

An alternative way is to implement RISC-V specific arch_memremap_wb()
but this will still look similar to ioremap_cache() added by this patch. Also,
only 32bit ARM implements arch_memremap_wb() whereas all other archs
(ARM64, x86_64, etc) implement ioremap_xyz() functions/macros.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
