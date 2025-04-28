Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500B5C369D1
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 01:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pZIB4R3h1kNF45A6MxImVnmEqLbNFFlRmvAiTyep/1A=; b=x90GuS8keaYIcg
	UyTwqItIV5hwpDA3ztkILBQTy3sVTY61vgdF+L6/LnwNswbmPAek6Lk0wN/RR3imdU6DI5senLztW
	pJ5c6ncivdKvy0Uz7TflcY5KUwrJ2GUUMwOSAZljAbQ2G/HbnzMNY6f7oZ9dObze8Ql0aVo199ROd
	F46TijkS4wkatzDL6bgY3wS8PfO1DCCEn1lin6FPxRl6YhBOfuQUP9n5eXulQ91TxCfNRpYHeulLp
	KbY2umftlKdyIZrHUqmtcHsw+qLzxFt9T7GVE9eyakRnZ2cDXD6/8+HaDmIgXO/DCSlhU4skR4hXN
	p/51kC9q2z08neKkMysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPc-00000004Had-1Vab;
	Mon, 28 Apr 2025 01:36:00 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9DPZ-00000004HZc-2ftr
	for linux-riscv@lists.infradead.org;
	Mon, 28 Apr 2025 01:35:58 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-309fac646adso1984003a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Apr 2025 18:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745804157; x=1746408957; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHBvgY1YVP5MIQkksIw+XJJlNkG/WcVVicP7k946nis=;
        b=lyfVENBSmKuhyslQ/L4wy0bb+rSqKuEsKaERMrJqX1wo4TabpYNa+QWql8sFpMGGd7
         LVVzt+AL59PLmq9d+O+5cKQM1yDvTKI8sGxGN0oI08Q9ejSCcKqpQwMLeyhSDbfaNUCl
         /Qa4rXxTsx8+paDUHW46YZUQuZNk5d+OUcAW770N5LLSh6HLUG/R3uS2o/4G9CQamTxw
         r1sVJh4b23HIPJ5WF/rSN3/WKIpV24PhQBRF8UpQShE3RLose/eYhgT0E9qPJ9daEK/e
         Mj0BobNZlvb9QslxmJ2ctG8MnOHa0cwFMpXkWajuQ2moDn5X9/bYFAo0sSjcRSeb0bGo
         hCGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745804157; x=1746408957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHBvgY1YVP5MIQkksIw+XJJlNkG/WcVVicP7k946nis=;
        b=Ugfc5EcjKkcdxfwTcuQ/s9VIRTtulz8KtlSKvDVGz5YqNsZqOTnfPt39GU30+kQ29r
         vYPzTG7tvoL7WvaZPZdgOiesuBSdXT5A4u/T/Jw07KD7Por66f4EuCixCG5fpwjKfXkz
         AlBB6GSbuyuLWzYipE33eTIARLN02Egvdn2iheeS12BF9HU0Op7Y1oQpbdnhhCORrp15
         DltrdexIENhJ1HwsIyYQkLJOboTNwmaexZcgdoxHKnxe26K/wJG2qmNbDa+VBzEQxTvO
         XopoDmNVjTYEbqlCsehdnOaqW0Is1F+To+k7bQ9/uL19ybjMLu7HUQHIht2Sj60mwIEx
         al5A==
X-Forwarded-Encrypted: i=1; AJvYcCV9Q99nahevIQkfL/XldtmcnFmMiVsPGYDe79DLHqvVqRd4hAnP8S8OBKjgoCKhv92xqsR8eonqWK4yLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/Ylw5hy49/Cfv9lHpOLL8MCKzYMxL51fsHOh3XDs19Aun534m
	lESoQw4jr52VplOm4UmmQZw1j5N8n3dcHV7F2sGQawzQbL6eqFbk
X-Gm-Gg: ASbGncsLZrpBG5ZgjZ0M8anYrF1vOMcW2+i5V18aJeJPhrX+o/QOtGhJRojIsKCeHmw
	WibZiNX5htuxXzTehp2qiDSyYQ838czKhoxiIW5fUkTDV5IbopU3XgPXXY+g7fwnsVQdNUHeMDe
	gJ7QnMMmokmy7TeIY4wd33UkDjzDaTctHFDYRiK71yoKVg8zLxg/rzNY3X1hYFamzn+TVp4hcGD
	ZqYcnYEYK8DJUZowRH/DG5cvGgKykzlE6dav+4sGVy+1aEH7vYwZLpkNMKl62IOAiOU595yKX9o
	+52m8SogAd6+
X-Google-Smtp-Source: AGHT+IFqoBqa1cKvvhGBCQiK2llHcQRAb6wNABgaxcrqM57k4VTCHHFQ9C6HjSqiASDd5djKAcaSlA==
X-Received: by 2002:a17:90b:5870:b0:2ee:c30f:33c9 with SMTP id 98e67ed59e1d1-309f8a076f5mr14749294a91.14.1745804156600;
        Sun, 27 Apr 2025 18:35:56 -0700 (PDT)
Received: from cu.. ([2001:da8:7001:11::460])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ef03bb26sm8508671a91.6.2025.04.27.18.35.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Apr 2025 18:35:56 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v4 1/3] dt-bindings: pwm: sophgo: add pwm controller for SG2044
Date: Mon, 28 Apr 2025 09:34:48 +0800
Message-ID: <20250428013501.6354-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250428013501.6354-1-looong.bin@gmail.com>
References: <20250428013501.6354-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_183557_691779_7BC81720 
X-CRM114-Status: UNSURE (   8.51  )
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

Add compatible string for PWM controller on SG2044.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
Tested-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
index bbb6326d47d7..e0e91aa237ec 100644
--- a/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/sophgo,sg2042-pwm.yaml
@@ -17,7 +17,9 @@ allOf:

 properties:
   compatible:
-    const: sophgo,sg2042-pwm
+    enum:
+      - sophgo,sg2042-pwm
+      - sophgo,sg2044-pwm

   reg:
     maxItems: 1
--
2.49.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
