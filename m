Return-Path: <SRS0=yFtJ=KH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2CCFC43460
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 18:04:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B3B76143C
	for <linux-riscv@archiver.kernel.org>; Wed, 12 May 2021 18:04:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1B3B76143C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=WC3Ko5+ZADvSMDifUSPrxlQm8bWMUJFlW/qOST/eOR4=; b=BNG5Z4gh9ov3khnq3+dQ3+g3Y
	SD6tDAmUrp6iNnQMdF+mZ4Y9280RLojkf2oR+4nWnnDYiZeHu4h0AtsskGBrcmG0dDnBPFxNEyJkd
	5px3JX4d/7Lv7N/B2K6sOSB1yZexOub5MQEtbZUDsrVltOhfmwVgKAY1vcmWNR57pdHIZ5qV5gDcr
	hi0cRvr9WuCgIiOwfycJKLCEhNCahT5T6PGZ/4sgBrMmY22elu0h1v/qrgupzrqPklF/jDFK8IDxf
	E0wJT7rXgZ530ENsH1qAl0dCGAsXzBghBbu8m9ypXzxs34SNTmTVAIqkgx15dmxkIrNH4/PpjBnYW
	jMJyCyhlw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lgtD9-003WJF-4d; Wed, 12 May 2021 18:03:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgtBu-003VlM-Qm
 for linux-riscv@desiato.infradead.org; Wed, 12 May 2021 18:02:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Fvg7oqfnfE00mpyHDERE8rztmCEMMbIM70TGIE6OnNc=; b=0FmgnseUQT9eOlTlJB85sbkeL3
 1EfrA3b5C3YSWlO5I0jwvkP3O1BTkAAvlIyG+TRiQo/COrpRevXvw+D9ncCHOmZQpemICn2VJSWEP
 pKdrUthcC85S1arWgV5+jc9pngcwiI+0BO37op10LqTv2zmiEbytISRqRRwOq3r8y/cEod/Pn4Cq7
 EjZ2TuQglFKxQriRAdiEC14P72jPqVrLi15XjVX5EtATVYqNy2ukjAS51U+s7AWok+dF5wI1b1lE9
 JlWsOmLdJF/B8/sqxAJpUVabNTCDAD4wxk80Uaz8gYzIgApa4L+zIp+Ni73ZTOgVExqm7u/+AJqWW
 ZJvh/4Rg==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lgtBq-00Afpu-T1
 for linux-riscv@lists.infradead.org; Wed, 12 May 2021 18:02:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64C556142D;
 Wed, 12 May 2021 18:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1620842554;
 bh=ew4M8HlQkJCi7mRSE24rJFwi4BQphLpJSQz2xNFxnQE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=I+OEpsxeDcZ1sv3iud1rc5JI6L5umPEl7CBO62+kUClqRRKMskLsoyM/Ma4MDZMau
 4sHk/NAIuJPfZ9bDIJzG5qCPVgyy2ZtOq79Pw/3j1KjRJ7jRQV0u4rjCYb/t/3nOYo
 z+HQ/GrLyekRAwLOEa7qz4x3wIpkjyKhzshaedMSyWLjQmba+kWnF+KPpH0mhkyclI
 72kyXFKGfvM69DOHAqre5NQ52Hkllih7lQZbwl2osZvLgaSDFtG98Qz2FBZ6mMCBT8
 6giX1YipR49hQL5JwJVQau0jl1UrDOVZswJ74OGGrRKW8gtVKe/F5DKdV/0NLp9+qq
 R/wB9NluaRh1A==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Nathan Chancellor <nathan@kernel.org>, Fangrui Song <maskray@google.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Sasha Levin <sashal@kernel.org>,
 linux-riscv@lists.infradead.org, clang-built-linux@googlegroups.com
Subject: [PATCH AUTOSEL 5.11 17/35] riscv: Use $(LD) instead of $(CC) to link
 vDSO
Date: Wed, 12 May 2021 14:01:47 -0400
Message-Id: <20210512180206.664536-17-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210512180206.664536-1-sashal@kernel.org>
References: <20210512180206.664536-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210512_110235_011736_E4F50F14 
X-CRM114-Status: GOOD (  15.90  )
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

From: Nathan Chancellor <nathan@kernel.org>

[ Upstream commit 7f3d349065d0c643f7f7013fbf9bc9f2c90b675f ]

Currently, the VDSO is being linked through $(CC). This does not match
how the rest of the kernel links objects, which is through the $(LD)
variable.

When linking with clang, there are a couple of warnings about flags that
will not be used during the link:

clang-12: warning: argument unused during compilation: '-no-pie' [-Wunused-command-line-argument]
clang-12: warning: argument unused during compilation: '-pg' [-Wunused-command-line-argument]

'-no-pie' was added in commit 85602bea297f ("RISC-V: build vdso-dummy.o
with -no-pie") to override '-pie' getting added to the ld command from
distribution versions of GCC that enable PIE by default. It is
technically no longer needed after commit c2c81bb2f691 ("RISC-V: Fix the
VDSO symbol generaton for binutils-2.35+"), which removed vdso-dummy.o
in favor of generating vdso-syms.S from vdso.so with $(NM) but this also
resolves the issue in case it ever comes back due to having full control
over the $(LD) command. '-pg' is for function tracing, it is not used
during linking as clang states.

These flags could be removed/filtered to fix the warnings but it is
easier to just match the rest of the kernel and use $(LD) directly for
linking. See commits

  fe00e50b2db8 ("ARM: 8858/1: vdso: use $(LD) instead of $(CC) to link VDSO")
  691efbedc60d ("arm64: vdso: use $(LD) instead of $(CC) to link VDSO")
  2ff906994b6c ("MIPS: VDSO: Use $(LD) instead of $(CC) to link VDSO")
  2b2a25845d53 ("s390/vdso: Use $(LD) instead of $(CC) to link vDSO")

for more information.

The flags are converted to linker flags and '--eh-frame-hdr' is added to
match what is added by GCC implicitly, which can be seen by adding '-v'
to GCC's invocation.

Additionally, since this area is being modified, use the $(OBJCOPY)
variable instead of an open coded $(CROSS_COMPILE)objcopy so that the
user's choice of objcopy binary is respected.

Link: https://github.com/ClangBuiltLinux/linux/issues/803
Link: https://github.com/ClangBuiltLinux/linux/issues/970
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
Reviewed-by: Fangrui Song <maskray@google.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/kernel/vdso/Makefile | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index 71a315e73cbe..ca2b40dfd24b 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -41,11 +41,10 @@ KASAN_SANITIZE := n
 $(obj)/vdso.o: $(obj)/vdso.so
 
 # link rule for the .so file, .lds has to be first
-SYSCFLAGS_vdso.so.dbg = $(c_flags)
 $(obj)/vdso.so.dbg: $(src)/vdso.lds $(obj-vdso) FORCE
 	$(call if_changed,vdsold)
-SYSCFLAGS_vdso.so.dbg = -shared -s -Wl,-soname=linux-vdso.so.1 \
-	-Wl,--build-id=sha1 -Wl,--hash-style=both
+LDFLAGS_vdso.so.dbg = -shared -s -soname=linux-vdso.so.1 \
+	--build-id=sha1 --hash-style=both --eh-frame-hdr
 
 # We also create a special relocatable object that should mirror the symbol
 # table and layout of the linked DSO. With ld --just-symbols we can then
@@ -60,13 +59,10 @@ $(obj)/%.so: $(obj)/%.so.dbg FORCE
 
 # actual build commands
 # The DSO images are built using a special linker script
-# Add -lgcc so rv32 gets static muldi3 and lshrdi3 definitions.
 # Make sure only to export the intended __vdso_xxx symbol offsets.
 quiet_cmd_vdsold = VDSOLD  $@
-      cmd_vdsold = $(CC) $(KBUILD_CFLAGS) $(call cc-option, -no-pie) -nostdlib -nostartfiles $(SYSCFLAGS_$(@F)) \
-                           -Wl,-T,$(filter-out FORCE,$^) -o $@.tmp && \
-                   $(CROSS_COMPILE)objcopy \
-                           $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
+      cmd_vdsold = $(LD) $(ld_flags) -T $(filter-out FORCE,$^) -o $@.tmp && \
+                   $(OBJCOPY) $(patsubst %, -G __vdso_%, $(vdso-syms)) $@.tmp $@ && \
                    rm $@.tmp
 
 # Extracts symbol offsets from the VDSO, converting them into an assembly file
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
