Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64956C83F28
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Jul 2025 09:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kospqMfDymLtGTI8JIFWySFsFK5TYeYjt3v4VJ3rlz0=; b=t19t5ihhpGrUhU
	YSasZ6bRqhL0qHuAAQJQyVLCilGAM34iyMTEBQOzE7uOs31rzyAfRBtMyMhyC/NLo/eeoZuKtxcUc
	6fBHx3Z1i23EHMe2MvYlQ9NEjyZ4O+eV7IK2VATfT6KmbAcQmD2AZv/bgzfmhcBX9JzH5eD+qXh5X
	Fs+uPoaUBVBSPlilbATNRyTKRIqWzSGRs6N+3u/mYKpVU6qV6bRVC7e7CFe+YAqKrcsM5OMxe98nt
	qx1aSIfiDC3yf+Bqs1FVztiZ7M2bUF+lsmZsBGBF/AqlHxS6Yy6Zhj1yvSbN+VFozLh+awRAmXuY8
	YnhkmOXelWbEXUZG4mgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFyJ-00000001rSE-3p5Z;
	Mon, 14 Jul 2025 09:59:43 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubFfT-00000001o5C-0sdq
	for linux-riscv@lists.infradead.org;
	Mon, 14 Jul 2025 09:40:16 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-451d6ade159so29558755e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Jul 2025 02:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1752486013; x=1753090813; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NW/McQJ6Sd6lpl1yvr5wt77YD+qYB1cLv1xJk7Xbx/U=;
        b=E/sSKr0QdhpPfik/479eJ28C8loE+m+Sm7JqTrwQHQqff4WoBCA7lAphNSDfU2Lxfj
         T/JsVa83hwGYEgnzfccXnmkn/rAXPICBGxuKx6M9stUD5i494dmwNOr/D0Xc7Ol9dGbH
         XDZRLKjZLzS0QvK99jnfCp6tnJ5Y+yTnvaH4pMX6lneVHtO6MwPl1BKyBvOVuBmjGslK
         oJ+l6/vtIkRy8oYkxifn4V+fvxZaPm2UACFNLA0xRBeTk01pvDqex+rnUnS5BSZRWAvE
         pqTusOyKRz5U6fUODV3e53qQ58aeau7DbM/pcJSJGsYrXKLk7bmKSarJ0S22nWDVl9MQ
         BPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752486013; x=1753090813;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NW/McQJ6Sd6lpl1yvr5wt77YD+qYB1cLv1xJk7Xbx/U=;
        b=TTAVcn/JzQ7TVLNtF/v0JmzgbOp1VyX+knbbmQSllm3bNsSHVroqW4awlxklpFgtoX
         m5kQ1mEeZgWCjZ8BOnNwKzZFN1YjZXDnWtIl2kA0UjKmmsyVh1tjg0JhQu3/QswRwIkA
         Y/bQ81mrc1bkXV1hfu0INEN7RaW1a1Job+HcQW2ncpxRxyiuyd3ffgWMe4CmDp5QU6ci
         9zuED9QRntc96cMJjBVz2QkCSr0j1xqpI99g+kNtCh30ZB/OZYg0JwYgfdnezXs7f0mY
         eTPuBjH6fvDOEs5ps7Zdkw7+FlNSS1bqo0sJQkf1fcLjdwHnT53YA91OeLCsSy5EZYdE
         zxEw==
X-Forwarded-Encrypted: i=1; AJvYcCUCZZu1vRBxQofY8vTqh97VOjf7l2WLtV2bDhAvwEnrg4fnbRuz3JTJFbiYbPe454BKHDHVVcix1XTwBA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx4sySx8v3qBxR2HE0/mJyyS33gdeLcbmIgbT+HTLtFfEPT03AK
	D0lxf7XTun4OA9BWX6muHLhvbAQk5jqrF3f4prkUENV4is8kZ/jppRFCGY4196TYyHw=
X-Gm-Gg: ASbGncu9lBTHdrV6ymiVe88pQ6pVuBg4xBFj5zDiG5HQKyuiTqg1TwiTDNVceAttkw2
	ACM/w80/GwVlmU9Bs31f4kjRWZNzuu/Yo8juRey5QSOTh93mt7RYiaIvBmyTKFUPXUP8M8BTF7B
	Zj6PSHGDk7dXxJ7ltXayURXL7Po4D5FGHdlQTKsoB6iyscvLk/GYeyvu/7eFTEG+SrGqqAB2foe
	I0rOamOx8AAAN5BsfDxSCAEi+6Uy90Dd37LqqFq9Vt3+GmO+cYuSt+Q6/wHmJHRre6w6tuJXCry
	YofeuSeFsWgTChxJ1g7/fLMauNLBosLn7z+5GtzrRBfsynQyoGDkOtMKVLQVJCi6xWnRR3ACLw=
	=
X-Google-Smtp-Source: AGHT+IHsiHi2b9XLYJ9fg0Rc9OaPeZG511Kxf8f41m3lSbmqbwnEUrPybpGRc4WW5jMeqOb06dRxYg==
X-Received: by 2002:a05:600c:1c8f:b0:456:2212:46b8 with SMTP id 5b1f17b1804b1-45622124965mr5783115e9.28.1752486013224;
        Mon, 14 Jul 2025 02:40:13 -0700 (PDT)
Received: from [127.0.1.1] ([2a09:0:1:2::3035])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4561b25a948sm24989035e9.35.2025.07.14.02.40.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Jul 2025 02:40:12 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v3 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Date: Mon, 14 Jul 2025 17:39:27 +0800
Message-Id: <20250714-working_dma_0701_v2-v3-0-8b0f5cd71595@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAE/QdGgC/32Qz24CIRDGX4VwLhVYBeXU9AV66a0xZoBhl1hZC
 7i1Mb572fXSU5M5zDd/vslvbrRgjlioITeacYoljqmJ7olQN0DqkUXfNJVcbrjmgn2P+RhTf/A
 nOMyFwySZ9tKFDVcAXtO2ec4Y4nVx/dg/dMavSzOvjyJ9hYKevSVD3g3pYyVDrediVquWDxf77
 MbTqpzB4SlWNovPmC5XEsbMEl7rfMQ2i7nVJgxRFjVsQKstQHCWay+0tl4Cdgrsdo1r5OA80r9
 chixUSgjWwHIsbmIegxtTiD3TYceD7rzcdt5Mgs4gQyx1zD/Ltya5kPz7mBacgVWIO6GFl+plv
 lIq5JmQ7u/3+y8XDclTggEAAA==
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
X-CRM114-CacheID: sfid-20250714_024015_502541_3DD7A56E 
X-CRM114-Status: GOOD (  13.37  )
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

In v3, the major change is creating a separate yaml binding schema for
SpacemiT K1 PDMA, per Krzysztof's suggestion. By doing this, the binding
schema got simplified a lot. Deprecated property (ie. #dma-channels) and
unused values for backward compatibility (#dma-cells const 2) can be
removed.

Other changes involve placing pdma0 node in k1.dtsi and in board specific
dts files with proper ordering.

The patchset has been tested on BananaPi F3 board.

This patchset is based on SpacemiT linux (for-next) [1] with Patch 8
depending on:
- riscv: defconfig: run savedefconfig to reorder it
    It has been merged into riscv/linux.git (for-next)
    Link: https://git.kernel.org/riscv/c/d958097bdf88

[1] https://github.com/spacemit-com/linux.git (for-next)

All of these patches are available here:
https://github.com/docularxu/linux/tree/working_dma_0714_v3

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
---
Guodong Xu (8):
      dt-bindings: dma: Add SpacemiT K1 PDMA controller
      dmaengine: mmp_pdma: Add optional clock support
      dmaengine: mmp_pdma: Add optional reset controller support
      dmaengine: mmp_pdma: Add operations structure for controller abstraction
      dmaengine: mmp_pdma: Add SpacemiT K1 PDMA support with 64-bit addressing
      riscv: dts: spacemit: Add PDMA0 node for K1 SoC
      riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3 and Milkv Jupiter
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
base-commit: 6be7a5a768aafcb07d177bd2ae36ab84e4e0acde
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
