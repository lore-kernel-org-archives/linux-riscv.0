Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 091F5CD343F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 May 2026 02:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4VC6CxxacGIMudW6h8ypkkrZRNO/xvKZjNFjadlEMP8=; b=M8tpXnZuxoF73K
	i+jJo+DXR9OeI0MUJUjp7i5+14SxC2+p1WYkBMjtQlYjGElNiThSnIowalen6k71jrSdG77W/KT1A
	ZDdt58DfaNiL8RKGTq3liQRyiBDkJQ7+e+XrKc/+ui9pWHw+T8C84u5gm4Rq3Zu+ilS9njS46Gvkl
	zUNFRUgoNa6Mj0eZXo4W/FLBC2iq51dEgYEz7nNiU4FCeOBFt7tW8NJB+SBbgVhBXrnfUPCchXqPG
	p1EYRqP3mCi2B9ebKaObPlnRwP05wPOmTs+FBs13pPeaJFX9iu36Gp5YljWU4Ez/uchTVQwnE6WmN
	mzvK7uMvxYSSyiPkgcfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMz7p-00000000uxC-2LZi;
	Wed, 13 May 2026 02:15:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMz7n-00000000uwm-21R2
	for linux-riscv@lists.infradead.org;
	Wed, 13 May 2026 02:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9AA7A43E4B;
	Wed, 13 May 2026 02:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87009C2BCB0;
	Wed, 13 May 2026 02:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778638502;
	bh=wiy0UXQU4cH21IakzRIDWTSzueLEt8syIqO1JauQqW8=;
	h=From:Date:Subject:To:Cc:From;
	b=WKrBUTRGAATUFJ8ot3z9w6M1JLLt25xt2Xo52UvmCS6WmvSd/K/adAj0QizF5jP9D
	 /ezWDB96v6pckR6yxZLjw7E9eb0xa88ePyPUTc9OBmAxerCWHo51UhA82TqAZ5nm33
	 Oj7Qib9mrnNgtq1XvzM+9ZVw50FRxMefTP/wYFoipO8sX1jC90rateW+f1eOcBhL+6
	 SWq9/JlmWxAhWblUzVeMPvs/BAh7sxcjlZzWVuv4cghOzHCMcbWcojqlZf79ehSutg
	 BYUSBDr+A2hVa6SZ5oUjTPgCbhbBu7q02q/nzXX2sVl4WUGQnktVM5Eb/ya5n9wE2H
	 Lqv2UyrnuUu3g==
From: Yixun Lan <dlan@kernel.org>
Date: Wed, 13 May 2026 02:14:51 +0000
Subject: [PATCH] riscv: dts: spacemit: drop unnecessary power supply from
 PCIe
MIME-Version: 1.0
Message-Id: <20260513-k1-pcie-fix-supply-v1-1-4eecbdd44ebe@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJreA2oC/yXMQQqDMBCF4avIrB1IgkrxKsWFZsZ2WrEho6KId
 zfa5cfj/TsoR2GFOtsh8iIqvzHB5hn4dzu+GIWSwRlXmdI6/FoMXhh7WVHnEIYNybq+otLQgwp
 IxxA5rXf02fytc/dhP10lOI4T2tGImHYAAAA=
X-Change-ID: 20260512-k1-pcie-fix-supply-d12f6d50d8d4
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Chukun Pan <amadeus@jmu.edu.cn>, Andre Heider <a.heider@gmail.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=dlan@kernel.org;
 h=from:subject:message-id; bh=wiy0UXQU4cH21IakzRIDWTSzueLEt8syIqO1JauQqW8=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqA96gcO3vBt/WSHDDkldf2wLPX8Qt/cwZh1aWh
 Nx7BAjJQ+SJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagPeoBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+04og//UEc6qtizp+oinUkZVzm/deUuIO47KqkLuVS73EOd0YlKsDUburcSg
 0MLwMAyhMvqrpzbofJTDA769TGDuXgDqV1/GdRCcmpNTkC87K1bQyUv5Sp95xfSn8tjQGsthLWS
 5wTM5xvE5dMTT7pqkn9/InomOKOsC0keXyidyXKHiFwvG4sqtZBYwaKiQtc3WTzLXt43d3bVDhE
 ygUaNQjylpQxavhCgJTii2b85O9jr6HoQJXhzDfTysQL5qT3eg1CBVhQ4+tRUrwtH7zHaIPlNR8
 iJQnPouA+ON+jygVKkISShtdsyEb3OKZLaRkd+S2rq7+NddFYzzJRFegSvegPmM4S+adTH9jJJT
 PEVzkitkfSRI6zQGtDoWwUJG61Dj+duW1ugUD7FDVwr4qmyhZHPAPndSXcytY/7DVImYviFtaux
 g3JjUr1YcvPUYj3eg6I2PXVstathkHAtOCpzx1lLdC70z2PFYBA2UGrk6UvkvqNNwz05rYo+Od8
 W/UGBz7pGhDmu1WxRHg5Rofr2CK6rGkRZqJWWcVmS3oliQmSf1A2iRwKeW1YGKxqUdkTnPo7Nyl
 s65cQiswV2Wu007BskB/f9+vWVwfAtABMN1HK7usQQ0lJFxuYyufEBx3LURyMhwDyRf5x73TTuy
 tk/zwFpHGZNa24ecKzVcRW9zTxSTDk=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_191503_567265_B065C35E 
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

The PCIe Root Complex found on the SpacemiT K1 SoC does not require
external power supply, this match with the dt-binding documentation[1],
Instead it's the sub node of PCIe ports which should add vpcie3v3 power
supply. So, explicitly remove "vpcie3v3-supply" property from the PCIe
controller.

Link: https://lore.kernel.org/all/20251113214540.2623070-4-elder@riscstar.com/ [1]
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
The problem was introduced at the time of PCIe DTS first committed to
kernel, the vpcie3v3-supply should be added to PCIe ports instead of PCIe
RC node.

Refer the example dts of Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml

I'm not adding the Fixes tag, as this doesn't cause any severe bug, thus
not necessary to do the back port..
---
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 2 --
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 2 --
 2 files changed, 4 deletions(-)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index e20daa50a152..c70081856606 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -316,7 +316,6 @@ &pcie1_port {
 };
 
 &pcie1 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
 	status = "okay";
 };
 
@@ -332,7 +331,6 @@ &pcie2_port {
 };
 
 &pcie2 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
 	status = "okay";
 };
 
diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
index afaad59e6bce..7e5915023eaa 100644
--- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
@@ -313,7 +313,6 @@ &pcie1_port {
 };
 
 &pcie1 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
 	status = "okay";
 };
 
@@ -329,7 +328,6 @@ &pcie2_port {
 };
 
 &pcie2 {
-	vpcie3v3-supply = <&pcie_vcc_3v3>;
 	status = "okay";
 };
 

---
base-commit: f068b204555ad62d6a841a49feb4ea8c4f45b25c
change-id: 20260512-k1-pcie-fix-supply-d12f6d50d8d4

Best regards,
--  
Yixun Lan <dlan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
