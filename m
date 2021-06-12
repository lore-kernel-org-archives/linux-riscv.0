Return-Path: <SRS0=I7Ft=LG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B81CC48BE5
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 15:59:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AE3E061108
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Jun 2021 15:59:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AE3E061108
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:CC:Subject
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5ql+92y+AdJ14TOZOrmIk3wLCmQopWj7gwSw2q/CxC4=; b=o8ERyQQk5lyaE4
	ei18Gq9TvSUp+gspA2eKCHVemHvC5TNI+TrgN/tv2mAChOUaJKnwtcBDVkYcPSQSBhgbodeU/CtIE
	VVf+NmmbzM1+3XImrM9Jctu8zP5n25Lmpy8yM1ib2NPF/H8eV33wvCdvR8E52k7M3s4L9/jSMwetY
	CwObPvwugg9wgQN3isJfJPtzy39zOYyP+yN25ZQE2d3LeCdi052g+HpM3hIXBGFvY6BBRY+PKiJ56
	kUaMlncIpn3gHbGj5z8CANFAg5uybJdkfEfncUcVDOGVrub5M0TVb9Dqt8mVLmBRm4j/AQziaRwWD
	jGrnmSVSGWDpJDUajVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ls62R-008m1U-HA; Sat, 12 Jun 2021 15:59:11 +0000
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ls62N-008m0I-FR
 for linux-riscv@lists.infradead.org; Sat, 12 Jun 2021 15:59:10 +0000
Received: by mail-pf1-f178.google.com with SMTP id h12so7025551pfe.2
 for <linux-riscv@lists.infradead.org>; Sat, 12 Jun 2021 08:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=HbfYjfhGbhPgjXmvpwXGZWGeq+0VqyUCmSjflkjdYJM=;
 b=kIv453cF1uAwja7Al86wvZnDiAFaJURV8OqIQIk8IwVMhZbJdElYqFIolw2wHaPNup
 u9VdXnL+JbERX/QbjittM4OxEWu1/zxleANf5/UhOQGbLRtc1tAUKe/ZLAWezNjwjCmP
 OytB02SmiiG0ngdaidNZXWKMIB6D+as1e/j1zPIoC+/qSLF/zouFdURb+hSi02eMP/Y5
 6MOL3hxF6xQ5dOVzg5V7aIOwmQP9EZYZrdP8+dcMq3crc/bm76FzAI+wedCw9E+QC1sG
 /WNO20JLKrkf/AYbcU4Fdvxao8kIGz/YHtKmN40zinzy8+yCSI4dM5OVUc4SkC21m9Li
 la3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=HbfYjfhGbhPgjXmvpwXGZWGeq+0VqyUCmSjflkjdYJM=;
 b=Qxk70NgyErQw7l0zgRaFtsxCj0Xfk3rUzu7N55cegL/KJQe/uQOxIhfYoH4XP1r4lO
 vFw9jCzeChNF9D0AMIyTPnmerNAUXGPsCKYvy5Tg8xd3pzz1gaW2RtG6nKK4TeEgMG8m
 6Bjc+mndIe8T+ZJluxfwA0tiFGExTBN8ubPPBWa9WIrcmHajn5bHS1uADmKpsz2XrJjg
 kpmSADPLiVgZCcPn5vks4pebdlX/U3g36qxWQdOFSliS6t9rPumyRtMe8FeuzYWf29IS
 DkNoAhp86Eb4yQvJy/LtDnmleOdEf3XeqXYv93NXiEuWg1d7I8XoMnxKFE8f7cjNdj75
 QIEQ==
X-Gm-Message-State: AOAM532uhjBWFXZfcPBILmp1UnCod7PJY9hPW4Y9k55X+Nv9QinE8sOw
 lqDNpvg6r+zj+yEE3OKuJpMmKPU0ObgbSp9d
X-Google-Smtp-Source: ABdhPJyldfcTCoTm49mMx0ZQIOdvC/vomORZsm110j1qIeZULqKBlMSlVTJN57hFB69SIl2cUWRRKQ==
X-Received: by 2002:aa7:93a9:0:b029:2e9:c839:d2d with SMTP id
 x9-20020aa793a90000b02902e9c8390d2dmr13372334pff.5.1623513486080; 
 Sat, 12 Jun 2021 08:58:06 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id j12sm8380392pgs.83.2021.06.12.08.58.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 12 Jun 2021 08:58:05 -0700 (PDT)
Date: Sat, 12 Jun 2021 08:58:05 -0700 (PDT)
X-Google-Original-Date: Sat, 12 Jun 2021 08:57:46 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.13-rc6
CC: linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-eafb1de7-d58e-417f-9a42-76e32e2a04d5@palmerdabbelt-glaptop>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210612_085909_186491_14CE9580 
X-CRM114-Status: UNSURE (   9.61  )
X-CRM114-Notice: Please train this message.
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 160ce364167fabf8df5bebfff1b38fd5d8c146c9:

  Merge remote-tracking branch 'riscv/riscv-wx-mappings' into fixes (2021-06-01 21:17:08 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.13-rc6

for you to fetch changes up to 0ddd7eaffa644baa78e247bbd220ab7195b1eed6:

  riscv: Fix BUILTIN_DTB for sifive and microchip soc (2021-06-11 21:07:09 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.13-rc6

* A pair of XIP fixes: one to fix alternatives, and one to turn off the
  rest of the features that require code modification.
* A fix to a type that was causing some alternatives to break.
* A build fix for BUILTIN_DTB.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Fix BUILTIN_DTB for sifive and microchip soc

Jisheng Zhang (1):
      riscv: code patching only works on !XIP_KERNEL

Vitaly Wool (2):
      riscv: xip: support runtime trap patching
      riscv: alternative: fix typo in macro name

 arch/riscv/Kconfig                          | 18 +++++++++---------
 arch/riscv/boot/dts/microchip/Makefile      |  1 +
 arch/riscv/boot/dts/sifive/Makefile         |  1 +
 arch/riscv/include/asm/alternative-macros.h |  4 ++--
 arch/riscv/kernel/traps.c                   | 13 +++++++++----
 arch/riscv/kernel/vmlinux-xip.lds.S         | 15 ++++++++++++++-
 6 files changed, 36 insertions(+), 16 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
