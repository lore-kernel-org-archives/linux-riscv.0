Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E246C433DB
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:27 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EAA0464E38
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EAA0464E38
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p9b+o2//XWmhcWvgVi0OHhazpkbRdtcpdjsfANMfkWA=; b=GrX2UiyXbbaDbRl4yYMufdD9Z
	EKH3R8kuoHWYrODo8YgSgRGihwfsOvTcZRk8Eg3dCmGoGMR3J3vwhGByn2K5ELvCZngA7tqOe0IRi
	QqlnDCDJLJhzQzvsRb0u3/mnPe30+HVIioeGknafq274drQ/Fed1so3yL/kca7W3uPflqnp2De0Zh
	NB1Vkeb/n8XVp1wwdB9f3rgeRT7LrG4QQDftKYcmSDgp1GqHWXprzeqPpmHoAQRpZasr0sDVXRDCg
	4C+cXTGzyx2it0AuDxLdj8xI5BsgsxbWk3Z/qreYEedTo1ohdTT8tgtSmRba3MHhI3iCSENw//w9c
	gbxn9eI4Q==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMlqJ-004aYm-DZ; Thu, 18 Mar 2021 06:09:11 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMlq0-004aTf-RF
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 06:08:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id e14so750651plj.2
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 23:08:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=H4O8Pz9t8/99FT90e18/xfiNTrUM7XDwRwcWmzhNsZ0=;
 b=C1CilY+TIsLUfNiPWi+Gp28S0ZCZuAlTIyNcYPmntFgRJpD8pRA/q9FVezUwJdWnkr
 IIR5kgKJTi1WYk0OmrZXrrennrBJW8Evbp0+FToBwqILhxGxsMAG5uTZwB+WpQBBLjp9
 gHxV9lV/TKP19fEd8wfN7cdbJ9uQLW55eqpBm/2ZTN09eLD96WgwJBvAs0ZVFv+sTMgJ
 fDUx7S4u4ABXOuYGBZoIV3DaM6jertw5GIwyGNlXfpZ+QDlWwajN3GmYzPzogVhm9z5z
 dBWMYdXOGIAeKRQHeD1d4JG8d+y0pRQZdPeyDQymK+PPflbb2Qilqo04jFRZxx/ONDUq
 WkuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=H4O8Pz9t8/99FT90e18/xfiNTrUM7XDwRwcWmzhNsZ0=;
 b=kjugbFxPa9LBnsasLaEIWSTdYFV9EFD4wZrVv7pvck1mtEBd94kahnYoQ5aLqt/ZR3
 mXruCXtkB1K1/DojNGUEktAp3H/gWv/ZyMNBHydHA541Sda95MXLI3OapjtxK0KuYDX0
 yqWXlKDFnMQ8vjMe/GsAJy7Vo6o4LfKrNxmifjHPDRvFn88UOtY86312tF2FXhlEqy04
 pJrV+hwB/YHHt7qkbg3WciTBCnNqxXz8kgpys+5SdsqqqDIpYJCiC4n4iFvCfaFYcER5
 dszVIdImVmRP1pfu0JMB6ZNBx7wjbvV36nrbICLLIcm0joPRPh4AyE1fo9QwPD+QONfD
 3JaA==
X-Gm-Message-State: AOAM530HRUunOPSLLC8ga3dH6WeVWnREmhOUdkA5fYr4MZ6SDAUZt/Kz
 O1ATG4XPtga61W4n/zcBlvdGUQ==
X-Google-Smtp-Source: ABdhPJyl35YIgn5TvN5MNKZ1TPt5+h5j5mZkq8LUsV5fL4Ysw4zzLFVIjBUzx+FmMc3kdIZujmU8Mw==
X-Received: by 2002:a17:90a:5d10:: with SMTP id
 s16mr2621850pji.126.1616047731651; 
 Wed, 17 Mar 2021 23:08:51 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 68sm967353pfd.75.2021.03.17.23.08.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 23:08:51 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v2 6/6] riscv: dts: Add PCIe support for the SiFive FU740-C000
 SoC
Date: Thu, 18 Mar 2021 14:08:13 +0800
Message-Id: <17994571deaf703e65ece7e44c742f82c988cf39.1615954046.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1615954045.git.greentime.hu@sifive.com>
References: <cover.1615954045.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_060853_038423_27E54AD3 
X-CRM114-Status: UNSURE (   7.76  )
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
