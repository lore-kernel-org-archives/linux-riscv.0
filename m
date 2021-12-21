Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EF6C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 01:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VID5la3TstaQCYO5oux1luEaW1btk8kokJeBhyXguFw=; b=zMTVPY4AVTvEuk
	DI/kqpnyZECE7bw7LsNbSZmlmPdK8JVGnz96r/9AWfDSiYvntgvNrSMF3o593o6S00daQCQG0cfi1
	13TDF6hb/7fCax9LztshnoW5AJ8bZHaLCmGEZ9KqzgT56f/P1i++/bnmqlf3Z92vFOdFaMYw3he4Y
	QK+FaU+FY0aEvRAX1FmYQJKhGi8cDyj5l+Md9653zypDH9f+AAjv0ahe3UP5igp8XzvBAPdX2n9uf
	RR5Ctd838Xaj+w9VjxhRsQ6k6GI/mWfpLBlyot87WcQWRfnq4WN1MvLnFPjzmLWKzPQVwuHh3i0n6
	+ouBdIBBR4KLUl9mvdxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzUQp-0057hN-QI; Tue, 21 Dec 2021 01:59:11 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzUQm-0057dx-Dd
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 01:59:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 2436AB81109;
 Tue, 21 Dec 2021 01:59:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E49FC36AE9;
 Tue, 21 Dec 2021 01:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640051946;
 bh=IoaJDxvyf758nRB1UqhXiWyuT5+xLjQ8CUBHaq8XO+Y=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T1S8fBnrtOezR+goQUlhBly8F0ha+X/efwqMjUlmIFH7blSFlCxSn5egL7jCl+opu
 0MYhq5ttsmMqpTLsMLxYSsfI0fqEUns7BJCPam0rGgeh6g+MYf4PMpdy8OMFcXBp48
 U1Bk+eFXImeBw7Lo8MwZBZ6lAG/itz8fx3sG+O7i6Np2fZ7ow90xZj/2GENtjJcUkB
 1qidR5vbfoQqvpDJFdM3/Vbk/Yewoo2nexD3eZhDwgVq8NPbJPEhaPEIQ9jeqojsHd
 zh6CsFAUTuW19CR53GZWk340uOvy2/44+aaJ2yOINUheVX5xNqG0/cvKgp7GpIGLNX
 f6V7zVxAwAlug==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Vincent Pelletier <plr.vincent@gmail.com>,
 Palmer Dabbelt <palmer@rivosinc.com>, Sasha Levin <sashal@kernel.org>,
 robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, qiuwenbo@kylinos.com.cn, yash.shah@sifive.com,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.15 27/29] riscv: dts: sifive unmatched: Fix
 regulator for board rev3
Date: Mon, 20 Dec 2021 20:57:48 -0500
Message-Id: <20211221015751.116328-27-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20211221015751.116328-1-sashal@kernel.org>
References: <20211221015751.116328-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211220_175908_783274_A9A206B6 
X-CRM114-Status: GOOD (  10.13  )
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

From: Vincent Pelletier <plr.vincent@gmail.com>

[ Upstream commit ad931d9b3b2e21586de8e6b34346d0a30c13721d ]

The existing values are rejected by the da9063 regulator driver, as they
are unachievable with the declared chip setup (non-merged vcore and bmem
are unable to provide the declared curent).

Fix voltages to match rev3 schematics, which also matches their boot-up
configuration within the chip's available precision.
Declare bcore1/bcore2 and bmem/bio as merged.
Set ldo09 and ldo10 as always-on as their consumers are not declared but
exist.
Drop ldo current limits as there is no current limit feature for these
regulators in the DA9063. Fixes warnings like:
  DA9063_LDO3: Operation of current configuration missing

Signed-off-by: Vincent Pelletier <plr.vincent@gmail.com>
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 .../boot/dts/sifive/hifive-unmatched-a00.dts  | 84 ++++++-------------
 1 file changed, 24 insertions(+), 60 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
index dd110ba00e871..09d9342282339 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
@@ -93,47 +93,31 @@ wdt {
 		};
 
 		regulators {
-			vdd_bcore1: bcore1 {
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <900000>;
-				regulator-min-microamp = <5000000>;
-				regulator-max-microamp = <5000000>;
-				regulator-always-on;
-			};
-
-			vdd_bcore2: bcore2 {
-				regulator-min-microvolt = <900000>;
-				regulator-max-microvolt = <900000>;
-				regulator-min-microamp = <5000000>;
-				regulator-max-microamp = <5000000>;
+			vdd_bcore: bcores-merged {
+				regulator-min-microvolt = <1050000>;
+				regulator-max-microvolt = <1050000>;
+				regulator-min-microamp = <4800000>;
+				regulator-max-microamp = <4800000>;
 				regulator-always-on;
 			};
 
 			vdd_bpro: bpro {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <2500000>;
-				regulator-max-microamp = <2500000>;
+				regulator-min-microamp = <2400000>;
+				regulator-max-microamp = <2400000>;
 				regulator-always-on;
 			};
 
 			vdd_bperi: bperi {
-				regulator-min-microvolt = <1050000>;
-				regulator-max-microvolt = <1050000>;
+				regulator-min-microvolt = <1060000>;
+				regulator-max-microvolt = <1060000>;
 				regulator-min-microamp = <1500000>;
 				regulator-max-microamp = <1500000>;
 				regulator-always-on;
 			};
 
-			vdd_bmem: bmem {
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-				regulator-min-microamp = <3000000>;
-				regulator-max-microamp = <3000000>;
-				regulator-always-on;
-			};
-
-			vdd_bio: bio {
+			vdd_bmem_bio: bmem-bio-merged {
 				regulator-min-microvolt = <1200000>;
 				regulator-max-microvolt = <1200000>;
 				regulator-min-microamp = <3000000>;
@@ -144,86 +128,66 @@ vdd_bio: bio {
 			vdd_ldo1: ldo1 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <100000>;
-				regulator-max-microamp = <100000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo2: ldo2 {
 				regulator-min-microvolt = <1800000>;
 				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo3: ldo3 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo4: ldo4 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <2500000>;
+				regulator-max-microvolt = <2500000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo5: ldo5 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <100000>;
-				regulator-max-microamp = <100000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo6: ldo6 {
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo7: ldo7 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vdd_ldo8: ldo8 {
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
 				regulator-always-on;
 			};
 
 			vdd_ld09: ldo9 {
 				regulator-min-microvolt = <1050000>;
 				regulator-max-microvolt = <1050000>;
-				regulator-min-microamp = <200000>;
-				regulator-max-microamp = <200000>;
+				regulator-always-on;
 			};
 
 			vdd_ldo10: ldo10 {
 				regulator-min-microvolt = <1000000>;
 				regulator-max-microvolt = <1000000>;
-				regulator-min-microamp = <300000>;
-				regulator-max-microamp = <300000>;
+				regulator-always-on;
 			};
 
 			vdd_ldo11: ldo11 {
 				regulator-min-microvolt = <2500000>;
 				regulator-max-microvolt = <2500000>;
-				regulator-min-microamp = <300000>;
-				regulator-max-microamp = <300000>;
 				regulator-always-on;
 			};
 		};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
