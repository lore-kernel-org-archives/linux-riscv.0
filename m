Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC3F3C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 13:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ORwQeJqJVwUyFt7QX0rbcJ9BZ8nw809w3vThMJauQFY=; b=3DVrcVdM4PSCKD
	7ZVgRQYVFKGg0g8q+cLLFpSDAJrGTNnO+j6p4fH93t1RMo+HKqYqyAg0E8LCOfei/3ZvGOCtaTu+5
	QGH6y1qnWezp8F+oSjf6SZxKIO7UEYXXkyz6x6Xc5lkGRjGrF8GIQK4nHUngelrY7klEJpHIEqq2e
	4jR2X0++m227TFhBQnW+zzmYFfLGHSHUvHDajWHoD5V6Nov2zRiCQ04gnmCWpmMBx6Avr9Rf56S1k
	fD8kMPvdJE2LOXhz5yCeN59Vy37XUU0GngRKEPqMk1sxk88dzCj+m490K3AQFHMKMZHvXEj8UnSKx
	PFNfaN9h/HKMGv+UiRoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRZht-004UGD-Gc; Tue, 08 Mar 2022 13:16:53 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRZhq-004UF1-GY
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 13:16:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646745411; x=1678281411;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZP3bLw7WQ/HhvaI9yMpHfJIa+2/cxLdLg1awgjT8VpI=;
 b=H4DJlLxJ5eCHCamMsUeRb+fctAqTXzugHWVfwWbq3b0uUfZOvqu8mtTN
 0b6+5qN0hEpOT6GlfTbdVwtxw/c5CzW7VMpf/XBQpibdCyPAKLuCMCT/w
 tmd/j1EY3Hg4hBKzQOSYI+1RDjVTiqPLLQZ3E7oW1/+yDC3h+8kATmJI+
 gwwba8AKxuiPIjC/AcERyykeJAFDNQEkBegNC2hiawKqQW7WQM1Sw3FMA
 eRo5uB1NYQAO5CqkZIpsMxTBqm7wiWQD7pXP5m5EX/m/aKCrIUvO/ikMV
 5to4kIFvQC3ksycPhkPvKJmQGG4g5tqNh9uZ5zVXqpPNVBuewF1toa7dN g==;
X-IronPort-AV: E=Sophos;i="5.90,164,1643644800"; d="scan'208";a="195710041"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Mar 2022 21:16:48 +0800
IronPort-SDR: NiHLOCiGzrB+Rj5ZxiMvfBJ1vWffHdyGnfbR7/+iI1yUkKnzjRXbsJY4hq0uJOQ1T13po+WS7m
 VKcOpqoFyp7VPywHH+B6zrQvLZqV92GFo6Z0IKJMRPXJaLyK8mNGkTaRmfW7u8D/3o2YAj5JNw
 Zonw6/X7MpbuKJR4jXmpagbHSvrHfH6/UoX/Mp25fDqqXDdxuqutzX5OF6fHIp8ET4i4kCDw06
 BgPvNK5qj8KBh4rbaDK1t+EtmQ2pL6E1DVilxac3JMNqJczf6rhFIVJhKO2ighAEfy3SmFcXSE
 aJ5TP0loQIpLDVyffytWkwpP
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 04:49:04 -0800
IronPort-SDR: cl4pNCkaoF5QL7TzeeRusgtT0wbXl2dhf9SoGKE9/kzNKlxGWUi8KYbZ5pKI78loYn9MXHAKl9
 1r9GV4HFd6G95WCe08LR9eSvgfA181OvdrXItrIZubXB7wX4qDJKl1dvOpanX1XZqpCgdXsYNk
 s3A0ndivOeFpUSovOk8MYrhKcOqhzFwCJEH9vzJWZ635LBO0qJJlU+DjM/o82wmWaRU2rKDhbI
 +Ol7KLlhVhY5kTCxWvjO9MtLTyyKjHPfDLo7M/FQbucmhKUbYz4/y9BQOQ+fV4u/mklm78gFMA
 dro=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Mar 2022 05:16:45 -0800
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: damien.lemoal@opensource.wdc.com, Niklas Cassel <niklas.cassel@wdc.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: dts: canaan: Fix SPI3 bus width
Date: Tue,  8 Mar 2022 14:16:42 +0100
Message-Id: <20220308131642.95374-1-Niklas.Cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_051650_661345_8A542400 
X-CRM114-Status: GOOD (  11.35  )
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

From: Niklas Cassel <niklas.cassel@wdc.com>

According to the K210 Standalone SDK Programming guide:
https://canaan-creative.com/wp-content/uploads/2020/03/kendryte_standalone_programming_guide_20190311144158_en.pdf

Section 15.4.3.3:
SPI0 and SPI1 supports: standard, dual, quad and octal transfers.
SPI3 supports: standard, dual and quad transfers (octal is not supported).

In order to support quad transfers (Quad SPI), SPI3 must have four IO wires
connected to the SPI flash.

Update the device tree to specify the correct bus width.

Tested on maix bit, maix dock and maixduino, which all have the same
SPI flash (gd25lq128d) connected to SPI3. maix go is untested, but it
would not make sense for this k210 board to be designed differently.

Signed-off-by: Niklas Cassel <niklas.cassel@wdc.com>
---
 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 ++
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 ++
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 2 ++
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
index 984872f3d3a9..ff71ec35f4e4 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
@@ -204,6 +204,8 @@ flash@0 {
 		reg = <0>;
 		spi-max-frequency = <50000000>;
 		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 		broken-flash-reset;
 	};
 };
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
index 7ba99b4da304..8d23401b0bbb 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts
@@ -205,6 +205,8 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 		m25p,fast-read;
 		broken-flash-reset;
 	};
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
index be9b12c9b374..24fd83b43d9d 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_go.dts
@@ -213,6 +213,8 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 		m25p,fast-read;
 		broken-flash-reset;
 	};
diff --git a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
index 031c0c28f819..25341f38292a 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maixduino.dts
@@ -178,6 +178,8 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 		m25p,fast-read;
 		broken-flash-reset;
 	};
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
