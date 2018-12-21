Return-Path: <SRS0=1C2h=O6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25BE3C43612
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 16:30:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3C3421928
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 21 Dec 2018 16:30:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Aga2X7q+";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="dqvmDzOl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3C3421928
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:To:From:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mINeSK/3/7fja1NVO1PyF5sOR9605N54HbjjIKE3jdo=; b=Aga2X7q+FMuZQT
	5v+/QlE24nkGbo/1ySHRcoJG2Gn8wU28MwpFu+yUtg7TmgJ5CjaZvbRwJBlqs3LKZAlRJ2GT3FVlL
	gzBGudnMiH3J7OmrwkTMKimWpTL5tTGAR9aaQjObA97eTDATYP1hmCA2YU6v8wHfjlHQauWhfWLfm
	oDEbooDmzUTok+1TM36BEvm3OLC0YuOhjQgQeJhuAbm0xoePTmEYDH/uK+zCxch8k8pqEkapSh6l6
	G7F0sbBXOdmUBbk9QiShhFEEH/tFICXlxj5wHdkqx8VbLfw/wK5jxogbNwKG/3FO46t7yMf4m7i7u
	/zH7zOOdzjV5jCWJzZdg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gaNga-0001dk-NF; Fri, 21 Dec 2018 16:30:04 +0000
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gaNgW-0001L2-Kg
 for linux-riscv@lists.infradead.org; Fri, 21 Dec 2018 16:30:02 +0000
Received: by mail-qt1-x844.google.com with SMTP id p17so6288565qtl.5
 for <linux-riscv@lists.infradead.org>; Fri, 21 Dec 2018 08:29:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:cc:from:to:message-id;
 bh=MH6+Cr3WPPwatUZby/bC0yMWgpLKBhS2PkWx7csIqpI=;
 b=dqvmDzOlU2GXBR4CzZuj+wWuQ90Aq6vhxNdBIC7C9btifnxCtOroc7Nd9khRRjJ0iw
 IBNaCs9mPggdu0SzK4r92qsa0YZk+rm0KPIMG99d1El37d0SzIE0YSrf7UJMxRw6e++F
 fujklUHf9jkwkBKrhzBjZG7ZAvGemJoNB8zCTTzoZcLFCpC0sFIwUF2eFoXF7jnW+jtP
 SwZ7pSx3IvN79Az7liV8KI6+QOR8MfmI4rXy3veALnmYSRsUCpektYPEG3nEfmWNqJtP
 FCtQoh1IuBudYokH5pMltnB3DM/g6ErMawd4WwnE/CBIICpo+2UiABtomjhV3qrYqRZ4
 B7ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=MH6+Cr3WPPwatUZby/bC0yMWgpLKBhS2PkWx7csIqpI=;
 b=MEkANILIHL/uwOndwj/b7ZJ5fiZ1wWf00x2J9VATPmEAS27Us3DfHsMRgIMn728E3f
 RwDKJ26q6QXl9/3k3qhFtg2fg7/bCTrRcXh++dXEaz6CGjwi0gezaASJ4FXZ01s6G69a
 MP2TOClchmc1pB7orBI3q9YqKZlTHq0eB3gVFJNFmrUIDi2Myu7VHn2zTdreto0t7nU6
 at0HWmbQO/O6wS1imXGIBO/v4rBAGH+8O44KsTFKy6ZtoMBKYLQgxrjqFDEYBrT0Dps/
 hxoxo7GW+9Q6OrqhJ9/pmL/EEj6gtFaOm9TrFclgwJ/oFVsWWoDV8JF3/NbJD5LpZQ6x
 dAbg==
X-Gm-Message-State: AJcUukezBjMwtUWWeH2Vzj7v6N2X4OITriIu1oMdixwg3YiGsJ3UtdwP
 TiLZHhP8eT1hRByapCMO3L4HoLOSoek=
X-Google-Smtp-Source: ALg8bN6K1NqHmR0n7lmP+R7ckepAWJOcjIKztzZHPqNprZ1sPCQul9fnAILqFXjoovHtgEKr1pDZBA==
X-Received: by 2002:a0c:d0a8:: with SMTP id z37mr3153888qvg.86.1545409786205; 
 Fri, 21 Dec 2018 08:29:46 -0800 (PST)
Received: from localhost ([2601:182:c980:96c:8dd:4488:90b1:59d1])
 by smtp.gmail.com with ESMTPSA id m41sm8440599qtc.58.2018.12.21.08.29.44
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 21 Dec 2018 08:29:44 -0800 (PST)
Date: Fri, 21 Dec 2018 08:29:44 -0800 (PST)
X-Google-Original-Date: Fri, 21 Dec 2018 08:29:33 PST (-0800)
Subject: [GIT PULL] RISC-V Updates for the 4.21 Merge Window, Part 1
From: Palmer Dabbelt <palmer@sifive.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-5924ada7-ba61-4f8b-a7c8-6ad4a36882ed@palmer-si-x1c4>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181221_083000_736497_0017B153 
X-CRM114-Status: GOOD (  11.82  )
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

The following changes since commit 7566ec393f4161572ba6f11ad5171fd5d59b0fbd:

  Linux 4.20-rc7 (2018-12-16 15:46:55 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/palmer/riscv-linux.git tags/riscv-for-linus-4.21-mw1

for you to fetch changes up to 9b9afe4a0ef149db2472f13d6fa3c705d2867c9c:

  RISC-V: Select GENERIC_SCHED_CLOCK for clocksource drivers (2018-12-21 08:17:19 -0800)

----------------------------------------------------------------
RISC-V Updates for the 4.21 Merge Window, Part 1

We don't have many patches for this merge window, probably because
everything has been a bit busy with the holidays and conferences.  The
only big user-visible change is to move over to an SBI-based earlycon
instead of our arch-specific early printk support.

The only outstanding patch set I know of is the audit patch set, which
I've managed to make a mess of and will attempt to clean up.

----------------------------------------------------------------
Andrea Parri (1):
      riscv, atomic: Add #define's for the atomic_{cmp,}xchg_*() variants

Anup Patel (3):
      RISC-V: defconfig: Enable RISC-V SBI earlycon support
      RISC-V: Remove EARLY_PRINTK support
      RISC-V: Select GENERIC_SCHED_CLOCK for clocksource drivers

Atish Patra (1):
      RISC-V: Fix of_node_* refcount

David Abdurachmanov (1):
      riscv: remove unused variable in ftrace

Nick Kossifidis (1):
      RISC-V: Update Kconfig to better handle CMDLINE

Olof Johansson (1):
      RISC-V: lib: minor asm cleanup

Palmer Dabbelt (1):
      RISC-V: Move from EARLY_PRINTK to SBI earlycon

Yangtao Li (1):
      RISC-V: add of_node_put()

 arch/riscv/Kconfig              | 58 +++++++++++++++++++++++-----------------
 arch/riscv/Kconfig.debug        |  2 --
 arch/riscv/configs/defconfig    |  1 +
 arch/riscv/include/asm/atomic.h |  9 +++++++
 arch/riscv/kernel/cacheinfo.c   | 11 ++++++++
 arch/riscv/kernel/cpu.c         |  1 +
 arch/riscv/kernel/cpufeature.c  |  2 ++
 arch/riscv/kernel/ftrace.c      |  1 -
 arch/riscv/kernel/perf_event.c  |  1 +
 arch/riscv/kernel/setup.c       | 28 -------------------
 arch/riscv/kernel/smpboot.c     |  6 ++++-
 arch/riscv/kernel/time.c        |  1 +
 arch/riscv/lib/tishift.S        | 59 ++++++++++++++++++++++-------------------
 arch/riscv/lib/udivdi3.S        | 42 +++++++++++++++--------------
 14 files changed, 118 insertions(+), 104 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
