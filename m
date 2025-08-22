Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F20CCA0FE1
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 11:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FUmy8a93F3zr1ErfTTbS5fyfA4fLWHq9B6/FamxMlLE=; b=3LOTpUhbE7jMHl
	h5Boi/kDyQOOd8H759A/FWA+MS03a8/syZ7mWpVPvatBgRt8+leuLyZUZ5zC87QrluizXIbtsjpyh
	LjG9jd+2TAVqwzmdA1SONi8KQF2A4qIKdKoVVtXpd/dVomFA3/k8N00FTKrKfM5ScvicOkO8f3Oo4
	hwbuZ76jSeo/SttlRnCm5+cJKGeM1W/D0iGWsXzWLAJqgoffNYZLS8bP50R1Cdt4YY5ypMQvNtKIt
	OhV+Wg6I8OhJbPB0JrgdJi2uaNz6k5kUOVVe6HJ4/oxjw9v8KDD8xpwJxTlToRTineQIrel3TqtL5
	mqPj2zKHCkAMPvWy6vsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upPqq-00000002I6y-1YUQ;
	Fri, 22 Aug 2025 11:22:32 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upI6v-00000001LHW-1WpT
	for linux-riscv@lists.infradead.org;
	Fri, 22 Aug 2025 03:06:38 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-323266b2368so1112898a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 21 Aug 2025 20:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1755831996; x=1756436796; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=J6APY0iTgruqzu+Xt1WmIhK4gL27PQZoo5QbMl/JJBQ=;
        b=2dmtoqVnYfhiWujrOd3s1SfttDYje4wIxv+BV14gXCdfrD4N4SmXzDMpseav5Q/k0M
         9mnkcMwt8weACEQbwoarMTOm4X9tJAMxpvCMgu6p8wX4tPWNAOgQfxiwg1MTWqmqY7Yc
         mXvrrTJJBEGl0/ZyUyUz0L3N2L3vlA4r/TdyLsoDH3P3P8QoBRpcZJTTGgJ09D2y4wZt
         vRF92jkGMH3pWdFD+mcToivFtUNBuQ3Jtrm0lXU0CZgZQrC4MWXIstwGkjSRoFV3BUrW
         OA9WZVjBLGF9EKpZBtgqyw4c5e2ucBjtkNM6+5Qj/uisEs9xooJYqUwOuwkjmPm0Cw9s
         iCMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755831996; x=1756436796;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J6APY0iTgruqzu+Xt1WmIhK4gL27PQZoo5QbMl/JJBQ=;
        b=Xk4XDYczf1Lai3uzaypabYX/QWGkswSgogywHtWOiSIOSxV4LIkYFfQ7qfFESiXrxo
         f3IhdIBiQ5i2fvp98g68yk5OFwCoY/8qCShnwN4Bw8rdlpcTLYMrFa0u7Py/4XE431wJ
         shVlvI5Qy8brkwwNKoRnl9t/8ZNQGH8LZiyt7p3EV5/q5H+RyPT8t1QZlsH+vQYkGXUM
         6polNfjHuXdfwptovRCnruvx1Ycxa0edcx0zD8lLUNbAcpO3d2nH3A1R3TfOeEkZzJFB
         QYkrY4TzR7hA9KJCkAgU1VhodIKm1FiCALQn9aELEFnUuAowwtkF93t2CWUdarDwcOUd
         udgw==
X-Forwarded-Encrypted: i=1; AJvYcCUO9TwvlraaH9suJ1nPKInsy3EatJsduhAKJBKTU6d2Aj2Ugak9RyJiMPJb9lrRgWNzTrcn+xoy+GOwPQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yym7p6oajEehQw7bb6xg62dWgMK7UE6CeBN60Vy8MoRAtd/TYhE
	Z1hrPJiSNoW02YttzRCAqEMKh82i0Gu+9ezupTftLMdcNXxJFqFeLTtq1F1dn+JsIf8=
X-Gm-Gg: ASbGncuHqhCR9ipOXNSF4/QGJZdx72+bNeEUsJfdBAr3c3nq5wpKd4MCJ+70hnc5gim
	yFgomcu5kTMsy6mgTXzH01xwOe3p6OAD4pe5xlKVIem7h2wV2Knc8JilTr9e6QOBw5M0QX8hEtC
	CFy6FWW7LLwvWgseQVCrW/ebuwkA8eoeonz3tNrhFXLNAOOfmf/xXAwxCYu4qHtVPYiWsDEQ4ky
	ybhgjK/thTsbeKA1mbK/g6RDqdsUGwLN0CUnlSm4JVbqCkNmxsM2n0y/Uid4LEK/jkyXWNnMPMQ
	KBLQYyrH4Zfps4dh0L9h96+uLvX/D7mI59MnW0xRj4F1ym/AErNYxgEGcGl+qNYZLoQQuxzNbx/
	kU22giZYEnObfqwBOydhTpnYL/+YerOMJ/LNkFL4QZEM9
X-Google-Smtp-Source: AGHT+IGbrksi9Vl6DjeeywwPEHNBqOc6j8/i0ukCMTc/yG+kfQptCBbBbJ0xlFQr6PjQHtWsRfWM3Q==
X-Received: by 2002:a17:90b:17c6:b0:31e:beae:2934 with SMTP id 98e67ed59e1d1-32517749976mr2112592a91.18.1755831996181;
        Thu, 21 Aug 2025 20:06:36 -0700 (PDT)
Received: from [127.0.1.1] ([222.71.237.178])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b47769afc1bsm2756777a12.19.2025.08.21.20.06.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Aug 2025 20:06:35 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v5 0/8] dmaengine: mmp_pdma: Add SpacemiT K1 SoC support
 with 64-bit addressing
Date: Fri, 22 Aug 2025 11:06:26 +0800
Message-Id: <20250822-working_dma_0701_v2-v5-0-f5c0eda734cc@riscstar.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIALLep2gC/32P3WrEIBBGXyV4XRdHoya56nuUJRh/slISt5q6L
 UvevSZ70aWEwtx8A3PON3eUbPQ2oa66o2izTz7MJfCXCumLmkeLvSkZUUI5kQTwLcR3P4+9mVS
 /LfpMsTRUO06EUkaicnmN1vmvnfp2fuRoPz4LfHks0aCSxTpMk1+6KosTSBw1Rc/WrtqdAgAXb
 fRJZ2ys02F2fsTStcRJZmjDTJcBbZqLT0uI3/svme6ef2uXIVgNwtoWJBgqXjdLWlQ8lWo7MrM
 nDNTHGFYwzUAc10YCb/kBpv7FNMCPMXXBCAo13yopRv5g1nX9Aau66n6uAQAA
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
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Dan Carpenter <dan.carpenter@linaro.org>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_200637_524295_87D0FB10 
X-CRM114-Status: GOOD (  13.39  )
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

In v5, two smatch warnings reported by kernel test bot and Dan Carpenter were
fixed.

The patchset has been tested on BananaPi F3 board.

This patchset is based on v6.17-rc2, with patch 8 (defconfig) depending on:
 - riscv: defconfig: run savedefconfig to reorder it
Link: https://lore.kernel.org/all/20250611-01-riscv-defconfig-v1-1-b48fc3517498@gentoo.org/

All of these patches are available here:
https://github.com/docularxu/linux/tree/working_dma_0819

Changes in v5:
- Rebased to v6.17-rc2.
- Two variable dereference issues are fixed in patch 4.

Link to v4:
https://lore.kernel.org/r/20250815-working_dma_0701_v2-v4-0-62145ab6ea30@riscstar.com

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
 drivers/dma/mmp_pdma.c                             | 289 ++++++++++++++++++---
 7 files changed, 343 insertions(+), 36 deletions(-)
---
base-commit: f3c5631f70e434e318c44001e2417d4770f06cd0
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
