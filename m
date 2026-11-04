Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D697606A328
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 14:22:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=oxDoZq3K;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=lnGD52sa
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=Ti1uN34hOEtDQ7RoIOBKTWSs2X8KqCYM0+tcoQ0mMfY=; b=oxDoZq3K640Li+cz9iu6e0pkw+
	60JGefSuLDk+BLteGqHDcX2tg1RWOgC2m7CfK7vNeVpIvTZ0e23UhJNEiB+jB/BSj4g2VL/T7F/7T
	3RDUwZZGnl+LqACCzUWEQQVPkQsXGD941gUL4CfN4YZPdkN0VOyBfd3HVd3Ul48NN029OglMRzNur
	U304y+mB8HIMckmVqAZBnROTBTwK2FWadG0u9GKQuSQn2bx2phvmJcbxQB/N9x/froFSSAj6Qj4Io
	51+4adPBqQuBxhjQrwZtCYT60I4P3Du4u032K4YUcycWTuQkR4apfZyBwsEeXsr4FWGqQtib8VCUP
	1djSILVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObsB-00000005c2y-0YGJ;
	Wed, 04 Nov 2026 14:21:55 +0000
Received: from out-191.mta0.migadu.com ([2001:41d0:1004:224b::bf] helo=mta0.migadu.com)
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObs8-00000005c1q-0ck9
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 14:21:53 +0000
X-Envelope-To: linux-riscv@lists.infradead.org
DKIM-Signature: a=rsa-sha256; bh=jDeSXWBLkiDEIo9mIW3HLqLNQ8245vFAegvkXKNefFg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793802108; v=1; x=1794406908;
 b=lnGD52samrfS3MBuIirWqCYJAwbYi7EdNvm2dHwOTKGwm5B6/vXhxGDipWWKryvxzeY/LocX
 w+F0pUczOgs90xL3vTWGTgQLzwFDPsMjyTJk29JX4ZQpeFPFE4gyzkvPhxDmj4ByJsRFHEJmvip
 maWLJUXkLxo51o9O+YEUxc5I=
X-Envelope-To: linux-riscv@lists.infradead.org
Received: by mta10.migadu.com with ESMTPS id 3a1212f53063606c;
	Wed, 04 Nov 2026 14:21:48 +0000
X-Mizu-Trace-ID: 3a1212f53063606c
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Date: Wed, 04 Nov 2026 14:21:40 +0000
Subject: [PATCH] irqchip/riscv-aplic: Process pending affinity changes on
 EOI
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261104-aplic-affinity-fix-v1-1-e538cd76e563@linux.dev>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQrCMBCF4auUWTswNlKMVxEXSTrREYklScUSe
 veOdvk9eH+Dwlm4wKVrkPkjRd5JcTx0EB4u3RllVENP/UCWLLrpJQFdjJKkLhjli2dyJ2/Ij2Q
 Y9Dhl1vkfvd52l9k/OdRfCdZ1A2qOKu92AAAA
X-Change-ID: 20260909-aplic-affinity-fix-80a4b30bd03e
To: Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>, 
 Radu Rendec <radu@rendec.net>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Anup Patel <apatel@ventanamicro.com>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1784;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=jDeSXWBLkiDEIo9mIW3HLqLNQ8245vFAegvkXKNefFg=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmv7UtP7dqQLHRn+s1Zf/VuWa25m3Q0YNL0NwFards2R
 /2IETrwqqOUhUGMi0FWTJGl+wHPtgKfKNsCgUJfmDmsTCBDGLg4BWAiVXMZ/qc9SK0slw07MPl2
 xsMV3V3Fc8I7JubuudlxNW7mPQVrfSZGhvOZ9+z+pa82zN7z1YktLsv86Iq0mjcdx/YXP6ln4al
 o4AEA
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_062152_407181_BC48CD85 
X-CRM114-Status: UNSURE (   9.98  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

IMSIC rejects an affinity change with -EBUSY while a previous vector
move is still in flight, and the IRQ core then records the new mask as
pending. The change is meant to be applied by irq_move_irq() in the
IMSIC irq_ack callback, but APLIC MSI interrupts are handled by
handle_fasteoi_irq(), which does not call irq_ack.

The pending change is therefore never applied. While it is pending,
later affinity changes only update the pending mask, so the interrupt
stays on its old CPU.

Call the parent's irq_ack from the EOI callback, before retriggering
level sources so that they fire at the updated target.

Fixes: 58d868b67a9a ("RISC-V: Select CONFIG_GENERIC_PENDING_IRQ")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
 drivers/irqchip/irq-riscv-aplic-msi.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-aplic-msi.c b/drivers/irqchip/irq-riscv-aplic-msi.c
index fb8d1838609f..a10cc1fb50c2 100644
--- a/drivers/irqchip/irq-riscv-aplic-msi.c
+++ b/drivers/irqchip/irq-riscv-aplic-msi.c
@@ -57,9 +57,12 @@ static void aplic_msi_irq_retrigger_level(struct irq_data *d)
 static void aplic_msi_irq_eoi(struct irq_data *d)
 {
 	/*
-	 * EOI handling is required only for level-triggered interrupts
-	 * when APLIC is in MSI mode.
+	 * The fasteoi flow does not call irq_ack. Let the IMSIC parent
+	 * process affinity moves deferred while its previous vector move
+	 * was still in flight. Both edge and level sources need this.
 	 */
+	irq_chip_ack_parent(d);
+
 	aplic_msi_irq_retrigger_level(d);
 }
 

---
base-commit: 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4
change-id: 20260909-aplic-affinity-fix-80a4b30bd03e

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
