Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C730ACD5BD1
	for <linux-riscv@archiver.kernel.org>; Thu, 28 May 2026 05:24:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xs13BvsJnS9ylnpnbq/niaSweAll2D14RPJRtoOoSH0=; b=Gy3acFornlOkRw
	aDV6zy05feDQ4IO3HtE9M/Oypt6eC1+ZHzOwg+OgqG8xHW6soebhJE8ej2vMMF8NACFA4wHP7yvMj
	qqH0uMpVUs1D7pgeZQ+h/VXVhAl7wg2qmMHO3ssqMdZX16XuLydTYp0AX8LLA0RaiYndYVv5XfTuP
	Mjl+i0sebYx0cfkUKMLENzCRYxUPdFw3t5lbZr9MqRDIzm2gRWYy+H2sGSzt3PSUzFoKLey1HRsVi
	l0W+iC16O0ynSNKk3h9P4w850LB44jUxxANN2Yy94MPgmey6wG32LtxDR4/zHLA19pmo6/WIVJODr
	j66Bwa3bUVVacTfxmCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTEM-000000058YH-1UZ3;
	Thu, 28 May 2026 05:24:30 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSTEI-000000058XU-0q2o
	for linux-riscv@lists.infradead.org;
	Thu, 28 May 2026 05:24:28 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779945849; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=f8YKTaqC1kvke/STjLydsO3a4CcRunHG3e4ETUypLPjJ4Q1Y/t8JbMnZguoRbnMx3ikVNNPCy+QFQ37Z6PtilavZv9hieaP2qRQwJM8FZRCMaPp0KzSLfZqdrlgdqphGQUskVQa04wbHEq8JTrripd86ugHxTexbQHf4fAmJLJI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779945849; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UvjTRA8xfkxxljRes0fA/LWYD4fR4TwEvH3UGlFAtO4=; 
	b=HP6VSWJV+fHtWeYoSjT7rGtBENU6euv27SCC6Hw8CACfYTg1Tn6QyMojuMwhYA9OlhlQrToWQkxPW/cWSYPqpPACaMvohzl6iab0Wb9PPzjAM+ZYC9RxAQDDxGFTSPiymrjHiJmorxhGUy15WPTtLQqYctelIIXV9yCj8StONTc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779945849;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UvjTRA8xfkxxljRes0fA/LWYD4fR4TwEvH3UGlFAtO4=;
	b=i8ev4/ObvNcHZsnmi+aCXDIvjUr9Ghg/Q+W43MSLHeInOt8x++//CpQq6jj5onKA
	Fgd3I/9+onVLGi3vwcisIq/8AEvkJPJUpBJFEtGDdi1oWH6nbs1Ih1MXnNFgSCZjm4K
	hSIPT3eT8allVcwKgRTYpJCwOUSjv8d9jTSiIh5U=
Received: by mx.zohomail.com with SMTPS id 1779945847005535.3101057500668;
	Wed, 27 May 2026 22:24:07 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 28 May 2026 13:22:47 +0800
Subject: [PATCH v2 1/3] dt-bindings: riscv: spacemit: Add Banana Pi BPI-CM6
 compatible
MIME-Version: 1.0
Message-Id: <20260528-bpi-cm6-v2-1-d0eb3f236cea@pigmoral.tech>
References: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
In-Reply-To: <20260528-bpi-cm6-v2-0-d0eb3f236cea@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Paolo Abeni <pabeni@redhat.com>, 
 Guodong Xu <guodong@riscstar.com>, Yangyu Chen <cyy@cyyself.name>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Junhui Liu <junhui.liu@pigmoral.tech>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779945818; l=1249;
 i=junhui.liu@pigmoral.tech; s=20251228; h=from:subject:message-id;
 bh=ImaB2JWrg33Dniu6feVCqgtEyOGIW/e1dFOZ+mc6LVc=;
 b=QsO2j5hlPX7w0nZYJgUThKPZPZkKQcnemcgMwpGpULbrk/OSx07adKK7zkJQI7ZztZB8zJjnY
 pc1kUjYaKxHAJAdZJOoURYbFhj4cwf/Kz+q/pKDhNhPVtjWQUiEYmdz
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=3vU0qIPJAH8blXmLyqBhKx+nLOjcLwwYhZXelEpw7h4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_222426_513706_7ED96BA3 
X-CRM114-Status: UNSURE (   7.31  )
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

The Banana Pi BPI-CM6 IO board consists of the BPI-CM6 compute module
plugged into an IO carrier board, which is used for evaluation and
development.

The core CM6 module is based on the SpacemiT K1 SoC and provides PMIC,
DDR, the eth0 PHY and wireless connectivity. The carrier board extends
this by adding the eth1 PHY and external interfaces including Ethernet,
PCIe M.2, USB, MicroSD, QSPI, and serial console connectivity.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 Documentation/devicetree/bindings/riscv/spacemit.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Documentation/devicetree/bindings/riscv/spacemit.yaml
index af8030242bdc..3e868383eb4a 100644
--- a/Documentation/devicetree/bindings/riscv/spacemit.yaml
+++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
@@ -19,6 +19,11 @@ properties:
     const: '/'
   compatible:
     oneOf:
+      - items:
+          - enum:
+              - bananapi,bpi-cm6-io
+          - const: bananapi,bpi-cm6
+          - const: spacemit,k1
       - items:
           - enum:
               - bananapi,bpi-f3

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
