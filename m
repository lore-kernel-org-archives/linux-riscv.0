Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86101C87FD1
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Aug 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nOZzXGJ48t7AlJY/7INgEtoYiKcfyKNiO7G2BD+8b8o=; b=QsbwEn7zDhxr+H
	JaSzP5VLYvqUeYPcZWY8yavhii+XT/YVB5twASWraemKwtIUnT+eJwS06to6Xgd2XQkNM9L1gcA+I
	1XbLSkg53ZG3pmXkxcSuRM83QWcEHjscN3NSroBci629aHg5H26k4jr6nOOLn6I5gL3vsgEuwAbXY
	mZnNOD0xltYHPemEQuGpp/B+dBkox+yz4BrS6nCKU3ipGQHw3vVDrKvDd8UuOCq8rHoz7QKvdZKBI
	7zFn1pOLUwk5bwpfAkdDMRigWtsqJdD+5S3KWiHJ3LinAiqm06O4KzZiz3Rp9UEbg8VLi+zg1TWoq
	7jsejY3saiYYWkJqBW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHkt-0000000Cqhm-1doC;
	Tue, 05 Aug 2025 13:31:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHSo-0000000Cnpx-1Azh
	for linux-riscv@lists.infradead.org;
	Tue, 05 Aug 2025 13:12:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93DC7A56396;
	Tue,  5 Aug 2025 13:12:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9AB8C4CEF4;
	Tue,  5 Aug 2025 13:12:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399541;
	bh=xofx+KMLIBQGqB1MOViKVV4hJQlyQWhXr0UmZzMSNsU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GVVdoJHRW/7edtJGu0+Z1z8K670CQuimUxzTsRxztjkEbrRgbVvU3aPnSoZHtYCAg
	 wHcYY2599odYQxWYZbKPbWr1mAJwHFIURkrCf8AmAViZ64eS97VMT/L2qewJp7kVAb
	 5pj/s8thgX8F3uZpgHvt2QZdtkhzabBv/AXVYdDsSrt1/FhcLCRU8L3kT7KWeGCVBW
	 qOhacEbEc01W3kiUFTNAJIFfG9MG3Jg14Hf1g1du+Bg6dBKui2LWLylOfnPM75CBsb
	 pmvpoNUN44balnXOJZfbq1Xq4pcTrNHQBuQns9VDZZNY2hxaQJqnnckgo4lui0QpMM
	 QNiC99uUVOjBQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Drew Fustini <drew@pdp7.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	fustini@kernel.org,
	guoren@kernel.org,
	wefu@redhat.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-6.12] clk: thead: Mark essential bus clocks as CLK_IGNORE_UNUSED
Date: Tue,  5 Aug 2025 09:09:42 -0400
Message-Id: <20250805130945.471732-67-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250805_061222_456367_110D109B 
X-CRM114-Status: GOOD (  17.52  )
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

From: Michal Wilczynski <m.wilczynski@samsung.com>

[ Upstream commit 0370395d45ca6dd53bb931978f0e91ac8dd6f1c5 ]

Probing peripherals in the AON and PERI domains, such as the PVT thermal
sensor and the PWM controller, can lead to boot hangs or unresponsive
devices on the LPi4A board. The root cause is that their parent bus
clocks ('CLK_CPU2AON_X2H' and the 'CLK_PERISYS_APB' clocks) are
automatically gated by the kernel's power-saving mechanisms when the bus
is perceived as idle.

Alternative solutions were investigated, including modeling the parent
bus in the Device Tree with 'simple-pm-bus' or refactoring the clock
driver's parentage. The 'simple-pm-bus' approach is not viable due to
the lack of defined bus address ranges in the hardware manual and its
creation of improper dependencies on the 'pm_runtime' API for consumer
drivers.

Therefore, applying the'`CLK_IGNORE_UNUSED' flag directly to the
essential bus clocks is the most direct and targeted fix. This prevents
the kernel from auto-gating these buses and ensures peripherals remain
accessible.

This change fixes the boot hang associated with the PVT sensor and
resolves the functional issues with the PWM controller.

Link: https://lore.kernel.org/all/9e8a12db-236d-474c-b110-b3be96edf057@samsung.com/ [1]

Reviewed-by: Drew Fustini <drew@pdp7.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
Signed-off-by: Drew Fustini <drew@pdp7.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Analysis of the Commit

### 1. **Fixes a Real Bug Affecting Users**
The commit explicitly states it fixes:
- **Boot hangs** when probing peripherals in AON and PERI domains
- **Unresponsive devices** on the LPi4A board
- Functional issues with the PWM controller

These are critical user-facing issues that meet the stable tree criteria
under rule #15: "It fixes a problem like an oops, a hang, data
corruption..."

### 2. **Small and Contained Change**
The code change is minimal - only 4 lines modified:
- Line 795: Adds `CLK_IGNORE_UNUSED` flag to `cpu2aon_x2h_clk`
- Line 799: Adds `CLK_IGNORE_UNUSED` flag to `perisys_apb1_hclk`

This is well under the 100-line limit for stable patches.

### 3. **Clear Root Cause and Targeted Fix**
The commit message provides excellent technical justification:
- Parent bus clocks are being auto-gated when perceived as idle
- This causes peripherals (PVT sensor, PWM controller) to become
  inaccessible
- Alternative solutions were investigated but deemed unsuitable
- The `CLK_IGNORE_UNUSED` flag is the most direct and targeted solution

### 4. **Builds on Previous Stable Fix**
Looking at commit 037705e94bf6 ("clk: thead: Add CLK_IGNORE_UNUSED to
fix TH1520 boot"), there's already precedent for applying
`CLK_IGNORE_UNUSED` flags to this driver to fix boot issues. That commit
added the flag to 4 other clocks with a `Fixes:` tag, indicating it was
considered stable-worthy.

### 5. **Hardware-Specific Quirk**
This is addressing a hardware-specific issue with the T-Head TH1520 SoC
where essential bus clocks cannot be safely gated. This falls under the
stable rule for "hardware quirk" fixes.

### 6. **Low Risk of Regression**
The change only affects two specific clocks on a specific SoC (TH1520).
The flag simply prevents the kernel from disabling these clocks - it
doesn't change clock rates, parentage, or any other behavior. This
minimizes regression risk for users of this hardware.

### 7. **Reviewed and Acked**
The commit has been:
- Reviewed-by: Drew Fustini (maintainer familiar with the hardware)
- Acked-by: Stephen Boyd (clock subsystem maintainer)

This indicates proper review from domain experts.

The commit meets all stable kernel criteria: it fixes real bugs (boot
hangs), is minimal in scope (4 lines), addresses a hardware quirk, has
low regression risk, and has been properly reviewed by maintainers.

 drivers/clk/thead/clk-th1520-ap.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index ebfb1d59401d..cf7f6bd428a0 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -792,11 +792,12 @@ static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_ac
 		0x134, BIT(8), 0);
 static CCU_GATE(CLK_X2X_CPUSYS, x2x_cpusys_clk, "x2x-cpusys", axi4_cpusys2_aclk_pd,
 		0x134, BIT(7), 0);
-static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd, 0x138, BIT(8), 0);
+static CCU_GATE(CLK_CPU2AON_X2H, cpu2aon_x2h_clk, "cpu2aon-x2h", axi_aclk_pd,
+		0x138, BIT(8), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_CPU2PERI_X2H, cpu2peri_x2h_clk, "cpu2peri-x2h", axi4_cpusys2_aclk_pd,
 		0x140, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB1_HCLK, perisys_apb1_hclk, "perisys-apb1-hclk", perisys_ahb_hclk_pd,
-		0x150, BIT(9), 0);
+		0x150, BIT(9), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB2_HCLK, perisys_apb2_hclk, "perisys-apb2-hclk", perisys_ahb_hclk_pd,
 		0x150, BIT(10), CLK_IGNORE_UNUSED);
 static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", perisys_ahb_hclk_pd,
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
