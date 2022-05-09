Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A18DC433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 03:44:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F//m+CoC9gLGJNfA++LwbVF++VW/PfvwqUz/E/Ib9GY=; b=f/9c6uGrmtYVx6
	xVrYOYMJx+yYOlL8LP6+f9P0LKUYHyybjLiPxa/ZizeQ4EIgJEf1IbZZB2dgWfQaLxNoEuTa3RZ8B
	ektfVZ5OR2ut/4KLnBIVgzdmSThDeqdeopB1l/Miq1woH5tnuCUmyzwmYbTKJiZpMWl7/Cig9Gh1p
	4zBxptVfyVtvsaRQprFUEwoS+keBSiR7ttc9FbYkkerSgQNLXwD+ix/MFKh3DCVdkZpUolUBMnlZa
	imvdl2eZwcR0dtlmLASZ3gcpN/aX6kG9BDq6HJUuJaecS5hXq+ww2Qs6zquag+qWAhGVldxSbV0za
	KdsmBMS275Snejb+QAzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nnuKA-00CE4m-K9; Mon, 09 May 2022 03:44:42 +0000
Received: from out5-smtp.messagingengine.com ([66.111.4.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nnuJC-00CDfh-4P; Mon, 09 May 2022 03:43:45 +0000
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
 by mailout.nyi.internal (Postfix) with ESMTP id 615945C010A;
 Sun,  8 May 2022 23:43:38 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
 by compute1.internal (MEProxy); Sun, 08 May 2022 23:43:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
 cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
 :in-reply-to:message-id:mime-version:references:reply-to:sender
 :subject:subject:to:to; s=fm2; t=1652067818; x=1652154218; bh=YD
 hDThkINI0HCk+Vr4rmFl8Cmx4jEjCcgwwCp9ZTzSs=; b=iMiu+odchUn6oLYO2i
 p4md3l7LvrWNBzLa67wJ/ymaQKyTnHIrhJsvOlCmX4QaSggQRdOGXcUyZeZiAy8V
 M94tBwQd1qtxEA0RY74zpwL1q3YbYMN+MgzOb4xM0+xJrdHi9ZIb92kIszoWsAeW
 GYaWvwvNzTPWQCHO0d8AqE9Z0sNwQQ9OqjpkoIrU+EZdEjoB7I0S/Gzgqwk5/tJT
 JY7xqUB90lvoac90cYpm5ZRLUTVX4g21IOxjTk02BFnC+4VnUwYkUCUUgcivbrd4
 2qQdve8p2bx6TRqN2cSE/ti6zvKQR1ZANju3YfKVkMQfIAZWukmnVNrm/YVw/Htl
 hwzw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
 messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
 :from:from:in-reply-to:in-reply-to:message-id:mime-version
 :references:reply-to:sender:subject:subject:to:to:x-me-proxy
 :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
 1652067818; x=1652154218; bh=YDhDThkINI0HCk+Vr4rmFl8Cmx4jEjCcgww
 Cp9ZTzSs=; b=RZESZKyw9aetxD11MazwPfIWAUyG+pSjRDiGArRDRPGmh7hJnmU
 fNL5pi9Qh2bAU0dt8KT1V9aN/FPfv6/LkGsDO13QJL6dD10BO0yu04OJVdVWFFdI
 l7x0JoroWjOTc/5+ixWvcytPu16m2TmZpKyjhEusZ0PFOt18GGnhYj1+/qNWJKOv
 Gh94b7Y52clMF0El3wVygHpD13SdBMftgm90qtfVuMIyr99PnZrL/o9juI7BBmQ/
 wmdeHnfs5S9z2aMG2Xe53G7pHMGJaG9o5gAdBWNtK0R/hwuuOlrJdXhuty6tNWOh
 WkPXs3/YWGbT1I6WHxqfAmWxFThNn7LA5uA==
X-ME-Sender: <xms:6o14Yj-AX2zwgFTG-uwsCTOqeigEPX1GHBY6cHN-VH390wiov0p5eQ>
 <xme:6o14YvtQ7BX5DrjoH0RZgqC9tQsX-4dcTglTbq_yYDsdejlXS1a48qE6Bt7TvJbZr
 xbA9Vsd92HlDezk2A>
X-ME-Received: <xmr:6o14YhBVJO9YEaZMLqdZMcZm2sn4Xx9sn4ATWyqufH9svHVCrddftAFFi-GZAE_SgZlC_k03L7bjX0L2r4GTojkycOVzHA4Zvdc40E5Ja-PR45oQnxJuxGKpnMGzWZzXyI1V6g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeekgdejiecutefuodetggdotefrodftvf
 curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
 uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
 fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
 lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
 frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
 feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
 hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:6o14YvcDiAZ1fIBzEwendRUQz7GRV7QuUB4bYhq9n5Q9v5OwnO4OUg>
 <xmx:6o14YoNecRHx-vCx6O-jV8U0Ccs4016JgkUvCMGS1PkfHJBNNcblHQ>
 <xmx:6o14YhmM2YPoqnU4sZt0DyCR1wr3_Og6DsgZPpAAV27cwZW0iW91jA>
 <xmx:6o14YqsTnvj30FTejzalAELZF-MdMqVCtdLs-LcKikLqYIgkci6F9g>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 8 May 2022 23:43:37 -0400 (EDT)
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
Subject: [PATCH 2/5] genirq: Refactor accessors to use
 irq_data_get_affinity_mask
Date: Sun,  8 May 2022 22:43:30 -0500
Message-Id: <20220509034333.60017-3-samuel@sholland.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220509034333.60017-1-samuel@sholland.org>
References: <20220509034333.60017-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220508_204342_760549_F78C10FD 
X-CRM114-Status: GOOD (  10.45  )
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

 include/linux/irq.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index f92788ccdba2..48ac33ca3703 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -877,16 +877,16 @@ static inline int irq_data_get_node(struct irq_data *d)
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
@@ -908,7 +908,7 @@ static inline void irq_data_update_effective_affinity(struct irq_data *d,
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
