Return-Path: <SRS0=e5NN=MK=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE9F9C43143
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Sep 2018 23:52:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C421206B6
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 28 Sep 2018 23:52:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RSZ6Sji2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="atpTXFAE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9C421206B6
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=mMVglvgVVSuRtUyUm3NQoq4sFXY3CTUi80AHLpe/DHQ=; b=RSZ6Sji2RG+ObV4A0c47HGJWS
	SKR2naCoGTITgHGLRmTa+2ahjO0HZLRcSnnHUDGcdaFtC/5+FeriZlx3HLki210qe6SHwiyp34TBi
	YQwSQ1fDRU7ii50Ac1yddxViZQAE00zkRceuqoK54Q3vfzu02yv+r5FeBLWzRYWCDWnbWM8as/YxE
	OKVWCq+eUpgGQKPVuU/gFNV5ZU8PrAoxvvLL7jFva/hyeLmzRvbf59kvIVg3yyRGaRDQRWpJe+rG8
	ycQfvi6jG44CyUbGCsifptK/5WHtfXkDz+eZsERlAGT4Y+1q6aeg3cu6ZdNRthpzB6PCtZTZAa3ea
	Bjk2Ig+yg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g62Yv-0007dP-Mf; Fri, 28 Sep 2018 23:52:45 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g62Yh-0007aN-Mc
 for linux-riscv@lists.infradead.org; Fri, 28 Sep 2018 23:52:43 +0000
Received: by mail-pf1-x444.google.com with SMTP id k19-v6so5321057pfi.1
 for <linux-riscv@lists.infradead.org>; Fri, 28 Sep 2018 16:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=OnT54z5lgaA9LYwi8+7ZPe4Iw8qJqNThCDiT5afzxE4=;
 b=atpTXFAEOoVV2Tvoe/9xuQpRmltCARrRutFpFsk+ykbLsKU5ERcJDUx1mp5ld5ifgu
 nUDEkY2DxLclyHaElK90g6rSNPRbOjFghnN5hhZR8jqzX/ioy859l8mV1OJsD2Kl6kfe
 Qu3yrg8O2uQQHcTG2Kag09wMY0DAWashv7IuPzaSstz5WNaBaRJuZ+STIkiKI7awiJRV
 LEkyBqs9nCStga4WUsICeU+YwXOrXEvE6hcjtsftkw5wFqpv83IwDb2TxoHVwZuQfkZx
 cgAwNrTL/Htwdv7NYY3pr7tBfXE7sjeMkW1J+vSXUTdFQtX7MiB9E8irxCDm2AbQ8zvR
 ZCnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=OnT54z5lgaA9LYwi8+7ZPe4Iw8qJqNThCDiT5afzxE4=;
 b=QzKIY20ZWzpnYbw5N/pSffuNfvsNlYG0d1+R2ZK+NB/K+yV58AzilofPBD5M9xxB1G
 OANGOGAAjI2Vi7B2QXGIiheNttoCliNy1U6uD2vrIEY5Ph3Utgh9NX2dAUHz9Q29wmJq
 HSUV11gATsgbSqHEmOIjTgy2V6tIZvs73uu6LsiugoKXb/4WNQRXXwWPCJSv9EybL0UC
 VnDCrh74GgPOhVLIORGorDvl3uDNp7TDJk/jwWQcYv4uzG8+71jEGYbewgTj+TuueRR6
 TPpqUjl7U6/YVw07vxrBmYp8b2ZdCk3OUlZz1ewLEKhpH5DRl40yT6sotEVDU6aNc1Vn
 a1ZA==
X-Gm-Message-State: ABuFfogvjRobLJfzIkia5dy9D52nRxxeK/tLSLhRsSWO701hrCoB0pht
 fwSoFvRRKvSVRbr7v9JUIr445A6raWU=
X-Google-Smtp-Source: ACcGV61Pix4ATLo985K1Eza8oxcyndnQwfnEvur90Met3eYk/2XQiDEm1cxLA8k4Mr07M6SNzmNiJw==
X-Received: by 2002:a62:34c4:: with SMTP id
 b187-v6mr826125pfa.15.1538178740272; 
 Fri, 28 Sep 2018 16:52:20 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id y3-v6sm10237794pfi.24.2018.09.28.16.52.18
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 28 Sep 2018 16:52:19 -0700 (PDT)
Date: Fri, 28 Sep 2018 16:52:19 -0700 (PDT)
X-Google-Original-Date: Fri, 28 Sep 2018 16:51:53 PDT (-0700)
Subject: Re: [PATCH v2 0/5] Fix some bugs on RV32 build fail and issue
In-Reply-To: <cover.1537949825.git.zongbox@gmail.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: zongbox@gmail.com, Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-1934187c-6fab-4000-af19-23a80173669d@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20180928_165231_791942_BD0D3A50 
X-CRM114-Status: GOOD (  16.22  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: vincentc@andestech.com, aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
 zongbox@gmail.com, zong@andestech.com, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20180928235219.p0vopqfZ5oqELHeA043J35D8vy0VhQx5SK_htz8NWGE@z>

On Wed, 26 Sep 2018 01:31:09 PDT (-0700), zongbox@gmail.com wrote:
> This patches contain the modificaion as follows:
> 1. Fix up the building fail on RV32.
> 2. Add umoddi3 and udivmoddi4 functions for RV32.
> 3. Fix ioremap problem on RV32.
>
> Changes in v2:
>  - Retain the copyright notices from libgcc in umoddi3.c and udivmoddi4.c.
>
> Vincent Chen (1):
>   RISC-V: Avoid corrupting the upper 32-bit of phys_addr_t in ioremap
>
> Zong Li (4):
>   RISC-V: Build tishift only on 64-bit
>   RISC-V: Use swiotlb on RV64 only
>   lib: Add umoddi3 and udivmoddi4 of GCC library routines
>   RISC-V: Select GENERIC_LIB_UMODDI3 on RV32
>
>  arch/riscv/Kconfig        |   1 +
>  arch/riscv/kernel/setup.c |   3 +
>  arch/riscv/lib/Makefile   |   3 +-
>  arch/riscv/mm/ioremap.c   |   2 +-
>  lib/Kconfig               |   3 +
>  lib/Makefile              |   1 +
>  lib/udivmoddi4.c          | 309 ++++++++++++++++++++++++++++++++++++++++++++++
>  lib/umoddi3.c             |  34 +++++
>  8 files changed, 354 insertions(+), 2 deletions(-)
>  create mode 100644 lib/udivmoddi4.c
>  create mode 100644 lib/umoddi3.c

I like what this does, but there's a license issue here that Christoph pointed 
out.  It'd be great to have RV32I systems booting 4.19, do you think there's a 
chance you can sort this out next week so we can get it into the last RC?  That 
would help with the rv32i glibc process, as we'll actually be able to boot an 
upstream kernel.

It looks like the functions we have an issue with come from libgcc2.c, which 
doesn't change very much.  As far as I can tell we might be able to get away 
with these functions from 4.2.1, which was licensed under the GPLv2.  Here's 
the relevant functions on GCC's github mirror

    https://github.com/gcc-mirror/gcc/blob/gcc-4_2_1-release/gcc/libgcc2.c#L559
    https://github.com/gcc-mirror/gcc/blob/gcc-4_2_1-release/gcc/libgcc2.c#L844

These look very similar to what you send out.  As far as I can tell, if you 
base your code on the GPLv2 version then this should be fine to include.

Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
