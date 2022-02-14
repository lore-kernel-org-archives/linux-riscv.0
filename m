Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3E88C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uz3C8+Pu/03kBCWHAGlZGh9lTwmkWnsWbFoIHNvPy5E=; b=3CaIVOiOHWS/Qg
	LZB4YDmrgsCrlDxK77nBNTQ4ljypr3Bk3trjbpR5p2j4pEuJfdrvFm0dNNJcfIKEN4p6vGZBwTnkg
	U3qPK1aedG5Y9+3CPXnPNWWWsAaYmrWFkcldIUUiEjFh/AVWjL8Bmyi46YmQXJGbmfUnch1XU9cPj
	YAK1QmCSPp2dr7yqU/7iYM0LJU4Ewvygdkm8y5Ck8pIUuWoUZFPGVyg/jq1i//l4SPwmhEDq+3xZQ
	Lwzt8aqhU18J9MLElvHVa2uOmObVoaA97PVJOnk8NlrancygmNMaBv2iL2wZQiyTC8TXgzGOubeHp
	D3yj7shtMJEHg7FOTqYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWig-00DueZ-W0; Mon, 14 Feb 2022 08:28:27 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXq-00DpcD-6M
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:17:15 +0000
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A71E8407DB
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:17:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826632;
 bh=bOhlBRyYjdc4olCsTRd9yvmwLAfAPm/hGaoOpjTnzVA=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nvR8HYrs67ggslT4ASUAdGJzrcw55S0M2iScduJi80VfzUsnIjEYaDzMv4vi0Vyet
 /v7VASQD9X/eoOznXCxcSApyinWIxfqfFe/a0ndkYw7b4lHXkz0runXbo005n/k/Gy
 C9zuEvwowi1vw4HbO/Zlo/SRzgY1wBoOWGJeAeZ556BS9VHY3a8FZHnimwxUvXTd3c
 h4ngR5/0O5nTmQBrwvMbTUqUdbNwiZZEyNtABdBXnCcm6fKXikj9SbFaSUQ6fM5AXu
 gPWjpADrjzNUh5l6+oLO6F1eJXy9nMdJTG0MoSd4Eww+UWMYUgea3R+JYPdJR/S06l
 ziq7J3xQRCNPw==
Received: by mail-lj1-f198.google.com with SMTP id
 y19-20020a2e9793000000b0023f158d6cc0so5430933lji.10
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:17:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bOhlBRyYjdc4olCsTRd9yvmwLAfAPm/hGaoOpjTnzVA=;
 b=NSosC7i5Vd8lASU3ediLISN/5/q8WD1HrvRb2r2azCmNR0NKeaWP4JOeHIpfHovavK
 4FUMuvAPkG/ZfCj2k52QN2wvOOaDAm3XqYnOpw+FCQTujGr/X4StRLjQznYxNEOJkyIB
 wIL99DSAo5V4wI0GY4B/yh0MpIOrVn1y4F6zAo+H31E0Qecxr5sO/yC9fgIhTL0DX10B
 lrggqJgo5rOZizOeSQSSPqm56W0qkPXtU9PxfrAu95RWvvQI8xMPNkqXFoRvUZqV1TbT
 JkLFMhOt8/tZbXcqXfJrmxhw5Pk3YJZmYeo4V33Ag+trfVpfFTMUk6qwIXuR4D71OgWw
 DU0Q==
X-Gm-Message-State: AOAM531Sj5Xnlz/xkMp+3ZvCYSeje2G9RcwZho1jZwPkmbNviptbR/KI
 k3xjLF68Sb8ZFI0L7HkM48elzm/jrpNJ9vIGVdQmo2xPBG9pLltB0Vtv+yD+q2EYYHvEBRR/p2M
 kqfp0A08BAFQmOkwCqTIyvctymXY2KWduSMek+6ujVnVENA==
X-Received: by 2002:a17:907:f9c:: with SMTP id
 kb28mr10076909ejc.213.1644826621272; 
 Mon, 14 Feb 2022 00:17:01 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxVq42SC5ZUR0wG1GQiAhOdCRluJBdfCYPvNoUVrfESuZAlthB1iFEyURnQo2Crc/39Bc5gA==
X-Received: by 2002:a17:907:f9c:: with SMTP id
 kb28mr10076870ejc.213.1644826621102; 
 Mon, 14 Feb 2022 00:17:01 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:17:00 -0800 (PST)
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
Subject: [PATCH 13/15] dt-bindings: pwm: tiecap: do not require pwm-cells
Date: Mon, 14 Feb 2022 09:16:03 +0100
Message-Id: <20220214081605.161394-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001714_388982_194E2748 
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
