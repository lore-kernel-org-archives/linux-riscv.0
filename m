Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C719C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 21:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+XIOPfQ3wwG285octbYZ6W2wI+SuQRl9VW/nZiDmI4A=; b=LcUAZ/jkCNKRna
	wJORGuW+UJk0Oo+NZZIG+I5/4TpFG44+lAIz4jWVIycrxuXmD8JWnqlevNlJg1GYKYlmtWAw6K8o6
	BsIs5KJfUTJuXM+Xc3zbEp3cIas1ERUd1/JBxXKJlft/zMjI1xm048kPaDWw6dP+VNC+c/S2dQDqc
	KDh2egCmr4nMnW7+j8dk02fQUSZuLoQO7HYRuFdKgxZ0l5r0Zd3sEMHDSPMb7/k3XbUmMBDqmYncq
	FsQfF1OKNvdpgtrPF7Rv/0ZItrYfYfjLhBWjifTw1krxs6UgoHDKNRXEUz4CB1m4iovLmygLAdmD7
	wcKyVBpwQZmCoroClcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJiok-00GyyD-NZ; Mon, 14 Feb 2022 21:23:30 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJinN-00GyAD-E4
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 21:22:06 +0000
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2B929407C1
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 21:22:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644873724;
 bh=Vx5pgZq+wTDk2cXNM++1rpL4of1cb6TeLTw59n/JqH4=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=bmLRHw85gqw8wok9EReyAa+vURzmKNoVTAS1Gmmh0QXhzcY4HXzEGqpBSdjwnmpTl
 CwuHKNJMV/NeIGy6Gbl1VT7MrcpcOT7e3buhCka08ugmem9W6Dh7wPZHbvbqC/E0Wx
 MmJuzntmYz0UiMM27SIUYC4ux37SMH/B2OGsQWEkl/6s6yJ7Ac++SQXantgpih5LWO
 j9kIWtBMWS8XHVTONkL/MNE3IYZox5OxVb33TwcukZLBBCLEJSpE4o/NjtRG72obH5
 /MBDtvgYlkUmlV458eOJHUBuV/9s0Ai7PEO1fXjY0dxN8IYKxQa9CSDKlxIknmoOb4
 cabgrUg8bSsxQ==
Received: by mail-ej1-f69.google.com with SMTP id
 qa30-20020a170907869e00b006cee5e080easo1340926ejc.3
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 13:22:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Vx5pgZq+wTDk2cXNM++1rpL4of1cb6TeLTw59n/JqH4=;
 b=eXKW8J5jVlIbxXrMTFOgaBT5yHUOK7gaRH6qyNEp7z746SaPrYS3A8r994jZ022ccV
 DMby/F9qrg16FKtR45n5C21p8HgcHntcdLGLymf1ex6PRUUy2TOPFZVHw3KUABm+uUyb
 px2JAl3gaHnB55V9fR7H7Kzb2zXaXrRe+jstHWIj8U/DBhTUNj3pg98cNbbWSsxoUqY+
 3DBm6AHE40AVhpPjP4dOjkwgM3VEp88NIWphaOoyOs2QbiO/ZprK5oM3dBuLfWbmsDXj
 qPFqTNiVZJwOWPaqphvmRYayBa7Vzjo1SmNNFexSlAEmv43FOCKJFFZRf1uK7m9TVs3K
 zXOQ==
X-Gm-Message-State: AOAM530wWTt/GWiX9CBZJDb8NWx6LMDYzp2nsbuBBj5t/UCzBYpZ1fd4
 ZyDDDfqL1ZKhZYNq8cr0YZiM+XH/E5B8WCCF1GiZ9EIucd0dGVj5DBN5/f1q6QbxiCL7GFbc4u5
 bwRMjhtACCv1KEV2y1pkivNNooSuPUCimW+hvbt2omnv0NQ==
X-Received: by 2002:a17:907:d17:: with SMTP id
 gn23mr511695ejc.719.1644873723788; 
 Mon, 14 Feb 2022 13:22:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzn9EFz2R0CbHcclhbUA8j9QL+yRr4fQpPA+X8j3jV9fWd1mKh939ozog2RabglBFb1m4mDQw==
X-Received: by 2002:a17:907:d17:: with SMTP id
 gn23mr511652ejc.719.1644873723619; 
 Mon, 14 Feb 2022 13:22:03 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id v24sm2327203ejf.7.2022.02.14.13.22.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 13:22:02 -0800 (PST)
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
Subject: [PATCH v2 03/15] dt-bindings: pwm: intel,
 lgm: Include generic pwm schema
Date: Mon, 14 Feb 2022 22:21:42 +0100
Message-Id: <20220214212154.8853-4-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_132205_639784_5857965D 
X-CRM114-Status: GOOD (  11.05  )
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
 Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml b/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
index 11a606536169..59d7c4d864c1 100644
--- a/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/intel,lgm-pwm.yaml
@@ -9,6 +9,9 @@ title: LGM SoC PWM fan controller
 maintainers:
   - Rahul Tanwar <rtanwar@maxlinear.com>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   compatible:
     const: intel,lgm-pwm
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
