Return-Path: <SRS0=IYIb=EF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE8EC00A89
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 16:30:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC1A72083B
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Oct 2020 16:30:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="A3HfArYd";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yo5gl6bW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC1A72083B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:MIME-Version:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dwVJgOBmlS6dgB7XsL/euo3ZTsirSYg1sUjC1+GMbmA=; b=A3HfArYdyZxGYhvwTXVjWujFai
	lD5qcPEEqdDS7opj5KCU/yPiCjbvbJZuU2WHef/92z6d7SC7xYuYsYUFxmwzWMtoGbi61gB3/sCAa
	daXtzpHvNyz6KI43Z9aG90hPVMJ6iFHb2duKk8qpX7ed6UboE0oU4uMmsiZchFaRQ45IinkKtRp8I
	J4t9jGAiO3fnT+i585TRsmWixF6vPQman09EVTpeICiQKNn1mHfdvWz533312caDuDYoJ9bZc3y8c
	A3ACDqSqkSmqYfaHrfXnpXKjiWTOz4oYmFdaTHkCySRU7B7QbF+84GfOo96w5i/6rq0M1PkjDNNu5
	bn/FcP0A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYXHu-0002aF-SU; Fri, 30 Oct 2020 16:30:02 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYXHs-0002Ys-5g
 for linux-riscv@lists.infradead.org; Fri, 30 Oct 2020 16:30:01 +0000
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com
 [209.85.219.54])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 1856220A8B
 for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2020 16:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604075399;
 bh=Zd4lIVf1bsz555QMx+XmVLs68UwovqEKCGJ66eBzUhc=;
 h=From:Date:Subject:To:Cc:From;
 b=Yo5gl6bWEa+vscqKcXDbnZ+cNEqf+Dqc77TT9cGfbxUDUVNknEn9bm4XT28bgFfSo
 EIpRMFBAOcaBFTZWaJjbaYlfjb+cy6G14GYmBB0u58zKkDTSfTj8jVjW1DYc7rU5lD
 K/K7STUnxnSj9L7e7XZLkRB3FfWgsSDC543c1L2g=
Received: by mail-qv1-f54.google.com with SMTP id g13so3023018qvu.1
 for <linux-riscv@lists.infradead.org>; Fri, 30 Oct 2020 09:29:59 -0700 (PDT)
X-Gm-Message-State: AOAM530Ac7j1yODHtivRVIAzjfUyrYvdfs48URTzx17r3k5piF9DOSFC
 BRyiGM6BzLJfHKMmRNm2lmjX8es/+3hViUZkNmQ=
X-Google-Smtp-Source: ABdhPJxzmAmY7xhPzaG3cP5JLj6pWRCKQ2WXEhuCWvPMgxtR74KLqkGKvXmy80cZdRvYbV7SlrEukKe8zjVwGj1uKOQ=
X-Received: by 2002:a0c:a2a6:: with SMTP id g35mr9870760qva.4.1604075398185;
 Fri, 30 Oct 2020 09:29:58 -0700 (PDT)
MIME-Version: 1.0
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 30 Oct 2020 17:29:42 +0100
X-Gmail-Original-Message-ID: <CAK8P3a37eA8s68pkHcmR_wtvPaDBouqRF7S2T+t3=YUh9HuCOg@mail.gmail.com>
Message-ID: <CAK8P3a37eA8s68pkHcmR_wtvPaDBouqRF7S2T+t3=YUh9HuCOg@mail.gmail.com>
Subject: [GIT PULL] asm-generic: bugfix for v5.10
To: Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201030_123000_348672_08525A85 
X-CRM114-Status: GOOD (  11.35  )
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
Cc: Christoph Hellwig <hch@infradead.org>,
 linux-arch <linux-arch@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:

  Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arnd/asm-generic.git
tags/asm-generic-fixes-5.10

for you to fetch changes up to 0bcd0a2be8c9ef39d84d167ff85359a49f7be175:

  asm-generic: mark __{get,put}_user_fn as __always_inline (2020-10-27
16:13:09 +0100)

----------------------------------------------------------------
asm-generic: fixes for v5.10

There is one small bugfix, fixing a build regression for RISC-V

Signed-off-by: Arnd Bergmann <arnd@arndb.de>

----------------------------------------------------------------
Christoph Hellwig (1):
      asm-generic: mark __{get,put}_user_fn as __always_inline

 include/asm-generic/uaccess.h | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
