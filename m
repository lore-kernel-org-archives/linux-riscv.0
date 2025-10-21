Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF64FCCD184
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Oct 2025 09:48:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bbFui/qdHKqqk75vQxs+VDqQtCoA4tKG53+V32MKA0o=; b=GRxQcC/tEPzEC7
	PpU1ONdJeWtmPNlTEGHmZ8mwzitVqJ/sqAvrlWuFoucolpxrRO1iJlBuQvwh0EoFVzTOHcsBeybdv
	Sy/vZUSB+OXJeeXBXiit+QKA9mVTSdCM1dNq0U7aGakDZ34hooip27rV8GGrDqxZTJk4kaF45fr6z
	2C2TB8eDqRL7CLHuk0AvRYt4jAtLxNTVJTqXfhHJzK0vhUBGwW5ZOW54TJcn0+tg1rG0xELwg10SH
	fulPXqyiM8FxPEboQ3KEQAHgouI1uTitu7RPp2e1p+Hi12bmuu3FUAhnyEVwl4HZqq3rT5fmqSelK
	rr49dPEtPHHY9I7lJL8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8yJ-0000000GWV8-2Lea;
	Tue, 21 Oct 2025 09:48:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB8yI-0000000GWUn-0Eio
	for linux-riscv@bombadil.infradead.org;
	Tue, 21 Oct 2025 09:48:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=hqiQC5ayX+JN5fxtyr14jM4MC4pfQMFMI0LCqJastRo=; b=W6bCfv3PBBN0xnpivmo0AnRGVX
	hWQH/JpONF5QmEMxri+kjRdD2WCIpPK6/w/VzOEVgx6Q4FC4boXECvM2NhWAcnK7nZrXjPe2HMTxE
	XElukuhsirzfv1I6tSjJ8Plq+nh47u8Zv6QVEYROIshbCjtBuJ8K84C0GybV4Jv2gB1OdeNS1bHI/
	br3zqiwu/lBI2v1PciUBGM0M6A856tOWkTUFAGSDfz/A3ncWpIsmSfCJzxrU4qLPIJDWwVYPM2HaC
	BJbv82k3ZNT8fw8dwLZs/D/vbjpeTZL9shywt1fsnPFb+g8SGc1vo7QobhcuPKl2UKLe1xrMR+bJR
	q1myXKgg==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB856-00000000dWS-0f7F
	for linux-riscv@lists.infradead.org;
	Tue, 21 Oct 2025 08:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761039961; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=P/EFRnhemYf+Fm4Fglh30csavqYDo3TiJIUspKpafk3m6JyEEwBsgr9GVwFY7bFBR1jcOabPfgvV/LRUo6w6SpQ+m8Ir/kjxdksG8MZ3Mju/PG85sEz4zla3OJjxTvo9CDiKuOzI6WfRNZw4fc2V7e89jc0AoYMySCpcaJCVGrk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761039961; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=hqiQC5ayX+JN5fxtyr14jM4MC4pfQMFMI0LCqJastRo=; 
	b=RPAtb8tKgaFEM41mD4ke34oWrQd3M3dmwM9rwpD7aHn2DChJKgy+JNiOr1/NhrGkGJkTid+0g8E50pUfsJTD2bLIIQOey2COm586NCM26UPiAvgdrA+h/CaW+zl13wvuatm3L4GnEIoVBXFp5L7y1VvtG+NHCxMVsy+PNK2YUxM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761039961;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=hqiQC5ayX+JN5fxtyr14jM4MC4pfQMFMI0LCqJastRo=;
	b=GbWDWsfv6Ftb35C/7s4NJ9NiGsB9nLl1TWrAfOeICsiQA4qR1qjnGPnJGQNvUY7n
	I8ehy4ufUCQFQ1SGVLZ+dxuuE05B3cpIV7poLCkszO8JRxaa2fQBpwZkOctA9hDAMCk
	wspT+yJiO10mwtMJdAFGWZij8NyIGPeroAFnFgEY=
Received: by mx.zohomail.com with SMTPS id 1761039959167749.4138204173319;
	Tue, 21 Oct 2025 02:45:59 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Tue, 21 Oct 2025 17:41:46 +0800
Subject: [PATCH v3 11/13] riscv: dts: Add initial Anlogic DR1V90 SoC device
 tree
MIME-Version: 1.0
Message-Id: <20251021-dr1v90-basic-dt-v3-11-5478db4f664a@pigmoral.tech>
References: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
In-Reply-To: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Junhui Liu <junhui.liu@pigmoral.tech>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 linux-riscv@lists.infradead.org, Inochi Amaoto <inochiama@outlook.com>, 
 sophgo@lists.linux.dev, linux-serial@vger.kernel.org, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761039846; l=4796;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=RDVWZeAxgz1alDJPsqpgTVocpV8c0UxJ9gg4n/HME6s=;
 b=2DvHOsMqdF+wdj5Cz+HgdyjhVfgbbd4sID/wYYDvXeI4GxcnrBDmQF3VrnJanLFjClkIPhteZ
 lBrt1aD6kxFDEC3imTux8KP9x5HoCMuyomffiSaxHQRjoFf08wMF/P9
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_095107_677678_B1DA2BB8 
X-CRM114-Status: GOOD (  10.66  )
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

DR1V90 is a FPSoC from Anlogic, which features a RISC-V core as the PS
part and 94,464 LUTs for the PL part.

The PS part integrates a Nuclei UX900 RISC-V core with 32KB L1 icache
and 32KB L1 dcache. It also provides two "snps,dw-apb-uart" compatible
UART controllers.

Some basic information of the processor can be obtained by running a
simple application from nuclei-sdk [1]:

-----Nuclei RISC-V CPU Configuration Information-----
         MARCHID: 0xc900
          MIMPID: 0x20300
             ISA: RV64 A B C D F I M P S U
            MCFG: TEE ECC ECLIC PLIC PPI ILM DLM ICACHE DCACHE IREGION No-Safety-Mechanism DLEN=VLEN/2
             ILM: 256 KB has-ecc
             DLM: 256 KB has-ecc
          ICACHE: 32 KB(set=256,way=2,lsize=64,ecc=1)
          DCACHE: 32 KB(set=256,way=2,lsize=64,ecc=1)
             TLB: MainTLB(set=32,way=2,entry=1,ecc=1) ITLB(entry=8) DTLB(entry=8)
         IREGION: 0x68000000 128 MB
                  Unit        Size        Address
                  INFO        64KB        0x68000000
                  DEBUG       64KB        0x68010000
                  ECLIC       64KB        0x68020000
                  TIMER       64KB        0x68030000
                  PLIC        64MB        0x6c000000
     INFO-Detail:
                  mpasize : 0
             PPI: 0xf8000000 128 MB
-----End of Nuclei CPU INFO-----

Link: https://github.com/Nuclei-Software/nuclei-sdk/blob/master/application/baremetal/cpuinfo/main.c [1]
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi | 100 ++++++++++++++++++++++++++++++++
 1 file changed, 100 insertions(+)

diff --git a/arch/riscv/boot/dts/anlogic/dr1v90.dtsi b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..a5d0765ade3231ece0afbe8835d95cd918a44ad9
--- /dev/null
+++ b/arch/riscv/boot/dts/anlogic/dr1v90.dtsi
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
+ */
+
+/dts-v1/;
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "Anlogic DR1V90";
+	compatible = "anlogic,dr1v90";
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+		timebase-frequency = <800000000>;
+
+		cpu@0 {
+			compatible = "nuclei,ux900", "riscv";
+			d-cache-block-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <32768>;
+			device_type = "cpu";
+			i-cache-block-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <32768>;
+			mmu-type = "riscv,sv39";
+			reg = <0>;
+			riscv,isa-base = "rv64i";
+			riscv,isa-extensions = "i", "m", "a", "f", "d", "c", "zba", "zbb", "zbc",
+					       "zbkc", "zbs", "zicntr", "zicsr", "zifencei",
+					       "zihintpause", "zihpm";
+
+			cpu0_intc: interrupt-controller {
+				compatible = "riscv,cpu-intc";
+				#interrupt-cells = <1>;
+				interrupt-controller;
+			};
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+		interrupt-parent = <&plic>;
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		aclint_mswi: interrupt-controller@68031000 {
+			compatible = "anlogic,dr1v90-aclint-mswi", "nuclei,ux900-aclint-mswi";
+			reg = <0x0 0x68031000 0x0 0x4000>;
+			interrupts-extended = <&cpu0_intc 3>;
+		};
+
+		aclint_mtimer: timer@68035000 {
+			compatible = "anlogic,dr1v90-aclint-mtimer", "nuclei,ux900-aclint-mtimer";
+			reg = <0x0 0x68035000 0x0 0x8000>;
+			reg-names = "mtimecmp";
+			interrupts-extended = <&cpu0_intc 7>;
+		};
+
+		aclint_sswi: interrupt-controller@6803d000 {
+			compatible = "anlogic,dr1v90-aclint-sswi", "nuclei,ux900-aclint-sswi";
+			reg = <0x0 0x6803d000 0x0 0x3000>;
+			#interrupt-cells = <0>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 1>;
+		};
+
+		plic: interrupt-controller@6c000000 {
+			compatible = "anlogic,dr1v90-plic", "sifive,plic-1.0.0";
+			reg = <0x0 0x6c000000 0x0 0x4000000>;
+			#address-cells = <0>;
+			#interrupt-cells = <1>;
+			interrupt-controller;
+			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
+			riscv,ndev = <150>;
+		};
+
+		uart0: serial@f8400000 {
+			compatible = "anlogic,dr1v90-uart", "snps,dw-apb-uart";
+			reg = <0x0 0xf8400000 0x0 0x1000>;
+			clock-frequency = <50000000>;
+			interrupts = <71>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+
+		uart1: serial@f8401000 {
+			compatible = "anlogic,dr1v90-uart", "snps,dw-apb-uart";
+			reg = <0x0 0xf8401000 0x0 0x1000>;
+			clock-frequency = <50000000>;
+			interrupts = <72>;
+			reg-io-width = <4>;
+			reg-shift = <2>;
+			status = "disabled";
+		};
+	};
+};

-- 
2.51.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
