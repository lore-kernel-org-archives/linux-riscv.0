Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C1BC7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 05:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gc7sSSnfsuVnvGMSQaVLij14ydANK6VuBlXCTejkqXk=; b=jWTCUP77P3V6Ja
	o7MZCjpNmHkD3sHJolNCB3UTbAca2etexwFQ/grCNNFYAkhMJ5bm3Vl51ynJ4zWum6sgczFfAQzk+
	6fTARRBiB1CavjSDqhweYxY1vSnh3l5OrBz8Q1T98faCA50WppTn+qKanI9o/VtaE/hQK9caKn+f/
	f/Y5WlBO7Rg6OZOcfkoV1w68oEahSOkHtgaoHQ2tDOk7z5LpRt/2+2N5aGIg1LOn5+vg3quc0quPv
	6CiZSXal7DNB1xVirHjIcwYI3C8AaJhyktl4/bTx/MpUubG5EsnfRsJGHJtk11+TXltiYSa8QEOo0
	UZrlAsnRLiTXfA9LsLzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgb-000000043IT-2SwQ;
	Tue, 01 Jul 2025 05:37:41 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWTgZ-000000043HY-0PqF
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 05:37:40 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-311e46d38ddso4382140a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jun 2025 22:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751348258; x=1751953058; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3OkurqPOKVLu65iMMmlRK8LRX8T/SvzGfPgIac7M7N4=;
        b=rvFYmt+635RR0Q27mWVyi+dSASqL+MZqB7Sh8ke0A0sQuFoC0YZ+cXsQltTWScD0Lm
         66OK5qP/xy9eY7YLdPj1mblbgC6jgVqu7jUL9CWjBKLGd0P6TgWMgwiwcQFDO8EM44LP
         3gTdc231Pk0HTelespFmWavLum5G5ScwppEgL0e78lgUVFzRU8qxxT1Aq3Sr8dAae4SL
         UU2Ga9vneJnRrL6/luKqo4iXhvr6ry6om0KRTj1pHSUZLTT/Ob92CQ5cUb4eHte33A5s
         gCy540qXGgSvOSBul0EQ7hgu1RM1edtLWaIyj/txzXEsUSTTz4pXwsPgfpK44NAZ9YI5
         Y7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751348258; x=1751953058;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3OkurqPOKVLu65iMMmlRK8LRX8T/SvzGfPgIac7M7N4=;
        b=UqCj4XdXAHNWcdP3L/UvLUZF+5JKmYmQ3p0pKZJkN8vjlejchplmgYgGTr1/JVC+G1
         HEZ4b6fXPWYO3YbRrZBzvaJsgRYtjy/PQzyUfZdMK7Thlk3tQPzLi9IcKvEpy8Y5v0Fu
         miIIWMAUBgml6ChmKfGesIXvBSEZ/tZQQdhH0ODhJ7obrlcob+eVE4K9OqUzSajHX3Ex
         foPkqXHpGXcLMEcL5argsTKFiSKOj19kjvOJRYUFlz6Ab723vTrQd01b2h1n6qxZQ+cD
         1mBIFUH3s3H36GTBww9bv/SQmAWWGJExbmf7551CWa+D369Y37s/0wl3ONHa3d929/Tj
         amfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkHCSNZqBGD0NU68YoKfAA1yLV6HeXcEpXc3tUMETsJHDnoFL6Tsh7+HkAxgSeG+JLQEiWfCfREbqAag==@lists.infradead.org
X-Gm-Message-State: AOJu0YwHrQ/DhdJhroGlPex0fPuvC5I/VNXbbShchN8l5cqIK3HlDUSH
	5DprT5XKA70cb1ZsP62pavVYG2YV9D+s06Dm7Od3taXwynY5N+u767CItEi+HtNCRMI=
X-Gm-Gg: ASbGncuRN+XlXr1McsCQ8h5cwqMJ04tnt1zaTOpVRIHXvGdqJreUUEK+wkC6/D/3k4e
	3m1y4LAP2b0M0o5TgrvRsbMROZ56BJhB/s0pqjBzl/jmSKX7yE+VqW3Ici0huUgLW1PtElGFjxC
	LDvOwcQSMtAesj8iU4WYSZ2lEf0fzpV+2Fz9jHNtjb9upQyvtyFiw11iIHHRH3bRUEWCASmgvKs
	hyhmh/V+xCKljXkC4ePRfcN0jgx2aWT4LdcO0a6V/Nd8QApUWYUXPOeMIpoJ7RaaRou6JU7v4/S
	jSnfrg59HgRNx61Rv1VJTmNknzpm9sj3x1G/RUc=
X-Google-Smtp-Source: AGHT+IGUAu2BOtg2ZvlOoErwNcYS0F/WULHswWmUQuGgbrebTfzSSTeVLb4j/vMfvu8YXkL6LJmixA==
X-Received: by 2002:a17:90b:5386:b0:2fe:85f0:e115 with SMTP id 98e67ed59e1d1-318c925242bmr19994442a91.26.1751348257949;
        Mon, 30 Jun 2025 22:37:37 -0700 (PDT)
Received: from [127.0.1.1] ([2403:2c80:6::3092])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb39bf5fsm101729865ad.115.2025.06.30.22.37.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 22:37:37 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v2 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Date: Tue, 01 Jul 2025 13:36:54 +0800
Message-Id: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPZzY2gC/3WS22pbMRBFf8Wc58poRndTSv4jBCONRrZIfemRc
 xII+feO4zzUpQWBNGL2XnuE3qfBc+cxbVbv08xLH/10lAK/rSba5+OOVa9ST6jR6aBBvZ7m537
 cbeshb68X2wVVqEjNaZ9zDZMozzO3/vbp+vh0q2f+9SLml9vlVPJgRafDoV82q8WvwauZzPQnV
 UJcmR5ACXbugxZVudHp2PpOhZZ0C6ZiNHWzwFV54DHyl/T7lxYRbXTiD9oltAoU/6w8P1ztxiX
 Pa8nw419Yh6hkPYMadU9dJUfBpRyDL+7/PDRXhTyNKi+Dh5obqdd+VovMoEiDtTqixGoPws9jn
 WlNx0/+OV9of8NTMORN4Wa81ewNWlMrNUM6FNCxWtd8BH+v0i2XHFwtxlDy2cXIAZFsw2KilwO
 VmjnzvUr6o5fWFj3IRjoBiH3mxGALIgBVLJHuVawbR2skgwmVYow1CTIkzgFCa5qNtVAq/DVXI
 80NSPaaE+YajdW6Zie/JjdItnGQpGF6+vj4DbuEOQuXAgAA
X-Change-ID: 20250701-working_dma_0701_v2-7d2cf506aad7
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
X-CRM114-CacheID: sfid-20250630_223739_415202_658F6D68 
X-CRM114-Status: GOOD (  12.97  )
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

This patchset adds support for SpacemiT K1 PDMA controller to the existing
mmp_pdma driver. The K1 PDMA controller is compatible with Marvell MMP PDMA
but extends it with 64-bit addressing capabilities through LPAE (Long
Physical Address Extension) bit and higher 32-bit address registers (DDADRH,
DSADRH and DTADRH).

In v2, the major update is, per Vinod's feedback, splitting mmp_pdma driver
changes into two parts:
  - First patch adds _ops abstraction layer and implements 32-bit support
  - Second patch adds K1-specific 64-bit support

The patchset has been tested on BananaPi F3 board.

Patch 1, 2, 3, 4 and 5 belong to dmaengine, and has no extra dependencies.

Patch 6, 7 and 8 change SpacemiT K1 device tree and RISC-V defconfig. They
have the following dependencies:
1. riscv: defconfig: run savedefconfig to reorder it
    It has been merged into riscv/linux.git (for-next)
    Link: https://git.kernel.org/riscv/c/d958097bdf88
2. riscv: dts: spacemit: Add DMA translation buses for K1
    It is currently under review.
    Link: https://lore.kernel.org/all/20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn/

To verify the PDMA functionality on SpacemiT K1, it is required to apply
the following patchsets in order:
1. [PATCH v3] clk: spacemit: mark K1 pll1_d8 as critical
    Link: https://lore.kernel.org/all/20250612224856.1105924-1-elder@riscstar.com/
2. [PATCH v11 0/6] reset: spacemit: add K1 reset support
    Link: https://lore.kernel.org/all/20250613011139.1201702-1-elder@riscstar.com/

All of these patches are available here:
https://github.com/docularxu/linux/tree/working_dma_0701_v2

Changes in v2:
- Tag the series as "damengine".
- Used more specific compatible string "spacemit,k1-pdma"
- Enhanced DT bindings with conditional constraints:
   - clocks/resets properties only required for SpacemiT K1
   - #dma-cells set to 2 for marvell,pdma-1.0 and spacemit,k1-pdma
   - #dma-cells set to 1 for other variants
- Split mmp_pdma driver changes per maintainer feedback:
   - First patch (4/8) adds ops abstraction layer and 32-bit support
   - Second patch (5/8) adds K1-specific 64-bit support
- Merged Kconfig changes into the dmaengine: mmp_pdma driver patch (5/8)
- Enabled pdma0 on both BPI-F3 and Milk-V Jupiter

Link to v1:
https://lore.kernel.org/all/20250611125723.181711-1-guodong@riscstar.com/

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
Guodong Xu (8):
      dt-bindings: dma: marvell,mmp-dma: Add SpacemiT K1 PDMA support
      dmaengine: mmp_pdma: Add optional clock support
      dmaengine: mmp_pdma: Add optional reset controller support
      dmaengine: mmp_pdma: Add operations structure for controller abstraction
      dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
      riscv: dts: spacemit: Add PDMA0 node for K1 SoC
      riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3 and Milkv Jupiter
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../devicetree/bindings/dma/marvell,mmp-dma.yaml   |  49 ++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  11 +
 arch/riscv/configs/defconfig                       |   1 +
 drivers/dma/Kconfig                                |   2 +-
 drivers/dma/mmp_pdma.c                             | 281 ++++++++++++++++++---
 7 files changed, 320 insertions(+), 32 deletions(-)
---
base-commit: 7204503c922cfdb4fcfce4a4ab61f4558a01a73b
change-id: 20250701-working_dma_0701_v2-7d2cf506aad7
prerequisite-change-id: 20250611-01-riscv-defconfig-7f90f73d283d:v1
prerequisite-patch-id: 53bda77e089023a09152a7d5403e1a738355c5d3
prerequisite-message-id: <20250612224856.1105924-1-elder@riscstar.com>
prerequisite-patch-id: 0c2a226feb2b3e7a2f090a4f10325ff9f709f6e2
prerequisite-change-id: 20250522-22-k1-sdhci-95c759a876b5:v1
prerequisite-patch-id: 53fc23b06e26ab0ebb2c52ee09f4b2cffab889e2
prerequisite-message-id: <20250623-k1-dma-buses-rfc-wip-v1-0-c0144082061f@iscas.ac.cn>
prerequisite-patch-id: 7f04dcf6f82a9a9fa3a8a78ae4992571f85eb6ca
prerequisite-patch-id: 291c9bcd2ce688e08a8ab57c6d274a57cac6b33c
prerequisite-patch-id: 957d7285e8d2a7698beb0c25cb0f6ea733246af0
prerequisite-patch-id: 2c73c63bef3640e63243ddcf3c07b108d45f6816
prerequisite-patch-id: 0faba75db33c96a588e722c4f2b3862c4cbdaeae
prerequisite-patch-id: 5db8688ef86188ec091145fae9e14b2211cd2b8c
prerequisite-patch-id: e0fe84381637dc888d996a79ea717ff0e3441bd1
prerequisite-patch-id: 2fc0ef1c2fcda92ad83400da5aadaf194fe78627

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
