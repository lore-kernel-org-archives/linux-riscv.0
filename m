Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22738C48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 13:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zearGacj6M0iquT9Opfj+1Zq3rQBfkh29qdAHGyneb0=; b=rrIpKf+1AvBttt
	C7CNRHG0g3STvoZ/dU4ZgQ2K0qqgrFdyPPHwojruahA3b7OHCfQRZO5nvU57VJp92yh8rVw3+Z6Y8
	QdUNNPlR1nZCZpj2ZM/r8LOlMik8YZ3+jhL7vnaCHROU/O6fqTGBvBJ231rCR0th0eWAIAozEKhkE
	3Hj3KTh8xI1STFHJCaQAvLLmCf5AsKFjX73nI2xpWnRVVI4RbzuhyzpsgJz+7RL1EJJ05AaWWGPuI
	lANsxskd8LuATPhocxWYIDhi7eApVsBk8IU8xEI4rAXjXxw1xzQlTpxv7DzX0DIuTDRaBRy045P1d
	Vv8XKVlE1ZlpzUO6Voiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY4jg-0000000Dw25-1Ugw;
	Thu, 08 Feb 2024 13:46:40 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3l8-0000000DldV-4Ady
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4104dee26bfso902665e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396245; x=1708001045; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9rO5WdjuJmB2S7TQJ0EBDmOconefLyJTkDblhQ1H3b4=;
        b=Ir32K8JV5l2/nlylbf37o7uUghFk+zmWMfmsUgf6NmVM2IXSVCvF4lct7z2+A1Nh9w
         qzqv/KW3ysl3g/M8DBFYE+djstrd7VcLAG6GpC3qPZga42fPP+gul1RslcHY3GrYNuiO
         3lHkojqiN7zCQSDQfcZ3U09BVHT1suQBxLZ0XM4Q2lIKwuvzpONGkzZ8YhjAlocRmCw7
         U1H0o57Z66VeeBIhbIXqG0zgBwlftShe7V18hbFu361y8kbHC64Rrwfj3hVFLNBlZTcd
         ngzG0kPX1djueSL76LhMJJFZMySGxkYXEwSS+al92eGP4jgS7rxkA1ShumpI01u4rYBO
         W7Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396245; x=1708001045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9rO5WdjuJmB2S7TQJ0EBDmOconefLyJTkDblhQ1H3b4=;
        b=VNCZRHCFr8F+YOpg2CVRZsJEpt1qUDPnj9PlFCBdP7Yu+JaeaW9MZ20muJ9slvawIh
         oYmlcH8gqjhJ8HdOJ3pad7mc4h3JvnucViShMauE4sA3AEI0Wn9sMIHbu0YTc5xU4vFF
         1OjMI7tDZptDx6satTu0hUshZAQdJyy5dutSalE0XP57i+/+HTx37K+OekLj/y72CMmv
         Az6mXBQMEhbP3GlDMK1YgaqtyJ3kpDUOGH7Bpn0XuHqHhWLI1m3qwqNMLKV3N2sUiw3R
         cxcUi8DGwLr8MRVSUW4S3v1ugjZtEPC10VHUUfG2NyxoYuZT5BLYXhu/EI0zTUSw5DDR
         g6jQ==
X-Forwarded-Encrypted: i=1; AJvYcCWNNi7S8pZrWkgmTztRVd4seQ4bO8xVhQg94U7JCvNHZPVV9uh3H0NEszNBMkc144qqmvti6Oztl3KoI2KsHmQmn8WoFHIuBFdt0T8gx3AS
X-Gm-Message-State: AOJu0Yws/A6xQACjaz3l4a7Fkl+zhF+6+0FD7qE2O6nqRkMFxY8mQZW3
	nyXE1FVnQMqxQxJJ7ur224M82CSYW5Wd+sB3RcSV3aqqj+ZWF9LMhQbvEigqAQE=
X-Google-Smtp-Source: AGHT+IFWxOpl/SqNYQlDYaLcZyrs8SdhVxj6hJPcKfMPJshM2YPyvVvrOfoZMJpkZrDIKi+G2DyX+g==
X-Received: by 2002:a05:600c:3b97:b0:410:8f2:262a with SMTP id n23-20020a05600c3b9700b0041008f2262amr4272603wms.13.1707396245502;
        Thu, 08 Feb 2024 04:44:05 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW7Lpay7FODh9fbZn3a01H8ZvmM2SiauhTcEP7H2iU5vuup9mMYT1+LGEIv3Cp9BD81U4vXRMCr/EOF9yA8rP3x2Y+AnhZaeVGXDbeReb1bgkWyFi1iPHI2XqMtH/j6BX470KlFbzpptyr3mTCkzGvtSvwH8+QdsLJgjGCLlm6VrR0hYSmhfQY0JfAdLkasF4N3lkfYv1ahZc8EAhd67oPU+eAVjbZxl+OAiGnfWtG1FjqbVRWrxRcQ33tu+sYQW9cK/tDYRgUAbGQvKckrJaz+domK+n/SGhw4+6nW/11h+pjlI3mUTt+lI87Qn//RPdf6BSsiN/p1KwI5TgwTZDDFuzqNAIueiRvSvzmxd3cOFMABK5GpDvMkVwfKJ3+fyrmjWz7UvH7RnRlldNB1GWdX3T7fL1I2vA5UXrLwVlbyso7UbjQ9ixUccrbcg1ZSCleoNZuImVzeDLgDRVua1i8sNgCYv4enjHmFQ6y0eEZS8I6QkNo3sEJQ9aMagG4wA8im8ZWKwW/TX5EyWjQ9i4eKp+0hvywPPy25Iw1SMamq9cM0A0Uh4xFkd4qpCfmDj8o=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:05 -0800 (PST)
From: Claudiu <claudiu.beznea@tuxon.dev>
X-Google-Original-From: Claudiu <claudiu.beznea.uj@bp.renesas.com>
To: geert+renesas@glider.be,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	magnus.damm@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-renesas-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	claudiu.beznea@tuxon.dev,
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
Subject: [PATCH 10/17] clk: renesas: r9a08g045: Add support for power domains
Date: Thu,  8 Feb 2024 14:42:53 +0200
Message-Id: <20240208124300.2740313-11-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044407_572826_7BCAE53D 
X-CRM114-Status: GOOD (  10.32  )
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

From: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>

Instantiate power domains for the currently enabled IPs of R9A08G045 SoC.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a08g045-cpg.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/clk/renesas/r9a08g045-cpg.c b/drivers/clk/renesas/r9a08g045-cpg.c
index c3e6da2de197..b06d8e93707f 100644
--- a/drivers/clk/renesas/r9a08g045-cpg.c
+++ b/drivers/clk/renesas/r9a08g045-cpg.c
@@ -240,6 +240,28 @@ static const unsigned int r9a08g045_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A08G045_DMAC_ACLK,
 };
 
+static const struct rzg2l_cpg_pm_domain_init_data r9a08g045_pm_domains[] = {
+	DEF_PD("always-on",	R9A08G045_PD_ALWAYS_ON, 0, 0,
+				RZG2L_PD_F_PARENT | RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("gic",		R9A08G045_PD_GIC, MSTOP(ACPU, BIT(3)), PWRDN(IP1, 2),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("ia55",		R9A08G045_PD_IA55, MSTOP(PERI_CPU, BIT(13)), PWRDN(IP1, 3),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("dmac",		R9A08G045_PD_DMAC, MSTOP(REG1, GENMASK(3, 0)), 0,
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("ddr",		R9A08G045_PD_DDR, MSTOP(PERI_DDR, BIT(1)), PWRDN(IP2, 0),
+				RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("tzcddr",	R9A08G045_PD_TZCDDR, MSTOP(TZCDDR, GENMASK(2, 0)),
+				PWRDN(IP2, 1), RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("otfde_ddr",	R9A08G045_PD_OTFDE_DDR, 0, PWRDN(IP2, 2), RZG2L_PD_F_ALWAYS_ON),
+	DEF_PD("sdhi0",		R9A08G045_PD_SDHI0, MSTOP(PERI_COM, BIT(0)), PWRDN(IP1, 13), 0),
+	DEF_PD("sdhi1",		R9A08G045_PD_SDHI1, MSTOP(PERI_COM, BIT(1)), PWRDN(IP1, 14), 0),
+	DEF_PD("sdhi2",		R9A08G045_PD_SDHI2, MSTOP(PERI_COM, BIT(11)), PWRDN(IP1, 15), 0),
+	DEF_PD("eth0",		R9A08G045_PD_ETHER0, MSTOP(PERI_COM, BIT(2)), PWRDN(IP1, 11), 0),
+	DEF_PD("eth1",		R9A08G045_PD_ETHER1, MSTOP(PERI_COM, BIT(3)), PWRDN(IP1, 12), 0),
+	DEF_PD("scif0",		R9A08G045_PD_SCIF0, MSTOP(MCPU2, BIT(1)), 0, 0),
+};
+
 const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a08g045_core_clks,
@@ -260,5 +282,10 @@ const struct rzg2l_cpg_info r9a08g045_cpg_info = {
 	.resets = r9a08g045_resets,
 	.num_resets = R9A08G045_VBAT_BRESETN + 1, /* Last reset ID + 1 */
 
+	/* Power domains */
+	.pm_domains = r9a08g045_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a08g045_pm_domains),
+	.pm_domain_pwrdn_mstop = true,
+
 	.has_clk_mon_regs = true,
 };
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
