Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 519CEC433ED
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:01:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B284F613B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:01:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B284F613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=qeY5UYQzaCYPGu43WgN8vrjU+08Mywlp2j8o3TbHSlI=; b=XL8R9M3c1NJ57Kv6/I/I1/sac
	wbsAAxrsc3/1nc3o4Pu9u8x/TAbC/k9EPiS6VlO8ht7hjaUT/HxRAMJ2s1/flxjmP/TzXoO0gn0ww
	H7vFkiq321nkeknEWzWkDtMFrxeM5YLa3mbQfj5ftjTPx9TxMJollMp/MMbuTiZlYkRWMjulOYdlP
	7qb7Jqs6xCAGnycpUR6Mhld78QzJdon1YY7ZvW6f8ucWpXCeHnbd4hYX0GZO8UyGSE2OXnZSRkS/m
	hPhHvXrIKfgH4pSiBoGJkayqSrk6kyxPwWs+l/Sp2uvylriF8PYxbcV2RxhweoywAaKJPELZ8b8SK
	BKpF/i3iw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldsnG-00G25i-6F; Tue, 04 May 2021 11:00:46 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsnA-00G22u-CE
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 11:00:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Bd4fUtUUCN/HpB11MmfQQGuVzm8gcsXHLL3mbp/tsMI=; b=ttTZFuuFRT0YibNJ4cvNiplMoQ
 jWE/ODKZ4gKIVBox8DDhkFThYlihG2cGjLbSoW5o0DXWsosJrxgXFeRO+Hz4AgwiAA0TfUZDJo6Ea
 14VFcEq4fPmV6nfLxaWNkXEAEvaD3ur20k60P4mfSyIWki2RdbcSwyxUSi9xF/Jtydt5fVwnds1Cn
 eOjXFMbjvnjcKZTYqKgQRrAqf3fN0n1HGG4My5BAOV03hTh3GfJuaR97l0ah8m7MAU2ZADZ9YK9XK
 7vz4ao+ufbA2lGb0k6tckkNuFue80ICvBw+LvfSkJzhqYt2w5HkveRjhuD6e5cN+pvn+WcANVgnyq
 htvuMr9A==;
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsn7-003uuj-SX
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 11:00:39 +0000
Received: by mail-pg1-x536.google.com with SMTP id t22so6512647pgu.0
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 04:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Bd4fUtUUCN/HpB11MmfQQGuVzm8gcsXHLL3mbp/tsMI=;
 b=gxf7CzRhIEg7zRxAYGfW3O9gQpoV2/SC9xkdYvQf3t+rCcVcsEqdhkegYCDClL06IQ
 nNCvHtQnt2tAtCMP/3gx3r/XxbYswP6vnXZO7suvBW7X1mwBvhXuau0m/XuWNLv38/9N
 eN2AN9ttEI4gDJ29x+0pSaSXv9wc6K3vB9XcRHoBhtLXHIvV0LRs8BVDfsScBrgeZPeM
 UkHPGcCTozEn+KaHV4WeUqZ/IVdH4zhep8U4PtnPDLCrTNih8FfDVVXd4Olpfl6YQIZg
 1rKIEmXBw6aeSdAIgAfCF2wCnbsGLCur1hSjinLYVbLNDDxRlcn86lav+MEPJfQknkDK
 hbuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Bd4fUtUUCN/HpB11MmfQQGuVzm8gcsXHLL3mbp/tsMI=;
 b=jByhQl9l14p8Yf1ZXoausBU+r7M0f9GsQ0zR6spjkYd3nM9dIZALkmtDcvrOoR9F6G
 wzSvK97yleFYwkG+AJyqvbGwtAEg9SpuXRtQ44P6O1qYCm3P5ksrHH+XqVBdLEpAuBmj
 P3OVXKtFmx0y3zf4ioccaAU0eHOFr/VpvP60g7JlyoM08LZj9U2TcIuk4o+hXZHzAHQ4
 WTjpU46jprsou9sHBy/cY7jc5fCJS0+1m0MoLBTyvibPKfrlgSnlkCJ9+k16fNsKMN/1
 nqQm0t/qL3fpUZOREeQdKpphcvnwe4Vu04apw/AeEBDaOS1xpm05RDOTFoqzIOzGmcpW
 2rsQ==
X-Gm-Message-State: AOAM533lKrW541eTp9ck06K0doRCkc76K1j1hZu8UUww7e7ndjOdRBp0
 YfL7DHNH+KG+7uFT/rKZkilUcg==
X-Google-Smtp-Source: ABdhPJz46MtHcSpwQA7kaeKNf5SD74WureuuZMKtrRm8c5ReJSIREFjLSWxpGsBIBtCzVJDkaWsUTg==
X-Received: by 2002:a63:1d19:: with SMTP id d25mr22535208pgd.169.1620126037434; 
 Tue, 04 May 2021 04:00:37 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 04:00:37 -0700 (PDT)
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
Subject: [PATCH v6 6/6] riscv: dts: Add PCIe support for the SiFive FU740-C000
 SoC
Date: Tue,  4 May 2021 18:59:40 +0800
Message-Id: <20210504105940.100004-7-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_040037_939411_AB6C19E3 
X-CRM114-Status: UNSURE (   8.58  )
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
index eeb4f8c3e0e7..8eef82e4199f 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -159,6 +159,7 @@ prci: clock-controller@10000000 {
 			reg = <0x0 0x10000000 0x0 0x1000>;
 			clocks = <&hfclk>, <&rtcclk>;
 			#clock-cells = <1>;
+			#reset-cells = <1>;
 		};
 		uart0: serial@10010000 {
 			compatible = "sifive,fu740-c000-uart", "sifive,uart0";
@@ -289,5 +290,37 @@ gpio: gpio@10060000 {
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
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
