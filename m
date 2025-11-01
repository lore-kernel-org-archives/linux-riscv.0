Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA79CCF9F8
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 09:04:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wLZAa+aGBhAOuiMX8eZYw5Ob9a6y++vy5Y/HyzMHzjs=; b=PjmCdK3Z+6o3mx
	Rqma3kBZ/CkKDB1SbuOXyv6MM2D/g6xst/iGmYXKgheMZuF5uBolIvejXRzrFwpFNNQKzU9Ucm7Nv
	hou/eG1/vqlrSvwUkpJi8WdgWn3rcmQ6WCMapJgSIw8dWOD9G0irkJkhj7rAFS5QWKxbn6tnkLcHl
	ZR6GXmUbUCGvORk7RAlQJtlzgGn29Rf6mPPJVTzZhtu982W6URQ8Qi8V0Mfj0zP/8fD0IdNqKOmcm
	cNiUWKE2EvbeaxDUC42z6P9R24VXhdyLBb2nGAUkaiaTfBvYyONqAO5R+nyGJfuqWXcKscieDVtWQ
	mnP/NYoX1z9809+DW+9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF7Wr-00000007DEa-121c;
	Sat, 01 Nov 2025 09:04:09 +0000
Received: from out-173.mta1.migadu.com ([95.215.58.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF7Wn-00000007DC9-2d1G
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 09:04:07 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1761987831;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jL4/scEEwi4e7mOZI7uuOmCx+7fcglvb5U5Neoz+89g=;
	b=Yv6pYiC5r6tE1hrg3gHCTyG9Nkakvc9Hq/JvK9HlKRP9PmABcH5hLZS20SbHc9ysPJ8C9i
	+okkUlZIY+Wn9bRoNX8QHCKh/DGp+3TSaROOfUZJa/Ov18SalGILrE60f7hVe+W1XTKdev
	jxaEtvYvIIDINo5zdpH2bnZROug0Mf0=
From: Ze Huang <huang.ze@linux.dev>
Date: Sat, 01 Nov 2025 17:03:25 +0800
Subject: [PATCH 1/3] riscv: dts: spacemit: Add USB2 PHY node for K1
MIME-Version: 1.0
Message-Id: <20251101-k1-usb3dts-v1-1-dd2660e5740b@linux.dev>
References: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
In-Reply-To: <20251101-k1-usb3dts-v1-0-dd2660e5740b@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761987811; l=1011;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=iK6NFFg71Y3pBdM4TPnuBRO0crmy9qkQcmoBmFiBFnE=;
 b=G8YkVCNHulhtoJwbGg7NTInbtIZtNJD/kNzSn0M8Ufi7GxFVdPpXMgI8ACePRVhXoa3bepzzy
 vOq8XvE+3ZoC5GJRYPk5HtJwMcBI3Aot7fBXve+mKKiD6Iz4slbZNqN
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_020405_815864_AD3DDA85 
X-CRM114-Status: UNSURE (   7.52  )
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

K1's DWC3 USB 3.0 controller requires two separate PHYs to function:
the USB 3.0 combophy (for SuperSpeed) and a USB 2.0 PHY (for High-Speed,
Full-Speed, etc.).

Add node for this second USB 2.0 PHY (usbphy2).

Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 214216fdecd3..d4d3c6d88a29 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -359,6 +359,14 @@ syscon_rcpu2: system-controller@c0888000 {
 			#reset-cells = <1>;
 		};
 
+		usbphy2: phy@c0a30000 {
+			compatible = "spacemit,k1-usb2-phy";
+			reg = <0x0 0xc0a30000 0x0 0x200>;
+			clocks = <&syscon_apmu CLK_USB30>;
+			#phy-cells = <0>;
+			status = "disabled";
+		};
+
 		combo_phy: phy@c0b10000 {
 			compatible = "spacemit,k1-combo-phy";
 			reg = <0x0 0xc0b10000 0x0 0x1000>;

-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
