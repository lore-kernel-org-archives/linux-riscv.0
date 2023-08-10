Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AEA3C001DE
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Aug 2023 07:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=POsVaqz4dJyryroE9DNRpoduGdWpCJ0q/cfTOJnRk4Y=; b=N/yfr0KM+3N0IC
	cjyaE8BaxVyI/JpC2E83kNq2rv2qAjvejwchIh423gcXHCV7HV/UPMuCzKvQaX08sEK1dJAcO9T5Z
	HayxUSmrKTVyaj/uifPz6/Jq5WvkSHQnQDqfaYgoEDLbm3jQ3suEqT+7FTajbZhbiRdKWfi3ryMaN
	tMXatccSM1+eb3GnRT1VfRkedYyodcZ+rX6YFxsd/SNNM6oYbnrySowbjw7WqXaAQwIcgZcHmw7Cl
	ovHGFC8v5O8FcBqtee0DdwgCeLEmEeBJMI/EQ+gIRheNeuOQBvEqSW5qmqI9M212n5KWjdfX1iQ30
	tbK7OLqiK0/CA4+KyOGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0OU-006mcP-1d;
	Thu, 10 Aug 2023 07:47:42 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qU0OP-006mVV-2P
	for linux-riscv@lists.infradead.org;
	Thu, 10 Aug 2023 07:47:40 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id A31FA8567;
	Thu, 10 Aug 2023 15:46:48 +0800 (CST)
Received: from EXMBX062.cuchost.com (172.16.6.62) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 10 Aug
 2023 15:46:48 +0800
Received: from starfive-sdk.starfivetech.com (171.223.208.138) by
 EXMBX062.cuchost.com (172.16.6.62) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 10 Aug 2023 15:46:47 +0800
From: Samin Guo <samin.guo@starfivetech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>
CC: Emil Renner Berthing <kernel@esmil.dk>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Samin Guo <samin.guo@starfivetech.com>, Hal Feng
	<hal.feng@starfivetech.com>
Subject: [-next v1 1/1] riscv: dts: starfive: jh7110: Fix GMAC configuration
Date: Thu, 10 Aug 2023 15:46:46 +0800
Message-ID: <20230810074646.19076-2-samin.guo@starfivetech.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230810074646.19076-1-samin.guo@starfivetech.com>
References: <20230810074646.19076-1-samin.guo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX062.cuchost.com
 (172.16.6.62)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230810_004738_145222_7BADDE96 
X-CRM114-Status: UNSURE (   9.84  )
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

Fixed configuration to improve the speed of TCP RX.

Before:
  # iperf3 -s
  -----------------------------------------------------------
  Server listening on 5201 (test #1)
  -----------------------------------------------------------
  Accepted connection from 192.168.1.4, port 47604
  [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47612
  [ ID] Interval           Transfer     Bitrate
  [  5]   0.00-1.00   sec  36.3 MBytes   305 Mbits/sec
  [  5]   1.00-2.00   sec  35.6 MBytes   299 Mbits/sec
  [  5]   2.00-3.00   sec  36.5 MBytes   306 Mbits/sec
  [  5]   3.00-4.00   sec  36.5 MBytes   306 Mbits/sec
  [  5]   4.00-5.00   sec  35.7 MBytes   300 Mbits/sec
  [  5]   5.00-6.00   sec  35.4 MBytes   297 Mbits/sec
  [  5]   6.00-7.00   sec  37.1 MBytes   311 Mbits/sec
  [  5]   7.00-8.00   sec  35.6 MBytes   298 Mbits/sec
  [  5]   8.00-9.00   sec  36.4 MBytes   305 Mbits/sec
  [  5]   9.00-10.00  sec  36.3 MBytes   304 Mbits/sec
  - - - - - - - - - - - - - - - - - - - - - - - - -
  [ ID] Interval           Transfer     Bitrate
  [  5]   0.00-10.00  sec   361 MBytes   303 Mbits/sec        receiver

After:
  # iperf3 -s
  -----------------------------------------------------------
  Server listening on 5201 (test #1)
  -----------------------------------------------------------
  Accepted connection from 192.168.1.4, port 47710
  [  5] local 192.168.1.3 port 5201 connected to 192.168.1.4 port 47720
  [ ID] Interval           Transfer     Bitrate
  [  5]   0.00-1.00   sec   111 MBytes   932 Mbits/sec
  [  5]   1.00-2.00   sec   111 MBytes   934 Mbits/sec
  [  5]   2.00-3.00   sec   111 MBytes   934 Mbits/sec
  [  5]   3.00-4.00   sec   111 MBytes   934 Mbits/sec
  [  5]   4.00-5.00   sec   111 MBytes   934 Mbits/sec
  [  5]   5.00-6.00   sec   111 MBytes   935 Mbits/sec
  [  5]   6.00-7.00   sec   111 MBytes   934 Mbits/sec
  [  5]   7.00-8.00   sec   111 MBytes   935 Mbits/sec
  [  5]   8.00-9.00   sec   111 MBytes   934 Mbits/sec
  [  5]   9.00-10.00  sec   111 MBytes   934 Mbits/sec
  [  5]  10.00-10.00  sec   167 KBytes   933 Mbits/sec
  - - - - - - - - - - - - - - - - - - - - - - - - -
  [ ID] Interval           Transfer     Bitrate
  [  5]   0.00-10.00  sec  1.09 GBytes   934 Mbits/sec        receiver

Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index a608433200e8..76884cf373bf 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -318,8 +318,8 @@

 	stmmac_axi_setup: stmmac-axi-config {
 		snps,lpi_en;
-		snps,wr_osr_lmt = <4>;
-		snps,rd_osr_lmt = <4>;
+		snps,wr_osr_lmt = <0xf>;
+		snps,rd_osr_lmt = <0xf>;
 		snps,blen = <256 128 64 32 0 0 0>;
 	};

@@ -839,7 +839,7 @@
 			rx-fifo-depth = <2048>;
 			tx-fifo-depth = <2048>;
 			snps,multicast-filter-bins = <64>;
-			snps,perfect-filter-entries = <8>;
+			snps,perfect-filter-entries = <256>;
 			snps,fixed-burst;
 			snps,no-pbl-x8;
 			snps,force_thresh_dma_mode;
@@ -870,7 +870,7 @@
 			rx-fifo-depth = <2048>;
 			tx-fifo-depth = <2048>;
 			snps,multicast-filter-bins = <64>;
-			snps,perfect-filter-entries = <8>;
+			snps,perfect-filter-entries = <256>;
 			snps,fixed-burst;
 			snps,no-pbl-x8;
 			snps,force_thresh_dma_mode;
--
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
