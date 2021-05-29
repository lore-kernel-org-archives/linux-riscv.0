Return-Path: <SRS0=5xGv=KY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12022C4708F
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:08:41 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC1CF61090
	for <linux-riscv@archiver.kernel.org>; Sat, 29 May 2021 23:08:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BC1CF61090
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=z359v0+bytwy/pg63+HFo6nlH/n3hYe6oBFfoHkLWuI=; b=0M2+tMinBNiMBunOIkctZ34i1O
	kTz/xygbPiLAXGPWj8SyEPdxozNRBmBU53gEwh7F2pf8+f6IVW5Ps3wdP+K4nfgJPclQ+8vUnQ8D9
	do1WUlhy0oyH2C4c3m/WjUWCsN5BDVQQc9YzGSJdLetuOXaxbKo2Kuv0ljzqRGfs8ASHiw9W3O+vG
	oLqGSDlblIodBEjcfYLesOMzY8fNXZX4BkPc19hgk2r0Y8m28KwRr1f9K92xO8Xui7PnJpDHr7b3/
	bs5v92c+KAV5M0RKRHci/ApoiK88mW1+iC2BhwnQvBYaM42+ZIcQzE7RVSAhfxHcKs7ykH1wpdI3K
	JxZuz3ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ln849-008Y2J-AG; Sat, 29 May 2021 23:08:25 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ln847-008Y16-02
 for linux-riscv@lists.infradead.org; Sat, 29 May 2021 23:08:24 +0000
Received: by mail-pj1-x1029.google.com with SMTP id f8so4568612pjh.0
 for <linux-riscv@lists.infradead.org>; Sat, 29 May 2021 16:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=qss0x+5sHCW7H4avOnfrc4/iwaDvuVYHTQ7IXox97jI=;
 b=FwnxWJLhicCZPG6FDqH6ssQblDovkkGj63nfCN2c9eZ0cVUk2N4D5mIYhjEPJKjVfW
 NqXBY8uuErmw/KEKK+/+bx/UGMmhonkcTlT5+Hd4fBSjtzzhyAyIS/cK3f0Ctm0A04mI
 vuMman8k2T1QvcXXZGM3wsXAPEPmTwnPaC/7OIyBzY4TXCsR00+sbQkTrVKDFCunq64x
 AcQe2B4lrAaQhCj0L8xaG7DVGaoqKGw9DXaYRNARQxlwbNXMBO1wgDyKqjixfwzU3eQf
 PsytkA6CSCuDrWeWYkhaUtPnNJK1PJ4iozQ7a1nm1OPL6+zHY/URtWXfDmAaJPDsA3ld
 cavQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=qss0x+5sHCW7H4avOnfrc4/iwaDvuVYHTQ7IXox97jI=;
 b=qecvN5cuvo6vaqoWDiwNEjaA2LrQ76xqciyf4UyFS+qP/8MbTtodoGj1n1C88Se4ra
 dUpZ3ZxSjoM47gQ+cV44OvDOgPtVuAlyTjKLbkJWbEAVpjtXiDwK4FPK2S98NKRo+jsy
 TS5KKvhTSbLnnw0WgAmY1e0w4c+GV4KdAQ8fwLhZivW3DdSwlQ2sEBKtsc/XALQl2RkY
 lWhMGX+GzGSa2wIBAylNvdb9/puj2BnHfkQv3HcTb4J/10o2mvMnCZUv4C4hhmYXTxtE
 K6KXInaSt+4J0ryDsZDMyXQ5JemlNmllFZfSeUrkgu69mENy7I8CLq8bDNV/dAxjs8Yn
 ueHg==
X-Gm-Message-State: AOAM530Kx/N0EDfnBTG2OqXfXT5jf8QzFOvkXnDxbSDzqvrkBHbkXrq4
 dQhtteX1EOdTidTaxJvMm52R2w==
X-Google-Smtp-Source: ABdhPJzrWRNEm5ifiRm0JTVwjK2OCpXjOulal+R0YAqOyyJ2AkYsuIY448mYbv2VRTVX+ccVnODgsA==
X-Received: by 2002:a17:902:ab95:b029:ee:f899:6fe8 with SMTP id
 f21-20020a170902ab95b02900eef8996fe8mr13937488plr.81.1622329697639; 
 Sat, 29 May 2021 16:08:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id i16sm7281143pji.30.2021.05.29.16.08.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 May 2021 16:08:17 -0700 (PDT)
Date: Sat, 29 May 2021 16:08:17 -0700 (PDT)
X-Google-Original-Date: Sat, 29 May 2021 16:07:41 PDT (-0700)
Subject: Re: [PATCH] arch: Cleanup unused functions
In-Reply-To: <1621945234-37878-1-git-send-email-guoren@kernel.org>
CC: guoren@kernel.org, Anup Patel <Anup.Patel@wdc.com>,
 Arnd Bergmann <arnd@arndb.de>, Christoph Hellwig <hch@lst.de>,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-sunxi@lists.linux.dev, guoren@linux.alibaba.com, monstr@monstr.eu
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-93a12abf-0283-4ec3-a521-89b8d882654f@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210529_160823_074647_54A75D44 
X-CRM114-Status: GOOD (  20.20  )
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

On Tue, 25 May 2021 05:20:34 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
> These functions haven't been used, so just remove them. The patch
> has been tested with riscv, but I only use grep to check the
> microblaze's.
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Michal Simek <monstr@monstr.eu>
> Cc: Christoph Hellwig <hch@lst.de>
> ---
>  arch/microblaze/include/asm/page.h |  3 ---
>  arch/riscv/include/asm/page.h      | 10 ----------
>  2 files changed, 13 deletions(-)
>
> diff --git a/arch/microblaze/include/asm/page.h b/arch/microblaze/include/asm/page.h
> index bf681f2..ce55097 100644
> --- a/arch/microblaze/include/asm/page.h
> +++ b/arch/microblaze/include/asm/page.h
> @@ -35,9 +35,6 @@
>
>  #define ARCH_SLAB_MINALIGN	L1_CACHE_BYTES
>
> -#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
> -
>  /*
>   * PAGE_OFFSET -- the first address of the first page of memory. With MMU
>   * it is set to the kernel start address (aligned on a page boundary).
> diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
> index 6a7761c..a1b888f 100644
> --- a/arch/riscv/include/asm/page.h
> +++ b/arch/riscv/include/asm/page.h
> @@ -37,16 +37,6 @@
>
>  #ifndef __ASSEMBLY__
>
> -#define PAGE_UP(addr)	(((addr)+((PAGE_SIZE)-1))&(~((PAGE_SIZE)-1)))
> -#define PAGE_DOWN(addr)	((addr)&(~((PAGE_SIZE)-1)))
> -
> -/* align addr on a size boundary - adjust address up/down if needed */
> -#define _ALIGN_UP(addr, size)	(((addr)+((size)-1))&(~((size)-1)))
> -#define _ALIGN_DOWN(addr, size)	((addr)&(~((size)-1)))
> -
> -/* align addr on a size boundary - adjust address up if needed */
> -#define _ALIGN(addr, size)	_ALIGN_UP(addr, size)
> -
>  #define clear_page(pgaddr)			memset((pgaddr), 0, PAGE_SIZE)
>  #define copy_page(to, from)			memcpy((to), (from), PAGE_SIZE)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

It's generally easier if you split this sort of stuff up, as it'll be 
easier to merge if we don't have to coordinate between the trees.  I'm 
happy to take this, but I'd prefer an Ack from one of the microblaze 
folks first.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
