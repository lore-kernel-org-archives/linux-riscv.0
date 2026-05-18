Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0523BCD4F3C
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 03:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmBkhRGXMeyygEcONK2x3AzxEtNBtG/w3fawQeEt/wk=; b=TqIrVJZNLbfMfQ
	1P/Mgxp9XZHwvl7Kt0Ia4Xkqud78eyeznd5UYxayxvyFhpd+3srG5oeMrICqb/x1u3rLTVVaEyx29
	Wt9vm78n4SY2EL8nKXG7Thad4CSu9GBm+ZJLdLuyYAtlNzkjHuJMCmLHgzmFsVrhperryIzHmhXjV
	VbJDrjT3KhkSFOHmDBim5EtnSVkD/1XvwOBMfZSn4VLEkIs9TXx4W9inUBx/H3a0skQmZMGxnemD+
	WNJD5klC/iPrzQ2SDZy/4CPv7bc1u3LmJA7zQYy+TRzVE2bwxZq9e/4HS92ighPscmGs4aP9+yt77
	B1IvqiQdDrFGGbCLFYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOojN-0000000E3xK-1yui;
	Mon, 18 May 2026 03:33:25 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOojJ-0000000E3uG-3a6Q
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 03:33:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1779075179;
	bh=gy+vLIjyMT6857Vtois325dTt+YrnhLSIrioPPR6St8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Hv+Ec8hgUmMLye2OnkQiMFf6pNZglDWaHNm5otFpf3mbNPl5A1P047LEhZolhwCTL
	 amNTCigG8Og5Y8hmBiSfG0RwyPcS/3cQUE0osyzpbZCpdReQUy3SK/2QcDYkJBNulc
	 F3VaOhavKdoBGuRAeeladZdrp2Ei56vQy+z8hg2M=
X-QQ-mid: zesmtpgz9t1779075171tf46ec625
X-QQ-Originating-IP: DRI+fk7/Uf0YrY164m/MNKWpAys+m6hYORxEOfYA7Og=
Received: from = ( [61.145.255.150])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 18 May 2026 11:32:47 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 2042237181081148708
EX-QQ-RecipientCnt: 21
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 18 May 2026 11:32:41 +0800
Subject: [PATCH v6 1/4] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
MIME-Version: 1.0
Message-Id: <20260518-k3-pdma-v6-1-67fdf319a8f8@linux.spacemit.com>
References: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
In-Reply-To: <20260518-k3-pdma-v6-0-67fdf319a8f8@linux.spacemit.com>
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
 Conor Dooley <conor.dooley@microchip.com>, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779075161; l=1136;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=yaSmXSO5vYt5nKO5ZoIxkQx6dxueeCXO+Z09BlgFE88=;
 b=W+5F5yNPpwe5k4aNvILetfG8MTdaq9zRwfU6oC4yYxh+ievsDveayf932kijLZHal5EV7LC30
 PZvbYXimU2DAWfDHmLPX+hwbP9b2HvQFH3223XiI8PRhWzmrEK18hCk
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M8UYpcaD4/AyTVxWAAid9s0jQq/BAhkHQDxth8iqqpCeSeac47mut5LG
	k6jnognRm1gzKbPOc3aXX9xe2gs6wNeyNVqOzXXOUw7/Vwtciw+PsE0W8Nthm5FLLUCozrd
	5qn8yh5MLMjTluoXNLp35PLP+wKza6/8xkvugg82cKVoBNDJXDY+4UJEVsfxPicVwKXRPMq
	GV4PLya2EFlYNM8gWjllIkwhyPz9eTVR4UkBoxWl/BpI8kWz8+9uFTAQz1sA8e9LM3sfx6F
	iihIxirk4b6LZ9OusD9HLPIABOLDGeagjIWfxlezfdD1vjzJ7dPGuC53AuLQYrXXbrTy4u/
	+USwITUWmmy5WrzO77Kjm+gelIeIg9pNBLoTKxpayctCrHgWrr+TQk89W1qI1Bp1oCXRzAg
	3LSl5C43E7XFP30TlVII0x5ZgfwNJhxhaUjSzSaA8b7cfbP9sch3OgeaeH6cIIN+oC3QawA
	hXiEOAarfuKhwOUFboe/Ydf70Ijo6OWdHEYnOtE5op5lSOXqSPV4e3yDxbBPyoPdByIJxbU
	f2D7o5s7AKNIOcebZnxA0yE1NDKCOkupGMNFQ4G+DqMXnk8k/7gUWGC+oHnAFs6Hl3nD4w5
	2ZdoOgg2r6Th4A7UszCvYzG4VL4piz7XTc4USzY1Aa/aFwK9rX7sSd1/sefx3JO7n488w6e
	Y43Lw0yS7PyAUyb3oOKpYdZYiWE8jIEdDAPbR9fNkJMJiZcnr7EgnBuGQ6Q3XbEosvph58X
	0rwc22E3AFpZzTh3jTsFGeJhkNp1XUNUds0RZchr5z4YXzCE+9v5W414ZCYX4XHPdXoq8LH
	iu4DA7pIjK59ZeuKE5Yu1bUS1zXPw3SMiUgQWNXV08gc2sjf7dYandyZdCgt69DASOViZUM
	7oFJJpA7FGpMm6ZnrfnaGv0Ub0uRmFtPtHY+uulZrJBLjZnxV51Cti4foKcVqZvnft7BrP3
	rMjKJq7EZ0ONHPlKDJsrTC82LIo/cEArKz19GiJlKaPL+DPPkJlX860AjgC5MLFsj97rM0/
	GSdbhzaDl7+XvEc1NMajSdnA0FeC8DoVV53qtUfUh+G4ihYCAqHWoKspNW0IZstM6yfcoXi
	5AQJ6jhkMwEUplRqnF5S3sUsOieLXoyspkW9lWaNyJUqE3QfxC7cxpOKJOIzI5M2Q==
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260517_203323_055090_3286750F 
X-CRM114-Status: UNSURE (   8.70  )
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
Acked-by: Conor Dooley <conor.dooley@microchip.com>
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
