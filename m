Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 088C1D0C603
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 11:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UzrhcOuuDwRDL09aiZ3ahPT8n6k8/rhygSbv2I+IrXQ=; b=1XWCWX5yLo2ZNE
	skGQxJlbewFL4roOopgnchLOUEJROq+aiiw29mbYVnCYql6mfv3Onk6DVlIEXX+W8mQz2MX4sIwJ3
	20MkxzSPjbM6lP4F13lt7JqFKfVGyuLQlATyLtTqfVSZ5mo22Q8SS+EOlYq6Wr+8tvbxYN5RKMEcQ
	GhCgq9QYgolBpVVnDYHHi6OYPCqTUSxdcgDbiGGnSISaVbXvKZ9WUDfHjXLhqCBaMq5ZQayh87OoX
	EoZKmthP9VmnpqrsyNE7/Pew8ogva83I53BaMWHp2iyythOSvpx2hyIqcVWJiUuP/VXpswN17St75
	4Le+0TKziCuAcBRl7AZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IwX-00000003aDF-0BYB;
	Fri, 25 Oct 2024 11:57:25 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IVX-00000003W0b-0ZtL
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 11:29:32 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2a999b287so1520114a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 25 Oct 2024 04:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729855770; x=1730460570; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SYrXumY7HgWfJSOA6I3P0i39HkYnIijU1OfOIgv7Pes=;
        b=FrduFyz7dHu06nOCuzDKzA6VmmbNf4Wr2aUYyxMCbWlhEpEGxrdB6oqJTxNMaSIOB6
         elcRC7NSbfeXsqfWsroZuvHfpDYjHHN3y+stuNlWKNyn59zt3SiI9FIG0f1rE+wc9ZpW
         NlpRQpiANBBo4Y8J0PMUntkXIcaaz72AoWnTw620S1lVSW1hoJzKF5H3wA7eD9kfyMs5
         TTBBYiPl8GCF11uV68HTuvm4XLxncNRovH74kW9GYw0FHQoLuSradEXop5gGgUQdYi9X
         782qfmV3vr3XXKPWxbh8Zy2T90J4BldeYzkaXKNnx64h1pbtHmKntJxGGuHkrJi45x6u
         iSgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729855770; x=1730460570;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SYrXumY7HgWfJSOA6I3P0i39HkYnIijU1OfOIgv7Pes=;
        b=nzfOQBYNPhOu14tO8Cy6neaYGuk5Xt/dhBBSYeyeOuLusDuBYNBIIZHW5aiZ++UDIN
         /i9pMTk+nwmUmC7OaihMybyyZi6CRlJdvVVr5sNGkD22CWCrNRuoyd0DgGw3d8gqH8/X
         rQX+GzVTSXRb5AbLaWFB84G9LVJy4YVZoHQyzUjeGGKxBD5vJwYMRhlYjMRvx51B1QmJ
         Lo9dvpZVWE0gse7oY2LirgDRyz0B0mBgaiWH/eiw3Nwdi4PQngImalg/lxR7zmMLCOQx
         zjM22/vdx3uk+pXaka30I3XdKLRUWZe1Cvmozt4GHqP6l4dDG4aZ0lLErzswu0dlVspD
         hOxg==
X-Forwarded-Encrypted: i=1; AJvYcCUWL6+YPFqiA7AtOdFjFAfM/DCd7B/zPQjSVCV2uZoqfNrmym8T/TFlbL05g6o+Kak/UZ8Zqpo27TUkwQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwO9vU07++0+hwpCHau57TqGZfI/qNK9vWWmM1lovDuHXXWcHMW
	D/u/k1W5w13FLc4BpGZqFDf2PAkysNAk9pvwSeJYhAxSPbjGLYFU
X-Google-Smtp-Source: AGHT+IE+tBsWv5oc0Db0V+04UACjLf3a+c+NXelbG9Pyc+UgNW9JpAQrRFY4XfVu8yX+7kdORHF7Cw==
X-Received: by 2002:a17:90b:3512:b0:2e2:cc55:75b6 with SMTP id 98e67ed59e1d1-2e76b6ead44mr9891288a91.31.1729855770036;
        Fri, 25 Oct 2024 04:29:30 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e36dc3e3sm1172555a91.33.2024.10.25.04.29.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 04:29:29 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: Inochi Amaoto <inochiama@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] riscv: dts: sophgo: Add sdio configuration for Huashan Pi
Date: Fri, 25 Oct 2024 19:28:59 +0800
Message-ID: <20241025112902.1200716-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241025112902.1200716-1-inochiama@gmail.com>
References: <20241025112902.1200716-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_042931_199019_F14C7DD5 
X-CRM114-Status: UNSURE (   8.85  )
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

Add configuration for sdio for Huashan Pi to support sdio wifi.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts | 11 +++++++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi            | 10 ++++++++++
 2 files changed, 21 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
index 7b5f57853690..4ea27cd357dc 100644
--- a/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-huashan-pi.dts
@@ -52,6 +52,17 @@ &sdhci0 {
 	disable-wp;
 };
 
+&sdhci1 {
+	status = "okay";
+	bus-width = <4>;
+	cap-sdio-irq;
+	max-frequency = <50000000>;
+	no-mmc;
+	no-sd;
+	disable-wp;
+	non-removable;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
index bef89979df78..c18822ec849f 100644
--- a/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv18xx.dtsi
@@ -319,6 +319,16 @@ sdhci0: mmc@4310000 {
 			status = "disabled";
 		};
 
+		sdhci1: mmc@4320000 {
+			compatible = "sophgo,cv1800b-dwcmshc";
+			reg = <0x4320000 0x1000>;
+			interrupts = <38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_AXI4_SD1>,
+				 <&clk CLK_SD1>;
+			clock-names = "core", "bus";
+			status = "disabled";
+		};
+
 		dmac: dma-controller@4330000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0x04330000 0x1000>;
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
