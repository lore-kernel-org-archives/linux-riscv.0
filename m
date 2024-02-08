Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747BEC48260
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oVYgbw1/uvu/YRvKiZMo/LgvOBW44MB+m2swCdMxf8w=; b=fIobtTGRBKQvVJ
	uK4eXD0AaeXJhgmdd9Tou/f+q982kXmsjZ7281AN2rtm2KOMu44VQqQ1zQMEYnl2IvIEJ2kiG8ArR
	prRDZ3vPesVFH1UpkmzxH3Tfy58/H7DANXFHU6v1h9XB5KosLaFEzMhDhYDM7sGXORxIwnzvpcUsc
	6ANa/OuX7sGRUBqPyIo/XhDILsUBIr+45Q1V8QQNm/bGh8zpU3ofpEpz7o/F3aGzHldUYTA4CpZGn
	Mc9fgXmWL8GyI3+VCgGyJC8xsnwDC7ca/FdoR8rohF4NLiQecp65PyAovsXJV7wjFLfe49STKH9JK
	/I6nDwdYNGZXDdpORERg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3l8-0000000Dle6-3iNB;
	Thu, 08 Feb 2024 12:44:06 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3l4-0000000DlZE-1qSI
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:04 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-41001c6e19aso5064815e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396241; x=1708001041; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Nv9Z6nQcLOaMLoKcRVuDq7kdqWUsIytFPDBtdXgyc1s=;
        b=PpzIUGZ/S7U/oucoKHwuSxUkRoox1lSzU59OX7O7z0Z/yauauX2NiqE6hCgxcW7EBW
         wEQVMhqrNFaWI0+yPaIjxJUVPCDvZAd2VGPDgehNNPXJhlSrLnzzhEot96j90GDu5cwF
         7ogjAXfi9cSOD616EC9FDTFWbGV9r8L6uNvUWZ+Z615GJTQkjxPFlXhq3xJZLCGj/GYP
         nicLOWBjo1lYRD2FGTBfsQqKkBZ8OWM4Gq8jWp5MMJjzAujbVwdSF0XFdpgp39k6Wk9C
         hZszWC5KVB/O4jHEmVC3qEwkh6C4cX81JljEJWscXMHeCc8b3nJm5p0pEpbWH4jqp5T9
         FJrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396241; x=1708001041;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Nv9Z6nQcLOaMLoKcRVuDq7kdqWUsIytFPDBtdXgyc1s=;
        b=RL0K1ub8HSetSItuSrGVaLorHtcunc+b1Eck4XGU16nHLS8IRsZF5x8VErBk61uhq1
         d0JfXYZOuRIo5PmK/GD3s7Ylh/uPReGc2GBNvc/CI+AjmNfWuAuA8+mUatBZXdLHRWXg
         gIbX663L5gSVU4wVBQAxgzWzBWRRyUT58kn/pXIitOk2OWK/82WpuBla6XzD0Roh9mPW
         1S+bTjsmC1ukGPQz0zrcTp16NNqsePJjFqEsNQ0RG4C73+vosM/hHnd2ud5GDzw+Hibe
         YCiCMrnshCdzIHk4uADhiTFzr0l581HPzumZSWXDwAZxWksRH+AGFXIgUKVIyRjaJdoz
         YGVg==
X-Gm-Message-State: AOJu0Yx8PBPWNKE5Jql/bngsEuzW329Yj0EjcOKKg3IoLWdxXRHeoJoC
	oSragvr4im0boEgPI5rH8mzXvNmQzwnUuKjoG+6IXcIzglYExlJXqfnhtCBdX+4=
X-Google-Smtp-Source: AGHT+IGPf+tOjZxKr12KJ5O/kHqF0Pw/lgg3MGFgbg4N1gp8MsFkI8SOVl/Z6PrM4cqJntkkJTHPFA==
X-Received: by 2002:a05:600c:310f:b0:410:250b:23e9 with SMTP id g15-20020a05600c310f00b00410250b23e9mr2015911wmo.10.1707396241228;
        Thu, 08 Feb 2024 04:44:01 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2QgNkbPk5Pfnbvt3t9K4nhWX52PbIVQJ7YusgWGo/a3ebnA0tziphGQNx9jHLoW6hMMVCUT1/QEdegQQvR4Q7z1ZaVBDXEkm1Uk5zOoKaGbMlIHEyxA2ZCxPHtc98YFTSCUCo3WjYn41bDdzxnW72rZvkI5odMdlQdi+TwnGF8q7UZv1A3BucB2TiBsVYNHmDtbSe41Brz5dY66mFfGd1/AVCCtDBZAnrC+4XVMeDol6twNJ/AoIgx6OLJfw49yX82n5UbYorlkml0XJ9S+UadQXdILF83WibuRK2Krx3C8rJFXW+XBgpvf421nMy9LJTo7sUnX8/jnfLtkqgJzdnQ04bwvsBa4o38SgC9n2qZXrN1ZcYixYj7DekGjPuJ+5HZ7DnucGay0G2KjZs/GpojdJfT6gJhk7tlasGy6tnZ5kW7sxGsjwLfajgeHvqrX3XcVeMbnsWgzogBSjl4Pl/+ffp+H6HbmoVBVGsEJlemE0W0XJdEYj84DYlo82ErVnmgzQU5gbGiSzbXRcfMxc4fo9bulECVaiKwJZeSO+cQKEo0NR/vMUwcFq76KiTtpo=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.43.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:00 -0800 (PST)
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
Subject: [PATCH 08/17] clk: renesas: r9a07g043: Add initial support for power domains
Date: Thu,  8 Feb 2024 14:42:51 +0200
Message-Id: <20240208124300.2740313-9-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044402_609814_D0A1465C 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

Instantiate always-on power domain for R9A07G043 SoC. At the moment, all
the IPs are part of this domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a07g043-cpg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r9a07g043-cpg.c b/drivers/clk/renesas/r9a07g043-cpg.c
index acfb06cad441..3a7fddd1fa61 100644
--- a/drivers/clk/renesas/r9a07g043-cpg.c
+++ b/drivers/clk/renesas/r9a07g043-cpg.c
@@ -358,6 +358,11 @@ static const unsigned int r9a07g043_no_pm_mod_clks[] = {
 };
 #endif
 
+static const struct rzg2l_cpg_pm_domain_init_data r9a07g043_pm_domains[] = {
+	DEF_PD("always-on",	R9A07G043_PD_ALWAYS_ON, 0, 0,
+				RZG2L_PD_F_PARENT | RZG2L_PD_F_ALWAYS_ON),
+};
+
 const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a07g043_core_clks,
@@ -392,5 +397,9 @@ const struct rzg2l_cpg_info r9a07g043_cpg_info = {
 	.num_resets = R9A07G043_IAX45_RESETN + 1, /* Last reset ID + 1 */
 #endif
 
+	/* Power domains. */
+	.pm_domains = r9a07g043_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a07g043_pm_domains),
+
 	.has_clk_mon_regs = true,
 };
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
