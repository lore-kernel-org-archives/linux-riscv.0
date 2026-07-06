Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20118C44503
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Jul 2026 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5W/A05TETag1XVn3TRLkYo+tLYtEYwDu17QBmEnXxCk=; b=MLdIiENhlW7Enm
	LzxnfcUkXA4o/JFtenjuXiLThO76TLl1v+0QfCzPQ109vukzgHwl9qnNGiBFGDJQTXMA1/cf28tcf
	5eEopMqvMKm8s1rUn5t0cxCOL9EJCNnJD6YhEOxqHHdAeXPOufpJERQE8ZdZgiByvcqAY8Yyw4nBd
	d4sX9FCMpOMAWTkjwnEuw20FQI4/GqFTavFvE0TOpEJl74tThesdQLwT9W0Jg0noCeMOApJqGwCSB
	uFsDqpJYwBbewPRu/JJZYk2ZpNyxnI0cern08k4vqAZKLeLMwgTJhg4OHI0R7IgcqvRchTcn/eKol
	64P+7TVpusYsVOTufkNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgeQ0-0000000Bmlf-0Plm;
	Mon, 06 Jul 2026 08:11:08 +0000
Received: from naesa04.arrow.com ([216.150.161.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgePw-0000000BmiQ-3A8h
	for linux-riscv@lists.infradead.org;
	Mon, 06 Jul 2026 08:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1906; q=dns/txt;
  s=NAESA-Selector1; t=1783325464; x=1814861464;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=R5xklhqISih2SzU4VfviMo3Vox+xr0oG4tU6SqgB6RQ=;
  b=ag6RVBc6BvwgplX99j1I/zo+xAji5aqdaH/FDuj4y31Q8DNVAC3eKfnp
   fKDg6rKsgg2PxUvOnvGD/TxTJdUE0K48nD8LHFTEXEpZfXD8oePgGcsmf
   gil8D11HKKaxHl5/yFRl2m1sN8uBbYgH2GqCD5c+ZBxy2sxNBZQ9Z15AK
   pc0d794+9sMyh3FEZ06ByeWwo17w5YSZplNNC9fdyazxBOB/zV2jS39sc
   71hVE+RMJGVPFVJoTA37nhTA4Ck9FHKeAMESnMfU1WJyLeZlryBwqxKjh
   yeKlUAVUFRXGKjUNaZU16BD9GYgiEebFGO7jjZ3za5SVoD9jRX7LgUjFT
   Q==;
X-CSE-ConnectionGUID: mfvtPwn1TTyxEc8AH0/Fhw==
X-CSE-MsgGUID: w+TQ+BL5T06nnLGyQ5muvQ==
X-IronPort-AV: E=Sophos;i="6.25,149,1779170400"; 
   d="scan'208";a="116963503"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 06 Jul 2026 02:10:59 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Mon, 6 Jul 2026 13:40:55 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
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
Subject: [PATCH v2 2/8] riscv: dts: eswin: add clock generator for EIC7700 SoC
Date: Mon,  6 Jul 2026 13:40:49 +0530
Message-Id: <20260706081055.1126275-3-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
References: <20260706081055.1126275-1-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
X-OriginalArrivalTime: 06 Jul 2026 08:10:55.0907 (UTC) FILETIME=[F86D3730:01DD0D1E]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_011104_852438_0E0074FD 
X-CRM114-Status: UNSURE (   8.78  )
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
index 131ed1fc6b2e..1266762dfcd8 100644
--- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
+++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
@@ -20,6 +20,11 @@ chosen {
 	};
 };
 
+&clock_24m {
+	clock-frequency = <24000000>;
+	clock-output-names = "clock_24m";
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts/eswin/eic7700.dtsi
index 430a210f01e6..af9e40d8739a 100644
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
 
+	clock_24m: clock-24m {
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
+			clocks = <&clock_24m>;
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
