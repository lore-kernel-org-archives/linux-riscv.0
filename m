Return-Path: <SRS0=N0YM=NJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1C9C0044C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 19:47:15 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F048205F4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 29 Oct 2018 19:47:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="agGvgh3n";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=mforney-org.20150623.gappssmtp.com header.i=@mforney-org.20150623.gappssmtp.com header.b="P1p+e16O"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F048205F4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mforney.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=6huixE6kHBgVkSNphAzo4w1PMBdvMb7gOOu0iWxh+S8=; b=agG
	vgh3nOPM47AEudZEnRrDeu9o/L01moq8gwagusuDAwXKFnmS/L51T1BUWjdF/brxTLsesXRMQoGIf
	oFbqxuMeQaxP4G9os6nTjUisHiravBTwdUCwXmjmABC7klGHX9o91ndowkakNK9A0weW/pCCJ5m2Y
	2LDvQpbhQr17hKSwhLStZUTFjzG4FscaphETUM6Cdwty4YvfWwqcTtemkSsvkE/diQjp1Fdf2Oq8s
	SBf36UImw2LWz5HwzjXAZTLP5yN78SHx5PTkzXO7h1p/ofm7b+lBWA4lAfNntSP8Vz2u5doLtmXqS
	WHIxh+G5DZ7fShTdK4smaOUAaroBAaw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gHDVJ-0003bP-7R; Mon, 29 Oct 2018 19:47:13 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gHDUt-0003PJ-O6
 for linux-riscv@lists.infradead.org; Mon, 29 Oct 2018 19:47:10 +0000
Received: by mail-oi1-x244.google.com with SMTP id u130-v6so3502875oie.7
 for <linux-riscv@lists.infradead.org>; Mon, 29 Oct 2018 12:46:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mforney-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:from:date:message-id:subject:to;
 bh=nAcVpzAzmy3QUcJdoYOm+uR6AgfHXfrLGNHTqjwpsDw=;
 b=P1p+e16OseI1hA/RGR/IgXgm7WpK7SidCdkFChyShC+uaZ1DW2V3r/THZU7iO4yrEP
 5mBLtZ73p6aMZwsbp0GmRYbu+6gcGBg3Jg6tw+btCAKnXDo4upgCgdnKtSHZ6D3VTz5G
 veyexlp1w8ILpiassSDDq8iH99bnklTFDyIdRACl9jHgji2vAKd/PS6H634M8rXAdfHo
 YorBlCZxwwltDbHSmIPRLEqq9063LxBJNlb3EF/MC3vvUCkW4wIfd2JdmULDdih+90nX
 MhoTtR/ZH/3QSYAzlbamC5/a829RRb/O6+mTLpYbqKdqqP5dnD8gGu9i6EkV5Cv3M50a
 koiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=nAcVpzAzmy3QUcJdoYOm+uR6AgfHXfrLGNHTqjwpsDw=;
 b=cPUYH3mFl2MjivfRkxGNj+nbzXYeBz4t3dedsMJt5QvR2n5LAkZ1fPQpV89TQafGmE
 ehTQZ8pDo7vso/vrNlIOhZ2HJlndFHcTDFrytAVgO/oKFaJyfTAwFVzuDyZEDJPRG1Pi
 vkW8rZAY7/VXPmI9KoOgxIb7WbuJr4y8lBFGVphfMR1HTcYjmEt71b6lbF5N+avVpR08
 CCITjGdxwd+SwjVhTxhtQ5rOTn9i3HUdhVAW9hdq72OUW9I/BQBxnjN2QI6f6zDM+p8k
 gn/XM+xJutflL0fwz63OrZZr+ZJkPAp2rht0TW7+PhEc8xLdfMDIts5NCAL4KFms1Jm/
 kUvQ==
X-Gm-Message-State: AGRZ1gJgPqKBpV8tQkXiDtvyhNFA9BqMJ4iudllsWGBNwA33OCUNvgjU
 hBq0xapi0KJ1EZPyPGg9qk8Zh25peq+Vu8YkCHct7g==
X-Google-Smtp-Source: AJdET5dZod/JbtGiTaOM8khvF8j4vD580xE4Jp5C2hPz66A1wQ9XnTF+veix1opywDUNWewS6JvJxPClWf/h4TYLvd8=
X-Received: by 2002:aca:ddc3:: with SMTP id
 u186-v6mr8888768oig.204.1540842395515; 
 Mon, 29 Oct 2018 12:46:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:370b:0:0:0:0:0 with HTTP; Mon, 29 Oct 2018 12:46:34
 -0700 (PDT)
X-Originating-IP: [73.70.188.119]
From: Michael Forney <mforney@mforney.org>
Date: Mon, 29 Oct 2018 12:46:34 -0700
Message-ID:
 <CAGw6cBsWHB4aRf=kPoT+v-FbtL0ymeBtZNEwKYobFizc0cLeaQ@mail.gmail.com>
Subject: virtio-gpu without ARCH_HAS_SG_CHAIN
To: dri-devel@lists.freedesktop.org, virtualization@lists.linux-foundation.org,
 linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181029_124647_910749_171E8C47 
X-CRM114-Status: UNSURE (   8.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181029194634.vVwc67BlQnfUxsfz2hIzS32KeKxrtYRfZ_F6jzAYCCQ@z>

Hi,

I was looking at adding virtio-gpu support to tinyemu
(https://bellard.org/tinyemu/). I got it to work on x86, but just for
fun I tried it under riscv and ran into an issue with buffer
allocations (though, this should affect any arch without
ARCH_HAS_SG_CHAIN).

virtio-gpu uses ttm to allocate buffers, which swaps pages to ensure
that they aren't consecutive[0][1]. However, this causes
sg_alloc_table_from_pages to use a sg entry for every single page,
limiting buffers to only 170 pages (the number of sg entries that can
fit into a page). This is only 417x417 with 32bpp. I believe the page
swapping also makes TRANSFER_TO_HOST_2D inefficient by forcing the
host to do many memcpys instead of just a few.

Commenting out the swaps in [0] and [1] makes it work with larger
buffers. I don't know anything about huge pages, or how sg chaining
works, so I have a few questions:
- Is virtio-gpu intended to be usable without ARCH_HAS_SG_CHAIN?
- Is it still necessary to swap the pages when
CONFIG_TRANSPARENT_HUGEPAGE is disabled?
- Should riscv support ARCH_HAS_SG_CHAIN?

Thanks for any help!

[0] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/ttm/ttm_page_alloc.c?id=fdb1a2236b07948e83e0a777e1795d4f07e52c33
[1] https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/drivers/gpu/drm/ttm/ttm_page_alloc.c?id=ae937fe19636067ec5e20d7f1fa10c6cc6000b52

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
