Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AEFACC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 12:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6TRXgyCGGpgDjZQtHu+xpgsw1vYxtqsc5Dsn/ZmSqSc=; b=aXjA3k8JmjO7t4
	Lvo1SUn/IcGYRLVx3Z6ztc8Ve+aXuhFlEHZwpdZm++PTobwPB/GEs+zjrH+nMdzK6ey1kl+EGqWc3
	QHVsIGr0BXAL9lAVPNf6yzPbw0JpPVBpL3FmW3z02eictF/3UJJJaovzifMmoGHrnV6rw2feQiLbK
	fCnMYym+ZjFlByNDjRU4VFW9WA3i8vZYruTfQqg9AL5BjWlwDTvO35LpbBXnYevMA0SGNAguKIfM5
	FgP0k7ASc3klJBlRP/EMgai0mgW3QQirPekVSOT7h7FopmNB9ASZp0A4lOtcT6B/JKnTUxvFALOBk
	KLzcy/5mP0ZApO1DgYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKzG-00000000AlF-3FGv;
	Thu, 15 Oct 2026 12:55:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKzD-00000000Aiu-2rji
	for linux-riscv@bombadil.infradead.org;
	Thu, 15 Oct 2026 12:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ShnbVuSJnvDO1yDDDt1DyIbRfQh4el11rwFcGN8Hw/E=; b=Ov2iCkDXssJX8ORye74Tf/3p5O
	AeMwAOtV6pAaghvr1fhQPF6wQlhKjCZ3jQF1eHH48+WdbR358NGFhmGj2gPvT5j1f7Ek39th/LQ9x
	9khlS7TnBI2kyTG5rRFQGQiY3+leSbl3WBUBClUUahrMPT7Zj9cNGX8o7rgb08gRrSMBvbYoWRdSO
	2/k9suU+nNrrZtPknzXnOotAsFkjA0GxEiRFN9tyuwFaH1IGk2j5xFsAr8X4q3KArmwUGMl9IY55K
	Q4ytsMXhKl9otm7XZ70qxtoXHTLptaUF0scUJbkXWEFRuOSZH2ZvDVyL/7F554YYLv268GQusGjkn
	zozkQ7Sg==;
Received: from naesa04.arrow.com ([216.150.161.24])
	by desiato.infradead.org with esmtps (Exim 4.99.5 #2 (Red Hat Linux))
	id 1xHKzA-00000000NfG-0cN0
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 12:55:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1887; q=dns/txt;
  s=NAESA-Selector1; t=1792068904; x=1823604904;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ShnbVuSJnvDO1yDDDt1DyIbRfQh4el11rwFcGN8Hw/E=;
  b=uJemcEz7pz4SdS2+cUdtqTu8lRN+vrJTBee2Qk/8YkRudK3baCQPenZ7
   C/8yEGWkKRG8tOFfdBwpTi0cBTunnOccIwu9+LyyrwX0Q8DqFuxIdxhYr
   68vFWBa9Nac9iqzEN5+k1UjqOlXZnBz9+uYdIPBrT7fsdxIWk9ojHme34
   OKmD+w406ZTpZj92AmLh63fxNmQUMGPFxiH64MgykT/nIvjmcOX2oT4wP
   2m+7ixZsDgpkDVH+xoz05bmrdtniT5FP9BQFUPrR4vy4wfQqjhmUg+byt
   ZAa/Y+LZVayfErIGTV9GjGrebmeedMwxYr7fG8XK+d6Hx5OAxFWA1mPeX
   A==;
X-CSE-ConnectionGUID: rofklm0fSEidJOJSFK4iYg==
X-CSE-MsgGUID: 8xn6abbGRzOxMb5yoOwC7g==
X-IronPort-AV: E=Sophos;i="6.27,159,1787032800"; 
   d="scan'208";a="125039164"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 15 Oct 2026 06:54:58 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Thu, 15 Oct 2026 18:24:55 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 2/7] riscv: dts: eswin: add clock generator for EIC7700 SoC
Date: Thu, 15 Oct 2026 18:24:49 +0530
Message-Id: <20261015125454.1381941-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
References: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Oct 2026 12:54:55.0154 (UTC) FILETIME=[6054B920:01DD5CA4]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_135504_771293_A05E4EF9 
X-CRM114-Status: UNSURE (   9.04  )
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

From: Pritesh Patel <pritesh.patel@einfochips.com>

Add clock generator node for EIC7700 SoC.
HiFive Premier P550 boards have 24MHz crystal oscillator to provide
the input clock.

Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
---
 .../boot/dts/eswin/eic7700-hifive-premier-p550.dts  |  5 +++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi              | 13 +++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
index 131ed1fc6b2e..a5c76b14a38f 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -20,6 +20,11 @@ chosen {
 	};
 };
 
+&osc {
+	clock-frequency = <24000000>;
+	clock-output-names = "osc_24m";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 430a210f01e6..b3a230870315 100644
--- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
+++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
@@ -4,6 +4,7 @@
  */
 
 /dts-v1/;
+#include <dt-bindings/clock/eswin,eic7700-clock.h>
 #include <dt-bindings/reset/eswin,eic7700-reset.h>
 
 / {
@@ -203,6 +204,11 @@ pmu {
 				<0x00000000 0x0000000f 0xfffffffc 0x000000ff 0x00000078>;
 	};
 
+	osc: oscillator {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		ranges;
@@ -343,6 +349,13 @@ gpioD: gpio-port@3 {
 			};
 		};
 
+		clk: clock-controller@51828000 {
+			compatible = "eswin,eic7700-clock";
+			reg = <0x0 0x51828000 0x0 0x300>;
+			clocks = <&osc>;
+			#clock-cells = <1>;
+		};
+
 		reset: reset-controller@51828300 {
 			compatible = "eswin,eic7700-reset";
 			reg = <0x0 0x51828300 0x0 0x200>;
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
