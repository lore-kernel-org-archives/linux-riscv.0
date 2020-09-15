Return-Path: <SRS0=oZWO=CY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D576C433E2
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 12:55:27 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A4F7D20756
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2020 12:55:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="zJSr5hMm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="PtJP3RCR"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A4F7D20756
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6JAUBLOcqqiWDmKvn5vyM6ZUNo/OPgFN0ZP5zh1kAkw=; b=zJSr5hMm3bG9w0XpvEf5GtctFf
	V0wH7WVvgZWocVQLhdmvcDEpC8G39HiSVxMCkXHHDnXTHE3Pdxda5ecPlRuh1UnFCaVBmy7HnyHZW
	yFE06fMfeHyNirb/K5yOXBRBL3EZyxFrMXxlL8sFQBbvCE9agWcZQX9mnQocfQAjJI9W+V1WSQQYn
	eBpIImKsBRRO0pi4t9sLZ/fAtskxssrYLB8y6RU8lnggm6JAAftKaSS2PAAweVi4K1nWmfDtSEfeX
	mNj/5MsA5uJhL1mErhlGU84gY+E73c4JXdhoqqj5YqPM5eTQp6Bir7jtfGs2wQ61Kn3I6BQo7eSui
	WZut5deA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kIAUI-0005Mb-Cj; Tue, 15 Sep 2020 12:55:10 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kIAUF-0005LZ-TS
 for linux-riscv@lists.infradead.org; Tue, 15 Sep 2020 12:55:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600174509; x=1631710509;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=Ljy8/0JEkp5gjlDLw8UevT0oEsQ1dej1NE0oGKW54VA=;
 b=PtJP3RCR9MQuGssX49IdrMieGY77ysd4gCDxJ8I9woX5SEkgQt2lTIa1
 6fUNwJImAed6RyHicr7+Not423GIiIPLWSGz8N3GqJHEIjb1JUTWK5Ode
 0w/59Yslh5PHSo43ujDO7n/68dY+5YbOzEfKP4RSfRb6I1RT5azJ1LTSi
 jwezcsBxK+ywBvB+NAqnaoBGO9NAdB8cOozPSehjoRGVzNJ51R44W7nE/
 kBRirci/8HHMCUmwCRHX1Wgk+VwIBCYQ8A9c20LtXoRwveoUBKM/jRP70
 3uSOAz7PrC+y3pZAuAXIcKEu7aD1i8dUxGdbYdrjCDw2ALOu9OgaE/YQL Q==;
IronPort-SDR: vvPJabUmFaOY0nhv3/DeowFx15+iFVmZHxRU9BAF1SnSVTomhukawLgQVID4dCN/kftaBZYTFq
 DxrhAS/APPniSQHiPztL41U9KqmNJlHL2wQCVTvXKOaERsuOXlX2mdqZPKGFHM8c/dyyLSdqFx
 /LdYUpMEJr680djPbpJfB2zP4hKA+MZ5xZclLmNANvQeR7aJMLsvENmtKj1Ftp/vo3aXSu01fe
 2tbb7i7ZXHEggZH08mAczFRXWrHlcLOZagb1W+sBtN8TMj4sq0e9o4by084xlTuusbW4YlplqH
 smE=
X-IronPort-AV: E=Sophos;i="5.76,430,1592841600"; d="scan'208";a="151784801"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Sep 2020 20:55:05 +0800
IronPort-SDR: 86ZZnFn3KnGS+EOZ/0bxBnBA21UNO1caklQYT/jJRt3XeDCZju/9gGZlIh/4zLCvT0Hh41qE65
 BrzvHJ5MLpNQ==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2020 05:42:15 -0700
IronPort-SDR: hG+Aq4FWqwnFSA4MDi681JeeRKjlHq999MUlV7DnetjJWYyyzYfwih7GRC/98fpy/EqIqdQXY7
 COOugnJeQtuA==
WDCIronportException: Internal
Received: from phd004834.ad.shared (HELO localhost.hgst.com) ([10.84.70.155])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Sep 2020 05:55:03 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH] riscv: Fix Kendryte K210 device tree
Date: Tue, 15 Sep 2020 21:55:01 +0900
Message-Id: <20200915125501.110326-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200915_085508_179665_EE29BE81 
X-CRM114-Status: GOOD (  10.49  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <Anup.Patel@wdc.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The Kendryte K210 SoC CLINT is compatible with Sifive clint v0
(sifive,clint0). Fix the Kendryte K210 device tree clint entry to be
inline with the sifive timer definition documented in
Documentation/devicetree/bindings/timer/sifive,clint.yaml. Rename the
clint0 entry to "timer", fix the register mapping and fix the interrupt
extended entry.

This fixes boot failures with Kendryte K210 SoC boards.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/boot/dts/kendryte/k210.dtsi | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
index c1df56ccb8d5..48d65fea45e9 100644
--- a/arch/riscv/boot/dts/kendryte/k210.dtsi
+++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
@@ -95,10 +95,11 @@ sysctl: sysctl@50440000 {
 			#clock-cells = <1>;
 		};
 
-		clint0: interrupt-controller@2000000 {
+		timer@2000000 {
 			compatible = "riscv,clint0";
-			reg = <0x2000000 0xC000>;
-			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
+			reg = <0x2000000 0x10000>;
+			interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
+						&cpu1_intc 3 &cpu1_intc 7>;
 			clocks = <&sysctl K210_CLK_ACLK>;
 		};
 
-- 
2.26.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
