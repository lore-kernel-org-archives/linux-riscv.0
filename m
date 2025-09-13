Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 280F8CAC597
	for <linux-riscv@archiver.kernel.org>; Sat, 13 Sep 2025 21:31:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NdS72G7pi9daXUCAaoyEjvUFQTLVjiZZWCvADgJ1joE=; b=1QTfwfgWPLVxVV
	DC7nRoGID3fPsFywLls6iq6zh9UxltXhIeGAVI7sIVrbzCIwW0fooX4TVWm4iVGyHfYZE22m/r/A3
	tw7IbrWdIIddMPh2BhxyHf78uVBfRc2XjthROKP5mHFpLb8ofs4mloZMkqq+a1ubzknvqXSWueZLG
	Cx6JmcDb1tbGw+6u6UOI6y42irOFqQrkYR9XzZm9sDfw9oia+tsZdrZ0YkaTbCMTX/pkNJs99Nds2
	R043NB4xtlcgyXRgNRhFyi/V4teLrexnkbMlyhAb70+yy5Yw2tVQEhovvQyiouULpYRZMgEWvMpO9
	6ktuKX7aU8wSydkze6Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXpu-0000000GM9e-2VmR;
	Sat, 13 Sep 2025 21:31:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxXps-0000000GM7q-1K6n
	for linux-riscv@lists.infradead.org;
	Sat, 13 Sep 2025 21:31:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03C39451AC;
	Sat, 13 Sep 2025 21:31:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51889C4CEEB;
	Sat, 13 Sep 2025 21:31:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757799067;
	bh=C8WWgCrN+wbiLl32X59QvMva79V13DrPaEv4X3Biqs0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Zwei8rxL/qA5np37Xrd9v/dFZLa5DZRG/NaH3fYR6FxvgcQRWku2IjSK4v4aj9All
	 x1xwtcI0egOfPvHbLrDD/TLnEmYkaEHibp4mKoXQgIMe2/+Cf9/RalVylukELm0R8+
	 fBJ5C/b1fagOUtdHUpluZ/T+Uh+sNonpxDtu0ELhjaPaVnZ0GwsGU6Y1a+b374YCYT
	 U0rmxe58yO/NO3qeod7oYSj9NEl7Nner2SBL8Xoe54xDL3H4IAvlGXqn3U29iPkcY+
	 M2owLIuVadvDQgQJyIzxbn/v54sZdWxgJ6tczuokvt/3xk7SZIvHAAOslRzCefOGxE
	 oj7W2LRt+pIoA==
From: Drew Fustini <fustini@kernel.org>
Date: Sat, 13 Sep 2025 14:31:06 -0700
Subject: [PATCH 7/7] riscv: Kconfig.socs: Add ARCH_TENSTORRENT for
 Tenstorrent SoCs
MIME-Version: 1.0
Message-Id: <20250913-tt-bh-dts-v1-7-ddb0d6860fe5@tenstorrent.com>
References: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
In-Reply-To: <20250913-tt-bh-dts-v1-0-ddb0d6860fe5@tenstorrent.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Anup Patel <anup@brainfault.org>, 
 Arnd Bergmann <arnd@arndb.de>, Joel Stanley <jms@tenstorrent.com>, 
 Joel Stanley <joel@jms.id.au>, Michael Neuling <mikey@neuling.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Michael Ellerman <mpe@kernel.org>, 
 Andy Gross <agross@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250913_143108_453309_EEBAAF0F 
X-CRM114-Status: UNSURE (   7.92  )
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

From: Drew Fustini <dfustini@tenstorrent.com>

Add Kconfig option ARCH_TENSTORRENT to enable support for SoCs like the
Blackhole A0.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/Kconfig.socs | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 61ceae0aa27a6fa3a91da6a46becfd96da99fd09..ff733a998612d429e7b1e00276eb86290d8331a3 100644
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
+	  The Blackhole A0 SoC contains four RISC-V CPU tiles each
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
