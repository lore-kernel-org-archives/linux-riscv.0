Return-Path: <SRS0=91Bs=CN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C3CBC433E2
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 20:10:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1AE4320665
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2020 20:10:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="s/+Gu/w3";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="hJ3WmZA7"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1AE4320665
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=d2GRVDWKW2gschZiQcFvU6QtyzkrUdZoUdRpOzIvPxs=; b=s/+Gu/w308Q5b0iJo7V63/BIw
	wDgVSiNBYQnlj8naXIKOjZVCmk5NC7SuQkinHdbB7zpeZJIxnFhxuiAr39twWjpejaO6ijoPKjkqf
	9xJ6hrpOuEaTTeCq189JcHJ9Z96Hg+RIfqyrAgBP7fc2JzO641eELVkMfVTN6zvoFg1eS2UAkYqgi
	k19bD6lE//6qYEs9XZnWUVI2aq/ZmQqR4p+0K97bCmqw6Zm4LWIOHSHznLukD0EFQx19M0v0HWnBA
	TVgEkBFGzK4QMeZ8IAqYomES9MxvQ8kEOWx0iGBK8a9G4LYztuMJH2sJ1M6jgdOcmryC3rs3F1RJ0
	4HekmGxPQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kEI29-0001hG-78; Fri, 04 Sep 2020 20:10:05 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kEI27-0001gD-C8
 for linux-riscv@lists.infradead.org; Fri, 04 Sep 2020 20:10:04 +0000
Received: by mail-pg1-x544.google.com with SMTP id m5so4869308pgj.9
 for <linux-riscv@lists.infradead.org>; Fri, 04 Sep 2020 13:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=KJ5NxE/Sb6vg2FlBfCPguPeBw4GYPPc+Jx6ElFQ+lVk=;
 b=hJ3WmZA7gEEz+H1WLmMkcHdQk079WgWN2Jghvkz4jwGsYwuMpM3+IoXFRbd+5IybMD
 hPRwI8GnwqsqEtnP2YmOvrj2sTufMq2VH1W/5c6SGC3ORWlwzhDiyjLzaEbO7fGSeq4s
 RhaeWSKtfxm6L4sByoQ1C/zsAZbtqGXsdQokKOlQdOkMoqelUMPWrKID/vvaXGKMhfny
 Aq1cmcd8z8sZxvhL62TiVrBUezigtar0E7wEsDCZxq4IKOjCOXBtQoZ2bGFd/JZogUAW
 HnIzIsdveHt3lNk5PSoscfX/FmHtVpclh3yeOAZ+IXx1QpJFwsT/Y4lppOY51TRFF/6E
 j6cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=KJ5NxE/Sb6vg2FlBfCPguPeBw4GYPPc+Jx6ElFQ+lVk=;
 b=LO0QhXCijGb8IdvCIR/KsB0ySe2hwAWbu0wJgDq+DseeyllJOOe6eDKW1SeFxTIIbe
 LYmJIgf1ueLmdel7qc4zRv+l0mU6cz7ctP3mYFMgULZrPC38XXC5C3ldxKy9g177ZEFi
 9kX3BBn2r175vCc3GNVz2OftcdAhu1DjBi63pzmQ8xVGaA9FMca/cXzAjIQmnnec1Wcv
 pdYu1n165vFWwdGDpFxySBzm3hVax38c+LdojxAH2g6pU45nB6Y2ZDRqsQAzUBMe3ftm
 ytYRrQvDBVLnF2oPR1Z3bKcBcPnyz0bC3R5Bvt55L6Wn8O9CVv1wISYH6PlktgVzhSeZ
 TQjA==
X-Gm-Message-State: AOAM5308tMrKFzHGOz7VemXZVJiQ9x5kJKy+CvBLMVRQK/hM2Wreh++9
 FGtw3Tw7GOxWUJjVfgml45Lq+g==
X-Google-Smtp-Source: ABdhPJwQd97Fevygs/QwspxX0CSO78eU2bGnQ7igysCzU4on56F/oWWChWBWpxi1thWzW5vN4SdgOA==
X-Received: by 2002:a63:e249:: with SMTP id y9mr8619036pgj.117.1599250201009; 
 Fri, 04 Sep 2020 13:10:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 82sm6442524pgd.6.2020.09.04.13.10.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Sep 2020 13:10:00 -0700 (PDT)
Date: Fri, 04 Sep 2020 13:10:00 -0700 (PDT)
X-Google-Original-Date: Fri, 04 Sep 2020 13:09:58 PDT (-0700)
Subject: Re: [PATCH v4 0/3] Get cache information from userland
In-Reply-To: <cover.1598859038.git.zong.li@sifive.com>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com
Message-ID: <mhng-68e2fbf7-f87b-4a31-acaa-eed3e788fd7f@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200904_161003_454493_1A56E749 
X-CRM114-Status: GOOD (  20.85  )
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
Cc: david.abdurachmanov@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, zong.li@sifive.com,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 31 Aug 2020 00:33:47 PDT (-0700), zong.li@sifive.com wrote:
> There are no standard CSR registers to provide cache information, the
> way for RISC-V is to get this information from DT. Currently, AT_L1I_X,
> AT_L1D_X and AT_L2_X are present in glibc header, and sysconf syscall
> could use them to get information of cache through AUX vector. We
> exploit 'struct cacheinfo' to obtain the information of cache, then we
> don't need additional variable or data structure to record it.
>
> We also need some works in glibc, but we have to support the function in
> kernel first by rule of glibc, then post the patch to glibc site.
>
> The result of 'getconf -a' as follows:
>
> LEVEL1_ICACHE_SIZE                 32768
> LEVEL1_ICACHE_ASSOC                8
> LEVEL1_ICACHE_LINESIZE             64
> LEVEL1_DCACHE_SIZE                 32768
> LEVEL1_DCACHE_ASSOC                8
> LEVEL1_DCACHE_LINESIZE             64
> LEVEL2_CACHE_SIZE                  2097152
> LEVEL2_CACHE_ASSOC                 32
> LEVEL2_CACHE_LINESIZE              64
>
> Changed in v4:
>   - Check null pointer before use.
>   - Re-write the code for readability.
>   - Rebase source to v5.9-rc3.
>
> Changed in v3:
>   - Fix sparse warning: Use NULL instead of integer 0.
>
> Changed in v2:
>   - Add error checking for parsing cache properties.
>
> Zong Li (3):
>   riscv: Set more data to cacheinfo
>   riscv: Define AT_VECTOR_SIZE_ARCH for ARCH_DLINFO
>   riscv: Add cache information in AUX vector
>
>  arch/riscv/include/asm/cacheinfo.h   |  5 ++
>  arch/riscv/include/asm/elf.h         | 13 ++++
>  arch/riscv/include/uapi/asm/auxvec.h | 24 +++++++
>  arch/riscv/kernel/cacheinfo.c        | 98 +++++++++++++++++++++++-----
>  4 files changed, 124 insertions(+), 16 deletions(-)

Ah, I just saw these so they're in instead of the v2.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
