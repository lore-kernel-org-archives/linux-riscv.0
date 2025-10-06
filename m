Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 870ABCCD186
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 21:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t+ZLG8KdYiN0x/5nLOfLI9kMTu7qSLHScqcGu/eAm9Y=; b=IX3Y6hNIBIEKC9
	o+LEPObVpXhJ44lrtY8mBK0mKCwX4EGIGOJcQ5Wr4c9eF97O+PFv2eCwL9K1O59PLtru15+gcYYQ8
	8YCvqfihOUaTaODjY1a9HRuCFqI4QP/IE7vRvhZAlE3pEUUC2edelV7Oc61yDVblbcC3olM7hB5v7
	1y8SA7Mp0HXK4sus/+5GgpGhh/t6gVYZwriX8anY78LEzExr93csDtovLA9SU1o0STTAPG38AWGUw
	BwGiPFFHuCH9dDIvsIVX89APVTRo08o5qg6+mNA1U0xphRX38L9gnNOLCQI7ESt862Jicoy7BA4zI
	m+/51oDRSuEU8JxpEYOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5sed-00000000pk1-0zff;
	Mon, 06 Oct 2025 21:21:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5seb-00000000phW-0mdX
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 21:21:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEAF545F81;
	Mon,  6 Oct 2025 21:21:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 165EEC113D0;
	Mon,  6 Oct 2025 21:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759785716;
	bh=MV4imc3nxAbsHj6lhsk14sOp0mfBOvMYNKi6rHeS8I8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=snJ4lU9FrM9qLBzb9P+zAFZdkpSHQXUBCRGEQw23hW1ApW69bWqVZDvIBaixfAJax
	 hboaV1v22a0FROvB4UT8g/g5LtV0zW3KHboXFCwoRsgiKp3Yp7EmDutsJ6vEG1SH74
	 oj7zNb1jwLJ3a3StC+w9bq9lFnyr9bOskg32L9FU3DTP/3xuscSgFOLp13LJlz6vDh
	 OLw8ZeBHBY8/lC1n+Ou1frEbwnYatTEFGk2BeKn1I0E1po90oaajNdxQJXh/hIO1Jg
	 Ezsw/9mywresDYyPQSoBkJWgK3xVKp/vy+MghCJFCUFnnJiknMP/6ORIdVq39frEOe
	 2yiSoAQMMwCKg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 06 Oct 2025 14:21:47 -0700
Subject: [PATCH v2 7/8] riscv: Kconfig.socs: Add ARCH_TENSTORRENT for
 Tenstorrent SoCs
MIME-Version: 1.0
Message-Id: <20251006-tt-bh-dts-v2-7-ed90dc4b3e22@oss.tenstorrent.com>
References: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
In-Reply-To: <20251006-tt-bh-dts-v2-0-ed90dc4b3e22@oss.tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@oss.tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>, 
 Anirudh Srinivasan <asrinivasan@tenstorrent.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, 
 Drew Fustini <dfustini@oss.tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_142157_252730_06E4D869 
X-CRM114-Status: UNSURE (   8.62  )
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

From: Drew Fustini <dfustini@oss.tenstorrent.com>

Add Kconfig option ARCH_TENSTORRENT to enable support for SoCs like the
Blackhole.

Signed-off-by: Drew Fustini <dfustini@oss.tenstorrent.com>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 61ceae0aa27a6fa3a91da6a46becfd96da99fd09..61c83a9c9876e59a11662da778a4bba0709d3e95 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -57,6 +57,14 @@ config ARCH_SUNXI
 	  This enables support for Allwinner sun20i platform hardware,
 	  including boards based on the D1 and D1s SoCs.
 
+config ARCH_TENSTORRENT
+	bool "Tenstorrent SoCs"
+	help
+	  This enables support for Tenstorrent SoC platforms.
+	  Current support is for Blackhole P100 and P150 PCIe cards.
+	  The Blackhole SoC contains four RISC-V CPU tiles each
+	  consisting of 4x SiFive X280 cores.
+
 config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
 	depends on MMU && !XIP_KERNEL

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
