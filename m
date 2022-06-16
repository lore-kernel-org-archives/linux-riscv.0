Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1500CCA481
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jun 2022 06:42:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4tKchvcuKSqu/i7RjjADqKrM34voz74WkUDY2bDZoto=; b=cfW7NfyZHmI4BO
	AgaEGzrGODRF4TzO6ne+e+KP1UgOg2f6wiYyvakCbDXpEUH+Yjm0M2zSUOzv4p8WVDVRB3zli4xy1
	bN7GKg5Gsu0XGDnm8pQkyOKsZUaoS4lqeIjtm5i4eFC4a9fNtzErb+JzXzLe9/weuEMnK7TPUYSDe
	DTCbNAUhJoy5yt9Ne9vTuAVeceiShYDZABxKTzXD9QvIDOVfArxi8zZnpNwyMVEa7s5JxV9uzlE1K
	46e4W6qXdmDQAgScf7qHv/Fv6PE0goOCewE/qwI01GPh+Wvb9h2oTkKWOlZdQEMLPfk5qjYetfeOY
	+HXQnUduy5ISlysygLjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jDH-000mrw-Fp; Thu, 16 Jun 2022 06:42:43 +0000
Received: from wout3-smtp.messagingengine.com ([64.147.123.19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1jBN-000laB-8N; Thu, 16 Jun 2022 06:40:46 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.west.internal (Postfix) with ESMTP id 7F21A3200B51;
	Thu, 16 Jun 2022 02:40:43 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Thu, 16 Jun 2022 02:40:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1655361643; x=1655448043; bh=gj
	1T9kOuDzjoImIENJ7o3y478sayKqN7VNgA40v4t4g=; b=ZY0Bkqv9Jl8jT1rhOj
	I0Ugo7w7e/5w3pVe+JYO+29DsD7PrKLEzIVs4ggHApAvRQRrsha+2p03y2zs9ncn
	lmEcff8nMGucoPe5HPT9FvWTE6bks+AwTBVPy42hCtiRgPuW+IwyRnOIHQKDnggi
	qeWCGUqEb+T053Teg0bG1fVeknqorKeiNjtq6ydNN+VEU/n094V8vLj+64TdvLki
	mcufMDvgYLdrh/7maeHz5vmoVGH+lVki9Nw018LZg5iBMOsdaLZJJvIDedqbcM5t
	WWqz4NRgatdtxn8i9VUITSSFugC4Iq+yOV6RFcqAPd5aLsB9rJQIGQAjRMeNnfbT
	x6Zw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1655361643; x=1655448043; bh=gj1T9kOuDzjoI
	mIENJ7o3y478sayKqN7VNgA40v4t4g=; b=R9lniPasK4ZzfWouh4JgWT5JIf+Js
	A68RoIg1OTtxZVHmuw2mCixiQ+RHue2VqzGy2bihKXYmXwuFsaf4WyFX7+Nn/AJq
	HgM22hTf9ONxha5vkqwpAnnp2WVSy9+iHOd6zjj4hrnTIDPCvithDpAu3hCuucJG
	FIm/JQCfwSigdy5xdKT18ePNeQnPIK3qGL5mI0uoahx0CSFwLp1+OeWah58iLpSP
	73d/Ea0zCBpmolHPOWh6jANDffFE2KSs3g02sJeTPJPafuTbHAJmK9+HlI/iPsHv
	+h+EcZSdTVaCVOwYWhZPJqevNtSAhNgVlWDmaRFeccma0qbLueGYvhhhw==
X-ME-Sender: <xms:atCqYuUtCs3VHnZS5MFOiJVxjyPwth4d5lOQYGavL9OncrIRtFT4bg>
    <xme:atCqYqlko5_axUa1aAP80qjgPq72LOdLs6962kAl7P-9ikJqvYmHhGODGAn_AyyAR
    6zCIgc6wdhuMc7nOQ>
X-ME-Received: <xmr:atCqYiYKLhbKqfbZiLOqmHIwmEC6vpzoNrKXVGqYO9M2W2D8yy2LVQPf_fe0JifN85WXaXBzAg3xXyY5PpBVBdWqrvd4iRM7CqfmTPR069shznEkRmvFdZQKCOrlmXA7WwcVrw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedruddvvddguddtlecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghm
    uhgvlhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenuc
    ggtffrrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeeh
    gfdufeeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfh
    hrohhmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:atCqYlXio2KsAw3QZ7QXmnl0qNCf3Z42EPQsLLzzwvgHXedksBXamQ>
    <xmx:atCqYomAv9WIlI5gWpKkzVjT1PZxj7rrEn2zLssbNQYHlyhJHVFEGw>
    <xmx:atCqYqdsN92KQ8YGA0XkBLRTuZ5qbzPaWJsfPQicNg4NfKYP3KRMHQ>
    <xmx:a9CqYj_JXZYvmoz9w5Ia_TJxgJg1p6D0OsUmqP4uKxIr4cTKdnApOw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 16 Jun 2022 02:40:42 -0400 (EDT)
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
Subject: [PATCH v2 4/6] genirq: Provide an IRQ affinity mask in non-SMP configs
Date: Thu, 16 Jun 2022 01:40:26 -0500
Message-Id: <20220616064028.57933-5-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616064028.57933-1-samuel@sholland.org>
References: <20220616064028.57933-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_234045_377296_711C9465 
X-CRM114-Status: UNSURE (   9.77  )
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

IRQ affinity masks are not allocated in uniprocessor configurations.
This requires special case non-SMP code in drivers for irqchips which
have per-CPU enable or mask registers.

Since IRQ affinity is always the same in a uniprocessor configuration,
we can still provide the correct affinity mask without allocating one
per IRQ. We can reuse the system-wide cpu_possible_mask.

By returning a real cpumask from irq_data_get_affinity_mask even when
SMP is disabled, irqchip drivers which iterate over that mask will
automatically do the right thing.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 include/linux/irq.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 69ee4e2f36ce..d5e958b026aa 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -151,7 +151,9 @@ struct irq_common_data {
 #endif
 	void			*handler_data;
 	struct msi_desc		*msi_desc;
+#ifdef CONFIG_SMP
 	cpumask_var_t		affinity;
+#endif
 #ifdef CONFIG_GENERIC_IRQ_EFFECTIVE_AFF_MASK
 	cpumask_var_t		effective_affinity;
 #endif
@@ -881,7 +883,11 @@ static inline int irq_data_get_node(struct irq_data *d)
 
 static inline struct cpumask *irq_data_get_affinity_mask(struct irq_data *d)
 {
+#ifdef CONFIG_SMP
 	return d->common->affinity;
+#else
+	return &__cpu_possible_mask;
+#endif
 }
 
 static inline struct cpumask *irq_get_affinity_mask(int irq)
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
