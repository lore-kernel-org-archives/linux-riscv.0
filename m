Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62738C79F85
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Sep 2026 08:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ltMiFkSgcqBcdexuN7R5tJHRleVGzHjYDALGpS2EcqY=; b=gakoxvFDvkwW9P
	7Gu5asgIr8o6n3Mu0OaqtpDW+ZW4hR2tBggb6unAZdK/tsrvo40Mh2xFFsD8PNkK8AULUtnFNlWYq
	Kb/v0kVIKS7Z6LAaR8Q1ieMEV7Ik5nWlY6Fo4ei+lYHb8fOuDLpP6VEVFLp3peQIzod8za5KVrFFo
	FYXr+aP6fwrG1aUkdI+93hkaFebcxpAIMMzwM3iEfa3J443BDYnejGhLkE7CAzB8JkddH5awp0gan
	ROhg5Z/WlDGH2L1KJ8z3+5XrLVKuy4yWmggaeagchd+hN97t49XwD+mJt5conN3FXolu47lx0Owjf
	xiCjvzuw31a/r3rEgcmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37ws-00000004pux-0ge5;
	Sun, 06 Sep 2026 08:09:58 +0000
Received: from m16.mail.163.com ([117.135.210.3])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x37wp-00000004puE-2YUk
	for linux-riscv@lists.infradead.org;
	Sun, 06 Sep 2026 08:09:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:Content-Type:
	MIME-Version; bh=f0EYHhzlbc4S4S50XoOMmZMO9nA45aQCMVmvAoFVo4M=;
	b=SPvxAPVvh4bZ1ZKpcx7KPB/ZBYlLTWqQv2Ee5RRSeF4ueTCGup0Rugu1GkbGXg
	xhXD1MG4QzHmrC3mgo0RDTjXrZH6A1IW3w2B8V4CpWszoNfcWnNcfa4CA1LCDec3
	bTzlhdz7ao+z9+FUqWlgaF5oaW/brQLtVpsTfaAN0upBw=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g0-0 (Coremail) with SMTP id _____wD330ewH51qYvTkAw--.36051S2;
	Sun, 06 Sep 2026 16:09:22 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: Anup Patel <anup@brainfault.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Pengpeng Hou <hppiscas@163.com>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andrew Jones <andrew.jones@oss.qualcomm.com>,
	Bjorn Topel <bjorn@kernel.org>
Subject: [PATCH 2/2] irqchip/riscv-imsic: Reject overlapping group index fields
Date: Sun,  6 Sep 2026 16:09:18 +0800
Message-ID: <caplitmus-rv.bc36e3a0ebcb4a01838171f27625004b.imsic-overlap@163.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
References: <caplitmus-rv.4f722288a2f1483090d75bcd991d5b90.imsic-cover@163.com>
MIME-Version: 1.0
X-CM-TRANSID: _____wD330ewH51qYvTkAw--.36051S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Aw15tw1DJFyUXr43Gr4UJwb_yoW8WFy7pa
	n8CF4Fyr1UGa10vr4Ivayvqa4rK3s2yFZIgFW8Ars8C342qFn3G3WqyryrXwn8JF43Cw1f
	AF4YqFyUC3y8Ca7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U3HUgUUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxhL1vmqdH7IPCgAA3A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260906_010956_031598_C444B505 
X-CRM114-Status: UNSURE (   8.86  )
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

The IMSIC parser validates index widths but does not check that a
nonzero group field starts above the page, guest and hart fields.
A malformed layout can therefore assign one address bit to two fields.

Require the group shift to be at least the end of the lower fields.
Check the upper bound using subtraction after validating the shift, so
the bound check cannot wrap when processing a firmware-supplied value.

The issue was found by our static-analysis tool and manually reviewed.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Assisted-by: GPT-5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index 44b9c34c..c6eb16ae 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -742,8 +742,16 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 
 	/* Sanity check group index shift */
 	if (global->group_index_bits) {
-		i = global->group_index_bits + global->group_index_shift - 1;
-		if (i >= BITS_PER_LONG) {
+		i = IMSIC_MMIO_PAGE_SHIFT + global->guest_index_bits +
+		    global->hart_index_bits;
+		if (global->group_index_shift < i) {
+			pr_err("%pfwP: group index shift too small\n", fwnode);
+			return -EINVAL;
+		}
+
+		if (global->group_index_shift >= BITS_PER_LONG ||
+		    global->group_index_bits >
+		    BITS_PER_LONG - global->group_index_shift) {
 			pr_err("%pfwP: group index shift too big\n", fwnode);
 			return -EINVAL;
 		}

base-commit: 13ca1c0b7d8a3ab1e59cb3e780c1dd7441e22515


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
