Return-Path: <SRS0=l78j=AZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 748DBC433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 01:21:42 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 483C721927
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2020 01:21:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B5+65Azy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ltI+Rvit"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 483C721927
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=Wp48O0cq/nR9SER8KiAmoewXIHKnJ1xbM3CytxiHNQQ=; b=B5+65AzyNTai9tA9CkWUK+sO7
	FHBw+NN0kIvfjrbActCE1wr+LBH9FgI8f30ryzG50dvwM6fIEgwWAH25hbEW2tcCPt70BwKt2LC9U
	FnysjZyb6r3NNphaIMShBYlJNU8dy+aC1biG+5pgEJrPyiyfbB6OUl2PfHvBrwwbOFeyxDfF5wWTp
	68C2ANVqVWFstDn6jN+wcNvw9A8/WGlVD0JrGjhK6oymu8iul5Sk0sorzLe2dJwc+LTDJFcYsmhRo
	/6eI2gs/K/NyfN48wMsoly+TjKu4OMkvk9GeipjSSh23PMS4JY1yGTqyFk3WTgdj38vnk4yVNzM5s
	AoUL2E7Vw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jv9dO-0005Z0-Qz; Tue, 14 Jul 2020 01:21:26 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jv9dL-0005YE-QX
 for linux-riscv@lists.infradead.org; Tue, 14 Jul 2020 01:21:25 +0000
Received: by mail-pl1-x642.google.com with SMTP id q17so6306687pls.9
 for <linux-riscv@lists.infradead.org>; Mon, 13 Jul 2020 18:21:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=zvSI3OjoVb8tpDYvot+9q5FUu3TeCKpa/+uTMzznHVg=;
 b=ltI+RvitHzqSOo3/apQgptCE75vP9cVTGeNKDzkeZPuRaSYtDPz2gO707TjvrOyTk6
 CxzFH0PiZOpWVlD1xcP2UAPnLjqYbxUIcGZJ7aXNT8Za58nuOwhr7VoUVqLNqlZrehgL
 mYwyUkLvNbPtZ28gVAwqWL3kfRswYkAbp/wtc002FexJt3cgcaH1H5jUDH6s0Ovutwq7
 fSSZ7nwNY5Yrw2q9IxHvmVq0kpFqmnOMml3eQ6dNURsqi0L757Jqqne9Thb4BdAcyWnv
 CXQjQ68xmJnKiVWxUtSHknsJeyQ2aGgIOk4bOI3leKQIpKWsZtC79eeWRzgvMsOEFN5B
 3B+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=zvSI3OjoVb8tpDYvot+9q5FUu3TeCKpa/+uTMzznHVg=;
 b=PnIhspA8SD8Xmvhz1FJegbkhCFmlVKi2XXCSL3FL8Prds2+5/obm+h1HP2PuE+HSyf
 OcSG9ScutFjThV235GYIN4aX5SRA8oLqd57oD8cMk6svnklhpfxK/1yZs3wGBewPOHyQ
 lFBwUEf522UuqGZLpMfdWpShYxsMXpz61sAQx7X+MwxwpBbReth7eF//NL8iMUnPLnf3
 0exo8WgDrmHLVNhTyjzGvy1ymI/z+WPgimDRZ6M9QkiEcWV4p5qTSAjxqU55KuKcZyOu
 NAY2IKhRt/am9aAa9p0oonNfhWM414QrCVOXSXJLcTecOIJZdBO0bgW9buuUBzUeP8q6
 Iw3A==
X-Gm-Message-State: AOAM532+M7WgQsSvzSHy3IqBHAHy0ycQAyOBpZK+B0cMeQIXrhW1DeOJ
 r3RdT847U2GmziB8/B22PxT7i6iJEpg=
X-Google-Smtp-Source: ABdhPJwIl05USTlypjnwa/dnt9zoOtjgZBNEC955cHcnrT5lbjBGhZLn+Rs3aRboBu/XAyw6I87k2A==
X-Received: by 2002:a17:90b:390e:: with SMTP id
 ob14mr1872398pjb.221.1594689681194; 
 Mon, 13 Jul 2020 18:21:21 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id f131sm14259095pgc.14.2020.07.13.18.21.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 18:21:20 -0700 (PDT)
Date: Mon, 13 Jul 2020 18:21:20 -0700 (PDT)
X-Google-Original-Date: Mon, 13 Jul 2020 17:23:38 PDT (-0700)
Subject: Re: [RESEND PATCH] riscv: Move nommu pgprot_* macros to pgtable.h
In-Reply-To: <20200630062827.16589-1-penberg@gmail.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: penberg@gmail.com
Message-ID: <mhng-ca438661-49c2-4d6b-b8ab-c2f5eca9a806@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200713_212124_017041_359C7EB1 
X-CRM114-Status: GOOD (  21.42  )
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
Cc: penberg@kernel.org, linux-riscv@lists.infradead.org, aou@eecs.berkeley.edu,
 wangkefeng.wang@huawei.com, Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 29 Jun 2020 23:28:28 PDT (-0700), penberg@gmail.com wrote:
> From: Pekka Enberg <penberg@kernel.org>
>
> The mmio.h header file defines some pgprot macros for !CONFIG_MMU, but
> pgtable.h seems like a better place for them.
>
> Compile tested with defconfig + !CONFIG_MMU.
>
> Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
> Signed-off-by: Pekka Enberg <penberg@kernel.org>
> ---
> Although the patche appeard on the mailing list, they never made it to
> the inbox of some important folks such as maintainers... I assume the
> reason is that "git-send-email" used "penberg@kernel.org" in the email
> headers when it really was sent from "penberg@gmail.com".
>
>  arch/riscv/include/asm/mmio.h    | 6 ------
>  arch/riscv/include/asm/pgtable.h | 4 ++++
>  2 files changed, 4 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/include/asm/mmio.h b/arch/riscv/include/asm/mmio.h
> index 56053c9838b2..aff6c33ab0c0 100644
> --- a/arch/riscv/include/asm/mmio.h
> +++ b/arch/riscv/include/asm/mmio.h
> @@ -14,12 +14,6 @@
>  #include <linux/types.h>
>  #include <asm/mmiowb.h>
>
> -#ifndef CONFIG_MMU
> -#define pgprot_noncached(x)	(x)
> -#define pgprot_writecombine(x)	(x)
> -#define pgprot_device(x)	(x)
> -#endif /* CONFIG_MMU */
> -
>  /* Generic IO read/write.  These perform native-endian accesses. */
>  #define __raw_writeb __raw_writeb
>  static inline void __raw_writeb(u8 val, volatile void __iomem *addr)
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index eaea1f717010..e82a32112b7e 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -459,6 +459,10 @@ static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>
>  static inline void __kernel_map_pages(struct page *page, int numpages, int enable) {}
>
> +#define pgprot_noncached(x)	(x)
> +#define pgprot_writecombine(x)	(x)
> +#define pgprot_device(x)	(x)
> +
>  #endif /* !CONFIG_MMU */
>
>  #define kern_addr_valid(addr)   (1) /* FIXME */

This seems fine, but I guess I don't understand why they don't have default
values in the generic code for !MMU.  It kind of seems like it's an oversight
due to nested #ifdefs.  Assuming that's the case, we can just juggle those
around and then remove these from all the ports that define the now useless
macros.

LMK if you want to pursue that or if you want me to take it over.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
