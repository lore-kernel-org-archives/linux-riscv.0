Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2806C25B78
	for <linux-riscv@archiver.kernel.org>; Sun, 19 May 2024 18:00:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VIb1QQJo+fG//bmr9pw9yXtnmpJA0KhUh/rfdGHyuuU=; b=1TRkLtzN42xnUu
	duZqJZI1ahdU3jqoBYuyrdy4LbOkJIj/E69Lf2vbRIR0KbPWxPnQSGgROdXHpQnY8tP1qpj2XUL2U
	3K/ZlNp2+w+y2hlcgliUGvIqXaJ1GI9B9/YMzTjP1SUKpcgynYU3n7txzNdG+eFGIVOr6QGqVknB7
	DWKIeME1TW0TuVynX5DtTK2iwZwzNZz8kBzLr9zf2exADSdSKx+hnt39QJtUnu7+HjCfjUKD8LKid
	zwyA1VhSbuzxIxybNS70ymMJSv5aVcbPNbKjZfyA34PiianmGdPnuD4jBvy4g9mcg2kxx74lbi66j
	DsKV28zENI0gY/J/4IVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8kpH-0000000CRul-1lwM;
	Sun, 19 May 2024 18:00:03 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8kpE-0000000CRsG-0Ha7
	for linux-riscv@lists.infradead.org;
	Sun, 19 May 2024 18:00:01 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1ee38966529so14073015ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 19 May 2024 10:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1716141598; x=1716746398; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HB5y4Fy1Uw+dKMHXzCD53I8CL2I1Bp8CZYIt75TaAuQ=;
        b=ApoGCHqM9CtWrJsLZ43uVzfQwdrQtBeXHtLMypItcMX3tgqBgBCjFlUdwX1QUi0BpZ
         LfKKlEc0rwh7H+CR4tlFNUeHBve9fpUHqMP7CKHhB+lWSG+27xxAOzm5p+NwEC0bkzak
         Y1Z5ftgYDY0rzBz3q80F5DafIBzXRyDqUKcNEg11d+arQ+2iZrs783il5HK/HilGtIQo
         Mw5mKPI8Krr1FDKT5LX/s9VzGx1XH6qNxyo9jNggcBlhkbl7lbGKxa/8qQO60aF2UOTT
         y/C1qYL+Wt8AG/51YrgXWP0dvcZNDCzPKZo/+ZIKb5LQt0MZKq2nJC2rNG8fzcp3TWLp
         26Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716141598; x=1716746398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HB5y4Fy1Uw+dKMHXzCD53I8CL2I1Bp8CZYIt75TaAuQ=;
        b=FP6+YkC37CGjP617qq9QYcI7OUvbYUOZh1X8W3vlofBNlPLPi8mbgfU8xLeObT4sJk
         H76BbsGz/OmJKChzqEtnfiNSDYvGTaWbS3d+t3XyY10JT0AFCKI/I1EOfFeDwLgcHaLX
         uClcrsxPo9j9Nwss8X2ejDMmrkQy701lp9GM1E0vj12+MiBt0O5GCwopLuTHmdhPUV6O
         zfCB6TFZoaJo9KARW43NBWe91T7s+Y9X4HaVg4O4+lFdjoIbZR2EP4rx3NJlPG7pDlEO
         fpkoQ3ICSc8CN8pNUm+mZwSHA0chsjVMylrJJ7GDTEJfHFn2IpkAN01MCikX8fdPZa4U
         tmxA==
X-Forwarded-Encrypted: i=1; AJvYcCWiiyaxhv/xMCpBgnXT5x/+vuK6MLQxl52/Xdib7vNWZxImUby7b0Lq0sXpQyE1qS38K40NmPj2kKK4bTAkvtrS5J1tAHaz/SA36MhqFXKV
X-Gm-Message-State: AOJu0YzH7hrcVijxGHPQaA94aA4JPaxjrzen5Ry68XDT0pEVCVVp8qzI
	ZoATiQmpXueviDnlA70hDPhbtQOYK7LPlU8/8e17lkJFZNMsaNuw
X-Google-Smtp-Source: AGHT+IFBTgvJd2LTs7qh/Ad8VvDv1vEGhqTvOWriZjtmSKNU5N91CUbRn8JXTv/uVEqY+dr6ofCLKA==
X-Received: by 2002:a17:903:41c7:b0:1f3:3b0:61a7 with SMTP id d9443c01a7336-1f303b06359mr775465ad.12.1716141597893;
        Sun, 19 May 2024 10:59:57 -0700 (PDT)
Received: from localhost.localdomain ([223.178.84.79])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-1f2fc5a015esm9424325ad.14.2024.05.19.10.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 May 2024 10:59:57 -0700 (PDT)
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
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] dt-bindings: riscv: cpus: add ref to interrupt-controller
Date: Sun, 19 May 2024 23:29:06 +0530
Message-Id: <20240519175906.138410-3-kanakshilledar111@protonmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240519175906.138410-1-kanakshilledar111@protonmail.com>
References: <20240519175906.138410-1-kanakshilledar111@protonmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240519_110000_136973_406A6674 
X-CRM114-Status: UNSURE (   9.29  )
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

removed the redundant properties for interrupt-controller
and provide reference to the riscv,cpu-intc.yaml which defines
the interrupt-controller. making the properties for riscv
interrupt-controller at a central place.

Signed-off-by: Kanak Shilledar <kanakshilledar111@protonmail.com>
---
 .../devicetree/bindings/riscv/cpus.yaml       | 22 +------------------
 1 file changed, 1 insertion(+), 21 deletions(-)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index d87dd50f1a4b..b90bb83c8e73 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -101,27 +101,7 @@ properties:
   timebase-frequency: false
 
   interrupt-controller:
-    type: object
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
+    $ref: /schemas/interrupt-controller/riscv,cpu-intc.yaml
 
   cpu-idle-states:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
