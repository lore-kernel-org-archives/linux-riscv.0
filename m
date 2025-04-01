Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928C1C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 17:25:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UHdznsVvq43p9kqPmIagtckxsLSeVHgarzx8/CqJg1E=; b=Eb0GvRPiI0QENk
	4mgchI4rSF060MfIsWCw1lBG+UlTwhcxyCcvpcFyD2lKcSPygF1vA2WowWaPAdrdrIMhuZZPMGJhf
	p2vdXgy9OCWoaFdGplV1zqk6xj26Q7hMIJY+vLgXznQXs460VPwtYW1iojYEgPTuD1+NKl50wEgE5
	AidcfBFlTTmeis5oLdGldKcBmsE452WHrYjDwECt7pRhu1HM6PpYqYSAFvCY3v0JDyUO/kihtULsa
	HD0jnRT+DcqUbWyvW00JOBnyBv7t06E8iX1zt77TD9WSptnh2sAvkSgrJBeM+QvWP1bXryq7PVrwa
	8/nGwRrKsxYtmM+GSolA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfMY-000000040RR-0gm4;
	Tue, 01 Apr 2025 17:25:22 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfMW-000000040PM-0Znu
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 17:25:21 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 8FC6EEC59FC;
	Tue, 01 Apr 2025 10:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528319; bh=34/DWVz3xny62FFtko1B9kiCB28YM6UFyyWMYVeeQig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=0n3w3k1xYwdVRZSlz/Co5xIF215jsdpvvl4PjqqpwaAmb4R1oNi2GtuosqR7h0I15
	 vLOqdD8yasEubHEYZvBVjAK4Re6igpKPSfc2VVw8ie3uLSY3SJYeFdvqwvesWMUilH
	 Vh5THxvLLBhABaqWImTOqLc77Nw17t0D4wxGiqeBmJz+2wLZuezHr0M3ZTP6/Guo29
	 wRrmreuaMlHaHWalBUJqgkVwxLNHPs8zQjDwca7Eliqb1yLDnjYCPlyBrpR23MvY0I
	 FWJRGl22II2zVxYRGetW1P0l7Qn4tiAmJ91JnDOY7RPv6ghKUonq0A+WwfJra9u9xK
	 7ijDNhYFEODjg==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 78L11jvBmuvM; Tue,  1 Apr 2025 10:25:18 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 95CDDEC59F9;
	Tue, 01 Apr 2025 10:25:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528318; bh=34/DWVz3xny62FFtko1B9kiCB28YM6UFyyWMYVeeQig=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=yKw1lY92V5SLbhmR0TXij6E8ysSSTLOQMUTEn6BbEYML/l+e1vIWu8EaogEntPrAI
	 fzW4XFz2Egr4WfkLcp5ZdXiNCiSupFburyQmdmS/jB0xAgL60sIBF+qzea857cVJuC
	 J010vRFd0AUJkaYKGptzjD9b123zjWJ16FAyJG4M2F7e8ghSH5nsUmTCdDRmSARsr2
	 xR9qREPzi01bX4enCr4nzxr4Nmc777hKTGpLoLqDGb7EgMVrkx0LA8qnegnXPITD35
	 M+hpc1zMeI/Df/yT9sLphTcngxRHA0dXs/PwbnifbJIuvsUOGCKbvYd12ms1BUcMdx
	 rEi2WmFSqVlMA==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v6 6/6] riscv: defconfig: enable clock controller unit support for SpacemiT K1
Date: Tue,  1 Apr 2025 17:24:34 +0000
Message-ID: <20250401172434.6774-7-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401172434.6774-1-heylenay@4d2.org>
References: <20250401172434.6774-1-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_102520_210042_E0E3DEF1 
X-CRM114-Status: UNSURE (   8.30  )
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

Clock controller unit, or CCU, generates various clocks frequency for
peripherals integrated in SpacemiT K1 SoC and is essential for normal
operation. Let's enable it in defconfig.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0f7dcbe3c45b..011788d16d93 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -252,6 +252,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
+CONFIG_SPACEMIT_CCU=y
+CONFIG_SPACEMIT_K1_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
