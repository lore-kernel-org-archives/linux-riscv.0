Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72BC9C43219
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JXgIBTkl8R7ke6ITA6IoOnUow4g3/nXt+3gL4t9MdhY=; b=hKj+8L6i9bvolM
	oonNzOsI5ZiwA4eMJ8uG0qqXymTWkhE0mFa1rIQ27gIOD2Ec2KbYg+fArFNwG1xRQp+lFDVwW6kjx
	zI33cgl14QrB50QfDM3h3+xZvzSBGum8pN9Z6cNKrMnpCcldpTFaYZvIOIKFRRiWkIZKEHSYzVWr3
	yjnqTUEVTPpfGPb2woSvYlb0JvzUP3fkZNAonDUY9mJgvKnKceSapV+8L8Djyl+lXEM8ZmbFxFPtu
	QTKbM8WiNLHqIJwAKF5rYMlH0OBZd7K8A6FeIaSUXfqPB+2TGmF55v0xjvSeKi35NpMW2P/kzHMXy
	s4V062JIaB+Be36sPOxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWxb-00E115-LL; Mon, 14 Feb 2022 08:43:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWeq-00DtDO-CR
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:24:30 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 11DED405EC
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:24:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644827067;
 bh=Y1pkt7sh1u4nhMjpCSj85kjYF7GKoQX1FycUfW16GNg=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=fkEPZPIqdT3xXDMbO6RyIJ/efuBDDpCqGW0Qt1NJ3rdBZLPTBfHODEymc8BuyYi4/
 jB2end4RuBgDEInZynzp1Y9vp/3AlrjBBm0JSM0JJFyx1T6FwCkw/rWBm5gESdynLN
 6BxpMlIlV2vbgfGdlV0DdInUgt4QXZ4dbfb8aBnZ/TV4gCOGninddK4zobLlmjPyUJ
 aYywAhbnCkYP++z4zTTT0Y8q1HGvO7Dk/anox08GgNZNVvi+B2F8lRsehJYYYdgo9O
 oHCS2en/cWErJ0yqJwCLgOow5Mz6p+gb2A+A4LwXIvyzbRYO4IW+y+NPWIKj48jxih
 4Phb9clk0lUCg==
Received: by mail-ej1-f71.google.com with SMTP id
 qf24-20020a1709077f1800b006ce8c140d3dso587310ejc.18
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:24:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y1pkt7sh1u4nhMjpCSj85kjYF7GKoQX1FycUfW16GNg=;
 b=WYC+QDj8r0rsAJSvSH7pa3Ftg+jxf/lpGnw2MD9w3lT4GADHH4y4qia5DsTvgWQlKx
 heuRXjJKfukTTwnVWJpz1ur06dsZWi2ZyKVZ2rKiE2Xft1xL3vl4vyz6u1EkekAX6CCu
 lHgay6oYAZSHaQIw7aRn0QQQyiP3srS/fY+Px6yEeHCC33KPRwvU5HgLLZR6iNyYXql+
 oe7zZsnzZCCemPAJCZgcpDlX0gQvvumxperg/dYyRyLqqmJuZQIdnQ0GhNeNv1PsIzx4
 VhUSdW6q1KbTjg/fyhpvRSoMq7y6SiaUNabakFXeWR7Iq/sNj5GzmmjfYRzTkEk6862A
 hEfg==
X-Gm-Message-State: AOAM533ZZRPBnb1vgZxV8gLbqtb0J5MUzJllxyB2FGQe2NHecCUuE6Bt
 m2KbSuqcpPoiua9+XY/R07QIpLFecIj8uGIMDT6z0m5RajB/lbpJEzu+ACFr1VgKeQhU2SddbYG
 ZvV2BYsMS5TeiUFjaWuwfnrBgwPMpP5XHzlQ4D0+2eZ6erg==
X-Received: by 2002:aa7:c3d8:: with SMTP id l24mr9023381edr.63.1644827065917; 
 Mon, 14 Feb 2022 00:24:25 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy3sWIkomqniJbHGA9USzgWbkd0+vKt73BSCiBXKwRHhK2HxngI2g+YQq0rzs3pSOItOjbAow==
X-Received: by 2002:aa7:c3d8:: with SMTP id l24mr9023363edr.63.1644827065698; 
 Mon, 14 Feb 2022 00:24:25 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id fn5sm1363850ejc.179.2022.02.14.00.24.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:24:25 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To: Linus Walleij <linus.walleij@linaro.org>,
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thierry Reding <thierry.reding@gmail.com>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Lee Jones <lee.jones@linaro.org>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Sagar Kadam <sagar.kadam@sifive.com>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: [PATCH] MAINTAINERS: sifive: drop Yash Shah
Date: Mon, 14 Feb 2022 09:23:49 +0100
Message-Id: <20220214082349.162973-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_002428_610055_3A8703E1 
X-CRM114-Status: GOOD (  10.50  )
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

Emails to Yash Shah bounce with "The email account that you tried to
reach does not exist.", so drop him from all maintainer entries.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
---
 Documentation/devicetree/bindings/gpio/sifive,gpio.yaml     | 1 -
 Documentation/devicetree/bindings/pwm/pwm-sifive.yaml       | 1 -
 .../devicetree/bindings/riscv/sifive-l2-cache.yaml          | 1 -
 MAINTAINERS                                                 | 6 ------
 4 files changed, 9 deletions(-)

diff --git a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
index e04349567eeb..427c5873f96a 100644
--- a/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
+++ b/Documentation/devicetree/bindings/gpio/sifive,gpio.yaml
@@ -7,7 +7,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SiFive GPIO controller
 
 maintainers:
-  - Yash Shah <yash.shah@sifive.com>
   - Paul Walmsley <paul.walmsley@sifive.com>
 
 properties:
diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
index 676b2160bada..605c1766dba8 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.yaml
@@ -8,7 +8,6 @@ $schema: http://devicetree.org/meta-schemas/core.yaml#
 title: SiFive PWM controller
 
 maintainers:
-  - Yash Shah <yash.shah@sifive.com>
   - Sagar Kadam <sagar.kadam@sifive.com>
   - Paul Walmsley <paul.walmsley@sifive.com>
 
diff --git a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
index 2b1f91603897..e2d330bd4608 100644
--- a/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
+++ b/Documentation/devicetree/bindings/riscv/sifive-l2-cache.yaml
@@ -9,7 +9,6 @@ title: SiFive L2 Cache Controller
 
 maintainers:
   - Sagar Kadam <sagar.kadam@sifive.com>
-  - Yash Shah <yash.shah@sifive.com>
   - Paul Walmsley  <paul.walmsley@sifive.com>
 
 description:
diff --git a/MAINTAINERS b/MAINTAINERS
index ebf7a75a6bec..87eeac970ca2 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7090,12 +7090,6 @@ L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/edac/sb_edac.c
 
-EDAC-SIFIVE
-M:	Yash Shah <yash.shah@sifive.com>
-L:	linux-edac@vger.kernel.org
-S:	Supported
-F:	drivers/edac/sifive_edac.c
-
 EDAC-SKYLAKE
 M:	Tony Luck <tony.luck@intel.com>
 L:	linux-edac@vger.kernel.org
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
