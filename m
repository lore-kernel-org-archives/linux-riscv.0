Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A69CF8855
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Nov 2025 13:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lAjVqisupG1SidwWcGZpsx5SL4QgRPGIXMCi1xb+yJ8=; b=RtrxW6seNLVxeh
	EZzSoNXBuSWXlRO1X9vugk6TZJGcR4nd1B9tUl1Tzsaj5fWpMXQwRLCaEAHgj8zCE7Z+KCC73WruU
	Mtj8jtb88RRLobi6eVZkVPGQmkIOXOomwsch2EoVvNp0Jf2ieIs2aVDtv3R46Q5vX7CMzzvxseLrs
	vrJ+ngznl/I68IVeV61/8cAEmsAOhyIuw2NFeJbzyuT+bFmsS93MZDc/uyU21EQV0ypk9HkN4e2tJ
	JA1GrORzlfGNzRVr625rXuj/HMJDYQAxuj6BEKqGDOtHI8NuJqoonctrA/RqPUEFmJdvEd7+akC+G
	TS4AatC0EFKK2R7ToqtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Ut-00000006hcM-3skP;
	Thu, 20 Nov 2025 13:14:51 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM4Up-00000006haY-30TD
	for linux-riscv@lists.infradead.org;
	Thu, 20 Nov 2025 13:14:50 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id AA1C925F58;
	Thu, 20 Nov 2025 14:14:36 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sM3jaTWwSMZl; Thu, 20 Nov 2025 14:14:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1763644476; bh=XIGihbXCm7fgxLcQi4CgQ1rGtLza+JqTLoULwYaBhnY=;
	h=From:To:Cc:Subject:Date;
	b=RnfS0G5yIGuXX4+gFa6hRSwbg14a2xcWyF2YHY8T6ZReiMc0H2sYDWcSxGW2CewXx
	 a9fOf/IeCoe7KWmzvXVfmEE9LaM6izTXxv+l4/JiIbkOdE9Ud8DbdY5dBONRwv4oIa
	 f0l/eGyp/DrT0+QznUCSxHkNCisXCUAyaMxO9006sCgF0BVl765jUDv6T4tbkp1HeV
	 YJpKK1t3VJ96DI0IZaK2qzVVF+Y/wGXwEM+8U+22AYl2HoeG3ERLoDEz0+fF5AR+vq
	 Nxt2lL5TQJFt57Lqg7yMZhiyOwyPWeQbKq0ATi2KxpDotrDeTug6v26Gw23ZP393AW
	 SV3m5iEIimxPg==
From: Yao Zi <ziyao@disroot.org>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Icenowy Zheng <uwu@icenowy.me>
Cc: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	Yao Zi <ziyao@disroot.org>
Subject: [PATCH 0/7] Implement CPU frequency scaling for TH1520
Date: Thu, 20 Nov 2025 13:14:09 +0000
Message-ID: <20251120131416.26236-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_051448_164870_1443F6E1 
X-CRM114-Status: GOOD (  10.34  )
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

On TH1520 SoC, c910_clk feeds the CPU cluster. It could be glitchlessly
reparented to one of the two PLLs: either to cpu_pll0 indirectly through
c910_i0_clk, or to cpu_pll1 directly. This series fixes a bug in PLL
enabling code, supports rate change for PLL, and finally implements
frequency scaling support for c910_clk.

However, to achieve reliable frequency scaling, CPU voltage must be
adjusted together with frequency, and AON-firmware-based PMIC support
for TH1520 SoC is still missing in mainline. Thus PATCH 7 that fills OPP
table for TH1520 CPU and enables CPUfreq is only for testing purpose,
not intended for upstream (yet).

Testing is done on Lichee Pi 4A board, only operating points safe
to be used with the the default PMIC configuration are enabled in
devicetree. I've confirmed there's a performance gain when running
coremark and some building work compared to the case without cpufreq.

This series is based on next-20251120, thanks for your time and review.

Yao Zi (7):
  dt-bindings: clock: thead,th1520-clk-ap: Add ID for C910 bus clock
  clk: thead: th1520-ap: Poll for PLL lock and wait for stability
  clk: thead: th1520-ap: Add C910 bus clock
  clk: thead: th1520-ap: Support setting PLL rates
  clk: thead: th1520-ap: Add macro to define multiplexers with flags
  clk: thead: th1520-ap: Support CPU frequency scaling
  [Not For Upstream] riscv: dts: thead: Add CPU clock and OPP table for
    TH1520

 arch/riscv/boot/dts/thead/th1520.dtsi         |  35 ++
 drivers/clk/thead/clk-th1520-ap.c             | 350 +++++++++++++++++-
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |   1 +
 3 files changed, 379 insertions(+), 7 deletions(-)

-- 
2.51.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
