Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E916C433F5
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Mar 2022 13:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2pP90PFoBWSMcWm3wJHD8VAZ+0iNaYNloE26/21K6aQ=; b=B+N7v0gfCAYgle
	ycwsFqAbOvJm3zJOwxytp8y/AoXUejq8JJkXmzfVQPyhAdlbZFWjoOQfJm95yquEGosNdn51hrsEF
	ASKCJKRpe9v3T1MuGulHizbqhD9dx3Xu6xcCaR8f53q1M+Bx0lKJhfF5NPu+BeAfS0FP+vOzJYXFV
	Rg2KbgYvaDjAjJasaMAvqJSqHeEkfJne8hDQg6MKIcamLBnPZ/oodTbp+CElwQ6ABiEDVFjR5AFlN
	e32AZkUZDpI3/ocyywK8sCZ71Lc7FthkZdFrFj8Yw9oPzWhbkK0yPdNt0UC/dHfnH5yQg599+Ln6H
	T9mv0xiyD1vur9dxdNWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nRZst-004Wyn-G7; Tue, 08 Mar 2022 13:28:15 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nRZsq-004Wxx-L2
 for linux-riscv@lists.infradead.org; Tue, 08 Mar 2022 13:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1646746092; x=1678282092;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=06BSW79PpLzz8xRt+pw4ezAbJ3FGZPI2u6RO89c2N/U=;
 b=ol8Crz7mKUAW+GSjq1COiZP2ctr51cWBk8NkDoiksFwsj2cZTBo6eCpO
 LH+DRgHGp0iq3pNA9A3dUqSNPh5SSM7/COkxfKnGNLMfq0O/g+bXgHq0o
 uCVXl+SG88ZideIZqcUrxWWijSXE+o3aXj8jFWlO/+W9kovHEBVaBRkBA
 lW0P2uD7Up9dNK/obj+nn79YavSa+4LVomFK535+0vZ5UP/5J3Oa9UJFE
 ujuaRldaMjEoGHj3Z/jiuGpFHAFv436Sz5WMpVzpYqWQdLJUnQFn/XhVn
 adFHQXowm1LUNREbRLrmJapqYEhQmSW+GdTH8MhjXFTM7leITIDdHjI5x A==;
X-IronPort-AV: E=Sophos;i="5.90,164,1643644800"; d="scan'208";a="306710023"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 08 Mar 2022 21:28:10 +0800
IronPort-SDR: mEF3nnlxcrIuaicRk//l8I+nXu2kCXAvt+BCfztPo+UopUHRYllbU+4+z3NWncyxPqNvUX/jCE
 dTafzVkruXWrNPJwQMo/+2Ak2Wrg5I5zBbVde3cCNK4JKpset9vIzHTI2hCPCO50DCOlJM6h6c
 c1C8ZblBnkCJQuRYg3gySViyjrAPooe/Mwxx7sxPBtWPRf/e5Jk3EfGPXjFdlc/iVSzHBlXjkY
 Kr1TcfpgQcmsAzXitjz14b90f3CCfBuZ5h5EL90k72ilLRsl+nY+SwbGlenpwQZmQaFhuyJoFM
 yzllMTxQKUq/n0Lg76DpHPm9
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Mar 2022 05:00:27 -0800
IronPort-SDR: Z7gJCKCql8GT2T4Kuh6FE7XBIZ6KcgsQn/2Dyh0MpaPBlrt/z+yEbGxh8LtkkIRzlNWfUEs/DE
 T9kxzT6VYsSJ8i21gmHvxikby16kYDd7I4uIU6jyLG7Ba97rzL91eGG9JlNjZruucVqdf6H5OH
 X+/MacvuqydWu0RmSSdi8f3Xyn/gD8Jc6Ju26ZJqEiAHkSMQwVujEkg0ndpvMCv6EQu2ziZ5C7
 6m2EWhBUXoCU0/fGH7l48Fnboy/JE5CDDhzVsAioVlsCfp2wdBD8Onm78XlY/8njKhHXbzM9dG
 kHI=
WDCIronportException: Internal
Received: from unknown (HELO x1-carbon.lan) ([10.225.164.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 08 Mar 2022 05:28:08 -0800
From: Niklas Cassel <Niklas.Cassel@wdc.com>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: damien.lemoal@opensource.wdc.com, Niklas Cassel <niklas.cassel@wdc.com>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH v2] riscv: dts: canaan: Fix SPI3 bus width
Date: Tue,  8 Mar 2022 14:28:05 +0100
Message-Id: <20220308132806.96095-1-Niklas.Cassel@wdc.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220308_052812_736114_06FCC16A 
X-CRM114-Status: GOOD (  10.12  )
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
Changes since v1:
-Add the new properties directly after spi-max-frequency for all DT board
 files.

 arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts  | 2 ++
 arch/riscv/boot/dts/canaan/sipeed_maix_dock.dts | 2 ++
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts   | 2 ++
 arch/riscv/boot/dts/canaan/sipeed_maixduino.dts | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
index 984872f3d3a9..b9e30df127fe 100644
--- a/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
+++ b/arch/riscv/boot/dts/canaan/sipeed_maix_bit.dts
@@ -203,6 +203,8 @@ flash@0 {
 		compatible = "jedec,spi-nor";
 		reg = <0>;
 		spi-max-frequency = <50000000>;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
 		m25p,fast-read;
 		broken-flash-reset;
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
