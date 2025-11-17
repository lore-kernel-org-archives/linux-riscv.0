Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B8ECEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 16:53:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rGPvj90KHoNruBBicFWyXN2nLcMWX/FBkPPyexN1v1E=; b=UXGgxWa5vujqxK
	vqqEnD3Dch95Nk6+LwdCNn8c0P7jWIblVDLvVh8iPDJ7jxMIK2OfYBJPEBnHQXhqT1vb3lV1iwuj8
	RIxlEWS3xUbUtDo6851WBnTQ47sGRYrx/yeiNS714O/mtbPLrBGu/N3thkj32GTqzb2R8shudhpYU
	+eP7pD/eyJrzayKby9L0FVRNxDsrJ92MNJCHt1A3JqB4b/LJFvsD/PdBhJqBAD+T/ZwlOh5BMkJ3V
	9tYUt6cmZbTdzmf08TiboKUjYyZ+Hpza+YAJsgiGrI5TI7A6ufSInu7ka2U3BDaAtEyWtmHRKfeNv
	aGumJwsp+C0NkGQWxNkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Tz-0000000GQmE-2zpq;
	Mon, 17 Nov 2025 16:53:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL2Ty-0000000GQlx-06ep
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 16:53:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E88660051;
	Mon, 17 Nov 2025 16:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14A06C116B1;
	Mon, 17 Nov 2025 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763398416;
	bh=VfwwYyZqWowOItggqYS9MBc9xN4rjuwUcGHHtUNGlOw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=qMR3NkwzgSb9fU3mW152kvulZSjapOke7BJ0tzKOHx8ZiIc/yMcin8wnjfkVizUbs
	 cdiEHsm9p3K18D9h4BLEpgI0KvvEQYJoeRDh2vfqWhtVtHwnjxtjm9vIHOkS/a+YqB
	 ZcoazKMhp2eYqGrahM4I4vbKQEOE5wBdxDSqsBVCnCkfi1aAtkErbbGfv4Cvv/Fxal
	 19PMVR8P+D9Xy6FB0zydlXoend/WOC2loR6KEEG5guvgk8XRWVEZ2xY8ICz4ZMlN8B
	 fIOrfH+S2YU16oo/Sl8lF7EIKbA0l1fUL3aYjD/sxWSUrL7tonbDMqoZELcu0+zfvV
	 6oN+h2373fMrA==
From: Conor Dooley <conor@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: riscv: microchip: document the PIC64GX curiosity kit
Date: Mon, 17 Nov 2025 16:53:22 +0000
Message-ID: <20251117-gliding-sixties-6d06ed7412d7@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251117-paprika-tipping-e7bb3e211d6f@spud>
References: <20251117-paprika-tipping-e7bb3e211d6f@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1482; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZSsBrvk2J+QWcy8FOSQPmxvkpcXnkkWM7WXrz+b5m0g=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnSQf9djzQc2TRD+64R34QJrzqNbE6sap/89k7v7B+71 ReK3oh+0VHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJiIQzMuwQEn2aW7lgu+nR jtzlz7LNVqgebNvzd6pqrPwGsY7Le9cwMjyeqMtS3v1pZs7vCWX/GqxUdnvbX6n5POfFiV6jmzv z/rICAA==
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

From: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>

Update devicetree bindings document with PIC64GX Curiosity Kit, known
by its "Curiosity-GX1000" product code.

Signed-off-by: Pierre-Henry Moussay <pierre-henry.moussay@microchip.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/microchip.yaml | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
index 381d6eb6672e..137a6f413430 100644
--- a/Documentation/devicetree/bindings/riscv/microchip.yaml
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -4,14 +4,14 @@
 $id: http://devicetree.org/schemas/riscv/microchip.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Microchip PolarFire SoC-based boards
+title: Microchip SoC-based boards
 
 maintainers:
   - Conor Dooley <conor.dooley@microchip.com>
   - Daire McNamara <daire.mcnamara@microchip.com>
 
 description:
-  Microchip PolarFire SoC-based boards
+  Microchip SoC-based boards
 
 properties:
   $nodename:
@@ -46,6 +46,9 @@ properties:
               - microchip,mpfs-sev-kit
               - sundance,polarberry
           - const: microchip,mpfs
+      - items:
+          - const: microchip,pic64gx-curiosity-kit
+          - const: microchip,pic64gx
 
 additionalProperties: true
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
