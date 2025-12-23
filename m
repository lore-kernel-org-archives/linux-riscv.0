Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5E0E6B26E
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Dec 2025 02:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pRu0HSdnhN9AuOdKmJ5yEihmzduhRED9U2xFN2Acy3k=; b=kmpQD0V9YiLVf1
	7bMrQNPoatD7RMHfy1Dt0Qrm9ZJYMmIcUQkm6EVAWxyf9dVkyH3pzdT2yrcx1YvJHXRjqm3BZii6g
	hj3ItusEqAiOUx1yRWi4bbavfTlw2p1AMAub/Gqp+6TuwyYOqimPtcoFpG0r6R3WENbVi7FzShBXV
	UTehPPdTIoFss8llUddbPPb/xj4caBvcXi3+QRDjrURHf4d0FKEpm4KcCgt1s/xDafvHxktg9Jvn+
	CbxuLoo1sagJBUOusCkRblG5VTh+knM5v/nj6msAMQd/Qgk+AlmHVOd9fwXMFjOt+5GRARhOhZafq
	YkhbVUY3Kt1Kxc0QaO2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXs5y-0000000EQWP-0YN5;
	Tue, 23 Dec 2025 02:25:54 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXs5w-0000000EQVu-0cGU
	for linux-riscv@lists.infradead.org;
	Tue, 23 Dec 2025 02:25:53 +0000
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id E0DD93415D2;
	Tue, 23 Dec 2025 02:25:38 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Tue, 23 Dec 2025 10:24:49 +0800
Subject: [PATCH v2 1/3] dt-bindings: mmc: spacemit,sdhci: add reset support
MIME-Version: 1.0
Message-Id: <20251223-07-k1-sdhci-reset-v2-1-5b8248cfc522@gentoo.org>
References: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
In-Reply-To: <20251223-07-k1-sdhci-reset-v2-0-5b8248cfc522@gentoo.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=Tv4IIxbajJGdC0Qo4tZIq/kiXMWsMML3XzBX/R1wVC8=;
 b=kA0DAAoBMarqR1lNu+0ByyZiAGlJ/Y7I8qJX1p/wYpFnsoywTU9g9XUUIyW2CWKGIFxnlYYfi
 IkCrwQAAQoAmRYhBLW6uMnDG3EVZwIj3DGq6kdZTbvtBQJpSf2OGxSAAAAAAAQADm1hbnUyLDIu
 NSsxLjExLDIsMl8UgAAAAAAuAChpc3N1ZXItZnByQG5vdGF0aW9ucy5vcGVucGdwLmZpZnRoaG9
 yc2VtYW4ubmV0QjVCQUI4QzlDMzFCNzExNTY3MDIyM0RDMzFBQUVBNDc1OTREQkJFRAAKCRAxqu
 pHWU277YFbD/9FnfELT45pvSQ81a+V+pOmcfKhnGgLnrQxUU/13qf9VwBCKGsfdS/w+jTj2sp8l
 LT5+DQYbQ1NSNyC27NQE96aJ5OAQVhaLu15LASyysu8DebeJeZKUiYT3LAP1tnm3rcNsVXQOU7i
 hHkat94/w1H5XR3UFPsaqj7T3bRm9cF8A0WFs3y49gPfdtN5GiRoAebWzD/m7PG2uFfiDvB5uSt
 +lUKD0BZcGJD6KfOj5hlCFt9mhgS9pc1Q1KpnYfwzLMaTjTPR9H9Ug5DXMTJY8OdF5ntWDT4cwK
 T6AY/8edOmApXZFvJkIX1RWRdJXDnVSuKXgeOFlDD494YjVvLbgoNzIiprmLPcorJQ+VKrm3C1y
 VvlJ0qzMqmKCyZqou6oqNhZs4b/qIuda2/dq0EE1Ry6lAUqbVKZLzdWL3o9iL+hPH6AhI3yumhw
 OjeApM5SUr4FjoCndony47Ps9U87dD5T+XZSbxAtEGH/6gkoYy6p3b/pcHWOM/ZnC/ECPUI49nu
 e72LVXx8lTaGtj4di0W58yV4HL+GmVDmILg6TVICkDGUmbkjBtQfA9rtdLQ8rRiABOuGce+HLdg
 nHy3/jd1bFdigNYg5umn1QhnbruAcHx8Mwu7IjwZW/N/cSIXN6x1AVS8y0OWJypNmQMdP3ulZc9
 6QuKDMNbYIGlYgN0ALZAg==
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_182552_216928_B5C82E27 
X-CRM114-Status: UNSURE (   6.88  )
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

The SpacemiT SDHCI controller has two reset lines, one connect to AXI bus
which shared by all controllers, while another one connect to individual
controller separately.

Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
index 13d9382058fb..de4e9efeb666 100644
--- a/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
+++ b/Documentation/devicetree/bindings/mmc/spacemit,sdhci.yaml
@@ -32,6 +32,16 @@ properties:
       - const: core
       - const: io
 
+  resets:
+    items:
+      - description: axi reset, connect to AXI bus, shared by all controllers
+      - description: sdh reset, connect to individual controller separately
+
+  reset-names:
+    items:
+      - const: axi
+      - const: sdh
+
 required:
   - compatible
   - reg

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
