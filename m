Return-Path: <SRS0=aw4H=SL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C623DC10F0E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 06:17:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 96CDA2083E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 06:17:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="dGQczZSy";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ucvpc97M"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 96CDA2083E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BYJJt9ITj/mO7yYxdlAaJBCpnjAxkObPiRT0elzn1fs=; b=dGQczZSyx1Gmej
	e3Oq76hvy+yUD4EH+12DqgN5AJ+neOnUu7Vhk4Grcjc5VqVDCm9I6jfKz7TsCDn8ffXhEBGO7pTQt
	EZZrgnS2X64Yh7KyfUZ7ILsrA9SxQ9Tp1xHQm5gw2/tk5BTWpG3JykBgUMR760LrgxoAC0Rca9byZ
	PK8ONa/y+UMcaem6MMLWB6GexHh+lu2uNKiLz+OkaL7tNPhn6N64X1HHlELFp2IRgsQUUP1J24CAl
	m1tPTKVhxulbasDWxbupoHp19qwiFjdpSPK7t92/Kx4JOZ5vlWvoQRYlu1zJe/pvnpNAssOf841bn
	utuX6lILB3fT2j+kVnLA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDk4n-0000SF-4M; Tue, 09 Apr 2019 06:17:45 +0000
Received: from merlin.infradead.org ([2001:8b0:10b:1231::1])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDk4e-0000JH-Vl; Tue, 09 Apr 2019 06:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=merlin.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NhovreM6UscqTcwScWHFMxAvNPPL7zSoy9Aa2ICEZj8=; b=Ucvpc97MIcD7WqsWgxTzZ4R/cB
 Ge9zeJ6uuydK5w6y4BvLKyKIZLMpVmcGXQ+JWAkZhdy91OqxQ5Z3sA4MJKSqMyexsHpORkcOjSqE1
 6ygbL+pAInNFLJlrDjS+9kXe/KVrqtmmUk7zzKOTPbNWTzud//CrUzk0QXEDypatun6LRSc375c0D
 RCiTPZxqvoigifcG+ndOVWzrBivrBR4hgTniX4lTmdOf22s9pz9BYitE4H8zoqC4OtGiH70tYgp5F
 0nMj3+NhAywDCxNT5i10O+7WZAYrC8MbnNuJUooAhJjjLjz/pkqpTigBMVCmMkXjBvcjNpZpHogUR
 eKYVLNHw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
 by merlin.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDk4b-00051g-Rl; Tue, 09 Apr 2019 06:17:35 +0000
X-Originating-IP: 79.86.19.127
Received: from alex.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay5-d.mail.gandi.net (Postfix) with ESMTPSA id C22771C0004;
 Tue,  9 Apr 2019 06:16:48 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Christoph Hellwig <hch@infradead.org>,
 Mike Kravetz <mike.kravetz@oracle.com>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will.deacon@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
 "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] x86,
 arm64: Move ARCH_WANT_HUGE_PMD_SHARE config in arch/Kconfig
Date: Tue,  9 Apr 2019 02:14:48 -0400
Message-Id: <20190409061449.5083-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190409061449.5083-1-alex@ghiti.fr>
References: <20190409061449.5083-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_021734_021961_DC735E4E 
X-CRM114-Status: GOOD (  10.23  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

ARCH_WANT_HUGE_PMD_SHARE config was declared in both architectures:
move this declaration in arch/Kconfig and make those architectures
select it.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/Kconfig       | 3 +++
 arch/arm64/Kconfig | 2 +-
 arch/x86/Kconfig   | 4 +---
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index 8c858bb133c9..273cefc6b787 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -567,6 +567,9 @@ config HAVE_ARCH_TRANSPARENT_HUGEPAGE_PUD
 config HAVE_ARCH_HUGE_VMAP
 	bool
 
+config ARCH_WANT_HUGE_PMD_SHARE
+	bool
+
 config HAVE_ARCH_SOFT_DIRTY
 	bool
 
diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 870ef86a64ed..8b7870974961 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -68,6 +68,7 @@ config ARM64
 	select ARCH_SUPPORTS_NUMA_BALANCING
 	select ARCH_WANT_COMPAT_IPC_PARSE_VERSION
 	select ARCH_WANT_FRAME_POINTERS
+	select ARCH_WANT_HUGE_PMD_SHARE if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
 	select ARM_AMBA
 	select ARM_ARCH_TIMER
@@ -885,7 +886,6 @@ config SYS_SUPPORTS_HUGETLBFS
 	def_bool y
 
 config ARCH_WANT_HUGE_PMD_SHARE
-	def_bool y if ARM64_4K_PAGES || (ARM64_16K_PAGES && !ARM64_VA_BITS_36)
 
 config ARCH_HAS_CACHE_LINE_SIZE
 	def_bool y
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0f2ab09da060..fd5fc2d288be 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -82,6 +82,7 @@ config X86
 	select ARCH_USE_QUEUED_SPINLOCKS
 	select ARCH_WANT_BATCHED_UNMAP_TLB_FLUSH
 	select ARCH_WANTS_DYNAMIC_TASK_STRUCT
+	select ARCH_WANT_HUGE_PMD_SHARE
 	select ARCH_WANTS_THP_SWAP		if X86_64
 	select BUILDTIME_EXTABLE_SORT
 	select CLKEVT_I8253
@@ -298,9 +299,6 @@ config ARCH_HIBERNATION_POSSIBLE
 config ARCH_SUSPEND_POSSIBLE
 	def_bool y
 
-config ARCH_WANT_HUGE_PMD_SHARE
-	def_bool y
-
 config ARCH_WANT_GENERAL_HUGETLB
 	def_bool y
 
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
