Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F774C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 08:18:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e3oX4+pGpUl0SuQS8w+dboy245noqthSr32fnfm5ZLk=; b=1o0JOBfWBudr6z
	m2HU0Jc7+laQpEXViPWRGdyrVL+bci0fh/Fn4mAE3YxwoNZltpRwiJnsY1LyOLj161h3cmEy25ovw
	XTIyF6xGpaOGj5nCGT7YXivOwtRbdE/rvnBZmGM/aN9AJvN+UpD+CvNUgE4n8/FZ1CkX7FBk9i+B3
	fNZIehO2eyphOF/P88aKvMDJarToApKxZNht27k/jQhGxCTqbRrEQ8msAfPB2EgCPnT0/G0d0Pokn
	1YtAyTBkMnEutBVJIlOW6aRzTytqFXSvZrNObaJAbjEZKlm07pbFI/CPwZKtNi2ih/zrzuVyU7GrG
	6/vsV0odKLzbszTbz8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJWZH-00DqQ4-Gt; Mon, 14 Feb 2022 08:18:43 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJWXX-00DpLA-FN
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 08:16:59 +0000
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 4417A407D0
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 08:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1644826614;
 bh=11HYmRlx8dE2WpuAnKJ9eGJzYR6C7S08K2HSgZ9haWY=;
 h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
 MIME-Version;
 b=WZvre+ZYzwd58Bw5kuYwf7PiKLVnARh/6YPLtryxyM9oy82mFO5nzwsix40K9/LsT
 RUij05lgpJgdIhhHIuDruFuGRpgfzWMsmhbOLiDy1V/PImRvM0TG6JIk7IEQkimML/
 +rI1Ti9CpRx3AABMuB3gf1Gd9bAsIgJhbyY6Keb+lY8tYK3RP1pjAArrEgCqTGFadd
 QSZxlyMNtdtwt1hQHiw0ehbqP9TDaAkNeVDF4/UJPYtfCMNvnvGOEXmpPAfQEJ/7Um
 NgdWKsxdgeFI5fhh51JtuecZttlIzfxGt1CJjSMHTZqMGfsPSVFqK0CIPFRjm9rnVi
 N6mVYBDNn6PWw==
Received: by mail-wr1-f69.google.com with SMTP id
 m8-20020adfa3c8000000b001e3381fdf45so6562735wrb.4
 for <linux-riscv@lists.infradead.org>; Mon, 14 Feb 2022 00:16:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=11HYmRlx8dE2WpuAnKJ9eGJzYR6C7S08K2HSgZ9haWY=;
 b=jmrE8ihwh5hIV2u3sIYDtbMZzBPOOPLoryk8fV7SmWcH8BV77js+cAvB8mimp4GIQy
 QTHdQxHsQpTgaiIeNeVEZD//zGDSdjjr2gRFmRTOPRS61deNk8NRilYn3sImpEYRnLKW
 c967dbQz33NF1NAoN3MHelZFmIS8xz0fINCPaIkA09GMy4qSMlHq0aEBiD65JGWk0XCD
 EKJ3m8PvD4AsTNCZ3sgfluAjzMPAsGBfWSxthQVPpH8qAXpiM/NvXqgfa0IwerN+gZFy
 A1Wao4iVAVJIy8nvzBMpWK5oB3uIW0+aztbr/bqQTXfWVYEfuqvstrb/stM+pATNtwNN
 6+xA==
X-Gm-Message-State: AOAM533mTda7CEKaa7woYi9J5i0E+0Qc71V/dKxD+2lGm609rpYB5FRO
 OK7C9WJnqEWBwhhHNhjKeLtQokvvmdG44BSSQn/St4GagOBhp8iNo5DZIeVFmQWQWrX1LoRKXKg
 Hb037OWrvukjgiIX+e65HermZMdZxB/uPYEBFL36uRP/oZg==
X-Received: by 2002:a17:907:2849:: with SMTP id
 el9mr10391933ejc.201.1644826603352; 
 Mon, 14 Feb 2022 00:16:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxLuiFn010/+iYNxCh4N8RZLwAdqCGm9AdinTqIbutozbZK/206AXtZbT7nvgxN/IZXfSJlXQ==
X-Received: by 2002:a17:907:2849:: with SMTP id
 el9mr10391886ejc.201.1644826603108; 
 Mon, 14 Feb 2022 00:16:43 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-168-84.adslplus.ch.
 [188.155.168.84])
 by smtp.gmail.com with ESMTPSA id t21sm3363642edd.74.2022.02.14.00.16.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Feb 2022 00:16:42 -0800 (PST)
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
Subject: [PATCH 02/15] dt-bindings: pwm: imx: include generic pwm schema
Date: Mon, 14 Feb 2022 09:15:52 +0100
Message-Id: <20220214081605.161394-2-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_001655_652737_5C142305 
X-CRM114-Status: GOOD (  13.04  )
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
 Documentation/devicetree/bindings/pwm/imx-pwm.yaml     | 4 +++-
 Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml | 4 +++-
 2 files changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/pwm/imx-pwm.yaml b/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
index 379d693889f6..b3da4e629341 100644
--- a/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/imx-pwm.yaml
@@ -9,6 +9,9 @@ title: Freescale i.MX PWM controller
 maintainers:
   - Philipp Zabel <p.zabel@pengutronix.de>
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   "#pwm-cells":
     description: |
@@ -59,7 +62,6 @@ properties:
     maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
diff --git a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
index fe9ef42544f1..8bef9dfeba9a 100644
--- a/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
+++ b/Documentation/devicetree/bindings/pwm/imx-tpm-pwm.yaml
@@ -13,6 +13,9 @@ description: |
   The TPM counter and period counter are shared between multiple
   channels, so all channels should use same period setting.
 
+allOf:
+  - $ref: pwm.yaml#
+
 properties:
   "#pwm-cells":
     const: 3
@@ -34,7 +37,6 @@ properties:
     maxItems: 1
 
 required:
-  - "#pwm-cells"
   - compatible
   - reg
   - clocks
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
