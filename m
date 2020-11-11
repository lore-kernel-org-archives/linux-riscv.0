Return-Path: <SRS0=0ydX=ER=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E902C4742C
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 09:35:32 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 81912206CA
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Nov 2020 09:35:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Twh6yAwn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="QLVIoBk/"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 81912206CA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7vLok5eIB9DfO1i/bhfggSTDmnMxtuch+jfzlb9Z/74=; b=Twh6yAwnIvq/zzdbtx+9ydZhVV
	4G9jfwulUV8WS5oNrwlYkSqBcdUdwCWRZaIHHDF7AQiBZ6nJbX6iBtHKw0+LELZKpV0I5lS2QqTDl
	wUD50TC2Vjq5c9nkRwOlhbUK1S9tpsj5/2Tau43/2arPqt7kbKCO1v4d+uUBfLgKv0KTDhL6NdOO7
	YDSurcdnrvAQud7Gn4TGbWWAwghgSeTQ4+r4vk5Dh2W6PSI+zrZrc1DNJh5bxPAwaUXMSAwkrw5qC
	2TGnTjHEwsu+m1Z2/iF1D/pnPFtA7MIfCXG6e93dFmD9/P4Lfx7OCfgZV+c+g2qNRwGWPxFYJA56C
	van8GGrw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcmXF-0005l4-8Z; Wed, 11 Nov 2020 09:35:25 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcmXC-0005jd-FD
 for linux-riscv@lists.infradead.org; Wed, 11 Nov 2020 09:35:23 +0000
Received: by mail-pl1-x642.google.com with SMTP id cp9so698594plb.1
 for <linux-riscv@lists.infradead.org>; Wed, 11 Nov 2020 01:35:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QmA+jLoNrTCA2+Mt4Q5LbDfOt6s2dRJWxbjFrCs/Ci8=;
 b=QLVIoBk/QSBtn4VAMXQrR7hbsG73rbW5vsg4oZUfQYgF8WYlkhZh4p99J65QEoVpRM
 toarObrHKgOx39tSEQkO6AMetfVfGcKHGA3C1BG6A7+4xuXSMnz0NrjriacAHwSGbalu
 hqk0GHgP1E7sN4E8vawpAzTodtSyYTzfShIEwQJIAQx8UuhTfB7pB32htUG+Who08anm
 t02xIU3jKF0hzrx9+S8b4x1t2doNpslf8tHm4jpZOyUOEeuMxYT3Prkh6tIk/JQmFAPK
 YhxjN9tY/8c1317TBKXlK17TE8BgGxFt4eG8Gcqh0N1ovjaTrjCOv4dqqCPQP+LDdvvQ
 u5tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QmA+jLoNrTCA2+Mt4Q5LbDfOt6s2dRJWxbjFrCs/Ci8=;
 b=hyLbein8dLtKgnZlu/Owr/MBhjtp6BWvNcRsewZ3Kb/5+5uNJRMkZHVs1q72ML2bWy
 8Gr5W5ZfrIL7df7EdJYq9tep6J9CVHH6RssvI+HL3P3eYEgS+jA5WKYPhIvHlvEEfNVE
 roHIp4m2+UQp1j98gqVPfFiUtZIs0PVVkAAdAEn/kKcp+0n67CbSFnezFou6nYWcui7F
 isIQtSsGXN4O2G015LrxSiW/7S0ZJ7kq0OSbxsgsxUsCopPQVaDsUfTmEZKa++Ubglbi
 0/hNzI+R4r7iRm+6m3unQBf1hA2ur1JHRpbdWzlYEWMdWAVw6iukp6IfNv0nLkjul11w
 DETA==
X-Gm-Message-State: AOAM533SaP2C1sB4JAExNZiPL3qup+kGdaMFxRGW5a4lbeMqsj4SYfhG
 AoEx0alxkXtWUXPpFRc1nqErzg==
X-Google-Smtp-Source: ABdhPJxC70iXZ53+Zu2FOrGuQQx34cC84+q4xcOoLMcPe0csIhqPxj/fM/F6TDzKykpV8fkPWsfbTQ==
X-Received: by 2002:a17:90a:d182:: with SMTP id
 fu2mr3078446pjb.145.1605087319519; 
 Wed, 11 Nov 2020 01:35:19 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id m6sm1862424pfa.61.2020.11.11.01.35.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Nov 2020 01:35:19 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v3 0/3] clk: add driver for the SiFive FU740
Date: Wed, 11 Nov 2020 17:35:11 +0800
Message-Id: <20201111093514.103155-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201111_043522_594925_AE83CF6B 
X-CRM114-Status: GOOD (  11.43  )
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

Changed in v3:
 - Fix the worng bit field shift.

Changed in v2:
 - Remove the macro definition for __prci_clock_array.
 - Indicate the functional changes in commit message.
 - Using option -M and -C to create patches.
 - Rebase code to kernel v5.10-rc3.

Zong Li (3):
  clk: sifive: Extract prci core to common base
  clk: sifive: Use common name for prci configuration
  clk: sifive: Add a driver for the SiFive FU740 PRCI IP block

 arch/riscv/Kconfig.socs                       |   2 +-
 drivers/clk/sifive/Kconfig                    |   8 +-
 drivers/clk/sifive/Makefile                   |   5 +-
 drivers/clk/sifive/fu540-prci.c               | 586 +-----------------
 drivers/clk/sifive/fu540-prci.h               |  21 +
 drivers/clk/sifive/fu740-prci.c               | 122 ++++
 drivers/clk/sifive/fu740-prci.h               |  21 +
 .../sifive/{fu540-prci.c => sifive-prci.c}    | 499 ++++++---------
 drivers/clk/sifive/sifive-prci.h              | 289 +++++++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  23 +
 10 files changed, 703 insertions(+), 873 deletions(-)
 create mode 100644 drivers/clk/sifive/fu540-prci.h
 create mode 100644 drivers/clk/sifive/fu740-prci.c
 create mode 100644 drivers/clk/sifive/fu740-prci.h
 copy drivers/clk/sifive/{fu540-prci.c => sifive-prci.c} (45%)
 create mode 100644 drivers/clk/sifive/sifive-prci.h
 create mode 100644 include/dt-bindings/clock/sifive-fu740-prci.h

-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
