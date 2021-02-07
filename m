Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 970F8C43381
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 467AB64E31
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 467AB64E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WMKUUrQCbcO+nF3Bv2V20DdXycmeQ/4m+KbZtp7RNZ0=; b=b1KY51jnvPfrQrYfz3cHhHFGr
	jjSQ3qtUySJcEnl5VS3mmH0k/rEwWLP67UWg8KQraZir7C04AGuSe5/5Ey1694GCRbvD1yzkclSyj
	FDmRunM7EUApd3lt47m3vfAeI50UDFoGvi6kmWaQLHskQkvAzvqqCRK8vF7rs5g7YJW4I3M///1WR
	C5Pjb5LoG1oDePWMF3Vho2GClktyEqcjjoW3ltRZJxkKpIh8s2zMyuXmtyPfWLXOEsUoc4bCOHYqS
	0k2yC812v9RE2Z2ELbw7xnu/84Vto+0TT1ryI5gFOveLShYO3/aLovC0SIt8cxZkpV0K1c7tYsZWd
	u81vvzWQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8tEu-0006PJ-L2; Sun, 07 Feb 2021 23:13:12 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8tEs-0006ND-3a
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 23:13:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612739589; x=1644275589;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=vo/OPIAjkDR1OdjdExr2oFWyf1l5b2KQ57/Uzl/0wR8=;
 b=W1QtD3sTJ2C0jlD3u3GkVkUNhURNM2aHZrF8NHYer+nVNisebyUbff53
 0bBZed1cwdrQXriKC3Ba5kDfoZ1DbUS2Yt26FTMI1k+S2kVdSdmb2MGHo
 Mbjnj6eshvGms8kALcNiYk4NekIYYihc+BSNtuSqJgFfzRpVCH9W3Y0dX
 zaNM2JQrsWPDZdiIuK4mp38FMd9rikekAGhRqtIxpohZbv25xSsjZ5TXL
 JBJQVCf29pxWUnXbinQgFARKqWwSrqmKcBET+x0l1lKHZGoWzal5+N3z5
 pELjZ04H6INpfwfxE1lZ4D9JmNtOrbly2AVdoz5iTD/ijAftjfZgG4ErJ w==;
IronPort-SDR: nGtH/caB1kYCxgAyvKKdoCPQGZCtHmM70SacICwgent1JNn15F0zyYshqFkt8r5iCdb1vmn8d5
 3AI8emFBDDesbSAcBKCX4wniDBF2Ri6qr2MX/ESXoGetehmgfimeG74mGmPRAZ8hA48YwL6LdM
 UkEF70puYdquIxACoy4R8SZPd1E1FXJZMHni0bygSK2LG4DW1lYBSYY4+2dfGjv5QpnFPwu94z
 VqkOva4QHmjejVUcu/uF9i+jXIlBS3P5qpWLgFTaYBgEYjMPgTawajoBtQ75KVjWCBF9ExH5Pm
 hHs=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163861261"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 07:13:09 +0800
IronPort-SDR: hMeLQRdb+0uCet0F5UkcyOFTh+B6WbnNlbo96Rg4nNydKOoalj2nE9ewYc0Y9dPBkDz+2BUw8N
 6MwpdInrGuOSIcXeiKF38UB3d4gObzCY3B0fRhugA0EGnX2eGofL5EpHM0u35BU4u94IO7Qo4P
 VW7yHQv7/u5FiS0Uqtxv87Ry39eG6du2Lq/vslh5ydE71/0G4i5Pt71q+iU0Jk1Cy/Zh/zHet+
 +VDpBu3b5U4nJ8gldai4xUXryjiZdWBpCjt3K/wGly4afCv1lALId7POFBvAxVyy5EYghB3oHx
 A/0g5PdATxj6TObQyvOKMk1R
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 14:55:05 -0800
IronPort-SDR: sMcVTY6XlLxALlcUIMFdOLEl6INn8etK5uhJBpz/GZND6F0Yb8pwIjIZxntURz38JhwL88XA6U
 OuxuJlDUxsd7zvwzLSLHiBimB2ujxZN1xEJSKP9kY9tBn9mFf5tSm3ks5RQFFVGETf+IwxrOgI
 hP3Jvw6dRhaTppmLZRZN4dHbG8v9DAMi+edciuzxBAhs5Ltq3C2cR4QHoC6UPjhwmXs+itjhpj
 6+DkWxwHntPPr4u0794SxVx5JLwpwMGRD8ZgQ572w3sD66L5gvTD0mCqlFnGPVw/NPLLNH5z52
 5bc=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 15:13:09 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v17 05/16] dt-bindings: update sifive clint compatible string
Date: Mon,  8 Feb 2021 08:12:45 +0900
Message-Id: <20210207231256.115130-6-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207231256.115130-1-damien.lemoal@wdc.com>
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_181310_310881_5083159B 
X-CRM114-Status: UNSURE (   8.80  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add the "canaan,k210-clint" compatible string to the Sifive clint
bindings to indicate the use of the "sifive,clint0" IP block in the
Canaan Kendryte K210 SoC. The description of the compatible string
property is also updated to reflect this addition.

Cc: Anup Patel <anup.patel@wdc.com>
Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Acked-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/timer/sifive,clint.yaml      | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/sifive,clint.yaml b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
index 2a0e9cd9fbcf..a35952f48742 100644
--- a/Documentation/devicetree/bindings/timer/sifive,clint.yaml
+++ b/Documentation/devicetree/bindings/timer/sifive,clint.yaml
@@ -23,15 +23,19 @@ description:
 properties:
   compatible:
     items:
-      - const: sifive,fu540-c000-clint
+      - enum:
+          - sifive,fu540-c000-clint
+          - canaan,k210-clint
       - const: sifive,clint0
 
     description:
-      Should be "sifive,<chip>-clint" and "sifive,clint<version>".
+      Should be "<vendor>,<chip>-clint" and "sifive,clint<version>".
       Supported compatible strings are -
       "sifive,fu540-c000-clint" for the SiFive CLINT v0 as integrated
-      onto the SiFive FU540 chip, and "sifive,clint0" for the SiFive
-      CLINT v0 IP block with no chip integration tweaks.
+      onto the SiFive FU540 chip, "canaan,k210-clint" for the SiFive
+      CLINT v0 as integrated onto the Canaan Kendryte K210 chip, and
+      "sifive,clint0" for the SiFive CLINT v0 IP block with no chip
+      integration tweaks.
       Please refer to sifive-blocks-ip-versioning.txt for details
 
   reg:
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
