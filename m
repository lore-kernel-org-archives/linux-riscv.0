Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61A8DEB64DD
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 14:11:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IdvyFrCujZiet+FjSZX4qecq6MRAEeSLJN+1UyQyqSU=; b=EIbgBjmqvj70LM
	zM7zkAUOXgoR4gfXU+BdxRXoKHcTNlU29MXaao6WnbJsw6zAIzyGFH64Y/XUaFBlHGqs0X3H4r3vX
	NzRMeEISoEfgSv42juOljLJEr8vYjKFkvep0ZDqj8GTIS8Mbfkn0cuKm2JKIOhut4/NoXcM7l9ENk
	s/1k6hjrGtsA+dF1STk6EwEcnehnyT4kSZxYXmgC7v6dF445eB0i1xcDoqnRMm2EPds3q50q1fSxH
	0mocVT/BgGwsHORalob/9zDjlOx5V3sTYAgC+oQK0RqcC3WsqJtIU/yvljRJPlA3n2v9d8oGOQANM
	p9nqkpmHt+R8euo0LiGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQSF-00879W-2a;
	Sun, 25 Jun 2023 14:11:03 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDQS8-00877U-2a
	for linux-riscv@lists.infradead.org;
	Sun, 25 Jun 2023 14:11:02 +0000
X-QQ-mid: bizesmtp73t1687702208t869bq9s
Received: from localhost.localdomain ( [112.2.230.41])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Sun, 25 Jun 2023 22:10:04 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: TVZM0Uoyj00c0bZeOtQsMG0DaWKF8k5IP29sSaNKu2IqHl0SZUO1pXN9aQB5m
	So+nB8VGz5FuKu2vXt+QJgjvfdapKB5QFP/nycPWDjuq5n+govmjlnnfC3eg5zAOuPs3RLJ
	tidw5jfJcMk/f3odNds/Y35dsaNOgrDwb/1JqzDV+lozOChS18Qcsa48sKJp4BW5GTiQIy+
	uENrBlNboO9pUCSceB6gdweAS2JHCzmhrhNjhlZNzbmvK9cEFaJe9JopuWLI/HG/hHN1hbp
	YC5V/dL5eDx0XIYB3rpFxJsYuPt+2YzAPJHuZUvik2ApM8SgDnrqQS532EawfgLqH9EsUe7
	JIjbNrfBR84Y/3K7AbHzIySaufKumCejpKOrEBPytWTAKTadhs=
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 11597191393074232432
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	robh+dt@kernel.org,
	frowand.list@gmail.com,
	ajones@ventanamicro.com,
	alexghiti@rivosinc.com,
	mpe@ellerman.id.au,
	arnd@arndb.de,
	songshuaishuai@tinylab.org,
	rppt@kernel.org,
	samuel@sholland.org,
	panqinglin2020@iscas.ac.cn,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	xianting.tian@linux.alibaba.com,
	anshuman.khandual@arm.com,
	heiko@sntech.de
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH V1 1/3] Revert "RISC-V: mark hibernation as nonportable"
Date: Sun, 25 Jun 2023 22:09:29 +0800
Message-Id: <20230625140931.1266216-2-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
References: <20230625140931.1266216-1-songshuaishuai@tinylab.org>
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrgz:qybglogicsvrgz5a-3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_071057_151739_AE2669F3 
X-CRM114-Status: UNSURE (   8.08  )
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

This reverts commit ed309ce522185583b163bd0c74f0d9f299fe1826.

With the commit 3335068f8721 ("riscv: Use PUD/P4D/PGD pages for the
linear mapping") reverted, the MIN_MEMBLOCK_ADDR points the kernel
load address which was placed at a PMD boundary. And firmware always
correctly mark resident memory, or memory protected with PMP as
per the devicetree specification and/or the UEFI specification.

So those regions will not be mapped in the linear mapping and they
can be safely saved/restored by hibernation.

Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
 arch/riscv/Kconfig | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5966ad97c30c..17b5fc7f54d4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -800,11 +800,8 @@ menu "Power management options"
 
 source "kernel/power/Kconfig"
 
-# Hibernation is only possible on systems where the SBI implementation has
-# marked its reserved memory as not accessible from, or does not run
-# from the same memory as, Linux
 config ARCH_HIBERNATION_POSSIBLE
-	def_bool NONPORTABLE
+	def_bool y
 
 config ARCH_HIBERNATION_HEADER
 	def_bool HIBERNATION
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
