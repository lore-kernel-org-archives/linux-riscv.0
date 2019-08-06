Return-Path: <SRS0=rJkP=WC=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B0EC31E40
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2019 15:08:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8883E2089E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2019 15:08:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="HAMHSJAp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="MLoies78"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8883E2089E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=v02+E0md/1LT+EyKvKuIeWNP8Z/JExmULrCsBhfk1Iw=; b=HAMHSJApoaPa7ugitmMp1y5Jn
	8tILpMGpAZY8AcldVCkiipU+kPrNGWnPIZ96eoK0YbwMIMJF0QkImeLfwTcnYpB1VGB6FUM0ZePI2
	/6szN9pQ9/vKY1oVEzwhiETj1wocExcEJ5uYcoQrOBEE0fo1rcsDB+04KksGDTgzx3zErrPtPbXit
	dG/GtfRr0HYd5IzAJzjmFMgYFk8fYVNIdKLmHIGy5Ie4uNhu9YsAr3ivl1iFRYlhVRcGpSxFxy83r
	FjYD0nDNNHbUgjSQcMyyx2nQ6KfHsOpflIm8HdjZ8fUpSzx14vvdLLbsyLoR+LQ7UGyolgaup42nu
	73AbsRlfg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hv14Z-0001Mh-NN; Tue, 06 Aug 2019 15:08:23 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hv14W-0001MO-Re
 for linux-riscv@lists.infradead.org; Tue, 06 Aug 2019 15:08:22 +0000
Received: by mail-pl1-x642.google.com with SMTP id c14so37912276plo.0
 for <linux-riscv@lists.infradead.org>; Tue, 06 Aug 2019 08:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=PpwqwIAicGqHb7e//+lXvoj8D07vNrmAz5KDhiqy1v8=;
 b=MLoies78Uvmkv/Hdd7Dn4Lv90wwTYKdDmeFKDl2Kzr8qPCFUudO1QL6Ojb5pijUq3A
 sW9NzKeXD0UluaT6AelWIreUiXLvBQXDVaoJvCcofUYqnUrMk5idC4YzIapYkr9ipUQm
 QMxYFYxlQFOTWjovCVr7i2zzBuhJsF+yMjOYPg/ZbZY5Ex7q3ARpYGF/GRp75xo+0qdt
 pMsMJMwJOCT2Hy4PXwsRSzX4nKROv86VH1TQbqWfh1ez4An5LzduTp3YIpKkG46qH4o8
 eixlYPFeK6onqQuOkscGuoXkZNtBkRNExEcfXGV2cat/+AhDc61zP8ULVapiLgbtVH2T
 KDxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=PpwqwIAicGqHb7e//+lXvoj8D07vNrmAz5KDhiqy1v8=;
 b=UigMINxotPKmRtBPXxXKROiT9C6DiSeimrVJIs1kNOFDZ6erI9xnNyJ5Eg4q4xk396
 iuUagE9qvtX9gXWSLmF6aB82DiKVw6A9ur2/q/mt25Uv2t/Qy8ik/IOIByjz82GUtkky
 H1jXmmfu7oi7sAx908cYt4QaYdaLHxftAXvWMC75OkTNUlSeM2wlU6gZUw8/rER3vRrL
 bN3rFzK+1skeU8fxpa2hSKAe5o+CoZa0Xrpydg5QP8bs/f4k5lWQTk7hEtJrvClueNIz
 3frIhXtLVYxYTILo2kOHtxChAKH3mcjm0SrWqFUTkTCKhTqR42ilMGeqUZ5oHLgSYOKo
 T/KA==
X-Gm-Message-State: APjAAAUENzg7QDEupMatU93AUnOC38nxkb/VPNVe8RvX0iLDzY4KndM+
 N4jOGvLVToOTpOfjAEyQVndv4w==
X-Google-Smtp-Source: APXvYqyHC9tyAhoIzybofid7zk5n7ZGpKSeyHjL/Q61apmSCy0LT3X8wN8rk0EYLqfPHV939uAC4xA==
X-Received: by 2002:a17:902:e30f:: with SMTP id
 cg15mr3732213plb.46.1565104099733; 
 Tue, 06 Aug 2019 08:08:19 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q69sm24063814pjb.0.2019.08.06.08.08.18
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 06 Aug 2019 08:08:18 -0700 (PDT)
Date: Tue, 06 Aug 2019 08:08:18 -0700 (PDT)
X-Google-Original-Date: Tue, 06 Aug 2019 08:08:05 PDT (-0700)
Subject: Re: About __udivdi3
In-Reply-To: <20190806083135.GA12410@infradead.org>
From: Palmer Dabbelt <palmer@sifive.com>
To: Christoph Hellwig <hch@infradead.org>
Message-ID: <mhng-206638da-813f-4beb-bb68-ec2ff8fe0730@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190806_080820_926634_F9754264 
X-CRM114-Status: GOOD (  18.22  )
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
Cc: tesheng@andestech.com, dslin1010@gmail.com, alankao@andestech.com,
 rick@andestech.com, kclin@andestech.com,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Jim Wilson <jimw@sifive.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 06 Aug 2019 01:31:35 PDT (-0700), Christoph Hellwig wrote:
> On Mon, Aug 05, 2019 at 08:01:27PM -0700, Jim Wilson wrote:
>> On Mon, Aug 5, 2019 at 7:13 PM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>> > > > It seems __udivdi3 only supports 64-bit platform.
>> > > > Do you have any comments? Thanks.
>> >
>> > It sounds like you're describing a potential issue with gcc, rather than
>> > the kernel.  If that's so, then the gcc mailing list(s) would be a better
>> > place to discuss this:  https://gcc.gnu.org/lists.html
>>
>> The kernel doesn't link with libgcc.a.  It has its own copy of udivdi3
>> when needed.
>
> Linus still maintains his stance to not support 64 by 64-bit divisions
> on 32-bit platforms, and thus Linux does not support it.  You can do
> 64 by 32-bit divisions using the awkward do_div macros, but that's it.
>
> This is supposed to apply to all 32-bit platforms, not just RISC-V.

Yep.  I think the best bet is to just drop it, with something like this:

    commit f7f2185e0e3e60a8b77fb519a98b752242ade235
    gpg: Signature made Tue 06 Aug 2019 08:06:30 AM PDT
    gpg:                using RSA key 00CE76D1834960DFCE886DF8EF4CA1502CCBAB41
    gpg:                issuer "palmer@dabbelt.com"
    gpg: Good signature from "Palmer Dabbelt <palmer@dabbelt.com>" [ultimate]
    gpg:                 aka "Palmer Dabbelt <palmer@sifive.com>" [ultimate]
    Author: Palmer Dabbelt <palmer@sifive.com>
    Date:   Tue Aug 6 08:03:59 2019 -0700
    
        RISC-V: Remove udivdi3
    
        This should never have landed in the first place: it was added as part
        of 64-bit divide support for 32-bit systems, but the kernel doesn't
        allow this sort of division.  I must have forgotten to remove it.
    
        This patch removes the support.  Since this routine only worked on
        64-bit platforms but was only built on 32-bit platforms, it's
        essentially just nonsense anyway.
    
        Signed-off-by: Palmer Dabbelt <palmer@sifive.com>
    
    diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
    index 8e364ebf37de..267feaa10f6a 100644
    --- a/arch/riscv/lib/Makefile
    +++ b/arch/riscv/lib/Makefile
    @@ -5,5 +5,3 @@ lib-y	+= memset.o
     lib-y	+= uaccess.o
    
     lib-$(CONFIG_64BIT) += tishift.o
    -
    -lib-$(CONFIG_32BIT) += udivdi3.o
    diff --git a/arch/riscv/lib/udivdi3.S b/arch/riscv/lib/udivdi3.S
    deleted file mode 100644
    index 3f07476a91a9..000000000000
    --- a/arch/riscv/lib/udivdi3.S
    +++ /dev/null
    @@ -1,32 +0,0 @@
    -/* SPDX-License-Identifier: GPL-2.0-only */
    -/*
    - * Copyright (C) 2016-2017 Free Software Foundation, Inc.
    - */
    -
    -#include <linux/linkage.h>
    -
    -ENTRY(__udivdi3)
    -	mv	a2, a1
    -	mv	a1, a0
    -	li	a0, -1
    -	beqz	a2, .L5
    -	li	a3, 1
    -	bgeu	a2, a1, .L2
    -.L1:
    -	blez	a2, .L2
    -	slli	a2, a2, 1
    -	slli	a3, a3, 1
    -	bgtu	a1, a2, .L1
    -.L2:
    -	li	a0, 0
    -.L3:
    -	bltu	a1, a2, .L4
    -	sub	a1, a1, a2
    -	or	a0, a0, a3
    -.L4:
    -	srli	a3, a3, 1
    -	srli	a2, a2, 1
    -	bnez	a3, .L3
    -.L5:
    -	ret
    -ENDPROC(__udivdi3)
    

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
