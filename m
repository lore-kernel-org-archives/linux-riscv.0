Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B504606C9A3
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Nov 2026 19:17:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kn5WiX+9;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dg7kxbdG
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:
	Message-Id:MIME-Version:Subject:Date:From:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RcuAilUcp/ZZCEQlL092lQNjkBAezyf0b0PrSfmABGw=; b=kn5WiX+9C6LDrXX9mc6Pwuw10Z
	hHOIaWLP7UTnRINEM3oCerXJH7Lm9XAWxiE87pEFqfUn1F+8Y9jdTi8J0qLse3TkfQd6vaZZUdWCb
	aNZ+1AplvS+j+oj1VBvtnbbLggKNlpgFbsxrkqFgERU+RvVMn2orTrkdf5VF/tXku4ln37+hSa/RO
	/8n7uDmB2f9YYlucH6CJT0HJixMJs75AM7E5SAlLn4ZVKzLD3uG5I7UT/IuHNQ4bEmwUZZnAA0s0J
	HvtOywQ2dOYp30/aupm5zb+XZwe6uJzf1Q9X2JoRqTNN1YSUMLcHjUwOfWvxpkwCba2RcIg7VxxIQ
	xkgPRvhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU6M-0000000G2GH-0UWu;
	Fri, 20 Nov 2026 19:16:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xUU68-0000000G2BO-3IVY
	for linux-riscv@lists.infradead.org;
	Fri, 20 Nov 2026 19:16:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1AA7362447;
	Fri, 20 Nov 2026 19:16:36 +0000 (UTC)
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795202195;
	b=Vqh7rSu4/8BUoZmgRbVkqzCzKqbrh1edEMHLojjXWDFBilErA09jzuVVwxLdMNF0C1jF
	 Lawu8aILyxY/PmXhv7iLCySOneCU9lL0a9k30jGpSe4jPT+Hp+LDdpUftO6Ej3AsvBVha
	 GwAB0NhBchXH22A7YCjdEHPZQNr+TJe7WaiHRDagFiFNZytGctEmgTg6ZmfJlifIPOEf4
	 6/L4hKOx4VC5YDhHRov/rf1bf4ZjGJaRRt8UnX3xoxGpm3KpMr9JnCV2uxcE2OsEjJxjV
	 OrWn9pCNs/sGx9ddfL6CCMEphj3oU5DQTxWmUdie7kRd9BR+cajrp1/0ggg8d9NLM0w==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795202195;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=VCSQCc0yvtrmOoCjuIRBo5BrPWCg2fD0xLmeKel1ZGQ=;
	b=W2yh1v8Ci432sbU8e09MQpjMs6diCqMyNMeBNCVZ7vqcKGPEY9OlVcsWoXu8j6Ei7kN3
	 XauD2T9X0sUMLUGkiYRqjfAobGn5B8RzmwDujLwq0AlFfPBcmVcCQfaRyYUQ84VBMfMTm
	 d9l6xR+cZn8XQ5KK/WNKXnBm6vZGlx1lTeGUB1ZEYLI2GJLkl5+KoDklp287rAJk+pIMC
	 5uYFk+F9XadWExvXmrNB/PjugtRIpJ2eHCOBrD/THWQUd59c4bWstWveHb85yYzSsr6f+
	 5Lauj1wTJLAKQjt/XYt4WiPJA3I+eQuMHU1yTOWRfrc+dyZe20WLGVSBdxGmbPH8N+w==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id BF23E1F000D2;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795202195;
	bh=VCSQCc0yvtrmOoCjuIRBo5BrPWCg2fD0xLmeKel1ZGQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=dg7kxbdG86dOWi+KbDnblZzIedqTbTHAZMO3pApNHXWyodZL9zFgEgFWFtYv8U44C
	 cEA4jeSEaZuQBS4DGIwSuaZow3NmAcHOFEzyXJ778rCOdGwZj1bAfHfK97S8xCTh+F
	 PXMpWyq1cgyhuvJM5Pkj8il1mxzU5pEEC3692wNr6p5uJQsxN8B44p79a7pJh+gmVE
	 Ks0wUiteRMpb9UIUsOjw7/XAZ64TUMxu93bnEiQ3bOvC6jPMR5YU0wXj2ZjWlLb0Hk
	 u+2RBmjyE192flvSeTbdcWh7+D3P+rZqsl6YVmbBaT3sR/8kBxcwbTbKeXswAZ0I1h
	 AV0JfLojoqIjw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 4C1304B9C2;
	Fri, 20 Nov 2026 19:16:24 +0000 (UTC)
From: Han Gao via B4 Relay <devnull+gaohan.iscas.ac.cn@kernel.org>
Date: Sat, 21 Nov 2026 03:15:49 +0800
Subject: [PATCH v4 03/13] mailbox: add Zhihe A210 AP to E902 mailbox driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261121-a210-scmi-v4-3-4a795a0a9fc9@iscas.ac.cn>
References: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
In-Reply-To: <20261121-a210-scmi-v4-0-4a795a0a9fc9@iscas.ac.cn>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Zhiguo Zhu <zhiguo.zhu@linux.alibaba.com>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@kernel.org>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Michal Simek <michal.simek@amd.com>, 
 Drew Fustini <fustini@kernel.org>, Icenowy Zheng <uwu@icenowy.me>, 
 Inochi Amaoto <inochiama@gmail.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 Yao Zi <me@ziyao.cc>, Jiaxun Yang <jiaxun.yang@flygoat.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 linux-serial@vger.kernel.org, Han Gao <rabenda.cn@gmail.com>, 
 Han Gao <gaohan@iscas.ac.cn>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795202181; l=7374;
 i=gaohan@iscas.ac.cn; s=20261021; h=from:subject:message-id;
 bh=Z7rtD2lVv6OIg4Vqe4Ikd4EKS6jFLkfoX9GIDAAsyp4=;
 b=7in7qX5zdcztTeBddRq78g6OhSym9F39nhfzuN2TIWRRSMJGaJoPXmae1wWXIhy/a9r3umzaN
 q1dghLuPDS4BxZL1qko1KLUSeiEq8wHZj8z/GwVRi79mnVcPWzT6nGt
X-Developer-Key: i=gaohan@iscas.ac.cn; a=ed25519;
 pk=J8WHEK3filS86QaCaIHDGafqhxKyQ4K7+vFgRirTIiY=
X-Endpoint-Received: by B4 Relay for gaohan@iscas.ac.cn/20261021 with
 auth_id=1262
X-Original-From: Han Gao <gaohan@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Reply-To: gaohan@iscas.ac.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Han Gao <gaohan@iscas.ac.cn>

Add a mailbox controller for the doorbells between the A210 application
processors and the E902 management core. It serves as the SCMI
transport to the E902 firmware.

Channel 0 rings E902 and receives its completions. Channel 1 is receive
only and carries E902 notifications. Both share one interrupt, and E902
writes INFO0 or INFO1 to tell them apart.

The E902 firmware keeps both mailboxes clocked and out of reset, so the
driver does not manage clocks or resets.

Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/mailbox/Kconfig        |   9 +++
 drivers/mailbox/Makefile       |   2 +
 drivers/mailbox/mailbox-a210.c | 176 +++++++++++++++++++++++++++++++++++++++++
 3 files changed, 187 insertions(+)

diff --git a/drivers/mailbox/Kconfig b/drivers/mailbox/Kconfig
index ab869769e278..6d620b0dde6f 100644
--- a/drivers/mailbox/Kconfig
+++ b/drivers/mailbox/Kconfig
@@ -409,4 +409,13 @@ config AXIADO_MAILBOX
 	  Axiado SoCs.
 	  If unsure, say N.
 
+config ZHIHE_A210_MBOX
+	bool "Zhihe A210 AP to E902 mailbox"
+	depends on OF && (ARCH_ZHIHE || COMPILE_TEST)
+	help
+	  Mailbox driver for the doorbells between the application
+	  processors and the E902 management core of the Zhihe A210. The
+	  doorbells carry no data, so clients pass their messages through
+	  shared memory. Say Y to use the SCMI firmware on the E902.
+
 endif
diff --git a/drivers/mailbox/Makefile b/drivers/mailbox/Makefile
index 45dc59bb3e7f..f537ebb8aaff 100644
--- a/drivers/mailbox/Makefile
+++ b/drivers/mailbox/Makefile
@@ -86,3 +86,5 @@ obj-$(CONFIG_BCM74110_MAILBOX)	+= bcm74110-mailbox.o
 obj-$(CONFIG_RISCV_SBI_MPXY_MBOX)	+= riscv-sbi-mpxy-mbox.o
 
 obj-$(CONFIG_AXIADO_MAILBOX)	+= axiado-mailbox.o
+
+obj-$(CONFIG_ZHIHE_A210_MBOX) += mailbox-a210.o
diff --git a/drivers/mailbox/mailbox-a210.c b/drivers/mailbox/mailbox-a210.c
new file mode 100644
index 000000000000..0b66fded6b09
--- /dev/null
+++ b/drivers/mailbox/mailbox-a210.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Zhihe A210 application processor to E902 mailbox */
+#include <linux/interrupt.h>
+#include <linux/io.h>
+#include <linux/mailbox_controller.h>
+#include <linux/module.h>
+#include <linux/platform_device.h>
+#include <linux/spinlock.h>
+
+/* The local mailbox holds the INFO bank and, one page up, the AP interrupt. */
+#define A210_MBOX_STATUS		0x1000
+#define A210_MBOX_CLEAR		0x1004
+#define A210_MBOX_MASK		0x100c
+#define A210_MBOX_GENERATE	0x10
+#define A210_MBOX_INFO(n)	(0x14 + 4 * (n))
+#define A210_MBOX_E902_PENDING	BIT(0)
+#define A210_MBOX_NOTIFY		BIT(6)
+
+/* Channel 0 carries AP requests and completions, channel 1 E902 notifications. */
+#define A210_MBOX_CHANS		2
+
+struct a210_mbox {
+	struct mbox_controller controller;
+	struct mbox_chan channels[A210_MBOX_CHANS];
+	void __iomem *local;
+	void __iomem *remote;
+	/* Protects the shared interrupt mask and the set of started channels. */
+	spinlock_t lock;
+	unsigned long started;
+	int irq;
+};
+
+static void a210_mbox_mask(struct a210_mbox *mbox, unsigned int index, bool enable)
+{
+	unsigned long flags;
+	u32 value;
+
+	spin_lock_irqsave(&mbox->lock, flags);
+	if (enable)
+		__set_bit(index, &mbox->started);
+	else
+		__clear_bit(index, &mbox->started);
+	value = readl(mbox->local + A210_MBOX_MASK);
+	if (mbox->started)
+		value |= A210_MBOX_E902_PENDING;
+	else
+		value &= ~A210_MBOX_E902_PENDING;
+	writel(value, mbox->local + A210_MBOX_MASK);
+	spin_unlock_irqrestore(&mbox->lock, flags);
+}
+
+static irqreturn_t a210_mbox_irq(int irq, void *data)
+{
+	struct a210_mbox *mbox = data;
+
+	if (!(readl(mbox->local + A210_MBOX_MASK) & A210_MBOX_E902_PENDING))
+		return IRQ_NONE;
+	if (!(readl(mbox->local + A210_MBOX_STATUS) & A210_MBOX_E902_PENDING))
+		return IRQ_NONE;
+
+	writel(A210_MBOX_E902_PENDING, mbox->local + A210_MBOX_CLEAR);
+
+	/* E902 sets INFO<n> before ringing the shared doorbell for channel n. */
+	for (unsigned int i = 0; i < A210_MBOX_CHANS; i++) {
+		if (!readl(mbox->local + A210_MBOX_INFO(i)))
+			continue;
+		writel(0, mbox->local + A210_MBOX_INFO(i));
+		if (test_bit(i, &mbox->started))
+			mbox_chan_received_data(&mbox->channels[i], NULL);
+	}
+	return IRQ_HANDLED;
+}
+
+static unsigned int a210_mbox_index(struct a210_mbox *mbox, struct mbox_chan *channel)
+{
+	return channel - mbox->channels;
+}
+
+static int a210_mbox_send(struct mbox_chan *channel, void *data)
+{
+	struct a210_mbox *mbox = channel->con_priv;
+
+	/* E902 notifications are receive-only. */
+	if (a210_mbox_index(mbox, channel))
+		return -EINVAL;
+
+	/* Payload and completion ownership belong to the shared-memory client. */
+	writel(A210_MBOX_NOTIFY, mbox->remote + A210_MBOX_GENERATE);
+	return 0;
+}
+
+static int a210_mbox_startup(struct mbox_chan *channel)
+{
+	struct a210_mbox *mbox = channel->con_priv;
+	unsigned int index = a210_mbox_index(mbox, channel);
+
+	writel(0, mbox->local + A210_MBOX_INFO(index));
+	a210_mbox_mask(mbox, index, true);
+	return 0;
+}
+
+static void a210_mbox_shutdown(struct mbox_chan *channel)
+{
+	struct a210_mbox *mbox = channel->con_priv;
+
+	a210_mbox_mask(mbox, a210_mbox_index(mbox, channel), false);
+	synchronize_irq(mbox->irq);
+}
+
+static const struct mbox_chan_ops a210_mbox_ops = {
+	.send_data = a210_mbox_send,
+	.startup = a210_mbox_startup,
+	.shutdown = a210_mbox_shutdown,
+};
+
+static int a210_mbox_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct a210_mbox *mbox;
+	int ret;
+
+	mbox = devm_kzalloc(dev, sizeof(*mbox), GFP_KERNEL);
+	if (!mbox)
+		return -ENOMEM;
+
+	mbox->local = devm_platform_ioremap_resource_byname(pdev, "local");
+	if (IS_ERR(mbox->local))
+		return PTR_ERR(mbox->local);
+	mbox->remote = devm_platform_ioremap_resource_byname(pdev, "remote");
+	if (IS_ERR(mbox->remote))
+		return PTR_ERR(mbox->remote);
+	mbox->irq = platform_get_irq(pdev, 0);
+	if (mbox->irq < 0)
+		return mbox->irq;
+
+	spin_lock_init(&mbox->lock);
+	a210_mbox_mask(mbox, 0, false);
+	for (unsigned int i = 0; i < A210_MBOX_CHANS; i++)
+		mbox->channels[i].con_priv = mbox;
+	/*
+	 * Neither txdone_irq nor txdone_poll is set: the client acknowledges
+	 * completion after consuming shared memory.
+	 */
+	mbox->controller.dev = dev;
+	mbox->controller.chans = mbox->channels;
+	mbox->controller.num_chans = A210_MBOX_CHANS;
+	mbox->controller.ops = &a210_mbox_ops;
+
+	ret = devm_request_irq(dev, mbox->irq, a210_mbox_irq, 0, dev_name(dev),
+			       mbox);
+	if (ret)
+		return ret;
+
+	return devm_mbox_controller_register(dev, &mbox->controller);
+}
+
+static const struct of_device_id a210_mbox_match[] = {
+	{ .compatible = "zhihe,a210-ap-mailbox" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, a210_mbox_match);
+
+static struct platform_driver a210_mbox_driver = {
+	.probe = a210_mbox_probe,
+	.driver = {
+		.name = "a210-mailbox",
+		.of_match_table = a210_mbox_match,
+		/* Running E902 firmware continuously accesses the remote bank. */
+		.suppress_bind_attrs = true,
+	},
+};
+module_platform_driver(a210_mbox_driver);
+
+MODULE_AUTHOR("Han Gao <gaohan@iscas.ac.cn>");
+MODULE_DESCRIPTION("Zhihe A210 AP to E902 mailbox");
+MODULE_LICENSE("GPL");

-- 
2.55.0



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
