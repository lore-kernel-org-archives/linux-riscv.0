Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA615CD3446
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 10:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vmBkhRGXMeyygEcONK2x3AzxEtNBtG/w3fawQeEt/wk=; b=yaV6MIWdI5PdAg
	wOF0vBGIbf4vVbzXiHPWKX50A7gaycSXkNnLxCV1m5P9Vi3r7XRTBt7aA8btFoVYLJbg+Toyu6hea
	tYacrLXJl85UWCxBGB7iU0GfhSs0YrXkK6/d+FMfqnEiJ+FjiNzRb3/39dHa2jyzvUh39YkPSt1Gm
	pAoOGZgjsI265ryoKDwMBEwjxyVwfoXGThRUlUNl4rc2Tecn3SGZ22YSjJS9gMILJl/SxEJKHNGeQ
	cML85T16pkyUkszvPlvl5mzhMbhvFqE0T8xonUM9Y+4LDi1qf2E5qXvEBE5g8KlTJJg/mvDeEX+er
	AjmFn3M6l8rgT633VeMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKw6K-00000003VEb-4A9K;
	Thu, 07 May 2026 10:37:04 +0000
Received: from smtpbgeu1.qq.com ([52.59.177.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKw6F-00000003VB9-0pmT
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 10:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1778150201;
	bh=gy+vLIjyMT6857Vtois325dTt+YrnhLSIrioPPR6St8=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=uRMixVZ25rJuwH6sWdxE6UJv3SKMf1mqHNqfsmGMdee6wb+F2UQ4ZBWUO64RA1c5S
	 Dw624zZyDFqyC2hds+c5fRe+8ycJat/pdn8n4fCKFpzREIu+/xZENPGltnQWmEshd/
	 A2AvkwFhiVSfOaPpYL6xRVYZywzairkB59xtjSHc=
X-QQ-mid: zesmtpgz4t1778150192t8267e74b
X-QQ-Originating-IP: ujIz8YOVnSW7B60VWyM9hjIqW8IOmbsxyg9lb4tPWKE=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 07 May 2026 18:36:28 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11798738260488790432
EX-QQ-RecipientCnt: 21
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 07 May 2026 18:36:20 +0800
Subject: [PATCH v5 1/4] dt-bindings: dmaengine: Add SpacemiT K3 DMA
 compatible string
MIME-Version: 1.0
Message-Id: <20260507-k3-pdma-v5-1-6b9743038026@linux.spacemit.com>
References: <20260507-k3-pdma-v5-0-6b9743038026@linux.spacemit.com>
In-Reply-To: <20260507-k3-pdma-v5-0-6b9743038026@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778150183; l=1136;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=yaSmXSO5vYt5nKO5ZoIxkQx6dxueeCXO+Z09BlgFE88=;
 b=DfAnWhO59vA3gBFJDzFcMc47+7DcXxyYCFrlZJezXk22v/rK7/MplMET66tfXPZitK6x2nwTQ
 +sW7iDjz0+KDEwT4CU4F0tje6Of1netzpHoWZEOt2qD9c+ud4BvBgoY
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MXi6VldghLL7KNMlXpEfS+zl8XikIkiGAWAnqtt4jiwS+Fdal2uY7+1d
	rXa6j4MDRHzc1QO4G9qvd3haUWYdw3eWSUwnl1+ZM2qTkVAwOFmrfh7Q7oPUI8Xw4xCoBoV
	qICeJNNAMnqmCUY76l66nrgZsfIv3vLLjusqay72OQyZW4Nz3YhnmvUWR+1VaYcqCsBis/D
	8kM+/AIE1dGxzUyC3yI8RFu2Tl7rxBgSOnWUuHtz/E1eOe5Bhr+mEeUgH+fTMmiKTtFQLeU
	jBx1dL2K8CEjUWCLpM3FCIV/fxu0hlE08sUTwKhymghtqDpdESzvNj+HeZeDJqdUEzRjBDL
	Kn/Y7YvWiK/8qViFQKUcGpXuHuCcR/o+6Zl5tk4P93GU6w0ouAVeDFtSis5drw496ljC+0j
	hNJhqq8QoOU51wCq5pfcCXK8ciT2uW2g4cxyu4445eDKZz62xzZs9WFhHQ3oxl4RI9kvPEW
	YyS/pxFDRZPkAaE8XNQvLGrzCMeoCsJTxbHOUOa2YJFCYxYewWDw+DBoNFFsaP6RsQPcxx2
	k/9ou9rMUZliveW+Dvfp1b6vJTJnco4LJE6DlEU8sDALoqsL4cs6ePWLRAKeahbH9w78BbG
	ONHL9ePXgOLR2NpBwB636lD+sIdVerhgkGL9CBNCEtvHWE8JrieZI2r7gpm8wvjVmVDTK3v
	CIZi1JW0QVHTeweFMYdanTm9TFE4DyTADn6gCBrnG7lKiTBviVcf5KgfxbO5WJo+XkFqLYW
	zow7GQ9a55nFr45MHXYZkC49NVX+5YC8QLap2UGw6RcSoij9I1Dvx1S8RrsuGWO95WF/7uk
	TNmL2s2AQvBaj3W+NI5WzA8AwQdQcUVaQJ7xKGZF2CJFH4f1vAGstfDsLb2op9RQeKCJKlf
	ZKcETueMz8A9L9FhteopulvZ5K4b+sJhlOk2cNncp+fPFNyExWTwYjoWml0bMdAGsbtuSlG
	c6agxrQ+zjqo626UQ/Sa/or90eIJn/MpN4JybNI+HrCP4Zay4HpTsQ3CucVZtNRGcH+GMnk
	ZEs9rZm1V+/shQGQ6hsCvg0gMUMmS2dY2J7a2wGLMNOv5etcQkUS9iJriyhE6YXKe9E7ODE
	nUjrXl5SI4uBUwvmn+67ovkfuEQwU/Lv5IgNW1w0e3oUHukmSe/K7HeKXkgsjnYlrbzuqsZ
	yLJh
X-QQ-XMRINFO: Nq+8W0+stu50tPAe92KXseR0ZZmBTk3gLg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_033659_707436_35196BE4 
X-CRM114-Status: UNSURE (   8.29  )
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
