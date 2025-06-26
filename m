Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B323C7EE32
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 15:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vG2HSM6N10LKjr6Vns6mUmJaa4ld5WczN4Jes8ML+No=; b=mDcMMeGenTaAY/
	5OZPmzC3xF84h5Tkm8WYERwKqESN3qURXye7UQgEsZRMZXLgIt5tLeEQ1oBmXaTQH7P02WxyClIRN
	dVfUGTyIIRg0DQHRfsGj6gv+b/yQ9Zf5WPtqGv7Lt1bQHrcbjf1Kz9PSxCY7gN/AKdcLrCJLft3Qu
	/olEo4B8Pbmkszvc261xxemJgoKbgCbNxnMpTp8eyW8cLE2DMRJ6lGEOXVeCRRrafUXhrKc+r3/iZ
	mbectSedHHR2/MSSTMzYS9V1Evbz3sHs9Tavd+DGTsNJjtKuwZkj4iQbh8ss96JbPDYUvlsW+g4gz
	Lyc+rtQf1RyFPaOf62ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUoqV-0000000CBKT-2JHo;
	Thu, 26 Jun 2025 15:49:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnv3-0000000C021-1e3S;
	Thu, 26 Jun 2025 14:49:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Pi9UqFBmG0ABPdW7goJnL2FLekqeOwHCLTz3aDeGlnw=; b=QFPKZvLCjLoHFD2sd59JaaxNgh
	xvjrw3M9bPqXjWJ34I4jAGOiZOMGlIIJdKXpQ7YCbfRDsVTeOVZXRo/EUpdnyevvaPYTDi2DOeuiV
	YQoZKnILsK0iLCqUzwOsxYVzsjkqqM00CMFRyPTIvo1Us+TfwuCiRZz24H64mXPKDO2hVONh0lfgW
	7B3c2rWrOsoTjyD25stbNOVGgwr5cMQSOwADbvkSq97bfQUtri+hP0aAJ4ApXm0LHNqdP2WzOJIB5
	M4hBbOWM+3z+8vOxDMu161FCS0TBhm3n6m3u889nkjZpkEdRBrf/EAqg1LMp8e+dWIdWDIS8NjX4T
	E69rG+iw==;
Received: from galois.linutronix.de ([193.142.43.55])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUnv0-000000067NP-29Hc;
	Thu, 26 Jun 2025 14:49:40 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750949376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi9UqFBmG0ABPdW7goJnL2FLekqeOwHCLTz3aDeGlnw=;
	b=d7RpVYHGdlxfyf0WiFnopVOhvS5IgLshX910+umF5VObQhNZ1ujRTniufW5dMtsTPKSlhF
	urakTifQAqOHMw+5EqyQT2e6ndF2HKPA64Z/NNCLq82v1jodx0BWqZfzeh8nVbO6rc6Cf4
	76E4Z0oMVNZh5Pc6drneoWcbeYh6qlNZCFBHk7x9CzCFrQdY42qUN/Sj7F+chf+3hQ76qD
	dEeGlxLv/RnLcUbgoOt26UCaTr5Daxb3TZY9s6iSX0IYZm9LZm/hvhyrSCwggfMs6MIWQ1
	Px1LLCDY8obutNGKEwgmRKIc17WjuRdOg/LEDGZMwsGTdNuFFWMMSoYwq8FUkA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750949376;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pi9UqFBmG0ABPdW7goJnL2FLekqeOwHCLTz3aDeGlnw=;
	b=l9HDPg8d9E07sSs5ILVUEbh58kaGOI05w6928VyvfHfE8vIWVBWMGdIIjPat2eWzCBI9lX
	8pXUG5ZKCqOW6XCg==
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Antoine Tenart <atenart@kernel.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH 08/12] irqchip/alpine-msi: Convert to lock guards
Date: Thu, 26 Jun 2025 16:49:05 +0200
Message-Id: <7886b9595aaf8e102f79364784f68dec9c49b023.1750860131.git.namcao@linutronix.de>
In-Reply-To: <cover.1750860131.git.namcao@linutronix.de>
References: <cover.1750860131.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_154938_694965_8ADCA6DB 
X-CRM114-Status: UNSURE (   8.19  )
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

From: Thomas Gleixner <tglx@linutronix.de>

Convert lock/unlock pairs to guards and tidy up the code.

No functional change.

Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
Cc: Antoine Tenart <atenart@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/irqchip/irq-alpine-msi.c | 18 ++++--------------
 1 file changed, 4 insertions(+), 14 deletions(-)

diff --git a/drivers/irqchip/irq-alpine-msi.c b/drivers/irqchip/irq-alpine-msi.c
index 7e379a6985a6a..cf188e5feefc0 100644
--- a/drivers/irqchip/irq-alpine-msi.c
+++ b/drivers/irqchip/irq-alpine-msi.c
@@ -60,19 +60,12 @@ static int alpine_msix_allocate_sgi(struct alpine_msix_data *priv, int num_req)
 {
 	int first;
 
-	spin_lock(&priv->msi_map_lock);
-
-	first = bitmap_find_next_zero_area(priv->msi_map, priv->num_spis, 0,
-					   num_req, 0);
-	if (first >= priv->num_spis) {
-		spin_unlock(&priv->msi_map_lock);
+	guard(spinlock)(&priv->msi_map_lock);
+	first = bitmap_find_next_zero_area(priv->msi_map, priv->num_spis, 0, num_req, 0);
+	if (first >= priv->num_spis)
 		return -ENOSPC;
-	}
 
 	bitmap_set(priv->msi_map, first, num_req);
-
-	spin_unlock(&priv->msi_map_lock);
-
 	return priv->spi_first + first;
 }
 
@@ -80,11 +73,8 @@ static void alpine_msix_free_sgi(struct alpine_msix_data *priv, unsigned int sgi
 {
 	int first = sgi - priv->spi_first;
 
-	spin_lock(&priv->msi_map_lock);
-
+	guard(spinlock)(&priv->msi_map_lock);
 	bitmap_clear(priv->msi_map, first, num_req);
-
-	spin_unlock(&priv->msi_map_lock);
 }
 
 static void alpine_msix_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
