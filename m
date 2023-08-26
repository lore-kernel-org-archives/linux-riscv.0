Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C678C83F15
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Aug 2023 18:27:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2SB9eZtpA/3QeXj4Qx9qZzRfglh3LH18v0n1U8Cbrbg=; b=ejW0c30ITk1s26
	9CUlvKFtrYj2qmTYzOUN+uTi7kNvxkxJ6++JeXVckeWi1937fZeJD3QAfX2u4JppskjPaIp46xVcN
	bvtwAhHirPCQmtdaSkEZoZo54JrdN/PYhvXkPcwrhPHvfXDfUfMISJLCAkgQkEJvpUgotewg9PJNI
	o+tRGFZA7Fda29FUzlmXStXsYqffQ72SmySqjbmU/9gddMtt6NfXHFh3+xUQszVI/IZL7IOyfNgJA
	DW5QIG11Ie1Y5FxyAN1STjPjJb/z66o2K5wF06qP3KUTk5b/EJbTRfogZqJbXEUIyhvLdZ757F8G5
	DlFDdOFS+7wsuBDHQoJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZy0F-0077us-0o;
	Sat, 26 Aug 2023 18:27:19 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZy0C-0077tx-0q
	for linux-riscv@lists.infradead.org;
	Sat, 26 Aug 2023 18:27:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=NSzUijcZ/MgUsFtsx1EEVy2F3mZEyyGzlmPtWD+DEE8=; b=Bs9E3dPWJM6urKAmwdT9uCRujQ
	9/PKZTFXAeq9yfoPJdpp1q2c7lV4uvcyYMveTkQce6t0ZGn/2CMFy2ULKB/aTZhBRpVh17EkLJ1kR
	ukcP7UbbnpPO6FOQZI3JKgnviEBaynhenqfg4+kDfAaPIXC7Bh5BworGgrZ/EaKwYsNGbsoT06/23
	LlqyNEV4Sz68ypi1qaPVa7GXYZc6K8Im8NNRsJdwV5mA05ae/izD5Gf9Fc4VdSNrJX13D7U4x/tYp
	ZCqIYO7b7P+eL5oCEuHPhv6l3mIIALee9/OLMFAe9oi1XYJ1Gs8JdhyH3dqiZebMCpVwTXelTYWJ3
	MBWesq0w==;
Received: from [2a01:e34:ec5d:a741:9a7b:5831:531:65c9] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1qZy01-00AqTj-1Y; Sat, 26 Aug 2023 20:27:05 +0200
Received: from aurel32 by ohm.rr44.fr with local (Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1qZy00-00B5Ey-0m;
	Sat, 26 Aug 2023 20:27:04 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Ziv Xu <ziv.xu@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH] riscv: dts: starfive: fix NOR flash reserved-data partition size
Date: Sat, 26 Aug 2023 20:27:02 +0200
Message-Id: <20230826182702.2641743-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230826_112716_752107_A921AF9F 
X-CRM114-Status: GOOD (  12.76  )
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

The Starfive VisionFive 2 has a 16MiB NOR flash, while the reserved-data
partition is declared starting at address 0x600000 with a size of
0x1000000. This causes the kernel to output the following warning:

[   22.156589] mtd: partition "reserved-data" extends beyond the end of device "13010000.spi.0" -- size truncated to 0xa00000

It seems to be a confusion between the size of the partition and the end
address. Fix that by specifying the right size.

Fixes: 8384087a4223 ("riscv: dts: starfive: Add QSPI controller node for StarFive JH7110 SoC")
Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
---
 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
index 498eb179d90f..30c85ba6da02 100644
--- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
@@ -262,7 +262,7 @@ uboot@100000 {
 				reg = <0x100000 0x400000>;
 			};
 			reserved-data@600000 {
-				reg = <0x600000 0x1000000>;
+				reg = <0x600000 0xa00000>;
 			};
 		};
 	};
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
