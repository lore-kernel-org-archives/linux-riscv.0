Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19CC7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Mar 2022 09:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cDjXwcCRN0U7lK/j9XJRTH04ISsg1346rbIchDgVvlk=; b=a0WIdKGcVDLQA4
	8hm/ycBx3JYXcmuK0Ywxeic3qHJIL61v/xw+nlDtR7xK6e4s8bYtgeQUgkR5KbiWApLjLNW7Ky4v7
	z8MIGiSL4ZupgrZ5pNPCQR4eaM+l1ClzspxEascw8wZfYI3pP2Xk/NyRsm31DIeeSkuztqmB4/QaA
	oJD1SjbTDQxf1TXTXlh/6vhQTlxkWwwB4r/6m9gJihi9LFnbiRfvyOKhaMseJmMh5HukM7aavxPk6
	NaxP/VnmAwe3FyQBnSDVgnHIdyVPhZ5wtwmK53p42Huhheo9uUSUe20eTjeugePn7nCmDGi9YTEGh
	eAcZNu+V5WhHC+FD/01g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nYm3A-0085dQ-HV; Mon, 28 Mar 2022 09:52:36 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nYm38-0085cs-EQ
 for linux-riscv@lists.infradead.org; Mon, 28 Mar 2022 09:52:35 +0000
Received: by mail-pg1-x531.google.com with SMTP id k14so11879129pga.0
 for <linux-riscv@lists.infradead.org>; Mon, 28 Mar 2022 02:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGo4IXWrYvYFKPb6MuOn5Y1sxNV0CkrGIqSlou+M1J4=;
 b=OZBLlblazJg+EmvIrbImIhFMYRc17sRbB35Fpi9pwGw3zCANNiPPqEXPD9uVvr/YKJ
 CDNYqmhV02YMDkcjTqm5oo3fbexRXcHsrZyvLWFNmYwKrA+FWP67bM9qhOQjSTx0YvFf
 F0StCKSgSek98iYfrywdlDTmKSDQOt75rkK0cGzUAq+8LI65wQ+t10SW9Lpty0hOU6WW
 0DKPzpm+cEphwYjWDfxYKCPcl17jtcAT6clLXTgD4RyDdfs7N249dCkRpgrvbXtK0+mN
 qcN5+sTK2Q6x7ikn79RlM1X7pw6+Gz7w1KiRglEYr2QgpWWpqrdyP524z1fMTHjwozsS
 L0xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=sGo4IXWrYvYFKPb6MuOn5Y1sxNV0CkrGIqSlou+M1J4=;
 b=eTZn8LTlNKq/g9JvYnQbogOaoLAeux1C29/87ibDsN/ZKVVncOHByV9qJVqkZLnx6+
 0NhvOx0aDdunivGVye0lOG8Buv1buLzEBbgj0nd3wJYRtr2cKKxE7jwFREbbqWjl2tDM
 g8hOonxCXeqMSRvoKopyCV+aO/jD+QGX4yFBHKrDQm/K+Py/Ks/CsgJt6JpCT707M+8z
 VDMmtu7d1nTDANCltif/EJAm9XOsUSGDTtbanMg5WSih8bauYGsOsnp9MROx2eVlD5ZL
 W4XFrZbJhBMNIteTJCvmtncorX9hMHX3+XXviOe0in/uKTV+03gQSrW+EZimFc5dSD4+
 eULA==
X-Gm-Message-State: AOAM533VZXKQMtULyL8AULoigUEsrOlzXR2KRdUvcBpg8JMx7KSbFJqh
 r+S1FxcOzQJpUfCTAfoTQtqlPg==
X-Google-Smtp-Source: ABdhPJyEdL4vRhiN0Rzcr0Q3f75Ps/anTwmCSmRk/YAdIpVodv6Qix9JzmuNaAukmjuhbbiN2TfclQ==
X-Received: by 2002:a63:5ce:0:b0:382:1f05:c8b1 with SMTP id
 197-20020a6305ce000000b003821f05c8b1mr9604717pgf.19.1648461152933; 
 Mon, 28 Mar 2022 02:52:32 -0700 (PDT)
Received: from hsinchu16.internal.sifive.com
 (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
 by smtp.gmail.com with ESMTPSA id
 g4-20020a633744000000b00381efba48b0sm12255117pgn.44.2022.03.28.02.52.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Mar 2022 02:52:32 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, krzysztof.kozlowski@canonical.com,
 conor.dooley@microchip.com, geert@linux-m68k.org, bin.meng@windriver.com,
 green.wan@sifive.com, vkoul@kernel.org, dmaengine@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v8 0/4] Determine the number of DMA channels by 'dma-channels'
 property
Date: Mon, 28 Mar 2022 17:52:21 +0800
Message-Id: <cover.1648461096.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220328_025234_539485_F161CCCC 
X-CRM114-Status: GOOD (  10.29  )
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

The PDMA driver currently assumes there are four channels by default, it
might cause the error if there is actually less than four channels.
Change that by getting number of channel dynamically from device tree.
For backwards-compatible, it uses the default value (i.e. 4) when there
is no 'dma-channels' information in dts.

This patch set contains the dts and dt-bindings change.

Changed in v8:
 - Rebase on master
 - Remove modification of microchip-mpfs.dtsi
 - Rename DMA node name of fu540-c000.dtsi

Changed in v7:
 - Rebase on tag v5.17-rc7
 - Modify the subject of patch

Changed in v6:
 - Rebase on tag v5.17-rc6
 - Change sf_pdma.chans[] to a flexible array member.

Changed in v5:
 - Rebase on tag v5.17-rc3
 - Fix typo in dt-bindings and commit message
 - Add PDMA versioning scheme for compatible

Changed in v4:
 - Remove cflags of debug use reported-by: kernel test robot <lkp@intel.com>

Changed in v3:
 - Fix allocating wrong size
 - Return error if 'dma-channels' is larger than maximum

Changed in v2:
 - Rebase on tag v5.16
 - Use 4 as default value of dma-channels

Zong Li (4):
  dt-bindings: dma-engine: sifive,fu540: Add dma-channels property and
    modify compatible
  riscv: dts: Add dma-channels property and modify compatible
  riscv: dts: rename the node name of dma
  dmaengine: sf-pdma: Get number of channel by device tree

 .../bindings/dma/sifive,fu540-c000-pdma.yaml  | 19 +++++++++++++--
 arch/riscv/boot/dts/sifive/fu540-c000.dtsi    |  5 ++--
 drivers/dma/sf-pdma/sf-pdma.c                 | 24 ++++++++++++-------
 drivers/dma/sf-pdma/sf-pdma.h                 |  8 ++-----
 4 files changed, 38 insertions(+), 18 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
