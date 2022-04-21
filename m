Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DE6AC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 06:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ty+YPD0GiMsvqgzwbBhB6k1Q2MAkPbMdSG9/E1mdpOg=; b=QbEGlpmf1VPXbk
	46dHXNmTSGobH3qLWn6HFmBto41lsLNimcV8z+tP9DuXbXT1KDbkGYw6DI2/JdqRcP69Wf98bFtXY
	ygil5hds0zO7F+37V5DVJUk/MCeZUe3M75+FVTsxdMHWul9BL2SIRpe1dPz6E75xIaLi62ofHEXCn
	ynUTcb6+DJXpOEEoVQTSj63bm0fZfsm29F/XcpbdDOzx5OwU1o1UxHFSxHy2m1drcHNs2wlejqvQO
	DddSX12ND8akIcujyIpaSvMYKMF9emYMfteEULuD/YGZpLt58gqGeuRJZoUDcEyOy46AlfbsZGNfe
	NB2+CAvG1rYiRQxNspcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhQhk-00Bt65-9C; Thu, 21 Apr 2022 06:54:16 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhQhg-00Bt3U-S0
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 06:54:14 +0000
Received: by mail-ed1-x52e.google.com with SMTP id z99so5242806ede.5
 for <linux-riscv@lists.infradead.org>; Wed, 20 Apr 2022 23:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2k962TOjn9cIi6o9LRxiYucZxC9pwRel/qitgtJoDBU=;
 b=JYDD1qZpPGR/23UluceME28UFtKcOuJxb1BZ8dVkZybOHtfk4ybxP9bbwZrvl6jw4b
 81YBFppebQ4aCbV7i4KJPR2IdOR/l1f+vTM6ovEg95jJNK9DpKKDuG4WjpWZYIVBo751
 sE9LjD3acE39pE8BQVs9VjAeoRiNIakXJ6SrAF6kzAXD2AEenXWFPN5sY8btu0nLFxfp
 Nx+MkQs3it3X5JKC2V1R4xm7qlsSZvrpgOTWMjVyLWTeyfKsHafwp2qrNhwfx3YziT30
 DXi55Uq14K0rynaEKWd6Ok0Jb0W/BWBa+GrfdabsfysVWdB5+BHOCS8XOb0fSWet22qz
 9fNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2k962TOjn9cIi6o9LRxiYucZxC9pwRel/qitgtJoDBU=;
 b=IFwUOejp0/sG2Gb7vlDs43IIVB7wWLCisRWZInt7TbEhNNFGcPyMpWZHAHYHwpmKUX
 4gD5Xr194PlioPvA3YJSAFNGf4E9l18hLmX4nkxM/qYh4ucf/zZc0t9dCaoNwAen7ncu
 S6ASL3QCKg1od6LNOBVVm1JJagY2xcmvWbBykxXKGI5X+JrdVVCfnNEMMVJW0HG3TYK3
 u5NzaxOcYpe0Y1+ObCXRWNC6GEQAKaGu8ffjI30yXc3q2baKtIjwkSYp8+s/z4i0URvP
 APH9JgPJiMaE1q8f3QbCSJ6n7AWlJtp8u+H4W0/vdXvMNiRpJP9Hoz4FHtDmo98STAhZ
 670Q==
X-Gm-Message-State: AOAM531gUipz9InVg9cgyR48DW6jg15GV4xiR1NAAIDm3GY6qNrOvwGa
 U8cXiPIQYjjWyt1yKX9QCEWa8w==
X-Google-Smtp-Source: ABdhPJzaklLC0LHx5HR8/i9VgTcXq5QbPfI6GUUCc4D+Iszuqzt/hY1yo3+e5Qa3tW2Mc545sh7adA==
X-Received: by 2002:a05:6402:4493:b0:41d:83ca:35d6 with SMTP id
 er19-20020a056402449300b0041d83ca35d6mr2254118edb.89.1650524050755; 
 Wed, 20 Apr 2022 23:54:10 -0700 (PDT)
Received: from localhost.localdomain (xdsl-188-155-176-92.adslplus.ch.
 [188.155.176.92]) by smtp.gmail.com with ESMTPSA id
 kb28-20020a1709070f9c00b006d5d8bf1b72sm7456045ejc.78.2022.04.20.23.54.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Apr 2022 23:54:10 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Zong Li <zong.li@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Bin Meng <bmeng.cn@gmail.com>, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH] riscv: dts: fu540-c000: fix duplicated dma compatible
Date: Thu, 21 Apr 2022 08:54:01 +0200
Message-Id: <20220421065401.9303-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_235413_006219_D440A909 
X-CRM114-Status: UNSURE (   9.10  )
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

Remove duplicated compatible to fix error:

  u540-c000.dtsi:171.4-42: ERROR (duplicate_property_names): /soc/dma@3000000:compatible: Duplicate property name

Fixes: 7eba954a8de8 ("riscv: dts: Add dma-channels property and modify compatible")
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
index fa8c18c0e5b0..7ea6300191a5 100644
--- a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
+++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
@@ -168,7 +168,6 @@ uart0: serial@10010000 {
 			status = "disabled";
 		};
 		dma: dma@3000000 {
-			compatible = "sifive,fu540-c000-pdma";
 			compatible = "sifive,fu540-c000-pdma", "sifive,pdma0";
 			reg = <0x0 0x3000000 0x0 0x8000>;
 			interrupt-parent = <&plic0>;
-- 
2.32.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
