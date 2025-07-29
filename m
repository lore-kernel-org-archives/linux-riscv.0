Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28DC2C87FCA
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 18:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=t7jkB90rpS8cqWXzAKrfK/5UX8588Twg2++GHJKATgM=; b=Jty8VO3K5DXu8R
	t2FYNT6wytM3mphFlBgLDwjYdp4KBxBIWqBG7Z+Ik+5J6bq3dRyZlecosDXGrAmdHCryDB8g2usnp
	C5r3XIC2zqQIwno62dLei/TFU+8gZcGX3rnXXvyWfWqQIn5ZGKnYuqAsknGvOoVWTLusaBA9oQPZD
	NZrlaV4denPozgmXMnIL8z0x93yiIafFU+/kPqWgDR20kG9APidtc4rPflKBxUmc3pnAaSBmPGl/l
	CMB5kaq5mvBH90BS60uS6xz6Bn6P99bA2PN2M7IZnRuc8utU9HoLD36pIsCNgUobJsNHlZw7+rpBs
	W7UPq9QNj5gpSHH+fOMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpRS-0000000HUrH-3Nc3;
	Tue, 29 Jul 2025 18:52:50 +0000
Received: from sender4-pp-o94.zoho.com ([136.143.188.94])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugpPk-0000000HUbY-3OMP
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 18:51:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1753815061; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lfVWOoXS+LgP15Qvit768VxAZVOmKP72hmaTCmuBjOD8xVM2EpL1b7CitdQu6WJgJuioDjQWIeyQkFUhBC22KuLNMwAdeUNKKjCOR9ViOrjUYHVQQXYQKetjKXeewxYzr8U+IkLfRwsmlZ8rqvuSDBk5Xn5UrEyIYqPegGQ5Ewg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1753815061; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=A2/WDk0QKHr89RGR1UjuT7L6rDGPE40x7ppQgs+nh84=; 
	b=OSalVrC1OOiOURN/TrAeXjhIRqje2Ux3Iri+0hhFOxh9hQMYTpQJCNC0RFLAfCPE+kjIVIF+ZaJK3xKPnogNmO2oTcTrleEm1vpsY501d3c+EuLaYZjLRPo1U4+dKCsJ4YXORrPd+SdMVkcEvAEJBgZOePM/7S6vb8TJ6rJ54I0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=zohomail.com;
	spf=pass  smtp.mailfrom=kingxukai@zohomail.com;
	dmarc=pass header.from=<kingxukai@zohomail.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1753815061;
	s=zm2022; d=zohomail.com; i=kingxukai@zohomail.com;
	h=From:From:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Type:Content-Transfer-Encoding:To:To:Cc:Cc:Feedback-ID:Reply-To;
	bh=A2/WDk0QKHr89RGR1UjuT7L6rDGPE40x7ppQgs+nh84=;
	b=QTXadgLJpnXMrXP84g/tWIBl2j/v0B5xZ+qnqeMi4GYRSLlpyRTMkBdTY6J4uoU+
	G9u0AIi3DoWMAYJ9V2T8PtEN+3XzT6vBI/2OUX8Yw2UMubJ1itDG8opsTJ3ZoDq9ovK
	GSHoZbcJOOiUP3QQH20+47EJpHQipiBE9pD3Mf1Q=
Received: by mx.zohomail.com with SMTPS id 1753815053448149.70271118807636;
	Tue, 29 Jul 2025 11:50:53 -0700 (PDT)
From: Xukai Wang <kingxukai@zohomail.com>
Subject: [PATCH v7 0/3] riscv: canaan: Add support for K230 clock
Date: Wed, 30 Jul 2025 02:43:50 +0800
Message-Id: <20250730-b4-k230-clk-v7-0-c57d3bb593d3@zohomail.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAGYWiWgC/3XQwW7bMAwG4FcJfK4HiZREKae9x9CDTFKN0SZu7
 TTYVuTdJycrWjeuT6bhj/zJt2bSsdep2W7emlFP/dQPh1rQ3abhXT48aNtLrRsw4CyY0HaufQQ
 0LT89tgl8QSwqgaGp4nnU0v++dPt1f61HfXmtTY/Xj02XJ2152O/743ZjVHOKZGLMAEIo0WoKU
 ZTQEQuT+uQKXVvnI+9qlu1GVDKyIyimPqWIMywixCUIdl5rJ8kk3MwJdv10HMY/l/VOeInwfxN
 abHLCtr50lpK3MSrRz7/Dbtjn/ulHTTsHqMwbC3DLulLI+8yJC68zMHjLMABTsuA8wZLNwU/uU
 1jrltxVbtkkzqFDF/M3Uy3dMp+Tz+h8DMmuTLWfpkJacls5gM3JkkajssLhnddTmbjkMHPq0GT
 g7GGN+w+OX0/mKycXpV4DIiqu74xgbpnRJCYm9i7GlanhY6qzfsnDPLVITMUB1R++8PP5/A+lK
 0m7QgMAAA==
X-Change-ID: 20241206-b4-k230-clk-925f33fed6c2
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xukai Wang <kingxukai@zohomail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.2
Feedback-ID: rr08011227085f753b32b67c07c57af6e1000098fd39d7d09c906738c05fd983005c16f029c8ae2a743d188a:zu08011227a90148eb2256a904900d3abe0000b868a409a0df257a51efeb8cd3f29c07a04b3bb70087ef0183:rf0801122d3ee8070ec6c6a95ef57335d80000be361b2c57506e2b3567069c8c7e423816597f9112e1a6d2e374a7256cb813:ZohoMail
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_115105_232585_B3286219 
X-CRM114-Status: GOOD (  12.54  )
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

This patch series adds clock controller support for the Canaan Kendryte
K230 SoC. The K230 SoC includes an external 24MHz OSC, 4 internal
PLLs and an external pulse input, with the controller managing these
sources and their derived clocks.

The clock tree and hardware-specific definition can be found in the
vendor's DTS [1],
and this series is based on the K230 initial series [2].

Link: https://github.com/ruyisdk/linux-xuantie-kernel/blob/linux-6.6.36/arch/riscv/boot/dts/canaan/k230_clock_provider.dtsi [1]
Link: https://lore.kernel.org/linux-clk/tencent_F76EB8D731C521C18D5D7C4F8229DAA58E08@qq.com/ [2]

Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
Signed-off-by: Xukai Wang <kingxukai@zohomail.com>

---
Changes in v7:
- Rename K230_PLL_STATUS_MASK to K230_PLL_LOCK_STATUS_MASK
- Add clkdev for PLLs to register lookup
- Add macros to generate repeat variables definition
- Refine the definitions of k230 clocks
- Split composite clks into rate, gate, mux, fixed_factor clk
- Replace k230_clk_hw_onecell_get with of_clk_hw_onecell_get for
  clock provider
- Drop k230_sysclk and use clk_mux, clk_gate and clk_fixed_factor
  as the data structures.
- Replace one loop registration with individual registration for
  each type.
- Link to v6: https://lore.kernel.org/r/20250415-b4-k230-clk-v6-0-7fd89f427250@zohomail.com

Changes in v6:
- Remove some redundant comments in struct declaration.
- Replace the Vendor's code source link with a new one.
- Link to v5: https://lore.kernel.org/r/20250320-b4-k230-clk-v5-0-0e9d089c5488@zohomail.com

Changes in v5:
- Fix incorrect base-commit and add prerequisite-patch-id.
- Replace dummy apb_clk with real ones for UARTs.
- Add IDs of UARTs clock and DMA clocks in the binding header.
- Replace k230_clk_cfgs[] array with corresponding named variables.
- Remove some redundant checks in clk_ops.
- Drop the unnecessary parenthesis and type casts.
- Modify return value handling in probe path to avoid redundant print.
- Link to v4: https://lore.kernel.org/r/20250217-b4-k230-clk-v4-0-5a95a3458691@zohomail.com

Changes in v4:
- Remove redundant onecell_get callback and add_provider function
for pll_divs.
- Modify the base-commit in cover letter.
- Link to v3: https://lore.kernel.org/r/20250203-b4-k230-clk-v3-0-362c79124572@zohomail.com

Changes in v3:
- Reorder the defination and declaration in drivers code.
- Reorder the properties in dts node.
- Replace global variable `k230_sysclk` with dynamic memory allocation.
- Rename the macro K230_NUM_CLKS to K230_CLK_NUM.
- Use dev_err_probe for error handling.
- Remove unused includes.
- Link to v2: https://lore.kernel.org/r/20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com

Changes in v2:
- Add items and description.
- Rename k230-clk.h to canaan,k230-clk.h
- Link to v1: https://lore.kernel.org/r/20241229-b4-k230-clk-v1-0-221a917e80ed@zohomail.com

---
Xukai Wang (3):
      dt-bindings: clock: Add bindings for Canaan K230 clock controller
      clk: canaan: Add clock driver for Canaan K230
      riscv: dts: canaan: Add clock definition for K230

 .../devicetree/bindings/clock/canaan,k230-clk.yaml |   61 +
 arch/riscv/boot/dts/canaan/k230-canmv.dts          |   11 +
 arch/riscv/boot/dts/canaan/k230-evb.dts            |   11 +
 arch/riscv/boot/dts/canaan/k230.dtsi               |   26 +-
 drivers/clk/Kconfig                                |    6 +
 drivers/clk/Makefile                               |    1 +
 drivers/clk/clk-k230.c                             | 2456 ++++++++++++++++++++
 include/dt-bindings/clock/canaan,k230-clk.h        |  223 ++
 8 files changed, 2787 insertions(+), 8 deletions(-)
---
base-commit: 0eea987088a22d73d81e968de7347cdc7e594f72
change-id: 20241206-b4-k230-clk-925f33fed6c2
prerequisite-patch-id: deda3c472f0000ffd40cddd7cf6d3b5e2d7da7dc

Best regards,
-- 
Xukai Wang <kingxukai@zohomail.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
