Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6013C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 19:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tk/r0iJk4KTBg3CU7+7ETXrXLM2f42dyjtdd4iu8vb0=; b=wPxAOwlndRst/m
	cuUuqx3Nunqf7wGpODDbjPTAb7phN/wVro+RMYU2xuBKE24ePVv8XSfO+bg7rqI/wN0CSpMH2ZCwh
	m8Qbt/c//2qxjHxOcmXxOm3LySrmFHfd6OlUuSh+Mj8yD48j3FUedg9HSIE3flcb9UwP2qbNwqJz4
	6YUlNUgDlSOXpKi6bElk0uYsgJAaPjlOh68ADBZO8O6k7FcIJcGUmmCrazZUqVInw+baDBfGssHxU
	DS1ByMsAB4Q1Rz5yPPEhVWOxIeKuo8utwXFdFgslj55wyweZALk422++KMd0jKX7KM+/tNns9pFNF
	zIqz2JNea9u6EHySw7Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7JaY-00000008Ldy-1up4;
	Tue, 22 Apr 2025 19:47:26 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7GP6-00000007tLC-3qsZ
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 16:23:26 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745338999; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=J2saA4O84j+l4Ecqc9rmzPDzZZcpuaCpfGlscOsbakms1sdzshEoppAmtXSEOuqR4QAGMTW/6xI5RYKHgSOzkX5p2JBAPbGizFjZnjxnzGt5tEZqkLlz20P8a1aeMCtPDZA+uWXAilnyNiF46MwgGa1Vu8RJIiwvMO1/nyv/Ftg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745338999; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Z/q9P4yNkvEyR/a62wervKTvXtaUyeMzkuxzKhSQS9k=; 
	b=ltqV//qb+UXQpwgFXTF1LFiEUMT3alV9EDN/86ftR/tH8A32igQEghdZ5bpJbC1cbJpM34bcRilXix2Yw7K0bpXxgdzr+zXjC75DXCQBlfgtdk7egpCE7KQ3Mhglh6IyKUz/WxujrikUi+FB+uon+DGOmXthbix3kY8FUKITVtU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745338999;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Z/q9P4yNkvEyR/a62wervKTvXtaUyeMzkuxzKhSQS9k=;
	b=YcygCLAb5Zj9lEJaRc+SqZ0OMjomD8C5gD0HzUhxTaIY8tXoSnbU0BpmoQeBNfmn
	9VHQC/I2um7lSFm4Zywln0RzhVsDOyBv0thUc5mZP2aZ5iQIsoG4XNTnEb3PmjTaJsb
	o92xN8tRhd7XxbEvYcvbZtrXMsDl3ehMeotT5+9FpdsGTCU++KFkzCjT+QuyV5S5Dox
	+emc2Ed9JWEUJPVLjZuJhjQalo3Ga1ATqaN3fj3FapBvSwtxl5UHKw04T+CqEluo8lt
	WLe+02QuCHOhEqEi4P1yDofP2n8fsoOZt/WO3UH3D2dSyZWCREoRqJyi69WqvZawdO0
	6rfOYnCX5A==
Received: by mx.zohomail.com with SMTPS id 17453389979451012.0408814583301;
	Tue, 22 Apr 2025 09:23:17 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [RFC PATCH 2/3] pinctrl: starfive: jh7110: support forcing inputs to low/high
Date: Wed, 23 Apr 2025 00:22:49 +0800
Message-ID: <20250422162250.436169-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250422162250.436169-1-uwu@icenowy.me>
References: <20250422162250.436169-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_092325_017401_1F31FA22 
X-CRM114-Status: GOOD (  12.99  )
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

The internal input signals inside JH7110 SoC (output of the pin
controller) could be routed to fixed low/high level instead of external
GPIOs.

Support this feature in the pinctrl driver, which is quite useful for
some peripherals (e.g. USB) because of the low GPIO count of JH7110.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../starfive/pinctrl-starfive-jh7110.c        | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 1d0d6c224c104..5652f9bb658a2 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -837,6 +837,41 @@ static void jh7110_disable_clock(void *data)
 	clk_disable_unprepare(data);
 }
 
+static int jh7110_force_input_pins(struct jh7110_pinctrl *sfp,
+				   const char *property, u32 forced_input)
+{
+	int i, nforce;
+	int ret;
+	u32 pin, val;
+	unsigned int offset, shift;
+	struct device *dev = sfp->dev;
+	const struct jh7110_pinctrl_soc_info *info = sfp->info;
+
+	nforce = of_property_count_u32_elems(dev->of_node, property);
+
+	if (nforce > 0) {
+		for (i = 0; i < nforce; i++) {
+			ret = of_property_read_u32_index(dev->of_node, property,
+							 i, &pin);
+			if (ret)
+				return ret;
+
+			offset = 4 * (pin / 4);
+			shift  = 8 * (pin % 4);
+
+			val = readl_relaxed(sfp->base +
+					    info->gpi_reg_base + offset);
+			val &= info->gpi_mask << shift;
+			val |= (forced_input & info->gpi_mask) << shift;
+
+			writel_relaxed(val, sfp->base +
+					    info->gpi_reg_base + offset);
+		}
+	}
+
+	return 0;
+}
+
 int jh7110_pinctrl_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
@@ -964,6 +999,14 @@ int jh7110_pinctrl_probe(struct platform_device *pdev)
 
 	dev_info(dev, "StarFive GPIO chip registered %d GPIOs\n", sfp->gc.ngpio);
 
+	ret = jh7110_force_input_pins(sfp, "starfive,force-low-inputs", 0);
+	if (ret)
+		return ret;
+
+	ret = jh7110_force_input_pins(sfp, "starfive,force-high-inputs", 1);
+	if (ret)
+		return ret;
+
 	return pinctrl_enable(sfp->pctl);
 }
 EXPORT_SYMBOL_GPL(jh7110_pinctrl_probe);
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
