Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69BD5C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jw3zhBlvniUL2O80jQPwvhes/MQONS4NF1SEAV34tds=; b=W6wfpugEfU4cHp
	Y0Cq94JJnNJ0iTELClfxoumVwrsxV6ZrxL7Y96P1DQwyn/YUUbqkk7QJT45I6UVLyV0KK09gExAV+
	d26tCZtC6LSu8Kj4tM7qQ8+5hkLvGt60ZtkHp9gdlwnlSy/O3GdfD/K3I2O7CuLYadGqnpMLmRuMU
	rZ7Sfn6gehWna5FVCJWfQN0YVe1Mi3XUpB5peto0on7UQKjNJ4TDU2Gm4xMm6uJYkSin2WzyLpY5n
	cQhQVrWkuQXnh4soYJ51ppqfqZy6fmKa4jnizH6TDuSF8N0OqcsSo2KQfM814wcAq5cMpojsNOqLF
	lKCYKSbvQkxmJ+ocdXlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWi7-00DuNy-Fx; Mon, 14 Feb 2022 08:27:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXk-00DpXy-FD
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:12 +0000
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id B243D407DD
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826626;
 bh=iIyJdPXcEBkqUXDuGqxhbnQvntH0bGkCRSvxS5pcFZw=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=SB36emyTpS9FhwiDcylJZ0R75lRbkojSL+waPvv9HLogb6v3ksHbEb0hdaInzRtCl
 XmV0vhE7yeuHwemt09QJ1gxt69rR4XHu0t9whVGsX2kTyfkMB6W+c/6QUukHzlRJwN
 gHfbOFhlvHtB4Rwy13eQ1EYLPj93Yah+R1h0gzqB+JTKuEA4sdM9SyJzUI4Y8fPdmK
 rPBwFtEYgym7uyFEY2/tzOxJCstj+bYtCNMwQIPR+7BVJR29IG+3IrDPz2/paxaQvB
 uv+6utWBOusF45Ho1D3KB+UOftT7n1ZwdR1984gt3PXTr7EDjycRxqJBP4cME87Ehl
 1210vow1H8/0A==
Received: by mail-ed1-f71.google.com with SMTP id
 w3-20020a50c443000000b0040696821132so9729810edf.22
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:17:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iIyJdPXcEBkqUXDuGqxhbnQvntH0bGkCRSvxS5pcFZw=;
 b=C2w8MsvdYFub0+TlaEhYQDaX7WPrJd2G9Vq4kKlCkvyoKRL6+ZJda3NThL1RXs1lra
 CPHH5wZe6fiJ3ZB64+06fg3S3YtUsACQHhjSCmpOHMDfR3kkRApjHzdN69G8ad08wydk
 75ygXP2tzktqXWoV6pPZiIG9e3WQWiqZiPpcNP7x+iFcb8xbAcYXIoVJ2my7t4koymiW
 PY2RFqz7sTWbNiuyKClTtub02s3w84HBgT6RiJXkbtd0U0NA8sVxTWWgR/NJYylRFJg1
 Yz7ynug97XX9E51KrcMadvuZrAJcKKd/Pvn2s4ienVOSxXgKHTaGzsvLrKWzpaCLfdzI
 P3Kg==
X-Gm-Message-State: AOAM530UulYBvwpculUnm7xvXuOVlBDTUgJrBxeW04u8pzQYK3vSWh6Z
 GIl7vmPDcX36iTEGIIM4x+Sxs4xlCvcgV4tj+hPTmBucTOgaOcl32/quewh9FrJfY+aGrdEjWio
 CsDTXOJVuuFgpe5OvND2GLdXQVd4y+ahUgJm+mbqpMjbRSA==
X-Received: by 2002:a17:906:7482:: with SMTP id
 e2mr10548218ejl.84.1644826626196; 
 Mon, 14 Feb 2022 00:17:06 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxq33v0frVviF6aoq/yzn0yigEhIAPUAXD+ZluCWsCIVgJnTB15DwsxtEtp09CYMHvANYnT6g==
X-Received: by 2002:a17:906:7482:: with SMTP id
 e2mr10548195ejl.84.1644826625992; 
 Mon, 14 Feb 2022 00:17:05 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:17:05 -0800 (PST)
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
Subject: [PATCH 15/15] dt-bindings: pwm: renesas, tpu: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:05 +0100
Message-Id: <20220214081605.161394-15-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001708_746341_08759ED8 
X-CRM114-Status: GOOD (  11.16  )
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

pwm-cells are already required by pwm.yaml schema.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
index 1f5c6384182e..c6b2ab56b7fe 100644
--- a/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/renesas,tpu-pwm.yaml
@@ -68,7 +68,6 @@ properties:
 required:
   - compatible
   - reg
-  - '#pwm-cells'
   - clocks
   - power-domains
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
