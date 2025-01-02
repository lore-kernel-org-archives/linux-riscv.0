Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAC74E77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 18:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1GxJ3n0lMFHr7xgdCIcgztt+tHj19JwGgkpH8n4qCq8=; b=usuGHG16R+tBRa
	lY5k5ey9ml8r+7SYKsHydXbB1Rx9/902a4zTUCsvxXgoEOJGPzfIjBTdSz4SBrZr3+LANfSUbb47H
	G/XajgW9xaaTM9PbhGJtwF5CCdYCrXkQko8n03/QXQkkf0ZElZAll6n06jzSec82m4gM5RRklA7cd
	9G9ij1xZiqMK4wUIUP1EHJBsmqjY1nI+URoRALE/4u9xYFK7Eg3Ybw90CpvA98dlU9p0hlVuzDN59
	f7uJahqqNmcZMTU0HBs1xZJXw9xk2x/97/K39HjwPZvWTa+ThhAp85p4oA2qEVOvA/oDrdAEohfCd
	CibWbN/TuJqLoRmbr+XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQ57-0000000BA6B-0veC;
	Thu, 02 Jan 2025 18:38:05 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTQ55-0000000BA5M-0NBW
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 18:38:04 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B4D91B4B3DFD;
	Thu,  2 Jan 2025 19:37:58 +0100 (CET)
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
Subject: [PATCH v1 1/2] riscv: dts: starfive: jh7110: pciephy0 USB 3.0 configuration registers
Date: Thu,  2 Jan 2025 10:37:36 -0800
Message-ID: <20250102183746.411526-2-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102183746.411526-1-e@freeshell.de>
References: <20250102183746.411526-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_103803_270853_4D5861C6 
X-CRM114-Status: UNSURE (   7.83  )
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

StarFive JH7110 contains a Cadence USB2.0+USB3.0 controller IP block that
may exclusively use pciephy0 for USB3.0 connectivity. Add the register
offsets for the driver to enable/disable USB3.0 on pciephy0.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index 0d8339357bad..75ff07303e8b 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -611,6 +611,8 @@ usbphy0: phy@10200000 {
 		pciephy0: phy@10210000 {
 			compatible = "starfive,jh7110-pcie-phy";
 			reg = <0x0 0x10210000 0x0 0x10000>;
+			starfive,sys-syscon = <&sys_syscon 0x18>;
+			starfive,stg-syscon = <&stg_syscon 0x148 0x1f4>;
 			#phy-cells = <0>;
 		};
 
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
