Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA6EFC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3oX4+pGpUl0SuQS8w+dboy245noqthSr32fnfm5ZLk=; b=eUjVOpMvUiHAUb
	XretaiywDYn78TmvX7Ps8JlPHGvAy2fL7REOor7/m6J1k7nqIpW9q7pda2Bi/8xhnt+hs82Za+QFM
	4bMTT6FTK1KiGeiMmkY45nmapt09ZVMCzdvbbZe7D2cG8uFgg2uzqgQtsVLx/UAM6FTkZMgFHUZsk
	V04thLMlz2ZZUdYbol7GLdza90vmbohRneXdD3nWrOLTLjjmbAs4ygBJvsjxOteffgaqCwlg+xzJu
	cFlaLNtnUbg6JPqsd1m6sYPPBh894r4N+OLUxyCY3iuJo8Q87Jt0xkJMb8WJkhyHMgsIe25OMnaQ6
	mGZtsldDUteUtTmwmhqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJioq-00Gz0l-5P; Mon, 14 Feb 2022 21:23:36 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinL-00Gy8t-B2
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:07 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C1A88407C2
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873721;
 bh=11HYmRlx8dE2WpuAnKJ9eGJzYR6C7S08K2HSgZ9haWY=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=D4Isp002T/68PG64fsV9tYAp3xpaOjws7fI7XFSQ893gibUR1y738SCL0X/ApK89C
 ZjZVzAuvOl6tvexOPC4HiZm+7laa8ko4DenvpCGYV97CEEqqwRKrE2j/eCP1z43P6P
 Hb/l99QuHjpq15Z0zyxQw/ussYDurUmlR4kosJtEvXKuawCrFBHZTA6g1gSTnL/kXs
 lQlapgWf4B7o3rRn99QQTkoZtCAgW+pDTutN6Oev0ciNdxgG82bBsCvHN8tteLz3Ao
 5XR304tAyYR5H7mJuJS7qnKo2jLRJSr8ZY0QYpJYfNJ2FNSRw3/2Di2knIFEemElVh
 mp6tSO+ZfknVw==
Received: by mail-ed1-f69.google.com with SMTP id
 d11-20020a50c88b000000b00410ba7a14acso2404919edh.6
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=11HYmRlx8dE2WpuAnKJ9eGJzYR6C7S08K2HSgZ9haWY=;
 b=k2eqA9NLwQhucMyQRTK/YUizeONQMmpSqiNfQzkPu9FS2loQzNdTE3vpRco08pLzyd
 Dj+7HwdPraxqOifL0+FB7gnWJ1PgYXGpK+iAyCBj0ye2QTZCZLxkkStL+XSEiTcZCeaw
 PxiJYOL/c95U40wYGyEA6fB3/21PYWndQU3QZNigYkgKjs1m+MCH/waOfKoJo4m14PAC
 WdZJHBntUduWqDUxo94YyCFa5pIDRHEcPiJ47vw8VvObA3mvtKB2Zst6y7hitpMB6bP0
 nbHuZBquglIfg8ngCBmSH/c4GteQ8g+ZSMLPX38Ve8bzI01kDw1MBafQX77JiKYeSe7U
 Mbjg==
X-Gm-Message-State: AOAM530scroMaEFrX1XArjhR7793r+hmUKxne5x23dtW+Gy/6vjgmlDp
 r6viRy1TqpXQOyDtVRSh35WeNTh5RNxGCvQISnIluKjxgr9O0Dy7XRlAvdMr2kgd0f65lXuUGyg
 LpCcUfcZi8UNj6uppO9og1IT6a1HSHXNQJ/9xKS9pi60SfA==
X-Received: by 2002:a17:906:8a83:: with SMTP id
 mu3mr507541ejc.699.1644873721204; 
 Mon, 14 Feb 2022 13:22:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzBRv82g+ePgMF2+U8SP74RMmwo7vMWesKHUBo0ELgxKNYYBtnBlWhrBbL5O1DcvkqWwBUiLQ==
X-Received: by 2002:a17:906:8a83:: with SMTP id
 mu3mr507532ejc.699.1644873721039; 
 Mon, 14 Feb 2022 13:22:01 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.21.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:00 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Yash Shah <yash.shah@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>,
 Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 02/15] dt-bindings: pwm: imx: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:41 +0100
Message-Id: <20220214212154.8853-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132203_561711_215EBA7B 
X-CRM114-Status: GOOD (  13.06  )
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

Include generic pwm.yaml schema, which enforces PWM node naming and
brings pwm-cells requirement.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/pwm/imx-pwm.yaml     | 4 +++-
 Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/imx-pwm.yaml b/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
index 379d693889f6..b3da4e629341 100644
--- a/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
@@ -9,6 +9,9 @@ title: Freescale i.MX PWM controller
 maintainers:
   - Philipp Zabel <p.zabel@pengutronix.de>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   "#pwm-cells":
     description: |
@@ -59,7 +62,6 @@ properties:
     maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
diff --git a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
index fe9ef42544f1..8bef9dfeba9a 100644
--- a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
@@ -13,6 +13,9 @@ description: |
   The TPM counter and period counter are shared between multiple
   channels, so all channels should use same period setting.
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   "#pwm-cells":
     const: 3
@@ -34,7 +37,6 @@ properties:
     maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
