Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E6FC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XIOPfQ3wwG285octbYZ6W2wI+SuQRl9VW/nZiDmI4A=; b=nZhCMW/rNGdKqD
	b7hL2/vAPtoamdkTAd/Wcb5J/i0MwuItSaozMuY0z3dWg3+4+NegEXsYvXbiZDa/OrQAWdTepSlSV
	zhpgVTj/DkBrJeVFtZF47XegxMJ8Pzyh6brDd9Y14D0+n/1FdkGNHGNTftsx0wQWwf/OaRTiQO01q
	IQaavONvCiyqFu9SLbCxYiC17zc3A+gS5Sr18yPpGYMUpImJdm0TMlinZdFecyK5KmhRHY/SUZYKl
	IsqDQe5LXrsrEa+tqMFf32lEKe7qQH2PI+MmVLwUbR50BH3SYy3kI9MODsthsq18WFb+0SsnypHD0
	E9p3pWNPq74zvFRVCVvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWXa-00DpPF-Df; Mon, 14 Feb 2022 08:16:58 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXW-00DpJD-O4
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:16:56 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 1EE81402DF
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826605;
 bh=Vx5pgZq+wTDk2cXNM++1rpL4of1cb6TeLTw59n/JqH4=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=tl8dZp90zTN/3EA0rvFUUsZ/TaCS/1BYBo2ZytSqcEgUKVNNGj13npXlHNH2OzXmf
 N13k/v/AEBmU5eWO40/75lsP6qhTxJXjB94Ok2IV+jA6v31/T8grK3MvgGyz6pQ/Q8
 hnVWXvh4liqTeDcaHS60FmwKG3O7rtxC63YpXkvMcd1gnwUh5+xvRVnQkd/Izixzij
 0TN8yvW8fR0PdsdqLGlRI/ke6gVLl9ZNh6dvAkSvIMcoIoIXsGDe33OrDUphRvsjC1
 7zf9suvoGsl6rJeMAywggUX8VAZxK8CXjg2snbq4KSP34PA4n8mXfaNNODujuPrge/
 RL0D3muNxk9iQ==
Received: by mail-ej1-f71.google.com with SMTP id
 sa22-20020a1709076d1600b006ce78cacb85so594046ejc.2
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vx5pgZq+wTDk2cXNM++1rpL4of1cb6TeLTw59n/JqH4=;
 b=UrVsJJfnkUhwLsTRHxXaKM216/35rxLnOX9A/F7jEiMntNt2tK2PEqeS21zoiH91iW
 9vQE7gR3Nj3VIe8S8RHp1uzHsKT85NwHJxF2rXlqceYc1/f3jZy5IyHvc1S++RZeEW3C
 9KOUbrvauIWgBTR7YKZdeEZntXt5IhsnXgpGIYTBzcIQejk8BK6hsX0THBIGlql9u0fK
 nYX3Qkcr/9hq6xgPxgvDyAcOimfVHChespRY9JrZC4CsHHL/RSJHxdoo3aDKsLBqixfx
 zyptFaj38clsaw42Vwxw0FkxmdAVGc4l/DrdBBrvOolBUPdE+tEp0wGiIYkmtsnkVMWz
 pjsA==
X-Gm-Message-State: AOAM5305gd4VrXV7YxpsTcpWezEUa0aAQHRA0csYubVpDIDE/nC53w6n
 qMnA0FLQ64UxsX8/gZlfywtRt0KDnyyCxSHwme1FemxRoJtR14L8wwBY2uc+Xp2BMFUcnpwzZM6
 2Y+vjcDoakaL4HA0pCPnimOTEV0033KQ2M75l76SAtvCu6Q==
X-Received: by 2002:a17:907:86a1:: with SMTP id
 qa33mr10593901ejc.516.1644826604833; 
 Mon, 14 Feb 2022 00:16:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzHLCvj9EOOMBQpfPrsB+GOXcyF6v8PbErxtuwvlpLnjLHBW4y7stXTy+wJs5s8ptFN23VAWQ==
X-Received: by 2002:a17:907:86a1:: with SMTP id
 qa33mr10593877ejc.516.1644826604628; 
 Mon, 14 Feb 2022 00:16:44 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:43 -0800 (PST)
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
Subject: [PATCH 03/15] dt-bindings: pwm: intel, lgm: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:53 +0100
Message-Id: <20220214081605.161394-3-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001654_938879_8D350B58 
X-CRM114-Status: GOOD (  11.03  )
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
 Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml b/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
index 11a606536169..59d7c4d864c1 100644
--- a/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
@@ -9,6 +9,9 @@ title: LGM SoC PWM fan controller
 maintainers:
   - Rahul Tanwar <rtanwar@maxlinear.com>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     const: intel,lgm-pwm
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
