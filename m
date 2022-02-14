Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57574C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fY1e7H4yJ3agAgYqQX8mhLnVlRe+MCjzcEzQGF/mpMA=; b=CiDgoGhLQgAv/2
	+Yend3b8KpDof2lRPac/R7z4ssyFKvGKxYPsbZWbgBuGpOoPExWZUk3mX3ga7HmwZfxN9Mrs/8kKf
	KEY+iA+fxtrs9lVGZrWScsq0jzYHcJvuUX5n1WV+Ul7KNLcM3rwJLr9vnBxH7YEa0lBqvxTpfOVba
	88aTLJ0HlG1lrjDJsA5DQNde5nG7G9mePa6UoQkKZRJs97Q60Fqb7h4KuBHMzEXaZ//XAp2N1qxx4
	6cjtDhOr8+5DtfYY3s9YIJn+8JzmiK+U4tU222ZlxhfItUaMkQr/2LSstUlIfoCIg8iaRHqe3GfLK
	+4F71ns2pPv0RqKroUQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJj11-00H3rM-1Y; Mon, 14 Feb 2022 21:36:11 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinj-00GyQN-0K
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:29 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B34A3407DC
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873745;
 bh=fQGwcHi8/nTW0SMwp6SpOvSaCBhZUIuzRLgVqfnHG+w=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=IyAge/kNvQDRLP9/loC2G1xfV5l7KXYX5EsT4XeoilVmE/xXI3JrCXecGTskZipbQ
 gmV80hnnxuBCE6Uy8z2KETIa2XrjYH3SXD+llYHn5CLHT1RifFaA45gPo6w+7pcR8d
 Bt2r0iPCLIkJNBt97jBFxnrHvVVmEK1yGHFUem8H3K30d/eXPjxUf8N+o5BpNmqIiZ
 WlOntD+vkF0WSL9m8hQmFTQv1m7AmrCeibIoMhuILMw8UED5teBcBs1ct3qXTWQPsA
 T3X7NHks5b+e0+v6dpqcnHlvohHWprHXfYQjSvkRHROJyij0lx76TbIQYawFX5vw0R
 r/Ibwx9o8S1DA==
Received: by mail-ej1-f71.google.com with SMTP id
 m4-20020a170906160400b006be3f85906eso6394602ejd.23
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fQGwcHi8/nTW0SMwp6SpOvSaCBhZUIuzRLgVqfnHG+w=;
 b=Hj8R4sKUsor+xLHztYxEz6tMS6fz+vzs6HqNUDer2M6YjQnrfcYwzc/C4PFtg/g8WT
 /ltMATU673t43aIOZRB5dys2JafJhg7R4Bi/6myMhTX4GxkIrQL4qRbhaBW7h0uW3FB2
 dHSavwxZPVvKiEUPPloVC1l43df2RTfKHzLSBw6pErnpC65027czT+1xt3mLCa5f4DI9
 pTExkuGLU9iRwxd4A4/yMUNsezKRbzVFx74ozmN+Ey1AoZmJetYBmn3XIiot5WmsN2n7
 L+N7o3eNBCQEUH9G2SomWivn/w6u0nd0Y+u8V9wduF0agZc1nWMDEjaORGkArV4H4Oln
 4wsQ==
X-Gm-Message-State: AOAM530IHmfqfjVMBoe6nby8uKChW9MkWcPaBQtBhGCGOZT9Zeg/hVvI
 x2P8r398zeWCFFITZfv+79Sf4lTW+34U1reKdHRY0EJRXjNZOz72VHulVzQly5Y5o4JifXaV4zX
 0EqOOUmx2hdK8dQWmJoNrvm+GqHyQoGEn46hvmOcNLvdDFA==
X-Received: by 2002:a05:6402:3687:: with SMTP id
 ej7mr784118edb.335.1644873734551; 
 Mon, 14 Feb 2022 13:22:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxIpInfMiZOfc9K2mvopmHJpGq7HGo1U79elFbaK9u9/4kmAeiVck7Mp6uIQadoSXhIA1gAlg==
X-Received: by 2002:a05:6402:3687:: with SMTP id
 ej7mr784084edb.335.1644873734367; 
 Mon, 14 Feb 2022 13:22:14 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:13 -0800 (PST)
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
Subject: [PATCH v2 09/15] dt-bindings: pwm: toshiba,
 visconti: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:48 +0100
Message-Id: <20220214212154.8853-10-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132227_222851_7D868B79 
X-CRM114-Status: GOOD (  12.28  )
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
Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
---
 .../devicetree/bindings/pwm/toshiba,pwm-visconti.yaml         | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml b/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
index d350f5edfb67..46622661e5fb 100644
--- a/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
+++ b/Documentation/devicetree/bindings/pwm/toshiba,pwm-visconti.yaml
@@ -9,6 +9,9 @@ title: Toshiba Visconti PWM Controller
 maintainers:
   - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     items:
@@ -23,7 +26,6 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
