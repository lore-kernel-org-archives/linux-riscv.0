Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EA9AC4167B
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 23:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uR/P6Vs8nPt986Ylh+mSK6oSnQYOpJQhBJT4a/CyZic=; b=JcAAK5aAvScXG+
	zE15R4Bwm/Ac3gzdmBRPX0zcX9OXLXwBzCj0ovPXFTExq7rKrsYPA2keajd/yyEH6K5ZIP/NUtlfX
	91vyt5woNfxrj+N1OwVW7sbz3f5hpHe2lYEjMiD+ZDrAtm9vmoatyvlmfO4CLpAvEAt3WO/6zg2Gx
	fs5U9sRvRevBpG7NOJGh77+sQ/pr93/xactetQR0GqHYD8wKejuxRZohmCh60opX2dGQh7cFCuhsD
	4+pQsFBZxWptoFXbWIv4HAavJJDydO9wE76EYF46GLOOmlUNeH3e8EWGBtacDwqeGsUssxgc/d3mK
	FlVKQxmrO8bWFbMN7euQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz4o1-008cHK-9O; Sat, 26 Nov 2022 23:41:57 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz4nr-008cAE-Og
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 23:41:51 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 5FC1E5C0089;
	Sat, 26 Nov 2022 18:41:38 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sat, 26 Nov 2022 18:41:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669506098; x=1669592498; bh=Zv
	VBWKmSl7xxBZYvHtE90BQ1WRQAgayEAOP6BQlkaCs=; b=SjgYiyY/+S4zUa5tKl
	Cq5BDioncqCbaLz6IfExhT6rEGVgTVEiY5XMUgFwJxUrObXfQLGmIwj8iQEjFKyX
	QrVM1/rjS5gGEMgjOQiADW+SfFvVKkzUAQgsfTl7asHghlW5mq21olV/bVA6A2EX
	+rnAyzBsG73Wewm01Cm/269UOTFslFtKHtzUyLm3rf7+hMf69l+EAACCbBkEqA8S
	VJJ8l0SlXSU/03OXmAvUlkcbFbcgupNce2G029DKafKMuJtbvEaec+jcpxRGnhMy
	yHhbomkpg4kiBweYpEGKwaqaWRO7V22WfVSdFiZ3svsH4Rid8ccWx20KXWBc3u4r
	Lg6Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669506098; x=1669592498; bh=ZvVBWKmSl7xxB
	ZYvHtE90BQ1WRQAgayEAOP6BQlkaCs=; b=WCctj4ZJYSG7ke3JogAFaH9a/pYC/
	7GsYbN8g6AALi2DTzuxojVpXOnPUqvm03CjDmT8fdPfOKZGChQsXe7wrRhMSnnC9
	49qvAadRQP8i2yzKoiG81avxhxdTQahft6x7+EiSuZawW5n8/8/olEOxL+Hfh6l2
	lajEZPV3grAgD4refxGVtfE1Xgl1JUbXE/wc2ZW7VGmtU6idt0Ur5VtY6QG2SMeU
	JqX+J9snBGFR9lbwyASwMGoG4z1JK/0u76h+o2m9X9EHmSbTSKpkLvtYjIzSQSVK
	zFAePkQG5Gcr5ShRHYUezadsyK+z4tbl+LUpyi+PEwpjTPyUorcK3KWPg==
X-ME-Sender: <xms:MqSCY9B-FENv_eqkZAUwGqUqD5B8sWa5g1k1AZLTdmPgAbfjPzZZsw>
    <xme:MqSCY7j6Xok--YmazErBxtqqZVvKCZvifdS8xDEzHdqtcGs_fuUuHslLDhSSWI3l2
    Dk33wXsGU9m9FCsLQ>
X-ME-Received: <xmr:MqSCY4losntSoYFpbxUgRt0fc0CFspVEAsmBOC0XZKnx3Guj96kdsFh_SUTxZxhXETx5h7wpAGplB-groRo74bfu8zbyXSEScIaG-NINJlG9NKW3VYT9zufMSEmQINbE6TF1Gw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieekgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:MqSCY3wEEWaUqVRcLnPDmo7IM1XgwxJjHZD74rNja4H99mruYjdMAw>
    <xmx:MqSCYyQV2qWEeHIH0xuB7899CoBhC36r-pPTWDS2xCLaMagUvbPRSA>
    <xmx:MqSCY6b078JbGq8EKCFdPKnC4WOGgVSRrlKnIS-nm7d_jo21vjAoOA>
    <xmx:MqSCY_IMnnEQlaG2zq3YbO5f0ghI90dn5A34o4-siQaneOUfnHrQCg>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Nov 2022 18:41:37 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] genirq: Add support for oneshot-safe threaded EOIs
Date: Sat, 26 Nov 2022 17:41:33 -0600
Message-Id: <20221126234134.32660-3-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221126234134.32660-1-samuel@sholland.org>
References: <20221126234134.32660-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_154148_460299_6B1DA3CE 
X-CRM114-Status: GOOD (  15.55  )
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

For irqchips such as the SiFive PLIC with a claim/EOI flow, each IRQ is
implicitly masked during the claim operation and unmasked after the EOI.
By delaying the EOI until after the thread runs, we can support threaded
IRQs without any explicit mask/unmask operations.

irqchips can declare this capability using the combination of flags
IRQCHIP_ONESHOT_SAFE | IRQCHIP_EOI_THREADED.

In this case, we still set IRQF_ONESHOT and thus action->thread_mask, so
we know based on desc->threads_oneshot when to send the EOI. However, we
do not set IRQS_ONESHOT, so we skip the actual mask/unmask operations.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 kernel/irq/chip.c   |  4 +++-
 kernel/irq/manage.c | 15 ++++++++++-----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/kernel/irq/chip.c b/kernel/irq/chip.c
index 672bad021a1f..7a4b3fa85da0 100644
--- a/kernel/irq/chip.c
+++ b/kernel/irq/chip.c
@@ -446,7 +446,9 @@ void unmask_threaded_irq(struct irq_desc *desc)
 	if (chip->flags & IRQCHIP_EOI_THREADED)
 		chip->irq_eoi(&desc->irq_data);
 
-	unmask_irq(desc);
+	if (!irqd_irq_disabled(&desc->irq_data) &&
+	    (desc->istate & IRQS_ONESHOT))
+		unmask_irq(desc);
 }
 
 /*
diff --git a/kernel/irq/manage.c b/kernel/irq/manage.c
index 40fe7806cc8c..b9edb66428cd 100644
--- a/kernel/irq/manage.c
+++ b/kernel/irq/manage.c
@@ -1074,9 +1074,10 @@ static int irq_wait_for_interrupt(struct irqaction *action)
 static void irq_finalize_oneshot(struct irq_desc *desc,
 				 struct irqaction *action)
 {
-	if (!(desc->istate & IRQS_ONESHOT) ||
+	if (!(action->flags & IRQF_ONESHOT) ||
 	    action->handler == irq_forced_secondary_handler)
 		return;
+
 again:
 	chip_bus_lock(desc);
 	raw_spin_lock_irq(&desc->lock);
@@ -1112,8 +1113,7 @@ static void irq_finalize_oneshot(struct irq_desc *desc,
 
 	desc->threads_oneshot &= ~action->thread_mask;
 
-	if (!desc->threads_oneshot && !irqd_irq_disabled(&desc->irq_data) &&
-	    irqd_irq_masked(&desc->irq_data))
+	if (!desc->threads_oneshot)
 		unmask_threaded_irq(desc);
 
 out_unlock:
@@ -1565,8 +1565,12 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 	 * MSI based interrupts are per se one shot safe. Check the
 	 * chip flags, so we can avoid the unmask dance at the end of
 	 * the threaded handler for those.
+	 *
+	 * If IRQCHIP_EOI_THREADED is also set, we do an EOI dance
+	 * instead of a mask/unmask dance.
 	 */
-	if (desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE)
+	if (desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE &&
+	    !(desc->irq_data.chip->flags & IRQCHIP_EOI_THREADED))
 		new->flags &= ~IRQF_ONESHOT;
 
 	/*
@@ -1755,7 +1759,8 @@ __setup_irq(unsigned int irq, struct irq_desc *desc, struct irqaction *new)
 		if (noirqdebug)
 			irq_settings_set_no_debug(desc);
 
-		if (new->flags & IRQF_ONESHOT)
+		if (new->flags & IRQF_ONESHOT &&
+		    !(desc->irq_data.chip->flags & IRQCHIP_ONESHOT_SAFE))
 			desc->istate |= IRQS_ONESHOT;
 
 		/* Exclude IRQ from balancing if requested */
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
