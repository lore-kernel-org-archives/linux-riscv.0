Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBCEEC47258
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 17:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DYlb3fDaJP+TztZK8P1EpPHHHw5JfDnrzhuCkWbM8uk=; b=vdV5J4X1qjqaa4
	qAlKwVdj7DSWPoeAQGSBAag3HZgDy8Reyy7kE3OFt0uVBwPVyAKt/bMmeTmXOeKKg484ExioqT5Ur
	sqLFDYOgr9baabg5Ykn//CKpS9nKN6TaLXGgbRiW43vcNEA0xwwM28M2kTnxJoBeanZPAOPQ0Aj5V
	kUjxMw1j7RqhOYeiyKmY2w/VIUTys1RC/Z6QHL1GTp2M9NQCF3eDhMP2/meBLgwXZbjor7KRDGeTF
	Y+zTXY4NYhGUDmw8xJgRnVk1tHDTxpUbEIY8LDrL73YSFNjRscCRvfzR7ATvPwnqF4agwpTDAPmxx
	x6EVorGPLxcK+Sz8rXNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3aP-00000001AFj-2gs8;
	Thu, 25 Jan 2024 17:32:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT3aM-00000001AEY-1bue
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 17:32:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4C73762292;
	Thu, 25 Jan 2024 17:32:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41D85C433F1;
	Thu, 25 Jan 2024 17:32:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706203937;
	bh=3PvCiAQrtJD/zuf2t8VwlvCpBAFoHiP16hfmstASs9E=;
	h=From:Subject:Date:To:Cc:From;
	b=CWxf9fgh7SWQbUv+w60Q5mT7c9OYxjTpVll1i2bNNiKg/wlwZujGzhs6cb7vgRveQ
	 JIbAMjVa0NuS6kCH5gSwTCOSdZJbgSsvyE1jlYQgtc3122EOKqhYbNyq/HUJEAQcCe
	 AE67+vBF68+wDM0d/uqKkmi7ddKkTU/iGyYZ/iRxhGwICCehWPNvirHw2VprPJJKCp
	 qt3DoTAajdBm5iVbw6m1bKg0sKzk1cKsHNVCok1/vJFBTxdFBYZG9gcl6D8rgWa5mT
	 LMMs1euY2mE26V3uO1k002IEp4fjCyZe3l9YU6JaJXjEz9JSshp/uSnlDr86s44SSW
	 DDLQQNqSgC02A==
From: Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH 0/2] RISC-V: Fix CONFIG_AS_HAS_OPTION_ARCH with tip of tree
 LLVM
Date: Thu, 25 Jan 2024 10:32:10 -0700
Message-Id: <20240125-fix-riscv-option-arch-llvm-18-v1-0-390ac9cc3cd0@kernel.org>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIABqbsmUC/x2MSwqFMAwAryJZv0Bbxd9VxEWtUQP+SKUI4t0Nb
 zkwMw9EEqYIbfaAUOLIx65gfxmExe8zIY/K4IwrjHUFTnyjcAwJj/NSGb2EBdc1bWhrzMNA1WA
 a72wJ+jiFNPj/u/59P/u0YW9vAAAA
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 masahiroy@kernel.org
Cc: nicolas@fjasle.eu, andy.chiu@sifive.com, conor.dooley@microchip.com, 
 linux-riscv@lists.infradead.org, linux-kbuild@vger.kernel.org, 
 llvm@lists.linux.dev, patches@lists.linux.dev, stable@vger.kernel.org, 
 Eric Biggers <ebiggers@kernel.org>, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1526; i=nathan@kernel.org;
 h=from:subject:message-id; bh=3PvCiAQrtJD/zuf2t8VwlvCpBAFoHiP16hfmstASs9E=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbZsszSfLFTrfQc+X5/21XXcmGTcwG/6/tad9ZEOjzz
 2TXzOU1HaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAi8ucZGdY+zVm9yNNafwG3
 gMmPxYyCm7Y09Pt2flr47PSRXtbDvosY/gd7PHZ1uLt4qpwAw501soe+ZT6qnpr06I+v7vSlXL5
 SQYwA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_093218_581337_AA72C403 
X-CRM114-Status: GOOD (  11.79  )
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

Hi all,

Eric reported that builds of LLVM with [1] (close to tip of tree) have
CONFIG_AS_HAS_OPTION_ARCH=n because the test for expected failure on
invalid input has started succeeding.

This Kconfig test was added because '.option arch' only causes an
assembler warning when it is unsupported, rather than a hard error,
which is what users of as-instr expect when something is unsupported.

This can be resolved by turning assembler warnings into errors with
'-Wa,--fatal-warnings' like we do with the compiler with '-Werror',
which is what the first patch does. The second patch removes the invalid
test, as the valid test is good enough with fatal warnings.

I have diffed several configurations for the different architectures
that use as-instr and I have found no issues.

I think this could go in through either the kbuild or RISC-V tree with
sufficient acks but I will let them fight over who takes it :)

[1]: https://github.com/llvm/llvm-project/commit/3ac9fe69f70a2b3541266daedbaaa7dc9c007a2a

---
Nathan Chancellor (2):
      kbuild: Add -Wa,--fatal-warnings to as-instr invocation
      RISC-V: Drop invalid test from CONFIG_AS_HAS_OPTION_ARCH

 arch/riscv/Kconfig        | 1 -
 scripts/Kconfig.include   | 2 +-
 scripts/Makefile.compiler | 2 +-
 3 files changed, 2 insertions(+), 3 deletions(-)
---
base-commit: 6613476e225e090cc9aad49be7fa504e290dd33d
change-id: 20240124-fix-riscv-option-arch-llvm-18-3cbe7b09a216

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
