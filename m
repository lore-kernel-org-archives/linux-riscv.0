Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B07CCA0EE0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Aug 2025 05:17:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=U3N/DuM/rQec+qd/ckLZ4GfJHU2ksJUgXDff62IWo5o=; b=avJmtaXkRhvFdd
	t8Q0J+xvSur8bEpGOtlnMlwvfu+oZFzXYhz7qPRQf5muqaqTCw8YNsMwXyMLd3sIC6UihGrXWR/vp
	xGNJedoJHhlRNvvzxDBoq4E9mF5yiMDTcOcKwxyO/tUQBNMWa+J45l/qA9dv3/FyCRfa7eUZvazV4
	ls7akLMD56lD1rNbgSMsKAp7GY3aQ9Or82TYHELLdvLk3d0+5RDFv+mTy+pXr82BYXIrgoOH/h4Q9
	CMZUyGQs/DGhnKIWjBj4uxOsF3tKqBgNiL98BE9SbX0RP1V/TAmv2XbVddbq66GGWtF9TIo1CqaZy
	GfH3dMH4NJj9pEV78Y8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummor-00000001VC3-1vSA;
	Fri, 15 Aug 2025 05:17:37 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ummop-00000001VBf-1zRA
	for linux-riscv@lists.infradead.org;
	Fri, 15 Aug 2025 05:17:37 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-32326e05b3eso1379138a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Aug 2025 22:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755235055; x=1755839855; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t/YR0q010G47bb6uvqaqSOeiGHOWu114jtbq9qGbwyI=;
        b=GH5eWBEqUTMqlRb8xHbMS18XwhMFabbU/KNWoFfbljd580Ww6h5dOw/LEsowx0s93L
         TS4ZI/ORJpx61V35EOHOuyDe57Fu/6rQueJ27yL0OAp3kcQP5q9IS6jr1DKf20qTzraS
         Ig1W5n1ouH7ygWZTNsOK+IFnW4xaEVangJ6StafW3G+boja8eqv0OPp/9Pr9/haZcCc7
         b2JAYSEX2VD1seXhA8q70PvYdh0vtNr4xr0sMQOlVyKtZCo9eLndjYQpxI7hP7PzlADx
         e6H4hmQKIa2ZhaNghcEIn3DwvJQ8goUWFTXhIAmuNYxnFiUzbL+h5DEVny712FfNsZkM
         jP7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755235055; x=1755839855;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t/YR0q010G47bb6uvqaqSOeiGHOWu114jtbq9qGbwyI=;
        b=Py0545YF2/choH5R50LwcScaLc9YpHEwRuy7HtNO7o+j7riPDZvfheu16dSGC9hbvC
         3fot1IdDkcJX635gcUO3CW7H0pThQAtnRlLqXyX2ejcKvGEHdciMqzPcz1wCFFFCq1Pc
         d9VFkTfMQN/rUDqMI9JMec0wDAmR710eid0yUdfG963L38yBc6+vdg0JDKwFifbr+iLE
         tbU3rZPjeoCuKK7L+sthYtryCFUAvIB6lvQ7K/VFKhxGYbKu9KPbxNMjHHpBqOTr33Es
         EHvYByfhFLBQSIJABr+kq4cwUHw1iMmpAesTedswSE6/+ueyzHMk32Zy6B6ndkz5C8pi
         EDDg==
X-Forwarded-Encrypted: i=1; AJvYcCWt+Tvwt3u5k+BhiTSwau1bDfMsZrYkr4Q0fbiA3l/cAPEH/W7f1GmOPfuGr/QgZnKnc/2rObtJ8/NsxQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5LRiFtBQOaoAlqDey6aBsMXbwYpkbuoWjnNeVQBfxDwhH0Sog
	eSwrRL8swQ5Ujls4/KZowURHQWGVBTh23Z6zkYv3HajzB63TMYcDKOau11LiEZSyAtA=
X-Gm-Gg: ASbGnctAE0NBBzT4kInIKvgLK5iLhX1ZuUGFvDl2spj15ZmMZoSVYx0imsgX+i8vpxq
	Z/2ttPBXoPkoJA/byrW9OxcZOIgfEUFNF4TtXS+0KMvClfdRi7jPBU4CCY1eNaAB0oBT4Idvrw3
	kMALG9qv2fWQNPGw0kK6ZSkbm8v9KmikuxNEknX+ecX9/uX2kUg2kHe4Xx9yPOTJ+4wFgjh5KPh
	nkIzE6N1jgFUaHNVOrYeK6wKUS0QaJQvQbHpfY33nhxGBvqC36DuEaL1ZPDmRWHnAjd/GvVr7yx
	hv3PKxjsoxE+uUiZlFPcShG7eNuPGLxmHdh1bCw/tUYMReVm3dUU7hfdpAFtakOPXxMh7wmaISz
	CJ+GZt4jDhlqxc+MGaYfdKA==
X-Google-Smtp-Source: AGHT+IFT5uLaaFT7Gpf84nOg/qxTAgmBlTxCOXGoRCU2+Aj7ez4/ag54Q2dJu2pQHnJcOaMlqw+hJw==
X-Received: by 2002:a17:90b:4fcb:b0:312:1c83:58e9 with SMTP id 98e67ed59e1d1-32341e12ccamr1329199a91.5.1755235054555;
        Thu, 14 Aug 2025 22:17:34 -0700 (PDT)
Received: from [127.0.1.1] ([103.88.46.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-323439978a4sm373212a91.10.2025.08.14.22.17.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Aug 2025 22:17:34 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Date: Fri, 15 Aug 2025 13:16:22 +0800
Message-Id: <20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAKbCnmgC/32PQW7DIBBFr2KxLhHgALFXvUcVWRgGZ1TZpOCSV
 pHvXkw2UVVVms3/0rw3cycJIkIifXMnETImDEsJx5eG2ItZJqDoSiaCCck04/QW4jsu0+BmM+z
 FkAXVTlgvmTLGaVI2rxE8flXq2/mRI3x8Fvj6KMloElAb5hnXvsnqwDWNlpNna99Up+KcFm3EZ
 DN14G1YPE5U+4553Tpxal2fOdk1F0xriN/1lyyq59+zyzBqRgXQcc2dUK+7Ja0mHsppFZnbJww
 //o1pC+Y0Mi+t01x28hdm27Yf4nxvgmcBAAA=
X-Change-ID: 20250701-working_dma_0701_v2-7d2cf506aad7
To: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, duje@dujemihanovic.xyz
Cc: Alex Elder <elder@riscstar.com>, Vivian Wang <wangruikang@iscas.ac.cn>, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Guodong Xu <guodong@riscstar.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_221735_761944_D8B7E50D 
X-CRM114-Status: GOOD (  13.86  )
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

In v4, the entire series were rebased to v6.17-rc1. Added reviewed-by from
Rob Herring to patch 1/8 which created the yaml binding schema for SpacemiT
k1 PDMA. Troy Mitchell tested the whole series with i2s and dmatest.

Commit messages in patch 2/8 and 3/8 were modified but no source code
changes.

Renamed the node from pdma0 to pdma, and reordered properties inside it
to make them consistent with other nodes, per suggestion from Yixun Lan.

The patchset has been tested on BananaPi F3 board.

This patchset is based on v6.17-rc1, with patch 8 (defconfig) depending on:
 - riscv: defconfig: run savedefconfig to reorder it
 Link: https://lore.kernel.org/all/20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org/

All of these patches are available here:
https://github.com/docularxu/linux/tree/working_dma_0815

Changes in v4:
- Rebased to v6.17-rc1.
- Updated commit messages in patch 2 and 3.
- Renamed the node from pdma0 to pdma.
- Put "interrupts" after "clocks" and "resets"

Link to v3:
https://lore.kernel.org/r/20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com

Changes in v3:
- Created separated yaml binding for Spacemit K1 PDMA controller
- Updated pdma0 node properties according to the new yaml binding
- Put pdma0 node in k1.dtsi according to its device address
- Put pdma0 node in board dts files according to alphabetic order

Link to v2:
https://lore.kernel.org/r/20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com

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
Tested-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
Guodong Xu (8):
      dt-bindings: dma: Add SpacemiT K1 PDMA controller
      dmaengine: mmp_pdma: Add clock support
      dmaengine: mmp_pdma: Add reset controller support
      dmaengine: mmp_pdma: Add operations structure for controller abstraction
      dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
      riscv: dts: spacemit: Add PDMA node for K1 SoC
      riscv: dts: spacemit: Enable PDMA on Banana Pi F3 and Milkv Jupiter
      riscv: defconfig: Enable MMP_PDMA support for SpacemiT K1 SoC

 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  68 +++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |   4 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |   4 +
 arch/riscv/boot/dts/spacemit/k1.dtsi               |  11 +
 arch/riscv/configs/defconfig                       |   1 +
 drivers/dma/Kconfig                                |   2 +-
 drivers/dma/mmp_pdma.c                             | 281 ++++++++++++++++++---
 7 files changed, 339 insertions(+), 32 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250701-working_dma_0701_v2-7d2cf506aad7
prerequisite-change-id: 20250611-01-riscv-defconfig-7f90f73d283d:v1
prerequisite-patch-id: 53bda77e089023a09152a7d5403e1a738355c5d3

Best regards,
-- 
Guodong Xu <guodong@riscstar.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
