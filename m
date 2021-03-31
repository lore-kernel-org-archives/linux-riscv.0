Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56148C433DB
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 09:27:42 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EFCF96198F
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 09:27:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EFCF96198F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zKGHoMmkRRpHnJW59MaubpmDphO01GuesYOqSCJmpz0=; b=JC2CYmAuCoiQ5NCVEg52So/tW
	jVicGW/QkqexQzlhloX5isOQshiFpU3yzv/p6Jgkkx0Ki+hV0vUIGVFqTtB1NjpnUonC+BMuCw7rY
	WuEMflXyUR2ghdIN7XqkwsnrsmHCIDSKQqFexrYs4Vr94LfNwS5rxbbR4oit0dycsmGLqKxpt7BB7
	f/uO9Q8E4ek3Wgl4YlYRsLu6pX7daW4bVQI2uuHBZg94lfpno0VhJEM5dd0GZOq6TEdPwei74q0CL
	BXkrolCIDgUTF5x5cT0gW85EmhfErnAS6eEiUVin5BhWAx4PBotQr/DhyZpIZoVqrR7k/S64yeQY+
	bGaiDneMQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRX8C-00687I-UN; Wed, 31 Mar 2021 09:27:21 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRX7a-0067wK-1A
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 09:26:56 +0000
Received: by mail-pl1-x62a.google.com with SMTP id g10so7593830plt.8
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 02:26:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yP7PEulAPK6UHzRxTLeSHifkookZOtRjzWBAZ0O/gdc=;
 b=LOw7EcVTffm/NjdpGaGKUcEGQ77gQ9JBGdonP44rzUgXmMgCpaNUUehuHZr1fxV1UH
 3BBm56IlXAYsVcHNKpUz4rfO9dQS24nWfBTjUsvikelk59OREv70zUWGBbH2weoPqb1v
 fe5f2NqgE0tBYaHEv53mPjfxC0q//a/k26g7ERe1p40gF7ZDAu55vDVITOsHtel4i7gk
 t193rAIOVpfvOXumSpeM5SWmZTcuFe8Ui9c0OnT1wU6EWF4zKZPgVgDWc6s3/YmvsIVs
 DSj7O3ADkHdwvuty7xC835x7GQzPyJUO+6tIJue0z3CAXUBR/aUoKr6JELz2lo+C+iNH
 gfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yP7PEulAPK6UHzRxTLeSHifkookZOtRjzWBAZ0O/gdc=;
 b=Oq349Tr89ej4UfCHVOyqgEEFtxeqC6zx0DugNhKAX1E2H1zbloCnLBq3vScx242mEj
 d7XB6y7c0zQeds2lJgHESEZGAr+2vUxbBvS8AZtqjZE+e2kcspb4st2P8d4Fjol7afeb
 r8X7J1dmo4eHivEvZmiCNfjdFgU9SmNLkkdaW3Ss45MfXFn3qP4GUOb2tbI6uTBG10Fw
 1E8IiXUfpImUzjqa4DkceiHhrkjjEBxGyPReZb9BdCjRwHVNPArYK8gngDuib9R3Dp7R
 8aIBnlz0voniQ/Po3OgQpA0l3Kd9cD5kXrsZQyx6bt27C04toxZZlE79eKOUES0he/p6
 WsQA==
X-Gm-Message-State: AOAM532fGkLGW7Yo8jh53jiwYbpO7GJ7YHxrwu3a0O299c8vTvnZrwO2
 omG/Ptc2sXBYyu7Wekg6G/WCQQ==
X-Google-Smtp-Source: ABdhPJyOcOzTnUY5eHiAJ1S0x1EGTnxPs4BI8SbPuOMDe+Jv2va6wUKiS7UneRWEWjd/DWnW7Vlmhw==
X-Received: by 2002:a17:90b:1987:: with SMTP id
 mv7mr2512728pjb.152.1617182799984; 
 Wed, 31 Mar 2021 02:26:39 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 143sm1726505pfx.144.2021.03.31.02.26.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 02:26:39 -0700 (PDT)
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
Subject: [PATCH v3 6/6] riscv: dts: Add PCIe support for the SiFive FU740-C000
 SoC
Date: Wed, 31 Mar 2021 17:26:05 +0800
Message-Id: <20210331092605.105909-7-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210331092605.105909-1-greentime.hu@sifive.com>
References: <20210331092605.105909-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_102653_530220_F482FB3C 
X-CRM114-Status: UNSURE (   7.49  )
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
