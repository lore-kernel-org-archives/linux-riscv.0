Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E8BE77188
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Jan 2025 19:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=98JaADJ+1uaQRDuIslp4OHaUOZHxHYNivP30VhiGwm8=; b=Tl5wYmUrgyNqIh
	4u1xrxlbEMeKozSfBg5EYkuAYFwAPF/lGvyevdT/ufSDBabc56+DPErk843WigMnY2RCS7coQ5ov6
	mTrwv2asRbtGOUTsw223at9JWyK2L3BubzUWlX1kmrapXOJobj+QHepAG2Ljo438MMDD/Thx7W7jL
	qVuXwynJxvgo6eBu1jpyHc4aza0zzwLmZdhsgVhBw31EKGoagm3ifRZ+8xeY07kt1r17El9IiaP6W
	I+ESFfFMVLtVilnfzxKoTK6WJTTBR9VWN/weH/WwVDl17l5i2CLo9YoUIOE7Hoi4A9N3j1oLSDpHc
	dr/UhlBXSUGgqLrkwc+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR8w-0000000BIre-3krc;
	Thu, 02 Jan 2025 19:46:06 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTR8t-0000000BIpp-3dJm
	for linux-riscv@lists.infradead.org;
	Thu, 02 Jan 2025 19:46:05 +0000
Received: from hay.lan. (unknown [IPv6:2605:59c8:31de:bf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 5D19AB4B32A6;
	Thu,  2 Jan 2025 20:46:00 +0100 (CET)
From: E Shattow <e@freeshell.de>
To: Conor Dooley <conor@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org,
	E Shattow <e@freeshell.de>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [PATCH v1 2/5] riscv: dts: starfive: jh7110-common: qspi flash setting read-delay 2 cycles max 100MHz
Date: Thu,  2 Jan 2025 11:45:08 -0800
Message-ID: <20250102194530.418127-3-e@freeshell.de>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250102194530.418127-1-e@freeshell.de>
References: <20250102194530.418127-1-e@freeshell.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_114604_054245_77906645 
X-CRM114-Status: UNSURE (   8.21  )
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

Sync qspi flash setting to read-delay=2 and spi-max-frequency 100MHz for
better compatibility with operating system and downstream boot loader SPL
secondary program loader.

Signed-off-by: E Shattow <e@freeshell.de>
---
 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
index 55c6743100a7..651f9a602226 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
@@ -317,8 +317,8 @@ &qspi {
 	nor_flash: flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
-		cdns,read-delay = <5>;
-		spi-max-frequency = <12000000>;
+		cdns,read-delay = <2>;
+		spi-max-frequency = <100000000>;
 		cdns,tshsl-ns = <1>;
 		cdns,tsd2d-ns = <1>;
 		cdns,tchsh-ns = <1>;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
