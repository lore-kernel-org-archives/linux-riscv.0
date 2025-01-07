Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06ACDE77199
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jan 2025 08:02:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pr4KYCxJzLZhD1z7eVb+oqPs0W9GTz+cpV8t7NFzv3g=; b=ZVyg8Jg7Rrc9M5
	aQtnxeORuZzUDuaTcrakcO6BWCLGxaUta25JWE08NKlNM5A0g7A19Nc00VdgvQeBq7dlIKfbGDL4w
	tYxq8o7qRaXO1ygloeLzom5x+OJffwT/VGrSudW98zD5gehrt0q09xAYONxC+ExlPaIQ4b7gza4Qm
	/TCuAsP1SiRmDQKV1ovtCXYI+VtdqDIlAcwqxtVlWtW77itJEJnmoxcF1qWh4XmmK2YvH4K6cN9l8
	ZDZlYJM/cRZauD4OPiiB9yv99/K3mR8ZRD4A3icDHfFmFBGEGU6qglmjzBAcKxApsUfGdAAl0gid5
	zwIZ7OgkwTHmeMA90fww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4XF-00000003pyk-2OGt;
	Tue, 07 Jan 2025 08:01:57 +0000
Received: from esa4.hc555-34.eu.iphmx.com ([207.54.77.171])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV4UY-00000003pLY-1r8W
	for linux-riscv@lists.infradead.org;
	Tue, 07 Jan 2025 07:59:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=mobileye.com; i=@mobileye.com; q=dns/txt; s=MoEyIP;
  t=1736236750; x=1767772750;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9nwv33VjUvdLIzS4oCy7+5ohQ4BFa10hVGrAN2bi/LI=;
  b=uEYCC2x9KV0vk6EsLZLngRldTYfdkah2BO5FSCsTy4UJcAiI/B5xrhWW
   vCEhU0F8VjV3KjwqDkme/k9tXMkO4jIRC6mkZLX3oM2R0RCh0/PHIjmiG
   uP/EQSUS+9Xs/g52OZ4cFRLmnTklFGppuYFUNEl4xtcw0+rWL+socQYEW
   o+7EIdKm0IuPSsaF1JzEtBPEgqOY0DVB9bwD8Ze0MZPk3XWOmix6tJwV9
   15cG7WRScaieL0UkUZgqBw5b0YKElsX6q7eSl45wmyokv0DBiAZUyiBAG
   wsPDVRWOiNQ2jRXiBBy7VYky7Dj0mEP3EcV7SXiIImMXnNBpSnr7AgXZl
   g==;
X-CSE-ConnectionGUID: gi0FypvFQ423QyfVn3YqfA==
X-CSE-MsgGUID: 90x/ZCtZSLeCWjCzYW+HEw==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from unknown (HELO ces03_data.me-corp.lan) ([146.255.191.134])
  by esa4.hc555-34.eu.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jan 2025 09:59:05 +0200
X-CSE-ConnectionGUID: RrQEYpOWTIem5mfdhkoE7w==
X-CSE-MsgGUID: SBh9lqgzRwmnZ0+UuhTgNw==
Received: from unknown (HELO epgd022.me-corp.lan) ([10.154.54.1])
  by ces03_data.me-corp.lan with SMTP; 07 Jan 2025 09:59:04 +0200
Received: by epgd022.me-corp.lan (sSMTP sendmail emulation); Tue, 07 Jan 2025 09:59:04 +0200
From: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
To: anup@brainfault.org
Cc: aou@eecs.berkeley.edu,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	tglx@linutronix.de,
	vladimir.kondratiev@mobileye.com
Subject: [PATCH v3 1/2] dt-bindings: interrupt-controller: add risc-v,aplic hart indexes
Date: Tue,  7 Jan 2025 09:58:34 +0200
Message-ID: <20250107075835.1421602-2-vladimir.kondratiev@mobileye.com>
In-Reply-To: <20250107075835.1421602-1-vladimir.kondratiev@mobileye.com>
References: <CAAhSdy0U3VXqKK-pReUSo5PYJhr0YGoO6pT194Me0Q18dHbE9g@mail.gmail.com>
 <20250107075835.1421602-1-vladimir.kondratiev@mobileye.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250106_235910_973572_FD382E18 
X-CRM114-Status: UNSURE (   8.87  )
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

Document optional property "riscv,hart-indexes"

Signed-off-by: Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
---
 .../bindings/interrupt-controller/riscv,aplic.yaml        | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
index 190a6499c932..bef00521d5da 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
@@ -91,6 +91,14 @@ properties:
       Firmware must configure interrupt delegation registers based on
       interrupt delegation list.
 
+  riscv,hart-indexes:
+    $ref: /schemas/types.yaml#/definitions/uint32-array
+    minItems: 1
+    maxItems: 16384
+    description:
+      A list of hart indexes that APLIC should use to address each hart
+      that is mentioned in the "interrupts-extended"
+
 dependencies:
   riscv,delegation: [ "riscv,children" ]
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
