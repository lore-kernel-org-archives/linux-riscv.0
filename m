Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D84AC25B75
	for <linux-riscv@archiver.kernel.org>; Thu, 23 May 2024 15:49:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kfSTo4DTelA/LnlcBCsh9RWu99TjqnOJtyq3FCgPH8w=; b=4Jscd2SFO7+cL6
	jLZ9AP7oAB821x1GIZHtqkqvHW4ohMQ88lYxY0ZhmGNhAmieOL0odQ9ACQN94W09jIW1/V4WAcTa0
	vUkZjQjWoxffabC4oxrnikh8UgkuqLEmkKK0tdJWZqmvUjouzzzkiA5mIQ6lelVo2yQoObLvqeBc2
	+7/1Y74vxXrxQHvup0jc6lhwRTrY2PwhImylzRaYYdyqYaPM41mq5kcJ6/wCemPskBozVbyrnCqnQ
	JHG+NHAeFI+ALEkus2mFKlnky0pchBEhBdIf2yRbbAoG+tf6N+QEunanDqXp8fgIISDWPeJ48b47k
	RXluynYneXR/tLFGbNYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAgk-00000006hbI-3O3B;
	Thu, 23 May 2024 15:49:06 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sAAgi-00000006hZk-2A0X
	for linux-riscv@lists.infradead.org;
	Thu, 23 May 2024 15:49:05 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1f32864bcc7so13920535ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 23 May 2024 08:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716479342; x=1717084142; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hYf12GLSAWFqtkB4/l4ObCrY/lFiR1gNXubtFx1aYgs=;
        b=SLOQ6g17uXgkzNyEiDN3g9B5jVHZXIix4wxFPGuVbWJtniixDKp+8Qz572DvyOBqZZ
         xqs/mHLUuG1YKhEJsfdykW7WQ5Zow0LuR2KYk3Nj9fZJr5QXokz8nWAbaNrmCE3l/K+1
         3BG91u7P7riy9rPoAepAnFq/QoA0P8SW470nrt2KRepV7eeIt1bwyabD2u0nlPRF3vwt
         ysXbTiuANkaAKbkzqvm6iLIlR2bqjazSTwrmdzfy326WxMtzneNirJY8zt5W7tife+Is
         /ugjwLVseiFU46dGsQtArZk6dZtWuQcgtMk6DJvCbZHizCE2QPDBT2NqUtRtAHhOSmwk
         PHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716479342; x=1717084142;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYf12GLSAWFqtkB4/l4ObCrY/lFiR1gNXubtFx1aYgs=;
        b=k8crL464RphPRfRb9y7iC1ZuD4VZhg1v3ydwDO1fFBvmbSbI+xJYxHv6Q36mAtK6XL
         qGpN5mOtADL95YkHq6lrr16uXtSqpUd/d2xk7UoGAGGSr+eDtRG+SVv/s5UJaVosPMtw
         p8hRxbUgrMK1dij+TaPI9C3GF3Yjc0gLZ6g7pGWms4RqP2ZTLdocKo8bc+8wyn9F0PBl
         +ljyAdZT16Z50q6d4JW8VA0uI5tBSVDnEirEgWhWZR3IVQbfww6P31Omys8KNx+I/8Xi
         bR1wHyR7kQmVowmcTwKZfmFRCpvgIMm/O51qSo/mvRDZZcO55ChXx6GSTLTaXT9GoMYY
         /xTw==
X-Forwarded-Encrypted: i=1; AJvYcCWzkfIVfxpQ/GJdsdxdUktfoyyLoG+wjvqNxfkyQmsXkGNOTj54Y6410U28qr18HKb7e0BTfrnoB1v/UbgZA5IoXIUtEgo42maTo/P8PPBm
X-Gm-Message-State: AOJu0Yxpd8cRTevtZQdfUoGMuWfU/hHlYG+c0RcTFQ42GAQNdWFMEg1v
	t4vT0OOZg+NDXuHmt8q4YShUOqUk+cnKcjG8CfTaa3n7IBgxv2BFqglg2Q==
X-Google-Smtp-Source: AGHT+IFp+EFEz2Up+5smpmBNDpXiFMYzk1R5BzaQXFEbAzaQyIkugWlEEJZN3Xd8zPy8Q4OJF/nAiA==
X-Received: by 2002:a17:903:1247:b0:1f2:f3dc:43ee with SMTP id d9443c01a7336-1f31c967139mr61423015ad.3.1716479341924;
        Thu, 23 May 2024 08:49:01 -0700 (PDT)
Received: from localhost.localdomain ([223.178.81.93])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f3361a6678sm18321085ad.178.2024.05.23.08.48.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 May 2024 08:49:01 -0700 (PDT)
From: Kanak Shilledar <kanakshilledar@gmail.com>
X-Google-Original-From: Kanak Shilledar <kanakshilledar111@protonmail.com>
To: 
Cc: Kanak Shilledar <kanakshilledar111@protonmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RESEND v3 2/2] dt-bindings: riscv: cpus: add ref to interrupt-controller
Date: Thu, 23 May 2024 21:17:50 +0530
Message-Id: <20240523154748.22670-3-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240523154748.22670-1-kanakshilledar111@protonmail.com>
References: <20240523154748.22670-1-kanakshilledar111@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240523_084904_602964_BA322597 
X-CRM114-Status: GOOD (  10.26  )
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

removed the redundant properties for interrupt-controller
and provide reference to the riscv,cpu-intc.yaml which defines
the interrupt-controller. making the properties for riscv
interrupt-controller at a central place.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
---
Changes in v3:
- No change.
- Rolling out as RESEND.
Changes in v2:
- Fix warning of `type` is a required property during `make
dt_bindings_check`.
---
 .../interrupt-controller/riscv,cpu-intc.yaml  |  2 +-
 .../devicetree/bindings/riscv/cpus.yaml       | 21 +------------------
 2 files changed, 2 insertions(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
index c9c79e0870ff..6c229f3c6735 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,cpu-intc.yaml
@@ -61,7 +61,7 @@ required:
   - compatible
   - '#interrupt-cells'
   - interrupt-controller
-  
+
 additionalProperties: false
 
 examples:
diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..f1241e5e8753 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -102,26 +102,7 @@ properties:
 
   interrupt-controller:
     type: object
-    additionalProperties: false
-    description: Describes the CPU's local interrupt controller
-
-    properties:
-      '#interrupt-cells':
-        const: 1
-
-      compatible:
-        oneOf:
-          - items:
-              - const: andestech,cpu-intc
-              - const: riscv,cpu-intc
-          - const: riscv,cpu-intc
-
-      interrupt-controller: true
-
-    required:
-      - '#interrupt-cells'
-      - compatible
-      - interrupt-controller
+    $ref: /schemas/interrupt-controller/riscv,cpu-intc.yaml#
 
   cpu-idle-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
