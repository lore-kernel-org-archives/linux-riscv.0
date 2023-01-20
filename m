Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB33AC25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 15:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TOzCsoM0ssDot/a8FWG87ADhuJb0G1WZnqENVsysTCM=; b=qGwQk0fQxeTzsa
	q7/+o4SlNFaIHvMGoiVTi5L9iL/dAJm/HRvzuCIIPdRigQzRiHAOJb/LOtrhjILrfV30HeAb4pWjb
	sXLPAyEg+TMfJLUyDQU5co7EX6MVVFOjgkXndyBt69xQBlEBSU2tVLL6XiKQkeRCFHwbs362noRBz
	1EsEHDKinP1bLtt1PRkw7+xbBak3IJuAXyzu0XI7ZayZLSX8qfICiY+FrD2Na8qk6ejEcn30EfD21
	r4aHZmzQ+5yVWIeme+mMmtDfSYLzRhPM6V9Yr5sbq4vXw2xEcSWpXrzE6KjTj8raJZ1xnLLaLA3wu
	ItrKuxK29nNueXxheTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsuQ-00AsTO-Hd; Fri, 20 Jan 2023 15:02:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsuO-00AsSI-Tb
	for linux-riscv@bombadil.infradead.org; Fri, 20 Jan 2023 15:02:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=0EBHk3/xNMOtQasDlWnuFRgNeFZWCG1JaZyYWiNiQ6M=; b=KQEriC0l6xFZCRY3w+LjRoNv7a
	mZ4vA80lD7g1InDc/fEG9TtcAfY7XblfqU+8BlJmbqSkO+AKsJ5ae+wv0UHzTjyf9csF5LAHNSpX0
	nL/2dWilIH+cYrcy4+dI7I0PE+NYY8OhR3AYf57vzymT80nomaNzB2/1+WpQDPq8XL1VkNC3eZ0/A
	EZJFynJ8MP11Q0RN1g8YzpEtQhUhvjeBfM8A2MFO0mCaHd4p86QXl2Bt0GqfmLcCV50xvRqq2+ex8
	vMFizxAdv6y7bmLyVeho92N5dMoQfXzd6tJFVLe5dY3XUHsvj8BEpgN7rjCj0TSc/h6CFdiNCNk0j
	Eg634i/Q==;
Received: from smtpout30.security-mail.net ([85.31.212.35] helo=fx305.security-mail.net)
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pIsFi-000eYe-2d
	for linux-riscv@lists.infradead.org;
	Fri, 20 Jan 2023 14:20:25 +0000
Received: from localhost (fx305.security-mail.net [127.0.0.1])
	by fx305.security-mail.net (Postfix) with ESMTP id A250030FD7F
	for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 15:20:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kalray.eu;
	s=sec-sig-email; t=1674224449;
	bh=EHbGeTQPzFxRydvAjCAKTJptA7pNhkmTqYf6aPqpaxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=PK435bNd4ChYGp7BNsvmnmLMkpy/hoVLU46r6JempL/VizlAvCwO/4bjr+dVwezuh
	 VpM/4GpAjHH2lJHR9PbwPyzQxp/vibRACiJNaEIJGYPF3ChSvlG0BXbnNCHitvAZjp
	 YiDypEBuV6zbkDc6eGfv/GuKB27oKMVUvgvAz3YM=
Received: from fx305 (fx305.security-mail.net [127.0.0.1]) by
 fx305.security-mail.net (Postfix) with ESMTP id 8577530F44F; Fri, 20 Jan
 2023 15:20:47 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx305.security-mail.net (Postfix) with ESMTPS id 3FD6B30FD91; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 8E73B27E0463; Fri, 20 Jan 2023
 15:10:39 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 7622127E0480; Fri, 20 Jan 2023 15:10:39 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 dO_MAUz2ZwpM; Fri, 20 Jan 2023 15:10:39 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id C9CA227E0474; Fri, 20 Jan 2023
 15:10:38 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <146d7.63caa33d.37d2d.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 7622127E0480
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674223839;
 bh=5C/8QjxVUf/DelpGCfD/Pp9BdUc2vZv56uJsfxSlXPA=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=P6BtAyPM/IrloLG30cdWTPBhk6bnzZeuu0JK6hHT1AvSOjTEjV23l2HTVSkWp3YOM
 JxhQxnIr6MpJR9Ve5OwsqaqYSpuYPPXnuoM+q+2xD3d01z+Z0ef6cKxQqGtJg6OcUa
 Z5LRxJhk4HSsThMlK536n8tiuxt0/9UzyH8L0fvI=
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
Subject: [RFC PATCH v2 31/31] kvx: Add IPI driver
Date: Fri, 20 Jan 2023 15:10:02 +0100
Message-ID: <20230120141002.2442-32-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_142023_293497_1126CEDA 
X-CRM114-Status: GOOD (  20.85  )
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

The Inter-Processor Interrupt Controller (IPI) provides a fast
synchronization mechanism to the software. It exposes eight independent
set of registers that can be use to notify each processor in the cluster.
test

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Co-developed-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Luc Michel <lmichel@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: new patch

 arch/kvx/include/asm/ipi.h |  16 ++++++
 arch/kvx/platform/Makefile |   1 +
 arch/kvx/platform/ipi.c    | 108 +++++++++++++++++++++++++++++++++++++
 3 files changed, 125 insertions(+)
 create mode 100644 arch/kvx/include/asm/ipi.h
 create mode 100644 arch/kvx/platform/ipi.c

diff --git a/arch/kvx/include/asm/ipi.h b/arch/kvx/include/asm/ipi.h
new file mode 100644
index 000000000000..137407a075e6
--- /dev/null
+++ b/arch/kvx/include/asm/ipi.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ */
+
+#ifndef _ASM_KVX_IPI_H
+#define _ASM_KVX_IPI_H
+
+#include <linux/irqreturn.h>
+
+int kvx_ipi_ctrl_probe(irqreturn_t (*ipi_irq_handler)(int, void *));
+
+void kvx_ipi_send(const struct cpumask *mask);
+
+#endif /* _ASM_KVX_IPI_H */
diff --git a/arch/kvx/platform/Makefile b/arch/kvx/platform/Makefile
index c7d0abb15c27..27f0914e0de5 100644
--- a/arch/kvx/platform/Makefile
+++ b/arch/kvx/platform/Makefile
@@ -4,3 +4,4 @@
 #
 
 obj-$(CONFIG_SMP) += pwr_ctrl.o
+obj-$(CONFIG_SMP) += ipi.o
diff --git a/arch/kvx/platform/ipi.c b/arch/kvx/platform/ipi.c
new file mode 100644
index 000000000000..a471039b1643
--- /dev/null
+++ b/arch/kvx/platform/ipi.c
@@ -0,0 +1,108 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Luc Michel
+ */
+
+#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
+
+#include <linux/io.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+#include <linux/module.h>
+#include <linux/of_irq.h>
+#include <linux/cpumask.h>
+#include <linux/interrupt.h>
+#include <linux/cpuhotplug.h>
+#include <linux/of_address.h>
+#include <linux/of_platform.h>
+
+#define IPI_INTERRUPT_OFFSET	0x0
+#define IPI_MASK_OFFSET		0x20
+
+/*
+ * IPI controller can signal RM and PE0 -> 15
+ * In order to restrict that to the PE, write the corresponding mask
+ */
+#define KVX_IPI_CPU_MASK	(~0xFFFF)
+
+struct kvx_ipi_ctrl {
+	void __iomem *regs;
+	unsigned int ipi_irq;
+};
+
+static struct kvx_ipi_ctrl kvx_ipi_controller;
+
+/**
+ * @kvx_pwr_ctrl_cpu_poweron Wakeup a cpu
+ *
+ * cpu: cpu to wakeup
+ */
+void kvx_ipi_send(const struct cpumask *mask)
+{
+	const unsigned long *maskb = cpumask_bits(mask);
+
+	WARN_ON(*maskb & KVX_IPI_CPU_MASK);
+	writel(*maskb, kvx_ipi_controller.regs + IPI_INTERRUPT_OFFSET);
+}
+
+static int kvx_ipi_starting_cpu(unsigned int cpu)
+{
+	enable_percpu_irq(kvx_ipi_controller.ipi_irq, IRQ_TYPE_NONE);
+
+	return 0;
+}
+
+static int kvx_ipi_dying_cpu(unsigned int cpu)
+{
+	disable_percpu_irq(kvx_ipi_controller.ipi_irq);
+
+	return 0;
+}
+
+int __init kvx_ipi_ctrl_probe(irqreturn_t (*ipi_irq_handler)(int, void *))
+{
+	struct device_node *np;
+	int ret;
+	unsigned int ipi_irq;
+	void __iomem *ipi_base;
+
+	np = of_find_compatible_node(NULL, NULL, "kalray,kvx-ipi-ctrl");
+	BUG_ON(!np);
+
+	ipi_base = of_iomap(np, 0);
+	BUG_ON(!ipi_base);
+
+	kvx_ipi_controller.regs = ipi_base;
+
+	/* Init mask for interrupts to PE0 -> PE15 */
+	writel(KVX_IPI_CPU_MASK, kvx_ipi_controller.regs + IPI_MASK_OFFSET);
+
+	ipi_irq = irq_of_parse_and_map(np, 0);
+	of_node_put(np);
+	if (!ipi_irq) {
+		pr_err("Failed to parse irq: %d\n", ipi_irq);
+		return -EINVAL;
+	}
+
+	ret = request_percpu_irq(ipi_irq, ipi_irq_handler,
+						"kvx_ipi", &kvx_ipi_controller);
+	if (ret) {
+		pr_err("can't register interrupt %d (%d)\n",
+						ipi_irq, ret);
+		return ret;
+	}
+	kvx_ipi_controller.ipi_irq = ipi_irq;
+
+	ret = cpuhp_setup_state(CPUHP_AP_IRQ_KVX_STARTING,
+				"kvx/ipi:online",
+				kvx_ipi_starting_cpu,
+				kvx_ipi_dying_cpu);
+	if (ret < 0) {
+		pr_err("Failed to setup hotplug state");
+		return ret;
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
