Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9378EC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YR+dJjHcWHzGZdbUoGl26sUUl7tNRBDTU286lHtXpw8=; b=iNN3rvRgNoGsmn
	eJ17z4qa3qYbve6chjOPBVTsJou4dtT0Jh4XFlALuZ233l4d9mxeGXRkXB0vQNeCUuM3zYAQgiBy1
	mJWbFk6Oj+Fw3lZ5qksj2DcYv3KfWWd6rwPyI03nUyqioEAMdYKlweyLFKe4SSkhCg5OemZR649lW
	nU0FA0NTgrmIg8FdVehld/2zq8eQP5mTP8rrpVPXrtT82U/Pw+C0Wn9r5aNH/Br8TgS9ZQ09jiXRH
	n/8g6OOcfFbCAZbsaQ37DA94ByE7JNgcfMaPiDQXWMabMSRDCSj89X+0dSJawkRlDK4pEAtg2k6Ot
	UxSBRUHo0/5bPhOIPusA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsGo-00AgZW-4j; Fri, 20 Jan 2023 14:21:30 +0000
Received: from smtpout140.security-mail.net ([85.31.212.146] helo=fx601.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsGC-00AgDw-QH
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:21:02 +0000
Received: from localhost (fx601.security-mail.net [127.0.0.1])
	by fx601.security-mail.net (Postfix) with ESMTP id D97FE3499F0
	for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 15:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674224449;
	bh=uLDFRw6cSNd19jXGz4oGQWViTW/dUbPJSdY2fapvJJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HYRrF89bpJIA8LHe8UcZGQ5IgsAAnoeZqeYTN4R1qYWnxVEkAyiO3rTlsPBeoQOjg
	 y5qNawIHJRdEY1iXbMyXtcLt7MfGGJDT9C8JZ66WKFLT941j9qz2caqZtQRxQhgciq
	 6gLGzoRD8CxZ/KAqn5Z3QHd74KARjejYLGeJag+Y=
Received: from fx601 (fx601.security-mail.net [127.0.0.1]) by
 fx601.security-mail.net (Postfix) with ESMTP id 7DFB93499B4; Fri, 20 Jan
 2023 15:20:49 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx601.security-mail.net (Postfix) with ESMTPS id 9F73734977C; Fri, 20 Jan
 2023 15:20:44 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 0C96627E0470; Fri, 20 Jan 2023
 15:10:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id DD9FA27E0463; Fri, 20 Jan 2023 15:10:38 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 DfM_HxOnd9Td; Fri, 20 Jan 2023 15:10:38 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id 5595327E0470; Fri, 20 Jan 2023
 15:10:38 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <57d5.63caa33c.983e9.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu DD9FA27E0463
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674223838;
 bh=Ulssifik/xqyxmseDcDCHWF7GqQfVZORENj6s4m7VYQ=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=c8htp1BmJN/ZqK2lC0okl9ZdmRBJrjLE0Xevwykd2j/+m7QLb63Zikx4OnmEIuo/W
 Di1UTV3iLdZyWQAIqMw8TerInA0DmSfQOa9dBTr2kbyPxrpdc6nurhUYWTcgOQZdlP
 MXGfL9njI9tpJ5KB86FGEG7jmsXmQo3UTpfRPdc0=
From: Yann Sionneau <ysionneau@kalray.eu>
To: Arnd Bergmann <arnd@arndb.de>, Jonathan Corbet <corbet@lwn.net>, Thomas
 Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Will Deacon <will@kernel.org>, Peter
 Zijlstra <peterz@infradead.org>, Boqun Feng <boqun.feng@gmail.com>, Mark
 Rutland <mark.rutland@arm.com>, Eric Biederman <ebiederm@xmission.com>, Kees
 Cook <keescook@chromium.org>, Oleg Nesterov <oleg@redhat.com>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, "Aneesh Kumar K.V"
 <aneesh.kumar@linux.ibm.com>, Andrew Morton <akpm@linux-foundation.org>,
 Nick Piggin <npiggin@gmail.com>, Paul Moore <paul@paul-moore.com>, Eric
 Paris <eparis@redhat.com>, Christian Brauner <brauner@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Jules Maselbas <jmaselbas@kalray.eu>,
 Yann Sionneau <ysionneau@kalray.eu>, Guillaume Thouvenin
 <gthouvenin@kalray.eu>, Clement Leger <clement@clement-leger.fr>, Vincent
 Chardon <vincent.chardon@elsys-design.com>, Marc =?utf-8?b?UG91bGhpw6hz?=
 <dkm@kataplop.net>, Julian Vetter <jvetter@kalray.eu>, Samuel Jones
 <sjones@kalray.eu>, Ashley Lesdalons <alesdalons@kalray.eu>, Thomas Costis
 <tcostis@kalray.eu>, Marius Gligor <mgligor@kalray.eu>, Jonathan Borne
 <jborne@kalray.eu>, Julien Villette <jvillette@kalray.eu>, Luc Michel
 <lmichel@kalray.eu>, Louis Morhet <lmorhet@kalray.eu>, Julien Hascoet
 <jhascoet@kalray.eu>, Jean-Christophe Pince <jcpince@gmail.com>, Guillaume
 Missonnier <gmissonnier@kalray.eu>, Alex Michon <amichon@kalray.eu>, Huacai
 Chen <chenhuacai@kernel.org>, WANG Xuerui <git@xen0n.name>, Shaokun Zhang
 <zhangshaokun@hisilicon.com>, John Garry <john.garry@huawei.com>, Guangbin
 Huang <huangguangbin2@huawei.com>, Bharat Bhushan <bbhushan2@marvell.com>,
 Bibo Mao <maobibo@loongson.cn>, Atish Patra <atishp@atishpatra.org>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Qi Liu <liuqi115@huawei.com>, Jiaxun Yang
 <jiaxun.yang@flygoat.com>, Catalin Marinas <catalin.marinas@arm.com>, Mark
 Brown <broonie@kernel.org>, Janosch Frank <frankja@linux.ibm.com>, Alexey
 Dobriyan <adobriyan@gmail.com>
Cc: Benjamin Mugnier <mugnier.benjamin@gmail.com>,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mm@kvack.org, linux-arch@vger.kernel.org,
 linux-audit@redhat.com, linux-riscv@lists.infradead.org, bpf@vger.kernel.org
Subject: [RFC PATCH v2 30/31] kvx: Add power controller driver
Date: Fri, 20 Jan 2023 15:10:01 +0100
Message-ID: <20230120141002.2442-31-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_062053_246250_E4B65246 
X-CRM114-Status: GOOD (  18.57  )
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

From: Jules Maselbas <jmaselbas@kalray.eu>

The Power Controller (pwr-ctrl) control cores reset and wake-up
procedure.

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Louis Morhet <lmorhet@kalray.eu>
Signed-off-by: Louis Morhet <lmorhet@kalray.eu>
Co-developed-by: Marius Gligor <mgligor@kalray.eu>
Signed-off-by: Marius Gligor <mgligor@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: new patch

 arch/kvx/include/asm/pwr_ctrl.h | 45 ++++++++++++++++
 arch/kvx/platform/Makefile      |  6 +++
 arch/kvx/platform/pwr_ctrl.c    | 91 +++++++++++++++++++++++++++++++++
 3 files changed, 142 insertions(+)
 create mode 100644 arch/kvx/include/asm/pwr_ctrl.h
 create mode 100644 arch/kvx/platform/Makefile
 create mode 100644 arch/kvx/platform/pwr_ctrl.c

diff --git a/arch/kvx/include/asm/pwr_ctrl.h b/arch/kvx/include/asm/pwr_ctrl.h
new file mode 100644
index 000000000000..25f403ba935a
--- /dev/null
+++ b/arch/kvx/include/asm/pwr_ctrl.h
@@ -0,0 +1,45 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Marius Gligor
+ */
+
+#ifndef _ASM_KVX_PWR_CTRL_H
+#define _ASM_KVX_PWR_CTRL_H
+
+#ifndef __ASSEMBLY__
+
+int kvx_pwr_ctrl_probe(void);
+
+void kvx_pwr_ctrl_cpu_poweron(unsigned int cpu);
+
+#endif
+
+/* Power controller vector register definitions */
+#define KVX_PWR_CTRL_VEC_OFFSET 0x1000
+#define KVX_PWR_CTRL_VEC_WUP_SET_OFFSET     0x10
+#define KVX_PWR_CTRL_VEC_WUP_CLEAR_OFFSET     0x20
+
+/* Power controller PE reset PC register definitions */
+#define KVX_PWR_CTRL_RESET_PC_OFFSET               0x2000
+
+/* Power controller global register definitions */
+#define KVX_PWR_CTRL_GLOBAL_OFFSET 0x4040
+
+#define KVX_PWR_CTRL_GLOBAL_SET_OFFSET     0x10
+#define KVX_PWR_CTRL_GLOBAL_SET_PE_EN_SHIFT           0x1
+
+#define PWR_CTRL_WUP_SET_OFFSET  \
+		(KVX_PWR_CTRL_VEC_OFFSET + \
+		 KVX_PWR_CTRL_VEC_WUP_SET_OFFSET)
+
+#define PWR_CTRL_WUP_CLEAR_OFFSET  \
+		(KVX_PWR_CTRL_VEC_OFFSET + \
+		 KVX_PWR_CTRL_VEC_WUP_CLEAR_OFFSET)
+
+#define PWR_CTRL_GLOBAL_CONFIG_OFFSET \
+		(KVX_PWR_CTRL_GLOBAL_OFFSET + \
+		 KVX_PWR_CTRL_GLOBAL_SET_OFFSET)
+
+#endif /* _ASM_KVX_PWR_CTRL_H */
diff --git a/arch/kvx/platform/Makefile b/arch/kvx/platform/Makefile
new file mode 100644
index 000000000000..c7d0abb15c27
--- /dev/null
+++ b/arch/kvx/platform/Makefile
@@ -0,0 +1,6 @@
+# SPDX-License-Identifier: GPL-2.0-only
+#
+# Copyright (C) 2018-2023 Kalray Inc.
+#
+
+obj-$(CONFIG_SMP) += pwr_ctrl.o
diff --git a/arch/kvx/platform/pwr_ctrl.c b/arch/kvx/platform/pwr_ctrl.c
new file mode 100644
index 000000000000..ee35d04845ae
--- /dev/null
+++ b/arch/kvx/platform/pwr_ctrl.c
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+#include <asm/pwr_ctrl.h>
+#include <asm/symbols.h>
+
+struct kvx_pwr_ctrl {
+	void __iomem *regs;
+};
+
+static struct kvx_pwr_ctrl kvx_pwr_controller;
+
+/**
+ * kvx_pwr_ctrl_cpu_poweron() - Wakeup a cpu
+ * @cpu: cpu to wakeup
+ */
+void kvx_pwr_ctrl_cpu_poweron(unsigned int cpu)
+{
+	/* Set PE boot address */
+	writeq((unsigned long long)kvx_start,
+			kvx_pwr_controller.regs + KVX_PWR_CTRL_RESET_PC_OFFSET);
+	/* Wake up processor ! */
+	writeq(1ULL << cpu,
+	       kvx_pwr_controller.regs + PWR_CTRL_WUP_SET_OFFSET);
+	/* Then clear wakeup to allow processor to sleep */
+	writeq(1ULL << cpu,
+	       kvx_pwr_controller.regs + PWR_CTRL_WUP_CLEAR_OFFSET);
+}
+
+static struct device_node * __init get_pwr_ctrl_node(void)
+{
+	const phandle *ph;
+	struct device_node *cpu;
+	struct device_node *node;
+
+	cpu = of_get_cpu_node(raw_smp_processor_id(), NULL);
+	if (!cpu) {
+		pr_err("Failed to get CPU node\n");
+		return NULL;
+	}
+
+	ph = of_get_property(cpu, "power-controller", NULL);
+	if (!ph) {
+		pr_err("Failed to get power-controller phandle\n");
+		return NULL;
+	}
+
+	node = of_find_node_by_phandle(be32_to_cpup(ph));
+	if (!node) {
+		pr_err("Failed to get power-controller node\n");
+		return NULL;
+	}
+
+	return node;
+}
+
+int __init kvx_pwr_ctrl_probe(void)
+{
+	struct device_node *ctrl;
+
+	ctrl = get_pwr_ctrl_node();
+	if (!ctrl) {
+		pr_err("Failed to get power controller node\n");
+		return -EINVAL;
+	}
+
+	if (!of_device_is_compatible(ctrl, "kalray,kvx-pwr-ctrl")) {
+		pr_err("Failed to get power controller node\n");
+		return -EINVAL;
+	}
+
+	kvx_pwr_controller.regs = of_iomap(ctrl, 0);
+	if (!kvx_pwr_controller.regs) {
+		pr_err("Failed ioremap\n");
+		return -EINVAL;
+	}
+
+	return 0;
+}
-- 
2.37.2






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
