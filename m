Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCAEE606A6BE
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 07:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=uOFT4jt1;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfV/mzuc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=bp8pell2FE0C62Zl/hMOGNfyb5Pb8ShRNfs9jUJIhgQ=; b=uOFT4jt1DYvpsbMAUlj9XlHUh7
	3B6dlKEwwjeAb/bqjwPQrw1Ku7U9NiyNk3iXbb2arXl9XdxUXupBENtOSrHRWu6Vs8TfiWvsnzOyh
	Og11L+qrpyF0KZnBFl615FPCU4oneLKIZlxHhI1+itjtK6KpFH/VHqVg1xEk1tNBLKye0eDSmcyMg
	dMKGcLJxTytuj91L8/llh9JQftZojy1z24ws64mttEGppagMx84V7nq3n61HtDRtOiiPmapyR/iwG
	CdvpSo+g7eSJEfBTkPFMsYzzTKY7trAsKbJLYdJpYiVzzDq57YYMLzXkkKG1FbCV3/XNqmNnr/SKz
	FFcbtywA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iJ-00000008vhP-0Iwa;
	Wed, 25 Nov 2026 07:46:47 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW7iG-00000008vg8-3uLA
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 07:46:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E9B44400B;
	Wed, 25 Nov 2026 07:46:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B49F1F000D4;
	Wed, 25 Nov 2026 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795592804;
	bh=gU/UcpSoePzAQUGjCNdjk4uCfDEDrO1+IvpBCE4O59k=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=YfV/mzuc2IioktAlU4ZSkT2pk+XOB2ke0a/tufs34x0/IxQV2ypubnIs+vxEGqPM0
	 XPOjdf3/8UU10YmpC49q5Ik8XnHXydeXQkjM2VBdI843e7vA/KDCI0AtdBg6GseH7C
	 xGzH6r+itNASJ3/Oo0QVl5MFYCS3OPsOsJhwFCaJwvsXghqyBJo213+p9gkjCWEhrq
	 e78l4wbV77kDMgeI5OdHX8t/5obtIIiEArRrYGO+5WWHLMdTKjsZK1XrFwWabUrLDX
	 /JomraxVtZsJPF3nOCrdnpsGDJcIgmW/ShbMke2IykLiq7a3Z3g7Kp4nj/NjlrT0uX
	 VgEO+vugJ/gYA==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 25 Nov 2026 07:46:15 +0000
Subject: [PATCH 2/4] riscv: dts: spacemit: k3: Use Pin Macro
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261125-09-k3-dt-minor-misc-v1-2-dd887a8eb326@kernel.org>
References: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
In-Reply-To: <20261125-09-k3-dt-minor-misc-v1-0-dd887a8eb326@kernel.org>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1958; i=dlan@kernel.org;
 h=from:subject:message-id; bh=NLfSqq53cy2/3tiAdAfEyPG/cXEbgeJoLVQyYeX+FXU=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBrBpJO1HPGHrHOa4+sCWp0aoIjf4FJeBPh0ePeS
 VAMxmAHAMOJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCawaSThsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3AJA//epbR8jRNKONG8DGeBdI6pFSea1fPSpdVgU8qQ0rQ3T3/bTpoQSN1M
 04P6PHq9m89BlO4q8G5s4tIvptF51gkYeefOR53Wn7+YQgbRlCs6OWA3TBoGTTM3OE7+ik0x70e
 BEELxY0CUSaGpB9PAglGAumASDKFVsK44CM8C8nk0lCCHkqWQrCfb964PXN8zYdGWtTujuFMZnO
 Rng9sze/d8GggKzk1IY2H98lrrM05IWBm7Inmk/dJ2sZabrmAYMZujY+OfNUUIfi06UOMWAQF8y
 eUhAjBX0NhDEdTwFcou0IRQ2BmwarAxNEsFAUwSNJh4YTa0Ml89PysA+VJaHBBGP5HbXXlZBjm+
 6UAU1oPG6fiu9/uofUiJgWBYlBjkR7zZ7Jub6p78wtNecTsHox8ojab/QF+MyGWdtWBPlYNtenJ
 nwD/aEe4d0tOQ2e6Od17KOxPQLHTrGbqE9h/fwuLVECMLJCCUxSubTPpXDk0CrZ6XGr1eb6YqFz
 W6qCXPe5s0IoSYWIhT4wZF35aHaPGAqLYki+Fw8zz7zhW/7b0kJh13Ks/l3KJVW3RCyt4VAld/E
 oYWzojxZACFjzsQ0Scl76uZ30uD7W9xFx/a2KbCdpPhCdvkLHDyjLcrstRvY5E8deiTRSirZYrT
 SJr3fmFan0FXsHUaVeOQ1V7xYrFlYs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Use Macro for the GPIO Pin definition, which match enumeration from
pinctrl driver and make people easy to grep for debugging purpose.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 arch/riscv/boot/dts/spacemit/k3-com260.dtsi  | 2 +-
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
index d8e94d538bf1..65c6f49f8591 100644
--- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
@@ -228,7 +228,7 @@ mdio {
 		phy1: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
-			reset-gpios = <&gpio 1 5 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpio K3_GPIO(37) GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <50000>;
 		};
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
index a4afe24130ae..a74e76ee75e4 100644
--- a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -48,14 +48,14 @@ rfkill-pcie-wlan {
 		compatible = "rfkill-gpio";
 		label = "rfkill-pcie-wlan";
 		radio-type = "wlan";
-		shutdown-gpios = <&gpio 1 3 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio K3_GPIO(35) GPIO_ACTIVE_HIGH>;
 	};
 
 	rfkill-usb-bt {
 		compatible = "rfkill-gpio";
 		label = "rfkill-usb-bt";
 		radio-type = "bluetooth";
-		shutdown-gpios = <&gpio 0 30 GPIO_ACTIVE_HIGH>;
+		shutdown-gpios = <&gpio K3_GPIO(30) GPIO_ACTIVE_HIGH>;
 	};
 };
 
@@ -250,7 +250,7 @@ mdio {
 		phy0: ethernet-phy@1 {
 			compatible = "ethernet-phy-id001c.c916";
 			reg = <1>;
-			reset-gpios = <&gpio 0 15 GPIO_ACTIVE_LOW>;
+			reset-gpios = <&gpio K3_GPIO(15) GPIO_ACTIVE_LOW>;
 			reset-assert-us = <10000>;
 			reset-deassert-us = <50000>;
 			realtek,aldps-enable;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
