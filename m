Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF112C369A2
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Apr 2025 01:07:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q3HIxRyniu83si3Z5jfK7Mjh33j0MfP7VZ1kxW9bqHI=; b=tKju7r+Sta1F0G
	jxY/1qorbWwI92hH+utJ0n9WWD24wzhjF54vk6M/L6SHRSLKz80/lwhSHrwEQIiHAjYLsgGgNxuRD
	mMr1Cap6NiKyscTMLXwBHZNtLv/82gOUUXEJM+4pDG0ecm9N9y6SkEEKXJwnceGofKMJUAtWgGjGd
	O5Nx4UHB+lGegnHsYhA2d2/VhYwX+b6QXCET6brZT1D4CQ7YylvGl6vWdNVHPMtFGrrjbUHkqgpr1
	PI/s7BR7R38XMPEExrh/4kl4z86ss/WuptxUIRCjD6dSQXSUNXcYw16uyhs+/RFJQRtkPpDth521j
	DRKD2IF04dSoFZijnEuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axE-0000000G5Kl-2FvW;
	Mon, 07 Apr 2025 01:07:12 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1axB-0000000G5Ih-2hwO
	for linux-riscv@lists.infradead.org;
	Mon, 07 Apr 2025 01:07:10 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-476a720e806so36681561cf.0
        for <linux-riscv@lists.infradead.org>; Sun, 06 Apr 2025 18:07:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743988028; x=1744592828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JF2Z/LMww8mdvu9Fif8Aazjm67LPyxM6t9FzcA9LKH0=;
        b=JG4lkmMlUo4PxJdP9AZkAmoH6EntmfWHhSrt94NAvlA7a8C5FKuji8TqskF6Rc7WPA
         v1SNe9BW+crjkqIqXM+AsihOamZxqfrladS/tWoMkjqcaVcLlOawufpOtuflDL9+ROXn
         pMEDzVqQFC3BL1XKCWm/9or9FqmXWt+tkl7quc6DhtxCi9ryTuZU1O2fxl2ICxqBOUYn
         QE9sx83mwhCprmUdywITHMJGtZ40J9N42To6axP34q+Y1r8RQS6GRBIVCN6yY1MRMY9l
         dXocKecRS4dJQdxifsz51+jvxwN+FO7/Wx4tkm8PGEjYAYZeNTRn0ob2SL/P0a0fcQEr
         oBvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743988028; x=1744592828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JF2Z/LMww8mdvu9Fif8Aazjm67LPyxM6t9FzcA9LKH0=;
        b=LlmCLizUITw6BXjLt2ngcj3xmHiPl5EA17k4eeoY/M0jUkq3OGITvMDcdllgvn09Ji
         wefmcZOnbp3+Sw9X1jJ40zpN88Vosx0ZItMXOpFUYFjlFX9KFzMHv+19GNnYqHAByVHU
         r2IHdhpz3GeF9W65aYEPe10UT91c2UADR6HTRQeh6ypGQAEuf6kybC409R5CbBJUE+jg
         XSAf7HmycnWPo12ZF/ZjCmj22fs9RDH/Lt7gX5omLq+2QTeuOxHtK5K+knUVJICbCE2C
         pSY0U9RZy/pUwYfY/Y9nIr0DbMl+1GF1NRl7akvaWRbnLuza+BrY8fx/fLVAL5rGLFb6
         yMjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTpeAxyd/ZCZLStviL8iT6KSVZkfYvGgUp+GqscBrdzaSUWGcicGOPG7ZQ7oH/9IcUbcww1hbjavgEQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeU2kW9oMt2zO5CR4kU175W4iDOdIOUFwifCTBOzIF26f/KsqV
	cOaWwTx95LUBbeB8JsYTKc0v4sk/Ux2yVKQx+isAcDzp9nHon8OC
X-Gm-Gg: ASbGncs7oiYY7RURI+VOD/1EVc/RdFSdeMREunm5SLWLXLYPE9fNUI6k/eTSMTsNsLl
	jG+g44g7lEF6GwmvkjtThfgO7tw+y2cIjBFL0iyVfUhJT72IOZgWHk/eCejrsTeZ2Lc1Cn8rHbT
	t2yffd7Pm5G4d4T2l5ncWTKvwJFlLi6/xm7edoppM8MuQw2KpOpMNPIeLpK38da5BSTLU7DKL/S
	8XLEG5tn2uVPl0JhoPmtaiX6/qf37mUS9J62Zf5Izj3H69dxHWQjBVI57UNBbJ/oDgxFNqZ8pbO
	0beGCvBAdPB38rXHqfTJ
X-Google-Smtp-Source: AGHT+IEjRuU35AfPurfPXYbUmQsHwNGIrdGvMyKJUg9772NQKPw8J7O6eXPVhRjVY/XGKChEAioTSw==
X-Received: by 2002:ac8:588f:0:b0:476:c82a:9fe7 with SMTP id d75a77b69052e-47924911dc4mr120825721cf.10.1743988028468;
        Sun, 06 Apr 2025 18:07:08 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c76e73558bsm530443385a.17.2025.04.06.18.07.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 18:07:07 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	ghost <2990955050@qq.com>,
	Jarkko Nikula <jarkko.nikula@linux.intel.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Chao Wei <chao.wei@sophgo.com>
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-mmc@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 4/9] dt-bindings: reset: sophgo: Add SG2044 bindings.
Date: Mon,  7 Apr 2025 09:06:09 +0800
Message-ID: <20250407010616.749833-5-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250407010616.749833-1-inochiama@gmail.com>
References: <20250407010616.749833-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250406_180709_685338_A82AD644 
X-CRM114-Status: UNSURE (   9.59  )
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

The SG2044 shares the same reset controller as SG2042, so it
is just enough to use the compatible string of SG2042 as a
basis.

Add compatible string for the reset controller of SG2044.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 .../devicetree/bindings/reset/sophgo,sg2042-reset.yaml     | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
index 76e1931f0908..1d1b84575960 100644
--- a/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
+++ b/Documentation/devicetree/bindings/reset/sophgo,sg2042-reset.yaml
@@ -11,7 +11,12 @@ maintainers:
 
 properties:
   compatible:
-    const: sophgo,sg2042-reset
+    oneOf:
+      - items:
+          - enum:
+              - sophgo,sg2044-reset
+          - const: sophgo,sg2042-reset
+      - const: sophgo,sg2042-reset
 
   reg:
     maxItems: 1
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
