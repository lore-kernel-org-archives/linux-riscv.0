Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2A90C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:32:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jIi0PG5P9fhrdG0y+TPDdrW/HLWa9fncIulxdsArqEg=; b=3y0SyrnYWlI2qv
	fdhw9u5OcThaWvlo9lRFY5hKC47IVL9s2CoYNELNWbQx2T6WYrRZhNdvY38rfYAPoYf5sHNXf4rWT
	dcGelPCecY7eQlq/WXEAHdvlD3Tn6PVUiZWlacg3gs8N0mfPtHSWn0jYxXWlB4+ojICBMCYwWCnnj
	4kndAx+KIG4EryA6uXdcxcJi8dludtK7zma1wsZZ1vH5dDFJgSbN413HAj+txynRyyCWj+hz7GV4e
	O7C5PHHGJt/gixq9AlalMM0wvNf2TobkVihjXI8JcnoVrgzWR7VhWD5VfR0Piv2uWhva72DqXMXuH
	wBClFBErS84OPP2GS0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJixY-00H2UH-S9; Mon, 14 Feb 2022 21:32:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJine-00GyMc-O5
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:24 +0000
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4F1B94049B
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873741;
 bh=BTa+7+hPQApQrGc3LBEa/6uh1gwW5m1A+xf1VQ/CZYQ=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=ODOe/j0A0B4z405ZHqkxFJgcE3eXPSN7Hnx+P7rWe4U4Z+PIEBjlY5/rHvxX8y8PY
 1DiC/m4IC0q/w8o9O4v/4CaTX7SZiYBp2vNnb9AsWYtqtl7+YXcLnQ7445LI89Qdxs
 HVAb0meW/Z7Yv/GMmGwaSMcRnTYVM/5KGar5Ypuz3k3vWZufsVmchLKil+lne4Eqr2
 C7S+sUDlMfGL/9DjERmbnF6eFTuEMbQwLym58tNc5UVaScWrMfLHn7VRAycvIPrAJE
 ydYMPhrDHECX3hujS4LtRPAEV+ZlGN3MdOpzxqPurTgSgb7i+ysmqqTNmOqGpc76Ah
 nPb0n4ZN0jsLA==
Received: by mail-ed1-f69.google.com with SMTP id
 o8-20020a056402438800b00410b9609a62so2775592edc.3
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BTa+7+hPQApQrGc3LBEa/6uh1gwW5m1A+xf1VQ/CZYQ=;
 b=qtp9daGGdqJ+klzo/IUyxErCQaFqCnjsXq0Ca6QRUXlg/4M2YWxGQ/Vdfo1E2El88t
 Qbys9dcjOLt5JJ5wu1Buk7yA9QBWwZQpdjC7p1o8HhjyPNBy7Mk3W2RiYBuKvWruQeuX
 X8tWcC/Fco55F0ryhqhKEcYv1aqbqwlyx0EmZoHL7yAOpuHXjSsQ9FU1zeykgww7bUTX
 3feLGagK6mtG3RvgcyMp74fwfA3s5cIq2tpqweJ2Eq3eng5gGmCGoTEogwXDEhBEBiki
 Q5lmd0WCeYd6C19Em1bftuP2QiHbnY7MhE2Bh6Zr7gfzz9rI6ruGHyfeVz+3pgTCuBtw
 sQYg==
X-Gm-Message-State: AOAM533htJl3GDtBqOwOVUD0sfi7Mf+2CxyUE6w6/UGBka9c7Rigja5b
 iNtzgGx/LrGd26N/+kuq5Ynch+YqOM2SceIgs19mIXghZe39wuu+JBEy0oVIqwGY10Anh3UV9aI
 KR/PBY7qeEoIeJI4NQENf7w3OHUON4OTPZPtcpefUnqeBHg==
X-Received: by 2002:a05:6402:f1b:: with SMTP id
 i27mr797194eda.275.1644873740823; 
 Mon, 14 Feb 2022 13:22:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxI0exot3yoiNzuz9PwDF81XbTxvVVt2KMAZVFpKvmztfJkcydX4q8g7gpBrGY0uRI8V9/sXA==
X-Received: by 2002:a05:6402:f1b:: with SMTP id
 i27mr797171eda.275.1644873740690; 
 Mon, 14 Feb 2022 13:22:20 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:20 -0800 (PST)
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
Subject: [PATCH v2 12/15] dt-bindings: pwm: samsung: Do not require pwm-cells
 twice
Date: Mon, 14 Feb 2022 22:21:51 +0100
Message-Id: <20220214212154.8853-13-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132222_973807_BEAD4525 
X-CRM114-Status: GOOD (  11.53  )
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
 Documentation/devicetree/bindings/pwm/pwm-samsung.yaml | 1 -
 1 file changed, 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
index 188679cb8b8c..fe603fb1b2cc 100644
--- a/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
+++ b/Documentation/devicetree/bindings/pwm/pwm-samsung.yaml
@@ -86,7 +86,6 @@ required:
   - clocks
   - clock-names
   - compatible
-  - "#pwm-cells"
   - reg
 
 additionalProperties: false
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
