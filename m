Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C3ACECAAA1
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Oct 2022 17:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zXqDmagGoNN92z/y+kDcFYK9BEXVHU/LPLdwtO5c+lc=; b=uhlnggSqtvJviz
	ecFLoDrifwgss+WwHgEBXhdznlM0AB7qQO61FVRsgR51df5PSH/6FaX0AatLth2hiMWAC4CW0umZE
	ooAiqIM0tqiv7F8U6VQNpG5sAps+FuCpk7UuWjMmryrkNWzLPdApr3LI7EgV2twwjXqmmjwdLvgCK
	XIna9l86beU316LWqMDFqVBwQoCCV+zE6aPHRacNPMUdK59M8QFWmFYyGUCltYB5rUyejqxS0QFQ9
	wyZxz+kUP0rDw89xtezKGuu2B1Qhsot4qEHEiAFTldXCO0m4++E+xP/AN3Sl27wqiI9RMXHEOEpZo
	IkwK5WmJP4vIwKr5OLxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooTCE-001Jxd-4F; Fri, 28 Oct 2022 17:31:06 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ooShn-0015in-Cr
	for linux-riscv@lists.infradead.org; Fri, 28 Oct 2022 16:59:41 +0000
Received: by mail-wr1-x430.google.com with SMTP id bk15so7375796wrb.13
        for <linux-riscv@lists.infradead.org>; Fri, 28 Oct 2022 09:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uwam57UrMly/7fzbCijndaabO19arvpUZgXGPs6USsk=;
        b=j3dE9iFZN3Q4xHL4MBNM8nTSfEpFB1Jd797KVcPXCUEbjqQv7rSf7t7uxd4Ozl+Qs9
         4B/lh3AjjZBXDs7JFchaMSVC/uS0oK36fuRi2jihGh2VY5s8QVGyZKX/0p7GQAIbpnRh
         lFSmHGTMWjeIyQQRPG/m45xIVo1fHR0cQS1BqJlJN4TmD6E7y78I2TyvVVz+RJMnPRgJ
         IMR9xHqmGSka2GeRcD85UaooRbjP56w3/jiSDG7MVixTxurH9au3BiRqEOter2XWUZA0
         QV13yHKvXniFfJLJwhL+MtzA5SWhiQnkQ13h5Y00lHIRAa9zw5+qoJRTlZt6jphZVsYL
         aESQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uwam57UrMly/7fzbCijndaabO19arvpUZgXGPs6USsk=;
        b=nrJIY6KpejH63786VtagtATafp2leIysw9sMjDf7LXgtCWpTr+o6aKucHPfGx/Fwuc
         Q4io/+5x2zIU/ezoFsVaIdYTuVDmpdQxqbgnp4+1Rv4KKhOodUYazaw4eXFbTsh5d2vY
         RZZk/rGGQt5tbQoj0lib0PTQxMCLqW890pmU+x2lOmTxOAYK9Oq27x3DeV6GwnHdgp4g
         fdd4iF0W/g7V7dcZXdKH6lJIAqIeMrVTug7d1hE7tPgDVWHLwS95YWb1HHyzkAujA0F6
         IEXaRlV89jPh9mcHiPLt5iMuaj7Xv+veVjENbcOfSdSLXWhuWlqt8PwrSns7h5+MzqbC
         r7eA==
X-Gm-Message-State: ACrzQf2GYQYaAyT6O4Ug8BZKqyfYoq1ES/pWsoCbgOAn2pykV387sKfe
	S+5JVpdGhsTxh9/vu+2/830=
X-Google-Smtp-Source: AMsMyM7DbSNI8CI2EApbdew+7+EcO6kav041DN522vtQ5/WtL6WLKYHE2a8xK22QDtxwBjo8WqYHwA==
X-Received: by 2002:a5d:47aa:0:b0:236:79cc:6d5f with SMTP id 10-20020a5d47aa000000b0023679cc6d5fmr176258wrb.391.1666976375559;
        Fri, 28 Oct 2022 09:59:35 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:d53b:eaf9:15f:6a8a])
        by smtp.gmail.com with ESMTPSA id h2-20020adfe982000000b002322bff5b3bsm4939689wrm.54.2022.10.28.09.59.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Oct 2022 09:59:34 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@rivosinc.com>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH v5 4/7] riscv: dts: renesas: Add initial devicetree for Renesas RZ/Five SoC
Date: Fri, 28 Oct 2022 17:59:18 +0100
Message-Id: <20221028165921.94487-5-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
References: <20221028165921.94487-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221028_095939_511360_B5275787 
X-CRM114-Status: GOOD (  14.55  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Add initial device tree for Renesas RZ/Five RISC-V CPU Core (AX45MP
Single).

RZ/Five SoC is almost identical to RZ/G2UL Type-1 SoC (ARM64) hence we
will be reusing r9a07g043.dtsi [0] as a base DTSI for both the SoC's.
r9a07g043f.dtsi includes RZ/Five SoC specific blocks.

Below are the RZ/Five SoC specific blocks added in the initial DTSI which
can be used to boot via initramfs on RZ/Five SMARC EVK:
- AX45MP CPU
- PLIC

[0] arch/arm64/boot/dts/renesas/r9a07g043.dtsi

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v4 -> v5
* Fixed riscv,ndev value (should be 511)
* Reworked completely (sort of new patch)

v3 -> v4
* No change

v2 -> v3
* Fixed clock entry for CPU core
* Fixed timebase frequency to 12MHz
* Fixed sorting of the nodes
* Included RB tags

v1 -> v2
* Dropped including makefile change
* Updated ndev count
---
 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi | 57 +++++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 arch/riscv/boot/dts/renesas/r9a07g043f.dtsi

diff --git a/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
new file mode 100644
index 000000000000..50134be548f5
--- /dev/null
+++ b/arch/riscv/boot/dts/renesas/r9a07g043f.dtsi
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+/*
+ * Device Tree Source for the RZ/Five SoC
+ *
+ * Copyright (C) 2022 Renesas Electronics Corp.
+ */
+
+#include <dt-bindings/interrupt-controller/irq.h>
+
+#define SOC_PERIPHERAL_IRQ(nr)	(nr + 32)
+
+#include <arm64/renesas/r9a07g043.dtsi>
+
+/ {
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <12000000>;
+
+		cpu0: cpu@0 {
+			compatible = "andestech,ax45mp", "riscv";
+			device_type = "cpu";
+			reg = <0x0>;
+			status = "okay";
+			riscv,isa = "rv64imafdc";
+			mmu-type = "riscv,sv39";
+			i-cache-size = <0x8000>;
+			i-cache-line-size = <0x40>;
+			d-cache-size = <0x8000>;
+			d-cache-line-size = <0x40>;
+			clocks = <&cpg CPG_CORE R9A07G043_CLK_I>;
+
+			cpu0_intc: interrupt-controller {
+				#interrupt-cells = <1>;
+				compatible = "riscv,cpu-intc";
+				interrupt-controller;
+			};
+		};
+	};
+};
+
+&soc {
+	interrupt-parent = <&plic>;
+
+	plic: interrupt-controller@12c00000 {
+		compatible = "renesas,r9a07g043-plic", "andestech,nceplic100";
+		#interrupt-cells = <2>;
+		#address-cells = <0>;
+		riscv,ndev = <511>;
+		interrupt-controller;
+		reg = <0x0 0x12c00000 0 0x400000>;
+		clocks = <&cpg CPG_MOD R9A07G043_NCEPLIC_ACLK>;
+		power-domains = <&cpg>;
+		resets = <&cpg R9A07G043_NCEPLIC_ARESETN>;
+		interrupts-extended = <&cpu0_intc 11 &cpu0_intc 9>;
+	};
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
