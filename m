Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A2D4C5AE49
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 19:44:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xTkqI4P+g7SyTI+Es8xX1RtwszMWbN0PXosAZlI/OQg=; b=AkMgPugxYIK5ab
	9ym0ps3v4XA12RuXwdk4nDaYG+4eZKsfO4+1ojWYziFDsageSDBmmpjonnvTSOyHVwnmnsBztuoZk
	TeJXpeHdToK+RP8NZNph9X4qKsiq0QdmWPHX07sGJCBVkzKgGJ2HVn9Zb8j+wJs0TK8gqDt1lZymL
	rpmtLP6KkMjIoc7CTUy5djx+r8gn+MrmK4Nb48K5lsZ6EL0CQfd8KSnsSL292vIgAZosiPeY1yDrx
	TOqnm0Vz6Q4jJDS4YDywR4Aqu/giZ9Cxj6rurx6jUfWTjRLnivVQ2Ut+gaGg7ntPD/JcRIeg3Tsqo
	1R235MHi2JKPkzkbcSkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQW-0000000FWcR-0EMC;
	Fri, 20 Feb 2026 19:44:36 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWQT-0000000FWaq-0DSq
	for linux-riscv@lists.infradead.org;
	Fri, 20 Feb 2026 19:44:34 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-483a2338616so13670155e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Feb 2026 11:44:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1771616671; x=1772221471; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=idd3phAMZAFbXYRAtJBjuUopeP1FYK6fM2z0tYAIx5o=;
        b=LO/S89F0qxaOcTPdVUgaVv2Q5iH89S9w0vEp7DHRVCJcDeETScFmZ6gCSbMfodX7DI
         hITpRLOzAC+7PxkUmSkOjVaQFQFPHbdns3Dz+61NfqY1bPt1XMMV5Fuml1rxSiCKJxg6
         TVKhnPfm5NUuL4FV1UNXKs1LFI7wdfYTzWo7nnm5nJjFyuyoPuai1qRFJIMfv2JswsAQ
         s3wuiTYHA7k4YcptDyZXiMj4qOe7JZe0Jb0ETFZr6dlEYlLDDgjdxLviFW7NBw3HJQ6x
         yK4zWll1rn+araUja4/aGcxohhY6lTIh24DzJP0nqfB93YJKFOX/wCl+kgEEqoyvfR2K
         wD0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771616671; x=1772221471;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=idd3phAMZAFbXYRAtJBjuUopeP1FYK6fM2z0tYAIx5o=;
        b=YBXI4lxqUvvGBETAo5MtRvvzrWPahw7pXGlpN8iEHHUrULIY0D6X+D8RmTYZluB4KN
         uQvCsnWJtkUZOYE5JhGIrBDUQGhM2upJvwRqZOe3f6zcmqrQu5wJg8vTRRd//VPh6R8+
         eiL1nQ0kheCAKJTpn0KjkTL0uM0IhiETW/9dYebj2T7uF2vPR/kX+INID8OmFTimQfpt
         ZO4jHffl76b9Fb3Rwd3LTGbQmNLHN4V/N9KehSlLHJtvBIt6vkQWbNnLr/dvCcIcm7Pk
         TMqOn9VctII50ktw/04p9DsnAioNMDCt4MbLqe26vtEoQdZX2aKtrNKIvvruQg3kLe+d
         h2fQ==
X-Gm-Message-State: AOJu0YyOQDnNts9YNlYyCMBzV8Qe3H4TXb9CZTzRsHMrC4pTbUoOzm0h
	lZd8AKY9saAT4srA2EXFM60Mnycb7Xn6yFxk5wJK7obolJmXcw1bAKoaxuH/ku3FScc=
X-Gm-Gg: AZuq6aJG45AVRaah9szKAEmNuC2+jZ2b06OZH75q1fQHFnEDGnpvDr2Hzi4Deo4o/2a
	LTU8lwxLVMk5yLsq1NGPcs6+sZvmCcMZc5FkRbMyfDdkWqDd5+G240/70mi+IE/WKQz8PI00fYO
	FcXFTvcWQJm8H8LM7XQVDIvvlb4TZ9/15xeGJgzbPEID21QJ1UUwDw2AgeHB8fvGaZuKWfIeiad
	Q8ok2vDdagU7WaU8eTQTuWZmGOiQAzXwMj6LW6lKKV2g6gMDsw9yHpQUuIWFx3vakz7xIOR2gMJ
	jO3PmpSRTWIIQ0y+KNWdbmzk8fk8dPSS+P8ilAHq0ayw5vNnTMV7ltpwpQuYJ6RNjZvbisqTAbT
	n/Gud0VVuXDwqEH74Mlw1lDqblejAGB55+9fMyMn5IbZ56RAlS8qUdhw7DPNBYne53HoDz/PA3R
	7iy57WK5yoQCLRzp7lFEP5
X-Received: by 2002:a05:600c:6206:b0:465:a51d:d4 with SMTP id 5b1f17b1804b1-483a95b6debmr11062065e9.6.1771616671414;
        Fri, 20 Feb 2026 11:44:31 -0800 (PST)
Received: from [127.0.1.1] ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a3e1b7ccsm24460755e9.11.2026.02.20.11.44.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Feb 2026 11:44:30 -0800 (PST)
From: Max Hsu <max.hsu@sifive.com>
Date: Sat, 21 Feb 2026 03:43:57 +0800
Subject: [PATCH 5/5] riscv: dts: sifive: fu740: add PDMA device node
MIME-Version: 1.0
Message-Id: <20260221-pdma-v1-5-838d929c2326@sifive.com>
References: <20260221-pdma-v1-0-838d929c2326@sifive.com>
In-Reply-To: <20260221-pdma-v1-0-838d929c2326@sifive.com>
To: Paul Walmsley <pjw@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, Vinod Koul <vkoul@kernel.org>, 
 Frank Li <Frank.Li@kernel.org>, Green Wan <green.wan@sifive.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Palmer Debbelt <palmer@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
 devicetree@vger.kernel.org, Max Hsu <max.hsu@sifive.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1057; i=max.hsu@sifive.com;
 h=from:subject:message-id; bh=lDR4hwKAnZx7jEioVJrSlzqGnc79ShiEsvnMpfk7hIc=;
 b=owEB7QES/pANAwAKAdID/Z0HeUC9AcsmYgBpmLl7WJN+KlGhaQDsDQuRh2UU1WfdgPf5OXwRa
 svTz8p0n+uJAbMEAAEKAB0WIQTqXmcbOhS2KZE9X2jSA/2dB3lAvQUCaZi5ewAKCRDSA/2dB3lA
 vbM0DAC+ZD2Mg/GWBwIyC/TlvwOiFOFQKy4esK8Dgt7GVcHUUoFwIEAyxbMsk2vMABjwkDseaQA
 JyDYZmK5sGPB3JK2U39FMzpY/+Zd3Dz7ZfHl2jnzKc++Dbw/1wXnU84mvIueSLfUNY1fKlqGUIX
 LUg7/2YfBSYRyYfE47D2MsCpLN8F6GHtPnj4GHJqH2uNkvl2dbM9b5eLkXeSYkG3DHnOQZzv3Ud
 vabdRYU8MyuvDpgrn14qt3NNxOSA2sb/DvXMJpVebiTyLQEi6N5jyW2NXk82YeqS2ORQMgtixxd
 ZRg/8RVFk1WRcE58fSEjd2fLoeiqVTQqCgPv3/5np+c5WPyZMn24rEC1xK2u2cITJsx7SzRGkRk
 YSrL1akXMVO1xgvz9D1JQVW4hiNMNfAL5T6ScMh42motZmukkGI9R7TnfsJmPe4mAkk7CuvOY+H
 ab2MadPqZA3xZ4njdWv4716jypgzPesD26uWEGpwrmw2DGXV47yWdPP+VA+bZ3PKQbw1Y=
X-Developer-Key: i=max.hsu@sifive.com; a=openpgp;
 fpr=EA5E671B3A14B629913D5F68D203FD9D077940BD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_114433_109851_D27E1FC7 
X-CRM114-Status: UNSURE (   7.64  )
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

The FU740 SoC includes a 4-channel Platform DMA (PDMA) controller.
Add the device node to enable DMA support.

Signed-off-by: Max Hsu <max.hsu@sifive.com>
---
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
index 6150f3397bff..30d0d6837c57 100644
--- a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
@@ -329,6 +329,15 @@ gpio: gpio@10060000 {
 			clocks = <&prci FU740_PRCI_CLK_PCLK>;
 			status = "disabled";
 		};
+		dma: dma-controller@3000000 {
+			compatible = "sifive,fu740-c000-pdma", "sifive,pdma0";
+			reg = <0x0 0x3000000 0x0 0x100000>;
+			interrupt-parent = <&plic0>;
+			interrupts = <11>, <12>, <13>, <14>, <15>, <16>, <17>, <18>;
+			dma-channels = <4>;
+			clocks = <&prci FU740_PRCI_CLK_PCLK>;
+			#dma-cells = <1>;
+		};
 		pcie@e00000000 {
 			compatible = "sifive,fu740-pcie";
 			#address-cells = <3>;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
