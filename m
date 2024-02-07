Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 236CFC4829A
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Feb 2024 05:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5sOVtK8NYhlcud4OQQcHNJWW/nbgZGL7xurUR8F86io=; b=2BLrHfj1gSfR3s
	3nllQBbvcOC4XM9FowW8IL7zNJTdZDxxZbLooQCEFS7qumKOThOpVCyxmLfi1h1gy7tT0bSGFh1j+
	M9wHny5mXuueu76tIVQB3lWPuWfJz2bDfXD7H8gkGBk/LVAXPHBYDhI/gcjFHufuAQn8qReTB51ch
	/36iZNXLY0vo7uEpwpSQiLQHoQhaip76rFj9Jc54RCuyC0ZAm3WCSzA8rqS3ZVmTvWqVOeUFtrKjK
	fb2lIB3MZ4NeWvJGG9+RSBlsHLhQwnHbBwyDXJN+vDEUvCUCzkQmDtsjG39Ikbh971ywlwHZdRrs8
	RXsOQKdxmkQyjo24Z8hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXaxf-00000009mf1-2r0A;
	Wed, 07 Feb 2024 05:59:07 +0000
Received: from mail-oi1-x229.google.com ([2607:f8b0:4864:20::229])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rXaxc-00000009mec-3n0K
	for linux-riscv@lists.infradead.org;
	Wed, 07 Feb 2024 05:59:06 +0000
Received: by mail-oi1-x229.google.com with SMTP id 5614622812f47-3bfeb155d31so136860b6e.1
        for <linux-riscv@lists.infradead.org>; Tue, 06 Feb 2024 21:59:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707285544; x=1707890344; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OGq4nXKDwtVR5j58DrEt76XQbCTlsrAlFhIvJM2+AAY=;
        b=Wmt3jXoJjjtHal/JWsSp4ih+Q25Y4FtygeRR0hZ2v1m1J0Ds4IBOImEFldu6weUeJu
         jmRx64SD0o6koxsToe3geSq7ngm1ZG3Ii8f+Pz3V1KvnbV+Ycpk+QAFAA97fsJMdzzm1
         A/JR1zv7ANPQ7uncPpd0BEyD4xrm/cqasFeQ9DfoR5HXt+oxSSNw7CtOhb6nKJXNQe/M
         qtVnd18zHQe+kygxH236ppSbA9VV2BqzczgT2IYy4AwAJNDRq1I7IWdWZzE/p2jpDise
         6NJv/PlMcuOSGgMgflBKHS/XAxkAOfepwWLy5+s7+k1BVB4Y2zLnZhv9RCULNjGhbdLZ
         1vbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707285544; x=1707890344;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OGq4nXKDwtVR5j58DrEt76XQbCTlsrAlFhIvJM2+AAY=;
        b=DQARD07hKYgAd4pIP2/z/BxtlyYn6RKSo0wDwAxiIAiycKXZRxCVvGADc6aoy9gZ8r
         iMSRJCHfK85jKibwOHj15cFX7mGrV5Kz+RVtILpdtjwGflJAG6jI0sr/oJynFy5Xhbvq
         4yJG1O86brNFY/gVomvBpS3RoTVxrbU840lvdv6hWmq+KDqFh8EZ6nUmW4tBWNrNB9A4
         YQZLZCEhYKZ4FavghYWviT9u/DBB3KSVBwGcbPjkuWnQR0Wef9L+mcuktzQB6GONqZMD
         xVW9wHZgc97RzgauWFLEM9iDK1L5e96xB2vjUhNSAu5z7Qk/JKHVVMKfRpfjBPWoFdqO
         D7+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV2As7kLGVsPWyNket4BWux+/4HOIbA+M7dg+kWsYs/bKWefovDMS2xwBBmaCsBTDLoPXYbWo9dbGcJc0sMacVozTaZf6lTwG/PIz2rUUZV
X-Gm-Message-State: AOJu0YxAdCbIxVDmL56HB0H1fdQodeeNOcyOmIazHyCVhLDDZHP7FDUK
	8gMga7N6wUcvXM39vWHQ5jL0GMAkAeeYTzABLhfKxRZgIet+QnR/
X-Google-Smtp-Source: AGHT+IFJ1uSNZr2F74eetYgjKoROr9ghfF/UDk/owV7CNEBeRmt4UUrcwE0whoI8WvBXETOUI3mG5g==
X-Received: by 2002:a05:6808:285:b0:3bf:e3b3:c463 with SMTP id z5-20020a056808028500b003bfe3b3c463mr4350773oic.16.1707285543070;
        Tue, 06 Feb 2024 21:59:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV0duPcRBbTWYM8jn+7PE7RP6z2dBYtvebosoE//mZ5l6hwKI+mLHx5/yl1UR6G0GrNkgdhwJHDsTGisgpvcXzRLzv21KzIid2gVyodDP17JA9YwsKlSMQXj0dYTNrgCsOPfW4dYVvQmTLCbwStWNydW3RJNfxrsUjb5hg1z7cLxtX/j69e76jnu51gBxe9Ok7tsn0NdNaxKf4zwAwizSYVxoc478AZIW9ljOm5n7Qxb94gzD2F2dHG5oXUEySdwo6vB/9qc9qUy2llvNJohS01XFvTM2Cw8CJ2mou2wo4Jq+emZC34mweT7rAaiZjiJ/GrWp3UE4BnEQycWs8L4v9gmeMJDjjAwPR5ZK7493t7Qz/0mVJsKEbORBEt1aclerfmovp53FCqcBkNLeoj9fAo+EChf+LXLcdiscs6g2LyVb2U8B/FrrK2uetIXJOrjjNnoPF7CANgIBDPG+T6
Received: from localhost ([46.3.240.105])
        by smtp.gmail.com with ESMTPSA id f26-20020aa79d9a000000b006d638fd230bsm567312pfq.93.2024.02.06.21.59.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Feb 2024 21:59:02 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Subject: [PATCH v1 1/2] dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC.
Date: Wed,  7 Feb 2024 13:58:55 +0800
Message-Id: <20240207055856.672184-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240207055856.672184-1-qiujingbao.dlmu@gmail.com>
References: <20240207055856.672184-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240206_215904_969494_C398B6CA 
X-CRM114-Status: GOOD (  11.01  )
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

Add devicetree binding to describe the PWM for Sophgo CV1800 SoC.

Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 .../bindings/pwm/sophgo,cv1800-pwm.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
new file mode 100644
index 000000000000..7fcdf98b27fd
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/sophgo,cv1800-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800 PWM controller
+
+description:
+  The chip provides a set of four independent PWM channel outputs.
+
+maintainers:
+  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm0: pwm@3060000 {
+        compatible = "sophgo,cv1800-pwm";
+        reg = <0x3060000 0x1000>;
+        clocks = <&clk 60>;
+        #pwm-cells = <3>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
