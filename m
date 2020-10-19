Return-Path: <SRS0=hknt=D2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C9C6C433E7
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 23:56:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 29DAB2098B
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Oct 2020 23:56:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="3jk/m/tk";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="n4C2VhCs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 29DAB2098B
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OXZ+glAaI1Ms6QEJoaIiDY2/vfJPpFVlLlsatZhk0JU=; b=3jk/m/tkE2bmKmtdNlxonruM+s
	Hgiuw14LkylWlOoCcE2pE+gducQhYmQgz+98wOk6psoh1qd6Pth9U/xSJeba5sdc61t5yK2+8URfo
	KKbikriFSBDNSSrKiNqbU42BDlEIXXfHW9hJjUfszykPQEjxZsjXbJsNeap2cEH/a4LoovNl5cN2f
	PoZdnwOV0asNNrXZU5jNZMRDrJeCrVEUZ+MPaYwXHuu+c2QdwvM8ARaB/vyWXYCVAjohdUUZ1QcIi
	PX7T3AUV9m+Ld8E3MROcd2/AV4s1bvgqbmJtf3nlxDoreArMjOD7V+WNLMzyh1zb5Ps/+F2n9bn26
	61tmD7Ig==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kUf19-0003hN-1H; Mon, 19 Oct 2020 23:56:43 +0000
Received: from mail-pj1-x1042.google.com ([2607:f8b0:4864:20::1042])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kUf16-0003gr-Ug
 for linux-riscv@lists.infradead.org; Mon, 19 Oct 2020 23:56:41 +0000
Received: by mail-pj1-x1042.google.com with SMTP id gv6so99870pjb.4
 for <linux-riscv@lists.infradead.org>; Mon, 19 Oct 2020 16:56:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=7pC1PJG01wEqpWrdqfg8ucgU9sedfk4p8BcTO/AeBDU=;
 b=n4C2VhCss9tJmn0zq3j7XpM/79jLgQc0CabYiAFVbMT6/BHO1hUpy343FADqhgbkvy
 V5oLmo+MZbZ2vrbZeGLa7cbVMeOBLvSBNckGShqPZYgvLHXEQnaUUv5avywKj2pX53BY
 w5zlBvVQf64pMIDsR49U8LRfxe4+F/VPDvIL4lypfq8CY4mqaMUApvRb7qWvO/ZIZSDn
 tdcZuQV4LkeJCfFQdrnl/25eZtxxynvpm0vlHASeMbp3o3Xrpcq1KtZLFQysI276Lj21
 QsaIs2XpmrzNhTFodMOJ2rfuykV4NXyLTIUDn7DCH3sWwclos1Ndsm4wHOVHv6BsQCXX
 fy3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=7pC1PJG01wEqpWrdqfg8ucgU9sedfk4p8BcTO/AeBDU=;
 b=oH/owkYQMrBxfKyko1P9gcMNZAnF179qeltbRq7S/lm4t/dMiSkcdyXd1tM03wQ4RU
 7olmWlGVjZbbiLN/bb1H+RavK0h/vAenTRJhxDONs+melvtFpe2cjKOrBRIMjPgF7Z1O
 /kf3Vo4jInL4gRgR5J/FlRNC6aYI/7fYLQxgPwo1lmvZfxdJewKXpyg6c/tUGMoYUKu5
 ygIaZeXbXgiPEdJcAzlueHSefeBuy96NQVpTA2BuGYQJIiNFwx/U+91m/LDcoUFxT3u8
 bDoqlnB4+/5mxn+BG0xLHNQdI/vvuS2PiXfEmMMwG/nyPzIT2zWBHp10RlCatYLYnBs+
 rDpg==
X-Gm-Message-State: AOAM533BYTZeJ+NWBoB5cB3b9oXLk8uP43tLVV33bEu5SAH7zFJXHJbW
 ufubANnOMRiuYHXDTCO0lbI+sw==
X-Google-Smtp-Source: ABdhPJwS04t2LkflX52fyL5Bdx6qSU4kwc3bYT7Z8WN/Ws2b74+WvOIEYUcbrfOH0lgzdCxZNhrzfg==
X-Received: by 2002:a17:90b:228c:: with SMTP id
 kx12mr217927pjb.215.1603151798684; 
 Mon, 19 Oct 2020 16:56:38 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id q24sm580728pgb.12.2020.10.19.16.56.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 16:56:38 -0700 (PDT)
Subject: [PATCH v2] RISC-V: Fix the VDSO symbol generaton for binutils-2.35+
Date: Mon, 19 Oct 2020 16:56:30 -0700
Message-Id: <20201019235630.762886-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201019_195640_990839_E47CB0CE 
X-CRM114-Status: GOOD (  18.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We were relying on GNU ld's ability to re-link executable files in order
to extract our VDSO symbols.  This behavior was deemed a bug as of
binutils-2.35 (specifically the binutils-gdb commit a87e1817a4 ("Have
the linker fail if any attempt to link in an executable is made."), but as that
has been backported to at least Debian's binutils-2.34 in may manifest in other
places.

The previous version of this was a bit of a mess: we were linking a
static executable version of the VDSO, containing only a subset of the
input symbols, which we then linked into the kernel.  This worked, but
certainly wasn't a supported path through the toolchain.  Instead this
new version parses the textual output of nm to produce a symbol table.
Both rely on near-zero addresses being linkable, but as we rely on weak
undefined symbols being linkable elsewhere I don't view this as a major
issue.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>

---

Changes since v2 <20201017002500.503011-1-palmerdabbelt@google.com>:

* Uses $(NM) instead of $(CROSS_COMPILE)nm.  We use the $(CROSS_COMPILE) form
  elsewhere in this file, but we'll fix that later.
* Removed the unnecesary .map file creation.
---
 arch/riscv/kernel/vdso/.gitignore |  1 +
 arch/riscv/kernel/vdso/Makefile   | 17 ++++++++---------
 arch/riscv/kernel/vdso/so2s.sh    |  6 ++++++
 3 files changed, 15 insertions(+), 9 deletions(-)
 create mode 100755 arch/riscv/kernel/vdso/so2s.sh

diff --git a/arch/riscv/kernel/vdso/.gitignore b/arch/riscv/kernel/vdso/.gitignore
index 11ebee9e4c1d..3a19def868ec 100644
--- a/arch/riscv/kernel/vdso/.gitignore
+++ b/arch/riscv/kernel/vdso/.gitignore
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
 vdso.lds
 *.tmp
+vdso-syms.S
diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 478e7338ddc1..5c263c5f723c 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -43,19 +43,14 @@ $(obj)/vdso.o: $(obj)/vdso.so
 SYSCFLAGS_vdso.so.dbg = $(c_flags)
 $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold)
+SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
+	-Wl,--build-id -Wl,--hash-style=both
 
 # We also create a special relocatable object that should mirror the symbol
 # table and layout of the linked DSO. With ld --just-symbols we can then
 # refer to these symbols in the kernel code rather than hand-coded addresses.
-
-SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
-	-Wl,--build-id -Wl,--hash-style=both
-$(obj)/vdso-dummy.o: $(src)/vdso.lds $(obj)/rt_sigreturn.o FORCE
-	$(call if_changed,vdsold)
-
-LDFLAGS_vdso-syms.o := -r --just-symbols
-$(obj)/vdso-syms.o: $(obj)/vdso-dummy.o FORCE
-	$(call if_changed,ld)
+$(obj)/vdso-syms.S: $(obj)/vdso.so FORCE
+	$(call if_changed,so2s)
 
 # strip rule for the .so file
 $(obj)/%.so: OBJCOPYFLAGS := -S
@@ -73,6 +68,10 @@ quiet_cmd_vdsold = VDSOLD  $@
                            $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
                    rm $@.tmp
 
+# Extracts
+quiet_cmd_so2s = SO2S    $@
+      cmd_so2s = $(NM) -D $< | $(src)/so2s.sh > $@
+
 # install commands for the unstripped file
 quiet_cmd_vdso_install = INSTALL $@
       cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
new file mode 100755
index 000000000000..3c5b43207658
--- /dev/null
+++ b/arch/riscv/kernel/vdso/so2s.sh
@@ -0,0 +1,6 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0+
+# Copyright 2020 Palmer Dabbelt <palmerdabbelt@google.com>
+
+sed 's!\([0-9a-f]*\) T \([a-z0-9_]*\)@@LINUX_4.15!.global \2\n.set \2,0x\1!' \
+| grep '^\.'
-- 
2.29.0.rc1.297.gfa9743e501-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
