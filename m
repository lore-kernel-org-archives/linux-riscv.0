Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74AA6C4345F
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Apr 2024 00:11:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5EzSh//QbGTFWDi78F2HxEPuruyFhE4W13WV68rrEkk=; b=gJKVmroi+jgLii
	b0nlc9RWKIhhJZR+ZhjLezyRJepN4X8qV3VR9lQSMvQOvTJD0a3G9bD7jw2g11gleUV8sGhMiorJX
	qTywFVgcQf1FoRPzpSni0xXPlCmkUWQRAx71kxsghkimtVrxKeqcEkzDGoebyUQBr/hCBnPlXO21T
	v8PSjz12wLwIKv1RtxSw0zuHn9Nb1u/3ltGipQRKqqHphqxVYQUyHq4UH53CEDtuL9MoC0ROYe637
	fy73Zv0n9kethr+gJ30zGfZL1kR2Op95/UR77FLoD0GFDsXUgp4eBWqS7qMBFocvbT8WxiAZMV//Z
	wewMCxVejYvYaJ7TCF3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Ven-0000000ERZ9-1kBA;
	Sat, 27 Apr 2024 00:11:09 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0Vee-0000000ERWE-29RH
	for linux-riscv@lists.infradead.org;
	Sat, 27 Apr 2024 00:11:02 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6f043f9e6d7so2854525b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 26 Apr 2024 17:10:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1714176659; x=1714781459; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u/8O6an2WdHxxonYSgEiYeduIeqZHNZdg71uXcAFpLM=;
        b=IHTplT+RitiDEZByp/i5FmdWqDxNgFNzDdrb3n56maa64AxEUbex4twHwIqvbUt3tX
         BXDnkPYiQaznD0EQM9aiSUPyd9S4wHc3E71MrYGyIeaMmWHGqvnMuwfTL2SQw7PYx9fR
         rTaqXw0+T2dAaQBkDeM0PBpDzwoHP8+cS2FcSB/7rZRvWS8+DUekyS4YkU+mf+qUiArN
         FTmFPw5BhWL6YLv+N0z1j4I02RkEICveniuW/pNhrvbKUo7VvV8PeM4XF9HMlCPlE2oP
         MzJv1rWwWK7sZ2HCpP49qdSmZ+2G9FBTdHvtREhoZA11zkLA1TeFcZ+vvZs6F7rxIpO+
         LV7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714176659; x=1714781459;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u/8O6an2WdHxxonYSgEiYeduIeqZHNZdg71uXcAFpLM=;
        b=OLZJQYh5aQlKxGXbEJlxRXytBOhV9UYh5+JKdQDYsqx8miLwV4AlrPdCJ6kP4Yt09X
         g/Zm+RWQSwW6vDQN9R8PSslIgTDzJWfT6TzfYAlnMP7Ji8RhOT+BrjtbBmRa3cEEWe9M
         ksng5z34bpSRFYCMVqZRKYB6FUroGXz9xzoKELDKiey9JAxgKy5gp9YpmfE2d8Vu88tv
         +YbNVM2Qpe5MpSSEdaVcsUL9TjKsm5P4cw6Ov9uJPja3UFbxRYwFKanFZGNbD2tGZJXt
         ssvNusEwXxh5VRbd+61ig+EdLSQhOJVmoRZV0u+SdXVlaAuvkEbxHrrU+tHsDusaC4sE
         AJrA==
X-Gm-Message-State: AOJu0YxiHgCvBQOZIGDBbixU9f616+CJaJAV24UJEUyVZKufgExxW05l
	7j6aySIv0Pfq1ColhJK3BsJr2X2ziOQkldMF0TMB/zvKqoCjbgid11HJIXfTdC0=
X-Google-Smtp-Source: AGHT+IHYGANP1t640rQDF4TNy0DIxIquUVdYZoD1tRH1yjH88XxV9oq8sxkuJD55TgcVLJd3G3z2gw==
X-Received: by 2002:a05:6a00:174a:b0:6ec:fdcc:40b9 with SMTP id j10-20020a056a00174a00b006ecfdcc40b9mr6286127pfc.9.1714176659410;
        Fri, 26 Apr 2024 17:10:59 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:3569:7ce4:94b8:1691])
        by smtp.gmail.com with ESMTPSA id w1-20020a6556c1000000b005f3d54c0a57sm6061883pgs.49.2024.04.26.17.10.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Apr 2024 17:10:59 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Fri, 26 Apr 2024 17:10:37 -0700
Subject: [PATCH RFC v2 4/4] riscv: dts: thead: Add clock to TH1520 mmc
 controllers
MIME-Version: 1.0
Message-Id: <20240426-th1520-clk-v2-v2-4-96b829e6fcee@tenstorrent.com>
References: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
In-Reply-To: <20240426-th1520-clk-v2-v2-0-96b829e6fcee@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Drew Fustini <dfustini@tenstorrent.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714176654; l=1420;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=Tkyi4QZD3iXRNC9I3Th5GPUlpVYoVqpI8o+66sXr35M=;
 b=i3zE1I6IyMOXFj1bKYUcSwl0Q+FnHv6uXONEvzmZvhfqQFzAPv6ylEPDFIVtUnS30Bx/yo+p2
 EZ3wEbt1Ps4A+ZnwPmEdb/PCw8a64vl7uB541tl7Q8wYln+VeouGe4d
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240426_171100_594520_148BC1B2 
X-CRM114-Status: UNSURE (   8.39  )
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

Change the clock property in the T-Head TH1520 mmc controller nodes to a
real clock provided by the AP_SUBSYS clock driver.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 6285cdf91bd6..a6f51ec9fb55 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -324,7 +324,7 @@ emmc: mmc@ffe7080000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7080000 0x0 0x10000>;
 			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -333,7 +333,7 @@ sdio0: mmc@ffe7090000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe7090000 0x0 0x10000>;
 			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};
@@ -342,7 +342,7 @@ sdio1: mmc@ffe70a0000 {
 			compatible = "thead,th1520-dwcmshc";
 			reg = <0xff 0xe70a0000 0x0 0x10000>;
 			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&sdhci_clk>;
+			clocks = <&clk CLK_EMMC_SDIO>;
 			clock-names = "core";
 			status = "disabled";
 		};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
