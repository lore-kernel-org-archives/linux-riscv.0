Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3994FB44CB
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 08:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BXYHEOe9EW1w6i3kEPTstGYH5RrXh7FuK9UIdaxzKO4=; b=n1wOQkf0DGzkK7
	Opgv7RAip1Gti22Nz97fkwjeiQSWxAqzIC6eo1HuD1tUo026iyA8FNaGKYZcxQIXM/g2idqZUHAlV
	BQIoxiIrQ8iE8firZVAAps99XtKvB5YumTNoltdk0Ya2VnFJaxvjVmIiryyUOm9Ok7O/3Oy8DKd7f
	uV9GFnXiWhfgMroek1VsoXfQUDDiSsKvjLakkFRL/h/67SjrlUxC55t3QdluVtcOQ6IR3qkdjYKsx
	cg9tJjR2NGQfQttVRzCArhOynUUmglIowitXicR1+KLWcaJQ/mtFmsHfsYtklOtMcyxu3bTdJaka2
	cNXWoTMkK9PalRLsP8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBnG-0000000CrDg-36a2;
	Fri, 24 Apr 2026 08:21:46 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBnB-0000000CrC2-0MP8
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 08:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777018875;
	bh=brvNO4gsNvQne038G2C4scixZLOaufrseD/dFebxobM=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=K+pJdg3oY4n+fOHf4tYwxc26BDaSgN9tfwpWuluyEmOgz0EGGuQV72kBlWL0CmUha
	 BLXqTmbQpbVaQOS0QlQpGvNP4TN0GHHZpS6Ri1kjItl6Ox0fPmuviB0MvY9d1X6yxn
	 wcJ+MnWFR4WC4tA7gq8qkAGsFCsYqj32+asBCbJM=
X-QQ-mid: zesmtpsz6t1777018873tb1ab1047
X-QQ-Originating-IP: ufEdjdipWm7MGu+Vu3Yk26YwIrbAkY8MV53i3lNL3ro=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Apr 2026 16:21:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1477805861798057828
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 24 Apr 2026 16:20:29 +0800
Subject: [PATCH v3 1/5] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
MIME-Version: 1.0
Message-Id: <20260424-k3-pdma-v3-1-efdf2e414a08@linux.spacemit.com>
References: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
In-Reply-To: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777018865; l=1083;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=Lo/DwZzuoZUiWvEIhHh7o6kJxCCRQoshN/v5iQysrmY=;
 b=vnCQ3ZLAs9KSQIQnKxxJvybwJqfP/CL41CYNlk5lBFzIuIXAy5Vfjir+tJ9zfG/3FzU1IBUo/
 JtOShwruYsmDrmsPAwEtoEvZVUD/xw58L517uzVgSsKfQ7ka0FVF2pK
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NvH2zBBgt3uT3LqkNSbETk4XKvG8OIUj+p436IV9O2xhzCTBcY/AdgX5
	MsEFhI4z9FzVHYTkmLyVvxKU72gdZ7tdcnHc1p7qipATbtUNPrzWviUvNRxfXQtcjlaf7ei
	mwJf17awioDD6nTx2X5JrEJgPJCp8chBKCPlOaIhnwJhdV+sP4Pd9rWNhjkzZVsUQtj7M96
	YB5azintr1nfrKSIYUGatdF+kDRSMxrhQa1mpASE2XWJn5EpBYQTVJefF3H3vPkTE9L+zx9
	zK693npWbynorh4xaIfCFbV7bgVUE+9NJ9+UjW12H2oaj3BT5NDW5hbxDYsHBi1vryABYJw
	fiHBUgr2eLV8sDsSRWy2ZHlitk1OPb+gEUBwxgNvnQWnNHdT92wn+HaW23Nymt0dnOZR4KQ
	/RXbkD7/kq6HDFSynsO09llYnnJ9X4HwK0ovbfNlKmRu4S9GWvfIrw7MvVl2HxhobElnZTB
	hKHw3r4X1hQTyM0ZFGjDk/tqcNs8uqxubBB14/+FI1E4UduZms3aGenuvAXaRnXq9/qA3F7
	qx9X7GKjuJOqbNFqBVJXWF5UpO+n3gqx6cxIIbf0e7hcYVRi4LQmMocXP94UGIFcf7DQdF9
	Tm1F7635RHbR/WOhQJPMBRvQsfxggHkHNQ5v0D6kuLbF6vwsD6vCKwfox/KlN6Lj7bUua0e
	5rTOEs0AynqW01secAnIFg0TKEP+EgyNJpJP1DKk8KCh/KfTLevBEyeW2J5f8zxYOWhIaEy
	8GFeMiDm37VaMPvn2xullOwqSPObHt00crPj2P6flxueXbOHTl2ntEnLXJ8V9fsrwolKOwJ
	XxWPfYqlflz57p3vy4OIwqHWucJM2BRSvZHMOwa0dMSy8FcClZ4uSg7ANZyOfrk5uLBOCcH
	iGjiwLbPoQrtNsZWOaY0zmBwLAuOn/bkf/lp28mUsCxK9EidK9efh4c+twpF2whev4NDTue
	5L0wErhUoPPgXgi4Zs0+Woq4BkElL0jPoJdPBB7946adBrwdVfua50ADqw8DrgcBlMcYzWE
	Mv2xY3b1iMMlGYbPOfc6s1tjluk6VXHBXN1F/ou0SNCwVPzeDZYS39M9LBqBM7ZsPClIiag
	9NzOpoMoo8OHX6mnNQzJD25aUR8lkJVMW8Rnu9io4HE
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_012141_895931_0ECF8B12 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Guodong Xu <guodong@riscstar.com>

Add the "spacemit,k3-pdma" compatible string for the SpacemiT K3 SoC.

While the K3 PDMA IP reuses most of the design found on the earlier
K1 SoC, a new compatible string is required because the DRCMR
(DMA Request/Command Register) base address for extended DMA request
numbers (>= 64) differs from the K1 implementation.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
index ec06235baf5c..62ce6d81526b 100644
--- a/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
+++ b/Documentation/devicetree/bindings/dma/spacemit,k1-pdma.yaml
@@ -14,7 +14,9 @@ allOf:
 
 properties:
   compatible:
-    const: spacemit,k1-pdma
+    enum:
+      - spacemit,k1-pdma
+      - spacemit,k3-pdma
 
   reg:
     maxItems: 1

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
