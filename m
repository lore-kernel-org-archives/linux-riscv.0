Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FFA5CE9D48
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Jan 2026 12:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6JniaRpdbLkXkF/ufWoOwRlmzFyYUEvVyUcg4n3eIbk=; b=0fgZZX7yKFZUEL
	22RTdQxvjTGKFe3MfSeUS0Jomukserc5iO6AaBtUh2f6vOMCfUIQXPT4gYhQ0/ASzsYU/d74F3FVZ
	/HDfEROYEsBmBVzn7XNmSd7yMol4LzxcOORXfWe9NTSUZK0oIYxYrjzSWzRCHuR8wGEsfR17HjpGN
	Q5O+Qksh//A5T+KEqxIm8+i1X0i9yS/itKuppcOx/QFy0jU0/uKusGhQP4eD4IjCTYuhuDK0naJBn
	w99ze0+PRlPWKa3dWZv0whHEDmFSKL2z9bjY+yNLzDDzJQHC7YgLaXN3l3o9ww8CTCu3uaq23cRkP
	Hz6N+U/ueNS937srpK3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSIg-0000000Es76-1dUB;
	Wed, 07 Jan 2026 12:06:06 +0000
Received: from out-179.mta0.migadu.com ([2001:41d0:1004:224b::b3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdSId-0000000Es3b-3WJK
	for linux-riscv@lists.infradead.org;
	Wed, 07 Jan 2026 12:06:05 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1767787549;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=566hMGT2wOOA5i+sdnfFimS5EhXjb0N0TBNQUsy89Yo=;
	b=q4/nq7B6E4RcYURvpHQREu2j9zJUbPBVRCJ1Cu8AhJNwUvQ0rKBfCdum7ERsZ17j/WDTyG
	wW830z6gT7woKYuJc9sV483zDBSJVqs3Nqlll5Tz2XBVfO0+ESnnyztMUeMP8aeVB173Ey
	tRmQBcO8yn+dhiInQhPKeGTlMT58kf0=
From: Ze Huang <huang.ze@linux.dev>
Date: Wed, 07 Jan 2026 20:05:30 +0800
Subject: [PATCH v2 1/3] riscv: dts: spacemit: Add USB2 PHY node for K1
MIME-Version: 1.0
Message-Id: <20260107-k1-usb3dts-v2-v2-1-e659b0f8fe1a@linux.dev>
References: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
In-Reply-To: <20260107-k1-usb3dts-v2-v2-0-e659b0f8fe1a@linux.dev>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Ze Huang <huang.ze@linux.dev>, Aurelien Jarno <aurelien@aurel32.net>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1767787540; l=1040;
 i=huang.ze@linux.dev; s=20250705; h=from:subject:message-id;
 bh=OkFD2HGSr1MsKeR9yPZO9Cd8GOid74MlNIlt7D1ODFU=;
 b=HpdeK6+Nr+eUrCnN9iBwK47Glc0PqrEWYUV4cy9um0niaOAVYDCNVIK31PSF8S5DlTqm5lgu5
 aUMVIhbHbi3DN49MlZtmUgAjCn1Hrlqx+dkXKk8a8E7aDdsNOMLL1cF
X-Developer-Key: i=huang.ze@linux.dev; a=ed25519;
 pk=Kzc4PMu5PTo8eZZQ5xmTNL9jeXcQ9Wml0cs+vlQpBkg=
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_040604_028005_A5FCA1EA 
X-CRM114-Status: UNSURE (   7.48  )
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

Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Ze Huang <huang.ze@linux.dev>
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 86d1db14e2ee..b44149f4f076 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -424,6 +424,14 @@ i2c5: i2c@d4013800 {
 			status = "disabled";
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
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
