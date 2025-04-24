Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1027DC369D5
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Apr 2025 06:06:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lLmvTa6FCywTPNT6vyBD2a3uMQd5VTK/qOvYrz55BY8=; b=GKG88xBvsRYMP9
	aFGevrITcAUSd510K5wQ0hd223KmsqFyExpTELPS6MaXsu/rIAqD0rQneJGyficeejjvuym8+Ubh5
	dw2kOF1kNWz4TFE640EW1SRJLR52nc9EKMkfiTFur6s9/ESaAuSH33fBvwBCdYyK8OC3qpJYma8Y7
	FWxX80uUyWw6BNnnszIhM28D2H/tIAx6Aeo9rI1irH+wZW3SR4XR/bnXHZepquCiVqzlfJkGtYR0W
	syRAJn4KLvhOFyHnpFyp2eBSJHrrHNXu2iDWQTd99GZ2YiPc7Bwp8fMREESqpoaikV46pL0iZdmOT
	TSnHNf4D6+EqIzT+Zb0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pjW-0000000Cw1a-0nzu;
	Thu, 24 Apr 2025 06:06:50 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7pjD-0000000Cvz2-0JNO
	for linux-riscv@lists.infradead.org;
	Thu, 24 Apr 2025 06:06:32 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745474783; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iHwLhqCIKTsbFBMHt8WQhB9xzazFvx/+zbVNfPsl08dwSzbuFFd/tljjsYebEwE9w71rBIP9Qzs3rVt/TF/uZKSbwV8L713XpMd6gnmHYf0KcmhXWSZImwCC7grDLkcL6nz7WbhcCtTTmlfhLC8+pdAesv3KoCqvXItIgyUgmj0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745474783; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ix1Q4sGKAg9a8w65SPXpLATi5/wlpy8wAjzQzuX0MDc=; 
	b=e111KMAzfGCF+86Qn1ywIPwyU153D7k8U25bq62JpQoUZJwqkH72P5JvUTcKtnbmLbWCxYUDN5bJQAAxE+yT6eAV9nhLAxvwgaKQ2t6TQfr1rbfAj+EBUfc1ODcMmtbZR3iOcUU9b+cOcrkryX47sekrhPPPA8DfL2Bz4GEH8fk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745474783;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=Ix1Q4sGKAg9a8w65SPXpLATi5/wlpy8wAjzQzuX0MDc=;
	b=g76/UJ27I76sdVUUsUdwNX33SvRjtR6SzLjaG+iOL2ym7hQZyNSzbTimUIn4q1IZ
	RzP3oKOh0RL6AA9whACWA9hI1pJPoKMI+FiT6TuO5gG8DTG8P6Z4T/fzs05+m+QIaQl
	CByTUX57VqKqbc7bnOHOzRDPEydxzsc0E206NouPSVedl9ZntDov8X9GrlJ4fHsIOtr
	KgnzCowrjxtsn03b1EQrDvnxgkVOP7deCAQVEg6ndQAPshQ92K8VJEo5GSLV1NQs3dr
	TyfeXgIWCVrB0rO0GrmjIC32MtvrO/pef3NoC3ngGfl3z8SQ531MI+o3rK/EJt1mts6
	uqdlNymSyA==
Received: by mx.zohomail.com with SMTPS id 1745474779881209.53571103315892;
	Wed, 23 Apr 2025 23:06:19 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>
Cc: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH] riscv: dts: starfive: jh7110-common: use macros for MMC0 pins
Date: Thu, 24 Apr 2025 14:06:05 +0800
Message-ID: <20250424060605.638678-1-uwu@icenowy.me>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_230631_187409_01BB81EF 
X-CRM114-Status: UNSURE (   7.96  )
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

The pin names of MMC0 pinmux is defined in the pinctrl dt binding header
associated with starfive,jh7110-pinctrl .

Include the header file and use these names instead of raw numbers for
defining MMC0 pinmux.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
This is only a prettying commit. The resulting DTB files have the same
content with or without this patch (verified by doing sha256sum on
arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2-v1.3b.dtb).

 .../boot/dts/starfive/jh7110-common.dtsi      | 21 ++++++++++---------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index c2f70f5e2918f..a2c72b385a905 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -8,6 +8,7 @@
 #include "jh7110.dtsi"
 #include "jh7110-pinfunc.h"
 #include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
 
 / {
 	aliases {
@@ -428,16 +429,16 @@ GPOEN_ENABLE,
 		};
 
 		mmc-pins {
-			pinmux = <PINMUX(64, 0)>,
-				 <PINMUX(65, 0)>,
-				 <PINMUX(66, 0)>,
-				 <PINMUX(67, 0)>,
-				 <PINMUX(68, 0)>,
-				 <PINMUX(69, 0)>,
-				 <PINMUX(70, 0)>,
-				 <PINMUX(71, 0)>,
-				 <PINMUX(72, 0)>,
-				 <PINMUX(73, 0)>;
+			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
+				 <PINMUX(PAD_SD0_CMD, 0)>,
+				 <PINMUX(PAD_SD0_DATA0, 0)>,
+				 <PINMUX(PAD_SD0_DATA1, 0)>,
+				 <PINMUX(PAD_SD0_DATA2, 0)>,
+				 <PINMUX(PAD_SD0_DATA3, 0)>,
+				 <PINMUX(PAD_SD0_DATA4, 0)>,
+				 <PINMUX(PAD_SD0_DATA5, 0)>,
+				 <PINMUX(PAD_SD0_DATA6, 0)>,
+				 <PINMUX(PAD_SD0_DATA7, 0)>;
 			bias-pull-up;
 			drive-strength = <12>;
 			input-enable;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
