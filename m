Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A45B2C433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:27:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 459A2613C2
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:27:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 459A2613C2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=e38bc+dZ53pyHUpolad+fZ7YUBCZdXJBsHAxQOIuAOc=; b=hwLt6zi8hH5sb4aqKuRLIZYEe
	cYmQ/bMOyBMj54oP34os3+37mVZvmUNblFI/jnA9xmchzQRkUVK7nKUvMFHtX65sCnZOppOfYmjaM
	5P2EY2n4ljrwLPf4P9qc09HUisKSzzwwifFFXdYB4mr/Mem4GBcH9JRREoS9R8ZfmqYFIjbPUoEZ8
	+qaMDi6WoihLN7F92gxgBVNQ6Grva6sgp2cokEcCbgl9r/435wlDZYLzQnfX7jKUlJ7KI12kXGUxL
	oGcHw7WL69ZJhJ8iNi83URP2K0IMxVyU41AOSSz0Q/q8ZfoNPb2CKQdcw2m8vBYPZgblvr6zakgUp
	DyK1gBHBg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThzL-0020uH-0Y; Tue, 06 Apr 2021 09:27:11 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThzG-0020sO-Fd
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 09:27:08 +0000
Received: by mail-pf1-x42b.google.com with SMTP id 11so8287382pfn.9
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 02:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bJDxiGn0zb+AtBhh3GrH3c02J/dSNj0T0Os6e9JU2HI=;
 b=CkAK3AMNLVaTU0AJ+BKXafxyyc2oHDGM5ISRrZstIeYm0ynPQZLoUEbNCbeyNys0US
 wvN6aKbq1RQwZcbDiughkylaiLEy5dzBC5DOItvgLBPmNMJskYLL8TfUaI9vtKagynM/
 tJ+NdQww5Jl1iuVgbSIele56yUgv/6Zf1Fm14khEApXkHmRhy4xVSWdIpbjyQVhhapth
 XXlnJmkhM4cRnqZMS9oAg7MaIJE9REDQNDPj0PTC5azcN4V9DgsjVdCjhdEcZ0WiPAF7
 yln8aVHSakNPUsVmCLU7eAngNHG7lT3F63G6olwtImNY8A354i+NEIuidgqUB73U0eC2
 gpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bJDxiGn0zb+AtBhh3GrH3c02J/dSNj0T0Os6e9JU2HI=;
 b=M7LMOJw4f4RcsCRU5Y84Db2GogHZShEnz2VTx01tSqFFwWta2ZD++9M8X/zFHcWvla
 XInaAvUy4x9RzJ9rYhsqtFp/RQaU8SFiRJNn0eeW1jucoKb21WkUKcTjbjSmL8v26NJD
 pPJujs4Ac+E7ewjW0MdU6ckwETgHsR4fDTbxthBzTOh0dp8zHFBncvEFcnhkZxv33NR+
 4stiy8JI2ccyZjLX8rRR68sCvyZIETaWw/FDMt7n6wyJdjBLX8GsoxobxCRLVYcEhT9k
 3hNlHzaIHjWu/u6OOmHN5IUDacKpVkl7xBjK2Qy6kSYY4ixayBUjuLtBlbWzmKH7z2ka
 ENTg==
X-Gm-Message-State: AOAM533QMmeSa2QEnuobCiOHSPLoY9ixHV0QjKjkQJDl70u7zw9zTsLU
 sfzSo0+00wuuN9s0IMKHfQo71g==
X-Google-Smtp-Source: ABdhPJydGIUF/6dUeUWIt/R7Abd1V20Uua9AfyQ1Nildjd522JxEtojvsjGsv0bmaULXYZeNuwupGA==
X-Received: by 2002:a63:74c:: with SMTP id 73mr26216577pgh.200.1617701225074; 
 Tue, 06 Apr 2021 02:27:05 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w7sm13685589pff.208.2021.04.06.02.27.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:27:04 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Subject: [PATCH v5 6/6] riscv: dts: Add PCIe support for the SiFive FU740-C000
 SoC
Date: Tue,  6 Apr 2021 17:26:34 +0800
Message-Id: <20210406092634.50465-7-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210406092634.50465-1-greentime.hu@sifive.com>
References: <20210406092634.50465-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_102706_601316_E67AD4FD 
X-CRM114-Status: UNSURE (   8.12  )
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

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index d1bb22b11920..b2317c8e3a80 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -158,6 +158,7 @@ prci: clock-controller@10000000 {
 			reg = <0x0 0x10000000 0x0 0x1000>;
 			clocks = <&hfclk>, <&rtcclk>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 		uart0: serial@10010000 {
 			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
@@ -288,5 +289,37 @@ gpio: gpio@10060000 {
 			clocks = <&prci PRCI_CLK_PCLK>;
 			status = "disabled";
 		};
+		pcie@e00000000 {
+			compatible = "sifive,fu740-pcie";
+			#address-cells = <3>;
+			#size-cells = <2>;
+			#interrupt-cells = <1>;
+			reg = <0xe 0x00000000 0x0 0x80000000>,
+			      <0xd 0xf0000000 0x0 0x10000000>,
+			      <0x0 0x100d0000 0x0 0x1000>;
+			reg-names = "dbi", "config", "mgmt";
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000>,      /* I/O */
+				 <0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000>,    /* mem */
+				 <0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000>,    /* mem */
+				 <0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
+			num-lanes = <0x8>;
+			interrupts = <56>, <57>, <58>, <59>, <60>, <61>, <62>, <63>, <64>;
+			interrupt-names = "msi", "inta", "intb", "intc", "intd";
+			interrupt-parent = <&plic0>;
+			interrupt-map-mask = <0x0 0x0 0x0 0x7>;
+			interrupt-map = <0x0 0x0 0x0 0x1 &plic0 57>,
+					<0x0 0x0 0x0 0x2 &plic0 58>,
+					<0x0 0x0 0x0 0x3 &plic0 59>,
+					<0x0 0x0 0x0 0x4 &plic0 60>;
+			clock-names = "pcie_aux";
+			clocks = <&prci PRCI_CLK_PCIE_AUX>;
+			pwren-gpios = <&gpio 5 0>;
+			reset-gpios = <&gpio 8 0>;
+			resets = <&prci 4>;
+			status = "okay";
+		};
 	};
 };
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
