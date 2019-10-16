Return-Path: <SRS0=Ypxe=YJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F5F5ECE588
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2019 07:50:04 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 151D82082C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2019 07:50:04 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p7qcsXNU";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="JDRvwufl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 151D82082C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bI9ABXl9gKEWEiGjGltmYLxi6EPWNXxoLJgWcj4bvMI=; b=p7qcsXNU5rq3rl
	ZpX7fVDF1kY4J7eSS9U87vhaVdNIuOtemKXl4TEhvWxqmcHC5akD3wmvhLY0UitFR3bzN0sAlr7sL
	JquR4LoIaB+FyWQk10E8D6Vz133UdqOhg1DKM3cDeSeWzMezxFkxvwbO9SWZEBb8Iia+rTK4UdRSk
	xkU+hHaAP77c0ORVR70ULOuwcoLcKXXLiV2yPctzvQIvFDcwbnmqzZ2NAj2lYyv9axIGKcJKcPOcZ
	KMR7Qd4uT579QFpiq67IQLIi8h/QfMOnm/OHqgwhVV/GmdWsQICxTBm3ouu9OgVziPmEHi/Mw1Oth
	jkCSknYG3dFIeaIWcMIA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iKe4J-0002Co-2j; Wed, 16 Oct 2019 07:50:03 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iKe4F-00020V-O8
 for linux-riscv@lists.infradead.org; Wed, 16 Oct 2019 07:50:01 +0000
Received: by mail-wm1-x342.google.com with SMTP id y21so1629524wmi.0
 for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2019 00:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Of9U+idySm1f7zahNIvCqAevKwBri2ZmJMTLKSSsyAM=;
 b=JDRvwuflF5JjJLkwOlEL2zXx2Czdzdk9RV9OXNAYOpDXXQ4yv0GekH0yOJQe1pT7O2
 IRKQSJMqSBmS6z2WLJC1ofVqU8cSOIgIGXwY6bmOjrqCkWReRrv8leYVraJrh9DmU3r7
 0/Ygo/0nut2WZSooZoC9k31IeP/GV7VM4gJbdtZzwwgBFKv1G4ecEZdHYVJ0KaX7f2GQ
 v7ABD7pi/PISIFSmTixlj/iWL2w6meSHc1pqL2Mne5K9Vo9yPM4Qt82NpO7SuJO4v6P0
 mAUI4EpTdWMiwujK0Z0h5B2BvJIAjQAO++ja/8NStba6ltxtj9uzBAaWaqqaURNnVnyo
 vY4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Of9U+idySm1f7zahNIvCqAevKwBri2ZmJMTLKSSsyAM=;
 b=YTGd0Vha9jZ9O9reQ+Oi0tsVR6CMY8mLmiMbxW1gQbRpVyzdg8/m4LeMwVyog94wSD
 QC5S3YnrOQj9ZDd8TwHSwKut1qtrxlx/I2/UemUKhAcArIzsn+eqjSJBIW+g/0fw6jr0
 BmHGO17SyCKaetFSE5jmhQn/Qb1Sk1cq0s7+JROi29vnMpzXwxm1E8LC0dEaBYUHh3kN
 gGauASzSw3Wp3rhPH5NrUMrGM7qNDeUrOWqAMfrc1eOm31Jw1MjqzsAeoU19PGtZ4b8p
 OWICplKoOAlJ1gu2joM6om+MnxStII62vEXdYu8usbt/CIrKwJPooO+m003ddFpg/q4G
 dETQ==
X-Gm-Message-State: APjAAAWTI0BOckD1J2F4dfiyEX/GRy8lboab/poXTGu7qFXZJHRX9xzG
 awT7SvKyHlPDiV9xW5eMYGfThGg1uiSMBmVQ2lfi/g==
X-Google-Smtp-Source: APXvYqz3LCGD0ihBV0I11F3X+PJJZ+xeWK2dkBbT4TN59RQ/UGEIL7SmGAdg9INWz7ievs7QPV0ci0GAdJyvMVB+QuY=
X-Received: by 2002:a05:600c:214f:: with SMTP id
 v15mr2001725wml.177.1571212197232; 
 Wed, 16 Oct 2019 00:49:57 -0700 (PDT)
MIME-Version: 1.0
References: <20191016073408.7299-1-greentime.hu@sifive.com>
In-Reply-To: <20191016073408.7299-1-greentime.hu@sifive.com>
From: Anup Patel <anup@brainfault.org>
Date: Wed, 16 Oct 2019 13:19:45 +0530
Message-ID: <CAAhSdy275aL_hicDWUBKF+9_dr+FWfvZi0__Zm2=FzzpkYj22w@mail.gmail.com>
Subject: Re: [PATCH] RISC-V: fix virtual address overlapped in FIXADDR_START
 and VMEMMAP_START
To: greentime.hu@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191016_004959_815244_D40B75DF 
X-CRM114-Status: GOOD (  15.24  )
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
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Palmer Dabbelt <palmer@sifive.com>, Greentime Hu <green.hu@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Oct 16, 2019 at 1:04 PM <greentime.hu@sifive.com> wrote:
>
> From: Greentime Hu <greentime.hu@sifive.com>
>
> This patch fixes the virtual address layout in pgtable.h.
> The virtual address of FIXADDR_START and VMEMMAP_START should not be overlapped.
> These addresses will be existed at the same time in Linux kernel that they can't
> be overlapped.
>
> Fixes: d95f1a542c3d ("RISC-V: Implement sparsemem")
> Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 4f4162d90586..b927fb4ecf1c 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -87,14 +87,6 @@ extern pgd_t swapper_pg_dir[];
>  #define VMALLOC_END      (PAGE_OFFSET - 1)
>  #define VMALLOC_START    (PAGE_OFFSET - VMALLOC_SIZE)
>
> -#define FIXADDR_TOP      VMALLOC_START
> -#ifdef CONFIG_64BIT
> -#define FIXADDR_SIZE     PMD_SIZE
> -#else
> -#define FIXADDR_SIZE     PGDIR_SIZE
> -#endif
> -#define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
> -
>  /*
>   * Roughly size the vmemmap space to be large enough to fit enough
>   * struct pages to map half the virtual address space. Then
> @@ -108,6 +100,14 @@ extern pgd_t swapper_pg_dir[];
>
>  #define vmemmap                ((struct page *)VMEMMAP_START)
>
> +#define FIXADDR_TOP      (VMEMMAP_START)
> +#ifdef CONFIG_64BIT
> +#define FIXADDR_SIZE     PMD_SIZE
> +#else
> +#define FIXADDR_SIZE     PGDIR_SIZE
> +#endif
> +#define FIXADDR_START    (FIXADDR_TOP - FIXADDR_SIZE)
> +
>  /*
>   * ZERO_PAGE is a global shared page that is always zero,
>   * used for zero-mapped memory areas, etc.
> --
> 2.17.1
>

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
