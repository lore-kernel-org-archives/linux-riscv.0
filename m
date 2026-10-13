Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5604DCC6B03
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Oct 2026 08:39:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WhiuZw2ATbaChr1nOF8VspUvusJOxnl/90a49ZW5em4=; b=zIS9M8Do6B2vAV
	q40wB3gbTBwSrSIG7otZKI5KjpypVWYDZD8F7EZ1dorGC95jx0eIS18eOXZ9BNeyDgDIZUO3a2u3W
	BrW4FZ83acWNFf7ul9rUGbLxZDYC0BIx+k2HPpx/BxIETSp35iWTWEotV3+O7sr41mItrNA0vaB3j
	2qCA7XkRKAzxSXwBtiTQTqkOs/eqQwmvgVmhZd2+h2nAr+EHoOD7vpAz7mi/RhMx621c9YAebagWr
	m68P3IdGiNjtoqDvCpjNUiD6o3XPYjGk8EQjwS5K0d49J95MttPs1HBWxGWlTkmIRjeNJc0X+ug87
	RLlMmL8vvUV7XFFlViGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY2G-0000000CLYi-0gFl;
	Tue, 13 Oct 2026 08:39:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGY2D-0000000CLXq-3l8v;
	Tue, 13 Oct 2026 08:38:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD645600D1;
	Tue, 13 Oct 2026 08:38:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD5E51F00898;
	Tue, 13 Oct 2026 08:38:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Conor Dooley <conor.dooley@microchip.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] perf/renesas: Remove remaining RISCV_ALTERNATIVE references
Date: Tue, 13 Oct 2026 10:38:39 +0200
Message-ID: <fe117dd44728fe7c96f3e4b3ec88c6ca83c5da9b.1791880574.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

As riscv always selects RISCV_ALTERNATIVE, the option was removed.
However, a few references were left, making it impossible to enable
RZ/Five support (ARCH_R9A07G043).

Fix this by removing all remaining references.

Fixes: b924210f542e13c7 ("riscv: remove RISCV_ALTERNATIVE Kconfig option")
Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
To be applied to riscv/for-next, or folded into the original commit.
---
 drivers/perf/Kconfig        | 2 +-
 drivers/soc/renesas/Kconfig | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/perf/Kconfig b/drivers/perf/Kconfig
index 245e7bb763b9947a..8cef4bdef76aecab 100644
--- a/drivers/perf/Kconfig
+++ b/drivers/perf/Kconfig
@@ -117,7 +117,7 @@ config STARFIVE_STARLINK_PMU
 
 config ANDES_CUSTOM_PMU
 	bool "Andes custom PMU support"
-	depends on ARCH_RENESAS && RISCV_ALTERNATIVE && RISCV_PMU_SBI
+	depends on ARCH_RENESAS && RISCV_PMU_SBI
 	default y
 	help
 	  The Andes cores implement the PMU overflow extension very
diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index a63df28df3b5e7c7..0b6876ef6dca228b 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -461,7 +461,6 @@ config ARCH_R9A07G043
 	bool "RISC-V Platform support for R9A07G043F (RZ/Five)"
 	depends on NONPORTABLE
 	depends on !DMA_DIRECT_REMAP
-	depends on RISCV_ALTERNATIVE
 	depends on !RISCV_ISA_ZICBOM
 	depends on RISCV_SBI
 	select ARCH_RZG2L
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
