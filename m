Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50756C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Apr 2022 10:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=q/CW2m29Dkqp/O4DxJaPpbljXcEHYjOinqFygrOQwT0=; b=qFhdb9wPTopvL+
	WtiITg2f7rIQQpVaoRDvpxytLcmZNcu62GoFu0ip65BeDiL+cnERJXKcgWEPB5DODR5w/a4cHcEjH
	3XGH5Tz0XIvHB4UiXcomfVdzFzKMLAlp/sZDyLHzNJgmzR35mGfe/eZ2oUJ9vsZaH/B0YDcOdq8+z
	cveu84RUo0PpYSkvyjMb6hryB71eckAjV5HocinNPzpvfJyG4LThBI4fXcSv3Vf1/UzDGxPTvbr0r
	F0TdVDAPWNLkurpIqSx2AnhdVOQgBZZPQbZ4HQpAc3fqT+or1iqOwe9ExF6yKJJm4hGOTH9HKSrlm
	0/rAm7UMrGzQJR+zvzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkO4Q-00ArPV-2e; Fri, 29 Apr 2022 10:41:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkO4H-00ArGn-HK
 for linux-riscv@lists.infradead.org; Fri, 29 Apr 2022 10:41:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1651228906; x=1682764906;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZIx9dKuH/3orJrOjJjxDcAuttBoqSt/MgnaZFFvvMus=;
 b=CQLbk7GnxPODdSTZcfDVXnDFE/aw/UbzRdlVlGIUg9Z7AZK+3y2fKQVL
 SRSmBWDyisTgWjUc44+K+vTsgzrP9zIlsMhcLDKlQHiPlF6mL7e4APxke
 8fuN5QnwKBjnXp/UuIi70Vu59nbzgopfP9c3te+0jkbdWolf9e/HZ2OMG
 nkcgfqy7zk5NGY/4ICMZIy7UEdKSkzgPkZtcDNV2SZOk3IaPjI0BXrjwm
 ScH0qBxPWcOgp96pmkOyN4skzHOL99/vJI5iSIv84JP/vy/JdEY/UTMLV
 vLrbDNdJNUF6M/II+djdhfJRaEM4A/421lk3+KAv1/rotQASprpSUZhDU Q==;
X-IronPort-AV: E=Sophos;i="5.91,298,1647327600"; d="scan'208";a="161799773"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 29 Apr 2022 03:41:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 29 Apr 2022 03:41:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 29 Apr 2022 03:41:38 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, "Arnd
 Bergmann" <arnd@arndb.de>
Subject: [PATCH v1 5/8] riscv: dts: microchip: make the fabric dtsi board
 specific
Date: Fri, 29 Apr 2022 11:40:38 +0100
Message-ID: <20220429104040.197161-6-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220429104040.197161-1-conor.dooley@microchip.com>
References: <20220429104040.197161-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220429_034145_621961_EBA87A98 
X-CRM114-Status: GOOD (  10.40  )
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

Currently mpfs-fabric.dtsi is included by mpfs.dtsi - which is fine
currently since there is only one board with this SoC upstream.

However if another board was added, it would include the fabric contents
of the Icicle Kit's reference design. To avoid this, rename
mpfs-fabric.dtsi to mpfs-icicle-kit-fabric.dtsi & include it in the dts
rather than mpfs.dtsi.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} | 2 ++
 arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts               | 1 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi                         | 1 -
 3 files changed, 3 insertions(+), 1 deletion(-)
 rename arch/riscv/boot/dts/microchip/{mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (93%)

diff --git a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
similarity index 93%
rename from arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
rename to arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
index ccaac3371cf9..7ee592e78c05 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-fabric.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
@@ -2,6 +2,8 @@
 /* Copyright (c) 2020-2021 Microchip Technology Inc */
 
 / {
+	compatible = "microchip,mpfs-icicle-reference-rtlv2203";
+
 	core_pwm0: pwm@41000000 {
 		compatible = "microchip,corepwm-rtl-v4";
 		reg = <0x0 0x41000000 0x0 0xF0>;
diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
index 84b0015dfd47..739dfa52bed1 100644
--- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
@@ -4,6 +4,7 @@
 /dts-v1/;
 
 #include "mpfs.dtsi"
+#include "mpfs-icicle-kit-fabric.dtsi"
 
 /* Clock frequency (in Hz) of the rtcclk */
 #define RTCCLK_FREQ		1000000
diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
index cc3386068c2d..695c4e2807f5 100644
--- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
@@ -3,7 +3,6 @@
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
-#include "mpfs-fabric.dtsi"
 
 / {
 	#address-cells = <2>;
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
