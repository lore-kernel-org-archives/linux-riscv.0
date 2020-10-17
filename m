Return-Path: <SRS0=ZqiR=DY=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64FC5C433DF
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2020 00:45:15 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BD6C3212CC
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2020 00:45:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y/Wmjcr6";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="wHQ2iNs1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BD6C3212CC
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5kar31MlPCmUWiubA6MKv4hGhFTcy7uUA+xqkUsVPyg=; b=Y/Wmjcr6QlzX69TSgKmeHuWd15
	AD0MyA7d15mFoTZMV7OKyp21LQZr0j/dLOMLg8oDXWcS8XTLY4ANiV6KtKKjntEt9TOUNorLLxzrM
	/9BBTityJwI7K4KrJp0pBjvAPk1dyhq0MB6WoD0NJJdzTxy7GJaZolMD/N1WR6hnTZgLdFQZr7NMT
	TVBe5tXoanE7Zq5lhsU8BYhUJe1DduzgphPUKRmDdctIvodrUtggiZylZ6f72w9yktQESEj66JQO1
	EI6lHoVejbacYgLXetZWv/ZTav9FqFDUA4oghP+osBLUx9wRWKLDp0YDT1sdfYkig6dwUeWM7JbSm
	dxvQLYJA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kTaLE-0005AH-H9; Sat, 17 Oct 2020 00:45:00 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kTaLB-00059T-O8
 for linux-riscv@lists.infradead.org; Sat, 17 Oct 2020 00:44:58 +0000
Received: by mail-pl1-x641.google.com with SMTP id w11so2126183pll.8
 for <linux-riscv@lists.infradead.org>; Fri, 16 Oct 2020 17:44:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=BpVjr56bc2eZQztVfeg5TISaF4L8R2aKn65CiAfaVf8=;
 b=wHQ2iNs1LhleNkBlRA8uaPMfl+64Pkal9YqGeEP59Aozp8AOg3XuUa/KZ63tdNiXWc
 4fsJEBtLk1v0DtA9yTyxSzo3E/g0LBMoVdNjs6Fd9HRTs5GJ10rYU5hLzV702d4D1j/V
 IjqeW5szlOyw1B2PDHF6CC38AFe1cwr9oS2z0F+rRzrhj5sF1KmP8gLLSA6Gy5ON/v7b
 clCGVSS4teYRLohBb9msXgdBVYb66Co3QRr3XK2MpE+Nabo14jqMxZVGw9QRVbJu5Cuc
 qy5f2wdl8duTX+DEQxlY/QS12CXBB3T1kYVwfsByOHJkOd/KD81kZN+4/vJpsBR0itFS
 /7Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=BpVjr56bc2eZQztVfeg5TISaF4L8R2aKn65CiAfaVf8=;
 b=AygMqzUkUpAw2+RMF1EfNRa9shi3Lp2L73KFF2Du188Sm2GGQS6Y8h6sR8diglcdya
 7ICp1kSX6n7fMdszMT0IymhUqo8dmBtMvga3wG9qaOxgIUe9UlGxJ8omPk/lN/teFyE5
 GFGi1SN4euyFx5B7PVL5ArELyg+TZnEmxnpFCdY+lCLsB2mW8hJPwYs2vC/jreYilm+/
 O4ct9M/WAT3D/nxT6SyhkN4R6B0OfEkRZfgym1EilRLn0qYCihJlb+kgxsAA0mbJb054
 97SmxXxqKD9U5E64lCi1iI07i+g20teTw/jOWo2D7/bTde9FdpXifyHzqxVJJIxKDWEj
 xLOQ==
X-Gm-Message-State: AOAM530mNEO5+NHE1C6tDiNGlLmOjzsOmuM74ft4O73ICzRCFCplk+Jw
 p4eqU8iDSDfgpXA1gFwDEBbX/Q==
X-Google-Smtp-Source: ABdhPJzWsBwKhGUJdUUJ4kxHgDBcaR6EmCn+93uOzDLkQ0ulBmNG+4bCUL8ro2hiIU36MkJpacA8JQ==
X-Received: by 2002:a17:90b:383:: with SMTP id ga3mr6919579pjb.2.1602895493712; 
 Fri, 16 Oct 2020 17:44:53 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id b21sm3816739pfb.97.2020.10.16.17.44.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Oct 2020 17:44:53 -0700 (PDT)
Subject: [PATCH] RISC-V: Fix the VDSO symbol generaton for binutils-2.34+
Date: Fri, 16 Oct 2020 17:25:00 -0700
Message-Id: <20201017002500.503011-1-palmerdabbelt@google.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201016_204457_805917_582D4C7E 
X-CRM114-Status: GOOD (  17.34  )
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
Cc: clang-built-linux@googlegroups.com,
 Palmer Dabbelt <palmerdabbelt@google.com>, kernel-team@android.com,
 stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

We were relying on GNU ld's ability to re-link executable files in order
to extract our VDSO symbols.  This behavior was deemed a bug as of
binutils-2.34 (specifically the binutils-gdb commit a87e1817a4 ("Have
the linker fail if any attempt to link in an executable is made."),
which IIUC landed in 2.34), which recently installed itself on my build
setup.

The previous version of this was a bit of a mess: we were linking a
static executable version of the VDSO, containing only a subset of the
input symbols, which we then linked into the kernel.  This worked, but
certainly wasn't a supported path through the toolchain.  Instead this
new version parses the textual output of nm to produce a symbol table.
Both rely on near-zero addresses being linkable, but as we rely on weak
undefined symbols being linkable elsewhere I don't view this as a major
issue.

Fixes: e2c0cdfba7f6 ("RISC-V: User-facing API")
Cc: stable@vger.kernel.org
Cc: clang-built-linux@googlegroups.com
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/kernel/vdso/.gitignore |  1 +
 arch/riscv/kernel/vdso/Makefile   | 19 +++++++++----------
 arch/riscv/kernel/vdso/so2s.sh    |  7 +++++++
 3 files changed, 17 insertions(+), 10 deletions(-)
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
index 478e7338ddc1..2e02958f6224 100644
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
@@ -68,11 +63,15 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 # Make sure only to export the intended __vdso_xxx symbol offsets.
 quiet_cmd_vdsold = VDSOLD  $@
       cmd_vdsold = $(CC) $(KBUILD_CFLAGS) $(call cc-option, -no-pie) -nostdlib -nostartfiles $(SYSCFLAGS_$(@F)) \
-                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp && \
+                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp -Wl,-Map,$@.map && \
                    $(CROSS_COMPILE)objcopy \
                            $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
                    rm $@.tmp
 
+# Extracts
+quiet_cmd_so2s = SO2S    $@
+      cmd_so2s = $(CROSS_COMPILE)nm -D $< | $(src)/so2s.sh > $@
+
 # install commands for the unstripped file
 quiet_cmd_vdso_install = INSTALL $@
       cmd_vdso_install = cp $(obj)/$@.dbg $(MODLIB)/vdso/$@
diff --git a/arch/riscv/kernel/vdso/so2s.sh b/arch/riscv/kernel/vdso/so2s.sh
new file mode 100755
index 000000000000..7862866b5ebb
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
