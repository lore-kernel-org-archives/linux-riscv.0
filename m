Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB0A5C4361B
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:14:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53DBA23A6A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:14:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53DBA23A6A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kw5Z3R6jhsJnc0wPjwzEn2By3TxHNQqZej+jJKNJBbI=; b=DsomFb/n6cuNtRi2m2JIXPVikL
	ZzYd63PMTB35presLxsbaktBZJCKsCd2ig2JEKjgCoYfFOapJz/d8YZv/ujwfBuShpUTEeZaioeR6
	ccAuV9b7Vwb0mSF21C4gh87v5WGD1uUlV0j2QaXZusHo65+BbrL0A5Y07ewI63gU8HR7iW0d5cKKX
	kbeY5hnxCPWyvQpFeXSMjCiRawTk7MZyU5vlGFhd3y0K2iLarYB+7OmrOh3K/erYEQX42v3OtxViX
	RUbj3xQwz9L7ejLRq5pTxabwqe9TWoGsrj7xINJx7wdBhmS2QQ2dKvba5osOURKGJAeCwSUcdO3Ku
	/QuvXi3A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXCx-0004dc-Qb; Tue, 08 Dec 2020 07:14:47 +0000
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXCu-0004cA-5c
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:14:46 +0000
Received: by mail-pf1-x441.google.com with SMTP id p4so7165252pfg.0
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 23:14:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qOlsloJgxQkZEy55JDorTCm1I5tHRxkFTRlp6EieeA=;
 b=cDR/LIN65OUPo8a2wnb5yJ70LfqOZLtBPBOoVg4c6uOnZ2t0/tInUdpHMOmbTvVjaI
 Vjvd9yBJv+VlVQghaLfPk5OX2gv8gySfFeB9EfaPqgUB7Rv2tGhYBa8unI4U7D2D3sqe
 I8GfkolWWf32L6zlgAVfncXeW/k6B7001ZyTJi8GZBiEYkgDjBoq5DWL8mA3SeNvp7jG
 RxNRSEVgAOTt9x3iLI1gXL434cWQDvty0Hcumq61d4ke+kEzhhiuhrN5bBIH5DdufpFt
 2YALJWXOEYO2gp2KWc1fmYmw55De5H1kRYvJTbz0Pdh8uItsYzwacD3ahbGeUTZ+A8cy
 vrvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3qOlsloJgxQkZEy55JDorTCm1I5tHRxkFTRlp6EieeA=;
 b=ltLROtoYREpDh42aS5Ak/c2Oe28G+OEY3XaWdc5R8Vvry0/m/7rSsas+OoIzlyX8k0
 ZDjNPB8YflvDWTj9pnqmRFZIu6dWDdZlE7oWlJXLSMI7lD2/xhhr6XZaeVpOIz3e2xKb
 P67g7utDKxURRGjgolhmAmNbCPW/BqFwx8jpBucUVeqv2b1K60NTYMUeXOKdIj9WlIml
 mRtLJo+kWSubeEhr3hH7eVVnTNn+jP5R80Hk2bWmFR3bwzknkOsznarV6cVyRpVcWyYx
 mZoCiAQruCWUDD6pln1d0tPAbXNL7D4Y0r2oDKUkKBCLQnlyDx4q/+//+sSahNwug0Pr
 WRZg==
X-Gm-Message-State: AOAM532Y2kFfPuk/vAZnhzx9SNQb2mPm8Ew5Gs81BqxKryHHzrd25Lks
 pkVK6JoiYIogrfFEdIleIQL1Dg==
X-Google-Smtp-Source: ABdhPJxmZfF+CnAcve/pdIigoVV18lefAg/7CfvlDUYpdYDSaWxYPJidXa03T2kXUUGN1JSSBlGqDw==
X-Received: by 2002:a63:561f:: with SMTP id k31mr21413333pgb.227.1607411678623; 
 Mon, 07 Dec 2020 23:14:38 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id gp17sm1801318pjb.0.2020.12.07.23.14.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 23:14:38 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v6 0/5] clk: add driver for the SiFive FU740
Date: Tue,  8 Dec 2020 15:14:27 +0800
Message-Id: <20201208071432.55583-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_021444_515780_A1606245 
X-CRM114-Status: GOOD (  13.31  )
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

Changed in v6:
 - Modify the patch "Add clock enable and disable ops"
   by Pragnesh. The changes as follows:
   - Remove spin lock in enable and disable functions
   - Call enable_bypass() before PLL output disable

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
 drivers/clk/sifive/Makefile                   |   5 +-
 drivers/clk/sifive/fu540-prci.c               | 585 +-----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 120 ++++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 drivers/clk/sifive/sifive-prci.c              | 571 +++++++++++++++++
 drivers/clk/sifive/sifive-prci.h              | 299 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 1089 insertions(+), 566 deletions(-)
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
