Return-Path: <SRS0=n4Ll=MV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E86AFA3753
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:51:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 058C22151C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Oct 2018 18:51:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="GJ0PnyQC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="MwwN1c7u"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 058C22151C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=t7nruJAFjov0B02M6Ks7KfTxRWBQ1+YYQ8CCArmvcRk=; b=GJ0PnyQCAqro8mQyyJJ4JWKe8b
	UCVEM5fn/oo+9Db/w4oJnnfDiXS5a4+k/x8psyoH873QsZXJ9081dVGAxUlE2Bl6U0yf7RudIwCKX
	5cCmD2+UyNcAmywtXeB1pGu2jAD14Prt/kAHfvn10Ri4kP41n8ZSrkSSs1YeDMjrtHbiZKlEol1Yw
	RieTFNxxw24qpNjbpASe0nyh9npeuQBZzXOxmjsnRhqBVFMkkxfgi5ihU1eqoPs/wnQexaYE6lyJw
	NRr157aPc2l8YpvA96TsaR6DFKHQMnNMuWtmDV9pHC56SYGVLwCuSTED7UHsRDTJHYPw/Krz2hKwz
	jlm5WdPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g9x6b-0000GO-Ie; Tue, 09 Oct 2018 18:51:41 +0000
Received: from esa5.hgst.iphmx.com ([216.71.153.144])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g9x6W-0000Df-Kz
 for linux-riscv@lists.infradead.org; Tue, 09 Oct 2018 18:51:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1539111097; x=1570647097;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=3buQbls5/gIS7422ozrHmZ63B7g/jc69OByotZi7u7I=;
 b=MwwN1c7uie1VFDg58gtTHMX2EsxHIOF4IBoHemjoTjT7ROuPL11uXL6b
 VPnZKXeFMp2pM0dS1nxGN4scuM6bE3UKIwyVawIIGtFlVY66ep1Tb21Nc
 sKBI4RAXajdLA5sHxc0ZY0O4T/+N5A8Btv5x+xRYVfmXMKUUTswgHtjeo
 RIx/Js77IHTiJCiTXkFTrMxWE915vDCFXE+uYg/VfJt55+UYu0EfzGBZa
 NxJA6IPddu03MU2dNEM+MlDNeSTek9oAVPmPL1vXg2BYAbMGUpC+gDhoA
 ESvG3v0ViZ4PbvDjCi/2Gt5hGSETViNvHUI6Imw6KTBxgvgiYwawPdzDF w==;
X-IronPort-AV: E=Sophos;i="5.54,361,1534780800"; d="scan'208";a="92668395"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2018 02:51:26 +0800
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 09 Oct 2018 11:36:52 -0700
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 09 Oct 2018 11:51:26 -0700
From: Atish Patra <atish.patra@wdc.com>
To: palmer@sifive.com, linux-riscv@lists.infradead.org,
 linux-pwm@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: [RFC 1/4] pwm: sifive: Add DT documentation for SiFive PWM Controller.
Date: Tue,  9 Oct 2018 11:51:22 -0700
Message-Id: <1539111085-25502-2-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
References: <1539111085-25502-1-git-send-email-atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181009_115136_720924_578A15D6 
X-CRM114-Status: GOOD (  12.12  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, devicetree@vger.kernel.org, linus.walleij@linaro.org,
 linux-kernel@vger.kernel.org, hch@infradead.org, atish.patra@wdc.com,
 robh+dt@kernel.org, thierry.reding@gmail.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181009185122.WB5aLUtOJ36cNtc92YBQj68CkAM4N9WnT7_ng4eJ_5E@z>

From: "Wesley W. Terpstra" <wesley@sifive.com>

DT documentation for PWM controller added with updated compatible
string.

Signed-off-by: Wesley W. Terpstra <wesley@sifive.com>
[Atish: Compatible string update]
Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 .../devicetree/bindings/pwm/pwm-sifive.txt         | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/pwm-sifive.txt

diff --git a/Documentation/devicetree/bindings/pwm/pwm-sifive.txt b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
new file mode 100644
index 00000000..532b10fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/pwm-sifive.txt
@@ -0,0 +1,32 @@
+SiFive PWM controller
+
+Unlike most other PWM controllers, the SiFive PWM controller currently only
+supports one period for all channels in the PWM. This is set globally in DTS.
+The period also has significant restrictions on the values it can achieve,
+which the driver rounds to the nearest achievable frequency.
+
+Required properties:
+- compatible: should be one of
+	"sifive,fu540-c000-pwm0","sifive,pwm0".
+	PWM controller is HiFive Unleashed specific chip which warrants a
+	specific compatible string. The second string is kept for backward
+	compatibility until a firmware update with latest compatible string.
+- reg: physical base address and length of the controller's registers
+- clocks: The frequency the controller runs at
+- #pwm-cells: Should be 2.
+  The first cell is the PWM channel number
+  The second cell is the PWM polarity
+- sifive,approx-period: the driver will get as close to this period as it can
+- interrupts: one interrupt per PWM channel (currently unused in the driver)
+
+Examples:
+
+pwm:  pwm@10020000 {
+	compatible = "sifive,fu540-c000-pwm0","sifive,pwm0";
+	reg = <0x0 0x10020000 0x0 0x1000>;
+	clocks = <&tlclk>;
+	interrupt-parent = <&plic>;
+	interrupts = <42 43 44 45>;
+	#pwm-cells = <2>;
+	sifive,approx-period = <1000000>;
+};
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
