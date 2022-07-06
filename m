Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AB00C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 23:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nNrgiCGIv27fw2TXTYi2DBPbGT7Kkj+i02GMbe7Shbg=; b=Fpul6nMXx6m/eZ
	rzokKRx9T+FbbxXX7lV/ybs/MkAYo/34oxb7iosl639eHQSw0g01iorc6ADLmKS8/RgoyJmTlXlAc
	0MGNBSxp2JTj4fp/7e4ooa4ZWbWq+Ii3wqOrPdG+50clPUopDL96al7SdS7vDHdqtazSvg0+/bIYw
	Oe8hwL6Dfo86WD62F7aMXdEu4JAoSvL0XddOL9BSD4mOUGYFHYQiO4FiKgU8/jivbdcAdyB9Xu1iV
	B3PBkGNq2GOeJiQRXX+2kSDX4I0QFlBeX6ftvOIuwukFCKRcvS3N1aFaEOss/prBS9MXtvA/81Hzz
	jXA6jmCQ7fQDeRA5MQdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9EFK-00CiLf-66; Wed, 06 Jul 2022 23:15:50 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9EFF-00CiJ1-J6
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 23:15:48 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o9EFD-0002yn-C5; Thu, 07 Jul 2022 01:15:43 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	samuel@sholland.org,
	atishp@atishpatra.org,
	anup@brainfault.org,
	mick@ics.forth.gr,
	robh+dt@kernel.org,
	krzk+dt@kernel.org,
	devicetree@vger.kernel.org,
	drew@beagleboard.org,
	rdunlap@infradead.org,
	Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v7 1/4] of: also handle dma-noncoherent in of_dma_is_coherent()
Date: Thu,  7 Jul 2022 01:15:33 +0200
Message-Id: <20220706231536.2041855-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706231536.2041855-1-heiko@sntech.de>
References: <20220706231536.2041855-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_161545_715802_6791FD00 
X-CRM114-Status: GOOD (  15.24  )
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

of_dma_is_coherent() currently expects the architecture to be
non-coherent and some devices being coherent getting marked
as such with the dma-coherent devicetree property.

For PowerPC CONFIG_OF_DMA_DEFAULT_COHERENT was added which currently
makes of_dma_is_coherent() always return true but doesn't handle
the case of the architecture being coherent but some devices not.

So modify the function to also check for dma-noncoherent and
set a suitable default return value. If CONFIG_OF_DMA_DEFAULT_COHERENT
is set the value starts with true and finding dma-noncoherent will
set it to false and without CONFIG_OF_DMA_DEFAULT_COHERENT, the
behaviour is reversed.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/of/address.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 94f017d808c4..96f0a12e507c 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1045,26 +1045,29 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
  *
  * It returns true if "dma-coherent" property was found
  * for this device in the DT, or if DMA is coherent by
- * default for OF devices on the current platform.
+ * default for OF devices on the current platform and no
+ * "dma-noncoherent" property was found for this device.
  */
 bool of_dma_is_coherent(struct device_node *np)
 {
 	struct device_node *node;
-
-	if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
-		return true;
+	bool is_coherent = IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT);
 
 	node = of_node_get(np);
 
 	while (node) {
 		if (of_property_read_bool(node, "dma-coherent")) {
-			of_node_put(node);
-			return true;
+			is_coherent = true;
+			break;
+		}
+		if (of_property_read_bool(node, "dma-noncoherent")) {
+			is_coherent = false;
+			break;
 		}
 		node = of_get_next_dma_parent(node);
 	}
 	of_node_put(node);
-	return false;
+	return is_coherent;
 }
 EXPORT_SYMBOL_GPL(of_dma_is_coherent);
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
