Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3D7DD36129
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 02:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ai2EfyV5R+LDyhXDOH1e56u1jBDHGL+v37vrbN00BSQ=; b=gtfy4WppzpayI0
	BHPwkItbrENBBt1Wd6+kC7m+U9bNaTSKoXY2YlAqZhknSXF6SKH2Mx5X1g/PI+O5X7WHw22VuyxYp
	H++jgiD8fpJfTKbyNU/4qWZVMur18P6bKYQn0MQHBVpvGJ5OfG31qVDhdNeoVjTNyr7b3FirRkdkd
	hKmSaH8FD0OtlHj3AywPe1+UH3mVxaIjDqNqBPgWv8xDNsHxPAv0+L/mbMUiShnFqAaua6Ghciu0z
	ndvLDlH93xZ4ekIfAy2WgK/oX+F8M01Dad0PcRuOP6rjNoevUbGHFUETs1alBXDao/NW3XmVsAPRa
	eFwhzmNQjWf7RRufV3pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VTr-00000001Our-2VLj;
	Wed, 06 Nov 2024 02:09:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VTo-00000001Oso-3GYN
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 02:09:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7613D5C045E;
	Wed,  6 Nov 2024 02:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFC2DC4CECF;
	Wed,  6 Nov 2024 02:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730858947;
	bh=B6UfHUEIWaWEcRpuQYHyphb64JFnYui36KlElCdvEMI=;
	h=From:To:Cc:Subject:Date:From;
	b=pp/6OczFTLqCbavqo5uroOck8H6ydjhl7AT2DlOHW2E3WqKmDVsAtMgYcxE7V/aJN
	 LKKjhETSZ+55SPsE31ftzGwTPmxlDxLOjlHPNX6UaMabxT+0oGkMBgFT+xD/zQgagu
	 x/4PaQve54ASACcSFg6VBqk1kNqDImCMVHNvgDv1eEt4vAVJadYFXoIM8KZjeuWwK6
	 /RcpiTOTxfB9tAkQ+CBYZw3yX+I6OhbveqlbYHM8hlfIODOfOO64IOVfIBtuZu2lhQ
	 Bc9zAAuxHNIhoCxUB/0u5ZNv5LVz3U8yLB5Z4lTYfu8zUKyt+hqYlOi/34+W1237UG
	 URAaJsSu3MMzw==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	alexghiti@rivosinc.com
Cc: Jason Montleon <jmontleo@redhat.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-hardening@vger.kernel.org
Subject: FAILED: Patch "riscv: Do not use fortify in early code" failed to apply to v6.6-stable tree
Date: Tue,  5 Nov 2024 21:09:04 -0500
Message-ID: <20241106020905.164658-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_180908_913548_306C0574 
X-CRM114-Status: GOOD (  12.90  )
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

The patch below does not apply to the v6.6-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From afedc3126e11ff1404b32e538657b68022e933ca Mon Sep 17 00:00:00 2001
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Wed, 9 Oct 2024 09:27:49 +0200
Subject: [PATCH] riscv: Do not use fortify in early code

Early code designates the code executed when the MMU is not yet enabled,
and this comes with some limitations (see
Documentation/arch/riscv/boot.rst, section "Pre-MMU execution").

FORTIFY_SOURCE must be disabled then since it can trigger kernel panics
as reported in [1].

Reported-by: Jason Montleon <jmontleo@redhat.com>
Closes: https://lore.kernel.org/linux-riscv/CAJD_bPJes4QhmXY5f63GHV9B9HFkSCoaZjk-qCT2NGS7Q9HODg@mail.gmail.com/ [1]
Fixes: a35707c3d850 ("riscv: add memory-type errata for T-Head")
Fixes: 26e7aacb83df ("riscv: Allow to downgrade paging mode from the command line")
Cc: stable@vger.kernel.org
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Link: https://lore.kernel.org/r/20241009072749.45006-1-alexghiti@rivosinc.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/errata/Makefile    | 6 ++++++
 arch/riscv/kernel/Makefile    | 5 +++++
 arch/riscv/kernel/pi/Makefile | 6 +++++-
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/errata/Makefile b/arch/riscv/errata/Makefile
index 8a27394851233..f0da9d7b39c37 100644
--- a/arch/riscv/errata/Makefile
+++ b/arch/riscv/errata/Makefile
@@ -2,6 +2,12 @@ ifdef CONFIG_RELOCATABLE
 KBUILD_CFLAGS += -fno-pie
 endif
 
+ifdef CONFIG_RISCV_ALTERNATIVE_EARLY
+ifdef CONFIG_FORTIFY_SOURCE
+KBUILD_CFLAGS += -D__NO_FORTIFY
+endif
+endif
+
 obj-$(CONFIG_ERRATA_ANDES) += andes/
 obj-$(CONFIG_ERRATA_SIFIVE) += sifive/
 obj-$(CONFIG_ERRATA_THEAD) += thead/
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 7f88cc4931f5c..69dc8aaab3fb3 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -36,6 +36,11 @@ KASAN_SANITIZE_alternative.o := n
 KASAN_SANITIZE_cpufeature.o := n
 KASAN_SANITIZE_sbi_ecall.o := n
 endif
+ifdef CONFIG_FORTIFY_SOURCE
+CFLAGS_alternative.o += -D__NO_FORTIFY
+CFLAGS_cpufeature.o += -D__NO_FORTIFY
+CFLAGS_sbi_ecall.o += -D__NO_FORTIFY
+endif
 endif
 
 extra-y += vmlinux.lds
diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index d5bf1bc7de62e..81d69d45c06c3 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -16,8 +16,12 @@ KBUILD_CFLAGS	:= $(filter-out $(CC_FLAGS_LTO), $(KBUILD_CFLAGS))
 KBUILD_CFLAGS	+= -mcmodel=medany
 
 CFLAGS_cmdline_early.o += -D__NO_FORTIFY
-CFLAGS_lib-fdt_ro.o += -D__NO_FORTIFY
 CFLAGS_fdt_early.o += -D__NO_FORTIFY
+# lib/string.c already defines __NO_FORTIFY
+CFLAGS_ctype.o += -D__NO_FORTIFY
+CFLAGS_lib-fdt.o += -D__NO_FORTIFY
+CFLAGS_lib-fdt_ro.o += -D__NO_FORTIFY
+CFLAGS_archrandom_early.o += -D__NO_FORTIFY
 
 $(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ \
 			       --remove-section=.note.gnu.property \
-- 
2.43.0





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
