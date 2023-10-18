Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6EE1CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Oct 2023 15:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2R0O4PQP8H63R7pHXDINv3V8l74PdixQEIQAG49eH7Y=; b=NEt3b/jI1yipn9
	AE2VmRpixYS2LXlxyTaW4yZLqdLwXWnp0HhyZY5SjzrXitqqypVSmrc0IDEOcc/+yCi/emDZYu5MB
	Pjwa9l0JPrcobuE+tCZA/cW/C3mLuQ3fot/9Xw27sdaM7l+dvU2k9YGp+zDvziKFKFaNg/c5XGahg
	4MSq8y7FXR+m/JT1R6j1SslcvnuJxsFAQl53KL1iljI5x/+N3Q1KRDy4+jYxzQ5FmDwWH5Myg3eZF
	hYqshOvVkzf9+4LelwBGapI7ZdiDhNsB+ym0LXKC4ktiCTz8nsLGSSDXhYEW4KGXE9P4zcsrgE0sj
	BkIPcmqr041IQRnq7F8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8LB-00F1XI-13;
	Wed, 18 Oct 2023 15:20:09 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qt8L8-00F1Wm-2l
	for linux-riscv@lists.infradead.org;
	Wed, 18 Oct 2023 15:20:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id BB32CB823DD;
	Wed, 18 Oct 2023 15:20:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9464AC433C8;
	Wed, 18 Oct 2023 15:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697642404;
	bh=d9q2EGQopnbrrZB9hrsBcWEpKabaAuR6MB/YUqLsU4w=;
	h=From:To:Cc:Subject:Date:From;
	b=qWpvifiKtTK5o66piHOruftpghs50wXvOldPydTwAZWMgN9cLJfVLlvGl9Nucou7Q
	 ecBxT7h/Yv5+/t4yVhUiWVSYN2rBDIXXboM51HEDPFpgYttQUCpZdh7en0zSaTHw8E
	 6DyNmXSbBBt1qk2hmpZbB1eXVL2JdOlz+mbtMSfqgaQEaV4axi18xctWfmwJcwc+zu
	 xJI0epn7jgszwmZbLlESdaczmIe7PxrQUmRdpP3sY68RaoSAWPA7WB9shIl++7+0iY
	 ryu+JsPEw+Qu6jMHzajqLcdDgOltoj4CC1agv/doRuOoxHFL9MjV/+ieuT1TzsS8uO
	 IMS1ILXONw1VA==
From: Masahiro Yamada <masahiroy@kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <n.schier@avm.de>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Borislav Petkov <bp@alien8.de>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Ingo Molnar <mingo@redhat.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicholas Piggin <npiggin@gmail.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	bpf@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org
Subject: [bpf-next PATCH v2 1/4] kbuild: remove ARCH_POSTLINK from module builds
Date: Thu, 19 Oct 2023 00:19:47 +0900
Message-Id: <20231018151950.205265-1-masahiroy@kernel.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231018_082007_183640_BA1261C7 
X-CRM114-Status: UNSURE (   7.86  )
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

The '%.ko' rule in arch/*/Makefile.postlink does nothing but call the
'true' command.

Remove the meaningless code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Reviewed-by: Nicolas Schier <n.schier@avm.de>
---

(no changes since v1)

 arch/mips/Makefile.postlink    | 3 ---
 arch/powerpc/Makefile.postlink | 3 ---
 arch/riscv/Makefile.postlink   | 3 ---
 arch/x86/Makefile.postlink     | 3 ---
 scripts/Makefile.modfinal      | 5 +----
 5 files changed, 1 insertion(+), 16 deletions(-)

diff --git a/arch/mips/Makefile.postlink b/arch/mips/Makefile.postlink
index 34e3bd71f3b0..6cfdc149d3bc 100644
--- a/arch/mips/Makefile.postlink
+++ b/arch/mips/Makefile.postlink
@@ -31,9 +31,6 @@ ifeq ($(CONFIG_RELOCATABLE),y)
 	$(call if_changed,relocs)
 endif
 
-%.ko: FORCE
-	@true
-
 clean:
 	@true
 
diff --git a/arch/powerpc/Makefile.postlink b/arch/powerpc/Makefile.postlink
index 1f860b3c9bec..ae5a4256b03d 100644
--- a/arch/powerpc/Makefile.postlink
+++ b/arch/powerpc/Makefile.postlink
@@ -35,9 +35,6 @@ ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_check)
 endif
 
-%.ko: FORCE
-	@true
-
 clean:
 	rm -f .tmp_symbols.txt
 
diff --git a/arch/riscv/Makefile.postlink b/arch/riscv/Makefile.postlink
index a46fc578b30b..829b9abc91f6 100644
--- a/arch/riscv/Makefile.postlink
+++ b/arch/riscv/Makefile.postlink
@@ -36,9 +36,6 @@ ifdef CONFIG_RELOCATABLE
 	$(call if_changed,relocs_strip)
 endif
 
-%.ko: FORCE
-	@true
-
 clean:
 	@true
 
diff --git a/arch/x86/Makefile.postlink b/arch/x86/Makefile.postlink
index 936093d29160..fef2e977cc7d 100644
--- a/arch/x86/Makefile.postlink
+++ b/arch/x86/Makefile.postlink
@@ -34,9 +34,6 @@ ifeq ($(CONFIG_X86_NEED_RELOCS),y)
 	$(call cmd,strip_relocs)
 endif
 
-%.ko: FORCE
-	@true
-
 clean:
 	@rm -f $(OUT_RELOCS)/vmlinux.relocs
 
diff --git a/scripts/Makefile.modfinal b/scripts/Makefile.modfinal
index b3a6aa8fbe8c..8568d256d6fb 100644
--- a/scripts/Makefile.modfinal
+++ b/scripts/Makefile.modfinal
@@ -28,14 +28,11 @@ quiet_cmd_cc_o_c = CC [M]  $@
 %.mod.o: %.mod.c FORCE
 	$(call if_changed_dep,cc_o_c)
 
-ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
-
 quiet_cmd_ld_ko_o = LD [M]  $@
       cmd_ld_ko_o +=							\
 	$(LD) -r $(KBUILD_LDFLAGS)					\
 		$(KBUILD_LDFLAGS_MODULE) $(LDFLAGS_MODULE)		\
-		-T scripts/module.lds -o $@ $(filter %.o, $^);		\
-	$(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
+		-T scripts/module.lds -o $@ $(filter %.o, $^)
 
 quiet_cmd_btf_ko = BTF [M] $@
       cmd_btf_ko = 							\
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
