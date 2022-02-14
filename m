Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5856DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y8mLMHDvmzT6h1AOWuMNs3UHU00be6/7wDIfBIz5DQE=; b=Tryt5Cv0b5V2LZ
	0L8k6lODYCnCX09c6SnMdKGw38NI6BOEWpxXKwzw/fuX9kkTr22+g3RtP5beIuJxqi0jcobiO12fi
	+V+jhL46DY5+LW2GeU6sIuRbsnr/J8AHSDOVReT2VEjlaUo7qNP2oVXa049vbOaj5PD12KsA999eh
	mw73KQMQggrwU1sZ29tuBLTqWrPs4HfCRsQmfcUpslpijqFUJalLohSgXnG/Q+AvMa5FQ9oF7ET/1
	AoGTallMG9f2v4kmDWHdGKipvHjoeBlHIjRZQms1WtmsgCjrhvLqutpOKEYXQ1p1jY8TwIOq+ursJ
	oS31NDF0m/Od+ZqkRjng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJipe-00GzMM-AU; Mon, 14 Feb 2022 21:24:26 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinP-00GyBN-BT
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:09 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id EFC88407C4
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873725;
 bh=05sXSD4PIb8v0ICor9Lwlzw82mhcHvJZHXpVeLkjK/k=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=nfnvk3LPxC9FUn1X05mTOgRILDIDcALucOZkPzZd52XpUuDmlSe9SpMhe1+qsix4V
 xelXXE3LxHxonYBFQs80YEOKpGmRYTgur/XIjPr4QVFzfVF2eGO7y/JjqmC1t5wh3J
 91BZXeSDCPm8O5OkUJj14Qo4Up15IXCNNO2dotUwuDZmvVxdamp3D8GZC7oG9v7vdO
 8fL2LHVWVf5PNr3ZkUG9lAyGZr4VCHb7OgkPzroyyZVBWf+igkLsoNHjirLCphjetL
 pp23S2j30qwEBI0IwE/KOhHNcgPdJI85I/51G+BTa9UN9HJmAPAC19GlrOo1oh08kv
 mwiVrE0USeSIA==
Received: by mail-ej1-f69.google.com with SMTP id
 o4-20020a170906768400b006a981625756so6426597ejm.0
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=05sXSD4PIb8v0ICor9Lwlzw82mhcHvJZHXpVeLkjK/k=;
 b=KjCkpKMSwkmECWP/td4paDZ6K3cPYogu/p0FW15ZpAO91l146rW/qlzCF0CA5Sd75i
 ApPtBS2/fjuWJWJ0D/rPuw8fAZvLTlHjkc/3WeVPKjWwQZEypUthTnHWmkp2JCjOCKpl
 WUX2tKXOIPrzMBfn1D5ePfr0OtpyHnqOM6/pPuxGl8kttFdFiLDcJv2IS3rAEijwC2Q5
 UKKh/3YlEvmsu/1sMXLJwQEBkNjCwhO/IDV95lflKaOMECnf4M7bt5fAJaqZjQoNu0HA
 dtlzq5NyrcLp4/1jM+i+V3GlL2Jljg0MS2yiBTHdiIwq1vqwr9uNoUreQdz4Lrzvfxcq
 fe0g==
X-Gm-Message-State: AOAM531BKAWtoL0vYUxKpz6tRHJR1VLxBpnsR+m9IraskohWCedX+/Tr
 OdbaOn7ReGW62osvEU/xnwlTztlrNCiPTzh4CveptJRwnJQ28QVQn63y6KbhE/Iic85+WfcIYzp
 H/UY0X3mg7czckyM8dDCX+sKxmUjRfiBvbUwGvmRDxZMgWw==
X-Received: by 2002:a17:906:dc94:: with SMTP id
 cs20mr569418ejc.197.1644873725570; 
 Mon, 14 Feb 2022 13:22:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxypzu9p7HsT4S7Ad50YuGuHC9KWwPHqmyrycOPMKzhRcEXciPDMggnLpRKMW5EEgnh0II1dQ==
X-Received: by 2002:a17:906:dc94:: with SMTP id
 cs20mr569374ejc.197.1644873725370; 
 Mon, 14 Feb 2022 13:22:05 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:04 -0800 (PST)
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
Subject: [PATCH v2 04/15] dt-bindings: pwm: iqs620a: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:43 +0100
Message-Id: <20220214212154.8853-5-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132207_584254_680F1AF1 
X-CRM114-Status: GOOD (  11.85  )
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
 Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml b/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
index 1d7c27be50da..0a46af240d83 100644
--- a/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/iqs620a-pwm.yaml
@@ -15,6 +15,9 @@ description: |
   Documentation/devicetree/bindings/mfd/iqs62x.yaml for further details as
   well as an example.
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     enum:
@@ -25,7 +28,6 @@ properties:
 
 required:
   - compatible
-  - "#pwm-cells"
 
 additionalProperties: false
 
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
