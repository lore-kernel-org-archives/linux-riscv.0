Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA98CC05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 15:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/V4pH8dip9PpV1wDfj/MhnWL9Obc+gX0iT30yVsVeac=; b=m2jbDK7WEvQ2Pj
	kSIzRPeTeGqOYsg+xXWbFBae5rWAF6h1pAk9eF39ra4xZbKwVc4ntgjXKcfLly+jvG6uFBPBIrEMg
	pbNUUS5H7VH86Fks6SxbPfggnJxigVNaIVg5i4DgRSVdSUdd47fsXGpypbFh0El+KDRiMz6cRfJGp
	dNoDNHLhLIcOeDIMgYZl7ljdWqIroDfgvZijiEe3FO7sIo/LbEqapriQIFnCgEPA1Gn2/+CSLAfGx
	qdN9jnKAr8w4DTbIoiWl5XkDWr+jV14d+tziv0RaPYKcI8eKJ4m4ckDklSAZE2mvRV8sKeTtASh7F
	IMcjiufTeUeLnxaX6LVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pItMJ-00B01a-0a; Fri, 20 Jan 2023 15:31:15 +0000
Received: from smtpout30.security-mail.net ([85.31.212.36] helo=fx306.security-mail.net)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pIsG8-00Ag9h-NX
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 14:20:50 +0000
Received: from localhost (fx306.security-mail.net [127.0.0.1])
	by fx306.security-mail.net (Postfix) with ESMTP id 02E4B35CF85
	for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 15:20:47 +0100 (CET)
Received: from fx306 (fx306.security-mail.net [127.0.0.1]) by
 fx306.security-mail.net (Postfix) with ESMTP id 46F4D35CEF0; Fri, 20 Jan
 2023 15:20:46 +0100 (CET)
Received: from zimbra2.kalray.eu (unknown [217.181.231.53]) by
 fx306.security-mail.net (Postfix) with ESMTPS id 3B41B35CD23; Fri, 20 Jan
 2023 15:20:45 +0100 (CET)
Received: from zimbra2.kalray.eu (localhost [127.0.0.1]) by
 zimbra2.kalray.eu (Postfix) with ESMTPS id 841C727E0458; Fri, 20 Jan 2023
 15:10:38 +0100 (CET)
Received: from localhost (localhost [127.0.0.1]) by zimbra2.kalray.eu
 (Postfix) with ESMTP id 67DE527E0474; Fri, 20 Jan 2023 15:10:38 +0100 (CET)
Received: from zimbra2.kalray.eu ([127.0.0.1]) by localhost
 (zimbra2.kalray.eu [127.0.0.1]) (amavisd-new, port 10026) with ESMTP id
 Kpdh9d1egf6R; Fri, 20 Jan 2023 15:10:38 +0100 (CET)
Received: from junon.lin.mbt.kalray.eu (unknown [192.168.37.161]) by
 zimbra2.kalray.eu (Postfix) with ESMTPSA id DE5A427E0458; Fri, 20 Jan 2023
 15:10:37 +0100 (CET)
X-Virus-Scanned: E-securemail
Secumail-id: <883a.63caa33d.39b9a.0>
DKIM-Filter: OpenDKIM Filter v2.10.3 zimbra2.kalray.eu 67DE527E0474
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kalray.eu;
 s=32AE1B44-9502-11E5-BA35-3734643DEF29; t=1674223838;
 bh=r0jAYvZMgDHNmtYPIBemAGb6cgybEgHcmW3NkzN/0Bc=;
 h=From:To:Date:Message-Id:MIME-Version;
 b=JKNRyzm7+8sxXJUhLzONaUXzidzmY7QHybfABV02MMeEolEK1l0P/zyCPivr0qi3X
 cMk6eiWHc8wcM/3mwaZc92PFr6HmcHLhtp6SGUL9n/464kv1zJak07VGMurb1BFNSB
 JEfwZjhbgtlfk55C9aauCac0b4/oyWiVvpTX7xMY=
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
Subject: [RFC PATCH v2 29/31] kvx: Add support for cpuinfo
Date: Fri, 20 Jan 2023 15:10:00 +0100
Message-ID: <20230120141002.2442-30-ysionneau@kalray.eu>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230120141002.2442-1-ysionneau@kalray.eu>
References: <20230120141002.2442-1-ysionneau@kalray.eu>
MIME-Version: 1.0
X-ALTERMIMEV2_out: done
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_062048_937330_3ED8EC03 
X-CRM114-Status: GOOD (  16.93  )
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

Add support for cpuinfo on kvx arch.

Co-developed-by: Clement Leger <clement@clement-leger.fr>
Signed-off-by: Clement Leger <clement@clement-leger.fr>
Co-developed-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
Signed-off-by: Guillaume Thouvenin <gthouvenin@kalray.eu>
Co-developed-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Julian Vetter <jvetter@kalray.eu>
Signed-off-by: Jules Maselbas <jmaselbas@kalray.eu>
Signed-off-by: Yann Sionneau <ysionneau@kalray.eu>
---

Notes:
    V1 -> V2: no changes

 arch/kvx/kernel/cpuinfo.c | 96 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100644 arch/kvx/kernel/cpuinfo.c

diff --git a/arch/kvx/kernel/cpuinfo.c b/arch/kvx/kernel/cpuinfo.c
new file mode 100644
index 000000000000..f44c46c1e4ba
--- /dev/null
+++ b/arch/kvx/kernel/cpuinfo.c
@@ -0,0 +1,96 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2017-2023 Kalray Inc.
+ * Author(s): Clement Leger
+ *            Guillaume Thouvenin
+ */
+
+#include <linux/seq_file.h>
+#include <linux/delay.h>
+#include <linux/clk.h>
+#include <linux/cpu.h>
+#include <linux/of.h>
+
+unsigned long elf_hwcap __read_mostly;
+
+static int show_cpuinfo(struct seq_file *m, void *v)
+{
+	int cpu_num = *(unsigned int *)v;
+	struct cpuinfo_kvx *n = per_cpu_ptr(&cpu_info, cpu_num);
+
+	seq_printf(m, "processor\t: %d\nvendor_id\t: Kalray\n", cpu_num);
+
+	seq_printf(m,
+		   "copro enabled\t: %s\n"
+		   "arch revision\t: %d\n"
+		   "uarch revision\t: %d\n",
+		   n->copro_enable ? "yes" : "no",
+		   n->arch_rev,
+		   n->uarch_rev);
+
+	seq_printf(m,
+		   "bogomips\t: %lu.%02lu\n"
+		   "cpu MHz\t\t: %llu.%03llu\n\n",
+		   (loops_per_jiffy * HZ) / 500000,
+		   ((loops_per_jiffy * HZ) / 5000) % 100,
+		   n->freq / 1000000, (n->freq / 10000) % 100);
+
+	return 0;
+}
+
+static void *c_start(struct seq_file *m, loff_t *pos)
+{
+	if (*pos == 0)
+		*pos = cpumask_first(cpu_online_mask);
+	if (*pos >= num_online_cpus())
+		return NULL;
+
+	return pos;
+}
+
+static void *c_next(struct seq_file *m, void *v, loff_t *pos)
+{
+	*pos = cpumask_next(*pos, cpu_online_mask);
+
+	return c_start(m, pos);
+}
+
+static void c_stop(struct seq_file *m, void *v)
+{
+}
+
+const struct seq_operations cpuinfo_op = {
+	.start = c_start,
+	.next = c_next,
+	.stop = c_stop,
+	.show = show_cpuinfo,
+};
+
+static int __init setup_cpuinfo(void)
+{
+	int cpu;
+	struct clk *clk;
+	unsigned long cpu_freq = 1000000000;
+	struct device_node *node = of_get_cpu_node(0, NULL);
+
+	clk = of_clk_get(node, 0);
+	if (IS_ERR(clk)) {
+		printk(KERN_WARNING
+		       "Device tree missing CPU 'clock' parameter. Assuming frequency is 1GHZ");
+		goto setup_cpu_freq;
+	}
+
+	cpu_freq = clk_get_rate(clk);
+
+	clk_put(clk);
+
+setup_cpu_freq:
+	of_node_put(node);
+
+	for_each_possible_cpu(cpu)
+		per_cpu_ptr(&cpu_info, cpu)->freq = cpu_freq;
+
+	return 0;
+}
+
+late_initcall(setup_cpuinfo);
-- 
2.37.2






_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
