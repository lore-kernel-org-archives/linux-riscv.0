Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32A23EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jun 2023 17:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VF3cgQvSr+VlDcOm79P5XO5Aa9ZHzAT6Yyzr6ZoxG+Q=; b=cc8jHyy1sqriO0
	azAmYudRGMSrisAL259pTl7WlmTmtIGAHqlIu/D7p0wKVIfTwfXV6ayatty5lnzZRDZPlQvyJbL+b
	KXYS2TPMBXD0Teuylut0qlApPOM7r0DOl3hL9outizp/Jf2PaSK29DJ40RIVZn//h/MB+ENEW5d/d
	RrDe8Rjol1SIl7ATVxiePAfFT7b6zb4jN43XTQu1fySnr0C3hsATUgsgz4vE4WaAWU2NeMQMFiBaG
	+XbJa0kk7vdoQBYtYk1Zl5H5wI3jauluCEBk0HIE3ijV9IetWvqgo3/oNebK5ebBSZIcugTUC6hSv
	PJYS/FUPzd2pqmooH5Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qBfQ1-00By6X-0v;
	Tue, 20 Jun 2023 17:45:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qBfPy-00By5e-2L
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jun 2023 17:45:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8518261346;
	Tue, 20 Jun 2023 17:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EEA8C433C8;
	Tue, 20 Jun 2023 17:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687283124;
	bh=s1tq1ZDjdzFB2GkT5pO6cNB1MDeTYdM68tmhr1OE9PQ=;
	h=From:Date:Subject:To:Cc:From;
	b=Bn01cZPlsTPkLSSJI+6+6aZbotW6eFX0AVgIoaXdsZrryG17lqJUyPR0gG8oTTQkf
	 fA6itNU9zy8R3YQe93nVawa9N/M9WNXVGcIJ8yiIPH+v32o7zG4nIEOEC/JWFSdIPc
	 5Bu9Lx2KdMrO2D5NlyEYt8HD2S7GRMCYdyJuSqyoY/YIystZEx8XmrvagJtfgR4YFr
	 bseQxUJxEIurhAFbR274/EgyKVOVghAaM/peJfiVqV4CNE18DPwiOlt6PMJxGCPIcj
	 GJmZMIh4YH3QoGhgoBEqauOaBZeCsG+ouHcDXytIgaZvND2+IBL5jZM6lkwunyvuMu
	 b/kDaXZWiBXTw==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 20 Jun 2023 17:44:50 +0000
Subject: [PATCH 6.3] riscv: Link with '-z norelro'
MIME-Version: 1.0
Message-Id: <20230620-6-3-fix-got-relro-error-lld-v1-1-f3e71ec912d1@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJHlkWQC/x3NywqDMBCF4VeRWXdKkoH08iqli0RHDaRJmZEii
 O9u7PLnwHc2UJbECs9uA+Ff0lRLC3vpoJ9DmRjT0BqccWS8M+iRcEwrTnVB4SwVWaQK5jwgPW4
 jWevu3kRoQgzKGCWUfj6NT9CF5Ry+ws34377AXwne+34AtHwpposAAAA=
To: gregkh@linuxfoundation.org, sashal@kernel.org
Cc: palmer@dabbelt.com, conor@kernel.org, ndesaulniers@google.com, 
 nathan@kernel.org, linux-riscv@lists.infradead.org, stable@vger.kernel.org, 
 llvm@lists.linux.dev, kernel test robot <lkp@intel.com>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838; i=nathan@kernel.org;
 h=from:subject:message-id; bh=s1tq1ZDjdzFB2GkT5pO6cNB1MDeTYdM68tmhr1OE9PQ=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCkTn27JOxd3cO3pT4z33m7YLTUn/NUSca0JUxvTwxvP/
 jrjedn5W0cpC4MYB4OsmCJL9WPV44aGc84y3jg1CWYOKxPIEAYuTgGYiLY5I8O53D8ck/R22ZhP
 TSzvFpoZ5GFtpiw3tUxzv+f2eU2xl9kZGX6+aM2+opszZa+ZUqbTpwonxznXmUqWi4RPf6Am7pF
 4mRMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230620_104526_857071_DFAD87D4 
X-CRM114-Status: GOOD (  11.72  )
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

This patch fixes a stable only patch, so it has no direct upstream
equivalent.

After a stable only patch to explicitly handle the '.got' section to
handle an orphan section warning from the linker, certain configurations
error when linking with ld.lld, which enables relro by default:

  ld.lld: error: section: .got is not contiguous with other relro sections

This has come up with other architectures before, such as arm and arm64
in commit 0cda9bc15dfc ("ARM: 9038/1: Link with '-z norelro'") and
commit 3b92fa7485eb ("arm64: link with -z norelro regardless of
CONFIG_RELOCATABLE"). Additionally, '-z norelro' is used unconditionally
for RISC-V upstream after commit 26e7aacb83df ("riscv: Allow to
downgrade paging mode from the command line"), which alluded to this
issue for the same reason. Bring 6.3 in line with mainline and link with
'-z norelro', which resolves the above link failure.

Fixes: e6d1562dd4e9 ("riscv: vmlinux.lds.S: Explicitly handle '.got' section")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202306192231.DJmWr6BX-lkp@intel.com/
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index b05e833a022d..d46b6722710f 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -7,7 +7,7 @@
 #
 
 OBJCOPYFLAGS    := -O binary
-LDFLAGS_vmlinux :=
+LDFLAGS_vmlinux := -z norelro
 ifeq ($(CONFIG_DYNAMIC_FTRACE),y)
 	LDFLAGS_vmlinux := --no-relax
 	KBUILD_CPPFLAGS += -DCC_USING_PATCHABLE_FUNCTION_ENTRY

---
base-commit: f2427f9a3730e9a1a11b69f6b767f7f2fad87523
change-id: 20230620-6-3-fix-got-relro-error-lld-397f3112860b

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
