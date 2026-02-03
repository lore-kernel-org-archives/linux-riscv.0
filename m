Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55C3E8305F
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 08:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Mime-Version:Message-Id:From:Cc:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AOo0KJAn0IwA3LdEBGZo+RI8e3qgOyTDFBkMUCLz1oA=; b=xizRXUoa15oeX6
	6MrfD/D48AEWMy00BJLrVreqy1Yc/o+zf0F31rUp5yJ3FzSe2al3oEyeH9pqtCs1FnEKbE6Q5ogEK
	Fabu69AZanShah2mgZQj8yW/+JfrLpcZVB39gQFPQD1rrpEVHFGlnjkZiZIEPwDShhcja+rcB/7SL
	RoxDlobrdiMh0V7Qhb+lNIUn9/ObTlCKxpUZOes3+dctlln0o8Nz856SCu3On2HY3P7VhU2HXFTvD
	mYkwwRZ5NW9GJhkoXKdXT7yQGbZDLbQ5aLYPqCiBFUCNqlCqf2OhvKlYJHLKw5k3Hb30CsYW2mIPi
	wxzbLWV5vImopGSc1WcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBOZ-00000006HFW-0X6V;
	Tue, 03 Feb 2026 08:04:23 +0000
Received: from sg-1-33.ptr.blmpb.com ([118.26.132.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnBOR-00000006HEv-2Mib
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 08:04:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2506131828; d=riscv-computing.com; t=1770105833;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=ZCzD1kaB/x/fLNcQMQAZ9VMazaQg98QBjDoCyHeBoto=;
 b=pSVaNXibRg7swCjK+tgtC6eEGjw2W/wm7zTWOksIWvBhH1b1FqYZ7hJMsyBJ5+arGpBKXX
 7kCc2g8K4++f+7QVMWvuGAZreCCKx4fyFZTle7PtxwmByK7jHevHR0zgO4qYuBajGAc4ve
 hLIYZy1YWms0YU/FFnt87ezcNuq7MjFdQj0Wuois6uo3DpSCcFmW7u3A/k8WAKxsiNno0C
 h6cVsuTh+fme5QyZ/Z5e5R6FqVo0hygubIgZsuFeuSyFZfzNVZc8qnJmSPEWThq7JBoJXT
 8nIWb3fcL+H8CWlawPBOINJ6PGjORbL1ym1D++hqtnW4j9XD6FRSg7METVZ7SA==
Date: Tue,  3 Feb 2026 16:02:57 +0800
X-Original-From: Yingjun Ni <yingjun.ni@riscv-computing.com>
X-Lms-Return-Path: <lba+26981abe7+c446ff+lists.infradead.org+yingjun.ni@riscv-computing.com>
Subject: [PATCH] irqchip/riscv-imsic: Fix irq migration failure issue when cpu hotplug.
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, 
	<yingjun.ni@riscv-computing.com>
From: "Yingjun Ni" <yingjun.ni@riscv-computing.com>
Message-Id: <20260203080256.9401-2-yingjun.ni@riscv-computing.com>
Mime-Version: 1.0
Received: from LAPTOP-LH7SI6C4.localdomain ([14.127.203.227]) by smtp.feishu.cn with ESMTPS; Tue, 03 Feb 2026 16:03:50 +0800
X-Mailer: git-send-email 2.43.0
To: <anup@brainfault.org>, <tglx@kernel.org>, <pjw@kernel.org>, 
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_000420_309718_763C1892 
X-CRM114-Status: GOOD (  12.19  )
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

Add a null pointer check for irq_write_msi_msg to fix NULL pointer
dereference issue when migrating irq.

Modify the return value of imsic_irq_set_affinity to let the subdomain
PCI-MSIX migrate the irq to a new cpu when cpu hotplug.

Don't set vec->move_next in imsic_vector_move_update when the cpu is
offline, because it will never be cleared.

crash log:
Unable to handle kernel NULL pointer dereference at virtual address 0
...
Stopper: multi_cpu_stop+0x0/0x24c <- stop_machine_cpuslocked+0x160/0x1b4
epc : 0x0
 ra : imsic_irq_set_affinity+0x174/0x1ac

Reproduce step:
1. start riscv kernel by qemu.

$QEMU -M virt,aia=aplic-imsic,aia-guests=5 -m 512M -smp 4 \
      -kernel $KERNEL -initrd $ROOTFS  -bios $OPENSBI \
      -device e1000e,netdev=net0,mac=52:54:00:12:34:56 \
      -netdev user,id=net0,net=10.0.2.0/24,dhcpstart=10.0.2.11 \
      -nographic

2. set cpu3 offline.

cat /proc/interrupts
    CPU0  CPU1  CPU2 CPU3
23:   0    0     0    66   PCI-MSIX-0000:00:01.0 eth0-rx-0

echo 0 > /sys/bus/cpu/devices/cpu3/online

Signed-off-by: Yingjun Ni <yingjun.ni@riscv-computing.com>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 8 ++++++--
 drivers/irqchip/irq-riscv-imsic-state.c    | 5 +++++
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 643c8e459611..131e4f2b5431 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -93,9 +93,13 @@ static void imsic_irq_compose_msg(struct irq_data *d, struct msi_msg *msg)
 static void imsic_msi_update_msg(struct irq_data *d, struct imsic_vector *vec)
 {
 	struct msi_msg msg = { };
+	struct irq_chip *irq_chip = irq_data_get_irq_chip(d);
+
+	if (!irq_chip->irq_write_msi_msg)
+		return;
 
 	imsic_irq_compose_vector_msg(vec, &msg);
-	irq_data_get_irq_chip(d)->irq_write_msi_msg(d, &msg);
+	irq_chip->irq_write_msi_msg(d, &msg);
 }
 
 static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask_val,
@@ -173,7 +177,7 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 	/* Move state of the old vector to the new vector */
 	imsic_vector_move(old_vec, new_vec);
 
-	return IRQ_SET_MASK_OK_DONE;
+	return IRQ_SET_MASK_OK;
 }
 
 static void imsic_irq_force_complete_move(struct irq_data *d)
diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b6cebfee9461..cd1bf9516878 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -362,6 +362,10 @@ static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
 	/* Update enable and move details */
 	enabled = READ_ONCE(vec->enable);
 	WRITE_ONCE(vec->enable, new_enable);
+
+	if (!cpu_online(vec->cpu) && is_old_vec)
+		goto out;
+
 	if (is_old_vec)
 		WRITE_ONCE(vec->move_next, move_vec);
 	else
@@ -371,6 +375,7 @@ static bool imsic_vector_move_update(struct imsic_local_priv *lpriv,
 	bitmap_set(lpriv->dirty_bitmap, vec->local_id, 1);
 	__imsic_remote_sync(lpriv, vec->cpu);
 
+out:
 	raw_spin_unlock_irqrestore(&lpriv->lock, flags);
 
 	return enabled;
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
