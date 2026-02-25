Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8397AF4BB99
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Feb 2026 10:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KL2RI5Imc1yWQnUwBUeZIIyfsdV69ABMG5419uJbnqs=; b=gBFG7iC/f/Pafh
	YwJNpralp0s1AnJAH2yPIK8ZqVna+QTLGxSpk+QoGzuFjtVe15zd0boMj5iJIZe60rtukhFvyMtYN
	GxP/7arwRlLF753WIfxPWUCH5xOpYYSvOXGMfquOlNomAqUNFLdDQuIoNKRjupe3/drBw6TmlXE8f
	eEfZfNNS5hSOhROmCUFkRijKV2fxtjor3sFaysgkcv27zxBjssitpBlEQZ+tHvH/bgJZdRLc6BE1O
	3ybNkamVvm7Z7zx22FYRq3hk83gxU9Tp49/asP45hYfdM8ZoaRC2ucaifaXstQRTdAuiA58f6lM9K
	2ATqbpS3aPW2MYULJw/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCKY-00000003p2E-1djt;
	Wed, 25 Feb 2026 10:41:22 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvCKT-00000003p0C-1maR
	for linux-riscv@lists.infradead.org;
	Wed, 25 Feb 2026 10:41:20 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2a95bfdb31eso27633515ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Feb 2026 02:41:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772016076; x=1772620876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZSPeK2iXnMV3LrwSQxDZgTSQGbBxT4o3wiSW4SZQv5k=;
        b=Co/CG/m9mYC/iHpCqgL6IgCusGfFec/ofj10SCCtQBb0mEvsPhja7uQ9iWXTujWP88
         jPIqQbzNJVAbnSlv3BjS1p3X4saWlq/vfnZxnrk6dnbN8Is5S3t1S04rfEnfqjmpFczu
         D8ehcFb9KmX6Nxw6yRE0m/7F+cQgcqLAgWwnvWgtocBYJSflIIJy2H2dswaMwz5qH7Hf
         365xM8EQKdpiXOkT75sb9krHC7kVN0kjCPeekNhBt+VoCAD8d3jn0GauUEUpRMcYQB5K
         Q/fCihPMeIIIHoL82q4Sm2e/Rh5gmlNvnuoWVFUhOm02dlWNyJMvaZ2jVjzCC1Tsx0Cx
         O3IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772016076; x=1772620876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZSPeK2iXnMV3LrwSQxDZgTSQGbBxT4o3wiSW4SZQv5k=;
        b=j6SJOj8uZEIK6o63Q64ELUmP2cDk5WgaaNvBpIXQhxtA72wUTSAjnRA2Dgc2sUUN/a
         McdGOaZiKOc3oejvYl1pAtN/6/vpLQUBeqoZ7Qrv30BsDzHYxxIaUyqk0J9jn5LjHWgW
         k7tRm8i39/ZYgnAytnAywh8EfCtasHxx9uGa6NOk5AglYQluZB7ej39ZBrs8DMulMD9i
         ZjJHG0GokkwVjjmpgUe7bOvOCYa4L52c6/y0pbO6CFWzdIwpgk/yZ3TvTXURJucIbsKJ
         rrrvbEwJFeKwsWNFFnsuNlO7CroTGN2bWJdEUzAZzkDrmKIPvVGF55uySqXmoctEeGGB
         JXog==
X-Forwarded-Encrypted: i=1; AJvYcCVpNDZd84teSQxSMq5ewQj025C3XavaAo8bxXqMyj0tRFvYnNwUHgL1tXBKQOQGlGomiI2JS3kYFJT61g==@lists.infradead.org
X-Gm-Message-State: AOJu0YybcUs90qRtJUQ6NRQb0gMOABLsHkvQJeyzFAB3ccHvrmN77efs
	KG9RhcycSMqVRVeFLeWg2LKGXKm9fL1u7Hd08exM6FmV71Bodg8pBbT1
X-Gm-Gg: ATEYQzz2VSrP3hLAEI3wostRf0zOFfdvhoO5gcpP03xKt6dILUH/iIFn2JzEhRFuNan
	FUWUNwtUlKzvsqwYA5LujJd8BkjvR9VXoV9FBDUPVcghcmAWmewykFSyg/lFHB+iBwpIGW/luF5
	NjUIIo0vIgiurA43146roBnO/93tRdMoZz2DO/QF1q6dDp1dxTMl7jtpRKD48oV8Z0u4wF6Z+dw
	JgCpCHG1VPFlXtORC0XDnEGWjLV7b6LZrHCrt8cp5VpoG63AoYLD1g8I8wwK4Jv1bq2IcpZe7Jh
	6fPP9gYnL0MTy4CZLlbw0E+wPOvohQ4dAtr7ZN0N8eozSNND/YRGiWaSiUt9ruVJh6hQXH87sbi
	XJuKE3PJwIW5dkwaYl2WgAsFMSnYh6rKGwZSDTLpTVIlLcsCtIbfIAXfo8+MbBxwAiA94LbLy6f
	ANbmkiBn9A+BScWYyQd8/O1g==
X-Received: by 2002:a17:903:3bc8:b0:2a7:561e:690d with SMTP id d9443c01a7336-2ad74556ee6mr139419385ad.46.1772016076534;
        Wed, 25 Feb 2026 02:41:16 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad97d6132asm52860285ad.68.2026.02.25.02.41.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:41:16 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Longbin Li <looong.bin@gmail.com>,
	Yixun Lan <dlan@kernel.org>,
	Ze Huang <huangze@whut.edu.cn>,
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v4 3/3] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Wed, 25 Feb 2026 18:40:41 +0800
Message-ID: <20260225104042.1138901-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260225104042.1138901-1-inochiama@gmail.com>
References: <20260225104042.1138901-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_024117_463992_AF1791C3 
X-CRM114-Status: GOOD (  11.55  )
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

Change the DMA controller compatible to the sophgo,cv1800b-axi-dma,
which supports setting DMA channel number in DMA phandle args.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..8446b4dfe1a1 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
