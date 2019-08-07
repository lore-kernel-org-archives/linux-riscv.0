Return-Path: <SRS0=DSzU=WD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D27BBC31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 00:19:18 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9EB3D2173C
	for <infradead-linux-riscv@archiver.kernel.org>; Wed,  7 Aug 2019 00:19:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NKUigcJN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9EB3D2173C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=andestech.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xmN3/jVUR/Z3h3r1SBxbDxfLftIwIovN8I1hD4ufdwQ=; b=NKUigcJNzTkd5a
	AuU05M2N6XaQflm76vcrsE4xNzsjXiJco3GRZPMGqem7m9r3Z6JEIFjnkKo27elx3n2aAZhyO8IEn
	dQvuUhNlHqTeiHg4TqnkAMO9vhgx5n5HWTSawBVouNGvL0J9y+M4LWzpGBI1umLJsjcyZMwWcezdM
	W+mwEhrKKIn8hHGhbQFRldIZev1EoQpL8nxdCdhkGL54nnEXS3su9BhEYM9Gws8f32JYJPjLPKa2F
	3o7o9TdUGC/xNILICopdOa+NZSdFigDGbAAKSurm/Y7guTfvkrZ0COPPBafKSGZlCOAVL9BuYObjm
	Q7FsiE0mVTsMdakLXzjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv9fh-0001BU-2B; Wed, 07 Aug 2019 00:19:17 +0000
Received: from 59-120-53-16.hinet-ip.hinet.net ([59.120.53.16]
 helo=ATCSQR.andestech.com)
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv9fd-0001B5-Ny
 for linux-riscv@lists.infradead.org; Wed, 07 Aug 2019 00:19:15 +0000
Received: from mail.andestech.com (atcpcs16.andestech.com [10.0.1.222])
 by ATCSQR.andestech.com with ESMTP id x7707lDs067769;
 Wed, 7 Aug 2019 08:07:47 +0800 (GMT-8)
 (envelope-from alankao@andestech.com)
Received: from andestech.com (10.0.15.65) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.123.3; Wed, 7 Aug 2019
 08:18:46 +0800
Date: Wed, 7 Aug 2019 08:18:46 +0800
From: Alan Kao <alankao@andestech.com>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] RISC-V: Remove udivdi3
Message-ID: <20190807001846.GA21655@andestech.com>
References: <20190807000508.9477-1-palmer@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190807000508.9477-1-palmer@sifive.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Originating-IP: [10.0.15.65]
X-DNSRBL: 
X-MAIL: ATCSQR.andestech.com x7707lDs067769
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_171914_037975_0D8A7A97 
X-CRM114-Status: GOOD (  12.18  )
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
Cc: linux-riscv@lists.infradead.org, Nicolas Pitre <nico@fluxnic.net>,
 Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Aug 06, 2019 at 05:05:08PM -0700, Palmer Dabbelt wrote:
> This should never have landed in the first place: it was added as part
> of 64-bit divide support for 32-bit systems, but the kernel doesn't
> allow this sort of division.  I must have forgotten to remove it.
> 
> This patch removes the support.  Since this routine only worked on
> 64-bit platforms but was only built on 32-bit platforms, it's
> essentially just nonsense anyway.
> 

It would be more complete if we add
"Reported-by: Eric Lin <tesheng@andestech.com>" here.

> Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
> Acked-by: Nicolas Pitre <nico@fluxnic.net>
> ---
>  arch/riscv/lib/Makefile  |  2 --
>  arch/riscv/lib/udivdi3.S | 32 --------------------------------
>  2 files changed, 34 deletions(-)
>  delete mode 100644 arch/riscv/lib/udivdi3.S
> 
> diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
> index 8e364ebf37de..267feaa10f6a 100644
> --- a/arch/riscv/lib/Makefile
> +++ b/arch/riscv/lib/Makefile
> @@ -5,5 +5,3 @@ lib-y	+= memset.o
>  lib-y	+= uaccess.o
>  
>  lib-$(CONFIG_64BIT) += tishift.o
> -
> -lib-$(CONFIG_32BIT) += udivdi3.o
> diff --git a/arch/riscv/lib/udivdi3.S b/arch/riscv/lib/udivdi3.S
> deleted file mode 100644
> index 3f07476a91a9..000000000000
> --- a/arch/riscv/lib/udivdi3.S
> +++ /dev/null
> @@ -1,32 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2016-2017 Free Software Foundation, Inc.
> - */
> -
> -#include <linux/linkage.h>
> -
> -ENTRY(__udivdi3)
> -	mv	a2, a1
> -	mv	a1, a0
> -	li	a0, -1
> -	beqz	a2, .L5
> -	li	a3, 1
> -	bgeu	a2, a1, .L2
> -.L1:
> -	blez	a2, .L2
> -	slli	a2, a2, 1
> -	slli	a3, a3, 1
> -	bgtu	a1, a2, .L1
> -.L2:
> -	li	a0, 0
> -.L3:
> -	bltu	a1, a2, .L4
> -	sub	a1, a1, a2
> -	or	a0, a0, a3
> -.L4:
> -	srli	a3, a3, 1
> -	srli	a2, a2, 1
> -	bnez	a3, .L3
> -.L5:
> -	ret
> -ENDPROC(__udivdi3)
> -- 
> 2.21.0
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
