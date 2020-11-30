Return-Path: <SRS0=EtLq=FE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD213C5519F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 08:23:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256BB20719
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Nov 2020 08:23:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ndBLOx+L";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="lMIEdjFC"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 256BB20719
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V6IG8EBkvunntXfStSuG5zgC2RnstrPZddYUWSIHXao=; b=ndBLOx+Luw+MbnFw6o8ZAiWFU7
	R0n5e7k/vB4C23hZtpycpiAtJ1Qe5r/6zdoOwuPRGXf2o7f0x1p+gfTz1iDd2AL/7P+Q9Ve/kj2+1
	65fyqSfbFfGmRJ8siZlMt5k88CJGiZRPfMF/LFE8cCmX60sgMyDo3jtUHUv7WUmnUzPz0XPpTL8Ke
	ZtJUYyzp1Bs7xDsk22EsBHWfQqJDrBSo04g4Vf/42e8MBorBIbPQfXiA8uvkKz3RRHVARtX8hpM7k
	LR2v4xV2pdui3UUsVq8HY5eViczIbYH1mhEl+LaNjH9IEPR0fLHHTDRFeEOnHeCisfWskMWyMXZX3
	jlEnurqw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kjeTH-0008Lo-Qt; Mon, 30 Nov 2020 08:23:43 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kjeTE-0008KM-7r
 for linux-riscv@lists.infradead.org; Mon, 30 Nov 2020 08:23:41 +0000
Received: by mail-pl1-x641.google.com with SMTP id b23so6065904pls.11
 for <linux-riscv@lists.infradead.org>; Mon, 30 Nov 2020 00:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/CSafwFA0FXbIVsTa7ADySx19FcNz+0PmGY57JmVt0=;
 b=lMIEdjFCJ/yuRWk/OEQDiBBJsY8hqZVTK0xSnSsRu3LW9tOLtrhSo+n/bSL3HhY240
 juMks9fwlINT27VglqJ54uLBgUmMsz832g39GQN2i89txD5s9e6njynxfhX4tsmwHaVw
 9sQ6z78+pjJstNCF9QcotylG9226qdJU/uPf5AhnU7ZxxpdminTwTvkVYM6sujjfiLTv
 TDqTJecqUpSfWqA6meaGmqkEdBH3YmyQn45RTs3Z42Z56rV7QNwZt6ByrtTuitthmaxj
 eL/uXNw8dqx0AxrV+cgiIHEiniZ+OZwbM8VR2/C6BIdBzMqwfldHu/29ymP3lAJvB5qy
 Hbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=m/CSafwFA0FXbIVsTa7ADySx19FcNz+0PmGY57JmVt0=;
 b=rpG6zoQXOQ12Ffp4gZZlnIyWyrlQ/88cOBOZc0XGRfYFc7ED23rpehYA/soSIWxIt5
 ovV+N1aEKSKz6SZnSJPoS4RXTvqVrhwTt91XZNLe5JbFhdPlXUTOZKZAaSW6ju5OTz6/
 9tF2nNANpEGK5N1/KlBgJL9fi2YTeY3DJWL6p5bEqhTa/vMT7wukPatOcvHu3xEYiOy+
 bvBLkUU/8k2aVGaQBi79sb5R7L95CtYpSyeiaK/EHadshqXsp18B/yBQ5VN6jRmfySkt
 yOeynsNs63ogHEfCUc/NB5tfNnUkVWCdw5XBnwny4pcuNFoq3XqV9Tc5TEXTukjwDIO9
 MtqA==
X-Gm-Message-State: AOAM531PzI9pLVN3C+QWOF/Jhfq0KqRRqe7N4MrxGp77MgKdoqeRzr2D
 rgwcfXnef7Q9YrC2eVk89yJMsg==
X-Google-Smtp-Source: ABdhPJyu3ueyDOQsKAR72BU6j8iQ01RyXP5syiq90vuC1IgTm3apKg66Jc/W8bjbBfIYzTdz7Go/kg==
X-Received: by 2002:a17:90b:338d:: with SMTP id
 ke13mr11269154pjb.48.1606724616340; 
 Mon, 30 Nov 2020 00:23:36 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id u1sm21265338pjn.40.2020.11.30.00.23.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Nov 2020 00:23:34 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/5] clk: add driver for the SiFive FU740
Date: Mon, 30 Nov 2020 16:23:25 +0800
Message-Id: <20201130082330.77268-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201130_032340_594322_3BC5FC82 
X-CRM114-Status: GOOD (  14.19  )
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
respectively. In v3 and v4 patch set, it fix the wrong clk enable bit
field which reported by Pragnesh.

We also add a separate patch for DT binding documentation of FU740 PRCI:
https://patchwork.kernel.org/project/linux-riscv/patch/20201126030043.67390-1-zong.li@sifive.com/

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
 drivers/clk/sifive/fu540-prci.c               | 585 +----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 120 ++++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 drivers/clk/sifive/sifive-prci.c              | 588 ++++++++++++++++++
 drivers/clk/sifive/sifive-prci.h              | 301 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 1105 insertions(+), 566 deletions(-)
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
