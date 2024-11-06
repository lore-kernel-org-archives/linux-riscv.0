Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92AA4D3E783
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 02:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Wm5t2jwoYZ0N4gI7uLaEYaTEtZR1gppnnWx6vXMcSWk=; b=UziXZVFr8FLxze
	V0d5Y6mytYhPCVEP7ISRK+UIRJ+SVmsWHn47otlxMOCrh/YpJTrO8NjDx/kNXkDzf1u8jDlPgiqET
	emHcORCmRruWYdR2+ClyOQEHWQICFuNrejbhmUXNL9GNl7YIuZCnLfW9fpaTENDKDJfmvCTqGmktu
	uveo23r356RSlo9HDxcD9Z9B1I0FlbaswLszz2Py3u1+2tszVWS00lEVbrUZwtznllrhhFCNNmPHI
	siVhkz8TA1OVF5VWyiknlWSAKkfN51CaUpY05rfc8RZp6VJaggd1ORpBn1rZNCmPYJECeVX6t0HVi
	60btQwFmiVINN76pv2oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VTU-00000001OiS-0YZk;
	Wed, 06 Nov 2024 02:08:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8VTQ-00000001Ogu-0U7X
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 02:08:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B890A5C4904;
	Wed,  6 Nov 2024 02:07:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9674AC4CECF;
	Wed,  6 Nov 2024 02:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730858923;
	bh=6RdsDJCekACBSQ/decuXvIXkG38AIIzXKc9s9K/m2gg=;
	h=From:To:Cc:Subject:Date:From;
	b=bLHmkCgUJ8DNphFMJIs7Y3zWta2o/5rLa7tqziceKYdXxus72OVZ4cX+WT3Owi4tH
	 GeCEDoEbkPXfWNLhFNVRVU3ay+cNaMYJa2ReoghcKoWNjHPVVVZiSKrXE4aKEMlWiu
	 H2tS88ZzFwO7Re5Wmuz1xRquMvrWiIZAYE8kPVY1o1dNUEzaUzR9cfq2ejIEddVgFN
	 wullEsRfSuLLKnImSGCS7lZiFgtk8mlvUoks/y7F+tzmnA9rmXFNGKZGhkjzQAC4Qo
	 dnAnympltpJLRlZvIwnNaoabTBpI8AijOmlIq0rBxWkCkSfY+sT2XPQybyA8l/2DxZ
	 XsNTTbAkmF/1A==
From: Sasha Levin <sashal@kernel.org>
To: stable@vger.kernel.org,
	conor.dooley@microchip.com
Cc: Jason Montleon <jmontleo@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	llvm@lists.linux.dev
Subject: FAILED: Patch "RISC-V: disallow gcc + rust builds" failed to apply to v6.11-stable tree
Date: Tue,  5 Nov 2024 21:08:39 -0500
Message-ID: <20241106020840.164364-1-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Patchwork-Hint: ignore
X-stable: review
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_180844_407870_58F83BFE 
X-CRM114-Status: GOOD (  14.16  )
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

The patch below does not apply to the v6.11-stable tree.
If someone wants it applied there, or to any other stable or longterm
tree, then please email the backport, including the original git commit
id to <stable@vger.kernel.org>.

Thanks,
Sasha

------------------ original commit in Linus's tree ------------------

From 33549fcf37ec461f398f0a41e1c9948be2e5aca4 Mon Sep 17 00:00:00 2001
From: Conor Dooley <conor.dooley@microchip.com>
Date: Tue, 1 Oct 2024 12:28:13 +0100
Subject: [PATCH] RISC-V: disallow gcc + rust builds

During the discussion before supporting rust on riscv, it was decided
not to support gcc yet, due to differences in extension handling
compared to llvm (only the version of libclang matching the c compiler
is supported). Recently Jason Montleon reported [1] that building with
gcc caused build issues, due to unsupported arguments being passed to
libclang. After some discussion between myself and Miguel, it is better
to disable gcc + rust builds to match the original intent, and
subsequently support it when an appropriate set of extensions can be
deduced from the version of libclang.

Closes: https://lore.kernel.org/all/20240917000848.720765-2-jmontleo@redhat.com/ [1]
Link: https://lore.kernel.org/all/20240926-battering-revolt-6c6a7827413e@spud/ [2]
Fixes: 70a57b247251a ("RISC-V: enable building 64-bit kernels with rust support")
Cc: stable@vger.kernel.org
Reported-by: Jason Montleon <jmontleo@redhat.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Miguel Ojeda <ojeda@kernel.org>
Reviewed-by: Nathan Chancellor <nathan@kernel.org>
Link: https://lore.kernel.org/r/20241001-playlist-deceiving-16ece2f440f5@spud
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/riscv/Kconfig                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 750ff371570a0..54be7ddf3e57a 100644
--- a/Documentation/rust/arch-support.rst
+++ b/Documentation/rust/arch-support.rst
@@ -17,7 +17,7 @@ Architecture   Level of support  Constraints
 =============  ================  ==============================================
 ``arm64``      Maintained        Little Endian only.
 ``loongarch``  Maintained        \-
-``riscv``      Maintained        ``riscv64`` only.
+``riscv``      Maintained        ``riscv64`` and LLVM/Clang only.
 ``um``         Maintained        \-
 ``x86``        Maintained        ``x86_64`` only.
 =============  ================  ==============================================
diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 62545946ecf43..f4c570538d55b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -177,7 +177,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if RUSTC_SUPPORTS_RISCV
+	select HAVE_RUST if RUSTC_SUPPORTS_RISCV && CC_IS_CLANG
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
-- 
2.43.0





_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
