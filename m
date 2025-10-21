Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D1ECCD1A5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:45:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzJSDEs96vEO0CP4/7g8c5N81VEcvQs+5Ds3J4OAW7s=; b=pqydAgPvyo++Go
	FVJgSBSS7ABRapLz6HCpwH+rxY51P/fNvZbtl+c2zJLerF7QNW9CsFlpzJj+pObP6PsXgRa/jNeZK
	lceKACu+WJyVCKquEcxJB1VBKqlqxk5aDXszTEre3hbjx8IAIYToHW3H5AV6Kk4AWaNR8lCwnr9tA
	XoGlmr+8rhnOS2geptoJhvfrNCYMSnFeuWEI3GPRr1Bxmd3u1H4K2kiu3WH3VO1Nf2XIIGLqIOSZi
	x0rNSVrTcFD1Af5Sy8JVFRnkiYggovgLCL5Sx2rC1s2TnR5+f8fz7Rv2LA6UWM7/Nxjgw8s+J6+2Y
	Ar2yS79HhtoBfkbYDl8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8w2-0000000GVae-2wlk;
	Tue, 21 Oct 2025 09:45:42 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8w0-0000000GVYR-0m0Y
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 09:45:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039927; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dfhpZYKoveexamaQCVElCGaJLiTc2xrns0AMRTqOxr8+7bpkDioT6j4W/+S+AYMpT+WKdqLxxD7F0MQLWc/QQ8g6HQHiHzJ4T/jJojllfiNiimVCPxakiwbk31Pm+fXd0DiT86M2L6B4hMcXQ8peaz+Wng0Hr7KP9i4Ux+B9JG8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039927; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=3XKmOUD68v7s8B225JgJPjyUttooN2f1rFW8XAfBjsE=; 
	b=mbKP6VZKmd3C4VH0IXOJz5gHX/FhnRCllBfEX02h5F9lus+rUnv79ncUb+hId53ucgCYH1AnogdPGcshGT4/i32sugu7U1iHJFpQY6q8cKnlb/Ifrdl+VtMFnp/+Enh1JXA0GrCiTi+kI112lk2+zZkYr1XpsflzRNzEfglA8bQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039927;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=3XKmOUD68v7s8B225JgJPjyUttooN2f1rFW8XAfBjsE=;
	b=G/5mFZbux2cR5YesIjvgQUAo1lD986wBftc5/Wmun+nocEjkWwYAwZPz3ASPtWNh
	e2Lz48nwgMSeGLwZ7aiJQfA+3bDGrCLBJl9ErkSWMVRwdb4IloIsTSfmt9/AeA/HTyL
	CNJyCqpprLWl60yEJHGZUVPdymX7+3KuoPW2MQEI=
Received: by mx.zohomail.com with SMTPS id 1761039925257369.8137969868252;
	Tue, 21 Oct 2025 02:45:25 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:42 +0800
Subject: [PATCH v3 07/13] dt-bindings: timer: Add Anlogic DR1V90 ACLINT
 MTIMER
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-7-5478db4f664a@pigmoral.tech>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=1564;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=qLFixdERw6/lQNqNbS7Kg6KosBChJd6vjjzVCdUNNm8=;
 b=QVg+Wg0v4lyB+LuQvRbsyM+X0St+qBC6zWgPsYRjcIMc7Qpj2Rc4PoAfSdiOuqJRhG9B1Ywqf
 GEli48LJQfAAs8eXixUtp/vX2BPn7ljmxmx9h29fW/xJolvYod2Xyqu
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_024540_278909_3EFD6A6C 
X-CRM114-Status: UNSURE (   8.74  )
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

Add MTIMER support for Anlogic DR1V90 SoC, which uses Nuclei UX900 with
a TIMER unit compliant with the ACLINT specification.

Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 .../bindings/timer/thead,c900-aclint-mtimer.yaml        | 17 +++++++++++------
 1 file changed, 11 insertions(+), 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
index 4ed30efe40525f9e70b7f1b1dda1c833b0c3a40c..cf7c82e980f674afcf59fc726742dc4f49c1a820 100644
--- a/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
+++ b/Documentation/devicetree/bindings/timer/thead,c900-aclint-mtimer.yaml
@@ -4,18 +4,23 @@
 $id: http://devicetree.org/schemas/timer/thead,c900-aclint-mtimer.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Sophgo CLINT Timer
+title: ACLINT Machine-level Timer Device
 
 maintainers:
   - Inochi Amaoto <inochiama@outlook.com>
 
 properties:
   compatible:
-    items:
-      - enum:
-          - sophgo,sg2042-aclint-mtimer
-          - sophgo,sg2044-aclint-mtimer
-      - const: thead,c900-aclint-mtimer
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2042-aclint-mtimer
+              - sophgo,sg2044-aclint-mtimer
+          - const: thead,c900-aclint-mtimer
+      - items:
+          - enum:
+              - anlogic,dr1v90-aclint-mtimer
+          - const: nuclei,ux900-aclint-mtimer
 
   reg:
     items:

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
