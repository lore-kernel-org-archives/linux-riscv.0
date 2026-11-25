Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62707606DE7B
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 06:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=hWsgj8Pj;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=dNCyYWVL;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=ha9huIVk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Unsubscribe-Post:List-Owner;
	bh=O+d3hWOr8bOr4UXhY7IP0QS6S4yyZP4pvT++Ig+n8qA=; b=hWsgj8PjAQu4oh2VRILLO/1AmE
	YZnGuFY9kwKo0JwBkp7dtCocx06jNI2DU20lAo0DPtm3+uNiJ9yK2PKfttorT1GsVoDBBgdoZF5vg
	vmWTZSDFnnsmaJGSwUp9rODNhWjAf81uW9se9tEa75kB6U2VXeGvMqkaZkUd5RAA8J9+UKTQIwts/
	Cu9HmFlvWxz9pQlDXltymk4a4sU9gBodVUjWO6K9aSoftuWCKXRq+B+fwVhn6EoNn2RhYD/12lWyF
	W9nWWnksR0dwoPkVVzTpBZCsum1FTTYck2rW4TGC3TRVnfhiwPkqoP7iDXpSGnWorpZXIbloBgft/
	Fi6UtVjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6JG-00000008ZCk-0NoS;
	Wed, 25 Nov 2026 06:16:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Ih-00000008YcM-1tDm
	for linux-riscv@bombadil.infradead.org;
	Wed, 25 Nov 2026 06:16:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ZvfWqaB0nFxucxNwNfxUIvrX7JKFCnM6p4UbWiRwSLk=; b=dNCyYWVLbvl0PzxCGASca3Lq4W
	wHlVCB6RVIvjnbGJ1zDw0r3ajP5e4E1jbJVEAGg5nDSzWTdeVLhvJmHxHgSfwLLbbOCFKfYKhA0jF
	vV5mR+Vak2qzHO8LQuXewR3DfE11VisZBBWqg+LzuXC/LkO0V0GTX/F2/G8FOHrg5NK0ZQpvHOgNy
	je55ul88T0FmPuO2V73xmUaTCXj7uUjCQxpXOva1Fa3S39CfmBReiI55bbDsgy/CYfdVl0kokuodU
	8KMOw6rFmx5acafd6xSPioaJYgrTkZJQSsAeCCYYStkrIoSocqVX/srFXXfdjxPH543s8rQ+Zl+ws
	f8kpF9rg==;
Received: from mail-dy1-x1346.google.com ([2607:f8b0:4864:20::1346])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW6Id-00000004tlO-1cQX
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 06:16:14 +0000
Received: by mail-dy1-x1346.google.com with SMTP id 5a478bee46e88-384c78aa0dbso7370349eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 22:16:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795587369; x=1796192169; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZvfWqaB0nFxucxNwNfxUIvrX7JKFCnM6p4UbWiRwSLk=;
        b=ha9huIVk+puKUag/RZTB2RWqLA3LM9pw82ukmy3Ja3hbrje+EOjAL6BX2B3Z1NteHF
         f4z3GPNA4kx+tUq1s/WoO7AU4TmT1NWHA5H4Lf6j1C8sHw+bULKBrDh0SUe9mW9qc4Sg
         oCWxubJQFmsCi28CxLHYU7zKvtSgc9BNPYwE5uSE67u4hDKTO/rMf8DT9YclHqoYq0YA
         d3HoAsANKDADAVFOJXIS+VqaWvPd7vsTWWfHQmJfCVF8BAVZ3PXy+xfJzy9RUoNpsS1C
         D+VxkFSQE/QDeV/ixIZLAw6mES2rtDgabysdfCNbP8kYpgStjTfHvsL827DVtnO0vsYf
         x7KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795587369; x=1796192169;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZvfWqaB0nFxucxNwNfxUIvrX7JKFCnM6p4UbWiRwSLk=;
        b=G6/jyn1lwU0uI8ZdVJephttyU4J3sgqzr3drdLKXZC+ymNzHqq/LBbR+7HX5WNqvgz
         6YV+eXSG1xNzKJrqnuV4UU6umAx0A4SwKXzdHi5QiWCV2pJBp59cOrTOA21m5ECedth/
         JYJaEuJ/JC1x/m2ugTROiTmFNscep5Y9isVyJZDcu+KDh1SvEsI+PQ8ts7vki5FGX95W
         bn7bR7rr8ee57A2udK4MMJ82fINpiVHgPtWg+yvoqaMXmuH4ccTwE2S7BIWEqT1MqkP9
         yJXbiF2pE3jGckTlOcj6g7OBpl9hw6PcbtXSdNkDpsIZ/UjRsdJKYy3bB9lwqF53ESJZ
         M6Ag==
X-Forwarded-Encrypted: i=1; AL+hErFoXjrJsASgd6helL86F562dzHfV2JlDFcUDw+OWhsO59cyyRPOUmIImsF3QvjSkITDVfgHydM+Zto1lg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9Oc4U0DrzYVWNrbdgp4Ks1zNSyl+9t02wlTvB5QhV5RDYpPI9q
	RBp1LSArcE2epEmHlsGgSgPL0CECTJHThAKOzRxbHBgeGOOxV5hZDeu34zocDVGmAAmLyPGmEuw
	xzjE7h8M4Cg==
X-Received: from dyblf45.prod.google.com ([2002:a05:7301:a2d:b0:375:861c:512e])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:8953:20b0:386:a70b:75dc
 with SMTP id 5a478bee46e88-386a70b7837mr10351275eec.11.1795587368701; Tue, 24
 Nov 2026 22:16:08 -0800 (PST)
Date: Tue, 24 Nov 2026 22:14:59 -0800
In-Reply-To: <20261125061523.1540234-1-irogers@google.com>
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
References: <20261125061523.1540234-1-irogers@google.com>
X-Mailer: git-send-email 2.56.1.831.g720f3f5937-goog
Message-ID: <20261125061523.1540234-7-irogers@google.com>
Subject: [RFC PATCH v2 06/30] kbuild: Wire up CONFIG_UNWINDER_DWARF_CFI_MINIFY
 object pass
From: Ian Rogers <irogers@google.com>
To: linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linux-arch@vger.kernel.org
Cc: jpoimboe@kernel.org, rostedt@goodmis.org, peterz@infradead.org, 
	mingo@redhat.com, tglx@kernel.org, bp@alien8.de, dave.hansen@linux.intel.com, 
	x86@kernel.org, catalin.marinas@arm.com, will@kernel.org, 
	mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, pjw@kernel.org, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr, 
	linux-riscv@lists.infradead.org, acme@kernel.org, namhyung@kernel.org, 
	linux-perf-users@vger.kernel.org, mhiramat@kernel.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, bpf@vger.kernel.org, 
	nathan@kernel.org, llvm@lists.linux.dev, nsc@kernel.org, 
	linux-kbuild@vger.kernel.org, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, ardb@kernel.org, linux-efi@vger.kernel.org, 
	maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org, indu.bhagat@oracle.com, jremus@linux.ibm.com, 
	wnliu@google.com, dylanbhatch@google.com, Ian Rogers <irogers@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261125_061611_557862_DE823A55 
X-CRM114-Status: GOOD (  11.05  )
X-Spam-Score: -7.6 (-------)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Invoke scripts/min_eh_frame on standard kernel C, Rust, and post-LTO
composite .o objects when CONFIG_UNWINDER_DWARF_CFI_MINIFY is enabled,
recording scripts/min_eh_frame as a rebuild dependency in .*.cmd files.

Across full vmlinux builds on x86-64, ARM64, and RISC-V, minification
achieves 100.00% FDE coverage and reduces .eh_frame size 18%-28% below
SFrame v3 (.sframe).

Signed-off-by: Ian Rogers <irogers@google.com>
---
 rust/Makefile              |  4 +++-
 scripts/Makefile.build     | 12 ++++++++++--
 scripts/Makefile.lib       | 13 +++++++++++--
 scripts/Makefile.vmlinux_o |  8 +++++++-
 4 files changed, 31 insertions(+), 6 deletions(-)

diff --git a/rust/Makefile b/rust/Makefile
index 0165626decbe..1238b4ac661d 100644
--- a/rust/Makefile
+++ b/rust/Makefile
@@ -668,7 +668,8 @@ quiet_cmd_rustc_library = $(if $(skip_clippy),RUSTC,$(RUSTC_OR_CLIPPY_QUIET)) L
 		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
 	$(if $(rustc_objcopy),;$(OBJCOPY) $(rustc_objcopy) $@) \
-	$(cmd_objtool)
+	$(cmd_objtool) \
+	$(cmd_min_eh_frame)
 
 rust-analyzer:
 	$(Q)MAKEFLAGS= $(srctree)/scripts/generate_rust_analyzer.py \
@@ -721,6 +722,7 @@ endif
 define rule_rustc_library
 	$(call cmd_and_fixdep,rustc_library)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 	$(call cmd,gendwarfksyms)
 endef
 
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 6127feb970c6..ced0f630f566 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -281,6 +281,10 @@ ifdef CONFIG_OBJTOOL
 $(obj)/%.o: private objtool-enabled = $(if $(is-standard-object),$(if $(delay-objtool),$(is-single-obj-m),y))
 endif
 
+ifdef CONFIG_UNWINDER_DWARF_CFI_MINIFY
+$(obj)/%.o: private min-eh-frame-enabled = $(if $(filter-out scripts/mod/empty.o,$@),$(is-standard-object))
+endif
+
 ifneq ($(findstring 1, $(KBUILD_EXTRA_WARN)),)
 cmd_warn_shared_object = $(if $(word 2, $(modname-multi)),$(warning $(kbuild-file): $*.o is added to multiple modules: $(modname-multi)))
 endif
@@ -371,11 +375,13 @@ quiet_cmd_rustc_o_rs = $(RUSTC_OR_CLIPPY_QUIET) $(quiet_modtag) $@
 		$(CC) $(CLANG_FLAGS) $(filter-out $(CC_FLAGS_LTO),$(KBUILD_CFLAGS)) \
 		$(CC_FLAGS_RUST_INLINE_HELPERS) -Wno-override-module -c $(patsubst %.o,%.m.bc,$@) -o $@ \
 		$(cmd_ld_single)) \
-	$(cmd_objtool)
+	$(cmd_objtool) \
+	$(cmd_min_eh_frame)
 
 define rule_rustc_o_rs
 	$(call cmd_and_fixdep,rustc_o_rs)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 endef
 
 $(obj)/%.o: $(obj)/%.rs FORCE
@@ -518,14 +524,16 @@ $(obj)/lib.a: $(lib-y) FORCE
 	$(call if_changed,ar)
 
 quiet_cmd_ld_multi_m = LD [M]  $@
-      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool)
+      cmd_ld_multi_m = $(LD) $(ld_flags) -r -o $@ @$< $(cmd_objtool) $(cmd_min_eh_frame)
 
 define rule_ld_multi_m
 	$(call cmd_and_savecmd,ld_multi_m)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 endef
 
 $(multi-obj-m): private objtool-enabled := $(delay-objtool)
+$(multi-obj-m): private min-eh-frame-enabled := $(CONFIG_LTO_CLANG)
 $(multi-obj-m): private part-of-module := y
 $(multi-obj-m): %.o: %.mod FORCE
 	$(call if_changed_rule,ld_multi_m)
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 19e96b30a122..b27bcd50daf7 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -222,6 +222,12 @@ objtool-enabled := y
 
 endif # CONFIG_OBJTOOL
 
+ifdef CONFIG_UNWINDER_DWARF_CFI_MINIFY
+min_eh_frame := $(objtree)/scripts/min_eh_frame
+cmd_min_eh_frame = $(if $(min-eh-frame-enabled), ; $(min_eh_frame) $@)
+cmd_gen_min_eh_framedep = $(if $(min-eh-frame-enabled), { echo ; echo '$@: $$(wildcard $(min_eh_frame))' ; } >> $(dot-target).cmd)
+endif
+
 # Useful for describing the dependency of composite objects
 # Usage:
 #   $(call multi_depend, multi_used_targets, suffix_to_remove, suffix_to_add)
@@ -265,7 +271,8 @@ endif
 quiet_cmd_cc_o_c = CC $(quiet_modtag)  $@
       cmd_cc_o_c = $(CC) $(c_flags) -c -o $@ $< \
 		$(cmd_ld_single) \
-		$(cmd_objtool)
+		$(cmd_objtool) \
+		$(cmd_min_eh_frame)
 
 define rule_cc_o_c
 	$(call cmd_and_fixdep,cc_o_c)
@@ -273,17 +280,19 @@ define rule_cc_o_c
 	$(call cmd,checksrc)
 	$(call cmd,checkdoc)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 	$(call cmd,gen_symversions_c)
 	$(call cmd,record_mcount)
 	$(call cmd,warn_shared_object)
 endef
 
 quiet_cmd_as_o_S = AS $(quiet_modtag)  $@
-      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool)
+      cmd_as_o_S = $(CC) $(a_flags) -c -o $@ $< $(cmd_objtool) $(cmd_min_eh_frame)
 
 define rule_as_o_S
 	$(call cmd_and_fixdep,as_o_S)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 	$(call cmd,gen_symversions_S)
 	$(call cmd,warn_shared_object)
 endef
diff --git a/scripts/Makefile.vmlinux_o b/scripts/Makefile.vmlinux_o
index 0b37bd5dc3a4..160d43fbb393 100644
--- a/scripts/Makefile.vmlinux_o
+++ b/scripts/Makefile.vmlinux_o
@@ -52,6 +52,10 @@ vmlinux-objtool-args-$(if $(KLP_SYMIDS),y)		+= --klp-symids
 
 objtool-args = $(vmlinux-objtool-args-y) --link
 
+ifdef CONFIG_UNWINDER_DWARF_CFI_MINIFY
+min-eh-frame-enabled := $(CONFIG_LTO_CLANG)
+endif
+
 # Link of vmlinux.o used for section mismatch analysis
 # ---------------------------------------------------------------------------
 
@@ -64,13 +68,15 @@ quiet_cmd_ld_vmlinux.o = LD      $@
 	$(addprefix -T , $(initcalls-lds)) \
 	--whole-archive vmlinux.a --no-whole-archive \
 	--start-group $(KBUILD_VMLINUX_LIBS) --end-group \
-	$(cmd_objtool)
+	$(cmd_objtool) \
+	$(cmd_min_eh_frame)
 
 cmd_check_function_names = $(srctree)/scripts/check-function-names.sh $@
 
 define rule_ld_vmlinux.o
 	$(call cmd_and_savecmd,ld_vmlinux.o)
 	$(call cmd,gen_objtooldep)
+	$(call cmd,gen_min_eh_framedep)
 	$(call cmd,check_function_names)
 endef
 
-- 
2.56.1.831.g720f3f5937-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
