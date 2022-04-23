Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C10EC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Apr 2022 01:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Cc:MIME-Version:Message-Id:Date
	:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rO2S/3SAcLFMGqonpqK2zoMeto2U72MSoKXddYj+eSE=; b=H00QiM8UaOstGv
	N7mgQnFkapQUMJVFZpkQxAyQTkiO5e3eNbHRhiO27UOpO75tdblAkbDu3a01r8MyMi+FZxS5XXtxN
	AuouAcc3h3VIQB460T2EBPD9wppXQXmDhLuXjs9ioOfSugFNWqHZJ9SYMaBAE8OqXjRMv7G7N4YD8
	bJUQIrXw38mgTqkKx/cU7urOJM62PUXJtKTmjM/eMr948oNn4iR3i62KQDXwkfOqEP68L3MVO26c9
	9q4AjpyHcr7mEzNObEcd4CMf4T7xatwWcGw0r4+FLfJWB9U+vosY3/ejDJm+z6ZQvE/lQOp9+xGmz
	n6E2pawANlRe6KcC3peQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ni4vD-003Ck6-PC; Sat, 23 Apr 2022 01:50:51 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ni4v9-003CjJ-S5
 for linux-riscv@lists.infradead.org; Sat, 23 Apr 2022 01:50:49 +0000
Received: by mail-pf1-x436.google.com with SMTP id j17so9562819pfi.9
 for <linux-riscv@lists.infradead.org>; Fri, 22 Apr 2022 18:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=YJyfrQ50lUQluVZGs/0t4KiqUkLmfhT3vxofh4iqMmg=;
 b=EYdIzhrCqijyunKNF96WKyVnWHCAg8VLYNTbEfQVvowBPq5poWnnz6guqKFrXQekCP
 FbKP3ybD+k8gDFGNHSNS4Bryhq/72zT9vMISljRBAAO1vudPIKGvQ/s8WyRTZCphEsJ5
 GqcmtSKB4hPVU3+bIZaNXkiLNxFdsyd+sBolKkYL8iQDXIfe0e5jX+51HzzltK8d06Yw
 +UdOdA5ImHGTMpWEwkZ7o00yL74Wc1fMNlU9kN5AghfdphEjoBVltMlVi9PRvj7+jlJC
 GDX+O/U+sfXIdtHd4kcmmPs6NiE6Zdwm72C7FJQ6M48G4/o2M9ujuReTnt/sRfn/hcFj
 d2kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=YJyfrQ50lUQluVZGs/0t4KiqUkLmfhT3vxofh4iqMmg=;
 b=ho7cBCnLRPxv/3HmmUjbj/X7Df2g2dfap3mM+XUehGxzHkYyk2rXRvRNVqPOTAVyDY
 hv4mZHB7RUM5Gtxu+gv+qd0BScfRP18e0VXm/4hWQUhW8rU5urJzx2sOzitB6vUINa+3
 hX6EObdkjmQR5Cnr7YKK1szD0eS7TtJbUVjFRKSVDIhQ6g/MuKGxkbwweyWU5bIIAaH6
 5fKL8ycOBdZXsaVwdp0S775BWq3e3+AgxoLT3M6uETURwLFd3SYmTCKjs6w1gid99hHA
 aexZSljKGYgDBfBL3ushE0KSKRadPHhMQ927eQXwMyGL8lBR9Ucy3g9d/Ljk7FNQKWoi
 Zvtw==
X-Gm-Message-State: AOAM533tHhXbyB/imKnjbndtCJFWL9M9e9RHly43iXM22LMJqPN17fcG
 n6BO3F5ShERE0hifRrQo+Emsu68H2diAlw==
X-Google-Smtp-Source: ABdhPJwKXGX0fOFtEl0/NkF++Tz5TguZ3bL9dV/oasO6LZtRxeoA5hvNCLv/m2skomZ5Is1begD8ZQ==
X-Received: by 2002:a63:6bc6:0:b0:39d:966d:2791 with SMTP id
 g189-20020a636bc6000000b0039d966d2791mr6261238pgc.407.1650678646700; 
 Fri, 22 Apr 2022 18:50:46 -0700 (PDT)
Received: from localhost ([12.3.194.138]) by smtp.gmail.com with ESMTPSA id
 w9-20020a056a0014c900b004fb2ca5f6d7sm3657380pfu.136.2022.04.22.18.50.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Apr 2022 18:50:46 -0700 (PDT)
Subject: [PATCH] RISC-V: Drop support for medlow
Date: Fri, 22 Apr 2022 18:38:14 -0700
Message-Id: <20220423013814.1281-1-palmer@rivosinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Cc: Palmer Dabbelt <palmer@rivosinc.com>
From: Palmer Dabbelt <palmer@rivosinc.com>
To: linux-riscv@lists.infradead.org, alexandre.ghiti@canonical.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220422_185048_168536_7CB92CB8 
X-CRM114-Status: GOOD (  18.03  )
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

medlow affords slightly better generated code, which is nice, but can
only run on a fairly restrictive set of systems.  That includes all
32-bit systems (where medlow is the default), but there don't appear to
be any in production, so this removes support for medlow on rv32 as
well.

Supporting medlow is a bit of a burden: some early boot bits only work
medany, but there's no way to enforce that in the toolchain so we're
stuck with finding bugs at runtime.  This moves the kernel to always be
built as medany.

Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>

---

If people are still using this then I'm happy to keep it, but I'm not
sure it's worth the headache any more: the generated code is slightly
faster, which is nice, but as our feature set has grown I've started to
get a feeling that the somewhat restricted set of systems medlow runs on
means it's not actually getting used.  I'm testing it and regularly find
bugs in patches, but I don't really have much of a use for it so if it's
just me keeping this alive then that's a bit silly.

If we have any users then please speak up, as once this goes in the
medlow support will quickly bitrot.  I'll try and circulate this around
as widely as I can.
---
 arch/riscv/Kconfig         | 14 --------------
 arch/riscv/Makefile        | 12 ++----------
 arch/riscv/kernel/Makefile |  2 +-
 3 files changed, 3 insertions(+), 25 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 00fd9c548f26..132e0a4020c9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -243,20 +243,6 @@ config ARCH_RV64I
 
 endchoice
 
-# We must be able to map all physical memory into the kernel, but the compiler
-# is still a bit more efficient when generating code if it's setup in a manner
-# such that it can only map 2GiB of memory.
-choice
-	prompt "Kernel Code Model"
-	default CMODEL_MEDLOW if 32BIT
-	default CMODEL_MEDANY if 64BIT
-
-	config CMODEL_MEDLOW
-		bool "medium low code model"
-	config CMODEL_MEDANY
-		bool "medium any code model"
-endchoice
-
 config MODULE_SECTIONS
 	bool
 	select HAVE_MOD_ARCH_SPECIFIC
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index 7d81102cffd4..34ef14543803 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -14,10 +14,6 @@ ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	CC_FLAGS_FTRACE := -fpatchable-function-entry=8
 endif
 
-ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-KBUILD_CFLAGS_MODULE += -mcmodel=medany
-endif
-
 export BITS
 ifeq ($(CONFIG_ARCH_RV64I),y)
 	BITS := 64
@@ -58,16 +54,12 @@ riscv-march-$(toolchain-need-zicsr-zifencei) := $(riscv-march-y)_zicsr_zifencei
 
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
 KBUILD_AFLAGS += -march=$(riscv-march-y)
+KBUILD_CFLAGS += -mcmodel=medany
 
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
-ifeq ($(CONFIG_CMODEL_MEDLOW),y)
-	KBUILD_CFLAGS += -mcmodel=medlow
-endif
-ifeq ($(CONFIG_CMODEL_MEDANY),y)
-	KBUILD_CFLAGS += -mcmodel=medany
-endif
+
 ifeq ($(CONFIG_PERF_EVENTS),y)
         KBUILD_CFLAGS += -fno-omit-frame-pointer
 endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 87adbe47bc15..62474e8b1074 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -11,7 +11,7 @@ endif
 CFLAGS_syscall_table.o	+= $(call cc-option,-Wno-override-init,)
 
 ifdef CONFIG_KEXEC
-AFLAGS_kexec_relocate.o := -mcmodel=medany $(call cc-option,-mno-relax)
+AFLAGS_kexec_relocate.o := $(call cc-option,-mno-relax)
 endif
 
 extra-y += head.o
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
