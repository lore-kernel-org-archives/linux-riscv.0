Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F61C43458
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKpxckBGZfaCEC2nySWqu7CWHqli6oiav0iisw55MOY=; b=WN26sili7xvneY
	uOnQyfGFxzj42UBcAG24dSd8T0wIJJ0ZrvjSFhj7hmlhqSH8907U1c6+KPUflXtrsxMEkIqRVXKxA
	4YCUSJrMRFefX1D2G7LPOm0uWSzQw94t2jUy9W6vH4jNKdD7lS5gmxU5KsMJXgE948dnMyN3a7G/N
	s3tOichpstrJvFxkdbh3etkAxcNJO4YELrHiMf7lO3FR5vKXMzDw3vhpqYFyqOSuA/iBCRQt+bfpU
	Dr4U8SbwpysYkx/vl3MMo5hGYUoAQy621shm7s/HcuZlM5ztrQQnTuBQdohmL4jOZR6kIqXA6aAUt
	kfYBlanhGeGB24uV6sKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcBo-0000000Bum0-0d0D;
	Tue, 14 Jul 2026 12:24:44 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcBj-0000000Bujn-31jq
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 12:24:41 +0000
X-UUID: f46a8cfa7f7e11f1aa26b74ffac11d73-20260714
X-CID-CACHE: Type:Local,Time:202607142005+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:97bba100-5393-4cde-9e6a-9f2066dbda17,IP:0,U
	RL:0,TC:0,Content:0,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:25
X-CID-META: VersionHash:e7bac3a,CLOUDID:e7242f31818d5b5303ea2aba952c0309,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|102|850|865|898,TC:nil,Content:0|1
	5|50,EDM:5,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:
	0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f46a8cfa7f7e11f1aa26b74ffac11d73-20260714
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 415656572; Tue, 14 Jul 2026 20:24:26 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 01/16] irqchip/riscv-imsic: fix MMIO lookup OOB and NULL cleanup
Date: Tue, 14 Jul 2026 20:23:36 +0800
Message-Id: <20260714122351.3274006-2-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
References: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052440_071116_094D4720 
X-CRM114-Status: UNSURE (   9.49  )
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

The MSI page lookup loop uses:

	for (j = 0; nr_mmios; j++)

When nr_mmios is non-zero the condition is always true, so j is never
bounded. If reloff does not fall in any MMIO region the loop indexes
past mmios[] and may hang or fault.

Also, mmios_va starts as NULL. If its allocation fails, the out_iounmap
path indexes mmios_va[i] and NULL-dereferences.

Bound the loop with j < nr_mmios, and guard the iounmap/kfree cleanup
with if (mmios_va).

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Signed-off-by: Haofeng Li <lihaofeng@kylinos.cn>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbbf42f7..19f74cf79988 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -896,7 +896,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		index = nr_mmios;
 		reloff = i * BIT(global->guest_index_bits) *
 			 IMSIC_MMIO_PAGE_SZ;
-		for (j = 0; nr_mmios; j++) {
+		for (j = 0; j < nr_mmios; j++) {
 			if (reloff < resource_size(&mmios[j])) {
 				index = j;
 				break;
@@ -953,11 +953,13 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 out_local_cleanup:
 	imsic_local_cleanup();
 out_iounmap:
-	for (i = 0; i < nr_mmios; i++) {
-		if (mmios_va[i])
-			iounmap(mmios_va[i]);
+	if (mmios_va) {
+		for (i = 0; i < nr_mmios; i++) {
+			if (mmios_va[i])
+				iounmap(mmios_va[i]);
+		}
+		kfree(mmios_va);
 	}
-	kfree(mmios_va);
 	kfree(mmios);
 out_free_local:
 	free_percpu(imsic->global.local);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
