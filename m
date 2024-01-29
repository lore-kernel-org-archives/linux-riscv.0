Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D70FC47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 15:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6B/7zeKw6g4lUG+mstXhpOQcMklhTPHvohvNVV2ji9Q=; b=hDd+/RAPWtt2VV
	iHI54cbns1l5A5lsnw0Kpxtr5YgFv2kj/hQMvFXrZ9ZwSJHA5OBrjGmIqD17weIpvRrG6Bi6t1/rV
	2KwFfsbZmIpfLrrQxknX/FaIvuARPHish9kltFGNqdlf5xCyHj3EWwFmDIm1CJPSfYEhkH8iB8Y5i
	KPRr1IFugDJGkarmxWTegIOq6DC1WxRmFGBjT/iTIWVT7EUcThugvhqsXRvfQjTs+L01an4d7/dXs
	jhCOhmKYniMxjjrSCWVr7hIjsSC5cbBYPGWdMtc+ee0D/bzNzNM0PyRwpKUGOz4Q27+jNz6jQb0/2
	b7MnIqhhRPAOacMqvA+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTND-0000000DE3i-3BtE;
	Mon, 29 Jan 2024 15:16:35 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUTN7-0000000DE13-461q
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 15:16:31 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-40e72a567eeso48202545e9.0
        for <linux-riscv@lists.infradead.org>; Mon, 29 Jan 2024 07:16:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706541388; x=1707146188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gGa8xFRwP8zLCWj6u5lZzVVx+K8OLPxZ4f43XzHIoys=;
        b=gnq+Qc3I9oDPc/q36GUdV8KjNPrZ2hC62E/yQKRCcW2xEbTy3jbBXTjqKMSjWVFAdf
         2zu9LlrN5AO+hyYPLLMQsMRUnXzKtS2cGtH4DizSbPaGZTKLAFsE34S6/8NRPCqKXaly
         YDlkz/zIpsa2zIrzq3UQmTcmBPlCwhXY/W1mU0r6hWc6n3zwzQah8Krx7OGg6KrCBmCO
         rNYmf9dZ4l6kEgJln9388DY0MKXmJiNMDdjVZP/iD9NBJ/VS4Nv32ZAjIePcnpmqwrYh
         /XB+71cIsuHC3dJCdZIJ3i0qWYSYfhDKElWstSkI1Cru2cQRFY63lntpQupontSa17wB
         6kQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706541388; x=1707146188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gGa8xFRwP8zLCWj6u5lZzVVx+K8OLPxZ4f43XzHIoys=;
        b=SMAYJFjIwWOkWwy/GKF46CzG/yj6cGLZopPquHbitNMdmow+oNHMzEm53oH4kwyDQ2
         YWgbF5AIpjnqBcQtkiqNP8U2bdPwR2PzUssR8hlZAo6p9sEXqX5pntI4LVxD3STzjIML
         J6FgxzuXy6OAuuFIMa+xbGwelMhEr9PCQ9nKl+abQTmXLk2Q/YzA8xPjfnpKEvSk17oN
         PMRc/+5gbdc5PJZM0ocz9YXvfDrHp7nBq6xxuzS0pp9My+z5T4Dl+hcPeZyZfy9imPJ8
         v/4I/yiWROPWjI/9c2LuKR5mF1hgytG1cssKZcVO+m2phm51/OSrudQw2KeXmqWkRts7
         wLLw==
X-Gm-Message-State: AOJu0Yzl+U3NdvXWJf7x00szfyw9OHHc+7cbcjBT7uzFAzt8EIKmqyKX
	Y/UvxnxbMVcn7hRXkxejCl1vAZFX0Uey8dvOLhg0TstWD7d7+n0SYMvyo9X0
X-Google-Smtp-Source: AGHT+IG3HsuD9SaUwYrvX4rmWSShZVOxOyMaqp6KeQVa+qLdgqFTIv45DCNzraZDMw6ntN1GjVYCWg==
X-Received: by 2002:adf:e105:0:b0:337:c176:6549 with SMTP id t5-20020adfe105000000b00337c1766549mr4168842wrz.65.1706541388215;
        Mon, 29 Jan 2024 07:16:28 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2500:a01:5616:a18c:ea50:2995])
        by smtp.gmail.com with ESMTPSA id h4-20020adfa4c4000000b00337d4eed87asm8397774wrb.115.2024.01.29.07.16.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Jan 2024 07:16:27 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Thomas Gleixner <tglx@linutronix.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH 1/5] dt-bindings: interrupt-controller: renesas,rzg2l-irqc: Document RZ/Five SoC
Date: Mon, 29 Jan 2024 15:16:14 +0000
Message-Id: <20240129151618.90922-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_071630_101718_FB711BAC 
X-CRM114-Status: UNSURE (   9.31  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Document RZ/Five (R9A07G043F) IRQC bindings. The IRQC block on RZ/Five SoC
is almost identical to one found on the RZ/G2L SoC with below differences,
* Additional BUS error interrupt
* Additional ECCRAM error interrupt
* Has additional mask control registers for NMI/IRQ/TINT

Hence new compatible string "renesas,r9a07g043f-irqc" is added for RZ/Five
SoC.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 .../renesas,rzg2l-irqc.yaml                   | 27 +++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
index d3b5aec0a3f7..3abc01e48934 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/renesas,rzg2l-irqc.yaml
@@ -23,6 +23,7 @@ properties:
   compatible:
     items:
       - enum:
+          - renesas,r9a07g043f-irqc   # RZ/Five
           - renesas,r9a07g043u-irqc   # RZ/G2UL
           - renesas,r9a07g044-irqc    # RZ/G2{L,LC}
           - renesas,r9a07g054-irqc    # RZ/V2L
@@ -88,6 +89,12 @@ properties:
       - description: GPIO interrupt, TINT30
       - description: GPIO interrupt, TINT31
       - description: Bus error interrupt
+      - description: ECCRAM0 TIE1 interrupt
+      - description: ECCRAM0 TIE2 interrupt
+      - description: ECCRAM0 overflow interrupt
+      - description: ECCRAM1 TIE1 interrupt
+      - description: ECCRAM1 TIE2 interrupt
+      - description: ECCRAM1 overflow interrupt
 
   interrupt-names:
     minItems: 41
@@ -134,6 +141,12 @@ properties:
       - const: tint30
       - const: tint31
       - const: bus-err
+      - const: eccram0-tie1
+      - const: eccram0-tie2
+      - const: eccram0-ovf
+      - const: eccram1-tie1
+      - const: eccram1-tie2
+      - const: eccram1-ovf
 
   clocks:
     maxItems: 2
@@ -180,6 +193,20 @@ allOf:
       required:
         - interrupt-names
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: renesas,r9a07g043f-irqc
+    then:
+      properties:
+        interrupts:
+          minItems: 48
+        interrupt-names:
+          minItems: 48
+      required:
+        - interrupt-names
+
 unevaluatedProperties: false
 
 examples:
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
