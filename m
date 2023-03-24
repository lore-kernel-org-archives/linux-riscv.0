Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D41C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 06:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SHhiE7lpsZTZ0sRkhcsuHf9qcTyVa3P5dSWT7OeH8zI=; b=q1qgZZdV15gcBk
	09aH/uLkX4LYiWq1KZHA5KOKtGkFZ7yCtRBDskRgpalvEzuvUJIXQpjXH5ikMLc/Gf/C3bD8Ync2x
	N0l2D5/dlWyNXFdzfPu7an0qF0MZKOFBlww/oVLz/NKFP92QZmJVM6Pd3AP22hqhIVAgYS1U7arkK
	sgvb0eSuG1xeYojD8ktgfyhzlgeYIobQ9W7tvw4OYrjPbYmaJhyU/vvxA/sJmAHHhtJAtOhEvYwHm
	Iznj+lxAsvvs10PcndlwCgvGn3RSCTqiZAjb2k1fvyjaiMoyslUpQQz+V1rrWs1OFnu/kuPH5EZQb
	hDMsFgZCba1X3tizwTrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfbCu-003hRe-0V;
	Fri, 24 Mar 2023 06:47:24 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfbCp-003hPq-2x
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 06:47:22 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 05E1024E207;
	Fri, 24 Mar 2023 14:46:53 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Mar
 2023 14:46:53 +0800
Received: from ubuntu.localdomain (113.72.145.117) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 24 Mar
 2023 14:46:52 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v1] riscv: dts: starfive: jh7110: Correct the properties of S7 core
Date: Fri, 24 Mar 2023 14:46:51 +0800
Message-ID: <20230324064651.84670-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [113.72.145.117]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230323_234720_174709_1D586E95 
X-CRM114-Status: UNSURE (   8.01  )
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

The S7 core has no L1 data cache and MMU, so delete some
related properties.

Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
---

Hi, Conor,

This is a correction for the S7 entry.
This patch depends on patch [1].

[1] https://lore.kernel.org/all/20230320103750.60295-20-hal.feng@starfivetech.com/

---
 arch/riscv/boot/dts/starfive/jh7110.dtsi | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
index d484ecdf93f7..4c5fdb905da8 100644
--- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
+++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
@@ -20,21 +20,12 @@ cpus {
 		S7_0: cpu@0 {
 			compatible = "sifive,s7", "riscv";
 			reg = <0>;
-			d-cache-block-size = <64>;
-			d-cache-sets = <64>;
-			d-cache-size = <8192>;
-			d-tlb-sets = <1>;
-			d-tlb-size = <40>;
 			device_type = "cpu";
 			i-cache-block-size = <64>;
 			i-cache-sets = <64>;
 			i-cache-size = <16384>;
-			i-tlb-sets = <1>;
-			i-tlb-size = <40>;
-			mmu-type = "riscv,sv39";
 			next-level-cache = <&ccache>;
 			riscv,isa = "rv64imac_zba_zbb";
-			tlb-split;
 			status = "disabled";
 
 			cpu0_intc: interrupt-controller {
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
