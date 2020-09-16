Return-Path: <SRS0=kUFi=CZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 923AFC43461
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 08:00:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E2E42080C
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Sep 2020 08:00:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="RKv9VD+r";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="S+BVnkio"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1E2E42080C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=za9aAcxjv+VxGXtB4PruIt02ZOkGiLKo5XoPZJQRZlA=; b=RKv9VD+rtc18lIj0ZG1D8358zo
	qmERMunmRXz4kQH0sS8zpT1c7nNE9Bbb6qO/PZXS74pxc2LVXo+XqzPaOPK4KSpNPzlnKSe300zWP
	y7e5pdd52MiTjnBzgsolu1nsajUAXbpPSEw/Jeqm9atkKqLMwa0PGWvDUuaCfKWK3SREHpoD+QUiL
	+QPvIiWKmdv8uZQUd6i0Rh2OQTTAP3e+1UbhR2xIdNH9pe1f8+1xpFFG23RmNTkFcH6G89qgOplRp
	aiGmEBtQQYRuHI7IW61axg07FNxvq342C0CYsvSMkLwNs0otB3551+p9u8E+Rhk/rHkqOhhBYFg5g
	yitkbaew==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kISM8-0004DQ-RE; Wed, 16 Sep 2020 07:59:56 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kISM1-00049w-28
 for linux-riscv@lists.infradead.org; Wed, 16 Sep 2020 07:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1600243190; x=1631779190;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=IUcw6wZmcG8+i8ZwULbKoGUDgJp7YwlT/5uWeQzh7vc=;
 b=S+BVnkio9HCruj4wgYIptvFHhVjejFB8APSsQYxPEtD4wEL1cEVX13UJ
 B7teSRd0UhsYKUS8TOkNXZ1AnOiUwjSdr+Dk6rMc1/04Li4a041IwPZaf
 E93X7gZMtQqic/0kiFuyn4KRIN7Gq9Fh4izR56mGM3BlUqth5PP45Ko4z
 P7TWxHGNlpMS1UDcFyarBIgfaeanJoqeUzcnhDNVX1yj7ns3w4j2rYfGu
 X1CO3AzPPx36bGE3mO3JsM6E2YJNseuU8mQGc3XmVtMqYRcaICgmuNq/u
 zJoSxe3aclS11Q2wdYIzv7PAQ4Kg3J+OUsKZmr6WqkTGlFSse92f7Pzd6 g==;
IronPort-SDR: VpK5Awa0nbmi3DRO77RvgNbKqOaRXjXoK+XP5P+bQdHUb5jatz1Uq2PdNvD4TvYyNGV+LARQxP
 vZBwuo+Al/xWorx4SPsYKhbsAuoBR+m6agqcxPU6jPFYMOoPxHmmD78AmRsRoE5BqXKwYAsPYr
 UAhgWK9sjrZJ4z5DkyK9CZJ5UGPp4coVC+KAWzB88H2UxaEARxU6mW2A0ASqk5qGcJ0ykmZy2G
 sImYMKoxvFkFABxpgMkxIkuEoI3sKvxtMFQJ9boKsKTDhyO8qXXcPsKTk4ix83pKbNTT9yVF78
 eik=
X-IronPort-AV: E=Sophos;i="5.76,432,1592841600"; d="scan'208";a="151866123"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 16 Sep 2020 15:59:45 +0800
IronPort-SDR: m05mubmAS1ndaUAHlzN1bVtOu0+T/nLwS4EkjHluJH9+hPI0OzXwuneoMKCHX35s6moixKj1it
 nPekvND9ClQw==
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2020 00:45:59 -0700
IronPort-SDR: NpDl4X0DhuKzjSsJyswNZgLji/9FITdy+ajnxaREazd0M9uhPQfX4JblL8gk+ZxJvNsf52HUCj
 4VVi7eVnz3ag==
WDCIronportException: Internal
Received: from cnf010691.ad.shared (HELO localhost.hgst.com) ([10.84.70.173])
 by uls-op-cesaip02.wdc.com with ESMTP; 16 Sep 2020 00:59:43 -0700
From: Damien Le Moal <damien.lemoal@wdc.com>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Subject: [PATCH v2] riscv: Fix Kendryte K210 device tree
Date: Wed, 16 Sep 2020 16:59:41 +0900
Message-Id: <20200916075941.32311-1-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200916_035949_321915_D7504E01 
X-CRM114-Status: GOOD (  13.41  )
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
Documentation/devicetree/bindings/timer/sifive,clint.yaml.
The device tree clint entry is renamed similarly to u-boot device tree
definition to improve compatibility with u-boot defined device tree.
To ensure correct initialization, the interrup-cells attribute is added
and the interrupt-extended attribute definition fixed.

This fixes boot failures with Kendryte K210 SoC boards.

Note that the clock referenced is kept as K210_CLK_ACLK, which does not
necessarilly match the clint MTIME increment rate. This however does not
seem to cause any problem for now.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 arch/riscv/boot/dts/kendryte/k210.dtsi | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/boot/dts/kendryte/k210.dtsi b/arch/riscv/boot/dts/kendryte/k210.dtsi
index c1df56ccb8d5..d2d0ff645632 100644
--- a/arch/riscv/boot/dts/kendryte/k210.dtsi
+++ b/arch/riscv/boot/dts/kendryte/k210.dtsi
@@ -95,10 +95,12 @@ sysctl: sysctl@50440000 {
 			#clock-cells = <1>;
 		};
 
-		clint0: interrupt-controller@2000000 {
+		clint0: clint@2000000 {
+			#interrupt-cells = <1>;
 			compatible = "riscv,clint0";
 			reg = <0x2000000 0xC000>;
-			interrupts-extended = <&cpu0_intc 3>,  <&cpu1_intc 3>;
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
