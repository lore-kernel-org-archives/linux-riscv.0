Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D587EC433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=popqvA7u6//3v4fmiLd2rbO0wv2IcBGnvC5IvngujbA=; b=J+8sLDotE2EEe8
	W5CsN3KlnbEAR4BibV29Y3czgMbL3kdbT0FAV9w6NLzb1Z0BI7YOEAGe901t0lzzrykHXTKulwLui
	6oYgyWc3D3jpyccwf4IQsz+TPePgwXYhJcegSwTxvRpJyvQkT0g3h8as8zEMaeeJ/GDVdLUeIXbYI
	hSYs9VKdj2a1qeaUq0RZCcrruyuvQcOGh4gGbH31W6fefI34dMTfouvIEPPEo5AeeQkS+XSzj0GS6
	cfnHk1V4CNYLlVWo/UclNkq8QCT79BgVsJacZzj4dATbKJXnqUW8a8IhBht6fNS46R1I/jxm342j9
	uqsl2TtPpsk0oC6h06nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJipn-00GzQD-Em; Mon, 14 Feb 2022 21:24:35 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinR-00GyCf-GA
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:11 +0000
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 0CFB240333
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873728;
 bh=1xNmK//HjGNaIQp8eaYbachy53dRAmEobraHrPxOQCQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=cyfDDj0QyhfE9wY/rL/p54nhFVQtItBOU4Bh1dntQKkiHLilCCB4aA+rcNqYk/hya
 ovIGaYGYQZnJG4B7YRrnWFwQZYUcejFRkg1FNkPvD2O5GMVjiINjDgHPpstpoyf+sy
 OxRlQO51UNtnzklZb/WBLYm2kp/5OcPXpHrg0WUDDU2JJm0+wbv8oV+dJBzImYrfZF
 0p0l1A3v7ijEp8D1v6dCBMjIiuChC/wXDIpDwq8gFzjU5kiUFC8sDGmXsJAMyM4f1u
 3fRJhUk76Vy8HjfHO5LTCOfW9pNsh7lGpq4LyyDFGb2f/5GWFWlq4chdX2tCQcBjzZ
 B3u3SNosJh6lQ==
Received: by mail-ej1-f71.google.com with SMTP id
 kw5-20020a170907770500b006ba314a753eso6369746ejc.21
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1xNmK//HjGNaIQp8eaYbachy53dRAmEobraHrPxOQCQ=;
 b=n+VFKe4NsV/pBSU3lEm8sUSdbnpBz6L6E+0rkzQERwqYprWNRvFm1+iKym3vZqPtvl
 R9hfxU9RK6LhkbiKja1jGDeL1XWfAqSMd2krbh3iSK78iM5nDmQNKNpHARyIzjTDaQ/+
 oerEzlCmkjf8lkJTV5LuDUuWtLb+gx8wXXG65sDiQvM0djyyoUNhy7o8+Z/S+NwJ+t4O
 RRzxt6eSRpFcwdxC/R6DD/nkJFUSu7IcpRlPGILWGQT6SAnNAdmzbftQ1hALnbz3GP2+
 rLG3JaeF6zAPMCzmYP3A/DV3drMexhB4bBaQjPNcX1AK0a94RxvflEnd4htFDOqQ41Lc
 XVKA==
X-Gm-Message-State: AOAM530TlvA1GwpJ/+Ruyj5N5HVCQepWGUjEO1XzGPsYj4kz+RR+XFaq
 Wrl37lH9ZC23eBfNJ/lC+YgW416ZoFyLD9xZCA0iQCD/JE/MMlrfq3oTx2IlKqKPNc8kQWKC62I
 Y8fefVGfVybziRtN3/VQsCLMTedE1KCcufqAXTd/pWjLgWg==
X-Received: by 2002:a05:6402:2203:: with SMTP id
 cq3mr756154edb.185.1644873727721; 
 Mon, 14 Feb 2022 13:22:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJy49BfL0PgnMrV38zW/ZrNuMHV/5GZGb+TKlaJ5NvG8aoL2ex2m6POK5VS+J5aobKGKcLFIQQ==
X-Received: by 2002:a05:6402:2203:: with SMTP id
 cq3mr756128edb.185.1644873727584; 
 Mon, 14 Feb 2022 13:22:07 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:07 -0800 (PST)
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
Subject: [PATCH v2 05/15] dt-bindings: pwm: mxs: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:44 +0100
Message-Id: <20220214212154.8853-6-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132209_712728_FFDA303D 
X-CRM114-Status: GOOD (  12.18  )
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
 Documentation/devicetree/bindings/pwm/mxs-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
index 8740e076061e..a34cbc13f691 100644
--- a/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/mxs-pwm.yaml
@@ -10,6 +10,9 @@ maintainers:
   - Shawn Guo <shawnguo@kernel.org>
   - Anson Huang <anson.huang@nxp.com>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     enum:
@@ -28,7 +31,6 @@ properties:
 required:
   - compatible
   - reg
-  - "#pwm-cells"
   - fsl,pwm-number
 
 additionalProperties: false
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
