Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D63ED44D62
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Nov 2024 13:41:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QM0BjgIv030agsJPG0Z5UiFi6Cs6e5akjVs01NTx9WY=; b=RczL+HwHI6bpSW
	oOAVmN3qddae4ISm+Di0o3vDAztsrmxQ+T+wMwEoLbUPKrv2BqSvnIjV0aA3GPiL13vgKudY43RL7
	o37IBSGIoup2C34t0FQVXG6E2BcvEpjABTiu/JID2RtGh2srx0LGgGlJT09qVL6WjQlLSpXMaxHdu
	GD3oGmQ5RH84iL2l03LxxJGVc3v4SC05Xq+q6tFcCfgYndAIQ6GcHpmPMBXxhN7qCLFJNx1/v77da
	Wa0c/q7SDSYNFvJ+x1F3JOZMSBnQGBh9yibhWPpWTh/rWrKBxZaNqPFKWXRLv7oKhwkyJWdMifDOy
	sHfY9HI9otwI5dHM97YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gHL-00000003SGY-1zNR;
	Wed, 06 Nov 2024 13:40:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8fp4-00000003MdA-2CDl
	for linux-riscv@lists.infradead.org;
	Wed, 06 Nov 2024 13:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 128BF5C554C;
	Wed,  6 Nov 2024 13:11:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BADBEC4CED5;
	Wed,  6 Nov 2024 13:11:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730898705;
	bh=o8NUUAROuMdB5iMmGq2XtJYBOqpHtSMA1C8K+hzraOA=;
	h=From:To:Cc:Subject:Date:From;
	b=oA3GyQCvjEAS3StYeFDZ0cbFsh4iorfp7OS+tfZOIxZDDdoKgU53wTxlz1pkq6UhD
	 X9B0dYsIvubDmd8fj8URBpkgAbsEzRkNc9AmYlb03CKx0LsgfgrdCm1XrYcGX+tFEJ
	 JqttBdWtv5T2/CEE2BpKSLose8m/DebXsoBkyyc7iWaHmwEDyZDXubJzv/UZL/OAY4
	 IIt4hRY2nWXO88oYttGzNCI/gax2zBMHo2FgN+UOBQTbmTh8SOuI+bqAap33O1DDD5
	 YC0XAQOjfsP8H1gKsr0pNiEwai/OLHpngnl8DiH9QWBvrNczNDBQ+TtRX/Oc/lKg5w
	 LVipCVCoCJZcw==
From: Conor Dooley <conor@kernel.org>
To: stable@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	Jason Montleon <jmontleo@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [for 6.11 PATCH] RISC-V: disallow gcc + rust builds
Date: Wed,  6 Nov 2024 13:11:29 +0000
Message-ID: <20241106-happily-unknotted-9984b07a414e@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2704; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=SfxwdshweJyyHwN/yk+AuvRIn3dVc1kElFVGb9Tevp8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOna2QwT42fXMVs1Kmb/6m7b6dFdNV3HwmRLhg3DA86pF TbpBk86SlkYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMBG/AEaGZ780C97ZfEj/+frL /M08+7hjupaueH/i9Jy94UrxP9PWNzH8z54vtWW+wdS7J+decX63NHPtKxl+Xr+PgStMO4S17zy pYQUA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_051146_674353_AFBBE722 
X-CRM114-Status: GOOD (  10.59  )
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

From: Conor Dooley <conor.dooley@microchip.com>

commit 33549fcf37ec461f398f0a41e1c9948be2e5aca4 upstream

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
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/rust/arch-support.rst | 2 +-
 arch/riscv/Kconfig                  | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/rust/arch-support.rst b/Documentation/rust/arch-support.rst
index 750ff371570a..54be7ddf3e57 100644
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
index d11c2479d8e1..6651a5cbdc27 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -172,7 +172,7 @@ config RISCV
 	select HAVE_REGS_AND_STACK_ACCESS_API
 	select HAVE_RETHOOK if !XIP_KERNEL
 	select HAVE_RSEQ
-	select HAVE_RUST if 64BIT
+	select HAVE_RUST if 64BIT && CC_IS_CLANG
 	select HAVE_SAMPLE_FTRACE_DIRECT
 	select HAVE_SAMPLE_FTRACE_DIRECT_MULTI
 	select HAVE_STACKPROTECTOR
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
