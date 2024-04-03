Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED7CCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 20:36:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TXlWZq/JGTgKSFPAe8wJefAOtEJXzzTYVbHagB4PUtw=; b=eLPd84bt6Wvm1m
	qTPsFX1s9EYE4vhAF7QBOmvIOCvbBrO8wTwcdcQFU6LYSRjSbW8rPxl2smr7oygMqPEelDvsfSVDK
	gKx2L4quwTeLxjs+rVElRHMf34GAOBAIjUh38osR+5W46xNfcN10om6gLZ3e+rRnXhFWCKgq/NZn6
	8j09u2WpM1lTYdt5HLfiLUszHaMzta3xBMAl3TvMfo8gzTUCIxwqD0Vecf1bJq7UQMhFH2JLDKqvs
	L69RdVWFSbIzuYkGgdXidjKwttew+bMZ2BtlXtFmjDtDbM66MpVW1FU78vLhtLhaAqR5/GckdEulH
	n4asnG24V2FlghI34sTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7Lc-000000006rz-3puS;
	Wed, 03 Apr 2024 20:36:40 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs7LY-000000006qJ-2DQ8
	for linux-riscv@lists.infradead.org;
	Wed, 03 Apr 2024 20:36:38 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3436ffe05c9so138136f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 03 Apr 2024 13:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712176594; x=1712781394; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZUH7OqsY6sf88nvHWT1W52xeXKt/+dN6doaNx9JrqxY=;
        b=hWBz2GcRu1vEchU+lonBWlVM3Aaek+knkqgR74CmiLO7jJiEQvzkg8rmZRHvIjBuOW
         NBa/mB2m9ZqoMJ4Id1P/qEG9ejUx7uwBp33PsKcJaD+zCRKZfl6x5F68JJJnw4n51Waz
         O4xmTi4U+JJMLEWnCevmbIrfJ1tJcvQFG6bDpZCPmBsjPtmi1WUKowhg7IvB3QZ5lPvQ
         tJ6jB4PtwF0rJvKzecFaWcO0dnFfk0aLA7Iw6SNp4lxYgFxSACkEmZ8HBdNQ7Hppe1eB
         DunVCEbo514gU7A7H6RHwszuBeW90z6Prjm946xG+4ehpQDSev7k5dK1ZCZvyPg+tbF+
         AeOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712176594; x=1712781394;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZUH7OqsY6sf88nvHWT1W52xeXKt/+dN6doaNx9JrqxY=;
        b=aBk0R5cIQPK+PtYzKmNh5O8vyqAlLQb3xtIta1GjLzcqn3utvny468ui7kM4I+b0rN
         AdwCsHHiX7S05PaYvOTuW3q8HTOgV2eUqsMUOqTszo9XR5MX6d2As/euFG7IyGU/s7Ee
         U32W1i5tNx6BN0raQrm0Qckgw4Is9zBsX55umOPEt+nk4mTY75Oa8YiCPjAGCTi8BYKW
         T5Z1CiR+V4GwDtX76OSBAtUWJgnHoads9J7tNV27dAevC/3uc7+bu8GUVOGsmWl34H8r
         UvO8qrohWOUS9uFRvZGyo1EWYIoj3tqEoAnPK/D11IwTVu/yWGWsYgeMlYfUPJUImlBV
         WmKA==
X-Forwarded-Encrypted: i=1; AJvYcCVbIPqcj52+WpWeC75YoTkJkILP1vETEokdUPkriolOQbOwtazzFkOuVmvJa4h31nQR1BBHmop21B0/BFUYErbQKkBXBsVZmIcoCezNEKmi
X-Gm-Message-State: AOJu0YyZw77w11OyEaaCe6XheHTKvk2i2eSVSmzjOE14BDwt5U8QdrbE
	kAFBE/1oo6MbMmaHk/rLCZIMdiX76u6VI5eKg4SISAFFiZQyqbOZ
X-Google-Smtp-Source: AGHT+IGNTM0sZ87+Wmh+Qg37VGEcAylBAuD8K4vBkdPoDwX5QwmGHCcZNo2VTkh442bBlxrZTK+PUQ==
X-Received: by 2002:a5d:5451:0:b0:343:7d3c:ddcd with SMTP id w17-20020a5d5451000000b003437d3cddcdmr425201wrv.1.1712176594421;
        Wed, 03 Apr 2024 13:36:34 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2500:a01:5eb:3d93:f2b6:25e8])
        by smtp.gmail.com with ESMTPSA id p4-20020a05600c468400b00415f496b9b7sm244910wmo.39.2024.04.03.13.36.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 13:36:33 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v2 1/5] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/Five SoC
Date: Wed,  3 Apr 2024 21:34:59 +0100
Message-Id: <20240403203503.634465-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240403203503.634465-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_133636_594138_C5BE0E4C 
X-CRM114-Status: GOOD (  10.62  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document RZ/Five (R9A07G043F) IRQC bindings. The IRQC block on the RZ/Five
SoC is almost identical to the one found on the RZ/G2L SoC, with the only
difference being that it has additional mask control registers for
NMI/IRQ/TINT.

Hence new compatible string "renesas,r9a07g043f-irqc" is added for RZ/Five
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v1->v2
- Dropped the checks for interrupts as its already handled
- Added SoC specific compat string
---
 .../renesas,rzg2l-irqc.yaml                     | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index daef4ee06f4e..2a871cbf6f87 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -21,13 +21,16 @@ description: |
 
 properties:
   compatible:
-    items:
-      - enum:
-          - renesas,r9a07g043u-irqc   # RZ/G2UL
-          - renesas,r9a07g044-irqc    # RZ/G2{L,LC}
-          - renesas,r9a07g054-irqc    # RZ/V2L
-          - renesas,r9a08g045-irqc    # RZ/G3S
-      - const: renesas,rzg2l-irqc
+    oneOf:
+      - items:
+          - enum:
+              - renesas,r9a07g043u-irqc        # RZ/G2UL
+              - renesas,r9a07g044-irqc         # RZ/G2{L,LC}
+              - renesas,r9a07g054-irqc         # RZ/V2L
+              - renesas,r9a08g045-irqc         # RZ/G3S
+          - const: renesas,rzg2l-irqc
+      - items:
+          - const: renesas,r9a07g043f-irqc     # RZ/Five
 
   '#interrupt-cells':
     description: The first cell should contain a macro RZG2L_{NMI,IRQX} included in the
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
