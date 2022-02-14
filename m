Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534F6C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5L7jF3JxZwPyZ9abgU4m6JaxUyCElb1DtmdrwFWNFI=; b=BqlalaiygBd7OF
	4nXQrstYGoI0++QzGP+ad5bCgliDnKUl4FruIS7IYRFqAImrdauq+r3EGtqUAp0t1Tg1nV6PwI3GU
	+pbMzIJImXW6eT/Loq0O8OFehuKo3q4jvR6YLLT20+5cS9NvraN5fQWmaBSF2i24ajne3LpvCvkO7
	P+538c49U98UP86Qhp/r1gzeTzTROvJQXyBQXUZzp1gMVm2FhJr8fc8wUn4AbSlZdVaLE9/yXQ3Xk
	HS35USi92NAftvDP4INk6rVCqfhLcrSS1K2YUwXDXQmjxv844qC0rItP+mJU+mmsGh8+VcJnc298G
	oe9im+Gyysgtn99UbGcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJizF-00H398-JO; Mon, 14 Feb 2022 21:34:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJing-00GyOB-Kw
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:26 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1A57D407C1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873743;
 bh=2GfdITO+DKwVQsf6qkFkxVmUjntYlwpPLBCNaZvP8rs=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=N1wUlV2NP+3I6QsOFoI106EbigIrDCYLhJOE7G1dH7UWuImHqgHz0FQOAHFqsPHPX
 lAPXdiWD/kNPHwOSOHP0Ct8XHbKIQ+LSkvewAe1jdY8BcqTqCG+MJ3sBEiOMnQvTnt
 unO2YsoIYd6rLAUmMRCh32x8rWJbYl4/1lRSykU1hG+Tb7cQ6tjjRFt4t/0u77hb/6
 nx8JdqG2fzwKgFkdnhcTDu9/DCC0/6jH35IdBwvsM6TovQvwRUBGa8UCGXZF3lpudd
 tc8la2C5DppYUF4FXgSPyGdnqaLBBL18q7IKpORD2tfoBgjy+uIkPPsDAYkWNpJMcL
 K+JPQ1Wel0UJA==
Received: by mail-ed1-f69.google.com with SMTP id
 w3-20020a50c443000000b0040696821132so11018593edf.22
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2GfdITO+DKwVQsf6qkFkxVmUjntYlwpPLBCNaZvP8rs=;
 b=ByWCG9f07D7rCqukyGP4tGDjK6J4WDZD0ineWEPG0yPBehbCCK4oH7yZtna5LEHEk8
 MIMxLlDOiv/GQ28gO3rRVAbp3zKafMOf4PoacyqB0wVs1pbw1MiC8M2kjzr9KSArTvcS
 zINflZnc2F862X+TqhvjKyZ2lv32kzfoOfC3Nt3+99MPsa1QvxTpAwfNiWUsjUMZcWAq
 +iRn0Bx6sEE8YLAIClgakyXbrc46Gq5ez8hHbD/NmsTZFyCLsMn1o35A26B+k3uuvg4J
 RSeXS6UJzYRgQOH427gETOQbfBGar/LQQZy1e2+pTY7l2M1UY8WH9ffEDqa04p37Jw1l
 RjXg==
X-Gm-Message-State: AOAM532mte3zO3WcHuI6krB1nukwc5ymcAjtdTBmqmmxl4/AUu4eleLI
 fSfy4GBbedRR7HTS/Af3Tyo0gZTASg3irP5FPJ0Mm2N0ABXISoEBWMYRVdRCIgbPMMwmyI9+jRM
 b07vHtMG/qAu2oGNewOFh/UYPj4vMS0j9lFmF+97KD7H9Ew==
X-Received: by 2002:a05:6402:518e:: with SMTP id
 q14mr795778edd.155.1644873742479; 
 Mon, 14 Feb 2022 13:22:22 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxF3h26z/5uxDbEq+54Opag5L4k/zFtMBfvScttTAdV5Yv9njK8Ir/cF1x90gGCn8KuufGFTA==
X-Received: by 2002:a05:6402:518e:: with SMTP id
 q14mr795759edd.155.1644873742300; 
 Mon, 14 Feb 2022 13:22:22 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:21 -0800 (PST)
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
Subject: [PATCH v2 13/15] dt-bindings: pwm: tiecap: Do not require pwm-cells
 twice
Date: Mon, 14 Feb 2022 22:21:52 +0100
Message-Id: <20220214212154.8853-14-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132224_891411_4DD69D74 
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
 Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml b/Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml
index ed35b6cc48d5..3840ae709bc6 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-tiecap.yaml
@@ -47,7 +47,6 @@ properties:
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
