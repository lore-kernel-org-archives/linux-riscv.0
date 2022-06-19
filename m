Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BDA0C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 19 Jun 2022 20:32:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZUphmeVUkW9WrxKt1jLVWy01AReGywvAdGG18KQkyjY=; b=FYNuWoi8rS9Psi
	6CQ9lpAFYJaRRNXTLKVW3o+Wdlq5T5gMJuWF6mLe700fxNS169ltFSzjft0p0PfQRspWZHGEbXcwK
	KooIgfXqHp6FXKbTnu3r9gZHw3Nkk0ZpvirfpW+PYQj1nTXPFBFD1ZzI2w2WLuyxZlkUa4oPcuCZo
	9KHYdgo7W7blO6897dqdMUE1w/zltJI4AMpES8rN5uiFJEUzUzKFUPGRBVrs+HDgDpFsq/xJpxDPk
	2RTJC1PSQ1GG7eWmkp2ytgSSAc9dNfyBAXdtLJOqwSr5IyXIKu2zDQjnRB0bG9xG7Cm+95119fT4G
	xf6NY360KrfWEF89sFoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o31az-00F7xD-De; Sun, 19 Jun 2022 20:32:33 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o31at-00F7tw-Iq
	for linux-riscv@lists.infradead.org; Sun, 19 Jun 2022 20:32:30 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1o31an-0000EW-AZ; Sun, 19 Jun 2022 22:32:21 +0200
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
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 1/4] of: also handle dma-noncoherent in of_dma_is_coherent()
Date: Sun, 19 Jun 2022 22:32:09 +0200
Message-Id: <20220619203212.3604485-2-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220619203212.3604485-1-heiko@sntech.de>
References: <20220619203212.3604485-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220619_133227_737845_36BB510F 
X-CRM114-Status: GOOD (  15.33  )
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

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/of/address.c | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/of/address.c b/drivers/of/address.c
index 94f017d808c4..1c362d09983d 100644
--- a/drivers/of/address.c
+++ b/drivers/of/address.c
@@ -1045,26 +1045,32 @@ phys_addr_t __init of_dma_get_max_cpu_address(struct device_node *np)
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
+	bool ret = false;
 
 	if (IS_ENABLED(CONFIG_OF_DMA_DEFAULT_COHERENT))
-		return true;
+		ret = true;
 
 	node = of_node_get(np);
 
 	while (node) {
 		if (of_property_read_bool(node, "dma-coherent")) {
-			of_node_put(node);
-			return true;
+			ret = true;
+			break;
+		}
+		if (of_property_read_bool(node, "dma-noncoherent")) {
+			ret = false;
+			break;
 		}
 		node = of_get_next_dma_parent(node);
 	}
 	of_node_put(node);
-	return false;
+	return ret;
 }
 EXPORT_SYMBOL_GPL(of_dma_is_coherent);
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
