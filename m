Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4078CCA47A
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 06:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UTcrg0KTDz9211oVCBabBvWdrkUPubMrElpKisYxn0w=; b=jtwIvqeqSJJeCC
	+Y9E9DHzQzFpLzGgI/Rq/3QlBu2P2YoDGCfGFXTFx9XGG6R5RSmJejq5YFa7Uh3DacoMATlMUZ9m3
	peNttVmNm3bT2UDxg1lT9bb+Iv61/zDwDmN2YU8SbzgzML5LeWrruzZa/gTbYNDUvGfMBUabDx1Lw
	oM1VsDkySMjMWnbPvrSZ4LWxy/Rbxu6ySIlRUrJqCV4O4jzHsA4dhE7qtZ+aPMxbWy8WvYxW8MBtr
	a1MqkDHXpvH3FSUSskzbVqHqN5Du2AlDYKjrwHWXZTNMWkSIuRZA1n5N2Q7qzkrHFpQ81qu8fMEjp
	kPSpTABa7XtIDQK01LPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jCg-000mRr-K9; Thu, 16 Jun 2022 06:42:06 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jBK-000lZ4-AE; Thu, 16 Jun 2022 06:40:43 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.west.internal (Postfix) with ESMTP id 95DC83200B43;
	Thu, 16 Jun 2022 02:40:40 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Thu, 16 Jun 2022 02:40:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1655361640; x=1655448040; bh=SS
	qXvxPvOnT181Alnoj0HfgL9fqTJVzreJxmfCVyBec=; b=oYnboG+zKasPnYhcmW
	dynCHcJehxpEHTnfQHO6qLjEWfzyrkWbeUx5+5D+ofYkc43+x8REfT8NKo/hm0N4
	5xZagLzcD7IGxx/9NpRQQspTVtOr/nbbdcXbfV8uzQwQCn6Y0/74W9myRJJf7sF2
	joh1cx1aR95rQ9zI1DpuXrSnSWbj/oeacPnhCv9ERDRBVjWcvJDQIn2WCEKINmfF
	Of1l698RX5Txw0RX1XrKCAKolqtErfOo2KZKaoX/xLOkn7VzEKcaGtT+8iU3V1Pe
	ftoPqSLcVDzclziB1RzFVM3htixf8cPHFzrxWGyX+C52tXEAHq4v1rLxKMqC/mCq
	bK7g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1655361640; x=1655448040; bh=SSqXvxPvOnT18
	1Alnoj0HfgL9fqTJVzreJxmfCVyBec=; b=nf3VLf4F7VPSzlGyFshTu0cLDc8DX
	34/MuOAo/rIdDkexW5TUE2KXxADYpn5gSmrDgIrJDP1ig+OAy9b6aNUpK1RDrq0M
	XwKvUzvI6uOQGemdNalXHlb2l5bmNYmfeMWIA6ZEu2VmFIdwM5tYrvRAAiy9a9Eg
	IT5OIB4SrqXKkInfnGxVv3JK8+L6+sTzPR2fiTI0Mvgu+rSShh6pGS1gKS4P/M/I
	Rzmiaf4nbrycCehUn6H/V6KJxaMVQr3HWmsADecLQeYukRt1aJZ+MxDlh2NGUh1O
	4PNpE+lReN+9FkxuwHIqfG19SOXAq/Gqx/3k3ArvoJVceCak2sOwVgy3g==
X-ME-Sender: <xms:Z9CqYk3xDEXKWypUDEKsnpwA9-8qapa_z76yA5zHKLw10yiyMyDeFQ>
    <xme:Z9CqYvEHQIjXIKTuR0DXT2nQwO8SRKCRNM_AESN79xL-UMLv0FFTnZ52Y_pTfjzsA
    wKi6EEutdnK1CMJ3g>
X-ME-Received: <xmr:Z9CqYs4_8tFSPhHKRKJdZ7qLhT2hlSKjaSa3Xm3yulSf_KVMJN_Pw2zM7oH7uFpsMFotTxZAdDBv3KVuPHhyez6GvmInxfByDSOo7JPyyum0_7TgTuKItbffa2wCC4-eXq-m3A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddtkecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:aNCqYt2qQ8TpZAmCNIvIJiM-B-q1a5UprQz3-fKaflvvz8AUOlQ94Q>
    <xmx:aNCqYnESUsKMU92-oWUK3q4I8BxGPd68C8ZReWbZC-7kyrYpHvqfGQ>
    <xmx:aNCqYm_8lfglAWU4h6Zf9oPD369bkNrJSnFXcUA3m2P6NAiTsfzHKg>
    <xmx:aNCqYmcLWTd0LtSlAe4QF8fJUPB5nlXjQb25omNqyCTb49q6LK-w_g>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 02:40:39 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Guo Ren <guoren@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Wei Xu <xuwei5@hisilicon.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 3/6] genirq: Refactor accessors to use irq_data_get_affinity_mask
Date: Thu, 16 Jun 2022 01:40:25 -0500
Message-Id: <20220616064028.57933-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616064028.57933-1-samuel@sholland.org>
References: <20220616064028.57933-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_234042_430180_0AE10E02 
X-CRM114-Status: UNSURE (   9.99  )
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

A couple of functions directly reference the affinity mask. Route them
through irq_data_get_affinity_mask so they will pick up any refactoring
done there.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 include/linux/irq.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 505308253d23..69ee4e2f36ce 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -879,16 +879,16 @@ static inline int irq_data_get_node(struct irq_data *d)
 	return irq_common_data_get_node(d->common);
 }
 
-static inline struct cpumask *irq_get_affinity_mask(int irq)
+static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
 {
-	struct irq_data *d = irq_get_irq_data(irq);
-
-	return d ? d->common->affinity : NULL;
+	return d->common->affinity;
 }
 
-static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
+static inline struct cpumask *irq_get_affinity_mask(int irq)
 {
-	return d->common->affinity;
+	struct irq_data *d = irq_get_irq_data(irq);
+
+	return d ? irq_data_get_affinity_mask(d) : NULL;
 }
 
 #ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
@@ -910,7 +910,7 @@ static inline void irq_data_update_effective_affinity(struct irq_data *d,
 static inline
 struct cpumask *irq_data_get_effective_affinity_mask(struct irq_data *d)
 {
-	return d->common->affinity;
+	return irq_data_get_affinity_mask(d);
 }
 #endif
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
