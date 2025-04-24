Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16022C369AB
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 06:20:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+mZ3wNsSLEIXxAOHhwgoIYQs/OxvqJhsrGthCuIg6rQ=; b=Gv1UsGpnLer6PC
	1V4F2xhChAZDOZxPGEf+ARpQIgt/lbkCqGDWg8OnxnAvkaXZD9ysDCIFMXHGERlIvCBgndtAEBqMT
	dzU45hLkRzlvCSRbJ2Ym0jY5axphc+cf/fx0RcmCk06LxcIkTOLpqEtHLHbKcOSLjqL/Ye3CLRoxp
	agDilVsM2uLn4bizafo5lqvz+5rPp2XSgaHaQJkhEhJJXLyy0g0o/XKg6xcalMPeWLrX0Ps6hCfVS
	/G6LcN/EkFDxN4khcK9xGBLmECsB9TcxLNKr88xBnZaA64CQq2nlBxRH9Bjj+OFB4UhK1zUH1RK1K
	UDQ891Oy2DfhjdpVC3kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7px6-0000000Cy4Z-41Oz;
	Thu, 24 Apr 2025 06:20:52 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7px4-0000000Cy2s-0ajj
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 06:20:51 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745475644; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=oGwvTcG9MIW+fBY4Cgq7o37G3QIjlBY+wGR7kJDQftPVNQcdg2P23TeQq4my8AwwD7Pp+6IUvyFlsGZ9pZndu8XUMngi/9Cyvo7x1SfKLrHRAAqroZSDyzKmf1VmpYEye0JUZjxtfgqGyEYV6UPOjlnHLi7+uep3QwmXuFz94g4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745475644; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4b8Iw4s/SYPaEv7/xDENn5gEin7xJfAzu3E1qui9INM=; 
	b=F2rI7QNb7MtuLGaWXErPv6Z5Pp1bRF0J6NavZcagjKlEY821XfpSUW5jxRFuDDlZkrF04OcetpccVuUpgOgsJCEmFwj903eKya3UuS4At9JtyL21bUduc2weFwWq+GZDWQHtipy6JKw+8UZ7ZrJD/7LZ+utE5UZDwxm0bBPbPU0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745475644;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=4b8Iw4s/SYPaEv7/xDENn5gEin7xJfAzu3E1qui9INM=;
	b=QXmvSEi3S9d3purgYeNXHYF1ciARDcIhdB6aBBukpYQBzeWNeSoFMy99Sv7vB8di
	0JsIunfO7rTQ3LIMZK+BOKqIImPMSsJl8Beud/8J9rtrn2MDQl9pUiTIKdj0na+Wg/P
	IsPcbOsZo6sJm1Gn3JjKdlmdLDJ/7dSUcTV0+WzQ1wVH5TKsgcVXBs7yzkusUXECCKs
	uuZLvoysybsB0exVCpdcgZJB2MD1dgaNPnEmQkbjkli3VDtLllRtd7DW3+dvT6TGAoR
	x2Xztbl+IFhY3kZYpPWCGIM0TSI82f/u099p45nKsTUg8Ez6jgGUjmo8BLbNXSQFfgq
	d+MWSiqDXQ==
Received: by mx.zohomail.com with SMTPS id 1745475641388238.64234871132396;
	Wed, 23 Apr 2025 23:20:41 -0700 (PDT)
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
Subject: [PATCH v2 2/3] pinctrl: starfive: jh7110: add support for PAD_INTERNAL_* for GPI
Date: Thu, 24 Apr 2025 14:20:16 +0800
Message-ID: <20250424062017.652969-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250424062017.652969-1-uwu@icenowy.me>
References: <20250424062017.652969-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_232050_236172_832A0BB9 
X-CRM114-Status: GOOD (  11.56  )
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

The JH7110 SoC's both pin controller support routing GPI signals to
internal fixed low/high level.

As we allocated two special "pin" numbers for these situations
(PAD_INTERNAL_{LOW,HIGH}), add special handling code for these "pins".
The DOEn/DOUT/FUNCTION fields are ignored and the internal input signal
specified by the DIN field is routed to fixed low/high level.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 .../starfive/pinctrl-starfive-jh7110.c        | 41 +++++++++++++++----
 1 file changed, 34 insertions(+), 7 deletions(-)

diff --git a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
index 1d0d6c224c104..fb18c7974ec86 100644
--- a/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
+++ b/drivers/pinctrl/starfive/pinctrl-starfive-jh7110.c
@@ -291,6 +291,24 @@ void jh7110_set_gpiomux(struct jh7110_pinctrl *sfp, unsigned int pin,
 }
 EXPORT_SYMBOL_GPL(jh7110_set_gpiomux);
 
+static void jh7110_set_gpi(struct jh7110_pinctrl *sfp, u32 gpi, u32 val)
+{
+	u32 offset, shift;
+	u32 reg_val;
+	const struct jh7110_pinctrl_soc_info *info = sfp->info;
+
+	offset = 4 * (gpi / 4);
+	shift  = 8 * (gpi % 4);
+
+	reg_val = readl_relaxed(sfp->base +
+				info->gpi_reg_base + offset);
+	reg_val &= info->gpi_mask << shift;
+	reg_val |= (val & info->gpi_mask) << shift;
+
+	writel_relaxed(reg_val, sfp->base +
+				info->gpi_reg_base + offset);
+}
+
 static int jh7110_set_mux(struct pinctrl_dev *pctldev,
 			  unsigned int fsel, unsigned int gsel)
 {
@@ -307,14 +325,23 @@ static int jh7110_set_mux(struct pinctrl_dev *pctldev,
 	pinmux = group->data;
 	for (i = 0; i < group->grp.npins; i++) {
 		u32 v = pinmux[i];
+		u32 pin = jh7110_pinmux_pin(v);
 
-		if (info->jh7110_set_one_pin_mux)
-			info->jh7110_set_one_pin_mux(sfp,
-					jh7110_pinmux_pin(v),
-					jh7110_pinmux_din(v),
-					jh7110_pinmux_dout(v),
-					jh7110_pinmux_doen(v),
-					jh7110_pinmux_function(v));
+		switch (pin) {
+		case PAD_INTERNAL_LOW:
+		case PAD_INTERNAL_HIGH:
+			jh7110_set_gpi(sfp, jh7110_pinmux_din(v),
+				       pin == PAD_INTERNAL_HIGH);
+			break;
+		default:
+			if (info->jh7110_set_one_pin_mux)
+				info->jh7110_set_one_pin_mux(sfp,
+						jh7110_pinmux_pin(v),
+						jh7110_pinmux_din(v),
+						jh7110_pinmux_dout(v),
+						jh7110_pinmux_doen(v),
+						jh7110_pinmux_function(v));
+		}
 	}
 
 	return 0;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
