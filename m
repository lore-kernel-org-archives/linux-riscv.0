Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22271CD6E55
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jun 2026 23:06:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=5WxiyWAtGsNVF3hnu1naBg5vkNDfhR8T4mSBMarDr74=; b=x/yRW/BdMoExJG
	BdDa3iBwQA2Tza7jOsizPYgOnK0oHNIN98PtLrMJd063Ad7oG2thbG1xmdPjcG8XykY/CpDyC7GZL
	UqfxRt9wpQz1MGRA0ukmqmyTVLyOLx0U/upyTzSM8JvMA8VQ3fOYCet2cc/7U/m1hm8tJgd22yJKS
	ps4tY/KkxdFr0TebVkIPPYbDcpGHjl4PpI+p9rTzWQOQurg5KNUllrt7aJ6A7GzWeokm7WPQmuBWx
	bTkT/8hLsxIl/SqmL1Fx8pR028zh1/fwHuiPpqZKvIApQ0iE3AnS0QJJCyiiMBO6D6tyManH81lg0
	mAS32CbE1+iVvcHSKSjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBiU-0000000C2Di-2MNI;
	Mon, 01 Jun 2026 23:06:42 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUBiT-0000000C2DX-1IXI
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jun 2026 23:06:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6C1256001A;
	Mon,  1 Jun 2026 23:06:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C76A81F00893;
	Mon,  1 Jun 2026 23:06:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780355200;
	bh=i1Iq/t7YJ3lzwEzZSDZNa3Rv0CFkmzQDeIArbCfLbks=;
	h=Date:From:To:Cc:Subject;
	b=ZaggX0ENXZ/NpWeqheKbjjq2533fbiCDgwuO/RZLYpUcvYdkGvAtm8kHPLdNVNDHt
	 M8bhgZ9I9G2az1quJHDfgku1K7qxAFZSWodmteMB1BoAJfX1VQobDaLK/W8/HnNiNN
	 ioR4XXRs7TZoCUa75ASKMWYGKExcq7ruPqVPa1DwFWmMdHLXYWdw4BcKh9SL9wALqo
	 BE1ImbY2tn8ljHsYP4r3+surVR2hfTnlnupB41iE1Kx9/JWMsjWGPDUdeixyxW0LBZ
	 psvHmcS7VZblM9IKvPSp7q3eUnq8rvOUKeQUKppvrUHuUjMA+60+lOKBK7RrgDp5tT
	 CBi4c5I308Mhg==
Date: Mon, 1 Jun 2026 16:06:38 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>, Joel Stanley <joel@jms.id.au>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Nicholas Piggin <npiggin@oss.tenstorrent.com>,
	Michael Neuling <mikey@neuling.org>,
	Michael Ellerman <mpe@kernel.org>, Andy Gross <agross@kernel.org>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Paul Walmsley <pjw@kernel.org>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V Tenstorrent devicetree changes for v7.2
Message-ID: <ah4Qfro/wUyhByF8@x1>
MIME-Version: 1.0
Content-Disposition: inline
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

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tenstorrent/linux.git tags/tenstorrent-dt-for-v7.2

for you to fetch changes up to 33583baeb1ba7d328e6a9775d889036900b74cdb:

  dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU (2026-05-23 17:14:35 -0700)

----------------------------------------------------------------
Tenstorrent device tree for v7.2

Add a riscv,pmu node to the Tenstorrent Blackhole SoC device tree. This
enables OpenSBI to expose the SBI PMU extension, allowing Linux perf to
use the 4 programmable counters (mhpmcounter3-6) across 3 event classes:
instruction commit, microarchitectural, and memory system events.

Extend the RISC-V IOMMU device tree bindings to document the Tenstorrent
IOMMU used in the Tenstorrent Atlantis SoC. A second register range is
added which contains M-mode only registers like PMAs and PMPs. The
binding will be used by OpenSBI and potentially other M-mode software.

----------------------------------------------------------------
Michael Neuling (1):
      riscv: dts: tenstorrent: Add PMU node to blackhole for Linux perf support

Nicholas Piggin (1):
      dt-bindings: iommu: riscv: Add bindings for Tenstorrent RISC-V IOMMU

 .../devicetree/bindings/iommu/riscv,iommu.yaml     | 59 +++++++++++++++++++---
 arch/riscv/boot/dts/tenstorrent/blackhole.dtsi     | 48 ++++++++++++++++++
 2 files changed, 99 insertions(+), 8 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
