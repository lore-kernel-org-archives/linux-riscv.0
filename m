Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13728C83F1B
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7WuSi8LUoZ+M0E8vsMQXhixixqdRtud/5YLu+C9ulVA=; b=2aeXCQFg76CVbb
	HPbrmVz+0iXr2AC+vS07gwnrS6bqk2T9kurn1nXOLOXELJL+hSdtLuKJjN7YIFLvlUfQWta8Fxtog
	tXqpb23Qs+yal54NaQARkyUfgfKfO3lFYAVgiU/qPx5ni6sZvnKufgxxBYat8jBTq/XfVB0odwtDK
	V2VM2TQiEAjrgqZ0Ys2Nd5VUp4AYs77uDn4n8aRxJ4Ub0NxJE5oyQtSM4khhrjUSGaGdZWWgnP22L
	o5lSeConIh7ZFpRj9dO9+/dy9ZwttvqBMNDYWdEiZaCxWdO/3NqQZ6gQr87o7gPeBhj8gTa4hg3Hy
	Oh3bpsVjgtfeczZc4LSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFyN-00000001rUW-3DJN;
	Mon, 14 Jul 2025 09:59:47 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFfz-00000001oEe-47eg
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:40:49 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-451d6ade159so29562905e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486046; x=1753090846; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gFrJpXFfbxx2B9ksANEMQWjDtT+enBv/IzvtrGekg3w=;
        b=kojc1SGF/WGpDxvRKkmWnDzdaVzh5t6bFdFcyf0e8+jmk6ER8Rkt2FFtppHj8fiC7e
         vpq9Pp0aZ062kXh7Vx3+6SegIATm6k/zA1FVhAF4ivWVME4wcgVL5l7Bx9qCJGBQAxJR
         hgDp+iyOCyfWszgPPl29z3CRVzyIL48jsKP8WNPhjyPtu1gLyP9tijgJKzFP4YSOSPHn
         EH8LOmM7uDZT/3BccfKwYHejdS59Drwsp7ldkDGFp+Z5B9FJ19TTNCW+l5tmzf/y4tUP
         eREDHpt0x73FcoIo7OyeQ1nAnkiTsiY5pO5CfPhL4aq81xKFx8UjiNEq4n7idzne6+xL
         h8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486046; x=1753090846;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFrJpXFfbxx2B9ksANEMQWjDtT+enBv/IzvtrGekg3w=;
        b=JOjs11aa0b+568UzHS7g9V/udwiRbkiadZAMgwzQlH8lHEUjG7mLFEClnh7rH2bAyZ
         DdKsqzAVP4LXDtTFtbPioAKSb4wWT/yYjX6dX24HNSZn5L1UJ9mnxDEq/2P6y2qLt6/P
         aTi0iirKOnBla6icdy+52U0Tp1xpvBX8mhLpkMdYBpzQDTqXNx4H4VW6BFxXtymWfM86
         5BMHLXpl6zYNMn9MCmAebowSdyqHvMxrBLPu35AzdgAApr3hOS7e3SNjKRWaX4CtBPx3
         18cYcrOOh6FqA3Y0ehTnj70PbXjo/t45ld18aoIKudmk7BLo/GTiFBkEHNZvWvlOKS1h
         mNnQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwqLi8SpXdMwD97zOhvE3s6mDTn9+LrtB+tBUYjVYYpP6gR8bPKoxGScI8BA9kwoOHp6ZZWYo1n8sdyw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrMhmDu5z3DgqzUMmN2kqIiUVAowfMan+D/itf3Ny00wf/NXfQ
	bKutmgnVDl0B0QAh6YZvCRGFX83LNM3kan1XIq2eJygbWDv7iC3s2CxDeFY/SpsnHh4=
X-Gm-Gg: ASbGncvP7dD3YDWlikNYzknGvhQheoWPV9/lPR7/a+7/UmnCtTCBIiT9QPb0YjUyaGs
	mYkPmjinRjEqbm3grkc4lC71tGkXxhTpn+9AUt7B0PQmFlARMW4/p24OQFMaeRawQdDK6KiHnLS
	e6UQfIQlT7VhcUyS8B/DC6qDE+LSBBYnPQL4I1WJ9ba9KSviKn0Gh0reM7PwdkrnnBO9tyHm28D
	rq87yHaxfs/EHgn2oG9iWhcZBMO8ihcN6JSt7dIa0KiVguV/Pn6sGolsos1WPYLI1GkbV5M5uGc
	azkuYf8xl9HVHRgup5M+BfjzFDufY2O4AArSPaqu6mB59aNG1qr58SdBr9swRyc6RxBg1MB+fQ=
	=
X-Google-Smtp-Source: AGHT+IF/LhOg6RIkatqA9vyQ71gHfsxJ1ctVouZmIzEYwK0/MuM77sFw7XTim5p/um56mFwUUDCigw==
X-Received: by 2002:a05:600c:198d:b0:453:b1c:442a with SMTP id 5b1f17b1804b1-454f4253f14mr101420315e9.27.1752486046346;
        Mon, 14 Jul 2025 02:40:46 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:46 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Date: Mon, 14 Jul 2025 17:39:33 +0800
Subject: [PATCH v3 6/8] riscv: dts: spacemit: Add PDMA0 node for K1 SoC
MIME-Version: 1.0
Message-Id: <20250714-working_dma_0701_v2-v3-6-8b0f5cd71595@riscstar.com>
References: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
In-Reply-To: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 =?utf-8?q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_024048_023716_06098C21 
X-CRM114-Status: GOOD (  10.91  )
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

Add PDMA0 dma-controller node under dma_bus for SpacemiT K1 SoC.

The PDMA0 node is marked as disabled by default, allowing board-specific
device trees to enable it as needed.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v3:
- adjust pdma0 position, ordering by device address
- update properties according to the newly created schema binding
v2:
- Updated the compatible string.
- Rebased. Part of the changes in v1 is now in this patchset:
   - "riscv: dts: spacemit: Add DMA translation buses for K1"
   - Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/
---
 arch/riscv/boot/dts/spacemit/k1.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index abde8bb07c95c5a745736a2dd6f0c0e0d7c696e4..46dc002af947893cc2c234ee61e63c371cd966ca 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -660,6 +660,17 @@ dma-bus {
 			dma-ranges = <0x0 0x00000000 0x0 0x00000000 0x0 0x80000000>,
 				     <0x1 0x00000000 0x1 0x80000000 0x3 0x00000000>;
 
+			pdma0: dma-controller@d4000000 {
+				compatible = "spacemit,k1-pdma";
+				reg = <0x0 0xd4000000 0x0 0x4000>;
+				interrupts = <72>;
+				clocks = <&syscon_apmu CLK_DMA>;
+				resets = <&syscon_apmu RESET_DMA>;
+				dma-channels = <16>;
+				#dma-cells= <1>;
+				status = "disabled";
+			};
+
 			uart0: serial@d4017000 {
 				compatible = "spacemit,k1-uart",
 					     "intel,xscale-uart";

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
