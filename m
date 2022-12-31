Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EB4C4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 23:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IjNsCm+GbB8foIcVlY5CDK0BCzdS4OOQk+ei+8/9Czk=; b=L2PFr14EHmYrBV
	xWAn3ElSNHiEfd5arr2H8vVrQuhI76kmmN+2UqPtPF+Y2/d3lhVROvQtwC00OTJ5LUZkJogDGxaUQ
	KfynEg2X8HudBcXUZ26On/b/OqP0F1hQhD76xiPKNi8uqkadkaax1ClkRc5oLVLDWAY7BCvXXvdBS
	ZfpcpqLrLhQWX83JKZK/ni103eQgmLyeDsBWwU6EUZCiyUa3IwU9HRxW9vAN9JB9TY8lb6Bfl1yMF
	HwLnp/RfvqQi8Yhb6RDdtiA8ijEWReIUQUXgwU4Dh/+3sMSYh5H2kxzWH/6ti9z4s/+Ox7kljGjUk
	wJLTJmhJv6VjyE+s+lfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBl4O-00BNQu-Fl; Sat, 31 Dec 2022 23:15:16 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBl3j-00BN9X-NI; Sat, 31 Dec 2022 23:14:38 +0000
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
	by mailout.nyi.internal (Postfix) with ESMTP id 563015C00B6;
	Sat, 31 Dec 2022 18:14:32 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Sat, 31 Dec 2022 18:14:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sholland.org; h=
	cc:cc:content-transfer-encoding:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:sender
	:subject:subject:to:to; s=fm3; t=1672528472; x=1672614872; bh=Oc
	Gtkt9Bv14YYpUDrmReERXmRLK8ON2avWRPl23IvSg=; b=biHwDqWNILuLJNtQYg
	3j1fb0k21jDb4Ko5o6IDmurbl2UjIiIOuvZUYy+vO2OPeI6vWObUOog46/W0ULOp
	Yr/25fV5oSosLtv73BrYbqEEjnz8rsYK4aqvih8fnfNudCCgriRteLtVU71avP23
	Y4CDPhiK/EOtq2IPySjRHtl3l1otd4tefxiaQawVQB3IwTA7OQ3ihtjmCSpDB/DQ
	AAlwACYwp9A+XTv2+Ep8qWvqk5OhFV1WIM9YqBUEyOhGLzwX8vF8sCYGJQGsivg9
	AaeS6OIAvObrYzLsRCeC3U6qe85FK4XmrpoXfagCvsAgQ0FoxYgsMAgMrGZofRCq
	Naiw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:sender:subject
	:subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
	:x-sasl-enc; s=fm2; t=1672528472; x=1672614872; bh=OcGtkt9Bv14YY
	pUDrmReERXmRLK8ON2avWRPl23IvSg=; b=r2DkBNYttsQ7FkZcACYJmfYfh2hlg
	/R55ReEj+mldF4kcsUqYiLfQzwkJ+IpoBgrZubXT3vud+5reWx2PiUpi9oly+LJI
	VkZOaohaiitzwzMz+P/Kg1bO4415JEO81KYDGNBI/HYL9AqHCFkdmPdPtg5So53h
	JGCagO23gh23MHylSbp8Lp2q++l3TbXlatSUG3ymz8JH6z6xFmIXudNtTbBZ0qF3
	kh3o7/GLuEvGMAu99K8ekfK+ZD29Hzm5i+cwKofMMf7s6zya9nTONDtZK9ABsEze
	CBiZ/OAiKTVDIJ/qmK3WwJ8RnjMLI1e8y3J8OhmBQ2M39NTZuvJtPDyCg==
X-ME-Sender: <xms:WMKwY-RNRV1nJ17aPOjEv-D_ChyaI5Olg-W977LtlmFYYNfx5I04ag>
    <xme:WMKwYzweo8g6dUCnDuahU23lb8CG3zHke6kfO7KOln0XHjoDdhmJ5NZ5xvLz_7XWI
    WUIcabpk6t0E6xlqg>
X-ME-Received: <xmr:WMKwY70fTtlISru6XN466V015zQaze06J08Zwr38key68vk1vg1IjPUdM4jESXtFmCPJlmnagklHFrx3ujaFHP0ZGE5IXA4o6x8_D9bpwWF2W4gjqP6XwauvlR6o-TJ_fFsBkA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrieelgddtlecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefurghmuhgv
    lhcujfholhhlrghnugcuoehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhgqeenucggtf
    frrghtthgvrhhnpedukeetueduhedtleetvefguddvvdejhfefudelgfduveeggeehgfdu
    feeitdevteenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhroh
    hmpehsrghmuhgvlhesshhhohhllhgrnhgurdhorhhg
X-ME-Proxy: <xmx:WMKwY6C95iMYnz4kv-zxQSvuKHc6yhWuLJEZguQyeB5nkDUcgCG8Eg>
    <xmx:WMKwY3hBYGOmdzIsox-HGBR6Tpl7JT8Y3t37vhQuMFu8IkI2jlcLgQ>
    <xmx:WMKwY2pMVLbU4fVsktzt76wHMFeFILX5JDn2dMiRhvIGQTk5W8x0KA>
    <xmx:WMKwY3wyiB7SCGNT93bnZPrMt0oATMKZUIk3E3z_zvxogjgGdhdR3A>
Feedback-ID: i0ad843c9:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 31 Dec 2022 18:14:31 -0500 (EST)
From: Samuel Holland <samuel@sholland.org>
To: Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Samuel Holland <samuel@sholland.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2 1/6] clk: sunxi-ng: Remove duplicate ARCH_SUNXI dependencies
Date: Sat, 31 Dec 2022 17:14:24 -0600
Message-Id: <20221231231429.18357-2-samuel@sholland.org>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221231231429.18357-1-samuel@sholland.org>
References: <20221231231429.18357-1-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221231_151436_522888_14BB8AC4 
X-CRM114-Status: UNSURE (   9.00  )
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

SUNXI_CCU already depends on ARCH_SUNXI, so adding the dependency to
individual SoC drivers is redundant. Drivers stay disabled under
COMPILE_TEST because of the `default ARCH_SUNXI` applied to SUNXI_CCU.

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
Signed-off-by: Samuel Holland <samuel@sholland.org>
---

(no changes since v1)

 drivers/clk/sunxi-ng/Kconfig | 43 ++++++++++++++++++------------------
 1 file changed, 21 insertions(+), 22 deletions(-)

diff --git a/drivers/clk/sunxi-ng/Kconfig b/drivers/clk/sunxi-ng/Kconfig
index 461537679c04..64cfa022e320 100644
--- a/drivers/clk/sunxi-ng/Kconfig
+++ b/drivers/clk/sunxi-ng/Kconfig
@@ -14,43 +14,43 @@ config SUNIV_F1C100S_CCU
 
 config SUN20I_D1_CCU
 	tristate "Support for the Allwinner D1 CCU"
-	default RISCV && ARCH_SUNXI
-	depends on (RISCV && ARCH_SUNXI) || COMPILE_TEST
+	default RISCV
+	depends on RISCV || COMPILE_TEST
 
 config SUN20I_D1_R_CCU
 	tristate "Support for the Allwinner D1 PRCM CCU"
-	default RISCV && ARCH_SUNXI
-	depends on (RISCV && ARCH_SUNXI) || COMPILE_TEST
+	default RISCV
+	depends on RISCV || COMPILE_TEST
 
 config SUN50I_A64_CCU
 	tristate "Support for the Allwinner A64 CCU"
-	default ARM64 && ARCH_SUNXI
-	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+	default ARM64
+	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_CCU
 	tristate "Support for the Allwinner A100 CCU"
-	default ARM64 && ARCH_SUNXI
-	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+	default ARM64
+	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_A100_R_CCU
 	tristate "Support for the Allwinner A100 PRCM CCU"
-	default ARM64 && ARCH_SUNXI
-	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+	default ARM64
+	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_CCU
 	tristate "Support for the Allwinner H6 CCU"
-	default ARM64 && ARCH_SUNXI
-	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+	default ARM64
+	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H616_CCU
 	tristate "Support for the Allwinner H616 CCU"
-	default ARM64 && ARCH_SUNXI
-	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+	default ARM64
+	depends on ARM64 || COMPILE_TEST
 
 config SUN50I_H6_R_CCU
 	tristate "Support for the Allwinner H6 and H616 PRCM CCU"
-	default ARM64 && ARCH_SUNXI
-	depends on (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+	default ARM64
+	depends on ARM64 || COMPILE_TEST
 
 config SUN4I_A10_CCU
 	tristate "Support for the Allwinner A10/A20 CCU"
@@ -71,8 +71,7 @@ config SUN6I_A31_CCU
 
 config SUN6I_RTC_CCU
 	tristate "Support for the Allwinner H616/R329 RTC CCU"
-	default ARCH_SUNXI
-	depends on ARCH_SUNXI || COMPILE_TEST
+	default y
 
 config SUN8I_A23_CCU
 	tristate "Support for the Allwinner A23 CCU"
@@ -91,8 +90,8 @@ config SUN8I_A83T_CCU
 
 config SUN8I_H3_CCU
 	tristate "Support for the Allwinner H3 CCU"
-	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
-	depends on MACH_SUN8I || (ARM64 && ARCH_SUNXI) || COMPILE_TEST
+	default MACH_SUN8I || ARM64
+	depends on MACH_SUN8I || ARM64 || COMPILE_TEST
 
 config SUN8I_V3S_CCU
 	tristate "Support for the Allwinner V3s CCU"
@@ -101,7 +100,7 @@ config SUN8I_V3S_CCU
 
 config SUN8I_DE2_CCU
 	tristate "Support for the Allwinner SoCs DE2 CCU"
-	default MACH_SUN8I || (ARM64 && ARCH_SUNXI)
+	default MACH_SUN8I || ARM64
 
 config SUN8I_R40_CCU
 	tristate "Support for the Allwinner R40 CCU"
@@ -115,6 +114,6 @@ config SUN9I_A80_CCU
 
 config SUN8I_R_CCU
 	tristate "Support for Allwinner SoCs' PRCM CCUs"
-	default MACH_SUN8I || (ARCH_SUNXI && ARM64)
+	default MACH_SUN8I || ARM64
 
 endif
-- 
2.37.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
