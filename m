Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40AFFD29DC2
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 03:20:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xige1GlNeVeICeVq0mQjdVV4LDRKynEW0GCzcA8YVl4=; b=l6cxjE51VH6/v9
	qRFSAC8QzRM9KhWq9BI9LVREJPEunCP3h8e63wzAITK6FDlTgJU74q/AQWRdwbHf2re3ONThwMWX6
	NiW3KNRPTIIXp69sq473N1Ul102qubcTfOv6K4DbiGa/fk1Gnj3I/J5wUk0kJ/TyGU4LOEP5AvlmN
	ZIc1X4phNfhi5kqCig7x2WINA7vl2XPwLBUkWWTsBCM6L8hnAfB2o2p4/dhN9e2n0f/Rec1bbVBsp
	AbuIt/p8RZKcbELP/jMijjREUzjxHt9N3eFLC9BvcRm79lA79dVqloZxFr7lhALFV5emsqHp4+SI8
	llEqZNXfVNKtUOVLCZPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUwf-00000006TeM-3UaB;
	Tue, 13 Jan 2026 03:19:49 +0000
Received: from mxhk.zte.com.cn ([160.30.148.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfUwd-00000006Tdd-0uV9
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 03:19:49 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4dqvcW2MFhz5BNRd;
	Tue, 13 Jan 2026 11:19:39 +0800 (CST)
Received: from xaxapp01.zte.com.cn ([10.88.99.176])
	by mse-fl1.zte.com.cn with SMTP id 60D3JTKZ083425;
	Tue, 13 Jan 2026 11:19:29 +0800 (+08)
	(envelope-from wang.yaxin@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Tue, 13 Jan 2026 11:19:30 +0800 (CST)
X-Zmail-TransId: 2af96965b9c20e7-312c3
X-Mailer: Zmail v1.0
Message-ID: <20260113111930821RrC26avITHWSFCN0bYbgI@zte.com.cn>
Date: Tue, 13 Jan 2026 11:19:30 +0800 (CST)
Mime-Version: 1.0
From: <wang.yaxin@zte.com.cn>
To: <anup@brainfault.org>, <tglx@linutronix.de>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Cc: <zhang.run@zte.com.cn>, <hu.shengming@zte.com.cn>,
        <zhang.anmeng@zte.com.cn>, <luo.haiyang@zte.com.cn>, <alex@ghiti.fr>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIGxpbnV4LW5leHRdIGlycWNoaXAvcmlzY3YtaW1zaWM6IFJldmVydCAiUmVtb3ZlIHJlZHVuZGFudCBpcnFfZGF0YQoKIGxvb2t1cHMi?=
X-MAIL: mse-fl1.zte.com.cn 60D3JTKZ083425
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yaxin@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Tue, 13 Jan 2026 11:19:39 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6965B9CB.000/4dqvcW2MFhz5BNRd
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_191947_422572_0D043223 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
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

From: Luo Haiyang <luo.haiyang@zte.com.cn>

Commit c475c0b71314("irqchip/riscv-imsic: Remove redundant irq_data
lookups") leads a NULL pointer deference in imsic_msi_update_msg().

When QEMU is launched with the following additional boot parameters:
"-device virtio-blk-pci,drive=disk1 \
 -drive file=disk.qcow2,if=none,id=disk1,format=qcow2 \"

Kernel panic with NULL pointer dereference, the log is:
[    1.589509] virtio_blk virtio1: 8/0/0 default/read/poll queues
[    1.594943] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
[    1.595547] Current kworker/u32:2 pgtable: 4K pagesize, 48-bit VAs, pgdp=0x0000000081c33000
[    1.595922] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000
[    1.597399] Oops [#1]
[    1.597560] Modules linked in:
[    1.598071] CPU: 5 UID: 0 PID: 75 Comm: kworker/u32:2 Not tainted 6.19.0-rc4-next-20260109 #1 NONE
[    1.598607] Hardware name: riscv-virtio,qemu (DT)
[    1.599193] Workqueue: events_unbound deferred_probe_work_func
[    1.600184] epc : 0x0
[    1.600529]  ra : imsic_irq_set_affinity+0x110/0x130
    ......

The irq_data pointer parameter of imsic_irq_set_affinity() is associated
with the imsic domain and differs from irq_get_irq_data(d->irq) returns.

Signed-off-by: Luo Haiyang <luo.haiyang@zte.com.cn>
---
 drivers/irqchip/irq-riscv-imsic-platform.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-platform.c b/drivers/irqchip/irq-riscv-imsic-platform.c
index 7228a33f6c37..643c8e459611 100644
--- a/drivers/irqchip/irq-riscv-imsic-platform.c
+++ b/drivers/irqchip/irq-riscv-imsic-platform.c
@@ -158,11 +158,11 @@ static int imsic_irq_set_affinity(struct irq_data *d, const struct cpumask *mask
 		tmp_vec.local_id = new_vec->local_id;

 		/* Point device to the temporary vector */
-		imsic_msi_update_msg(d, &tmp_vec);
+		imsic_msi_update_msg(irq_get_irq_data(d->irq), &tmp_vec);
 	}

 	/* Point device to the new vector */
-	imsic_msi_update_msg(d, new_vec);
+	imsic_msi_update_msg(irq_get_irq_data(d->irq), new_vec);

 	/* Update irq descriptors with the new vector */
 	d->chip_data = new_vec;
-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
