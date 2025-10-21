Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B450ECCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/8k7fOIlp+h45n5EQoeCftLh5X4ilIqCYcc0UlkiQr4=; b=oD+UpQgQvkbreM
	H7IFQx/gtYWspWQarjiRDsV2bRvOQux6eyp1DJpo6nNJsH0b6D5jmw1bJB9pPvnCr51gvbBnnwmv6
	RmZumnaP0bWS8bY6CCMkz0zfrLsiHwAQwyrnsfyjWYW5D/mE0BP2sK0Kx/UIErIdVVfaeP6ggNKbW
	Cx9JbD397PCdGkEGsEn+jhnqjBB+W1bjTURPJwt3ex6jPh/mOIrD3y6ZrJ7g7diCAiKDz57OmKgHf
	jhz3My+7tjr+MxExYg0ZubF2vc5lb6VELxQBAEofwrAV+T5PctPAgxaXmvk/MC/Tdf3IK03cVSgie
	ZJARWe51JxGUfHJj/G6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8vh-0000000GVL9-04lB;
	Tue, 21 Oct 2025 09:45:21 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8ve-0000000GVJI-35M2
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:45:20 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039907; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CcilNr+RvKWz+LIjGAZ2gKgra5rHTtiXYgjU3oRq0GoeZvvhoIgL1KEz/ZRMAUsZj0XjPge3D5iHyz6bKmk11WdX489pvIOnE/VcBwXkVb4D5CFgQxeZdKWWoNxZrtmrmRvUMcrqlHsoymzF2wD5d/rirGimIYhcqxUFzkGMAno=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039907; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XeAz0aRyrxGa0E4TqGNpNqstyOLvl6ihWlA2SgMF7cI=; 
	b=fFKEDjjVO4U2XMGOKa1cd0igtw2l0T7VEP83FA9vRawh3s55EGu0uqRhO8h0IhlxdKJivY16vgEiU+aCk2upbL/f6E815HAc2xO61ODAj5RreuODPqS5xTbx23VdUxeG7T2bxK/bQinuBXTUMjR0l6ykmJObTr4nMgys9hnL2MY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039907;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=XeAz0aRyrxGa0E4TqGNpNqstyOLvl6ihWlA2SgMF7cI=;
	b=ATJxVpFmb2kmF8vq2MHCQe5TrVjpnEgaWeKnVabiao0YoMw40lCtvwOHYwDzZBsD
	JSL1vcYrCcfJAx8cRg1gJkx69560490m1YImP1YutdO/psxWYWAaTRQfWX8DL1TXzgf
	RqhXSSGQE70GGwbsh+T1zi7CghRYkji7/MJfKZjw=
Received: by mx.zohomail.com with SMTPS id 1761039904574148.51559392405807;
	Tue, 21 Oct 2025 02:45:04 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:40 +0800
Subject: [PATCH v3 05/13] dt-bindings: interrupt-controller: Add Anlogic
 DR1V90 ACLINT MSWI
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-5-5478db4f664a@pigmoral.tech>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=1670;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=vGVFGtCMw2Cq6PHj7NWFAOotdNYwXl0pGR0c3nhA58Y=;
 b=NDgGrbY4ENxh1RD/GL6Y7DZuZPgbeqbgg+xKtjr/vkvTg38T2xaBuPn15Np/e3d+7ff3K6/aj
 uvKMokY88HGCAn2EL0w+Fw4zSX/Vfb7ZC6JEdmQb/qF6WBOXZ6EdFWv
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024518_835697_08623AA5 
X-CRM114-Status: UNSURE (   8.82  )
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

Add MSWI support for Anlogic DR1V90 SoC, which uses Nuclei UX900 with a
TIMER unit compliant with the ACLINT specification.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../interrupt-controller/thead,c900-aclint-mswi.yaml    | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
index d6fb08a54167f21d454e33a1992e19b358d42dbd..62fd220e126e650e3800d8eee2a749fdbbde6108 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-mswi.yaml
@@ -4,18 +4,23 @@
 $id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-mswi.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sophgo sg2042 CLINT Machine-level Software Interrupt Device
+title: ACLINT Machine-level Software Interrupt Device
 
 maintainers:
   - Inochi Amaoto <inochiama@outlook.com>
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sophgo,sg2042-aclint-mswi
-          - sophgo,sg2044-aclint-mswi
-      - const: thead,c900-aclint-mswi
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2042-aclint-mswi
+              - sophgo,sg2044-aclint-mswi
+          - const: thead,c900-aclint-mswi
+      - items:
+          - enum:
+              - anlogic,dr1v90-aclint-mswi
+          - const: nuclei,ux900-aclint-mswi
 
   reg:
     maxItems: 1

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
