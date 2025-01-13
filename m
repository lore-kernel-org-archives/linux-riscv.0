Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FAB1C02183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Jan 2025 16:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=hhZxRaomMjmZNR5UuH+UttodSZsVEXIjWi/BsePMSPA=; b=jCM
	0KTpWnarVai4B7TBehU1gVCkuqYuutqxmdtJ4Kyx8l9QtcL9uHjIPTBiTJWiwZ9HfC2wZPS4mZIxz
	cy4nRy35RcvdZf9jj8Slx0TKXyLcw/5wgk/uZINN/q6AdjjZZND8FceLfWClo/7sWAVYmxR57d0IP
	6yjahUEaIdOQtUdj2vkD/tC6JimCq263ocF0IY83stXQU9yfQ7ebHMRMsPSYImr1wRH6N+Hgf1kJc
	M4aGJ+7gcAoAzb1YglnGyKpkpGmLrjwBieLyJBlnJQDJOOzItgi4HTtd2htdwY/EAmZ4mPevcsw/T
	M2MGWHsInxOG3Da7EHjDMHlDj4IsWyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXNDD-00000005pU4-27oq;
	Mon, 13 Jan 2025 16:22:47 +0000
Received: from mail-wm1-x349.google.com ([2a00:1450:4864:20::349])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXMkg-00000005jcp-1cUW
	for linux-riscv@lists.infradead.org;
	Mon, 13 Jan 2025 15:53:19 +0000
Received: by mail-wm1-x349.google.com with SMTP id 5b1f17b1804b1-4361efc9dc6so24953915e9.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Jan 2025 07:53:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736783596; x=1737388396; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=G6GC1+XOYFciKr0QO2K3EfTIEu2fRgTNywEW62ZU6LU=;
        b=Rxxhfn5OhmlIXGbFbcCmGDlK4Ggj0JpSi4F1/crQfY9amNY1VzF7prFJBjwx3WSKkR
         ZAn4J1SBiT/9+1GOv4h48q8CXRqjXMfd+0Fyfm5FG2krueiFMuPMVrDnTFuhmOYGCiu0
         WLAz2Nd24t7o6QblZ+gkxui103VV+CzqEuXq9HTuFUvhsTmDoMNU7EaYqazLGpkPQcaK
         y1aMnozdenafiGSwggAWoMw+sz1M6MhAlOQsXsT52NAuhKIKUchyR/3kvgDbdL4e9wRL
         XJz3sZQKncfnp0a5TTPTQRk4XfW5M49YPthaTcUduk0HeKskPRTYB4BSBJSFA8lpsoMD
         cwBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736783596; x=1737388396;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=G6GC1+XOYFciKr0QO2K3EfTIEu2fRgTNywEW62ZU6LU=;
        b=Ik/oS07z8x+HMyo5AVNS57c1GPHbxKmHopjRGVRc02Su2Y3SsdTpZ857VrHb8Gr7BD
         uqORUZcMLFZoensPJ6vv9dCqzruVC2UnSnkDBhTMSLtl2EFD0sIRuyYJXnrdgg9FPcJ8
         YmYaluF40x8qNplT4YJWe8PDI4EcmPjBlBNyVkcGUhDOTqUvxR6ygCHUHoVMQkeciQtD
         +P61Nyi6w7CBmsYkdM5RimJ+HoMqqufosCbvh1meTADFwMVaUWtuDf/Z20tjFZ9pDjjt
         fcc3H5DIfVa1riAry+u9bsFcJoy6MQK3c530Z0xoKAB1N/m6iQoVTP5MXog63rp4M1qB
         UU8A==
X-Forwarded-Encrypted: i=1; AJvYcCV1yhApK4/xDx8J26ysl1kZ3T5HQX2cD8VqqvBOJSZdZwjg3qJnxzrqYize/07oy2nwTSmLcTIJqscNQA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxoo/PYICyb2JzUoSdFpjm6ohUXmSBfweId+WfeDYjXgL62VK9C
	bLlG/dgb69uh5rTGlWTv4e+Wx+szu7mb3xUkZ212FLfBcacN0tQjVgM88Z8FLnWOHNYBcA==
X-Google-Smtp-Source: AGHT+IH5dEPphrI2+hqKkm7nO8Qbid4pBpO1yTJyk8F4n5RDCgoHc9WThlBG2WEW1eUpQcKcce5iGx6w
X-Received: from wmgg20.prod.google.com ([2002:a05:600d:14:b0:436:3ea:c491])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1d01:b0:434:fec5:4ef5
 with SMTP id 5b1f17b1804b1-436e26b6f51mr217012995e9.14.1736783596145; Mon, 13
 Jan 2025 07:53:16 -0800 (PST)
Date: Mon, 13 Jan 2025 16:53:07 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=5339; i=ardb@kernel.org;
 h=from:subject; bh=s4MbVtYFuNllJHwyINAWQC4eh4cmwVLd+OMXzyVaU8I=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIb3V7LH6jISPUvYLO+s+zL58qDPvUuyVJ3PK+858XGPgc
 tyuLU6po5SFQYyDQVZMkUVg9t93O09PlKp1niULM4eVCWQIAxenAEzEQZnhf4piYPWaVCmvf2ps
 SwW6XzS8sDjfce3ulErNM5nnbhziOMfw33me3BH9j5aTNdIvVVxjmZjIcMbvovG+pUsM56YnFvV vYAUA
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250113155306.1922992-2-ardb+git@google.com>
Subject: [PATCH v3] kbuild: Strip runtime const RELA sections correctly
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	Ron Economos <re@w6rz.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_075318_431683_89BB2611 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: Ron Economos <re@w6rz.net>
Link: https://lore.kernel.org/all/CAHk-=wjk3ynjomNvFN8jf9A1k=qSc=JFF591W00uXj-qqNUxPQ@mail.gmail.com/
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
v3: put back missing 'endif' to fix the RISC-V build
v2: add missing include of scripts/Makefile.lib

 arch/riscv/Makefile.postlink |  8 ++------
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
@@ -19,11 +20,6 @@ ifdef CONFIG_RELOCATABLE
 quiet_cmd_cp_vmlinux_relocs = CPREL   vmlinux.relocs
 cmd_cp_vmlinux_relocs = cp vmlinux vmlinux.relocs
 
-quiet_cmd_relocs_strip = STRIPREL $@
-cmd_relocs_strip = $(OBJCOPY)   --remove-section='.rel.*'       \
-                                --remove-section='.rel__*'      \
-                                --remove-section='.rela.*'      \
-                                --remove-section='.rela__*' $@
 endif
 
 # `@true` prevents complaint when there is nothing to be done
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
