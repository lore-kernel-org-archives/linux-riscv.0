Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A96CBE77188
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Jan 2025 08:28:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	Mime-Version:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=YaKDY2KFrO/uVrDnp+TG+svRLyLjOUMlyPsDPDlwpe0=; b=laa
	UamHQef2teVccSfcCtTnw69yttLHAND5+/ZP1yVvPtRl+zn79XR0p9TcvkudVcvuNWU1DZMu1pG2k
	7UIvrL1koWXIKoCF9wKzyVaJvL7ydTIzOxZ8J/9PhsoBy4+gdH8o0n2lrSGF6QLEMoy44IxEptsM8
	8CWzD/ElKkit8HZCMiXs3y5qnURYEIjR5bpk+zZJdyarG332U/KRxcyf2HGyY0Kbcj9b0PSh/8AyG
	JNvJcG6SW5Nb5PksYEoIZENevUP3SAqCrcoN+gJJqvekZlEOJD7o8Wfc6zLtPx7EWCQWhYrMQFkGT
	Mc7m8992I2c6zldK6IMFW0d4c8xJnMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWANA-0000000EWNL-1OQc;
	Fri, 10 Jan 2025 08:28:04 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWAN8-0000000EWMk-3JCY
	for linux-riscv@lists.infradead.org;
	Fri, 10 Jan 2025 08:28:04 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-38a35a65575so1289884f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 10 Jan 2025 00:28:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736497680; x=1737102480; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=T+He27ln4e+a+fHoBq8fWvUdNVutb9NtrOMSMA+rzNo=;
        b=kXLhTJA/iYmUoTDEEliTUPLyjRVtzul3JQZkRwmwSNyXtc17oZrn4ZhznBqjcLFwfH
         nDYfhyU7b1vjnhnRiYTPkoZXAQREuMO2SsnvlcTMPoCRO6urTMAKY8pv2mE+Xo1jg9Xa
         MUgjUzx13IcTCnKAToA8uy5e14Lz/ouJTir1YS6rdmyQsvnNsctygad4FT1XZOSP9kOn
         wgf0hMpSvKIQX2DxGoeQrXbTt8tTzvYzjt+E5P2l14Im5b8UOB/tJ0itLWQ5l01g9+lt
         sMANCEnR8q2zB8e7lNLSAIYirbiQx7lt6aQcBIPn/Kt5SOItnv/8fELWsXlcjN/PqrfP
         Lijw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736497680; x=1737102480;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=T+He27ln4e+a+fHoBq8fWvUdNVutb9NtrOMSMA+rzNo=;
        b=MvUpVRC4gS+5qijCP448cNC1Mo3UhJT+JxNsSn4T8vSqFGKE41E81x/6CM2qi+fLkH
         D+FZxQvDKrsRg1KgqoONFNQgaCREcg9N8S1fQFn+C2hX/YUVniP1NdfE0AhbPJAHVEku
         zRHToeTGRdoGlZugeFNBF63etOvdqDkVJ2IjcFWe6Fx7kv5f2Jjp20XWcRocnfjYopZt
         jC7b8IH2zk+GNMOecAR6EQ+03NL7dqSDXJlzQyhsn7KFXfGl+I3sfCL1JTgVgFM2sURh
         ONhePHkTat9gciW7uUPW60vRyo1RpGC8Jt0GS9YNUewnmDDA/x44huXE91Qz0OrII6z0
         cZ1A==
X-Forwarded-Encrypted: i=1; AJvYcCXQ1temJSd4V5tbTphb3a6CeNbGMX7NgfJhcxmI0Q8OTqo/CKHEsI/2XZDofnBtsqB1vzq9LsfhenITxg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9W/n/Kc3N3DgWPhJVU1Q26tt67wAjyEiQFruJr5y/Iq+P9Cux
	9UwUPi6puZDCRGfUCIinYzaF1xxVzPvNxsHQS9He0jq6jIsZT2uN6KpqH7tJqX6fHEuevA==
X-Google-Smtp-Source: AGHT+IHllbdvdpNeIVSUCIWzmwjLgK47yyaQGnjKJuHkrzM4n3hoLPsW3VD6z3VeT2CzpCll5061RsnL
X-Received: from wmbfm21.prod.google.com ([2002:a05:600c:c15:b0:434:fe2b:fea7])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:184e:b0:385:f64e:f163
 with SMTP id ffacd0b85a97d-38a87312f41mr7988646f8f.32.1736497680388; Fri, 10
 Jan 2025 00:28:00 -0800 (PST)
Date: Fri, 10 Jan 2025 09:27:45 +0100
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=4529; i=ardb@kernel.org;
 h=from:subject; bh=AUBKLLIPMNBxUb7a34I5INNn0MWf/ugl8eWGUaKnNsY=;
 b=owGbwMvMwCFmkMcZplerG8N4Wi2JIb3hFuO6sB8O7BeZ5DRbPWsSZ1l8uxFVlaFQWjnziRjf/
 Nwf+fs6SlkYxDgYZMUUWQRm/3238/REqVrnWbIwc1iZQIYwcHEKwESYPjIyTLz67ZrIrlgey1Ql
 jeuvL+pMme09pTjx/NTMDONiU0ZeD0aGHZ3i3E5HHm1ZvqqK3682//cF9vtXM9+cM7Faz/4rKru eDwA=
X-Mailer: git-send-email 2.47.1.688.g23fc6f90ad-goog
Message-ID: <20250110082744.457067-2-ardb+git@google.com>
Subject: [PATCH] kbuild: Strip runtime const RELA sections correctly
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_002802_849614_8F0FA94D 
X-CRM114-Status: UNSURE (   9.76  )
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
 arch/riscv/Makefile.postlink | 9 +--------
 arch/s390/Makefile.postlink  | 5 -----
 arch/x86/Makefile.postlink   | 5 -----
 scripts/Makefile.lib         | 3 +++
 4 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index 829b9abc91f6..65652fd6a252 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -19,13 +19,6 @@ ifdef CONFIG_RELOCATABLE
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
@@ -33,7 +26,7 @@ vmlinux: FORCE
 ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
 	$(call if_changed,cp_vmlinux_relocs)
-	$(call if_changed,relocs_strip)
+	$(call if_changed,strip_relocs)
 endif
 
 clean:
diff --git a/arch/s390/Makefile.postlink b/arch/s390/Makefile.postlink
index df82f5410769..008acf35c37e 100644
--- a/arch/s390/Makefile.postlink
+++ b/arch/s390/Makefile.postlink
@@ -19,11 +19,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/relocs.S
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
index fef2e977cc7d..8db8b7d338ad 100644
--- a/arch/x86/Makefile.postlink
+++ b/arch/x86/Makefile.postlink
@@ -20,11 +20,6 @@ quiet_cmd_relocs = RELOCS  $(OUT_RELOCS)/$@.relocs
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
