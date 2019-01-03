Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68CF1C43444
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 01:12:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2449420833
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 01:12:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="g+PcZdW5";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=nifty.com header.i=@nifty.com header.b="lEVGqaKS"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2449420833
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=socionext.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=0wUtal+OSid1HbWtLY27We9qWuj8qwryaS5UgWr8VdQ=; b=g+PcZdW5KoV1iFzNOwq+bO9GpZ
	rrfUVsIc/IdFPkwcEQEYqen67vrOqzvaAvjephOIQJqNZpsf6kMny4nqAEV9ou5RfCiSHK8nrMXty
	Ij/UfR14T4C7EdSNTwNiCiF3leA2UXEdUtBjXq/Nw2u59AbuF6HzAIeNh92Whh200LLrk7r8mWbv+
	gv72DaRDAdsJAmBAgHXetM/oQA4WuXrOe1s4+zCqeqgii3k+TH6QKtJ+IZiSWc4l+1I3eWEHM6N4V
	MFXe9mEFS+Rl7z5L2rBET0PL3kyLPFNXfOMUkmOZ4bYi5et/Ff4f3Qo4uaOTY8KF7AcR548kWfZ9P
	8aR6w0bA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gerZ0-00037b-GY; Thu, 03 Jan 2019 01:12:46 +0000
Received: from conuserg-10.nifty.com ([210.131.2.77])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gerXc-0001QR-TC; Thu, 03 Jan 2019 01:11:24 +0000
Received: from grover.tkatk1.zaq.ne.jp (zaqdadce369.zaq.ne.jp
 [218.220.227.105]) (authenticated)
 by conuserg-10.nifty.com with ESMTP id x031Apkh032182;
 Thu, 3 Jan 2019 10:10:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conuserg-10.nifty.com x031Apkh032182
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
 s=dec2015msa; t=1546477855;
 bh=ugDTKnJw8ZDcSvq28E5ecAYGZtkdrfBPxxqg/WUHiz0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lEVGqaKSWrGNhAw3tqa7jYuVdnIUNmr0TRjejcNL9nZbPAwreHvLoDkPyewz6EKuQ
 Kf31elsRH4cWZVtBwb+qw5LFMVydIM2xKx8YBEnBYXBZmJEIZu/ODJ3fHQsWEl8suX
 e0hxqoA3b02S9ijk8Kf1ZBOWQ4UpK4+t1hcU/T3h81nofDIF9OPXnfntdYq2qwv70O
 G0z0cg3l7Eeq5LfylHI2c4mOWmHf015MVHvjOzQ1QTTToUM29nhveBU9er+DyVMSuU
 8B/e4+66JZIPTiMF9yMH7fXiLCd6zsOcOLaKte4G6S0gih3KWJHFpDwugkUNtUXNd5
 iEa2I+J15VAvg==
X-Nifty-SrcIP: [218.220.227.105]
From: Masahiro Yamada <yamada.masahiro@socionext.com>
To: linux-kbuild@vger.kernel.org
Subject: [PATCH 5/5] kbuild: warn redundant generic-y
Date: Thu,  3 Jan 2019 10:10:40 +0900
Message-Id: <1546477840-14278-5-git-send-email-yamada.masahiro@socionext.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1546477840-14278-1-git-send-email-yamada.masahiro@socionext.com>
References: <1546477840-14278-1-git-send-email-yamada.masahiro@socionext.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_171121_331765_8C120D46 
X-CRM114-Status: UNSURE (   7.65  )
X-CRM114-Notice: Please train this message.
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
Cc: linux-arch@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The generic-y is redundant under the following condition:

 - arch has its own implementation

 - the same header is added to generated-y

 - the same header is added to mandatory-y

If a redundant generic-y is found, the warning like follows is displayed:

  scripts/Makefile.asm-generic:20: redundant generic-y found in arch/arm/include/asm/Kbuild: timex.h

I fixed up arch Kbuild files found by this.

Suggested-by: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 arch/arc/include/asm/Kbuild      | 4 ----
 arch/arm/include/asm/Kbuild      | 1 -
 arch/h8300/include/asm/Kbuild    | 1 -
 arch/openrisc/include/asm/Kbuild | 2 --
 arch/parisc/include/asm/Kbuild   | 2 --
 arch/powerpc/include/asm/Kbuild  | 1 -
 arch/s390/include/asm/Kbuild     | 1 -
 arch/um/include/asm/Kbuild       | 2 --
 arch/xtensa/include/asm/Kbuild   | 1 -
 scripts/Makefile.asm-generic     | 6 ++++++
 10 files changed, 6 insertions(+), 15 deletions(-)

diff --git a/arch/arc/include/asm/Kbuild b/arch/arc/include/asm/Kbuild
index feed50c..caa2702 100644
--- a/arch/arc/include/asm/Kbuild
+++ b/arch/arc/include/asm/Kbuild
@@ -3,23 +3,19 @@ generic-y += bugs.h
 generic-y += compat.h
 generic-y += device.h
 generic-y += div64.h
-generic-y += dma-mapping.h
 generic-y += emergency-restart.h
 generic-y += extable.h
-generic-y += fb.h
 generic-y += ftrace.h
 generic-y += hardirq.h
 generic-y += hw_irq.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
-generic-y += kmap_types.h
 generic-y += local.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
 generic-y += mm-arch-hooks.h
 generic-y += msi.h
 generic-y += parport.h
-generic-y += pci.h
 generic-y += percpu.h
 generic-y += preempt.h
 generic-y += topology.h
diff --git a/arch/arm/include/asm/Kbuild b/arch/arm/include/asm/Kbuild
index 1d66db9..a8a4eb7 100644
--- a/arch/arm/include/asm/Kbuild
+++ b/arch/arm/include/asm/Kbuild
@@ -18,7 +18,6 @@ generic-y += segment.h
 generic-y += serial.h
 generic-y += simd.h
 generic-y += sizes.h
-generic-y += timex.h
 generic-y += trace_clock.h
 
 generated-y += mach-types.h
diff --git a/arch/h8300/include/asm/Kbuild b/arch/h8300/include/asm/Kbuild
index a5d0b29..ed6f2bf 100644
--- a/arch/h8300/include/asm/Kbuild
+++ b/arch/h8300/include/asm/Kbuild
@@ -17,7 +17,6 @@ generic-y += fb.h
 generic-y += ftrace.h
 generic-y += futex.h
 generic-y += hardirq.h
-generic-y += hash.h
 generic-y += hw_irq.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
diff --git a/arch/openrisc/include/asm/Kbuild b/arch/openrisc/include/asm/Kbuild
index eb87cd8..5be3f32 100644
--- a/arch/openrisc/include/asm/Kbuild
+++ b/arch/openrisc/include/asm/Kbuild
@@ -15,7 +15,6 @@ generic-y += fb.h
 generic-y += ftrace.h
 generic-y += hardirq.h
 generic-y += hw_irq.h
-generic-y += irq.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
 generic-y += kdebug.h
@@ -34,7 +33,6 @@ generic-y += qrwlock_types.h
 generic-y += qrwlock.h
 generic-y += sections.h
 generic-y += segment.h
-generic-y += string.h
 generic-y += switch_to.h
 generic-y += topology.h
 generic-y += trace_clock.h
diff --git a/arch/parisc/include/asm/Kbuild b/arch/parisc/include/asm/Kbuild
index 0b1e354..6f49e77 100644
--- a/arch/parisc/include/asm/Kbuild
+++ b/arch/parisc/include/asm/Kbuild
@@ -1,7 +1,6 @@
 generated-y += syscall_table_32.h
 generated-y += syscall_table_64.h
 generated-y += syscall_table_c32.h
-generic-y += barrier.h
 generic-y += current.h
 generic-y += device.h
 generic-y += div64.h
@@ -20,7 +19,6 @@ generic-y += percpu.h
 generic-y += preempt.h
 generic-y += seccomp.h
 generic-y += segment.h
-generic-y += topology.h
 generic-y += trace_clock.h
 generic-y += user.h
 generic-y += vga.h
diff --git a/arch/powerpc/include/asm/Kbuild b/arch/powerpc/include/asm/Kbuild
index 77ff7fb..a0c132b 100644
--- a/arch/powerpc/include/asm/Kbuild
+++ b/arch/powerpc/include/asm/Kbuild
@@ -5,7 +5,6 @@ generated-y += syscall_table_spu.h
 generic-y += div64.h
 generic-y += export.h
 generic-y += irq_regs.h
-generic-y += irq_work.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
 generic-y += preempt.h
diff --git a/arch/s390/include/asm/Kbuild b/arch/s390/include/asm/Kbuild
index e323977..12d77cb 100644
--- a/arch/s390/include/asm/Kbuild
+++ b/arch/s390/include/asm/Kbuild
@@ -20,7 +20,6 @@ generic-y += local.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
 generic-y += mm-arch-hooks.h
-generic-y += preempt.h
 generic-y += rwsem.h
 generic-y += trace_clock.h
 generic-y += unaligned.h
diff --git a/arch/um/include/asm/Kbuild b/arch/um/include/asm/Kbuild
index b10dde6..00bcbe2 100644
--- a/arch/um/include/asm/Kbuild
+++ b/arch/um/include/asm/Kbuild
@@ -10,9 +10,7 @@ generic-y += exec.h
 generic-y += extable.h
 generic-y += ftrace.h
 generic-y += futex.h
-generic-y += hardirq.h
 generic-y += hw_irq.h
-generic-y += io.h
 generic-y += irq_regs.h
 generic-y += irq_work.h
 generic-y += kdebug.h
diff --git a/arch/xtensa/include/asm/Kbuild b/arch/xtensa/include/asm/Kbuild
index e255683..322b2fd 100644
--- a/arch/xtensa/include/asm/Kbuild
+++ b/arch/xtensa/include/asm/Kbuild
@@ -15,7 +15,6 @@ generic-y += irq_work.h
 generic-y += kdebug.h
 generic-y += kmap_types.h
 generic-y += kprobes.h
-generic-y += linkage.h
 generic-y += local.h
 generic-y += local64.h
 generic-y += mcs_spinlock.h
diff --git a/scripts/Makefile.asm-generic b/scripts/Makefile.asm-generic
index a62d282..c7d2b7a 100644
--- a/scripts/Makefile.asm-generic
+++ b/scripts/Makefile.asm-generic
@@ -14,6 +14,12 @@ src := $(subst /generated,,$(obj))
 
 include scripts/Kbuild.include
 
+redundant := $(filter $(mandatory-y) $(generated-y), $(generic-y))
+redundant += $(foreach f, $(generic-y), $(if $(wildcard $(srctree)/$(src)/$(f)),$(f)))
+redundant := $(sort $(redundant))
+$(if $(redundant),\
+	$(warning redundant generic-y found in $(src)/Kbuild: $(redundant)))
+
 # If arch does not implement mandatory headers, fallback to asm-generic ones.
 mandatory-y := $(filter-out $(generated-y), $(mandatory-y))
 generic-y   += $(foreach f, $(mandatory-y), $(if $(wildcard $(srctree)/$(src)/$(f)),,$(f)))
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
