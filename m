Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49235CD5BB1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 May 2026 13:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kSixO6YWw+vQYMsYRRZSKZTGiUwlDxDkA0TL7GyKz0s=; b=ciLuzd7uk1Q5Cj
	HELgUPeECIAbZrfp+6I4sk2hYv0hNFIUjsdtEtf8LHyW7SEw3GDVoFWM/JA3tje0Zg+rQSJ2P9Ghu
	5tdSS4b1f2SiAbM7BmMwm30vrDgymlMRa+gfvzLiJ/lcaH0BqvYHluwbTfP4t0sC+1LXDQLuZaUeJ
	ansQDplo+QokIRz0Z7fakWos7H1rH8eYj4+d4VPpzHPFWggHoM669A4jSC68KhUOszFTZs1PyRPUk
	R1uNpp5lbhEN+wjLMG+SmIgOMPDNOMLfuvnYY3B1JMmsXhIfwRwUHI7B7JP9qus7H5+UYb62/dHu+
	IKdtPrH0f7Edm5NEQCzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPUh-0000000AtTU-1Q73;
	Fri, 22 May 2026 13:00:51 +0000
Received: from sender4-pp-o92.zoho.com ([136.143.188.92])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQPUd-0000000AtSh-3LIa
	for linux-riscv@lists.infradead.org;
	Fri, 22 May 2026 13:00:49 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1779454836; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=mXHalvZ2De87nqdd+Qu9KejK7X7MjBsUkinnEita0NpFch6ur7DdcDRoqF5KC5Fj2Omk3eO8X5XSy6IlZ6FHTc1qMRoWoKvCSOM2xNmqSoXRG9Z151NwXa/ZrEkNpJxzXONpLjgP5qtYE5n+/WFiun4t0GzFG9TtpQus8BHteIM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779454836; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JX4/HzHgr9Ln2K8EGkhp70E2oDhc6Dp0qS3CpdjxcfQ=; 
	b=JEB+Q9kwAq8S+OunkVsGFsekfZ9tc+ZY9ZUMJmV+1qFYAqVV40vfTA/POq7At6oj0T26IfumIjLbAg5GyJtMeJbZPE+BTP4wW/psuUaiygKGa+C7vmIA7SbuyIZqA2UqH+8eKTWPuAyyt8LElyvywS9ai0Em995/TpUUQI5qzu4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779454836;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Feedback-ID:Reply-To;
	bh=JX4/HzHgr9Ln2K8EGkhp70E2oDhc6Dp0qS3CpdjxcfQ=;
	b=LZNgU1UwZJKElt8ZqwmVKwQcyAxKscQZEb7E8wVgPi/WkeBfHNVYQnTs6MOWtlOc
	BAI7vOXBBOJLSH2zzdyPXRvm8cGL1feHbggGYDzMDI4ECTwwOOE9R1hw18GPbhSWHrc
	UKP6Xgu8diFjXdUgXtSu5j6JyS9wyLvvbZsq5C2Y=
Received: by mx.zohomail.com with SMTPS id 1779454831935958.224223537089;
	Fri, 22 May 2026 06:00:31 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
To: Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	Xukai Wang <kingxukai@zohomail.com>
Cc: linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Troy Mitchell <TroyMitchell988@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] clk: canaan: k230: Fix sparse warnings reported by LKP
Date: Fri, 22 May 2026 20:59:12 +0800
Message-Id: <dee4605ca30f9bbd55ccb4fcce9590ceee1fa10b.1779453284.git.kingxukai@zohomail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
References: <20260522-eligible-vivacious-3ce9bc30dd53@wendy>
MIME-Version: 1.0
Feedback-ID: zu08011227c6335346a63148b9f6cec2f70000b3c03c513edafb3405058bc9ea8ac70ec1c949f9169db7a4fa:ZohoMail
X-Zoho-CM-AccountID: 2ee5dd3c83366259b2ba1e9826250ffebed1ef2dd213857d649ad25aba73b429
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_060047_893680_3908CD96 
X-CRM114-Status: UNSURE (   8.85  )
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

Fix all sparse warnings detected during LKP randconfig testing:
- Replace plain integer 0 with NULL.
- Add static modifier to k230_plls and k230_pll_divs.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605220724.j4ZeM3KI-lkp@intel.com/
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
---
 drivers/clk/clk-k230.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/clk-k230.c b/drivers/clk/clk-k230.c
index d883a1e1118e..cfc437038e4e 100644
--- a/drivers/clk/clk-k230.c
+++ b/drivers/clk/clk-k230.c
@@ -270,12 +270,12 @@ static const struct clk_ops k230_clk_ops_mul_div = {
 	.recalc_rate	= k230_clk_get_rate_mul_div,
 };
 
-K230_CLK_PLL_FORMAT(pll0, 0, CLK_IS_CRITICAL, 0);
-K230_CLK_PLL_FORMAT(pll1, 1, CLK_IS_CRITICAL, 0);
-K230_CLK_PLL_FORMAT(pll2, 2, CLK_IS_CRITICAL, 0);
-K230_CLK_PLL_FORMAT(pll3, 3, CLK_IS_CRITICAL, 0);
+K230_CLK_PLL_FORMAT(pll0, 0, CLK_IS_CRITICAL, NULL);
+K230_CLK_PLL_FORMAT(pll1, 1, CLK_IS_CRITICAL, NULL);
+K230_CLK_PLL_FORMAT(pll2, 2, CLK_IS_CRITICAL, NULL);
+K230_CLK_PLL_FORMAT(pll3, 3, CLK_IS_CRITICAL, NULL);
 
-struct k230_pll *k230_plls[] = {
+static struct k230_pll *k230_plls[] = {
 	&pll0,
 	&pll1,
 	&pll2,
@@ -296,7 +296,7 @@ K230_CLK_FIXED_FACTOR_FORMAT(pll3_div2, 1, 2, 0, &pll3.hw);
 K230_CLK_FIXED_FACTOR_FORMAT(pll3_div3, 1, 3, 0, &pll3.hw);
 K230_CLK_FIXED_FACTOR_FORMAT(pll3_div4, 1, 4, 0, &pll3.hw);
 
-struct clk_fixed_factor *k230_pll_divs[] = {
+static struct clk_fixed_factor *k230_pll_divs[] = {
 	&pll0_div2,
 	&pll0_div3,
 	&pll0_div4,
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
