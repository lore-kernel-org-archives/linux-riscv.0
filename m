Return-Path: <SRS0=uNJT=B7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A4CCC433E1
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 18:27:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41DFC22EBF
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Aug 2020 18:27:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="U02xZmHL";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="QneoFIKU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41DFC22EBF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:To:From:Subject:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QDiv/MSM+Sy/8stHIUjscKhbb4+weKoXpU/rFuT++kc=; b=U02xZmHL6D/DtbNavX7Ce5jKRT
	r2CE6qAO1l8cJWSITPRZUsdsfyj4txLM0TjhPqJd7L0uEOOhmhEwrPreFkc2VwhMFjJMaJ8kmIKxd
	aeElZsDOJTnMNV5Tw2QSbalS/DktGJrbd5QZ2YKsscmQjeSLS7kMMGw6R/B+dxTAixm+hhbMpqbOA
	M9eqN8M585OsLuIxJjDXazP7iZzLE+8dPjfDEdOSgjJj5jwmG2GSce47nI04qaPMaIqxBoIlHFcWG
	GbWZ4QuzqJfHm3IJIuZ8n8LI5BFo5psAd0NxDARw+lyvmpbJa6zMwlXIm9Zyh11PEGXB68lEcCm0R
	WL04kU+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1k9Bkb-0008RK-3v; Fri, 21 Aug 2020 18:26:53 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1k9BkX-0008QU-Nh
 for linux-riscv@lists.infradead.org; Fri, 21 Aug 2020 18:26:51 +0000
Received: by mail-pl1-x642.google.com with SMTP id s14so1261071plp.4
 for <linux-riscv@lists.infradead.org>; Fri, 21 Aug 2020 11:26:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:cc:from:to:message-id;
 bh=UfiaKNHVUOJp6y83l+zDDzL8YjdP1aXCnAawlT70F7Q=;
 b=QneoFIKULFQitVGh39KS/agGfZlihosqNChwoNV86tLkjBCSXBKLRSShLPhpp1FKhq
 AEZPYX6IDEQQ4biSE5STbp9xPyc3EsEPdqzqjlSYC0I4SOKhsrNz76VWy8lV1Z0EouOo
 H3N17Ps1PgP7KquaNRd0fk9Br/XuSxk0ROaK6hX/cGDSVhEcoiCIxlXwtPjWZFAAASFx
 2QsVCrJC0lh7dbWCWo9Nl8YujyyIcFnNeZc12NYDA0Nj4Ewd4O9a/EIsjNsHTXsPN4ue
 aYSTbRu+ZCer6h4HLo+zK4o5U9Vp/2qHk4e1HM2j9WpKDxbG5SkGGyludWa/E2vWB8gz
 JH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:cc:from:to:message-id;
 bh=UfiaKNHVUOJp6y83l+zDDzL8YjdP1aXCnAawlT70F7Q=;
 b=RnHYIVqRF2w2rjrwsB4PECgppZKVk9HXdrR5HHHCOO3GKawHjlAaVCbGjjP/AqyL77
 GgC1pSkS+hJ48/PfJCbehsD79D5ZVY7RL0m0MF+dPQ0DU63LaQNrdPLlno5HSxJAjwDB
 K7AskeG7o64Q795oYoSGdSKVrK7szFx8AtGcDF6PAsIMNxC7faG7/jaCa6e0xbhxtF0N
 42ul3tc2n+LM6f6vWDeV/dDP9aNsZLsXmz5mVgM+ZC92X/8UPxDYgtLFsbqrG9QKSYAJ
 9Ok0TJ8wD9X3cmUB4fSDMF7K568f87Nup5D3DFW5Vf3ako8BV3NZjJvUHMxuI+RrB368
 KOFg==
X-Gm-Message-State: AOAM531Gh6deOvshYAIdNX9NrD61GBrs/41EsruyxmEK9SGDimvQXeWa
 X9Tjvy5l8w+vmMjtibLViOQ4jjr1Q6h6eA==
X-Google-Smtp-Source: ABdhPJx7mlC6cSX/hC1RAvE6kOfVwNUoESPycgeHVvTL2/zAwXnbTiu7M/ky+vhG8r6P0WNCeC0Bxw==
X-Received: by 2002:a17:902:6545:: with SMTP id
 d5mr3327296pln.257.1598034404762; 
 Fri, 21 Aug 2020 11:26:44 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id w3sm3509478pff.56.2020.08.21.11.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Aug 2020 11:26:44 -0700 (PDT)
Date: Fri, 21 Aug 2020 11:26:44 -0700 (PDT)
X-Google-Original-Date: Fri, 21 Aug 2020 11:20:22 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 5.9-rc2
From: Palmer Dabbelt <palmer@dabbelt.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-32c8d053-acbd-4c72-b41d-8d6042ac639d@palmerdabbelt-glaptop1>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200821_142649_897232_436E5649 
X-CRM114-Status: GOOD (  11.86  )
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
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 9123e3a74ec7b934a4a099e98af6a61c2f80bbf5:

  Linux 5.9-rc1 (2020-08-16 13:04:57 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-5.9-rc2

for you to fetch changes up to fc26f5bbf19459930b7290c87b65a9ae6a274650:

  riscv: Add SiFive drivers to rv32_defconfig (2020-08-20 11:00:21 -0700)

----------------------------------------------------------------
RISC-V Fixes for 5.9-rc2

* The CLINT driver has been split in two: one to handle the M-mode CLINT
  (memory mapped and used on NOMMU systems) and one to handle the S-mode CLINT
  (via SBI).
* The addition of SiFive's drivers to rv32_defconfig

----------------------------------------------------------------
Anup Patel (4):
      RISC-V: Add mechanism to provide custom IPI operations
      clocksource/drivers: Add CLINT timer driver
      RISC-V: Remove CLINT related code from timer and arch
      dt-bindings: timer: Add CLINT bindings

Bin Meng (1):
      riscv: Add SiFive drivers to rv32_defconfig

 .../devicetree/bindings/timer/sifive,clint.yaml    |  60 ++++++
 arch/riscv/Kconfig                                 |   2 +-
 arch/riscv/Kconfig.socs                            |   2 +
 arch/riscv/configs/nommu_virt_defconfig            |   7 +-
 arch/riscv/configs/rv32_defconfig                  |   5 +
 arch/riscv/include/asm/clint.h                     |  39 ----
 arch/riscv/include/asm/smp.h                       |  19 ++
 arch/riscv/include/asm/timex.h                     |  28 +--
 arch/riscv/kernel/Makefile                         |   2 +-
 arch/riscv/kernel/clint.c                          |  44 ----
 arch/riscv/kernel/sbi.c                            |  14 ++
 arch/riscv/kernel/setup.c                          |   2 -
 arch/riscv/kernel/smp.c                            |  44 ++--
 arch/riscv/kernel/smpboot.c                        |   4 +-
 drivers/clocksource/Kconfig                        |  12 +-
 drivers/clocksource/Makefile                       |   1 +
 drivers/clocksource/timer-clint.c                  | 226 +++++++++++++++++++++
 drivers/clocksource/timer-riscv.c                  |  17 +-
 include/linux/cpuhotplug.h                         |   1 +
 19 files changed, 376 insertions(+), 153 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/sifive,clint.yaml
 delete mode 100644 arch/riscv/include/asm/clint.h
 delete mode 100644 arch/riscv/kernel/clint.c
 create mode 100644 drivers/clocksource/timer-clint.c

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
