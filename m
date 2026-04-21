Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75005F8FA8E
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Apr 2026 14:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LEhroJrzU4sAj/+2DQozO8g4J9onh+HtNV+n5QnrZn8=; b=RCz9WEqOo/NQCg
	V1ehjTI4SOepEkwMKSz7PwjHAH/bjV5C1EZFcmnsFfkwadngRiuglmD0Lc0aUJ+nssFw5sBK03Fc5
	46dCVmGg2fXvb9ZU8Qy6xfHr30iDiJ/I4cUGVYVbk+JhQKnjwpfS6YfZnV9VCQklOlbu0SKZms1UY
	PkFwsyXfiy58fLwLuZdBV3+hRjwVTkt8tSBhbWAPEX+bFjAu3w8z7wEc5xJ/eKbKwhoUNgXKQ+hHb
	Ty+EvXbZJVsI+7p/vhvmZQq2QfppeFGuYF1wB5nC78CD6znZt8vPOQwtws6pAhklANGu0RR+ndfVh
	5zEY+KuQ8Z5PnxWV0EDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCW3-00000008n8j-3CxD;
	Tue, 21 Apr 2026 14:55:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFCW1-00000008n7C-0Mp4;
	Tue, 21 Apr 2026 14:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6735E4050F;
	Tue, 21 Apr 2026 14:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A0E6C2BCB3;
	Tue, 21 Apr 2026 14:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776783352;
	bh=LzybNtmwcAXgm9BgLJOpSrnqzmHYslQqL5sDqIK9kPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hp74uKbbIdji4/h2Sqr21wnLG49d9FJCzpazfT0b0VVLIrhZbyv4sVl0ENuncTPjI
	 u4T8qXRDy35xN+TUMmAsw2qeG0pMa9h1tkGuk6jZOCLsvTt/gcSFUMetZIYi5PxW+Q
	 5uBqN/TCaalGNMuJh18NcQ5zTQu9ISR/3mAcqZJU3dJl9k7QGYI2q+KMnGAMmDCCBD
	 R7RjLHj0xhgVkNn62O+uy8Q69Vclrkwv2Ta4ou9JubWwvb+YniN+hJYYURQDbEwjWZ
	 yRdvZaiYy6+xxfjntrAb6m6YcbSEI93gQx7J4Gh6Qhuv3MICpZv02FBvpi4guGfsP5
	 78AKlIKP7DacA==
From: guoren@kernel.org
To: fangyu.yu@linux.alibaba.com,
	cp0613@linux.alibaba.com,
	inochiama@gmail.com,
	me@ziyao.cc,
	gaohan@iscas.ac.cn,
	anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	tglx@kernel.org,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] irqchip/riscv-imsic: Remove global nr_guest_files after KVM AIA per-HART conversion
Date: Tue, 21 Apr 2026 10:54:50 -0400
Message-Id: <20260421145451.1597930-4-guoren@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20260421145451.1597930-1-guoren@kernel.org>
References: <20260421145451.1597930-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_075553_227677_40A1A831 
X-CRM114-Status: GOOD (  13.97  )
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

From: "Guo Ren (Alibaba DAMO Academy)" <guoren@kernel.org>

With the recent KVM AIA changes, HGEI line management is now fully
per-CPU (via struct aia_hgei_control::nr_hgei) and the global
kvm_riscv_aia_nr_hgei has been replaced by a simple enabled flag.
The IMSIC driver no longer needs to compute and enforce a global
minimum number of guest interrupt files across all HARTs.

Remove:
 - `u32 nr_guest_files` from `struct imsic_global_config`
 - the initial `BIT(global->guest_index_bits) - 1` assignment
 - the entire per-CPU MMIO-based min() calculation and its comment
   (which was specifically there to protect old KVM)

The per-HART guest file count is already handled locally in
`imsic_local_config` during the parent IRQ loop, so this global
field was redundant.

This completes the cleanup series, eliminates the last global
assumption about guest files, and improves support for heterogeneous
(big.LITTLE / multi-vendor) RISC-V platforms.

Signed-off-by: Guo Ren (Alibaba DAMO Academy) <guoren@kernel.org>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 12 +-----------
 include/linux/irqchip/riscv-imsic.h     |  3 ---
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index e3ed874d89e7..fef27247a34f 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -784,7 +784,7 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 
 int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 {
-	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_guest_files, nr_handlers = 0;
+	u32 i, j, index, nr_parent_irqs, nr_mmios, nr_handlers = 0;
 	struct imsic_global_config *global;
 	struct imsic_local_config *local;
 	void __iomem **mmios_va = NULL;
@@ -878,7 +878,6 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 	}
 
 	/* Configure handlers for target CPUs */
-	global->nr_guest_files = BIT(global->guest_index_bits) - 1;
 	for (i = 0; i < nr_parent_irqs; i++) {
 		rc = imsic_get_parent_hartid(fwnode, i, &hartid);
 		if (rc) {
@@ -919,15 +918,6 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		local->msi_pa = mmios[index].start + reloff;
 		local->msi_va = mmios_va[index] + reloff;
 
-		/*
-		 * KVM uses global->nr_guest_files to determine the available guest
-		 * interrupt files on each CPU. Take the minimum number of guest
-		 * interrupt files across all CPUs to avoid KVM incorrectly allocating
-		 * an unexisted or unmapped guest interrupt file on some CPUs.
-		 */
-		nr_guest_files = (resource_size(&mmios[index]) - reloff) / IMSIC_MMIO_PAGE_SZ - 1;
-		global->nr_guest_files = min(global->nr_guest_files, nr_guest_files);
-
 		nr_handlers++;
 	}
 
diff --git a/include/linux/irqchip/riscv-imsic.h b/include/linux/irqchip/riscv-imsic.h
index 4b348836de7a..7f3ff5c5ea53 100644
--- a/include/linux/irqchip/riscv-imsic.h
+++ b/include/linux/irqchip/riscv-imsic.h
@@ -68,9 +68,6 @@ struct imsic_global_config {
 	/* Number of guest interrupt identities */
 	u32					nr_guest_ids;
 
-	/* Number of guest interrupt files per core */
-	u32					nr_guest_files;
-
 	/* Per-CPU IMSIC addresses */
 	struct imsic_local_config __percpu	*local;
 };
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
