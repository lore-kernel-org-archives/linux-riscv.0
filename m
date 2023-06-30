Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA4BEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 12:05:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aZ5ud8hBb9uTI+ZVCfSE2IRhwQD2skCODXMyjlFrhbQ=; b=Br/nuEpa54U2EN
	OsDx30l9rMw1xqyUifopQuXQ4S9BzlliKDB/NdDrGzKJ8yFtXerHCqLCho348bGCzOeMT3Ypc1vUG
	1lP2EK1trtRvC5TO80+OUboOZTo8+XOeUsTGTgwg4zzqLrIv6TeaUp35RdmEJOe5rEQhuXZTqm07v
	fyaLUULsf57nC3Nj51ymsE283R9yCDLILryUhrJk/i+JmiRL9XifZEcNsx2CxK4ujTF/tQwcRqYwN
	imH605p6Mu+j3ygwejnO6GRNyA/C3ESFRDnxIAJRFP7zb0BT00PsLPMH6q2JJx0ZvX36XpQVwewqm
	nB7HmRicIanI30k37FFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCsS-003emj-1f;
	Fri, 30 Jun 2023 12:05:28 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qFCsM-003ehI-39
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 12:05:24 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-3fa8ce2307dso22099255e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 05:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1688126718; x=1690718718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/M+822NMBcWFhtW8psDduBe6caBnlnfKm7WRYzHuukU=;
        b=rLdjIQN7yit+HWPAMW+jhFcyGvyUsmyIP0VGmjcfLwXF299DfXuhRlt0bNU1yZvjxD
         c2nZHhKKd32WLaRmNsZfKS6uk+x7WU6HSe2HYj4bmVXbu9+AiEn/C7HhH67IfM6+lJZ2
         VCQySiUismfPmy4aq4xIspeNTZ8wm+8lQbCW7Gkz0gn1ygDqUau0L70GiWyqJzyb5lXl
         1Ov1CGGt0OinBmPyg6efhLDnkz4Y0YnaRPTi0lIsYhV+0bAOy+5w/D3dTelpWwKQUIO7
         Z/0ySqXY943JLZB77FLpcv7kTXRd3Dw0bW5iuF5F1QkYdM+ULE9UOqg1CgzTMyYXyk2x
         nDbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688126718; x=1690718718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/M+822NMBcWFhtW8psDduBe6caBnlnfKm7WRYzHuukU=;
        b=iw0you8NKFl+YTTic+lIsrPmBIkwGRiI4K6RItMxS9nVYTJCAFhcC4NkID0wzVAFME
         mpQpNnDGNaJk/2Qq5d6Y+8twwlQ58BXros7wFEl5eHwaTLqwN0iw6z1l2GwqfuDiEn+4
         tZBzG8VB9yaUkjPqql349X3TntzCgk99zajGyWvWXGW/EQfO6QaEGpE9XyFUDSedQjdz
         89sDrTiLFdRIupKFPKa3g0OuwF94ZTbOuwMEFq7mMyJ2/sOxl4ivuDv3Xt7c6RIayNcD
         ws4s7wgCCEC7GB+SmQ5eZ++GGo3di+Vop3tTS2zClS+nBr/L7KDNGT62zFxV5CtjKmA7
         G4rw==
X-Gm-Message-State: AC+VfDz0XwHeJLygSf3q4UOxR4sbQvj2j2kT0+XE1wmYZMRS15EIZC2q
	R7zPOrcTbotVLmvicDY9JLY=
X-Google-Smtp-Source: ACHHUZ7YSKrbGPipvwwchGHahSK0z8Szh2TyxflljlqD9nBbK/YxHxmt/PROw/yeSvHxBK61RFwlMQ==
X-Received: by 2002:a7b:cd8e:0:b0:3fa:8aed:d57f with SMTP id y14-20020a7bcd8e000000b003fa8aedd57fmr2239809wmj.24.1688126718052;
        Fri, 30 Jun 2023 05:05:18 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:dbbb:7082:18ec:f407])
        by smtp.gmail.com with ESMTPSA id k22-20020a05600c0b5600b003fb40f5f553sm11766912wmr.31.2023.06.30.05.05.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 05:05:17 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [RFC PATCH 2/4] pinctrl: renesas: pinctrl-rzg2l: Add validation of GPIO pin in rzg2l_gpio_request()
Date: Fri, 30 Jun 2023 13:04:31 +0100
Message-Id: <20230630120433.49529-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20230630120433.49529-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_050523_030707_3C0411A7 
X-CRM114-Status: GOOD (  11.11  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Validate the GPIO pin request in rzg2l_gpio_request() callback using
rzg2l_validate_gpio_pin() function.

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
 drivers/pinctrl/renesas/pinctrl-rzg2l.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/pinctrl/renesas/pinctrl-rzg2l.c b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
index a0c2e585e765..2fc1b880db0c 100644
--- a/drivers/pinctrl/renesas/pinctrl-rzg2l.c
+++ b/drivers/pinctrl/renesas/pinctrl-rzg2l.c
@@ -780,12 +780,18 @@ static const struct pinconf_ops rzg2l_pinctrl_confops = {
 static int rzg2l_gpio_request(struct gpio_chip *chip, unsigned int offset)
 {
 	struct rzg2l_pinctrl *pctrl = gpiochip_get_data(chip);
+	const struct pinctrl_pin_desc *pin = &pctrl->desc.pins[offset];
+	u64 *pin_data = pin->drv_data;
 	u32 port = RZG2L_PIN_ID_TO_PORT(offset);
 	u8 bit = RZG2L_PIN_ID_TO_PIN(offset);
 	unsigned long flags;
 	u8 reg8;
 	int ret;
 
+	ret = rzg2l_validate_gpio_pin(pctrl, *pin_data, port, bit);
+	if (ret)
+		return ret;
+
 	ret = pinctrl_gpio_request(chip->base + offset);
 	if (ret)
 		return ret;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
