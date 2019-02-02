Return-Path: <SRS0=4/Si=QJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63781C282D7
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 Feb 2019 09:43:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 27F272146E
	for <infradead-linux-riscv@archiver.kernel.org>; Sat,  2 Feb 2019 09:43:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="fOsZWSmD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="SMDUI/0v"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 27F272146E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ihx8wYGt/IZHaa4IMhMGW/YTGlqCKdG5uJYACMcBwjY=; b=fOsZWSmDkPoBnP
	vTvU8cg2hcKOLnKwVGNpnfUHZipFh74goyArng98VENHiQ6lMVriVpiA/CPMlDaHQ60P7RwFWirlL
	2SGQPKrRRpdImBmaRNoZFx+5VP5n4hJDuOcKGlkrim0GbVveFVVBm/ifn7wtupPTGjCq64pN12ljr
	QR0O/F0evWexo+efFxHXFbIhGJ5AqoLxcrrXA0kTSBEnYSgRUikrNuSA4IptikibKQdrqdEpFFAfr
	17d3QLwfaL1FppKBIKrws2e6UrWd9Ws2vuBZQI+EbEGgh2XuzLg22106crLuvwbLUqP8aOm7stYok
	boRcf4xvD9zzA9Ie4mPQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gprpu-0002wv-0U; Sat, 02 Feb 2019 09:43:42 +0000
Received: from mail-ed1-x541.google.com ([2a00:1450:4864:20::541])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gprpr-0002wX-Dq
 for linux-riscv@lists.infradead.org; Sat, 02 Feb 2019 09:43:41 +0000
Received: by mail-ed1-x541.google.com with SMTP id f9so7435856eds.10
 for <linux-riscv@lists.infradead.org>; Sat, 02 Feb 2019 01:43:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=eA6w2DJkuoLkX3yICHnRN/pQE/wdeda+obKOC24tPDs=;
 b=SMDUI/0vMhjXPT0mSsMbzUswYdya6JUEt+4JU2w8oAMEOF5iBBol89PQtmHHjuMB9R
 cCvIkH+J2IdqP0pyox+kWxEZpRQ/Rx35eSB/mmjHFuGGc+N/hscj7+lqsKZUF2xAXAln
 0sy1T8m2gP3N7rR/GU/S7RyD9zuWxisbZCCzaNOaYPH6xwSq4mpy660l7rhFm8exq3tf
 kzjEFeUID99SIPm+ngWXmXwnkN2PMl7Azz9KvVA9Va302doSdiHAQmFBfbv5UJ9abryx
 2L6u1SlTFtrJvHBXQDnrzgD0IeXPHb7O/vlsn3X7ROKnicQiPVQ5TwrVtissI12BTBX8
 vevQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=eA6w2DJkuoLkX3yICHnRN/pQE/wdeda+obKOC24tPDs=;
 b=WJE2M3UZnZxMFdu1wJ5ezYEwuJaxDAeDX3dZUyK68l38Kq7Z99NwyGr9mCvNTxn0CT
 R2+n2YMwh1KNtYJr+kt6Kuv6Hq4cMvAaZuSGul1rsJfHbzgwX9m8qtmoKTEPkMPJrTfL
 H/YMvs5SsFuRBdvgG4W8SFor/EAkPEUWaXxHM7EABgFdpf0zhX8tmyHybnhnzkunFxSV
 8SPfKLgVW2Ksp7aSOYDkbYQ+hPPQFtFhlhZ5LAo5iJYJrBU/rGi1ZYCD+k+7i93YJ3DU
 jvka81hryWL5t3radI0xZBpNIgj4WtFp6a4DaObvke/bqlJZRKKFyOF4Yn4jSfsiQEps
 CoQQ==
X-Gm-Message-State: AJcUukcsK4uvANb9mjRuNmsPJfvHX1wb1qeBvQUzSauPXTBM4mOTp50B
 ArEEOuxK9POArZOFh6GM/p941efSKM5bGA==
X-Google-Smtp-Source: ALg8bN4sMtA5OVzCU8Ei5Qekh8jD8A7JiZQJUSJ46721yFwtfeVmBqhXnoMa/k+dETv3FkJ/hDZ3zQ==
X-Received: by 2002:aa7:d1d7:: with SMTP id g23mr37674522edp.217.1549100616177; 
 Sat, 02 Feb 2019 01:43:36 -0800 (PST)
Received: from localhost ([2001:67c:1810:f051:fd32:55e2:f60b:183b])
 by smtp.gmail.com with ESMTPSA id x6sm20508ejw.40.2019.02.02.01.43.35
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 02 Feb 2019 01:43:35 -0800 (PST)
Date: Sat, 02 Feb 2019 01:43:35 -0800 (PST)
X-Google-Original-Date: Sat, 02 Feb 2019 01:42:09 PST (-0800)
Subject: [GIT PULL] RISC-V Fixes for 5.0-rc5
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-e49bbf7a-76b1-4eda-a715-f5791b80197f@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190202_014339_498428_019A5BD1 
X-CRM114-Status: GOOD (  12.00  )
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
Cc: linux-riscv@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 49a57857aeea06ca831043acbb0fa5e0f50602fd:

  Linux 5.0-rc3 (2019-01-21 13:14:44 +1300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-5.0-rc5

for you to fetch changes up to ae662eec8a515ab550524e04c793b5ddf1aae3a1:

  riscv: Adjust mmap base address at a third of task size (2019-01-25 10:50:53 -0800)

----------------------------------------------------------------
RISC-V Fixes for 5.0-rc5

This patch set contains a handful of mostly-independent patches:

* A patch that causes our port to respect TIF_NEED_RESCHED, which fixes
  CONFIG_PREEMPT=y kernels.
* A fix to avoid double-put on OF nodes.
* Fix a misspelling of target in our Kconfig.
* Generic PCIe is enabled in our defconfig.
* A fix to our SBI early console to properly handle line endings.
* A fix such that max_low_pfn is counted in PFNs.
* A change to TASK_UNMAPPED_BASE to match what other arches do.

This has passed by standard "boot Fedora" flow.

----------------------------------------------------------------
Alexandre Ghiti (1):
      riscv: Adjust mmap base address at a third of task size

Alistair Francis (1):
      RISC-V: defconfig: Enable Generic PCIE by default

Andreas Schwab (2):
      RISC-V: fix bad use of of_node_put
      tty/serial: use uart_console_write in the RISC-V SBL early console

Antony Pavlov (2):
      RISC-V: asm/page.h: fix spelling mistake "CONFIG_64BITS" -> "CONFIG_64BIT"
      RISC-V: Kconfig: fix spelling mistake "traget" -> "target"

Guo Ren (1):
      riscv: fixup max_low_pfn with PFN_DOWN.

Palmer Dabbelt (2):
      RISC-V: defconfig: Move CONFIG_PCI{,E_XILINX}
      RISC-V: defconfig: Add CRYPTO_DEV_VIRTIO=y

Vincent Chen (1):
      RISC-V: Add _TIF_NEED_RESCHED check for kernel thread when CONFIG_PREEMPT=y

 arch/riscv/Kconfig                      |  2 +-
 arch/riscv/configs/defconfig            |  8 +++++---
 arch/riscv/include/asm/page.h           |  2 +-
 arch/riscv/include/asm/processor.h      |  2 +-
 arch/riscv/kernel/asm-offsets.c         |  1 +
 arch/riscv/kernel/entry.S               | 18 +++++++++++++++++-
 arch/riscv/kernel/setup.c               |  2 +-
 arch/riscv/kernel/smpboot.c             |  6 +-----
 arch/riscv/mm/init.c                    |  3 ++-
 drivers/tty/serial/earlycon-riscv-sbi.c | 13 ++++++++-----
 10 files changed, 38 insertions(+), 19 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
