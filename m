Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9891C43327
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jul 2026 02:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+HPVZVkXNeLvYUmXaSOGH8YK6rFc3J+SbuIavxtZRk=; b=sie/f+0QEm5MBm
	GrTMqa2J3HzdYJ4ypK/0n42SrAKn2APWDg8uBFZvQ3kOuZJvvTJt9ex6NY5P+7fd7jyJpwzYpIpYL
	Z2Yxe1TZki4hiOXfPAZr4taoYEy5R1Gwt+EW0NrZQxMxSRR1JuElL6UOvQLP/fsZymA4UMRYX7Qhz
	k6U+NpTFplopPi3WkwqyMxo2mYiIxg8EzMzefLMXaAUXL/gdiTCFZdXShjyR4QFqY2U3Dweyz5f3t
	zdFBsRRu5CMH82sVhFsEWEiJV6iI3cBsvA4zX7AVUs5MpFyo286HZlqJ1QFw939mTjetOelv9AOig
	6tewc2BXZ21rg7GS36jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Du-00000003QUu-0Zj9;
	Thu, 02 Jul 2026 02:32:18 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf7Dt-00000003QUk-07LR
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jul 2026 02:32:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C723542DD2;
	Thu,  2 Jul 2026 02:32:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5F7A1F00A3E;
	Thu,  2 Jul 2026 02:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782959536;
	bh=emOkDmfG2STZLaSMkvxawB0ay9hEQME3tZW+Xh2U1o0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F8eR/NQJbBbyOWi84JCbK67dKVIqwbSwQVy63Secmnp9j6bvny6tIEAGPxi5YTZdz
	 h+sWl9JO+xDeBnEIWJj7NlB95s5Dw+zo8JSatzZTBC9KYVQuCGmjYI2H282YTORE+6
	 Rf8TkiQblKyAhNGq1rdduIdEnO5t6lHil2lDcPO6VTDioJmGnSIgQ3ZNhLa+4dB4JU
	 fJFn2QGgDfc1s65ItP5r/tpn3q/YhzpzQ83zR6v5rSBDkxauukBiiw+RkpUjQzcdT9
	 yA3cb9vZxE3SGSQ6aHgohUuMGWcfpbhcIWv9c/zj4ezN8QhedpgzEXwS/ChtkOTct2
	 0+SZL2+Lk418w==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 02 Jul 2026 02:31:37 +0000
Subject: [PATCH 3/3] riscv: dts: spacemit: k3: Add UFS support
MIME-Version: 1.0
Message-Id: <20260702-08-k3-ufs-support-v1-3-1a64a3ab128f@kernel.org>
References: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
In-Reply-To: <20260702-08-k3-ufs-support-v1-0-1a64a3ab128f@kernel.org>
To: Alim Akhtar <alim.akhtar@samsung.com>, 
 Avri Altman <avri.altman@sandisk.com>, Bart Van Assche <bvanassche@acm.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-scsi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=dlan@kernel.org;
 h=from:subject:message-id; bh=umn98I1DXmAMjrQ1TLwM14+BWqYWOVozRg/TMara5lQ=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqRc2awHZ2ozwoZE1YwXu2hLobFcHw29ROvi3BP
 BgYHyjrBXOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCakXNmhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1dog//VswC+e+1V9gsErZaaIJb00liG5Li36yDIYzoVmd1oJ1/OwFI1iYEA
 fjS2uXEjkXQckX5WjxVVPjade78H0kpKk/0fCEMby5/d9l5jMXFIB3g/uzwIfFXzWRG4BUsHiCJ
 +Xzt/bNWmGeSNYmhbb/5KAmfK4loF+zOfJOCQcBiCHYCDQ1Sf79dIcTs7Qx9z9+Im2f0Vii45h2
 stnoYIgO5nqF58lai2HHnAAqRWQWkDoy0dg+f0xEmsvte+FZAkfcX1osMBcdO3IAKnPTJHSntlA
 zb69/+JXa+d8gVR98P0RZE8wJ87qY6uU+Z4oVOwx8B+/vHN4jzglmvwsQdtXUBHRTPsI7+r2mLZ
 TNsYPFGHsjqEE+p8bXfUI6T2/fuET1aEhDyD4AmAlkUpJcqjHMEMSfQDObNlk07XFpwxuCG231D
 fM0DaH8x+8z1fbL89K8YblIq+w5LTdEE/bZodwlo7oNHfjn8TTukeZrkx9GYsPGAZwnLp9Hb4gq
 pAVzB11apYEQF7n2XzpMfHuq6JyaEGoD5iVSLCNBGvV3gx7WbwNLHqQF4lg9SD+dcqV8qNobVzG
 a2/qdT60NoJaKr7ZWDyTEa8A2KK1AQlD3Z7ywtSDxwEIxwCn/6mUel5O+GTDM+Er7FT07YFMJ1Z
 YakhxHWtKm7cE+ppgYOMbePsvqUWcw=
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

Add UFS Host Controller support for SpacemiT K3 SoC, and enable
it both on both Pico-ITX and CoM260-IFX boards.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts |  4 ++++
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts   |  4 ++++
 arch/riscv/boot/dts/spacemit/k3.dtsi           | 13 +++++++++++++
 3 files changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
index 238bb03d0e9e..b37e1c7b03e3 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
@@ -19,3 +19,7 @@ chosen {
 		stdout-path = "serial0:115200n8";
 	};
 };
+
+&ufshc {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index b89c1521e664..f1560a5a9031 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -221,3 +221,7 @@ hub@1 {
 &usb2_phy {
 	status = "okay";
 };
+
+&ufshc {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
index 19fc9b49668e..6c0b0598d5c8 100644
--- a/arch/riscv/boot/dts/spacemit/k3.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
@@ -1186,5 +1186,18 @@ maplic: interrupt-controller@f1800000 {
 			riscv,num-sources = <512>;
 			status = "reserved";
 		};
+
+		ufshc: ufshc@c0e00000 {
+			compatible = "spacemit,k3-ufshc";
+			reg = <0x0 0xc0e00000 0x0 0x40000>;
+			clocks = <&syscon_apmu CLK_APMU_UFS_ACLK>,
+				 <&syscon_apmu CLK_APMU_UFS_REFCLK>;
+			clock-names = "aclk", "ref_clk";
+			resets = <&syscon_apmu RESET_APMU_UFS_ACLK>;
+			interrupts = <135 IRQ_TYPE_LEVEL_HIGH>;
+			freq-table-hz = <491520000 491520000 19200000 19200000>;
+			lanes-per-direction = <2>;
+			status = "disabled";
+		};
 	};
 };

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
