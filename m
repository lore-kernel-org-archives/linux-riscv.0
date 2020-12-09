Return-Path: <SRS0=PU6a=FN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54E35C4361B
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 09:49:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D5AB823407
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Dec 2020 09:49:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D5AB823407
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2gImrJ0VYK3QdCWXGN2WPx/0N2m6bodAJHEXEP0HAfc=; b=tgJKNzJQHNuQOmLUQP6xq9uEwc
	LLqs9qRVLTuY2dKBTMlar1o4DUTkg75b7TlD6K80iZQY4JGRLX0O8gSuzHG8wE3RtRG81DFgMGx4F
	4BXzfFsyjcrrjr49P9+YchxUPF+lYkCQoXh0u/fy6oz+aDP/v3Zwphik73Vis6mi14VEN+ZnRZeMq
	QgSCTk7EOikuYxmH9cvW7YfGUlt/PVP7HyqJFV/siYc4MfNF4drJl13b32LzrNYkCNa28+5FxyP3/
	+W3igIakfsV5jvnvVHMqEXavTb96kLHF2EdpwK/EWSZrwiEcvbdxtiZQA/BitJKImKHsa7fKvKwO1
	zEV5zlYA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmw6D-0005qD-UB; Wed, 09 Dec 2020 09:49:29 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmw6A-0005pd-VN
 for linux-riscv@lists.infradead.org; Wed, 09 Dec 2020 09:49:28 +0000
Received: by mail-pj1-x1041.google.com with SMTP id hk16so614134pjb.4
 for <linux-riscv@lists.infradead.org>; Wed, 09 Dec 2020 01:49:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AL3YkBOv5b8sByiXoR73Ol/0eY4rxeAavz/QsSxvMII=;
 b=EGHlGAIsmIclMzfOdAuhmFO/HFM6CkrW380E7NpmzwdrfRTpqgfCk0sjga5uyenLiN
 H2yIZxwsTQhOjmP7BVMHBTGvafQ8705ZoFLGKdL6YHxSWhSjyMjQi1+QZf8rcJuP5VIS
 ICWVUY1m0ip33W7qSJt5qTpDMVWCpPKq5oBpi6l9DzE9dJXa+7APZ5WNAN9tD/z6blVv
 lsYFa2871HHWbbgAr2O/8v9VYXUnJOuGqa5myZ4DrrUhIM5fXl/fXvpy5RppEz0B00Eo
 cLuUoKbvc0u2TLsCXXL313Xa6jyN8ocVM35xgBp2FSr28doO1Uer60LwTmBUeiDgcGwI
 iUeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=AL3YkBOv5b8sByiXoR73Ol/0eY4rxeAavz/QsSxvMII=;
 b=fiZf4XZsGeCrbmtMsEAA2k2hX8tuK9yz7EL7opa7FY8uP+GCSMVWkGZgOCgpDOfLDt
 x6t8D6AYSoByhj1LRoVux9rmfHuGNr+wKSyxrVoClz0dzApLv1L7chRyNriRTPOzkD4J
 BVM/huAM1xcP/m+2YZgROlrR4kBGiarlpImonJUzhOqr3OEPacNGdfVZ2iA0aq2hjVtk
 CgnuJJOv797L5AJyZ95HhynEndevYh9RRTW3vW+SpxJ0LVmuVjtJMp+7PiNC2X457Y7A
 EoOVIBv1kMj5f9Fa67eztjCQFneJWfB9Sn61yxYN/UyS1Fv1LMmc6Tz0pcF5jntkZOB1
 i7fA==
X-Gm-Message-State: AOAM530Gi8O91eaxX4sn/0cE3xA6YDvwn7h/2BNM1wnyKjJTRJZHn3vk
 D4Q57MTDH04gHB58mF/ctRuIMQ==
X-Google-Smtp-Source: ABdhPJw9bu6mcnqWxY0e+Od/1TRJARGDeLGom/lEpeDI6x4EAsCCzqcchepslIO1y79reQL1kfkGZA==
X-Received: by 2002:a17:902:ed11:b029:da:3137:2695 with SMTP id
 b17-20020a170902ed11b02900da31372695mr1289502pld.1.1607507363144; 
 Wed, 09 Dec 2020 01:49:23 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 129sm1890354pfw.86.2020.12.09.01.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Dec 2020 01:49:22 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v7 0/5] clk: add driver for the SiFive FU740
Date: Wed,  9 Dec 2020 17:49:11 +0800
Message-Id: <20201209094916.17383-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201209_044927_311939_2394BEF2 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: Zong Li <zong.li@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add a driver for the SiFive FU740 PRCI IP block, which handles more
clocks than FU540. These patches also refactor the original
implementation by spliting the dependent-code of fu540 and fu740
respectively.

We also add a separate patch for DT binding documentation of FU740 PRCI:
https://patchwork.kernel.org/project/linux-riscv/patch/20201126030043.67390-1-zong.li@sifive.com/

Changed in v7:
 - Pick changes in v5 back up into this patch series.

Changed in v6:
 - Modify the patch "Add clock enable and disable ops"
   by Pragnesh. The changes as follows:
   - Remove spin lock in enable and disable functions
   - Call enable_bypass() before PLL output disable
 - Rebase code to Linux v5.10-rc7

Changed in v5:
 - Fix copyright format
 - Add a link of documentation in commit message
 - Modify build dependency for sifive-prci.c
 - Add enable and disable functions by Pragnesh Patel

Changed in v4:
 - Fix the wrong enable bit field shift for FU540 and FU740.

Changed in v3:
 - Fix the wrong enable bit field shift for FU740.

Changed in v2:
 - Remove the macro definition for __prci_clock_array.
 - Indicate the functional changes in commit message.
 - Using option -M and -C to create patches.
 - Rebase code to kernel v5.10-rc3.

Pragnesh Patel (1):
  clk: sifive: Add clock enable and disable ops

Zong Li (4):
  clk: sifive: Extract prci core to common base
  clk: sifive: Use common name for prci configuration
  clk: sifive: Add a driver for the SiFive FU740 PRCI IP block
  clk: sifive: Fix the wrong bit field shift

 arch/riscv/Kconfig.socs                       |   2 +-
 drivers/clk/sifive/Kconfig                    |   8 +-
 drivers/clk/sifive/Makefile                   |   2 +-
 drivers/clk/sifive/fu540-prci.c               | 598 +-----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 120 ++++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 drivers/clk/sifive/sifive-prci.c              | 574 +++++++++++++++++
 drivers/clk/sifive/sifive-prci.h              | 299 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 1091 insertions(+), 577 deletions(-)
 create mode 100644 drivers/clk/sifive/fu540-prci.h
 create mode 100644 drivers/clk/sifive/fu740-prci.c
 create mode 100644 drivers/clk/sifive/fu740-prci.h
 create mode 100644 drivers/clk/sifive/sifive-prci.c
 create mode 100644 drivers/clk/sifive/sifive-prci.h
 create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h

-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
