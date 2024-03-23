Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27452CD11BF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Mar 2024 12:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Subject:Cc:To:From:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CN5zjbviEXOeeOsuzQ786cZ7QWS/6AszeCRZUTp4XCw=; b=fbVn3QxJavrGdV
	SSKGzgLxyFei+Gp58OXiqrOTvyIpkrqjVziTZfZEFIECDhKRiOPfedoA42b9yA3rg1Oz4H+NCU8KV
	vP6NIgLLmEJt5MQw6rff9Qj3minFevyPQpK7FM09tUnD3PaepsWDEleXJ+3YqotZM82zLOLnjnLhY
	xtdI+jHgithfqth9FoTZofV67fRecokddCpbiqX7XkSmUqZ9csa7xCqqBQSsU1DKX1AUqh+tGQXwK
	ID+I3hhTjPZz3exbtrCB32h06to9QXgt0qycCOS0GIE78SwZc7X8QB3XwzBkwaInHBf5ueCKbePiO
	ejIaoShozjJZ4p3wYZuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FK-0000000AKlB-0u4C;
	Sat, 23 Mar 2024 12:13:10 +0000
Received: from out203-205-221-190.mail.qq.com ([203.205.221.190])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ro0FE-0000000AKfS-1L62
	for linux-riscv@lists.infradead.org;
	Sat, 23 Mar 2024 12:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1711195982; bh=prkqax1s/YPOiuAZGsCqzxUs5Mq7p8+18pkZu3zCxio=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FExgpxyc7VxO+CJoSBQzjwA6ggvC4ApILGMK39zrxzE0omXjKuQVrsNw6IicRXhO7
	 iAzybrY12kmFFM18TjVlELGTJv5WwRZG0aw+rwhPHL+248xYRWq92NELgkVFE+pBYh
	 u9nMiIypby76k/byF5D+2Y4Kne8HBriKUpEht4IE=
Received: from cyy-pc.lan ([240e:379:225d:8e00:b91:b2e7:7c69:8554])
	by newxmesmtplogicsvrsza7-0.qq.com (NewEsmtp) with SMTP
	id 32594C7F; Sat, 23 Mar 2024 20:12:37 +0800
X-QQ-mid: xmsmtpt1711195978tnmlc3wz9
Message-ID: <tencent_09DCFC98C510B846023E004101ED10C70A07@qq.com>
X-QQ-XMAILINFO: OakVxA/3u/8RJY9aJxFZniVxmyjuv+LnRwH4BurKFJB3iN1qA6IOmp0/dMwmGq
	 INFrrIaazWaGFoEuymArxkohE6PFoK5yiXKOvxcdoT8D5n8yfqfYPpSw9lGIHfmkVheMdL2z5pt0
	 9vYFjBFTEAEY+EHInLHRem7AesRCeGKMrAqbPsGPm+TSdIzUg3V1oZdW8RxDYENgg9ZXCa172B0X
	 Gz9E7NicSdmTzdY63OFO0IpMvqmIYKgU9zdp4rBlsI8Qk/KLBkv1h9B5kv6aQ0SaKP5741c6C4S5
	 E3Iq2mOMUkKqWKHwYZg1gor5WBdZu8ZVnBQIzqYtoov5VFQ1c4HmlJyPm4UFb2WFhUi9aAnPuFSp
	 KN0SpzT/ThmgnQAyKWIeXWocwRzmbCywWu44Xz2K5uVNTvecAfNCJU9ix6OL6tYUK2q8HpbX83GH
	 gViqq84mYBnl+Bm363O6gQC4zoWydpo4DkEn6LOkYviXPxA0Qqzb5pDTPrbkf992jDcYTam1oAfe
	 foBX6gMtX3rrhkDzUaSe+VaPutNlIArRzaZxkQIAB/FSiabGD46XrQw4k69xJjbq5eZNwBxgLPuJ
	 hH51Kge4KnM0dXNQ9backIuoneNkl4OOY2aq7RtHibNy6QPDNJTXz0Gu77EOm9hmlK+b35BpZ5Ju
	 x3CIFB8ZFxyg7XWghwzcbFwhZP4nB02cDxH6ykrVePXY3xsCOsCJWqt6eZaw42KDtBfc3+WSjkhA
	 EiEgZyMUFMOxicnQKkk76Q1Sp7AaqA7KL68slHTRz+1Mcgr5EfjPVjhAKaZNl5v8zOg9KpT4dUGJ
	 y2qv4l97K1/Y6Yi59CMw/oJp1UGHwgv1aFrDOoGJCC8A+0WvSw8fqjjIWHvaAup+IBbPXpKov/sj
	 WKND29wrN3sXj/qLz8nerguDF8O3J7BK6292HjwkRrqMI43CiUABAbmOkDEV20yniYCkedSicui7
	 4tIllPcH6NX0I8haL2cqKlQGACvNOVHe3nC6DzRoUjkkQbXcCz797BdLeuxoyVKqfKc4azC6aRlf
	 0ZPUJNzOvSY7aatIEhBh2IOxOy3OZPVkBVmsCYLPt0JNw1gx6P5OrZEaBgF2+9awiLpvTbWWx00E
	 pnjcW2v7rt+3Y9oUA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
From: Yangyu Chen <cyy@cyyself.name>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor@kernel.org>,
	Damien Le Moal <dlemoal@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-gpio@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yangyu Chen <cyy@cyyself.name>
Subject: [PATCH v6 09/11] reset: k210: Deprecate SOC_CANAAN and use SOC_CANAAN_K210
Date: Sat, 23 Mar 2024 20:12:21 +0800
X-OQ-MSGID: <20240323121223.1729328-9-cyy@cyyself.name>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
References: <tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240323_051304_886985_FC9B2882 
X-CRM114-Status: GOOD (  12.23  )
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

Since SOC_FOO should be deprecated from patch [1], and cleanup for other
SoCs is already on the mailing list [2,3,4,5], we remove the use of
SOC_CANAAN and introduced SOC_CANAAN_K210 for K210-specific drivers,

Thus, we replace its drivers depends on SOC_CANAAN_K210 and default select
when it has the symbol SOC_CANAAN_K210.

[1] https://lore.kernel.org/linux-riscv/20221121221414.109965-1-conor@kernel.org/
[2] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/
[3] https://lore.kernel.org/linux-riscv/20240305-fled-undrilled-41dc0c46bb29@spud/
[4] https://lore.kernel.org/linux-riscv/20240305-stress-earflap-d7ddb8655a4d@spud/
[5] https://lore.kernel.org/linux-riscv/20240305-praying-clad-c4fbcaa7ed0a@spud/

Signed-off-by: Yangyu Chen <cyy@cyyself.name>
---
 drivers/reset/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 85b27c42cf65..7112f5932609 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -103,9 +103,9 @@ config RESET_INTEL_GW
 
 config RESET_K210
 	bool "Reset controller driver for Canaan Kendryte K210 SoC"
-	depends on (SOC_CANAAN || COMPILE_TEST) && OF
+	depends on (SOC_CANAAN_K210 || COMPILE_TEST) && OF
 	select MFD_SYSCON
-	default SOC_CANAAN
+	default SOC_CANAAN_K210
 	help
 	  Support for the Canaan Kendryte K210 RISC-V SoC reset controller.
 	  Say Y if you want to control reset signals provided by this
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
