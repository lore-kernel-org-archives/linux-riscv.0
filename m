Return-Path: <SRS0=PVrh=R3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 895C5C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 03:10:53 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DE92175B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2019 03:10:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="pnP6htyr";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="1np+3GzE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42DE92175B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j9at96JbzC1WmWmzMG+jyYhj0gZo0CbALbJ9pTp7YSA=; b=pnP6htyrGCb1DX
	S70e6+g8mkkB3gKnNqba+5jQx0d+/xDFL4Ex/kUtvye1yhgE+7BBRaDb/xZRx2wNVxVfXscK6bDWJ
	TorswD/0TVOvzPCLYu+iw7Belst6ZO5QQyTEShqTMe84cwpko3dY7/nbMNEz4fTt0+2auOMshHc+L
	CMOm8UQJDkVkUCorsJXmvEEd2BGe7v9t+udG6smbYPGO3Dr2lSMb2McRBeTCC0rLukoEMQg1Xo4MR
	vxmmDEjeYdlIHv2di/W++m4dQB9rncKrYDkq8p5yr+R6PEk4LlX1y4byiVUHiDuDZU1r0zUq2w5SM
	hVa9r3pPYyZ8AsjTtqVw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1h7tXA-0005PW-EZ; Sun, 24 Mar 2019 03:10:52 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1h7tX7-0005Os-Fg
 for linux-riscv@lists.infradead.org; Sun, 24 Mar 2019 03:10:50 +0000
Received: by mail-wm1-x32e.google.com with SMTP id o25so5583061wmf.5
 for <linux-riscv@lists.infradead.org>; Sat, 23 Mar 2019 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/elx//X1Hp04umILsLOaofWzTpUR1pbD5H294AqSw9o=;
 b=1np+3GzEb1TjWhxyQgBor5dIjnUcWGVFzj4RSoRNpdLvqFrwsMsNRKceM9Le3wAubD
 XGI58o5e+9dPUjM59hh4B8c7xAdyso+ys5owRHVG2iVzIFnKv9ngczu0QJL8CKlWbneD
 AkmWJkZzmEep3Hf2FA2YKYE3N5U903nJydoBzN5cRlqQKJ0Ce8QaRiwHFI968d/El1Hz
 sQFDdUrYnVwWRUA5iIC2LT446R33j9z1lw37f8mWZ2/kSOvAyV5bqVEr8Omfld+Neumw
 UylrL/Vc47bHZYXT1EJfEBI9QPjkU5PMDdtN47M/obd55iSLwbZ7GUAMta76wV52rS3y
 rtCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/elx//X1Hp04umILsLOaofWzTpUR1pbD5H294AqSw9o=;
 b=IPBYjz8K5nkIk4mvdimuz5KLmQ7b70LRLFRcgkkZuOw161pVodPTY0+g1JlI3XKQZJ
 qRE6Od1uqSdUlsGzmoUYUParI/a+NUVB0mXO1ubL4gfgeICdHcuYMgqR7qW3KD4a8jCJ
 V17O+jza7iETgWZzRajheUAaU4N+P0TQIkkR+CtYT10yWz84Agi8arHW451A17GYVSPv
 Pi0IoDGvM3zWd2QCZOWH7en+PI9X4zB33/2YGZEexHLJOnPOksjUcSpX/T96Ho//4x1f
 hZObiHnnwqcutbZVsTXjjizGq9cjzn1Uss4LTCzUnR1sdIXQpV4jLLRl28V7fvKmyUpj
 SkQw==
X-Gm-Message-State: APjAAAVIvM0FJO9rdbZN6WoJKy10hocKwiFz3gpdOlkcPsWjLXnUrjiG
 aYFef/eYC1sN43Jd4kxoq2hTSQr8pJ/Psv39Rq5sHg==
X-Google-Smtp-Source: APXvYqwWJbFIj2YDQ5XWWFFP9k8vVmReEvlaDx8bP9dcm+cWXId8p97oqBrAuJl9bQznDhkH/SSZdN2+QXsOkThGviA=
X-Received: by 2002:a1c:9c14:: with SMTP id f20mr1382730wme.16.1553397046387; 
 Sat, 23 Mar 2019 20:10:46 -0700 (PDT)
MIME-Version: 1.0
References: <CAAhSdy0mUboGJH_GJbsGFBwcukjttVQcTGfzwkaMFQb9ZVY4Mg@mail.gmail.com>
 <20190322104209.GB24367@rapoport-lnx> <20190322132556.GB19263@infradead.org>
 <CAAhSdy1VS8-3npcZUzjicnKGsjHcc6WH3Co6Hx2=GvttoatWcA@mail.gmail.com>
 <20190322134043.GA18818@infradead.org>
 <CAAhSdy2qbU1uhnVQvh0C_FOoKDy-Y0ZTUryAKD97xAXXGQSdCA@mail.gmail.com>
 <20190323172153.GA9085@infradead.org>
 <CAAhSdy07GsHXpG9MJZ4aiB5uG7D+9RA+17Nb1MrWdFg9ee6rUA@mail.gmail.com>
 <LO2P265MB0847CF97521DEF5AB0EA7B21D65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
In-Reply-To: <LO2P265MB0847CF97521DEF5AB0EA7B21D65D0@LO2P265MB0847.GBRP265.PROD.OUTLOOK.COM>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Mar 2019 08:40:35 +0530
Message-ID: <CAAhSdy1gSMVk-45iHK9yA2hwNgkfwk9UwNu_zOWVXmhBk1MMzA@mail.gmail.com>
Subject: Re: 32bit kernel is broken for Linux-5.1-rc1 due to GCC cmodel=medlow
To: Gary Guo <gary@garyguo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190323_201049_666458_2CD91174 
X-CRM114-Status: UNSURE (   5.70  )
X-CRM114-Notice: Please train this message.
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
Cc: Damien Le Moal <Damien.LeMoal@wdc.com>, Palmer Dabbelt <palmer@sifive.com>,
 Anup Patel <anup.patel@wdc.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <atish.patra@wdc.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Mar 24, 2019 at 7:26 AM Gary Guo <gary@garyguo.net> wrote:
>
> I think what he means is to force the file containing setup_vm to be compiled using medany, even if cmodel is configured to be medlow.

Ahh, sorry I misread previously.

I have not explored having separate file for just setup_vm() but I am sure
we cannot link two object files different code model and it will cause linker
error.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
