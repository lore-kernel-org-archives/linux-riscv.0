Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98642ECAAD4
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Aug 2022 09:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=T3iEdKKHUkr6FHOgBCYRY7BI0dympFZY8EldigFXVL4=; b=v/cwuxWM8V0t0e
	eGl08alEJR5nXISUahp+wciVNq6fSyTHZvhOahv6GWTPlS8AmitVfc9uI6PcguYN13fzjnt3otwVD
	oGGH7yEQrWHJdsxVCRB8oyyLqYBcdKr7JKMmGyjyb/1JHRrhYvBEK0r+ee5xe1JVgNWg3VzVshi1E
	ZIKJFPxldfWrpGFHJ+6J9T8kKGtRjdy3MVGes2jXxK0N3EsGtoSmfgxSL1e8CZVtWxULtMOhXLf1Q
	0AZhJtK3niWC2TNBiDehVqcfcT6VyYkDHjSLYA7uCgpw3xZRV0xZFc0MpcW1Fi8RX8fAAuE66cyWF
	KyFkLwTXB+BnDtab4AAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSanv-006ZkA-3G; Mon, 29 Aug 2022 09:11:35 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oSann-006ZbU-Ci
	for linux-riscv@lists.infradead.org; Mon, 29 Aug 2022 09:11:31 +0000
Received: from workstation5.fritz.box (ip-084-118-157-002.um23.pools.vodafone-ip.de [84.118.157.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id ED3753F3B8;
	Mon, 29 Aug 2022 09:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1661764280;
	bh=MOqesf4u45zAtW+3BKe8GeSqrojsS9g/VBrPiha821c=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=KM2a6H02nXrKg48mpMsYY/V9tbJD+UXRsgPglsmTaHIqKkNKBBRiNW6fE7LTjSO1U
	 NfkjFtKQjGZw3JqLuN7WUDnJvK9B1HzwKEpB0m9iqjhOO5DvIOkMNaKidB0S78Rtu3
	 T94RxzpK3cQCArQaBgXV0MY+xHtvvqo7nyq/XUyc+5rKVSiglLptvtLG8tzYaPMDtL
	 VR9qfHKTkT5kPxslwNobZGfpYiqhak/kbN8IkNb9mgg8ywYjfS5JaFp8nI8gf2wDGG
	 0RAPSgteBVcEJcG8RGj66QG/IcLpLYP6ZbkU/Hv0y5Y4C3t4qbLPmDOWvczmJhJ53n
	 8HHY3tpe1uaqw==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
	Sasha Levin <sashal@kernel.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Atish Patra <atish.patra@wdc.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	stable@vger.kernel.org
Subject: [PATCH 1/1] riscv: dts: microchip: correct L2 cache interrupts
Date: Mon, 29 Aug 2022 11:10:34 +0200
Message-Id: <20220829091034.109258-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220829_021127_816656_2E79B215 
X-CRM114-Status: GOOD (  12.55  )
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

This is a backport of commit 34fc9cc3aebe to v5.15.

The "PolarFire SoC MSS Technical Reference Manual" documents the
following PLIC interrupts:

1 - L2 Cache Controller Signals when a metadata correction event occurs
2 - L2 Cache Controller Signals when an uncorrectable metadata event occurs
3 - L2 Cache Controller Signals when a data correction event occurs
4 - L2 Cache Controller Signals when an uncorrectable data event occurs

This differs from the SiFive FU540 which only has three L2 cache related
interrupts.

The sequence in the device tree is defined by an enum:

    enum {
            DIR_CORR = 0,
            DATA_CORR,
            DATA_UNCORR,
            DIR_UNCORR,
    };

So the correct sequence of the L2 cache interrupts is

    interrupts = <1>, <3>, <4>, <2>;

This manifests as an unusable system if the l2-cache driver is enabled,
as the wrong interrupt gets cleared & the handler prints errors to the
console ad infinitum.

Fixes: 0fa6107eca41 ("RISC-V: Initial DTS for Microchip ICICLE board")
CC: stable@vger.kernel.org # 5.15: e35b07a7df9b: riscv: dts: microchip: mpfs: Group tuples in interrupt properties
Link: https://lore.kernel.org/all/20220817132521.3159388-1-heinrich.schuchardt@canonical.com/
Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 4ef4bcb74872..57989b2ac186 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -153,7 +153,7 @@ cache-controller@2010000 {
 			cache-size = <2097152>;
 			cache-unified;
 			interrupt-parent = <&plic>;
-			interrupts = <1 2 3>;
+			interrupts = <1>, <3>, <4>, <2>;
 			reg = <0x0 0x2010000 0x0 0x1000>;
 		};
 
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
