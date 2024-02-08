Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97BE8C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zUHVhkP/g4DPTiQRP6d8qdPVQhv009rICyWBsS1VdgI=; b=vPqWmUBFbvv5SM
	al8eNdFmRUA91twb7m62eOz1ADYkCuF1TKMFVBE6JMqVjUpToNbmOPeBdHi+c6oZGfFxUHk6BULFT
	CgeTJwWcOLWVSvFMy2E8/KBoikfBxIH1zy2rJ92ssX2Rijg7p01OS9PwBrBKfHkwrD1MkecjNH6ma
	fwltnJK0qCa3SuLD3XXAPLC4CwTLiLRNMm7P/KFkCBOS6aALbU321XIFKjJ6w1aeDHYTZx4ZvPZBQ
	o1USR2L4Ss44ECZx3xncEzGJVQof4Is4aNqszU4QOY+zcxG2IHow5xBN3FIiPBfE3lYn5peLLJKDP
	ZtmfUi8LlZTuKrhda+8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lL-0000000DlrQ-1qqT;
	Thu, 08 Feb 2024 12:44:19 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3l9-0000000DlbR-3yiG
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40fb3b5893eso14048795e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:44:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396243; x=1708001043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oM9XPRWyZyQTpDxwqoOKeZPHvqIal+M05hNhd5ZULcI=;
        b=RA+f+cX5KvTcJZERYUI9FWE/JB3qz8CL/Vl16E8NxnOAa00QP9ULnZ+jVelE88yQLt
         NpeWNxebXxS/sLhEL4nXu0poNdQhmJ8P1jFz0MkaDVPh+qhIJgywv3CLpnbjTU2TIwMo
         ytSByZE/pQjMrfrDH/M1haenN+0Orl4atrMrpj2te163hQ/DhTDTvwxia4g/wo0hjyfR
         d5Apej8o7dnZXoazTCmkAPq4bsJIJ6PWYSDXZkeshEtpzwkVFWIdvwPGAFHDug8kYyI/
         ijjigROTB3SwKBz65vGsF70UcmoB6Z2x+j3KFjdeSvahArbYX6/U1QrOz5mctGOg0kkM
         Sj0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396243; x=1708001043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oM9XPRWyZyQTpDxwqoOKeZPHvqIal+M05hNhd5ZULcI=;
        b=qOHNsFf89Q7CvMWoNeEHBt/K8iGYkuuykB+yPKoZtqMxsFoN+rZzBxkdT0ywsf5ywf
         DPeYsTtL+ylgN6beyJbWIzZZmuOBcJUnnlHJ/0ehAJs6mybsWdSdWiPRsTvLnZwdY9p5
         J4PXlKTBCHogQNibKrke5pzlQKhySdrtVTXZZNhc4jdHgBOLbKOgCiy5Rj+TxqtsvZrk
         0OhMkHFN9BvDEvmglQ5u7HirVB0M3nxoy8YrB0DGr3nN6MzurQbOYQpvSmxlqyVTjD27
         N9pm1hC6bftvqyWBD1MF/OW9NAchvmJHa0cCySqwQHSU6lEHelgWgDKuEkcWb97szwhy
         rrig==
X-Gm-Message-State: AOJu0YyEWmTtfOGpsO2ncxqrKN1Hlem2KYlqFgF+naZVcsdcDkwHplHJ
	Y38nQ4DLSSwe3Y+GpvxAt1eRcW5ilZq6oLDjky87MZmwD7xQMdvjdsdThNLqvxg=
X-Google-Smtp-Source: AGHT+IG6q4gcNCxRmIgk0F+dAl3ZK1W+ZIIklXV91EUjVHFUCxB9Yjn+gAO0u0URCHz1eIaiGbJpGg==
X-Received: by 2002:a05:600c:4c9a:b0:40f:de44:5164 with SMTP id g26-20020a05600c4c9a00b0040fde445164mr6664373wmp.17.1707396243513;
        Thu, 08 Feb 2024 04:44:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVEJWtOiAz9ykuqFwwxiz+go8BAqNKUg3++9Klovreyfajle+cQd76Qys5aUi/DKiFBZSpGFpdBkG3GqXpx5pYDW6ArnMr6o7FnO3bC/qwBd3T9rbxFnEDB5d4C9gGQ7Tp2heQXgostbRuWS3xWyiJSF2EYSizkPqp353/6ADLThdX60eRDJ3WS0l4tXyHPeciCGVNwwP847FqjLQDCeh0zQIb1c70ahRqDuV1LLaB7eFHNhqrwNMtuVhCIq4Mz3IKK8LRlZw7E5IMnHupvf1TYKTqPNNtPVzrZCqVKXzuBn9cImYNOqG56lszGRRMWBt4hupTIsxPlux2GEec8DpeFgDhG63Bk3vZ9bOG7S1xux2tfJihirISSOG5E81MisjvcTZ3N88wDm0ktNvHN1fDMwRdd0qR4G+zbC6oEtXLRUAcI8PVEjHXuqQpgyMqMYxp6zZ0vpJPP78mjdJqPVhCwOStAIqpqkrlrKFXtPWlRKt7NliSml0BH1sI+7nv1l0hSGDqHwKfz2kReEJFWQv59eKSaSY96K0AszHpLsihOa7csjlsfQTIi5m7KdLZTVV8=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:03 -0800 (PST)
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
Subject: [PATCH 09/17] clk: renesas: r9a07g044: Add initial support for power domains
Date: Thu,  8 Feb 2024 14:42:52 +0200
Message-Id: <20240208124300.2740313-10-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044408_285258_0CBFF001 
X-CRM114-Status: GOOD (  10.56  )
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

Instantiate always-on power domain for R9A07G044 SoC. At the moment, all
the IPs are part of this domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g044-cpg.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g044-cpg.c b/drivers/clk/renesas/r9a07g044-cpg.c
index 1047278c9079..3755e506fc65 100644
--- a/drivers/clk/renesas/r9a07g044-cpg.c
+++ b/drivers/clk/renesas/r9a07g044-cpg.c
@@ -443,6 +443,11 @@ static const unsigned int r9a07g044_no_pm_mod_clks[] = {
 	MOD_CLK_BASE + R9A07G044_CRU_VCLK,
 };
 
+static const struct rzg2l_cpg_pm_domain_init_data r9a07g044_pm_domains[] = {
+	DEF_PD("always-on",	R9A07G044_PD_ALWAYS_ON, 0, 0,
+				RZG2L_PD_F_PARENT | RZG2L_PD_F_ALWAYS_ON),
+};
+
 #ifdef CONFIG_CLK_R9A07G044
 const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	/* Core Clocks */
@@ -468,6 +473,10 @@ const struct rzg2l_cpg_info r9a07g044_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G044_TSU_PRESETN + 1, /* Last reset ID + 1 */
 
+	/* PM domains */
+	.pm_domains = r9a07g044_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a07g044_pm_domains),
+
 	.has_clk_mon_regs = true,
 };
 #endif
@@ -497,6 +506,10 @@ const struct rzg2l_cpg_info r9a07g054_cpg_info = {
 	.resets = r9a07g044_resets,
 	.num_resets = R9A07G054_STPAI_ARESETN + 1, /* Last reset ID + 1 */
 
+	/* PM domains */
+	.pm_domains = r9a07g044_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a07g044_pm_domains),
+
 	.has_clk_mon_regs = true,
 };
 #endif
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
