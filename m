Return-Path: <SRS0=iBsL=EQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87340C388F7
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 07:28:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1109D206E3
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Nov 2020 07:28:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="p1YYXdMH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="L0Xpq8HY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1109D206E3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e75KVMnYT8dYqEHapaO4qDCVC7IbIOEhjKBJbLuVp5g=; b=p1YYXdMHX/bsFGZIBeToot2g3w
	46iLvRidjIrw8YjKeKdqTGCMIYrVkDOzNpcw5iM+IT88LRnf5hI1e+ZxdmMwBDJH8dsJLPcEQKPxP
	WDh1vRmqYsnqjLIKX3KAGjRPu7WHKr6uZe7PneZ+iDGA/utGvNnYujVKGwOTbBNF7xEE7xf3ucyIB
	NdNz3QZK4GxCQ90e8CcbJk5B7QiqvGLACUoob9oBbKwTnTfYaCpIV/dX1WJ5eICO2GoNLY0VYB6h0
	q2ZObLkO/yX6Xmc8iMgXShjuPKBp9mpg+jNbnoq6FZyQu/Tjn9A/0y61hEA9etScv4TKIZ1o8LUAT
	u7Eb9wtQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kcO4b-0006rb-Fl; Tue, 10 Nov 2020 07:28:13 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kcO4Y-0006qN-Of
 for linux-riscv@lists.infradead.org; Tue, 10 Nov 2020 07:28:11 +0000
Received: by mail-pf1-x442.google.com with SMTP id e7so10585852pfn.12
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 23:28:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YXAqxmjmagUUMTqazflkMp+W3D5vynn+tv76fX8fmb0=;
 b=L0Xpq8HYY8zZ8T81fBm8MJOhlIw56+amwiMYIoU0QsQ0hyRcZ/x/6Fkk4MbUemAb/e
 8m/RAK0/gfNPcm1Dw5CCr4yGqrphaT2zoP5cYOBguGAr1R0U0t+fjAuQJOeAT1yBycRC
 D+XNbBehzjDoQBztNYuwZMJorJQ/wEDP2EJRE4EdD5p25kipvgtA+tRVMfRMz5ED8rOl
 XOmUoHtftlV7RwBP/55v5Qi1c61dtNrWPYAMYIwmZFYOK03Tf90ZpeHL9FVwJv4UTOTv
 7ls4e7RQ5+Qn1Plakgsj1jt6aTFlAaCRHZ7sTUrMyhxz/8lFt5OaZ3X3zPDKbbOo7v8X
 LRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=YXAqxmjmagUUMTqazflkMp+W3D5vynn+tv76fX8fmb0=;
 b=KmZXYaZcequdvNsSAfLme6+riZ+jxP7dCmpLDi4aosQACtErTrGmIq7tszDLugOJ0R
 N0hRC2aRJZGUCtlpU+WO/ltsuD61BV76oRigQUnK1MyY+kaPngBFj8bhcORRuxcaR720
 Y4m9MfK4yx7/HY6aEkUVpWX3b5/qjxF53W8hZb8Nh0lCsAYJhStYSWVGQqWpMm8fjBCQ
 3WF9jfW2UoTcQ9IPJi2I3Pyn9vEVvJqDGsSHffDSE2IkmMWqcYm3t0r6/LlAX4Zuxk1d
 XMFBQFr9QEOACFEJwfNl+28JOq2KW9GuCQhkblFJjAk0RD72ENV5chaybRl5D1le6T3Y
 E6vg==
X-Gm-Message-State: AOAM5313Xl7M5JyxLThgYWfIowOCBxXfbl/ANYsiiCfDq8LPoy92u3Ng
 +QKuwyORPWZoqwxGsOeicH0GDg==
X-Google-Smtp-Source: ABdhPJx/a67vEgBae+jayH60wcCsinq6WQh7Qtmzg/cjuEH/Goex8BLhj9hLWtvQQSvgCnaqIcd40w==
X-Received: by 2002:a17:90b:2152:: with SMTP id
 kt18mr3594134pjb.10.1604993286710; 
 Mon, 09 Nov 2020 23:28:06 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w22sm12233191pge.25.2020.11.09.23.28.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 23:28:06 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 yash.shah@sifive.com, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] clk: add driver for the SiFive FU740
Date: Tue, 10 Nov 2020 15:27:45 +0800
Message-Id: <20201110072748.46705-1-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201110_022810_844113_C589CDC8 
X-CRM114-Status: GOOD (  11.28  )
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

Changed in v2:
 - Remove the macro definition for __prci_clock_array.
 - Indicate the functional changes in commit message.
 - Using option -M and -C to create patches.
 - Rebase code to kernel v5.10-rc3

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
