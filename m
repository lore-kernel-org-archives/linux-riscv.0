Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E785DCD37B7
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 06:39:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NsW31f33vt1oEHQnMOc6PWgBcj9mw4TpxQOOb5WrRGA=; b=A7p03cvx9N7N5q
	300omVgWrAL0CRzZE+ZXV90HaOkUfalITmYjVM7AbMAjUva2MXqCrG9senpUotBWSjQSjLJrjLbnu
	lX3ofj9mksRz3X7rQkqCo4//WxUCnljZEHc+deWAw5wu/L3Vaw+bVnShRzCqvOR1JfumdUabUb8YS
	Vpn6awiJ1Yl7MsychyqivtC/cPujwMw+HbXK9kPbj/JCzw0skP6Bf8p+QTSmOUaIckOfGJvp3C7xg
	6UG0RT+nSPuPCCPwKxOCySBjE4sylYDoiKgdKMLElXUVgsK9ZZGOO3k9beSwv/ZpVTu3CDGFzSY0i
	XLfFbYgxky5o9uGyQgSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKI0-0000000CVeI-1WGV;
	Mon, 11 May 2026 06:38:52 +0000
Received: from mail-pf1-f172.google.com ([209.85.210.172])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMKHw-0000000CVbz-44a6
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 06:38:50 +0000
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-835386ff122so3563637b3a.3
        for <linux-riscv@lists.infradead.org>; Sun, 10 May 2026 23:38:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778481528; x=1779086328; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WfmcfX7gTqR/wtswsezRGGU6Mv16ceub/2XE21DxlUE=;
        b=Az0Gy+TapDpp5tgGNW4ZreXW6NNjtYZGwNO2ngp8qvPDFOjmQvifH/KtNYNiOTCyTf
         nDL6wJRQ5dIJOfXsl12tCJAGcxicdv9tIm0DxjrfXmZ2L5xG61Olb+UU1QYftbTSonCo
         okrEKUWVrJK8bQa7nVb7u57+4JnFbjs0G58DePQjbSa2Fa6w+Uw+7Uo9JDCawT0Rff+X
         G+rZV4h/mXrDLungPeIt7xrHg0GZOYEvlWxFJGYNHMs2vevJSkQPRyMjWEjxCol+KcxM
         pIbUIyI9WKUNGVjhO6clogQgvSTSfZFVbOb+cQta0q7tFVPSiV0OJJQdozcuQNWuEu8X
         rKog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778481528; x=1779086328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WfmcfX7gTqR/wtswsezRGGU6Mv16ceub/2XE21DxlUE=;
        b=P5asX6moWa91a/JKkSyRbXKFz1TUlmM76flDTIFdQovAlFbXLU7ktfVrO6U30jW1yV
         UQp91Ruq+tw7QhHfpLItBh1zxQEJTcd/PAz4yqBJGVXLZTnHG8OF8v2mBl3AbF744isZ
         GQ86k6VXhegk7Jkod9U+kzJGhA+AZG9ePxcB6MvksvX5T5+OAhkUNgMknGWERoKm+GbR
         0TkX9vTT16SXzjRPPhLGMo6tWhRHz3k9C86MAl7oJCViQXFARiL8AVcxn7Ksc6SQQCCp
         nMHx4QGIs/rPOVCeIrRy6WZuWm3QVa0cBMI4YCzGmtkEbst7y1xy4XYoshwpKntBAnR9
         SxxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Lovto9F6VoSQEM3PN5aqX5DqhY0VuFbeFv9oCY3unA713b219C0Iek3tGqyYBjKmrlD6c59UcVcHvKQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFeasGH7XFMfZAK+mLMJmvvpJlyeaOh49Y669TVn94MCOfidMI
	YVGpY0o+iIjrNqH4E+fM/FgpUYtsx3fOGpmMhsPmc5vdrP/Jek1URb2w
X-Gm-Gg: Acq92OFHOZPxHq1ZhBGXbidMsz6K9TxjLOaZIwMDj7Nz0VB5SBXYBa5PXwivD9X+g/H
	bIT/g+yN8FWD0OMd3x7ubOOTuwFyhTg47OjlnQe3P78WSCAtolqBrdjOythz+nfXx5r1x9z4d+q
	O9VIrJMEaHIQxlu7U3VZe/cEuL/CDyJzTsbDPixxSzhTRTy04iPdicRta9+4y3yVkqf0BlgW8RR
	aTfUdVXIEre65q4Cf8AcexqluMRzSwzsnzrt5IlF5aYiw3GTbyqA2gjWpGTTPymduNS4NhZRQi9
	GOaXZ6KRzVjJ8z+Q8rDLjt7QaR9iRTK1ef4MFnwE2hyWQ4CT9T1FPW0g0w7DXIyp8xKK2KYwBLA
	cMdErPs94NLfO3LEBdqJsY2aIByrt/k8dc4bpD4yDwDdD2aojI9zrVnOpWL3ZP4v8lwQpExGBu0
	91eAA7udrt8mN5wRw5fXyHlOA=
X-Received: by 2002:aa7:9a51:0:b0:83d:446c:498f with SMTP id d2e1a72fcca58-83d446c4c89mr8198132b3a.32.1778481527848;
        Sun, 10 May 2026 23:38:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8396563f381sm23328475b3a.6.2026.05.10.23.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 May 2026 23:38:47 -0700 (PDT)
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
	"Anton D. Stavinskii" <stavinsky@gmail.com>
Cc: dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH v6 2/2] riscv: dts: sophgo: cv180x: Allow the DMA multiplexer to set channel number for DMA controller
Date: Mon, 11 May 2026 14:38:17 +0800
Message-ID: <20260511063818.463877-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260511063818.463877-1-inochiama@gmail.com>
References: <20260511063818.463877-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_233849_011234_2A008A9C 
X-CRM114-Status: GOOD (  10.58  )
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

This dts change does not break backward compatibility as a fallback
compatiable string is added.

Fixes: 514951a81a5e ("riscv: dts: sophgo: cv18xx: add DMA controller")
Reported-by: Anton D. Stavinskii <stavinsky@gmail.com>
Closes: https://github.com/sophgo/linux/issues/9
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Tested-by: Anton D. Stavinskii <stavinsky@gmail.com>
---
 arch/riscv/boot/dts/sophgo/cv180x.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
index 06b0ce5a2db7..ecafdee79ac8 100644
--- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
+++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
@@ -417,7 +417,7 @@ sdhci1: mmc@4320000 {
 		};
 
 		dmac: dma-controller@4330000 {
-			compatible = "snps,axi-dma-1.01a";
+			compatible = "sophgo,cv1800b-axi-dma", "snps,axi-dma-1.01a";
 			reg = <0x04330000 0x1000>;
 			interrupts = <SOC_PERIPHERAL_IRQ(13) IRQ_TYPE_LEVEL_HIGH>;
 			clocks = <&clk CLK_SDMA_AXI>, <&clk CLK_SDMA_AXI>;
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
