Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0DAC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7tVDjokFiIK2FzLRszLyZuiaNah4lo9vAJLJOMEQVc=; b=H9lh+XAKIhFXLX
	X6nzicLuyvVnPsdd8EVoCW7WyShCQbPxVeBtlGLSP1sldwHNxSdreWxwmkSWZmSNQCKPc/TPYDabH
	sZdCYFidobWlAdTRZqGFUyKVG0HUee+94H/e5GgAkfXuxcojhqb8sPtvmd9kHAQRMK0acQ+y2tSrk
	hROXclLFJQs3TGSHSlD7KteVPvsptMtzVi9Y5AbNU2e6j+p27Tr336Sm5bpTMfGmKE/ORocJ004VR
	FCbFF+Fx8eoxDQiqzx4JP81Yma4FpdDBW476RTuQZstj1zVTxxid9DkEW7grrBGZZafYA0NqkHRcN
	T9u5MBQ/DgKGxoAMIK8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJj6P-00H5uG-Ae; Mon, 14 Feb 2022 21:41:45 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJins-00GyYB-FR
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:39 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 2073440337
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873755;
 bh=3PF5Xzl5CoJdPD2v8HAB1YXbDg9KPu30U+G9i+xttCw=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Ewu5ZSIXGZvMSdWMOEOPwosJd6i4JeSVswTIbM7CrJRdYcg3mv1mhnNujSvKdL4HC
 fsP9B2LzWe4pM7QGbbP9vyh6ygu+BaE23jmSoCg2QoVSeXkiIWrKpuYwWw5dJbxWTq
 kELjm6y9PnjISSZnVBC0Z5+e7rEvyprNjuw3Y2hjAN4tqcZhtgqu1XXZqfvTnn89ma
 kvgJU3hCR0DAuZZLdA1rCW5VxzYwvBIPhRIJGYL/iE3FtQr0EBgfG7zm3llseHIWlc
 9CHpakQwPEDStHNtnEEkiAVM9d9Mwwk4QyLD+DvmQb45OetnGbKsAEuf/9eTPfqK4e
 iGSUy+AhJDkvg==
Received: by mail-ed1-f71.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso11092171edh.1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3PF5Xzl5CoJdPD2v8HAB1YXbDg9KPu30U+G9i+xttCw=;
 b=d02CnHKi1meBG4gWSykTBCWQWWGsgh+c25uo9Lb4uhY50Iol4Zzf7Fe0koHyEoM9hx
 yMVM6ot+R78MLyb7lBYn/R6BhYh+C1F/jPCZFZTimpptxi1XgncgsycQd7qjdQqBNBTO
 8Vx/2NMYdE1QmaYKHlqTOWiD7pIQrCYePdofuyBxGKBzn0bpr0v8vjLkhMKvbD2NUUEu
 4NvLfkRM9h4hdRKJmuwEiYrcCmob5RvXbOx/iRRipAkN/f8gXofiebz72sxZOSYzEBtd
 wxB/3stap8+XexXOKddSIhagCkaRtuN3Z47f1+IdTzOY1JUw+wWq90EDaLEhvmfXMiXE
 ycFQ==
X-Gm-Message-State: AOAM531C5wPrs9exJcKBxCdaxuaap7iJ+oFR0FDhkCRYWF5I0j7WyKDW
 Glbm0PF4faoLPD4u6l7XpYBV9u6do0sVNXmmxLXkECaaApHoy+lvRCl3CxhdWJhFp/7HQw6sLcr
 KMzonFWhQY/ewdJzIYWsvVxzm7ggSgf6deEY8uxz1PuO9Og==
X-Received: by 2002:a17:907:72c6:: with SMTP id
 du6mr574106ejc.204.1644873744380; 
 Mon, 14 Feb 2022 13:22:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyrvlFt0k7lzl0jdOoom20eqtUPJDSasKZZ5zI9SYLsZwz94svn3KccXpJhcfimHcBqD9IEPQ==
X-Received: by 2002:a17:907:72c6:: with SMTP id
 du6mr574097ejc.204.1644873744234; 
 Mon, 14 Feb 2022 13:22:24 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:23 -0800 (PST)
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
Subject: [PATCH v2 14/15] dt-bindings: pwm: tiehrpwm: Do not require pwm-cells
 twice
Date: Mon, 14 Feb 2022 22:21:53 +0100
Message-Id: <20220214212154.8853-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132236_688019_CA96565D 
X-CRM114-Status: GOOD (  11.41  )
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

pwm-cells property is already required by pwm.yaml schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
index ee312cb210e6..70a8f766212e 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiehrpwm.yaml
@@ -48,7 +48,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - clocks
   - clock-names
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
