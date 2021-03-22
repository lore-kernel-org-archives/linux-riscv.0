Return-Path: <SRS0=7uwl=IU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F201C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:27:02 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0EE7E6197F
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Mar 2021 14:27:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0EE7E6197F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Iu57LSQxtnzOo9ptDaOO5r4lkAP/mIY2gDwRmoxzn5Y=; b=lpVctlC9dRSjdERdw6poPinfnS
	CN5ECSAHVwMByTDvE1Z9tooId3DiwRWH2SVRgZNkAhg4X6h/FcpvwHCgmKkJpLfrejs4hHcfWsAPJ
	5J6JtxjvoRQuTT4X4J5Vg4AEUMHZ6aDisNIeZ9DcnV4EXshnicjSHL2WmNci6euLUGdCfAPK6ArTv
	cPclS+0F9UhZZxhoeRJKF0D7EE+zPQo+5gT3eTADZLJknBfUC2E25yrdfr1PnCI2JH5SngNL6KiGB
	dVt0o2uZ8ZLTj8YwEIjD7ioFPjN0MqRMs2c3p09iA4GPo30epzQoIPiqrH1yKzneFwyYmHLbnd52B
	ZPCXZSqg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lOLW3-00BnSe-WD; Mon, 22 Mar 2021 14:26:48 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lOLVt-00BnQS-Eh
 for linux-riscv@lists.infradead.org; Mon, 22 Mar 2021 14:26:41 +0000
Received: by mail-pj1-x102a.google.com with SMTP id
 il9-20020a17090b1649b0290114bcb0d6c2so3341503pjb.0
 for <linux-riscv@lists.infradead.org>; Mon, 22 Mar 2021 07:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=O2TyvytUGkfZ5owV0wU3lxuyoAmZgpgt0eUuwnxCmZE=;
 b=Xu7rUBHnWjLEfu/FcaXvrEN7BWxMMELItmtFg76xw2Em2CIXDGOkLwgiWnz1WpgHFL
 rhbIlVe/eFEM5pw4LKDCPfUeyZwMLNIuyxJLHC4dAb7V+ahsujl5YacZSBSN85Oqn2ww
 IzQguxakIOF04IsFPfljAiEywRwJGwzMHmGdgxHAY45JN6CVceFXNUwI1GIsdy1RC3p8
 Kdxny/PL5vhgg1Ni1rqI2rEo5k3Vxa5m2HaS3h+mICDex2uaMhmrBAGyI0sJV2a+TIPu
 rihxKGuF9tUi1XKHuD4a2Bzjs16q68hUoLDqeQSNjIDmpkqguk+291HpSvuB98lZMSpY
 DXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=O2TyvytUGkfZ5owV0wU3lxuyoAmZgpgt0eUuwnxCmZE=;
 b=aSaAXu4DhNgYHQZRtFrnWJyhLOH2S5S/eIvB+rAs6RhTKe1gYCKyxsTSBEEn4Wp350
 XmBz/6d38PQSkQMPGyLVzIyXXWgULcyOOzNb/qy3cGv3AXU4MkimqB0OF3edn89zGjda
 MB6BcF4+sD2YYNHgKyHSucQRSHTdG8LRSNLuYI/J32rxoSZnTuAZL0AjOCL48R0NKWSt
 VfEOgXP4S2ucbgC3vE1v7plzMnemv6neJjjaVN8FWy5tbnDNNVJHJkRuLRT83zSDaFGX
 rXfzFs46sM6NKLT0qASKBi6fgF+Vp3nf9MFDTcUlHBhXKrIIVzODh3hj5tmjPbopR7l5
 4zBA==
X-Gm-Message-State: AOAM531NYtNPXoIFiXUnFVOb47Ze8o4cMQ/z0i4DxLGVa+Uaaf6NM44X
 jPylEytHcwnGs4qbgh+A9o4Km6dLYINiMYKb
X-Google-Smtp-Source: ABdhPJy9+RjrQDSkSSi/GHm3eScLfTrJpBQhmxvwa3LRWYjptRMkDdWS2DFDj6KTbNmmrR+K5TEr1g==
X-Received: by 2002:a17:90a:d907:: with SMTP id
 c7mr13336863pjv.45.1616423195629; 
 Mon, 22 Mar 2021 07:26:35 -0700 (PDT)
Received: from localhost.localdomain (61-230-29-29.dynamic-ip.hinet.net.
 [61.230.29.29])
 by smtp.gmail.com with ESMTPSA id v18sm14261971pfn.117.2021.03.22.07.26.33
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 22 Mar 2021 07:26:35 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, ruinland@andestech.com,
 david.abdurachmanov@sifive.com, Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v3 3/5] riscv: sifive: Add SiFive alternative ports
Date: Mon, 22 Mar 2021 22:26:04 +0800
Message-Id: <1616423166-13857-4-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
References: <1616423166-13857-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210322_142637_641243_1A9874BE 
X-CRM114-Status: GOOD (  22.78  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add required ports of the Alternative scheme for SiFive.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/Kconfig.erratas           | 10 ++++++
 arch/riscv/Kconfig.socs              |  1 +
 arch/riscv/errata/Makefile           |  1 +
 arch/riscv/errata/alternative.c      |  5 +++
 arch/riscv/errata/sifive/Makefile    |  1 +
 arch/riscv/errata/sifive/errata.c    | 68 ++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h |  3 ++
 7 files changed, 89 insertions(+)
 create mode 100644 arch/riscv/errata/sifive/Makefile
 create mode 100644 arch/riscv/errata/sifive/errata.c

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 4d0bafc536df..302e7467f302 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -9,4 +9,14 @@ config RISCV_ERRATA_ALTERNATIVE
 	  code patching is performed once in the boot stages. It means
 	  that the overhead from this mechanism is just taken once.
 
+config ERRATA_SIFIVE
+	bool "SiFive errata"
+	depends on RISCV_ERRATA_ALTERNATIVE
+	help
+	  All SiFive errata Kconfig depend on this Kconfig. Disabling
+	  this Kconfig will disable all SiFive errata. Please say "Y"
+	  here if your platform uses SiFive CPU cores.
+
+	  Otherwise, please say "N" here to avoid unnecessary overhead.
+
 endmenu
diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 7efcece8896c..b9eda857fc87 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -7,6 +7,7 @@ config SOC_SIFIVE
 	select CLK_SIFIVE
 	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
+	select ERRATA_SIFIVE
 	help
 	  This enables support for SiFive SoC platform hardware.
 
diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index 43e6d5424367..b8f8740a3e44 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -1 +1,2 @@
 obj-y	+= alternative.o
+obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
diff --git a/arch/riscv/errata/alternative.c b/arch/riscv/errata/alternative.c
index 8efa60ad69b7..3b15885db70b 100644
--- a/arch/riscv/errata/alternative.c
+++ b/arch/riscv/errata/alternative.c
@@ -42,6 +42,11 @@ static void __init init_alternative(void)
 	riscv_fill_cpu_mfr_info();
 
 	switch (cpu_mfr_info.vendor_id) {
+#ifdef CONFIG_ERRATA_SIFIVE
+	case SIFIVE_VENDOR_ID:
+		vendor_patch_func = sifive_errata_patch_func;
+		break;
+#endif
 	default:
 		vendor_patch_func = NULL;
 	}
diff --git a/arch/riscv/errata/sifive/Makefile b/arch/riscv/errata/sifive/Makefile
new file mode 100644
index 000000000000..2d644e19caef
--- /dev/null
+++ b/arch/riscv/errata/sifive/Makefile
@@ -0,0 +1 @@
+obj-y += errata.o
diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
new file mode 100644
index 000000000000..826cd391fc55
--- /dev/null
+++ b/arch/riscv/errata/sifive/errata.c
@@ -0,0 +1,68 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2021 Sifive.
+ */
+
+#include <linux/kernel.h>
+#include <linux/string.h>
+#include <linux/bug.h>
+#include <asm/patch.h>
+#include <asm/alternative.h>
+#include <asm/vendorid_list.h>
+#include <asm/errata_list.h>
+
+struct errata_info_t {
+	char name[ERRATA_STRING_LENGTH_MAX];
+	bool (*check_func)(unsigned long  arch_id, unsigned long impid);
+};
+
+static u32 __init sifive_errata_probe(unsigned long archid, unsigned long impid)
+{
+	int idx;
+	u32 cpu_req_errata = 0;
+
+	for (idx = 0; idx < ERRATA_SIFIVE_NUMBER; idx++)
+		if (errata_list[idx].check_func(archid, impid))
+			cpu_req_errata |= (1U << idx);
+
+	return cpu_req_errata;
+}
+
+static void __init warn_miss_errata(u32 miss_errata)
+{
+	int i;
+
+	pr_warn("----------------------------------------------------------------\n");
+	pr_warn("WARNING: Missing the following errata may cause potential issues\n");
+	for (i = 0; i < ERRATA_SIFIVE_NUMBER; i++)
+		if (miss_errata & 0x1 << i)
+			pr_warn("\tSiFive Errata[%d]:%s\n", i, errata_list[i].name);
+	pr_warn("Please enable the corresponding Kconfig to apply them\n");
+	pr_warn("----------------------------------------------------------------\n");
+}
+
+void __init sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+				     unsigned long archid, unsigned long impid)
+{
+	struct alt_entry *alt;
+	u32 cpu_req_errata = sifive_errata_probe(archid, impid);
+	u32 cpu_apply_errata = 0;
+	u32 tmp;
+
+	for (alt = begin; alt < end; alt++) {
+		if (alt->vendor_id != SIFIVE_VENDOR_ID)
+			continue;
+		if (alt->errata_id >= ERRATA_SIFIVE_NUMBER) {
+			WARN(1, "This errata id:%d is not in kernel errata list", alt->errata_id);
+			continue;
+		}
+
+		tmp = (1U << alt->errata_id);
+		if (cpu_req_errata & tmp) {
+			patch_text_nosync(alt->old_ptr, alt->alt_ptr, alt->alt_len);
+			cpu_apply_errata |= tmp;
+		}
+	}
+	if (cpu_apply_errata != cpu_req_errata)
+		warn_miss_errata(cpu_req_errata - cpu_apply_errata);
+}
diff --git a/arch/riscv/include/asm/alternative.h b/arch/riscv/include/asm/alternative.h
index 430bc4fea133..e625d3cafbed 100644
--- a/arch/riscv/include/asm/alternative.h
+++ b/arch/riscv/include/asm/alternative.h
@@ -32,5 +32,8 @@ struct errata_checkfunc_id {
 	bool (*func)(struct alt_entry *alt);
 };
 
+void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
+			      unsigned long archid, unsigned long impid);
+
 #endif
 #endif
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
