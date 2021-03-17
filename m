Return-Path: <SRS0=Ejrw=IP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6451C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:34:36 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4830464F41
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Mar 2021 09:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4830464F41
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CqKbHaSh0G987NDevWShGrubq0YngJgfep5jAss3XFI=; b=eUY+2CbWwkJaEM/msLIieZbVKw
	xxGD0K97NvFkJkegCemgqodn863Pwt38pGSdqQTfXlSvLRVc6Eta369wdM47TGRmFKIE1aSbujju2
	HzFKzib7psSf6tQbmEqMAVkYvSn/D7EnKtfhJtIpFCmmw02JaH0b5rb+c2qfN4yZUk5zznoio0e/D
	EZnD9b8xvGiAep3EMrbVRbgi6GmXYR7DQi4oSEY80QAb9K7GWt4XKh2lMiBv8NFzo4CXgx8PSfp7D
	QilfVLJmhV0au1ZuxeszPz98Xgsh0IGa9ujfsGjmNaQEc4Y3rn0iVOkI9q0j2d0k52GAmvSBUpc/R
	6AAnnyKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMSZ8-002rPB-Le; Wed, 17 Mar 2021 09:34:10 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMSZ1-002rN8-Ma
 for linux-riscv@lists.infradead.org; Wed, 17 Mar 2021 09:34:05 +0000
Received: by mail-pg1-x530.google.com with SMTP id o10so24446620pgg.4
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 02:34:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZUoRwL3RY4ramWKRBI0zPMZvLYC46D0bwhtfc/bRWek=;
 b=D0GS31mfXSE3cAi/r6JKgIupdLhBEpW99QnWzDo+dyfRHmNAzWRbSqzPnWLu6vqPea
 4brT+JKRKIwwUEdqxCW0++TwNgp9Cjvi4xxIXmSIaxU43n7yjgVcKnlygg8o1mkKmm2v
 Lky7uqTxabKxSdttVQlF0sgyLG6BKVGu6hNEo6Tii7m34vIVZHAZea5rLGQ2JSz9zcuv
 XTjkZm1tqKy//MQrGxmmpc99/nwL9nxj44tqWZErn27verg6MBZ1Nhh+hNAPCIpiNjXs
 +N1Va8wXKwbgkQV19PWJRDE+8rVl0gNBTruHGbr63qEvyjLAEeLQORyIHxZNMsaWW6Ec
 fUpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZUoRwL3RY4ramWKRBI0zPMZvLYC46D0bwhtfc/bRWek=;
 b=rFiQrBTe7hLDmwzvpvan53b++qMPUyQ98KECi7Re+NJcIa/TXbeFmxPLd1rUmreWkd
 L57eYBNQz/EUxjcD4GTkaWvgnWrEw0UXzeYEieWDjuIhn5k2fIZzBI/xcvB6gSBKzF8B
 7vVx5MatqalaUs/7Mqkc//8PONch6UdDvjINfwMO5yWbmEAiUC/ngA/UiBM4e7N8z1Jt
 PaSZXVixNDrw3fca5ot+sGeBwISBYQpdsUrhQy3peK+HhZpYzWj8W4F/+28JmyTU8zi0
 Dev1HCub1I8V2KKx30yokFkBnB+78GvNXUFsV9ktl9ic4EOdg1A5HfxGyd3og8RW77pd
 ih5g==
X-Gm-Message-State: AOAM533JShbvaWuO5gLD8bvyJZzz+cNEjxdYFXgpxt9Oz3h7MKuEIs5J
 J/0rXPggGiAqBneWbQ8iFD9DurV2cQosMfGt
X-Google-Smtp-Source: ABdhPJwxX3OnihwF8F/jUBn8J5QKvwuduq14/YGUhrGXt78H19/pM9FmhcLIjMkyMsqZljn49IiCHQ==
X-Received: by 2002:a63:f209:: with SMTP id v9mr1878727pgh.97.1615973642049;
 Wed, 17 Mar 2021 02:34:02 -0700 (PDT)
Received: from VincentChen-ThinkPad-T480s.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id i14sm2149508pjh.17.2021.03.17.02.34.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 17 Mar 2021 02:34:01 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Frank.Zhao@starfivetech.com, anup.patel@wdc.com, atish.patra@wdc.com,
 guoren@kernel.org, alankao@andestech.com, paul.walmsley@sifive.com,
 ruinland@andestech.com, david.abdurachmanov@sifive.com,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [PATCH v2 3/5] riscv: sifive: Add SiFive alternative ports
Date: Wed, 17 Mar 2021 17:33:31 +0800
Message-Id: <1615973613-22364-4-git-send-email-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
References: <1615973613-22364-1-git-send-email-vincent.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210317_093404_127132_ADD7776F 
X-CRM114-Status: GOOD (  21.70  )
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
---
 arch/riscv/Kconfig.erratas           | 11 ++++++
 arch/riscv/Kconfig.socs              |  1 +
 arch/riscv/errata/Makefile           |  1 +
 arch/riscv/errata/alternative.c      |  5 +++
 arch/riscv/errata/sifive/Makefile    |  1 +
 arch/riscv/errata/sifive/errata.c    | 68 ++++++++++++++++++++++++++++++++++++
 arch/riscv/include/asm/alternative.h |  3 ++
 7 files changed, 90 insertions(+)
 create mode 100644 arch/riscv/errata/sifive/Makefile
 create mode 100644 arch/riscv/errata/sifive/errata.c

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index 4d0bafc536df..e50ab67f4830 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -9,4 +9,15 @@ config RISCV_ERRATA_ALTERNATIVE
 	  code patching is performed once in the boot stages. It means
 	  that the overhead from this mechanism is just taken once.
 
+config ERRATA_SIFIVE
+	bool "SiFive errata"
+	depends on RISCV_ERRATA_ALTERNATIVE
+	default y
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
