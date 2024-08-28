Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56A58C5474A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+4dhJWMoarmU0mgaid7/cqAnYKv9OaI/l0O2S2Xt+jA=; b=QHN3weSvhd+rUW
	lQaQY4Q1MnK5NiK48eCHhE2RHja7EkmQVjRi9urZO8qvzD1sG1fq9cqxCpBjSKU6LrKrd/Ox5cCSj
	Dvwgi3Qtz5BcQO2G8ugjlKf0usaqbbrPnis0sGznVA37PWpaN7q1OIZa+0Ctmw764YcQop1uXkxpC
	+ihlRD9NjumcFI6xOIDLaDRhfgu97P+3D1WRFdHJvadbmIPQrM6SM90+VZswegYKxA9TnZI8JS+9C
	8ZKUDAViCRo6701k5B2di9d+fGEG2JqVPRkUQ/kvbn5A6o1EDDKg+dTYBd9pQ9kd0sexOeOZpOS55
	2Nadu5lXZjYS6dHtQTYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDbi-0000000EROG-1j00;
	Wed, 28 Aug 2024 08:00:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCac-0000000EAAp-1m3S
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Aug 2024 06:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6ROqg56FyItnNUDdC6ELchQJJpYcKYxLCDK9KVx4Stg=; b=cs1lhpe4jfbx3DHR2FLHbXT3wF
	CaJlaHu3XiTy2qX6thZLvmUKwk/9KEhR7+rjva1plpQ/xGxttHMYcUQFUkxk1jvE7OiUlsUJnSSMD
	E231We9XOFkYGGGg5Z66oIkDAWoOWcs6w1n/Qg8NbhEcehxEE5S6QHK8DVz6DzwpOW6XRcG0ocKhw
	bbaAm3lmtbRGdDGExsS4jDndLWWIvimn6Nca0Tu64uHwfCeygAphq7lyocOqZvXK+qK+MvdcqJcTO
	hEEfKMFPATMT4SXspZBNRcmT1xL/5AFiSlk4bNjPzGf9Y40kj8WJqObuljhGk0xwAuDgq6W17huqG
	Evb0d87g==;
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCaT-0000000B4hN-37O6
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 06:55:30 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1fec34f94abso65984625ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 23:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724828122; x=1725432922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ROqg56FyItnNUDdC6ELchQJJpYcKYxLCDK9KVx4Stg=;
        b=lEHKdqAzZ1N1pxIJTdhnPlNnThlkaud3/BGB+Vuh2tstCYkP+zgPzWvi3eWnSx/wZm
         2Em7fIVFDfud2m4aPZC7oyKLhOzaQB17eoVBPPb2X9EOV+ua4LuiZuUO3bWNjhe9ojTA
         xT10u4o4T4M2Vrdj/ehBEKSG1raJEJHwohv6jV2hoAXMxnE/l0zn/gExXD6NsAE3tOH7
         8fJGWn/zAHOXG80xmS4qeup1X29d+MJ/pdWzYikJNbCcPd3gtUpMoC7cGAjYsSii3zQV
         Ghq8/U6jHZXfk8UlaDkxcDSCijPHyvJUkb6zMrLMwzk5eRrsE+Glz/mlaHMNF0GzFo2R
         wAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724828122; x=1725432922;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ROqg56FyItnNUDdC6ELchQJJpYcKYxLCDK9KVx4Stg=;
        b=lp4r+B+6PMb5onoFByp8TIz9CnO+2hoeVkWkbDEcCSXAlzjhpFsfHgaAB82vVQ+a1a
         a8YO+dU/XPgqdvbIam9jWKDyUKUSBPDRwyw3eIiuLa1mHAPEs8LIrlOAdRi0wofTWxBX
         AO7GVy6EsfbAvwgpGpLvuQjU/dvjHdvtE/he0ht6fi+K/dd9/plrjB8zVu6rewCYAtjk
         4GEFqqBowb4Y8SNkr5hSgG+oqqC+ofYAtcI1sCo0Bclyv1Sfg9gim0qeAsgwg1wupxMh
         lif3PO4E/G+U1keOf0xpAs0Yl1vuJWQF4ouVdyd8Ywkufqi/BRq1jNYlawdW+f24Nx23
         vvvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUpDOB2LieX0trwb65S1FRh6f4ZiAF9rEEQ/hHBZElq3bHIZ9l6kW635ERBmOmn4qlcUuJtF+nSNEUP3A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSlCUEy9PnbiZbUSXieapqHM4fu2BU3gJ3ZFXwXRwmg3pAygpR
	Op+onbw72FJFmzqrsGC6YNHiirqPw+rAOrxCH6n5jiv2NVDVQ0q0
X-Google-Smtp-Source: AGHT+IHyK9Bwbr9j/dan60lKEiq/HvBRavSYzYIR//sllCCG1mgrUDVgkeTETlOetRIPEotRmP5cOA==
X-Received: by 2002:a17:902:aa04:b0:202:4b99:fd27 with SMTP id d9443c01a7336-2039e4ef20amr113649585ad.51.1724828121819;
        Tue, 27 Aug 2024 23:55:21 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385607f94sm92816005ad.182.2024.08.27.23.55.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:55:21 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: zong.li@sifive.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Pragnesh.patel@sifive.com,
	aou@eecs.berkeley.edu,
	erik.danie@sifive.com,
	hes@sifive.com,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	palmerdabbelt@google.com,
	paul.walmsley@sifive.com,
	pragnesh.patel@openfive.com,
	sboyd@kernel.org,
	schwab@linux-m68k.org,
	yash.shah@sifive.com
Subject: [PATCH 1/3] dt-bindings: reset: sifive: add fu540/fu740 reset indexes
Date: Tue, 27 Aug 2024 23:55:18 -0700
Message-Id: <d4e3c23469fbddb6904b857e9d262d86aecbd880.1724827635.git.ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724827635.git.ganboing@gmail.com>
References: <cover.1724827635.git.ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_075528_439342_8F351E32 
X-CRM114-Status: GOOD (  11.60  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add bindings for FU540/FU740 clock/reset controller. The header is taken
from the same path in U-Boot with macros renamed to have FU540/740 prefix.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 include/dt-bindings/reset/sifive-fu540-prci.h | 19 +++++++++++++++++++
 include/dt-bindings/reset/sifive-fu740-prci.h | 19 +++++++++++++++++++
 2 files changed, 38 insertions(+)
 create mode 100644 include/dt-bindings/reset/sifive-fu540-prci.h
 create mode 100644 include/dt-bindings/reset/sifive-fu740-prci.h

diff --git a/include/dt-bindings/reset/sifive-fu540-prci.h b/include/dt-bindings/reset/sifive-fu540-prci.h
new file mode 100644
index 000000000000..dbaf602262d2
--- /dev/null
+++ b/include/dt-bindings/reset/sifive-fu540-prci.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2020 Sifive, Inc.
+ * Author: Sagar Kadam <sagar.kadam@sifive.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_SIFIVE_FU540_PRCI_H
+#define __DT_BINDINGS_RESET_SIFIVE_FU540_PRCI_H
+
+/* Reset indexes for use by device tree data and the PRCI driver */
+#define FU540_PRCI_RST_DDR_CTRL_N	0
+#define FU540_PRCI_RST_DDR_AXI_N	1
+#define FU540_PRCI_RST_DDR_AHB_N	2
+#define FU540_PRCI_RST_DDR_PHY_N	3
+/* bit 4 is reserved bit */
+#define FU540_PRCI_RST_RSVD_N		4
+#define FU540_PRCI_RST_GEMGXL_N		5
+
+#endif
diff --git a/include/dt-bindings/reset/sifive-fu740-prci.h b/include/dt-bindings/reset/sifive-fu740-prci.h
new file mode 100644
index 000000000000..74d60ca9f1df
--- /dev/null
+++ b/include/dt-bindings/reset/sifive-fu740-prci.h
@@ -0,0 +1,19 @@
+/* SPDX-License-Identifier: GPL-2.0 OR MIT */
+/*
+ * Copyright (C) 2020-2021 Sifive, Inc.
+ * Author: Pragnesh Patel <pragnesh.patel@sifive.com>
+ */
+
+#ifndef __DT_BINDINGS_RESET_SIFIVE_FU740_PRCI_H
+#define __DT_BINDINGS_RESET_SIFIVE_FU740_PRCI_H
+
+/* Reset indexes for use by device tree data and the PRCI driver */
+#define FU740_PRCI_RST_DDR_CTRL_N	0
+#define FU740_PRCI_RST_DDR_AXI_N	1
+#define FU740_PRCI_RST_DDR_AHB_N	2
+#define FU740_PRCI_RST_DDR_PHY_N	3
+#define FU740_PRCI_RST_PCIE_POWER_UP_N	4
+#define FU740_PRCI_RST_GEMGXL_N		5
+#define FU740_PRCI_RST_CLTX_N		6
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
