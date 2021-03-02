Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5296EC433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 14:25:34 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 42DE564EDF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 14:25:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 42DE564EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=+WGUM7i0SqyG9RVG33wumywbzeouAbCAmBxIMQSnyD8=; b=RNoQ5ZdaSL7CMnY7ahSgMtxHo
	F2IT8FS1hiJqmn3yYFXx6BlJvPBfmCAmHdScYASoubQ5guIYdYIrW7fX7pC4pQe+lGwAEur1W66Pa
	ahN0fgSPyKXRUFf3cTMuHYuxiDRA932JQg8d35toGMGYzB9Hxa74YlWyxLNBxxk6neT9cNdUh76+P
	xsKHk63TKahTbmdWCkwgpzWqeWuhjfbTJYkHoXn01vYJAHSYJROCIeht9fRO5nTRcYxFN7d1jvomi
	0u57O/3MZCmtR/8JewdaWuwrBJNy0nQlluTbdvnxay2TBrtJDGra5vSFIhjz/VO1aDG98f3xcuheI
	fdeMhmnZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHSQp-0057Kt-Ez; Wed, 03 Mar 2021 14:24:55 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHS86-005326-Eb
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 14:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description;
 bh=Po2WnbeRcNxbdVRWP+uTe3ZxilZPtJNj+wNjess1Fqs=; b=spV0cQ1v07EPq2LbiMgjPp4uBM
 e1y704AoCTomDjHh9K2+6jymMgrzlThI1eCWyp9gph5XHJrZaFgn0hvMAFeb1KwLVRk5NXujH4ucd
 uWK8Inh/y5Ari091c3+jPcqGnb5do5IpsjLor6tNcnb0MZKkhWCFPWs2BsOdmLKDgsFDyL+C71zVD
 /EsKyuVMUoejETFZmqlFth99eQE1GBy76DrI+0ofnwqw+DKXDWO/BKwkZO+z5RTJ67Sh8AppqqOEB
 8h/KcGq6ltiZhwoJPEGl76Ws63GMsrpkTqvbqlinjME+2/y9RzCrB12XOaHbEHAdU1ER6F22l2MbA
 8CAmRQpA==;
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH2lp-00Gyj1-VM
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 11:00:55 +0000
Received: by mail-pj1-x1033.google.com with SMTP id
 d13-20020a17090abf8db02900c0590648b1so1083052pjs.1
 for <linux-riscv@lists.infradead.org>; Tue, 02 Mar 2021 03:00:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Po2WnbeRcNxbdVRWP+uTe3ZxilZPtJNj+wNjess1Fqs=;
 b=a5MyBXo6eov2ekIk8ZTfKHDNNdEoI4pKVri0SYc2F9SqYWibdQAXMjW3/w7FU/p/kg
 c51InQz0krRao9T5zPLw59TMVGitBuCGxloOW2a6N2HxyYz+5D+BaKS6EexoelT6VG/F
 cLhmS6GHKPR/R9pUBTpK+ZzLQq4r3k3u5M2k/oK8DNOa2g9pRU5In7tUGmZrN5oax8Gp
 xtafybVddL4BjJoA01DR/QEKBy55T32hKD1PoSLSqD/4iLIQMuoV5gKApwWVSxk36oMa
 7VrN6Rzarf0ceik8mxDudoNJSOkGYM6IgV9gBF765dqYhMGp5Cogl4ysmSY9NRz8K7qk
 G77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Po2WnbeRcNxbdVRWP+uTe3ZxilZPtJNj+wNjess1Fqs=;
 b=TQzTrXT1Ouq15DhTkctsdgQNm1yFPEF2QO4a1lgOjChJpgj9rhHpT8bjNud2DGbq3N
 WoiLZE/xhSiYDVHafaSmm8P7HzcStjf4+QbNgY8qcj8Uwp3ydM38k6Ow8IAxLrd8ONqO
 eZ/34uiyElR6cBgE5/5PegH7BfB6S8Tp3yc47RWnV/T/HJ11W1qtwjyhLtZs+S9WjDcc
 Mh+b/cpRgbxt4vO3x4zjxKCZLZvZwUL4TNmKChK2pFjFsxhpygEPh4dIyEI4yEe0S0gN
 TJlpfenPlzNolXNipNplCEVjVn6xb47CfMCLiBMJSY1WRHKtV+rUujJOErf6ABM8TtEC
 FgKA==
X-Gm-Message-State: AOAM533HYqy9so/09INS2md2wuBorrSqoX1sUXXMzmnJ6jz+Ji37JFnG
 MfHJpZD/3fROA4iLcYtyXYeD/A==
X-Google-Smtp-Source: ABdhPJxJIJ3Tse6OxPoZISwk+LpR8TLSC6nbCdGBioVdI/phJeX6zkYJhK340UzKOl5FITpYzpeIZw==
X-Received: by 2002:a17:90a:9905:: with SMTP id
 b5mr3711228pjp.195.1614682791332; 
 Tue, 02 Mar 2021 02:59:51 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id t26sm19500451pfq.208.2021.03.02.02.59.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:59:50 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFC PATCH 6/6] riscv: dts: Add PCIe support for the SiFive
 FU740-C000 SoC
Date: Tue,  2 Mar 2021 18:59:17 +0800
Message-Id: <cd88f8d29ec2050a22eb31e94f9efc1adfc4db2d.1614681831.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1614681831.git.greentime.hu@sifive.com>
References: <cover.1614681831.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_110054_967882_523243DA 
X-CRM114-Status: UNSURE (   7.70  )
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
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 34 ++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index d1bb22b11920..d0839739b425 100644
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
@@ -288,5 +289,38 @@ gpio: gpio@10060000 {
 			clocks = <&prci PRCI_CLK_PCLK>;
 			status = "disabled";
 		};
+		pcie@e00000000 {
+			#address-cells = <3>;
+			#interrupt-cells = <1>;
+			#num-lanes = <8>;
+			#size-cells = <2>;
+			compatible = "sifive,fu740-pcie";
+			reg = <0xe 0x00000000 0x1 0x0
+			       0xd 0xf0000000 0x0 0x10000000
+			       0x0 0x100d0000 0x0 0x1000>;
+			reg-names = "dbi", "config", "mgmt";
+			device_type = "pci";
+			dma-coherent;
+			bus-range = <0x0 0xff>;
+			ranges = <0x81000000  0x0 0x60080000  0x0 0x60080000 0x0 0x10000        /* I/O */
+				  0x82000000  0x0 0x60090000  0x0 0x60090000 0x0 0xff70000      /* mem */
+				  0x82000000  0x0 0x70000000  0x0 0x70000000 0x0 0x1000000      /* mem */
+				  0xc3000000 0x20 0x00000000 0x20 0x00000000 0x20 0x00000000>;  /* mem prefetchable */
+			num-lanes = <0x8>;
+			interrupts = <56 57 58 59 60 61 62 63 64>;
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
+			perstn-gpios = <&gpio 8 0>;
+			resets = <&prci 4>;
+			status = "okay";
+		};
 	};
 };
-- 
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
