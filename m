Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E5D3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RdDXt8jum7kSx/OmtGGtbKDbflaYfuaW6R8RtnSbW0=; b=SkddkBcPfDWxk7
	chBlr1OtmV7NxC+SY7WBm/uyR8zIeUBEyoK223uyxNA3C+HHgNwNZAW7genwTMCQOAuSkXmxHMt+j
	k8JW/swL6geZX1CpW0r0xShAnqaAI4NUg+rBDkgbWiQyU7x3cTAK3TcY5/l2LoiI+HWio+Mnzmm+b
	2slfdpwUiz1uohC0b84UgQ43+jioUU8JsRUOqFYv3tKiYmRc58yq7sYYLFBWcx9HTlyGx+ypAxCFr
	xG7g61XMBnLg1TwuHKmBYYIg0DkA2dLROyWCJ/tYK8/5hDDCB0UoZ0xtDVKqMpXr5oahlU24X8rXG
	KMBil14L2PfzZ/iyW+XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJj3A-00H4c5-2e; Mon, 14 Feb 2022 21:38:24 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJink-00GySI-Na
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:30 +0000
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 438DD40339
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873747;
 bh=nq4ij651Faznv2JZt1q1SNPJWaeI5lkTeLdPO5VR/U4=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=Pp1ZbmNugIyIdEKY9w7eL7ZciDhFkj6T/6mXCMtMqbdd/rF5rrp1P1e4uQ85addhm
 EgHhuLqQ8CAyqf+U1ms1AicMOLk+e6ZdewH4q7Grj8UpJkTp8/54m1KJ6NVIF3CIol
 ZdbRNnCr8Rp9qm+Cgb3yNzHAaEuQMWQ2PGTYbOZ5/EmGuNLaycmWfpvWwCBnyCel4N
 RUPxTAKXbHpSYaIL5oohdbA6kHJue+w+/m6sXDRCc/F4uZ7IBX5Y/FeDzc5dvIHg/2
 x5LYI0puJAxc4m0ST/N3sYxk80fWeCwN3RQZfkC2X2JbmdyVmv085VqKqDkuyyZQ/9
 Cr0b86xBZ70aw==
Received: by mail-ed1-f70.google.com with SMTP id
 f6-20020a0564021e8600b0040f662b99ffso11051498edf.7
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nq4ij651Faznv2JZt1q1SNPJWaeI5lkTeLdPO5VR/U4=;
 b=opRI4SFLFp9WdABY/4wJIIvP5gvMdxRWYom/pPayL5zWkAhmUzJfw8HQ2TCz6slU+w
 Oxx/ETfJN95AAz+SqGmOSIEX6uHqcfWDY/FRXAUGlkJOP2j3/FSvBNZiC/u2oEtL4hW8
 n3tnLPa/SLqNlB4+You6Pu2bYUOto3GWKceNrXU/zE7d68lgljRmLsb3GZk1C3vAyKy1
 smLsTIGr/BPjtVLeACtii5K/WjFnMM5MtFRB9o2RB6Y4EidrV/U+5CCqRjKDnZW0xJqQ
 65ZnC4OlA7AcUaIP90i6yg2V2bPDg6MXqYyTvT8EdVzyv9G06yAFkxA7gNWt8B7ykgud
 OcKg==
X-Gm-Message-State: AOAM533umGGruKZtI6zAi3+1VmzUUSn/bZQ5F4O+E+w/8SWij2c8Cnhp
 EQjtQPtFwYecYjuY3HuBSLdwHYE++M6nCHuqzKGfQcG5YaDqUbY4JL+ZFjXhCk2M6fivYY4r7Ez
 WCSIimh46LMgN7kJX6md0OcStNj+VgxvlfM5iuaqtES0ayA==
X-Received: by 2002:a05:6402:298a:: with SMTP id
 eq10mr800885edb.71.1644873746921; 
 Mon, 14 Feb 2022 13:22:26 -0800 (PST)
X-Google-Smtp-Source: ABdhPJz80Pl7KOImaUzcJEjp8kENwO8sBpFHNKeJMvOW/i73kktJXPrP1OEMsEJv+HrKWeHE8aPXYg==
X-Received: by 2002:a05:6402:298a:: with SMTP id
 eq10mr800841edb.71.1644873746761; 
 Mon, 14 Feb 2022 13:22:26 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:26 -0800 (PST)
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
Subject: [PATCH v2 15/15] dt-bindings: pwm: renesas,
 tpu: Do not require pwm-cells twice
Date: Mon, 14 Feb 2022 22:21:54 +0100
Message-Id: <20220214212154.8853-16-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132228_959880_AD3A31B1 
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
