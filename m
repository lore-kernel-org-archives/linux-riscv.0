Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C28EA606A338
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 00:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NmWH6aeM;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Oj62HCJ8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=b6Kvj8FDrKBfkbd/Er9D2LZ/Q1+GZZaKQdJuGjtxqPk=; b=NmWH6aeM1n9KZ0gNVLOYsbG03T
	mqYjhVfctEInaWhB6nxZSZJ0EvG2l8JJlRvtUZjf26CmMKIl+LUjGvmORxE5YxgVapGbfYmzIFD5k
	MebjP71bQl+jrikRjzoXSytXWyvrs1i1sG/L7stfKSdiX0s9PgLTiXWTyGDZfCYFFEBxwLCOSO9qh
	xBX23uIJBFSDLMWhiiPXdasE6RM0YtMHmgVSeHz6D6yHae7rGK80QaUEx4DzTNRV+hr5AoqBdEE2g
	RUyYa1+LeNUNNL5I+jKJyQLJDTuXqukjlfIRbOzEWfyyEoWjQvkDDIWl+hqdJguzpvBXJKVTqTIES
	VCVydPpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJ3K-00000008HlG-3T4o;
	Thu, 12 Nov 2026 00:52:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRJ3J-00000008Hl1-3yHn
	for linux-riscv@lists.infradead.org;
	Thu, 12 Nov 2026 00:52:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 490BB639F2;
	Thu, 12 Nov 2026 00:52:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57CA71F00A0C;
	Thu, 12 Nov 2026 00:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794444753;
	bh=DAECrafKSpt/7XFimlBzzmF1bv+Nbr5QSGfylmB/A7A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Oj62HCJ8MNvWMgP41/0dKJ+5vZvPTeLpuOtKP6rinCdhZKwIgbqeI0lqZS+osI0HZ
	 Y+Pag783baPTNnXA+kXE8OV92FSo2SLDj2LFMtDe0sWtsR8tgAb1x34m5eOsRmqFZf
	 ikDvzXgQiBAVxayAAL0RSvJ3mdC9SaQn4pDGMV0AK7jueQBciEFia3msZiFDSgJgyz
	 4A5uhczUQ5xM3fXpUtuPt13xUJ7TDQXSKB/Xn8lIuAEeHgreKrQxx1iMh5FwhPurl5
	 +ZGCasXMeihfc8F850F9r9KGdegRu3BLVhnkyz+QiEBL7Qm0FFYKDxhTiwumuyE8Vd
	 mtJywVAbN6GDA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 11 Nov 2026 17:52:06 -0700
Subject: [PATCH v2 4/6] riscv: checksum: Fix CC_HAS_ASM_GOTO_TIED_OUTPUT
 check
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261111-kconfig-toolchain-updates-v2-4-b2d9415c1757@kernel.org>
References: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
In-Reply-To: <20261111-kconfig-toolchain-updates-v2-0-b2d9415c1757@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Julian Braha <julianbraha@gmail.com>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, Charlie Jenkins <thecharlesjenkins@gmail.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1327; i=nathan@kernel.org;
 h=from:subject:message-id; bh=NbI1YZqYLAsD/6ruXbkjBAtuB6jqDayciE1k4lyC0ec=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlfeff/XDRdcEEYb+n529aHG2fdjV7fzLZV7qavf6W2x
 B7nvpNFHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi/qcZ/kpLhSlwKFhJ/iur
 q3tvLdRit0aS8dEKiflqRt51NrbVugz/4zT5D9j8cq9LrLry7GtTRu2R+pmCHhvuH4ngSwm188j
 iBAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The defined symbol is CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT, not
CC_HAS_ASM_GOTO_TIED_OUTPUT.

Fixes: 4525462dd0db ("riscv: lib: Check if output in asm goto supported")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/lib/csum.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 5d4379768e5d..c2b8986a0d39 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -142,7 +142,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
-#ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
+#ifdef CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
 	    IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
@@ -186,7 +186,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 		return csum >> 16;
 	}
 
-#endif /* CC_HAS_ASM_GOTO_TIED_OUTPUT */
+#endif /* CONFIG_CC_HAS_ASM_GOTO_TIED_OUTPUT */
 #ifndef CONFIG_32BIT
 	csum += ror64(csum, 32);
 	csum >>= 32;

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
