Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CDDCC46467
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 23:42:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1jHCBsh2+lvL8sdKjWEQp5rg5x4wG3XEcxhNsAYm0o=; b=275//x1CGzTUzA
	vrE9C2KBaUMAz+zpphTOEX39MwT9Ohsoqk0AuuBhTGonb7vkH3+Lu2Nw6pTNHyWk6yTB+PeKDVfus
	43PGO21xLI0cTqfp8YaaRMhk/AbqDUfaTbH3UsBxfU6kg/xwDqaOR6gDYwiXtujrXXBVuiO8tM3l8
	uPHA55lNyhYedY6xC1bnvsHmq3QIAupcRgbv3fb8XxZwfls6JXs8ZxHotagazdnktXXAXTSyH05G1
	z5ob8aAX2x+B0yHZMgRkVpxNlZthxIBq0mQyj32Hs14ZCWoJl715bBwvs5Pp3qBW0ec4meXaMfgeo
	FhEsqJH+47DEJ/Lf0l7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz4nv-008cGC-PS; Sat, 26 Nov 2022 23:41:51 +0000
Received: from out1-smtp.messagingengine.com ([66.111.4.25])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oz4nr-008cAJ-Oh
	for linux-riscv@lists.infradead.org; Sat, 26 Nov 2022 23:41:50 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 5E14D5C008E;
	Sat, 26 Nov 2022 18:41:39 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Sat, 26 Nov 2022 18:41:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm2; t=1669506099; x=1669592499; bh=yC
	ipfaxvp8AqE8QMs96bMtJmPASK9bHZYxYCfkqHdhk=; b=asvuakl6YyLt4vtn55
	jwrccaQ/opR+wF/RCwaTPSW4saJF897p3Hck1RH3am8PyBwbO9WwKXv3u/aIDYnq
	xHIhLe5xb++/UEpHNCQAnYH/I23athqlgzmYKsfrruJKPtK5wZENCQcCE14vYVbB
	rzKodXK2s4nLTB6lupftAj86RDwMch2KknxRDOJlTAOlVCtzh288WxnM1cLyNPio
	IIExMha0ywYjfo7KJHeuAOuVfV2RLxuaksoCPH/t9p0xUfeuc59LQNH/ZrC9s8ML
	10/tzerxMLY8674c2wlZAXoDbNHpp6U5/HZV+89l5EYiB93wj8uMrrZ9KQ4NueMz
	UF5A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm1; t=1669506099; x=1669592499; bh=yCipfaxvp8AqE
	8QMs96bMtJmPASK9bHZYxYCfkqHdhk=; b=cPcfMZMCjmljy+g9iBLqCnorTMx+I
	hN/4fIDtJiN0hOAQ998vBsRPpT57/QVRdvzBEVSgQTqVgXBqoCOJepN0p/y98gc5
	aI9Zsn6hs2kpdG1OYYTh7FYG8zAJbTDnVzYBl/bY5On3Zadp1Pi0l0TIkzggTzGt
	tjUS4lmGJU5xlNJom/g17//+lWgrVEmfpjR5m5FAm75yukLHPLWhVemlHgHquix1
	Z96gD3w6I65GJtrRGaV96X/euHIEgpUHycZIjy+ofV146snV+G99f6qTVw6Qk6ie
	S+qYQC2Lk5bj1cGJm7AwTxvLW8jnS2opR3DILie6JBUipDjtM2M8EuE9A==
X-ME-Sender: <xms:M6SCY-DXHp9_lBhloi29CabRsXpwoZHBXjM0H0-8unmALOSWw8Y9zQ>
    <xme:M6SCY4hGiwAPzpzF0gKjt82Y2dfDN7Tv9qA5M_8j8f42g04GAqeKkIVPJwTjeNP9b
    rIoM3PoDdQmSiGYbQ>
X-ME-Received: <xmr:M6SCYxmQa0nLfx8dXKRwLfP2p_Ar22voc-LwoOikdl8aYD94fhy0FCSGOEOPDyhKbovxmQf2h4ltoFsS1yFL1RskyAypNcwjvPzoutZDiqXGwsstijIod1-5gsg8nPbH-g5qxw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrieekgdduvdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:M6SCY8w8MrC2b89-BTfB_LzW9h-XqpK5AEj210lsVVHvnXgVp5QHYA>
    <xmx:M6SCYzTvVliOs7DT9Los3H8iWDBaDdL0tVxoqJX3Kcd52OUdj7lqWg>
    <xmx:M6SCY3Ytw9TeWPM7Fh9B9TGdwFJjqHxjRhhwiDQ4CQcVEQYKPCvbbQ>
    <xmx:M6SCY0LUOnGZSgEz3OzBzFrW-rYUpimKMcAHBS2J1e_5iVZXb-lLFw>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 26 Nov 2022 18:41:38 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] irqchip/sifive-plic: Enable oneshot-safe threaded EOIs
Date: Sat, 26 Nov 2022 17:41:34 -0600
Message-Id: <20221126234134.32660-4-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221126234134.32660-1-samuel@sholland.org>
References: <20221126234134.32660-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_154148_460299_F187E55F 
X-CRM114-Status: UNSURE (   8.50  )
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

This defers the EOI until the IRQ thread has finished, avoiding the need
to mask the IRQ while the thread is pending.

Signed-off-by: Samuel Holland <samuel@sholland.org>
---

 drivers/irqchip/irq-sifive-plic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index ff47bd0dec45..d8fc3354b38c 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -203,6 +203,8 @@ static struct irq_chip plic_chip = {
 #endif
 	.irq_set_type	= plic_irq_set_type,
 	.flags		= IRQCHIP_SKIP_SET_WAKE |
+			  IRQCHIP_ONESHOT_SAFE |
+			  IRQCHIP_EOI_THREADED |
 			  IRQCHIP_AFFINITY_PRE_STARTUP,
 };
 
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
