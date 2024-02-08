Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FD7C4828F
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Feb 2024 12:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xR5Q9ZoYrDV5aLN4Cmr1Ns/sUbb1mGDzgyHBvr4sT38=; b=CxKKyRMk9S75wL
	ADsZOC9TGvEozXlLj+hHde1h6IKvaLXAmSqHDYUcBeNDFolSC6WsttqXdeu8gHSp09a3RjoJTTc/o
	CmLM63tNPDpyHlOo+/Mr+NgTS80zzGsEjscqSesBRG+9TAcB+rJYJ7g8A9rc5F2kd/a8z4fnaU8Kg
	d60v0DZCnv2ECznM0z81J9QXFPICij5wjnu4VcHyvQOKhHoeSqlDB8SWT5zvf67FFG2X1kpSCILxV
	92UZOVhFURsHyh5zZsCZMpNPBki49eNtE3CqwMtfzu4MgMmIJ/S1OQAc/qGOIXD1Dmz/64gjQb1Zs
	kRk9N1REjBHVSQs/etcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lP-0000000Dluu-1L58;
	Thu, 08 Feb 2024 12:44:23 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rY3lC-0000000Dlg1-2pcL
	for linux-riscv@lists.infradead.org;
	Thu, 08 Feb 2024 12:44:15 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-51147d0abd1so2096434e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Feb 2024 04:44:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1707396247; x=1708001047; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J9rrULVdpnnvZm24Vgw0eJNuzWphx5IveQzgYYWNlYM=;
        b=QPpyOr6a7g3+4LL0tLjF2Xe05y50BFWBSCuIvxryuaEIuwfngcX1MCvXxY9l7HG8b7
         hkRUOS0hPtG70URk0ybMAuzd3H6nHgvcR61/CbdwbbHAIKJY4O5YwfcTxMdkx9QXvIC9
         h+ulVa3lziDZDLUOm73rJPvC8TFPBjooiJ/QOONRQvAhdz+1zxv64LJWxO0qb1PMacGj
         1aHqvqqNCQo/4WexMheXNcd4yvHVMtFlNeG6Ab6sXrQQszDUzINnfpG0V8Cg18Fc9c24
         zE6HUe4nrleWTMts0rOhX9SqZ6oEwnzkLKakSt8jkAe/NlxzDkWPulvpvzA0VP9hbCXJ
         8cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707396247; x=1708001047;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J9rrULVdpnnvZm24Vgw0eJNuzWphx5IveQzgYYWNlYM=;
        b=DDD2Uyk9e/EYpNGSJMr+xEv5sJHDG4q/Hcz/6JEeclUwxPkII2AWAgJv2zhJykYoX7
         EH8DTiuLPNyCEJQS3iyNr24dGihEh+Ku4RLabJsWNQTLSVnYZFVoxfHdURE3uxcxO8L9
         +O6a7GtNx36It049NmWTNqsFCjFWJtFTkacP1/c1D9FOAeszdjCxqKYVLjU8wiQNxqz+
         ms65/LysgKmtm0XCNu+1mi4tNw7Z3ko1pS4XHBHeG+nMKLReQDeWE8fS7TVUr/Jjsh+9
         XDq6AYftU5yq+CtcmaP6ju7CwOwB5+JchUSoqwuPcJ7LMeTDQ9NS4XNaZU4iHJPTn+zj
         o3ig==
X-Forwarded-Encrypted: i=1; AJvYcCXcAuz9eC83h3Vrnypx7V8wggbZuLPN9Z8NaVAhrfWd70aO1BGOE4/fHS7zV2z6lRg6bdrOVbqm+Q5ClPrXwn7qS8o2PqL7+/0Xa+ZYUR5W
X-Gm-Message-State: AOJu0Yx1nBy9Gr51LksfG6AbYO2VNXo8RkZvL0M1ZlCjoeMTW5dWnlNj
	F/mD6iiuFw7bZbuHKMoeCQmWCWjSD4tcIIM42Zjdy903YcOyUi6+w9q3/U2BvTk=
X-Google-Smtp-Source: AGHT+IHTP0EqaKFSdMcyQ2EEn71mY7/GpsEAnwqguVr68auY9buQDr4K1fr0kpgbPg1hLGzSvwScYQ==
X-Received: by 2002:a05:6512:49d:b0:511:5411:1144 with SMTP id v29-20020a056512049d00b0051154111144mr5793843lfq.14.1707396247452;
        Thu, 08 Feb 2024 04:44:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVfsZjnA6YcSltAzZd86m1FK2DKEZr1LDoGM47sY1eiF9wuubUKEdk+1eFzNL/2HHTcTe3JXKdmAHK/3JE34NuRVc6KCS5H/vcbodd6GhVQh1YPONvox85rjqMr4XlpfK7AT9Wfhvid+wdklFjPxlAR2wimD1qM5SBQClv2HFFb/oCwLKxYWivsgfwZ1ixTnw/VaXgiEStvHIW6TqvMoRV3HA1VrcOazXzb/E8sStsDeTP8fSwGCjNK27E4pFqO22mYiQhXb7jt6AsvT727A+t5eXNdSIyH8E2zSjNBWxCpXcM/KZDWqS4rLVirqNO9e1LuwUDqexmbthq6PsRaR8MhZVCYTQS9BPSs3Am7uO/jNL3Ke9U4OlterQU33aW8HWqdKbB9NU+kPjY4khDSJ0hS3noE44+jnza98r+N/WKyQgvSTlZ+zuIjvhujxOspKCzrrYbAhCGO3JlhSESVtN9e+SvzJJ0JTJsMe6r2m8O4LeAo3AoLOAGeh9F9JVnEX69p1NZtB6bbL7qjgAZviOkTvKTVHQL4tac5CuAqyeB83pkxnlS8unT6T48Nf/O05Ec=
Received: from claudiu-X670E-Pro-RS.. ([82.78.167.45])
        by smtp.gmail.com with ESMTPSA id o13-20020a05600c4fcd00b0041047382b76sm790244wmq.37.2024.02.08.04.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Feb 2024 04:44:06 -0800 (PST)
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
Subject: [PATCH 11/17] clk: renesas: r9a09g011: Add initial support for power domains
Date: Thu,  8 Feb 2024 14:42:54 +0200
Message-Id: <20240208124300.2740313-12-claudiu.beznea.uj@bp.renesas.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240208_044411_187296_1885D629 
X-CRM114-Status: UNSURE (   9.82  )
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

Instantiate always-on power domain for R9A09G011 SoC. At the moment, all
the IPs are part of this domain.

Signed-off-by: Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
---
 drivers/clk/renesas/r9a09g011-cpg.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clk/renesas/r9a09g011-cpg.c b/drivers/clk/renesas/r9a09g011-cpg.c
index dda9f29dff33..9d090075f3be 100644
--- a/drivers/clk/renesas/r9a09g011-cpg.c
+++ b/drivers/clk/renesas/r9a09g011-cpg.c
@@ -245,6 +245,11 @@ static const unsigned int r9a09g011_crit_mod_clks[] __initconst = {
 	MOD_CLK_BASE + R9A09G011_URT_PCLK,
 };
 
+static const struct rzg2l_cpg_pm_domain_init_data r9a09g011_pm_domains[] = {
+	DEF_PD("always-on",	R9A09G011_PD_ALWAYS_ON, 0, 0,
+				RZG2L_PD_F_PARENT | RZG2L_PD_F_ALWAYS_ON),
+};
+
 const struct rzg2l_cpg_info r9a09g011_cpg_info = {
 	/* Core Clocks */
 	.core_clks = r9a09g011_core_clks,
@@ -265,5 +270,9 @@ const struct rzg2l_cpg_info r9a09g011_cpg_info = {
 	.resets = r9a09g011_resets,
 	.num_resets = ARRAY_SIZE(r9a09g011_resets),
 
+	/* PM domains */
+	.pm_domains = r9a09g011_pm_domains,
+	.num_pm_domains = ARRAY_SIZE(r9a09g011_pm_domains),
+
 	.has_clk_mon_regs = false,
 };
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
