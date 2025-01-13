Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2993C02184
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 14:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=OjaCDENDJ41r+b1KPq9s83x2ByVGX7qzmUDiajBGg+c=; b=pfn
	+HMC5fd9/FDYzO02FWUE61YbwSVooTkFwvy5T5XqnlLj4xUPJj9Jkl7D9Jf8qBk+0olyZtaFtJxn7
	nqN0HqEWFUa6DE2XTxlrYG+qWTmlqkYG7V1Nfhbr/+9GSPVZOnSgnGjLU3oP5oO2li4bPzpnfQ18L
	9yDHQ/01jnEYgHyBisU/7Cr6mIZPab/KsNiSiG7nmQj5bwDla04O9Aw8vH9y0AO2vsj5pEnPmKt6r
	NH2HMRuITKtC++kVG862CCncCbdFBUeFUkNT8cDNBAO5huE4Kp/P2BJ+VLRGKcm30GS/3DdhgvgZp
	sZXjilBQZV2Cl68s9PdebWdw48iFBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLXD-00000005QdL-1cKV;
	Mon, 13 Jan 2025 14:35:19 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXLUZ-00000005QBE-2av0
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 14:32:36 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-43646b453bcso23388555e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 06:32:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736778753; x=1737383553; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=OzIqGGH3vBKieE2zzlwNtC18zjNLUz1ZncrxL4Bmag8=;
        b=woahiOZhzcnWHFohWwBPal4BR/JdvT6vAukCrw6mC8hmm0a/KnjXgel4naa6J9Qre5
         BbvmK3rnRwCKTJI4z0lDZzdbGe6UzaJQaOYIyxhQdWr6As1Vx2nqZxq1SGipwFfxOlJE
         vsk6Iqqul+ZYRaUm6pR4WQJmE/34uhS3LNVzQSjqLiKXL3eskDBnEq0i2CMy/n/ePh2m
         bM5rrCO1iaC3a8zZXJVwfpiv8CtvoAPg6+OPoEFe1v1jj8JI4XfWfn+p5arSi5IUZRF/
         NQAtUDaJBXvcR/BbIHpbbicGz1jeGi59iEHZsaGdy5oXyKblpKjXjF3EjDgR6JUNiG56
         1VBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736778753; x=1737383553;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OzIqGGH3vBKieE2zzlwNtC18zjNLUz1ZncrxL4Bmag8=;
        b=qye0cxtcc3gbAKg+Q2aMU0dp1DP31RUZlZDRJLQXSG2krh1S86b8WbYq5499BHe+c/
         1NSxoiYLJnomh6P406o9pzWyh0RVvcVRWGk9SZu4gp9837LwLd6sJWGjRIBhYMwwHxRu
         6z7rLLw3uMEPurNGKZ/W3rA/GkLtEsDj1BKCoxKmOeTzqBL+uT6/02jExHe1i1Tdx7qC
         BiP4JrkXKdK1G46mm0X7IEJLEqZrTVKilMW7oVtcdwsREGgdTSE+zKfJne+IaizQ4zxD
         cT6q8Zf+4nz4NB294pvDQU2g5GFLKMOAT2qQwgLAIB2C9WEl4S9c+XGNw0afh0Sp99Jv
         YeIQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqg9aAV3+8Cl7HJBA8xhFfFZWkgz0ejddZY4wnFajzxoKWIpp2aEiXlYWVvLeaErw6w294sDzdTcA1hw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9Ehmw+UCJ8vUu06feK+5z/jrwJLRyMQm35QTRw8jCmqVe5cBJ
	2BwEjyqDI7TC1BAk61GZZWWuotapoEmUi5fOGZ8ZbhbFJt1kCARa1AV/6kTrdcH2PMj0XA==
X-Google-Smtp-Source: AGHT+IFQeNAamqcGdcN8c7ytefb3W1Z5eHAuyFOJ2VehyPJ1eN/M3OxG5yO9oTpeEg8FqBs7yp+CS2pm
X-Received: from wmsp9.prod.google.com ([2002:a05:600c:1d89:b0:436:6f3f:58de])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:4510:b0:431:54d9:da57
 with SMTP id 5b1f17b1804b1-436e26ffb2cmr209267185e9.30.1736778753695; Mon, 13
 Jan 2025 06:32:33 -0800 (PST)
Date: Mon, 13 Jan 2025 15:32:22 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5275; i=ardb@kernel.org;
 h=from:subject; bh=wUg0mP/r/+W1sG3n3TuyOrD53kw2VZ0233ES5hgrKL4=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIb1V+Ztpk/CP/SZ9zqc43/1juvV8Y8gnGft5h/z/Zkf1X
 7qqw+fbUcrCIMbBICumyCIw+++7nacnStU6z5KFmcPKBDKEgYtTACZS5Mnwv1os/c2dXB+v0vZr
 OzhdA/IkdVh4I+Nn1TtnXxKJuX7MieF/QoNBWOUnw4zvy99c3N1fPbmT8/Ax++0LX7X+2dj0ZEI sCwA=
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250113143222.1868692-2-ardb+git@google.com>
Subject: [PATCH v2] kbuild: Strip runtime const RELA sections correctly
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_063235_660007_CD20ED9A 
X-CRM114-Status: UNSURE (   9.73  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Due to the fact that runtime const ELF sections are named without a
leading period or double underscore, the RSTRIP logic that removes the
static RELA sections from vmlinux fails to identify them. This results
in a situation like below, where some sections that were supposed to get
removed are left behind.

  [Nr] Name                              Type            Address          Off     Size   ES Flg Lk Inf Al

  [58] runtime_shift_d_hash_shift        PROGBITS        ffffffff83500f50 2900f50 000014 00   A  0   0  1
  [59] .relaruntime_shift_d_hash_shift   RELA            0000000000000000 55b6f00 000078 18   I 70  58  8
  [60] runtime_ptr_dentry_hashtable      PROGBITS        ffffffff83500f68 2900f68 000014 00   A  0   0  1
  [61] .relaruntime_ptr_dentry_hashtable RELA            0000000000000000 55b6f78 000078 18   I 70  60  8
  [62] runtime_ptr_USER_PTR_MAX          PROGBITS        ffffffff83500f80 2900f80 000238 00   A  0   0  1
  [63] .relaruntime_ptr_USER_PTR_MAX     RELA            0000000000000000 55b6ff0 000d50 18   I 70  62  8

So tweak the match expression to strip all sections starting with .rel.
While at it, consolidate the logic used by RISC-V, s390 and x86 into a
single shared Makefile library command.

Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-riscv@lists.infradead.org
Cc: linux-s390@vger.kernel.org
Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v2: add missing include of scripts/Makefile.lib

 arch/riscv/Makefile.postlink | 10 ++--------
 arch/s390/Makefile.postlink  |  6 +-----
 arch/x86/Makefile.postlink   |  6 +-----
 scripts/Makefile.lib         |  3 +++
 4 files changed, 7 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index 829b9abc91f6..750d2784f69e 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -10,6 +10,7 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
 
 quiet_cmd_relocs_check = CHKREL  $@
 cmd_relocs_check = 							\
@@ -19,13 +20,6 @@ ifdef CONFIG_RELOCATABLE
 quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
 cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
 
-quiet_cmd_relocs_strip = STRIPREL $@
-cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
-                                --remove-section='.rel__*'      \
-                                --remove-section='.rela.*'      \
-                                --remove-section='.rela__*' $@
-endif
-
 # `@true` prevents complaint when there is nothing to be done
 
 vmlinux: FORCE
@@ -33,7 +27,7 @@ vmlinux: FORCE
 ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
 	$(call if_changed,cp_vmlinux_relocs)
-	$(call if_changed,relocs_strip)
+	$(call if_changed,strip_relocs)
 endif
 
 clean:
diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
index df82f5410769..1ae5478cd6ac 100644
--- a/arch/s390/Makefile.postlink
+++ b/arch/s390/Makefile.postlink
@@ -11,6 +11,7 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
 
 CMD_RELOCS=arch/s390/tools/relocs
 OUT_RELOCS = arch/s390/boot
@@ -19,11 +20,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
 	mkdir -p $(OUT_RELOCS); \
 	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/relocs.S
 
-quiet_cmd_strip_relocs = RSTRIP  $@
-      cmd_strip_relocs = \
-	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
-		   --remove-section='.rela.*' --remove-section='.rela__*' $@
-
 vmlinux: FORCE
 	$(call cmd,relocs)
 	$(call cmd,strip_relocs)
diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
index fef2e977cc7d..8b8a68162c94 100644
--- a/arch/x86/Makefile.postlink
+++ b/arch/x86/Makefile.postlink
@@ -11,6 +11,7 @@ __archpost:
 
 -include include/config/auto.conf
 include $(srctree)/scripts/Kbuild.include
+include $(srctree)/scripts/Makefile.lib
 
 CMD_RELOCS = arch/x86/tools/relocs
 OUT_RELOCS = arch/x86/boot/compressed
@@ -20,11 +21,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
 	$(CMD_RELOCS) $@ > $(OUT_RELOCS)/$@.relocs; \
 	$(CMD_RELOCS) --abs-relocs $@
 
-quiet_cmd_strip_relocs = RSTRIP  $@
-      cmd_strip_relocs = \
-	$(OBJCOPY) --remove-section='.rel.*' --remove-section='.rel__*' \
-		   --remove-section='.rela.*' --remove-section='.rela__*' $@
-
 # `@true` prevents complaint when there is nothing to be done
 
 vmlinux: FORCE
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 7395200538da..f604f51d23ca 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -374,6 +374,9 @@ quiet_cmd_ar = AR      $@
 quiet_cmd_objcopy = OBJCOPY $@
 cmd_objcopy = $(OBJCOPY) $(OBJCOPYFLAGS) $(OBJCOPYFLAGS_$(@F)) $< $@
 
+quiet_cmd_strip_relocs = RSTRIP  $@
+cmd_strip_relocs = $(OBJCOPY) --remove-section='.rel*' $@
+
 # Gzip
 # ---------------------------------------------------------------------------
 
-- 
2.47.1.688.g23fc6f90ad-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
