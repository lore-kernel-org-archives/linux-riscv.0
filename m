Return-Path: <SRS0=qC9n=SG=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA340C4360F
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 00:38:39 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 99D5520820
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  4 Apr 2019 00:38:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Yjvr6NrW";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="AUoSLdpG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 99D5520820
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sus5cQ+3Kqdt4r8JT9/nlp2p2adNzhD1cjx6ZaJUk8k=; b=Yjvr6NrWWrN+sj
	ik4NKKqjf0BCXEwPRZkZ7Zf+gTPuKz8ucKd/XPV3IeLMKwW4MhI9FFB1KxKTNvFQYRwcNNRg9KkhU
	ErKr8DGuZmvbA2rBaG0VDyvoDTk1xHJ0BNb/egMqtJlMVqgtsmzjx0z926EJtliKr4sm4el/IAgjQ
	2ml8f2fY6bXDii1lwhnZ8yj8FeC+S8N4mnEPAC2BO9acGxYyv8/H8jIYisUPjdi9LYMiJrCjLh54E
	uArvWoDcqCsWq/o4d1MAVQiVTyj07VryUVsZWdUyYi4+wrQOwcoglOr0XnDWA7s2GSKYR3CnquP9K
	wXygQUVpHhxTGNmsCzjw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hBqOq-0001Iw-96; Thu, 04 Apr 2019 00:38:36 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hBqOo-0001IZ-1D
 for linux-riscv@lists.infradead.org; Thu, 04 Apr 2019 00:38:35 +0000
Received: by mail-pf1-x443.google.com with SMTP id 10so426427pfo.5
 for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2019 17:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQbWDfJcGsTny0umzfGxUknauZKQ9hwvFbMePNwP87E=;
 b=AUoSLdpGw3sMGjAwH/SKIxx5vgxP601M6t9ZW+vIvlDjbR/06N4fPsT6sfyU4Uu23A
 ieXdyBB4KjlyRMqchFhONOoZsZSCkzT0BbyCyVgId1iZtMLUvWk98Z09vU1OFIMyo109
 4MJAvmC5ekIpLmCxS2WQiz/rYI/d9iHaS7k9gBjPx5j+F3xCNOYiDrHfqOdk8h4YpO7B
 ZCSVCkPG9Ixel7s1pmmrmZ8pTyLR527Sd+lMRpNwoLLue4HKFYl77oISetRDyod/rEmN
 hYnSPvqUPxkO/jjXDwomZvmCRBqHp1+C9iaCVGag3zz1cJovax9lOJO+2VHkGoduYluT
 lN/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=OQbWDfJcGsTny0umzfGxUknauZKQ9hwvFbMePNwP87E=;
 b=tEvYyNRTE/5y0SlpF3p1w9bVqQHBep8ky2MZeVa6UT56PpklN4aKHpKtAMvylXCqd+
 iWHnbqDlNWh+hgtI3tKKZ6qA7kdsaY/iDpoGQ9WAYp2VlgBHuUNzxfrjM+CKhHLeDZOC
 g9kd7PrWQJufbdRRB8yWszTV92L/SPR30vqyQCHrEGXQHJBFK6mOf4F2jI68TkNkX4Qj
 2v3TjJnV5Ol/XrBsF7CGLkc+xp+hHMJYfUIe7VAxh+uoaP1WrFdO/e1FFsL1s0B1AKIV
 UDVLj6SrCRr3NsZEXaRgltP9XZorAf8Ro15GsAeQvWnnlrEtnv0z71fnkByWJPIytlKk
 3x4A==
X-Gm-Message-State: APjAAAXz1KUX5HNWh95iU8Kc+N+pFcVEaW3ICVDt6meJ9krJsJRA0Eht
 9vlvXReAjEcQlnwLd/WxYT/iBA==
X-Google-Smtp-Source: APXvYqwuJoKd6QAAOUETvnqcXFZ2NLuD8m2VPdVyJHkPP7c0AchADYsDx/Eec+gG019ba6w6kHCCMQ==
X-Received: by 2002:aa7:814e:: with SMTP id d14mr2587628pfn.101.1554338312957; 
 Wed, 03 Apr 2019 17:38:32 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id q11sm27470321pgs.94.2019.04.03.17.38.31
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 03 Apr 2019 17:38:32 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: mark.rutland@arm.com,
	robh+dt@kernel.org
Subject: [PATCH] dt-bindings: clock: sifive: add FU540-C000 PRCI clock
 constants
Date: Wed,  3 Apr 2019 17:38:20 -0700
Message-Id: <20190404003820.10679-1-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190403_173834_096978_141DCBAA 
X-CRM114-Status: GOOD (  13.29  )
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
Cc: devicetree@vger.kernel.org, wesley@sifive.com, palmer@sifive.com,
 linux-kernel@vger.kernel.org, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add preprocessor macros for the important PRCI output clocks
that are needed by both the FU540 PRCI driver and DT data.
Details are available in the FU540 manual in Chapter 7 of

    https://static.dev.sifive.com/FU540-C000-v1.0.pdf

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Wesley Terpstra <wesley@sifive.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
---
Rob, Mark: this patch is a prerequisite for both the FU540 DT data
and for the FU540 PRCI clock driver patch series.  To prevent one
of those patch series from depending on the other, I'd like to ask
Palmer to merge this patch in one of his -rc pull requests.  Could
I get an ack from one or both of you for this purpose?  Thanks.

include/dt-bindings/clock/sifive-fu540-prci.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)
 create mode 100644 include/dt-bindings/clock/sifive-fu540-prci.h

diff --git a/include/dt-bindings/clock/sifive-fu540-prci.h b/include/dt-bindings/clock/sifive-fu540-prci.h
new file mode 100644
index 000000000000..6a0b70a37d78
--- /dev/null
+++ b/include/dt-bindings/clock/sifive-fu540-prci.h
@@ -0,0 +1,18 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2018-2019 SiFive, Inc.
+ * Wesley Terpstra
+ * Paul Walmsley
+ */
+
+#ifndef __DT_BINDINGS_CLOCK_SIFIVE_FU540_PRCI_H
+#define __DT_BINDINGS_CLOCK_SIFIVE_FU540_PRCI_H
+
+/* Clock indexes for use by Device Tree data and the PRCI driver */
+
+#define PRCI_CLK_COREPLL	       0
+#define PRCI_CLK_DDRPLL		       1
+#define PRCI_CLK_GEMGXLPLL	       2
+#define PRCI_CLK_TLCLK		       3
+
+#endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
