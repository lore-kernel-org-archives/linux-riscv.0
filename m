Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 399F2FB44C4
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Apr 2026 08:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hltxK2qWwDIlAHmVJUuRl7fNHbcFdLfgw07wrKbBDbQ=; b=LwKw0loCKpgYkL
	1IePFvTipv5cU3NnCVrkiKn+xujg4tT3DOKYEiKceyCvKPxQMAxQBK7oafRtT0eegdiZ6fjZWQDPp
	GNcPe+lbsQhS2M+boIf+w/y6dXeB6Rc0j4KJQg5G/Bxz/zuY0xS8B7pCEE6N0Lc6LYyxAufTcew5+
	7NxBIZETpz0K9n/5Bk8mhDGPXa/oXWa/XH/Qg1pbWdCqgR7FAO642axYAYKX3znSuLUNKpEM9VNVW
	toFhx/c+mOZO65TfDmFmqRCGJViNUeFETSBvI53H3+gdPComcXzVIbCkLTd5+ccUVq8ZNrJGpqqPn
	TforzGx+flGczTXRbljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBnH-0000000CrDo-069K;
	Fri, 24 Apr 2026 08:21:47 +0000
Received: from smtpbgsg2.qq.com ([54.254.200.128])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGBnB-0000000CrC5-0vpZ
	for linux-riscv@lists.infradead.org;
	Fri, 24 Apr 2026 08:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1777018870;
	bh=xx2xhls6JeGusSusmwz0pe6256ixEc5mn3Cu2HVVF1s=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=HQeXv4FAgBCGg5u4BDMApKivApvYmOSBLfOesNulma2NOvQm/f4hzguMIgvKFfL+C
	 oyXqPSnnxI6obK+iWI7ef+SGraqi2kmocAr7VaeC9hwAD7b9eCXA2svKX5qBrLQNZl
	 6uhFaiGK5V2nnhjcylyHaNyOItIEpGqOycfENkK4=
X-QQ-mid: zesmtpgz4t1777018868t46f69d26
X-QQ-Originating-IP: tAaPTsa+agutLZMoc1JdLkgIROUBbpeL5bQHbMIDIjM=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 24 Apr 2026 16:21:05 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 5294705586084115619
EX-QQ-RecipientCnt: 21
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH v3 0/5] dmaengine: Add Peripheral DMA support for SpacemiT
 K3 SoC
Date: Fri, 24 Apr 2026 16:20:28 +0800
Message-Id: <20260424-k3-pdma-v3-0-efdf2e414a08@linux.spacemit.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23MSw6CMBSF4a2Yjr2E9haaOnIfxkEpRW6UR1psM
 IS9W5hoosP/5ORbWHCeXGCnw8K8ixRo6FPg8cBsa/qbA6pTM5GLMkeu4I4w1p0BZblCKZFLLFl
 6j941NO/S5Zq6pTAN/rXDkW/rrxE5cGhQ1+i0qgo05wf1zzkLo7GuoymzQ8c2LIovQJQfQEAO1
 mhpjaqqQhd/gXVd35T2xzPoAAAA
X-Change-ID: 20260317-k3-pdma-7c1734431436
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
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777018865; l=2638;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=aXz6KFB6Ak0aHujkjCNPn/+tZ3xaXJCbj/26D+Uf75g=;
 b=nDMmkLd3KR24mrdL0/9+JxQlE0rcy63NJSl9CCKyBNTObaTHvVt3v72T3eh9ubbXBngMiz2RO
 flEwaUis3GmByQzD96K2tcAhOgd/r6wqoEUPqn1ulYcn7AHRm3czgL8
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NkGXhzp6HyG+sNdZbxidZ66xnlw9DQxpL2lwBfu2xngeR2yKfVuIZv+X
	4fHvuTNCaY8xAjw/bl5u2IbXXAkhlbuBjrn1g+XXtvn20sxLEuFf8RfgLveSrSeBhKzwYNU
	LbaGUCFjcvXGnNaTWwfBGeCCLa1Pu/aiq20ouYLhJeJnjhS4HZ9+K5OtmNbNqLJOg5xeFUE
	3MKH64B+9EB8m93o9CHx2bKFsv6QNawSFVLBKJJtxHvJOxVVSQb6ft5r35HuivTtrNrNHNn
	qdB4Sb4Y/p2uVLDfWUlQvGHm/Ipbco36QvPoBx9sdRWhpqdRNEcSBCDnM0hUv9oBNyLrLKL
	bPHvs9K+SfXzFfQ0wD9tw109hilZnV/ZS7J4dp4+OokM0tOufXc7C59e2Iq9BQ15h/wgM4V
	7PCBKv1xrcg3NeVGp4Qz74R34d8c4ByQa4UAJ4XFmgclHphwU1UN2VvJpROSKjBfqGHvKRZ
	KUj0Wqg8b/DW75MuQu+BEfgbNEaXtzv1KyLWbJ5M4fgHxYTWyn5/WbceV8nrffXqLlzvU1C
	C9r7v5SFwWZVAmxXiYkDy29gtW6JOabooj7BEPpQMThMM7dz+zUGfyBACS8XewFDXucvJQy
	xH63H8RB0EDeRN4TN6H3Yj83e4azfA5VPdVxF5qg043SnbK02MwZwtFWJx3+yp7aFu3GZfS
	95lRgC7j6JA1SZfMeEbwUdqo7EtaaGoOqqEE2XdtB7O17jLy531Iqm9LjXD4qWPev7rGWGk
	1sWf9oeVlJHr+JLLn3PIs24LvZOTg9fybYgGMkpf27EATlOshHHs3o+qJcIWKKs/1CmXJGb
	6bJO0Hjc68NumJ8soKE/quPZKty0mexj4ajYFdjjavVgfSfoaCUFcLfS0DbrjnyczLO+KtP
	bPPXiquDK9gQY/eOy/i83c8NRfe+6dV4OMJFvforjFnp9nZrGl9kl3KznG+jXkbxGBDScAU
	J32nH7fQJpCbEIZ3WLinm/8Yd1/0LlA07Eo2XgNT8IVD6SDnsHqd3CiDUMWJb2IQn2cjTJj
	c8sstNval310ykZ86LG0FaowuRj8qhp9Iw7/fthNh+ntnqV6DdaR/SjlUZYeV3NLU6kgywx
	PuTN08hwbRju5FfBuL5ysBxTpAQE5hT5kcSk1q0MIg0JykCl6z2pd64uKfcNiyqizGg5El2
	j9iX
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_012141_900658_B6492F1F 
X-CRM114-Status: GOOD (  11.90  )
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

Hi all,

This patch series introduces Peripheral DMA (PDMA) support for the
SpacemiT K3 SoC, leveraging the existing mmp_pdma driver.

The K3 PDMA IP is largely based on the design found in the previous
SpacemiT K1 SoC, but introduces a few key architectural differences:
1. It features a variable extended DRCMR base address for DMA request
   numbers (>= 64) depending on the hardware implementation.
2. Unlike the K1 SoC, where some DMA masters had memory addressing
   limitations (requiring a dedicated dma-bus), the K3 DMA masters
   have full memory addressing capabilities.

The series is structured as follows:
- Patch 1: Introduce the necessary dt-bindings: K3 compatible string.
- Patch 2-3: Refactor the mmp_pdma driver to support variable extended
  DRCMR bases, and add the specific implementation/ops for the K3 SoC.
- Patch 4: Fixes a critical clock issue where the DDR bus clock
  (top_dclk) could be gated by CCF, which would cause DMA engines to
  hang and lead to system instability.
- Patch 5: Finally, instantiates the PDMA controller node in the
  SpacemiT K3 device tree.

---
Changes in v4:
- patch 4/5:
  - add Brian's RB tag
- patch 1/5:
  - update commit message
Link to v3: https://lore.kernel.org/all/20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com/

Changes in v3:
- Removed the dt-bindings patches related to the DMA number.
- patch 1/5:
  - update commit message
- patch 2-5: nothing
- Link to v2: https://lore.kernel.org/r/20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com

Changes in v2:
- patch 1-6 are added in this version
- patch 7/7
  - update commit message
  - using k3 compatible string
  - Link to v1: https://lore.kernel.org/all/20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com/

---
Guodong Xu (3):
      dt-bindings: dmaengine: Add SpacemiT K3 DMA compatible string
      dmaengine: mmp_pdma: support variable extended DRCMR base
      dmaengine: mmp_pdma: add Spacemit K3 support

Troy Mitchell (2):
      clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
      riscv: dts: spacemit: Add PDMA controller node for K3 SoC

 .../devicetree/bindings/dma/spacemit,k1-pdma.yaml  |  4 ++-
 arch/riscv/boot/dts/spacemit/k3.dtsi               | 11 +++++++
 drivers/clk/spacemit/ccu-k3.c                      |  2 +-
 drivers/dma/mmp_pdma.c                             | 37 ++++++++++++++++++++--
 4 files changed, 49 insertions(+), 5 deletions(-)
---
base-commit: 02f90981a67f3b9ee7d6684e7503a4fed7aade0c
change-id: 20260317-k3-pdma-7c1734431436

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
