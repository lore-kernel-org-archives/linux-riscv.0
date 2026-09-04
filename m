Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC01CC61DD6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Sep 2026 14:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fOtreflkM7uNSOtKOMag/8ql1VDur/J2sudXBaL+kSg=; b=lzOOtTy8EZZ6Zs
	qtL2qJJK+ejjW5GYGmbdYSlf9ryMXhv2Qvt9trRxa7BF0l6reOp2pFZxeiut54c3wsDSswpB4W1j2
	rlVEYplMeHPBKK5VsdEGJvUgsN4RC71pw785fu6uQ/0eEwNWi30xkwRXp3clV5FdPBlMiTFvcXxFl
	I6CKgmp1iGm9NLn3xNtof5l5y8rHf2ZCnA6wqqCIH0sew6kYiSryA+b+GExNiPCnrYIAiK61lCrU/
	WD+fR80qOicRGpJFhBtgifxOujJnEnCAHNlHL0zQPcq1IcyMwdsSnWqrD+DoMo/61nd1k5NFQxUiY
	76Ruhxk4B/4QqW9EHfPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Uxo-00000002ORv-0f4N;
	Fri, 04 Sep 2026 14:32:20 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2Uxm-00000002ORS-30PT
	for linux-riscv@lists.infradead.org;
	Fri, 04 Sep 2026 14:32:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 98913600C8;
	Fri,  4 Sep 2026 14:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3EDA1F00A3D;
	Fri,  4 Sep 2026 14:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788532336;
	bh=d+O012cIavAI0ujYW26k+aWCjKOSb9qbSR86lFvYnd8=;
	h=From:Date:Subject:To:Cc;
	b=UmiBxtgR/T5raT7CoumzmJ48BTwWw3sMkg6cNt4bB5zYgVpj5dRAHBqZWRh3v1gCl
	 rWTq5EdiUBYt19DdfvTfFvSHbkBqZ6rpIjVC+bPRfRetVndmYbleq7zRGCbAGtxVdH
	 qCEN/TudGyUPlNpBrH7VdxZSCqTsZFhEn5ILb4GtzH3bS1qFIwohbi4xbKMGJwQDbo
	 LK4kunEQAyBYgEflA8s1va6+nmBdXxNTd5GVH5qyb41UhTPcBYOLHVKoUEBIsSt1di
	 gS/Y032GIR1ez3J3ymUqgiQxa8yEEYAShWf1A3zo4nM6Ro5QKAosixsAuE+Z0U8BC/
	 8xSf8IYBs0Bfw==
From: "GUO Ren (XuanTie)" <guoren@kernel.org>
Date: Fri, 04 Sep 2026 14:31:38 +0000
Subject: [PATCH] irqchip/riscv-imsic: Fix MMIO regset lookup loop bound
MIME-Version: 1.0
Message-Id: <20260904-nr_mmios-v1-1-3a19dc74fab8@kernel.org>
X-B4-Tracking: v=1; b=H4sIAEnWmmoC/yXM7QpAQBCF4VvR/La1FhtuRZKPwShLO0ht7t3i5
 1PvOQ4YLSFDETiweBLTajyiMIBuasyIgnpvUFJpmctEGFsvC60sMp1hrPMeVdqCzzeLA13fVVn
 95qOdsdvfPdz3A1ncUOVsAAAA
X-Change-ID: 20260904-nr_mmios-868e369de25b
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 "GUO Ren (XuanTie)" <guoren@kernel.org>
X-Mailer: b4 0.16.0
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

The nr_mmios is the number of entries in the MMIO resource array, while
j is the index used to iterate over the array. Testing nr_mmios directly
makes the loop condition permanently true whenever at least one MMIO
region exists.

So, change
  for (j = 0; nr_mmios; j++) {
to
  for (j = 0; j < nr_mmios; j++) {

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Cc: stable@vger.kernel.org
Signed-off-by: GUO Ren (XuanTie) <guoren@kernel.org>
---
This patch fixes an out-of-bounds access in the RISC-V IMSIC MMIO
resource lookup.
---
 drivers/irqchip/irq-riscv-imsic-state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbbf42f7..008dfcf343e5 100644
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

---
base-commit: bc35965f6940a9bf834d54187b6088b8eb09206d
change-id: 20260904-nr_mmios-868e369de25b

Best regards,
--  
GUO Ren (XuanTie) <guoren@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
