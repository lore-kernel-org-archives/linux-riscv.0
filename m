Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 361E1C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:39:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BWcBYzWr31ri5M2gRN7bU/GytmekpfnqxWKeaX9EK7k=; b=mYnspx680XlxXL
	wB/TxYKOy/KrRSjrWoDk+AYh3FHmQSOVvtwmtb3Zr963qBs/rgh0skh0OWuRbJ9Nn3DaKiFWlWgG2
	p82Hphz/x8mU2bL1r7qkely+UnpkXQIQuCr9lkCpzpGTcab8tHTboHTKjcnT8mOMJc//dtpJcZugp
	q7l5fhAHe5G86++hswNgCJUi9e9gviGf1eJtR0i5ZWLtABU8Z4uWpFKw/OgIVjkyQMx7oc75eBdoS
	2d9QYD6z40KhO+R4N0SJsmAuDQXA5gKN9gLrN6etzksNKxc27KIN4ESLuXzEh80Wr2U0fb4htMQAo
	q+4h7D29ZZVyim2j5yTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJj3t-00H4yS-RM; Mon, 14 Feb 2022 21:39:09 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinm-00GyU6-Np
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:32 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3613240053
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873749;
 bh=L1zH491qgS41n2AXbaIQ7HS33ONC7FahLUP0TNtgPew=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=vZgaG/8q5S08dK6rGc4oBk2zUND9R2eEL4ewJmPQonGHAfxZUVWluytFr3kFD8pPT
 RRK5WHOB3nMl1Ew1lYH/+fquoIJ9TmFVFD6mD+OBD3ey0hWxFngC3E7+YH6u7BJzOC
 Dj769CIbHDsBEcYYpbCwlPLBBYG4MVLV8wB0NPATnGOgznaVuf9o72/8pVfnow1kO8
 y4UXgJQb4rfVop8KzZKOoJWjwCs4uhtWNsshilwUpyAAbabhTHqhsxasABdrVPw84B
 2arY8IWSSO5/w3lvzZlidUyp6eaIisTDnBZ/+KKz7XejXoMkJFwFguU0jYAVmd0LBy
 kDY63V3F3bAFA==
Received: by mail-ed1-f69.google.com with SMTP id
 w18-20020a056402269200b00410b0a48d56so3264729edd.17
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=L1zH491qgS41n2AXbaIQ7HS33ONC7FahLUP0TNtgPew=;
 b=7/irPBct+MUz7DjuTKnTN+i+n1YcjRmCkOr0tWo4xU/wquTd6WFM1brYF8tGZ20uju
 EkCjNsy8mA5vClFwlc7RJSTkGYB4lNNVL8yJ2wM5GiJdYcSnkFJX+ZOBVtJAemF97lYE
 ryZX1atYpyljVAJlKhOQjXCNqpP8hAM/foUcyVJMU+XOTubeVfvSM/TG+f5BTVANDrIv
 W8qm1kasd+wb6/3PvSg6lqvWDdvjAPD2azqEm6oJGAF73B8wj2NYdsmzv9Kg1xuPmxbi
 yJAJ2ejwoavE/sostz1S0UnM29NdGbKfAqTZRHF5OJSLEXjJQKHB2oAEtOiziz/+BJ2o
 mHaw==
X-Gm-Message-State: AOAM530hOjxWuY0gUhZG2ka05tmFcug9QYjuXKAoNy7f362YIvfPA1gL
 Ioq5Fxyi65ERgVfH+KhXD4OD3bQRI2qeCLG50EHnLq09wU7Kb/AzdY2RxcWLi/zGefHnryHNh6s
 U52BIujXCvTTwP69c8Zu6wuktRLejowDdEItDv6sjzxQi8w==
X-Received: by 2002:aa7:dd04:: with SMTP id i4mr764661edv.313.1644873738462;
 Mon, 14 Feb 2022 13:22:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxYZT3hfmG99BK+ndmDIe3ewA0JwFYesWd9OClq7wO2HS/MuYgpu2ey6gvbQ4bbF24Sx8ij6w==
X-Received: by 2002:aa7:dd04:: with SMTP id i4mr764632edv.313.1644873738297;
 Mon, 14 Feb 2022 13:22:18 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:17 -0800 (PST)
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
Subject: [PATCH v2 11/15] dt-bindings: pwm: intel,
 keembay: Do not require pwm-cells twice
Date: Mon, 14 Feb 2022 22:21:50 +0100
Message-Id: <20220214212154.8853-12-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132230_923979_0BB283E4 
X-CRM114-Status: GOOD (  11.52  )
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
Acked-by: Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>
---
 Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml b/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
index ff6880a02ce6..ec9f6bab798c 100644
--- a/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/intel,keembay-pwm.yaml
@@ -31,7 +31,6 @@ required:
   - compatible
   - reg
   - clocks
-  - '#pwm-cells'
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
