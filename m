Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93080C02192
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Feb 2025 01:42:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wUgnnqIZBxbjPclQXAB4TPrSHo2Pb26P2+GQhc08JYk=; b=0UYIgTde0ks96c
	R78bTj+0S/h9CrVr18tkI2R2Kxotl7EGdn8UCxfCtcCHIiFOcOKOyY/QqQVd6fYs72Sgsyuwf3KiM
	zaAk+jKFtqJ1OZgC9Csu5bbJ4j6fWDYPEL9yfRKIXLQkAOPZ/zZjMp/u7tlgy/VqYhMpmfGrVXq15
	hdcT1jt/reqOvLjK7yrM96sWpKCEHvMu6z4+w/FG2tAmBX840BLQ/9MKRBHloneFL6v9qKRg7TmTl
	9hI5RpmqTg9EtRb/H7va9BE2ar4l3JdX/CGut3UCKEvIBesaGO6qErd555UPmToPszY8nSV5SLJ9q
	9nJP/oIDVW9l1pYn05ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1telTO-0000000EOiH-1iIW;
	Mon, 03 Feb 2025 01:42:02 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1telTM-0000000EOhC-0Cum
	for linux-riscv@lists.infradead.org;
	Mon, 03 Feb 2025 01:42:01 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c0:20f3:a400:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 4F7DEB2268D3;
	Mon,  3 Feb 2025 02:41:55 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 3/5] riscv: dts: starfive: jh7110-common: assign 24MHz clock-frequency to uart0
Date: Sun,  2 Feb 2025 17:37:09 -0800
Message-ID: <20250203013730.269558-4-e@freeshell.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250203013730.269558-1-e@freeshell.de>
References: <20250203013730.269558-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_174200_231918_7C4B579C 
X-CRM114-Status: UNSURE (   5.97  )
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

Set uart0 clock-frequency for better compatibility with operating system
and downstream boot loader SPL secondary program loader.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 8a59c3001339..6bb13af82147 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -635,6 +635,7 @@ GPOEN_DISABLE,
 };
 
 &uart0 {
+	clock-frequency = <24000000>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_pins>;
 	status = "okay";
-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
