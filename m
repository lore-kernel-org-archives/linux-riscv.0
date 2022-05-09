Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80424C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 03:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K4pXl+VjuTqZzlPsY/I6Me0sjY3toP5NGIS+8Px1pys=; b=Ln83OPFCpVfOM8
	mh6AyjWYPLXIj312YCZGtJqmBXt2nmZHnKdjDQlg7nT1O8W3DubTWFB01YApp0oXQh+8hBSgCzv+w
	RRMU7fWeA2SAidIev0+JnQ0ZcFbJgKNrVIeUiFnuqJnzmNa1BPmuMj68TEihL780n5EnQpingYcI1
	jd9jxRJZUGfeFleVF/jJXNA8qg2BxhHesEjXaxEB1gdKwGnY+zXeNzg+SEWHAJ4FFkxFPljmKHMPB
	Q24QUcgCOSJYKKpXBm0vsAE5buQVHImr6y6oSDZVoiE+dov6Pn36BEwkZsuANHQfTmx6lGP+hQnyb
	S13z2MrdqhKU4TOAIRjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnuJW-00CDlt-JP; Mon, 09 May 2022 03:44:02 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnuJC-00CDfl-4R; Mon, 09 May 2022 03:43:43 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
 by mailout.nyi.internal (Postfix) with ESMTP id 791A35C008E;
 Sun,  8 May 2022 23:43:39 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute5.internal (MEProxy); Sun, 08 May 2022 23:43:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1652067819; x=1652154219; bh=ms
 qaI6htjko0o6Rwzc8TtNjGSkoayAQlCj6N0SQz54I=; b=lRTlGsZ9kxDxUh0qCb
 EjjgtT9tAhe08Ty5rMNqmz0PJQdBvU+irvbX7bSxciyGGNjk1hmVJFEd9xWI2aCz
 Gpq3Pj1O1KNnuw/nb945TN83GP9L6XGngDUzHDfQk6m9gLWIneK3EM6XPeT+ESbP
 ieAY5ehvtUJ8dmOCbnOHSOkj5rapT7s/drrrw0yjQNlrB2IWR+HfjX9S8cQoEMUN
 ctAMfIEvozkjk4v2RQqOrYMV11FvJxfqI5qkl05CgMPDqIIsBlZoXcwLj8NXoy7P
 Bz+8DZqKvvuXkfyP4OC6aFMrwpo6wmPAtRYJVXjZZyHnkZy/uRGk4+VQSppQbXr5
 z7Vw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1652067819; x=1652154219; bh=msqaI6htjko0o6Rwzc8TtNjGSkoayAQlCj6
 N0SQz54I=; b=hoKbVwFI3G/m5K1WVbeWY1q4VPgRTN1HRYgkS5EdHixn/yiHriF
 FBvaTsmU8I6rStGtmQIkEudQYu/No1b+ZqHDFPq8pnNLYUb93wSqIQ4HZRn/Lvsg
 kOvPrxaV4fXReWjRoOzBi2PdpYPSiPJFVtq1tW5vCA7hNdUT5HihiTN2FrbYseGk
 vHlv11W5RHS0IYzQTeYWPGBBhOVBddd4057X5iyr0Os/15W0IUWn4dUBwHkhXFS8
 WrW+Kv0jGtGOrb2nnJwH4/47eEo9XVilr7+KlLjh5tcSdohSTKPArS+i9W1HmzTr
 J6jeH13qrkSQamxVk0XUxugVwdWe/nuGcHw==
X-ME-Sender: <xms:6414YksMW7cpWEIYuM-zvUPARGoIu79gT36Tkj9zdTcKYqDZEpqt_A>
 <xme:6414Yhe66YWntqsrVjGIIso8BU2IJL6e9MJ-9RXeKxFNXeQdtiXbrk415D7uIxihk
 a15GIw9rEYtiI4RwQ>
X-ME-Received: <xmr:6414Yvw9SXimNlxMb0ddnhGce4Eir7V13si8gO-wGgDnn-WwgWsMR3TbssiCazOYwyTXXAmblDvHtVeH2Ec0a_gyvHsR_ZIUw3ZMSVyC1IrkXBBEA0sJdZWi5NgiyMJ3ozpy9A>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgdejhecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:6414YnM4E_axMnt9oYwuymYZpwmrANSIYLY_m6mJBgThxbIHcK-jkg>
 <xmx:6414Yk8fLgvQtrQXokzTxUJD5iZaqN204LZWucdOQljTCRONosBsdQ>
 <xmx:6414YvXqfhL-C-gAXUjt6XRdrz3ipCVbhIBOKNRttJkw7g7XQGrDdw>
 <xmx:6414Yuca92C7IsGa6t_7ocOER7C9SWIGX7h172dh9aYTZ25Hqb5fQQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 May 2022 23:43:38 -0400 (EDT)
From: Samuel Holland <samuel@sholland.org>
To: Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
 Florian Fainelli <f.fainelli@gmail.com>, Guo Ren <guoren@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Russell King <linux@armlinux.org.uk>,
 Wei Xu <xuwei5@hisilicon.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 3/5] genirq: Provide an IRQ affinity mask in non-SMP configs
Date: Sun,  8 May 2022 22:43:31 -0500
Message-Id: <20220509034333.60017-4-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509034333.60017-1-samuel@sholland.org>
References: <20220509034333.60017-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_204342_764467_FBEF213C 
X-CRM114-Status: GOOD (  10.13  )
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

 include/linux/irq.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 48ac33ca3703..d716e882c020 100644
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
@@ -879,7 +881,11 @@ static inline int irq_data_get_node(struct irq_data *d)
 
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
