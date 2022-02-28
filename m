Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB0FC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Feb 2022 17:58:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gi6pd4DpTYxkQQPXinunL2dYcM/LTTrXrPZmjfi1VPI=; b=E9jIzeu1lgtb9B
	y6wDNhA4mt2NjMYcbjn7EyJQ1h79r/TbRH08eX/h0OtmVE/67dEba3AnpxNCGALhtUEni1Uq8Xjqq
	C63QOoaCUIhhyYq0yvZwzUEK66qd1o2atxuIo4OJxepdvUEofric5Ue4agKHr7lapvAbDCvSvElQg
	Hu04dHeIza2pYQX2lSMQz3YtDGVPYda1ZIpFoQ3GY/itA6p1sHHS5z6OY2tLaMnsM5F1bw9yWdh+I
	zez/s+RhYeXD7ls3jw4rGuuJGHI2gCCjRN0mjJeAeoovdCZN6QYbMzygaHLK63h8HnlhRjjqL0KYE
	vQFz9JmrfgJRpgXtmeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nOkI3-00Dd5y-Fj; Mon, 28 Feb 2022 17:58:31 +0000
Received: from relay-us1.mymailcheap.com ([51.81.35.219])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nOkHz-00Dd4t-1v
 for linux-riscv@lists.infradead.org; Mon, 28 Feb 2022 17:58:28 +0000
Received: from relay5.mymailcheap.com (relay5.mymailcheap.com
 [159.100.248.207])
 by relay-us1.mymailcheap.com (Postfix) with ESMTPS id 3B208201E8
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 17:49:21 +0000 (UTC)
Received: from relay1.mymailcheap.com (relay1.mymailcheap.com
 [144.217.248.102])
 by relay5.mymailcheap.com (Postfix) with ESMTPS id 972C0267CE
 for <linux-riscv@lists.infradead.org>; Mon, 28 Feb 2022 17:49:10 +0000 (UTC)
Received: from filter2.mymailcheap.com (filter2.mymailcheap.com
 [91.134.140.82])
 by relay1.mymailcheap.com (Postfix) with ESMTPS id C304A3F201;
 Mon, 28 Feb 2022 17:48:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by filter2.mymailcheap.com (Postfix) with ESMTP id 2C94C2A6DF;
 Mon, 28 Feb 2022 17:48:58 +0000 (UTC)
X-Virus-Scanned: Debian amavisd-new at filter2.mymailcheap.com
Received: from filter2.mymailcheap.com ([127.0.0.1])
 by localhost (filter2.mymailcheap.com [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ajWsz5Lt1Fza; Mon, 28 Feb 2022 17:48:57 +0000 (UTC)
Received: from mail20.mymailcheap.com (mail20.mymailcheap.com [51.83.111.147])
 (using TLSv1.2 with cipher ADH-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by filter2.mymailcheap.com (Postfix) with ESMTPS;
 Mon, 28 Feb 2022 17:48:57 +0000 (UTC)
Received: from edelgard.icenowy.info (unknown [59.41.161.107])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest
 SHA256) (No client certificate requested)
 by mail20.mymailcheap.com (Postfix) with ESMTPSA id 209A5405A4;
 Mon, 28 Feb 2022 17:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=aosc.io; s=default;
 t=1646070536; bh=EUzRPh29lTz0HC2sOaanLBcm5/67RZ1K8csq/rZ5tF0=;
 h=From:To:Cc:Subject:Date:From;
 b=lm4d08q9QW/jYV2uymu/ojKgPwtij1OU7udNcw7HWUfexmbojWX0184HRSkqwvtFc
 12PZmrrV3b++TueVDtpz+16uZ3fOUNbHdfueF1wIPUJmx1DDwUfcLCY9L+hsEyLglW
 niRTQDnKGS5mgt+J2woUn5mnCkMGwpYPU9yNl5Hw=
From: Icenowy Zheng <icenowy@aosc.io>
To: Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, Icenowy Zheng <icenowy@aosc.io>
Subject: [PATCH 1/2] riscv: dts: sifive: sort Unleashed DT nodes under /
Date: Tue,  1 Mar 2022 01:48:36 +0800
Message-Id: <20220228174837.602758-1-icenowy@aosc.io>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220228_095827_170323_252A92CD 
X-CRM114-Status: GOOD (  11.06  )
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

The device tree nodes at root in HiFive Unleashed DT is currently not
sorted.

Sort them alphabetically.

Signed-off-by: Icenowy Zheng <icenowy@aosc.io>
---
 .../boot/dts/sifive/hifive-unleashed-a00.dts      | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
index ced0d4e479385..44824d7e50ac7 100644
--- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -20,9 +20,9 @@ cpus {
 		timebase-frequency = <RTCCLK_FREQ>;
 	};
 
-	memory@80000000 {
-		device_type = "memory";
-		reg = <0x0 0x80000000 0x2 0x00000000>;
+	gpio-restart {
+		compatible = "gpio-restart";
+		gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
 	};
 
 	hfclk: hfclk {
@@ -32,16 +32,17 @@ hfclk: hfclk {
 		clock-output-names = "hfclk";
 	};
 
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x00000000>;
+	};
+
 	rtcclk: rtcclk {
 		#clock-cells = <0>;
 		compatible = "fixed-clock";
 		clock-frequency = <RTCCLK_FREQ>;
 		clock-output-names = "rtcclk";
 	};
-	gpio-restart {
-		compatible = "gpio-restart";
-		gpios = <&gpio 10 GPIO_ACTIVE_LOW>;
-	};
 };
 
 &uart0 {
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
