Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46EE3EDA698
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Mar 2026 16:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7eW1rQUy7YkvNC1z0aywGcEJqyXnkLZlTAcD8DZ5Kx0=; b=eHFmy9vlHtUtPg
	ujiMZAKDBMHKyuZv25gPFfJW/nvaIaz8p9F/pHTq6RVsu/7pFcHwFnqihvvOlSmTkV4xSSc8xJ6wG
	J6k1VyxVZvC1rbZaZudJx6xOL90KyAJhwTzqrF/1EiuRdg93idBD6qIwLtl5OsFCJvnmjgnhsIHFK
	almKsjLGDjAWY9pcKGQ9w5zxNRhvebBAsAdEDsWRh3zBH8Dhaa1J6oymVolzI5bApR4pYi3qHG6mp
	gbfXQprT/SrQaxnzNUrqIRc8ERVHXKxRofC0gDVAfJW3a0sOMOl1awdjw/zrDIHIa06zfqCrxg3P2
	beH1/tK4RgFQacYFaC9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSox-0000000Fb73-0BKx;
	Tue, 03 Mar 2026 16:42:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSov-0000000Fb6x-0Uvf
	for linux-riscv@lists.infradead.org;
	Tue, 03 Mar 2026 16:42:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 30B2760008;
	Tue,  3 Mar 2026 16:42:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF1FEC116C6;
	Tue,  3 Mar 2026 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772556123;
	bh=G4pcMxh0RxEcAEw5zBZ7807yJibB8k2P6xl2tUln7Is=;
	h=From:To:Cc:Subject:Date:From;
	b=h4gTnvU9VQoF3yVsRk4bO/PMqK+e9Uf+Zy7tI/YZ2D8D/KXgWnIuQovcptoc9JysS
	 RCDiFyqaWECb1VYKCdKwJfZ3NHpvLLg4jFDLbDh/0cXjD4H0sAb2Q1BYw6dA1MseJA
	 vmpVCpDjckkfM35LArW8onrAdWWCo4JTct/otc8uoNQLpGHv+T4f20iBrfdGoEzk5G
	 /U9CkYvT3IhBAxTih+US8cJI3FLPQlDOf/AWguMrEz1odq/aGt62LDOwnqfQI0VxdF
	 rZ58CSs28jA8iiSfGBPiA0bIEJaYsZ8mWnSe6QvnG5fCSGT62+AfxBgT9DAgWcPin1
	 /UrIFMpjQm+nQ==
From: Conor Dooley <conor@kernel.org>
To: linux-spi@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] spi: dt-bindings: mpfs-spi: permit resets
Date: Tue,  3 Mar 2026 16:41:50 +0000
Message-ID: <20260303-deceiver-rack-82f2b89eac40@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1565; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=GS5S3MWIriZDtQzZXlNHQlRdGMI7nMwWi0pnjf8qN6U=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnL+f3mKKnK39rWMFHno+Ya9tevnk37Yf/3pNfVJ+8vu fSmPFH16ChlYRDjYpAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEInIYGY7KCRVel5H1PsNo LH6Duy7wTsDGyEeeKx/K2LS2H7wj+YCRYdIWGeO/OmYik9+v56lM+c6+4sfVepEPCgl1rU3T8kO iuQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

From: Conor Dooley <conor.dooley@microchip.com>

CoreSPI, CoreQSPI and the hardened versions of them on mpfs and
pic64gx have a reset pin. For the first two, usually this is wired to
a common fabric reset not managed by software and for the latter two
the platform firmware takes them out of reset on first-party boards
(or those using modified versions of the vendor firmware), but not all
boards may take this approach. Permit providing a reset in devicetree
for Linux, or other devicetree-consuming software, to use.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-spi@vger.kernel.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
index 636338d24bdfb..b7d8acc924be4 100644
--- a/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
+++ b/Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
@@ -41,6 +41,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   microchip,apb-datawidth:
     description: APB bus data width in bits.
     $ref: /schemas/types.yaml#/definitions/uint32
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
