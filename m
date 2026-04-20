Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2FC9F557E6
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Apr 2026 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:Message-Id:Cc:Subject:From
	:Date:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NsRGyAPO78viA9vqJc+KNRjuTyRNh/PK5vrSw8CkyfU=; b=46RhV9+GEm3BK/
	zDPBWRdYy47wQv77oSYogaNHiGenjPlnWCdeiSIZBPhamZoG2KWg6I8VvMgzBCDxBldoD9iN7wO/c
	5wlQypN49upm0PNKi1AtVNRV/OZkTbMgLW1KT9iOc0Kb6mCPgtE13j9nbmec4pjjkmqPQx3DLzXfS
	rCP1UDM9rljcn9rdFygH4c1GHpYZXE+ntc4bgQmzJRFVelGqRBXERY9ZTjaLemiHIVl2uw1rgcF4m
	aizbItKonvWFtNXYYfnlKUOVe2EAQusi0t4JaR3ONSGzZRWHdsv4Zorvrw7W7FYetEsdl2gRCx9AS
	RKqQ3YU+BC9/BeawF48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkAq-00000006bf5-39g8;
	Mon, 20 Apr 2026 08:40:08 +0000
Received: from va-2-27.ptr.blmpb.com ([209.127.231.27])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEkAn-00000006bd0-1fMv
	for linux-riscv@lists.infradead.org;
	Mon, 20 Apr 2026 08:40:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1776674394;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=MgsWDHxYc7rxgoNpzyBF6OV65e+9SKz/yJepBjtWIeE=;
 b=vdl4jAgohEfm2zs8vuqnxQD58OjEU9Zqk7pgZKwmiXECYt4taCJS8QHaLqhwMjsYUcLxZH
 /iN7SceptB/ETmTtMQvEQE6HWk5Rqik8kRPLvfv2HQtJVPrJZg6foLA9QY95wAUSEwXVmr
 v/mcXXeUgf3u/Jkv2ID1BbfndGL85Bors7AFC7CE+Mz2G9s5HAi51LsJB/zjigxGaeEa9g
 YeDLglaJ4zwVQPmO7/ZUIuHfAS3R2z7JWcwVFssq26xEb4YyrxV6UALTKLPKjFqcsn+qiM
 8h1S7HJBlUsJJmt2xo0pQ6xtew6f8c1kmvJW/CwrfJ4GaGt24Rv9jkxwxaBOmQ==
To: "Yixun Lan" <dlan@kernel.org>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Date: Mon, 20 Apr 2026 16:39:31 +0800
X-Original-From: Sandie Cao <sandie.cao@deepcomputing.io>
From: "Sandie Cao" <sandie.cao@deepcomputing.io>
Subject: [PATCH] dts: riscv: spacemit: k3: only keep spacemit,k1-i2c
X-Lms-Return-Path: <lba+269e5e658+342c80+lists.infradead.org+sandie.cao@deepcomputing.io>
Received: from roma-Laptop-12th-Gen-Intel-Core.. ([113.110.140.180]) by smtp.feishu.cn with ESMTPS; Mon, 20 Apr 2026 16:39:51 +0800
X-Mailer: git-send-email 2.43.0
Cc: "Conor Dooley" <conor+dt@kernel.org>, "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	<spacemit@lists.linux.dev>, <linux-riscv@lists.infradead.org>, 
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>, 
	"Sandie Cao" <sandie.cao@deepcomputing.io>, 
	"kernel test robot" <lkp@intel.com>
Message-Id: <20260420083931.1427703-1-sandie.cao@deepcomputing.io>
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_014006_163761_C182D32A 
X-CRM114-Status: UNSURE (   4.79  )
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

Fix dtcheck issue: compatible:0: 'spacemit,k1-i2c' was expected
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/r/202604140259.eKDaxKua-lkp@intel.com/

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
---
 arch/riscv/boot/dts/spacemit/k3.dtsi | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 815debd16409..9a3d2e8cdfe8 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -556,7 +556,7 @@ gmac2_axi_setup: stmmac-axi-config {
 		};
 
 		i2c0: i2c@d4010800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4010800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -570,7 +570,7 @@ i2c0: i2c@d4010800 {
 		};
 
 		i2c1: i2c@d4011000 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4011000 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -584,7 +584,7 @@ i2c1: i2c@d4011000 {
 		};
 
 		i2c2: i2c@d4012000 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4012000 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -598,7 +598,7 @@ i2c2: i2c@d4012000 {
 		};
 
 		i2c4: i2c@d4012800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4012800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -612,7 +612,7 @@ i2c4: i2c@d4012800 {
 		};
 
 		i2c5: i2c@d4013800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4013800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -752,7 +752,7 @@ uart9: serial@d4017800 {
 		};
 
 		i2c6: i2c@d4018800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd4018800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
@@ -784,7 +784,7 @@ gpio: gpio@d4019000 {
 		};
 
 		i2c8: i2c@d401d800 {
-			compatible = "spacemit,k3-i2c", "spacemit,k1-i2c";
+			compatible = "spacemit,k1-i2c";
 			reg = <0x0 0xd401d800 0x0 0x38>;
 			#address-cells = <1>;
 			#size-cells = <0>;
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
