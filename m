Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4678FC5910
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Feb 2026 09:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ya9TPBoow0BPgvo8cezwHaAqIYVhOoaypLxuEAxBdpA=; b=fixryuMLuqTQ+f
	TihIq/TfSpEIqfl/e6kr/3yN6pWgrZ93p0BQ+wWSCe3GHdvVbyF6qLM7HbkXx+/09qC49uynOjbSk
	c4H6lBl1/2dKcSNtMu708gNzajjRZ1T2YUgA1c21BQ9sJfuwTePW3TDsDUe0F2sto59wzf9W6Q0jl
	2muNnH1rA3fNARLW3Rhc8aTdJtdHw/+JIDa4hlndjjWWQXXsMvK1n7IGl+DduPzsjUfgqns9SzeLD
	zFa5Jy+evfy0waylOcaDzzdV/VdVCw0E46CoOl4j+NZ1IurqAmYN2R13+A2mrj879JtFMl6oStf36
	iK4Xo40CPujc1EOV+A0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXm3-00000005pDB-1ZmP;
	Thu, 26 Feb 2026 09:35:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvXm2-00000005pCj-07UF
	for linux-riscv@lists.infradead.org;
	Thu, 26 Feb 2026 09:35:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18517600AA;
	Thu, 26 Feb 2026 09:35:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6A88C19423;
	Thu, 26 Feb 2026 09:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772098508;
	bh=nZoAG/AHgrRLPWFPuZBLaGkAy+EvSXlIPWoUqKxQB78=;
	h=From:Date:Subject:To:Cc:From;
	b=a6y1sbm68dMHKfvNAtLCUe1t/xibAQ2meXz7xeLsd5rLCegCkXZjY95llTyHf1aR6
	 PZGbaXKo9ffD0Z53ZA09aJhGMNu1E4bhqiVbct/vXuWA+gIlqutptFD+H0dbBCrKTj
	 XfeNR35Q5gN65vSNoslmLNFK1ck+BNtkuPw1P8CeAL36o8kNiNK6GYg/6WpzQxzHX6
	 +7nounLe+k/8gEgsaCt/0vb1yQy6iKUZrJ+5i2YzTqb6lnMSHvWiFhkgibytzdbirq
	 fviWgGR86sHSJ+SCfE4QOyUvOmPuBj1SbpRHL7ID07oaySXgE71a1OkyB1UwDxg/T1
	 l8UIiAlhyVDNA==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 26 Feb 2026 09:35:00 +0000
Subject: [PATCH] riscv: dts: spacemit: adapt regulator node name to
 preferred form
MIME-Version: 1.0
Message-Id: <20260226-02-k1-regulator-names-v1-1-e87695d50159@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMMToGkC/x3MQQqEMAxA0atI1hNos6joVWQWYUw1qHVIVQTx7
 haXb/H/BVlMJUNbXWByaNY1FfhPBb+R0yCofTGQo+CIAjrCyaPJsM+8rYaJF8kYqOZGoucYCEr
 7N4l6vt/ue98P8ySJB2cAAAA=
X-Change-ID: 20260226-02-k1-regulator-names-627a9ef1af62
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3164; i=dlan@kernel.org;
 h=from:subject:message-id; bh=nZoAG/AHgrRLPWFPuZBLaGkAy+EvSXlIPWoUqKxQB78=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpoBPGqE0mQhIlADJrWyaNKcuVJKGRqm+NeQHq9
 8y46aaHSOiJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaaATxhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1YDw//XGZxYpJhOKCIQWfvtntPeLPsGDRX1qoEjpRuTDLAjxh68cw7KLe5b
 1ynj0jaKEw/l45me9L0iQVI4kWQ/UAxkU1D4ATtcBR1RK8nBkYpNOud6MDd8dmZQz00d6pcPzDn
 EBYrTHaY/QoIAz+urTg8zXRltdMRliytxr0QlOfngsLC2IaK7fxjcvxidshN72cMQ1Ya9g+RvUx
 SOLbDWp3TTBzlSpxs/VGxA8Ryq4sFPSRfHm3V6LiH8laqTnZdhaR4+eVYb+ii1Ncx1Lm/Klu+Me
 q6AHtYGzm00pG2OCDvOVR0F1L9btUhwpGa4xw5RuD5/AffAfePmZQv/H/dMW6m5kftlddzzsYum
 nY8Lihd6M9psEiP5EybihzVBNhqrXpfPWLNwi6QlhMEjCIytCQL7QCQGUzylSN+sU3c2XwkSX2S
 7wKQrqmlRTM4h6ZzmO4TEttz4OrbVVNQ7NrLZVW8ZUkpOb+pXunqIM5zDSw4cM1o1oFEUzuEw10
 dHugK7rzo+x6W2n7dt2yPZ+DkehdvcHuNmiSWZD23lr//vStetICEtwSqCqfDAKfFOqNkqVqoxs
 qSsQUVJKLdPw1FnJfW7oW0Dt+Hr1W7IUq2ZuPQH10zELZJ4Y+i0KFNzC12sPBMDPDGpvG5uS2Lk
 fiTiUUlEP2W9QpcADlWW9e0KMMf6cU=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
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

The preferred node name for fixed-regulators has changed to pattern [1]:
 '^regulator(-[0-9]+v[0-9]+|-[0-9a-z-]+)?$'

Adjust all SpacemiT DT regulator node names to fix this.

Link: https://lore.kernel.org/r/20240426215147.3138211-1-robh@kernel.org [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
In Review of adding DTS for OrangePi, Chukun mentioned fixed-regulator
has preferred node names [1], so let's change it now.

This isn't strictly a bug, so I've not added the Fixes tag.

Link: https://lore.kernel.org/r/20260123145015.1926865-1-amadeus@jmu.edu.cn [1]
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 10 +++++-----
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  4 ++--
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 5971605754b3..d55f3e148ed2 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -33,7 +33,7 @@ led1 {
 		};
 	};
 
-	pcie_vcc_3v3: pcie-vcc3v3 {
+	pcie_vcc_3v3: regulator-pcie-vcc3v3 {
 		compatible = "regulator-fixed";
 		regulator-name = "PCIE_VCC3V3";
 		regulator-min-microvolt = <3300000>;
@@ -41,7 +41,7 @@ pcie_vcc_3v3: pcie-vcc3v3 {
 		regulator-always-on;
 	};
 
-	reg_dc_in: dc-in-12v {
+	reg_dc_in: regulator-dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
 		regulator-min-microvolt = <12000000>;
@@ -50,7 +50,7 @@ reg_dc_in: dc-in-12v {
 		regulator-always-on;
 	};
 
-	reg_vcc_4v: vcc-4v {
+	reg_vcc_4v: regulator-vcc-4v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_4v";
 		regulator-min-microvolt = <4000000>;
@@ -60,7 +60,7 @@ reg_vcc_4v: vcc-4v {
 		vin-supply = <&reg_dc_in>;
 	};
 
-	usb3-vbus-5v {
+	regulator-usb3-vbus-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "USB30_VBUS";
 		regulator-min-microvolt = <5000000>;
@@ -70,7 +70,7 @@ usb3-vbus-5v {
 		enable-active-high;
 	};
 
-	usb3_hub_5v: usb3-hub-5v {
+	usb3_hub_5v: regulator-usb3-hub-5v {
 		compatible = "regulator-fixed";
 		regulator-name = "USB30_HUB";
 		regulator-min-microvolt = <5000000>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index 800a112d5d70..931887aee8e0 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -21,7 +21,7 @@ chosen {
 		stdout-path = "serial0";
 	};
 
-	reg_dc_in: dc-in-12v {
+	reg_dc_in: regulator-dc-in-12v {
 		compatible = "regulator-fixed";
 		regulator-name = "dc_in_12v";
 		regulator-min-microvolt = <12000000>;
@@ -30,7 +30,7 @@ reg_dc_in: dc-in-12v {
 		regulator-always-on;
 	};
 
-	reg_vcc_4v: vcc-4v {
+	reg_vcc_4v: regulator-vcc-4v {
 		compatible = "regulator-fixed";
 		regulator-name = "vcc_4v";
 		regulator-min-microvolt = <4000000>;

---
base-commit: 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f
change-id: 20260226-02-k1-regulator-names-627a9ef1af62

Best regards,
-- 
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
