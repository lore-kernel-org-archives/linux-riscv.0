Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50EFEC982DA
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 13:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RB55uX/ZmuZmjh/xDsWPHHv98JMvpzStiuTpvdA7Kr4=; b=36uuexPooKj0GK
	5R+1NM6HcTzR0i9szl50b6dnG7Z/u0OlHb2FKnyMOLzDg7gKaubQ1W+BWnfnIjVX/qU3b14Dg7mio
	ARVwI6fbQaNtzC8sOQLlu3I2GqCF7Xi/f5GUHhBH3jQt75G6RkaNT7CCQhjiKv8ZxJlmQ+6mga0IW
	XBJH403JvRoGyrW4XXP/QDAQ0X+Z6loFqX36UxUuWf0b8W70dM+EZG31K3sXVB4oDRhMkiqGUOzEo
	vvWSDlKvMWRA2dPdx0du68JMDWZdX2ZtCnp/YoAXStOhcQsGiwBm3Fqgrt2R5B1N8UF3EKYzv2A2o
	VhYFjZCUiWuF15FlscHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HIz-0000000HU8h-06Db;
	Sun, 20 Sep 2026 13:10:05 +0000
Received: from mail-proxy49146.mail.163.com ([45.254.49.146])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HIv-0000000HU7n-2MQO
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 13:10:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=op
	4ci3atcTIV+rqmbvDsOvrO6hoczewdGO7KOjT5po4=; b=EFXNjJyBfepMucnsNj
	Q0yj3MFFrgQeDBSZo8ca0C9J8NjvzqMNtnrLIkUL8wTV0ZR43E0m8KO3dn7nNEFv
	usG+2/B1Jm8omYNDMy/fy+dzzURWJAZoNqlrwM1/S/Ao9c7xT6ez1YsNXkyyMPiC
	zrNEKSC4x49AdM1qKCMOvP7ew=
Received: from localhost.localdomain (unknown [])
	by gzsmtp3 (Coremail) with SMTP id PigvCgDXpdSr2q9qh4vBAQ--.39985S2;
	Sun, 20 Sep 2026 21:07:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: anup@brainfault.org,
	tglx@kernel.org
Cc: Pengpeng Hou <hppiscas@163.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Bjorn Topel <bjorn@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Radu Rendec <radu@rendec.net>
Subject: [PATCH v2] irqchip/riscv-imsic: Reject overlapping group index fields
Date: Sun, 20 Sep 2026 21:07:54 +0800
Message-ID: <caplitmus-rv.v2.imsic.f2c0e5bdc627451c83deb0cf7eb8834a@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: PigvCgDXpdSr2q9qh4vBAQ--.39985S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7tFWDCFWrKFWfKw48JryfXrb_yoW8uFW7pF
	Z8GrW09ryUCay09rW2v3WvqFyFgwn7AFZ0gFWUAw43Wry2vFn7Was0y3yrXw1DGF4Sk34x
	tF4YqryDGay8C3JanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UUpnPUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbC7gxoMWqv2qwIQQAA3B
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_061001_832591_DAD459DD 
X-CRM114-Status: UNSURE (   9.73  )
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

The IMSIC address layout places the group index above the page offset,
guest index and HART index. imsic_parse_fwnode() checks the individual
field widths and the upper end of the group field, but does not check
that its lower end is above the other fields.

Reject a nonzero group field whose shift overlaps the lower fields.
Otherwise a firmware-supplied layout can assign the same address bit to
different indices when MSI target addresses are constructed.

Keep the existing upper-bound check unchanged. The new lower-bound
check applies only when group index bits are present.

The issue was found by our static-analysis tool.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1: https://lore.kernel.org/r/caplitmus-rv.bc36e3a0ebcb4a01838171f27625004b.imsic-overlap@163.com/
- Limit the change to the lower-bound check discussed with Anup.
- Keep the existing upper-bound check unchanged.
- Send this as a standalone patch, without the zero-width-group change.
- Do not change APLIC configuration or require the earlier series.

 drivers/irqchip/irq-riscv-imsic-state.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbb..a7b241f 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -739,6 +739,14 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 
+	/* Group index bits must not overlap guest and HART index bits. */
+	i = IMSIC_MMIO_PAGE_SHIFT + global->guest_index_bits +
+	    global->hart_index_bits;
+	if (global->group_index_bits && global->group_index_shift < i) {
+		pr_err("%pfwP: group index shift too small\n", fwnode);
+		return -EINVAL;
+	}
+
 	/* Sanity check group index shift */
 	i = global->group_index_bits + global->group_index_shift - 1;
 	if (i >= BITS_PER_LONG) {

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
