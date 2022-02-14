Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B67ADC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1pgRbUKOzQq3BR6YaXRG1WepdDyc6x5jDXPib6efjZg=; b=EkFpSCHzrb9DeA
	LpcTezxB7TF3WJiq/G3zC7AttohocDMEvfN71sUHhdXDQYR4XFfKJFy/YRTqYQyjA4H29TScfILwJ
	XzdMOrAoM6CmjqwqDF4lfEogT6hsPkr6ZWu+tzTONFedqoAr1yJFJdreCYVDHj+M+AQRDXIgcQmuQ
	+fv07aumHLSXzpibels8uzIsycM+XPJUIiJUAmittJmgcDUk53FwaPpJJO+9cuYP2sIta3R5KDxg2
	P85CInbdtMwKVfdHq5jkc6vK0PZvJkGk1YsEA9vwVR1tziGe9ykC2N5LX5cE5Hs+JHZrrD7gbDDyz
	p4kgFyfIaROb8mdwOKDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWfA-00DtKv-Il; Mon, 14 Feb 2022 08:24:48 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXg-00DpV3-Ly
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:09 +0000
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id ED4BC407E9
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826622;
 bh=2POCSk/6TwWTazpis9hGbBMQ4KYz1OTALCTDWqaBti4=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=BM0g8J5V0yskzhCm194qP37HkgBgfwyw4VNMkUPqoyzh6KFLwnyKYNFZHu0Csfw2j
 UUb4V48WExwEKZpCIC9mQs6bys2P/iJlWf7tAIOvLaFPxYJEKZNhBhg4iAS0aWmQXy
 nBCVwdntcWSuQebye/bHHYXJPPtJWVnOaxer0SYX0ZVOoQO+syJ70XZSNNAat5iWf3
 yVjyvAybBXsIyg9jgDjIHctBJt98vJSDgB2sMVaMgxTu5dEeuWGXlaYJyhe3bRrF5k
 zqzr3AnfrT/QdRh/AKHSi//6My1NctiOmUFZeYni6Sy1y+7MfpvypLbVxKY9J4IoOs
 j5nKgqkUqTsTg==
Received: by mail-lf1-f72.google.com with SMTP id
 i28-20020a056512007c00b00437f0f6da15so4968398lfo.16
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2POCSk/6TwWTazpis9hGbBMQ4KYz1OTALCTDWqaBti4=;
 b=buIQgN2lk1BEMsvTV/gsUzBIm4kq9OkW+ygkpsP5L14Bf3vVMgqT0pq0PK2agK6LhF
 E3nahX+joEvkF4aW/KGo15MnWfVzbiE8ISDTex/1qOai1jBVPRvkF2/TKgskzQLJ/TAX
 rJbf07aP/a5gciGnM/wJOvcLXpz4C8jYSuGf9LeKhcLavClnGabQ5kjHlSC30DG37Bc5
 yyS6o682rNpSQU/suUnyr+JWLyfJ+VMpNoMwYvo/iEBi6xBXPaVO7IzSASAEzfZuG01C
 sdibWtoH/KWxINW+MCDDoLtJfzE7kb3w64zjECIh2o8zqZZ0YRE3QcBipsImBspjJ6c6
 7+8w==
X-Gm-Message-State: AOAM532XJKuP6Ew/dlzkcu/0Gxv9B3jEBtccyqVF1DwSvtFb2M+bIGv5
 sXRbqW20ibayXEkwb563lRfq/AlTa3Y3w50cc8wNtB+tXqf//9q8GDVZzGyLgxrq7eZrC68z7ba
 vF1IU643nhfV6qcoS5WcOwa01AHPNbLaBNoRaHMlKGbrRCA==
X-Received: by 2002:a05:6402:d0:: with SMTP id
 i16mr14154257edu.163.1644826610623; 
 Mon, 14 Feb 2022 00:16:50 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzehUJnpv0saAzMdWPLDXiuxxvQr3Bh+VUR68F9vzvxoszvsgh+RQPNbOAs8Fmy07wTsUQlpA==
X-Received: by 2002:a05:6402:d0:: with SMTP id
 i16mr14154229edu.163.1644826610426; 
 Mon, 14 Feb 2022 00:16:50 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:49 -0800 (PST)
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
Subject: [PATCH 07/15] dt-bindings: pwm: sifive: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:57 +0100
Message-Id: <20220214081605.161394-7-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001704_890182_5A5B84B5 
X-CRM114-Status: GOOD (  12.12  )
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
