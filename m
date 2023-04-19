Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E93A2C77B7E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EoReWqXVt3ANF1SkGSArjDmeztpWm2ZDO2X0te1vQDE=; b=Gnp/bQAg9yaNWQ
	+FLL3aXX0Yb1iiB9r53T3LFjsZxkuwb+EO4VWPSdJvlqLorT8VDCJHGTKCMO3fkG8Ucs+EWjKQsWY
	0VVMoxFMQexhPmaiySHa5eT4pDzqjb3L/zvvxmUc3AiQYnwxRwVk6qWlkHSIBcgLcqSUQ6S5FY6Is
	MZVpgzPbWrBsbHn/hXs7xy0LbAl1ixsZCPy+dQ9X0QyQGc6+8dIfjrfsrdjLCdNNbU/pPIAVvQOG3
	FyEDiF/3/AUyAvDHDAGEu1DzNU1tkUCb9FsJiW1vcGLBpuA/0ZrF+tU46pCchVcVycH1eJIZ84ZCV
	02jjB9WL0HEXSW10tcNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pp6ik-005JBq-2F;
	Wed, 19 Apr 2023 12:15:34 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pp5hj-0058B9-1F
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 11:10:29 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1a6f0d8cdfeso15173715ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 04:10:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1681902623; x=1684494623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Eblfm/T6iTpx+B5jQxcafLiaSwdeB6MwJNMx1053fIM=;
        b=DeZfx01ZX7Sehx3CCekOj5Wmh5/0E6L27Vt1u0RCG6Af7W4Ww6d99E98VCdUMc5ILQ
         ppeTAQ4ynNy3TiNv6XuWSxIGB7HqcDqzwIX1tzEXE/xJHgae/7yiQ786zEhoR6k3gOvX
         L8RXwIuD/Bcpb+fx+/tEgYMPtOMn/5RGiZHZQSsVTwbwnESwjJZgQKjJgS+CYdiWmv/X
         sTlTz+tcJxIHBX9j344JEvQHen6NftYor8JECB66GT3RicUQttnGHRgNi5k9OBP15w4r
         +bm2YkMfwA9+FPgWxfcfMf6baW+J4rq9LuYDUDbRWAWXCt8WxTxt6hmZHGKv+vMZxzEt
         z6Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681902623; x=1684494623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Eblfm/T6iTpx+B5jQxcafLiaSwdeB6MwJNMx1053fIM=;
        b=IOEmc/202miHbb2P96d56qZUolDnu8e1k6KebmFw7m40aXZdQEG2ZiV1Y5334LkkNE
         pn0y6nhD36DSYMHpvOg7uiTRPddgRMSq6eZBEQgnEz30eLUC2crm7cDtZ4L8TpZNWUKl
         d5HVLjhrkxudNZXRcSYpR0J8bFhmQrvQia2qTNH6GAza+AAfizfv0PFKXCQlfb/I5cvG
         D+EaCtfg4fuX+T5qnpvVyFa35Vw0e+JW6lxWp4KOogiNw8+IH3YCSH79daJROLHCDOGC
         RRR5Wh6gxd+zekq8Dn3rEqxu3U96lU5WwAukG8VysEXWPrwVnB8Pf8tiEmC1bs8WnrXd
         Oy2Q==
X-Gm-Message-State: AAQBX9f6OAC0LvbJIQZXozBkQma9xWrl7hMwN5h2xvcKLrtpaTdPODrd
	6Kys+BNlWccjmGhR71jVq6f45aPUhTXH5Z8PEUg=
X-Google-Smtp-Source: AKy350bJa8ymH8vz3WwMTgd0nDwI9tA5BpeE2IV7rV3XHn6aSE8c09ru5XOxb+Nqph2c5N8uPATfhA==
X-Received: by 2002:a17:902:ab81:b0:1a6:4e7b:7037 with SMTP id f1-20020a170902ab8100b001a64e7b7037mr4418984plr.69.1681902623318;
        Wed, 19 Apr 2023 04:10:23 -0700 (PDT)
Received: from x1.hsd1.or.comcast.net ([2601:1c2:1800:f680:eaf2:1d7a:7338:16cb])
        by smtp.gmail.com with ESMTPSA id g12-20020a1709026b4c00b001a24cded097sm11180774plt.236.2023.04.19.04.10.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 04:10:22 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Ved Shanbhogue <ved@rivosinc.com>,
	=?UTF-8?q?Kornel=20Dul=C4=99ba?= <mindal@semihalf.com>,
	Adrien Ricciardi <aricciardi@baylibre.com>,
	Nicolas Pitre <npitre@baylibre.com>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Babu Moger <babu.moger@amd.com>,
	Peter Newman <peternewman@google.com>,
	x86@kernel.org,
	Rob Herring <robh+dt@kernel.org>,
	James Morse <james.morse@arm.com>
Cc: Drew Fustini <dfustini@baylibre.com>
Subject: [RFC PATCH 09/21] RISC-V: QoS: add late_initcall to setup resctrl interface
Date: Wed, 19 Apr 2023 04:10:59 -0700
Message-Id: <20230419111111.477118-10-dfustini@baylibre.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230419111111.477118-1-dfustini@baylibre.com>
References: <20230419111111.477118-1-dfustini@baylibre.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_041027_442974_25EC6BC4 
X-CRM114-Status: GOOD (  12.56  )
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

Add late_initcall which checks if the Ssqosid extension is present, and
if so, calls resctrl setup and sets cpu hotplug state to "qos:online".

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/kernel/qos/qos.c | 31 +++++++++++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 arch/riscv/kernel/qos/qos.c

diff --git a/arch/riscv/kernel/qos/qos.c b/arch/riscv/kernel/qos/qos.c
new file mode 100644
index 000000000000..0b5fde06cbe1
--- /dev/null
+++ b/arch/riscv/kernel/qos/qos.c
@@ -0,0 +1,31 @@
+// SPDX-License-Identifier: GPL-2.0-only
+// Copyright (C) 2023 Rivos Inc.
+
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/riscv_qos.h>
+
+#include <asm/csr.h>
+#include <asm/qos.h>
+
+#include "internal.h"
+
+static int __init qos_arch_late_init(void)
+{
+	int err;
+
+	if (!riscv_isa_extension_available(NULL, SSQOSID))
+		return -ENODEV;
+
+	err = qos_resctrl_setup();
+	if (err != 0)
+		return err;
+
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "qos:online", qos_resctrl_online_cpu,
+			  qos_resctrl_offline_cpu);
+
+	return err;
+}
+late_initcall(qos_arch_late_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
