Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D829C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pgRbUKOzQq3BR6YaXRG1WepdDyc6x5jDXPib6efjZg=; b=kOmEIZbWfohrnb
	+mAfeTHhn6kt3LXQievTzw881KWQmD9aekGKRbjwTOdND3/cua6VrGNOgOiygWuk9ufNq5aRVYzjG
	ZqHpifsL9DuN/AC/TV2ToABzjFUcszRlF8k2uq1acZsc5wI/T4ULrcDdEVuJefdn4gIYAemyEgeRr
	rPf6JDMXxEpc95QMG0GYQdxA5xwCwuro8CEOmW+qF9KyaY38wfzluMI30rfiXtMAyWD9v0lSwUaPe
	HRkzRNVUwJcme3PMxNuilG0eHmOCVS+esEYWqaVVvp7aWVtbxa0j/4zIjBLPmBFVNbpo1mKrMsjtS
	zA2VtNIMB89Jmgx3I47g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJisI-00H0UL-LH; Mon, 14 Feb 2022 21:27:10 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinV-00GyFN-JB
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:16 +0000
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CC62340514
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873731;
 bh=2POCSk/6TwWTazpis9hGbBMQ4KYz1OTALCTDWqaBti4=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=knKyGqJ7tlaLE2HX706mIC0RydQqbXA4qeoYwwfT2S4mMSCjmy8GxzSujUBDg421c
 fV4YU5QpGTbQTFqF6wVZKT2efbLMd+uGEBSL0cfMDzn4APifSBw2oCd2tjqBEPaXg4
 Ha5TxWPJ4YprNQg+A4Z+ZdlaROrJpZM/PjaKclr8Wvv0ambRh29igTst1ZduEX3Oga
 wBpkjmGeVX1/puvZBQ4M8RSGKWIntnvLUcsQsm8N+U7NYPnRZpxI6rXBvFVdd5KGCi
 Z/5bAxWQUu4Si4YmrAGWFe872DX+vnmaCkacj6DFg7dWC4EHVnsDbtb09fjrtX52Dv
 s9Q8GPD03h3eQ==
Received: by mail-ed1-f72.google.com with SMTP id
 s7-20020a508dc7000000b0040f29ccd65aso11091585edh.1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2POCSk/6TwWTazpis9hGbBMQ4KYz1OTALCTDWqaBti4=;
 b=3rsS+Y6wOz7te1NkAtwF7zoGNW9fuPvsvNAc0cQgdU12oCSXmN0pWI6ju1dMv/6Xxx
 qvw0I4oZqDmz0jGuju5iJwgSiP9DFY/meF13UDU78FlnO7dV6bIR3+6aOmSIkkJQlp4q
 98mqaFhW9N1KYVYKsEkfeC64+SkoxRr0xxGYsHQ1W37UQE3R9Md229WfTbBRcsyVKAzP
 dU6mnb7DuVsPgB1EAUfQiPE6NZ42/gevjc4dWQXKn8t7sUnWV5LPocVo1/9tYUHCCUxR
 uNdcR3hfv5PwDGCYZLdQCHmItttBxKZWg9SZoYru4c5xWr59ehd4G4oxbwdicYFmrP1M
 g78g==
X-Gm-Message-State: AOAM533sQci4ZUJVCmLHlY2zF2o/3oHyarKTVOLrUj79fIIZVU6v0qaO
 4bT2PilWCn572gp0ezie27oMk5ezoJCCELv0fHgoYNAz277P0X2ayHX7GR0u5SqZra6wvXGylZG
 AHddGsaPbuZ5yMzTUGgSq6lsYzdV47c36zjz3qaW20VFuFA==
X-Received: by 2002:a17:907:6091:: with SMTP id
 ht17mr542213ejc.607.1644873731296; 
 Mon, 14 Feb 2022 13:22:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwORNXxcION04IJzU5Gu/UfUyFurARbus6zd7xUK4wKOMUXzkjvihbjj39qrz7zMUkHFrH18A==
X-Received: by 2002:a17:907:6091:: with SMTP id
 ht17mr542177ejc.607.1644873731059; 
 Mon, 14 Feb 2022 13:22:11 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:10 -0800 (PST)
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
Subject: [PATCH v2 07/15] dt-bindings: pwm: sifive: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:46 +0100
Message-Id: <20220214212154.8853-8-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132213_785173_DA06AD26 
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
---
 Documentation/devicetree/bindings/pwm/pwm-sifive.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
index 84e66913d042..676b2160bada 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
@@ -22,6 +22,9 @@ description:
 
   https://github.com/sifive/sifive-blocks/tree/master/src/main/scala/devices/pwm
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     items:
@@ -55,7 +58,6 @@ required:
   - compatible
   - reg
   - clocks
-  - "#pwm-cells"
   - interrupts
 
 additionalProperties: false
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
