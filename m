Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C491AE77197
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 18:38:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ceGXBWncmMy3kZNzuhnHA4+B4P+dXsCvsI0HNqceGYE=; b=iBTPvf7x+JXB+y
	CMf0rs0SWWUhSND98CD0vOBg0Hen2O6Ter6aK+KnOqoWJx8zKsK0MdTnx251bxFJcHIqAnBtiL388
	kYFKUmGtPivTPpuefb/ahhZ9Mcv2flwaHJmXx2NJaDchUQytwebfzoIFz/Hjv3KkrquglDW7a8XSZ
	/b20oOgFpy4ol383lOjFUP73+9RdXexFpmZWze5i4gYT8NRmI73PuWrBKfIPQ+I+KWY29UI5xif+d
	GraeYafOZvRI8SJA6+wuIwjFGOB5xxy1MEuGIbhaAI2M+bk303CQhkM3KMxS1ACHkhgHTjEvWj5J2
	hF+eLl7CCbupSNhfIUew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQ5B-0000000BA8m-3f2x;
	Thu, 02 Jan 2025 18:38:09 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQ59-0000000BA7S-2Arg
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 18:38:08 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 35CB4B4B3E2F;
	Thu,  2 Jan 2025 19:38:04 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] riscv: dts: starfive: jh7110-pine64-star64: enable USB 3.0 port
Date: Thu,  2 Jan 2025 10:37:37 -0800
Message-ID: <20250102183746.411526-3-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102183746.411526-1-e@freeshell.de>
References: <20250102183746.411526-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_103807_703121_6A72F85B 
X-CRM114-Status: UNSURE (   7.66  )
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

One of four USB-A ports on the Pine64 Star64 is USB 3.0 which requires to
disable PCIE0 and change the mode of PCIE0 PHY to USB3.0 operation. The
remaining three USB-A ports are USB 2.0 with the USB0 PHY and do not
conflict with any of PCIE0 or PCIE1. PCIE1 (1-lane) routes to a PCIe X4
connector.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
index b764d4d92fd9..31e825be2065 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
+++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
@@ -100,3 +100,8 @@ &usb0 {
 	pinctrl-0 = <&usb0_pins>;
 	status = "okay";
 };
+
+&usb_cdns3 {
+	phys = <&usbphy0>, <&pciephy0>;
+	phy-names = "cdns3,usb2-phy", "cdns3,usb3-phy";
+};
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
