Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8915CCF9EE
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Oct 2025 14:10:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aNm5AaSvVzefkHka1ZbxvG4bMafmAbaMJm3vZphibbI=; b=eANYr9E00nCfqb
	crJ7y6QbHzcrmOiKSTrt0Tc8kVMfFm2+cmPUDP/0ja6nTE0OieUirWqShSdqVNENp1cjK5BkLojuw
	QEgvqlFoAyqieWFWRy2qv+yvw+BbMwVqwAk+8WBM3cg1IC42MiXBlVeMUTkSP1OnqtOrW0qu7aaBT
	f/UkPKl2IzGnNJfsw1SrXcuvEwf4aqftE7QPkUW47TnWD0pEq0JulUEIhrcYxvhY4dordo0tK+cgL
	hhrttZ5crdlBOrH1Do/Pn0O5ckdqNNbPwni/bb4NNlFpEXwkN/2ifSrTotnf+Z4bb4S5ClSW80T9l
	3o2Ca7xy5HxIjSWTCNBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1RO-0000000COdy-0uVm;
	Sun, 26 Oct 2025 14:09:50 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vD1RJ-0000000COcs-3fE3
	for linux-riscv@lists.infradead.org;
	Sun, 26 Oct 2025 14:09:48 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1761487768; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=eWjaFslH2tcPMGG5zgIFgoGPqrSnPZO7x9mrraxDnBaJ9mhDAINxuoTcsslaNmawm1yTjHDhsPbg7g8Q1YZj5gHidL4XNpaxbueL8p70IlaOTcTn778xkG6pn2fqochni1IBZ1g/hHqIz8slz3CKnQc9/ZMdLjRwJE/fWye9IAo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1761487768; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ZBPxsrkWSmLQiteb6/a8yDreg1p7ua/veB14Cn5yYgo=; 
	b=cx2vMxhYOgQ3ZRZ3a6fVC0as1+NihWim0Du/2nBI94UYhK0CHxMuyHyUCoTZoyClqfFrd7HtGVRs9nIkASo9zBLKyKPZO/JKxdUxtnh4kE71+Qwu7WM6Ja+RdaTnNsaIKQgEcyDquSqmNbECT2rXYESkE2Z10lg/9OJKQFc9ewo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1761487768;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Reply-To;
	bh=ZBPxsrkWSmLQiteb6/a8yDreg1p7ua/veB14Cn5yYgo=;
	b=U5dAApbt+0AjZroPbJe7imp73vRp30yqPaLgN/m4se1FCp15GlzN/8J4ZJ+JvXq9
	4po7rvgXb1rTDr1cwg96cZMdaSXiQElZep2xcmOAqoavdXxAEGsMtTlDoEx0vrecAH+
	RenBXH4JHEOKgy2Ly6V/rUT54jPosp4/s91Y0+tw=
Received: by mx.zohomail.com with SMTPS id 1761487765250978.5983653950626;
	Sun, 26 Oct 2025 07:09:25 -0700 (PDT)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Subject: [PATCH v2 0/6] clk/reset: anlogic: add support for DR1V90 SoC
Date: Sun, 26 Oct 2025 22:00:40 +0800
Message-Id: <20251026-dr1v90-cru-v2-0-43b67acd6ddd@pigmoral.tech>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAIgp/mgC/22P0Y6CMBBFf4X02TFtKRSIMf6H8aG0g0wiom1td
 mP49y2YfdhkH+9k7jkzbxbQEwbWFW/mMVGg+Z6D3BXMjuZ+RSCXM5NcVryVEpwXqeVg/Qu0Mr3
 iVg9SlywXHh4H+tpg58sne3y+MjN+hmzCEMzG7IrDihRcil9kbwJZcBFSCRwqpRvXq6GulTk96
 DrN3tz2Ee14XF15GcHO00SxK1K9Fw14K9iqHSnE2X9vLyWxef+7PolswbItna4ahwr/WthlWZY
 foW2ywR8BAAA=
X-Change-ID: 20250922-dr1v90-cru-74ab40c7f273
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761487753; l=3857;
 i=junhui.liu@pigmoral.tech; s=20250910; h=from:subject:message-id;
 bh=x1QdWj5YARTXtwAL1AUkpNeyjxImnoujeRx0Kz+h9PE=;
 b=C4yb0Tbb2pPaCAwsss9zhdBinqwjWh+mxScKuAH/XuqHqb2O6ZXTiPEX4C68axO8VMQHrFXWG
 makGw5xKia6Dp4HsRfWTM6SWvXv58PuClpZfqq4oofAh/dwAZ3YbPZp
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=ed25519;
 pk=cgATWSU1KfGWmdwNmkPyHGnWgofhqqhE8Vts58wyxe4=
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_070947_032442_7B808AEA 
X-CRM114-Status: GOOD (  11.95  )
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

This adds Clock and Reset Unit (CRU) support for the Anlogic DR1V90 SoC,
as well as corresponding dts bindings and dts integration.

The CRU driver framework is built around the clock controller as the
primary device, with the reset controller implemented as an auxiliary
device. The clock part refers to the vendor's code [1] to determine the
structure of the clock tree.

The Anlogic DR1 series includes not only the DR1V90 (based on the Nuclei
UX900 RISC-V core), but also the DR1M90 (based on the Cortex-A35 ARM64
core). Most of the clock tree and CRU design can be shared between them.
This series only adds CRU support for DR1V90. Nevertheless, the driver
is structured to make future extension to other DR1 variants like
DR1M90.

This depends on the basic dt series for DR1V90 SoC [2].

Link: https://gitee.com/anlogic/linux/blob/anlogic-6.1.54/drivers/clk/anlogic/anl_dr1x90_crp.c [1]
Link: https://lore.kernel.org/all/20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech/ [2]
---
Changes in v2:
- Update copyright infomation
- Add the original vendor author's infomation to the clock driver
- Rebase on the v3 basic DT patch, which is based on v6.18-rc1
- Link to v1: https://lore.kernel.org/r/20250922-dr1v90-cru-v1-0-e393d758de4e@pigmoral.tech

---
Junhui Liu (6):
      clk: correct clk_div_mask() return value for width == 32
      dt-bindings: clock: add Anlogic DR1V90 CRU
      clk: anlogic: add cru support for Anlogic DR1V90 SoC
      reset: anlogic: add support for Anlogic DR1V90 resets
      riscv: dts: anlogic: add clocks and CRU for DR1V90
      MAINTAINERS: Add entry for Anlogic DR1V90 SoC drivers

 .../bindings/clock/anlogic,dr1v90-cru.yaml         |  60 +++++
 MAINTAINERS                                        |   7 +
 arch/riscv/boot/dts/anlogic/dr1v90.dtsi            |  41 +++-
 drivers/clk/Kconfig                                |   1 +
 drivers/clk/Makefile                               |   1 +
 drivers/clk/anlogic/Kconfig                        |   9 +
 drivers/clk/anlogic/Makefile                       |   5 +
 drivers/clk/anlogic/cru-dr1v90.c                   | 191 +++++++++++++++
 drivers/clk/anlogic/cru_dr1.c                      | 258 +++++++++++++++++++++
 drivers/clk/anlogic/cru_dr1.h                      | 117 ++++++++++
 drivers/reset/Kconfig                              |   9 +
 drivers/reset/Makefile                             |   1 +
 drivers/reset/reset-dr1v90.c                       | 135 +++++++++++
 include/dt-bindings/clock/anlogic,dr1v90-cru.h     |  46 ++++
 include/dt-bindings/reset/anlogic,dr1v90-cru.h     |  41 ++++
 include/linux/clk-provider.h                       |   2 +-
 16 files changed, 921 insertions(+), 3 deletions(-)
---
base-commit: cb6649f6217c0331b885cf787f1d175963e2a1d2
change-id: 20250922-dr1v90-cru-74ab40c7f273
prerequisite-message-id: <20251021-dr1v90-basic-dt-v3-0-5478db4f664a@pigmoral.tech>
prerequisite-patch-id: dc2c18c600b0efd0e3237c11b580cb011b3f5070
prerequisite-patch-id: d67ae8ee7c8f7dcb35dc7417d002b1d9cb4d928d
prerequisite-patch-id: ab3aa9ae32dee038edbee3fd0c809fe4bb724d1c
prerequisite-patch-id: 8449f95ede2e21e6e545fcf8cbe24d6cfe204bfc
prerequisite-patch-id: 3aea99ba3c003e8604b20524b785eebb62f837b5
prerequisite-patch-id: bcda9d5f27158bf498cbf63fb9a5cc748d84b02a
prerequisite-patch-id: 21df177b6e5bfe62e9bb698a4fcfe1edc5484ab4
prerequisite-patch-id: 2c6db06e8d61a46fbd68f6ecc49e111ad0e5f145
prerequisite-patch-id: 3dfbda7104f6b4eb1fe681819209d0731f00edf3
prerequisite-patch-id: d2e029f574d4c2e328b8f6f7cdbb415b1bdb8f80
prerequisite-patch-id: 069c680b37c2906bf32f8aec1f7b2256889744e4
prerequisite-patch-id: e5df216772233d916cf88a55de52b06ef0d66222
prerequisite-patch-id: 72df5f2d85ee2234887ad66d38be3dff51439346

Best regards,
-- 
Junhui Liu <junhui.liu@pigmoral.tech>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
