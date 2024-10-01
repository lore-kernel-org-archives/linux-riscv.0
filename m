Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC30CE7D0D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 11:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zc5qEEVhDNInw7fDPwYVam5MACp8SwnK8bq3ylH7FkI=; b=FZQBSiWWj3VJ3I
	SM5ib76xxKZ2T3zACXlUUFIZ67qLxDEscg1OHqY6Y0tlwCW+kBBdCqV61rE5dMmK0bVK8ISCNzfr8
	GBrGGlKXxP0VyNDgPtwjRgTJqahEYTDFCqSIME4HuPRBm+8WqKijHV6eQJmepkzt/wvJofW1U+P6m
	5KmtylJAbLah2jQiLg4MOGdsmMwsG3H/aFpNJ5zwJl7tXMfT4jRMPcdyvoBqv029sV87Vt5rvNnc8
	0T9VEaR0lh2s9d8bQlY7GqsZrPHJLR9ai59GcMDbeeicgrAF9S6KJoNCLFLkyUXN3q/uIQQamgBgd
	jqceipKHvgpd599kf5/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svb3a-00000002Vpp-2kz3;
	Tue, 01 Oct 2024 11:28:42 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svb3X-00000002Vp2-3msN
	for linux-riscv@lists.infradead.org;
	Tue, 01 Oct 2024 11:28:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BEC68A428B3;
	Tue,  1 Oct 2024 11:28:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F70C4CEC6;
	Tue,  1 Oct 2024 11:28:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727782118;
	bh=KmqvyWGAP2MUjMmA9fNXKIZ1pZgMR6vCNbIUx1juy7s=;
	h=From:To:Cc:Subject:Date:From;
	b=KuiLKoyWUokatFDV/DS7e+wT0IlNXFkx2mIt+uIFiJlUmIWuiiUXQTiYJyZ8jOW8u
	 Y0WSBveMHbSBHoVEm4vURkR18zchCGaPgbkvf1dO2j1/BsvpY16fMY6unMpPcXfjWo
	 n/QiROVPt2wJiLcONyWz0jspT5eWySVr2ytUvAgujdhLNqqwC7ImGvaLWP/yERBfk/
	 rh8FMe76dqHM91vXrMAuA60dffuvvou+aq45Sd3rPI8VIbwSyehYUAXqQsyrzBcL/S
	 sjT2iEtNoboVhtRYy4LKHYqIZASa1k9iLoP3S/zwL4jf5/sWz9Cn8O9ET0/S2gtOJh
	 ilgZWKRZIOGgQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Jason Montleon <jmontleo@redhat.com>,
	ojeda@kernel.org,
	alex.gaynor@gmail.com,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	benno.lossin@proton.me,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	morbo@google.com,
	justinstitt@google.com,
	rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v1] RISC-V: disallow gcc + rust builds
Date: Tue,  1 Oct 2024 12:28:13 +0100
Message-ID: <20241001-playlist-deceiving-16ece2f440f5@spud>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=C14oYIXOukeZfX/D92cINn4baWT04L73uEfZDoXdTw0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGm/75w7rpbkt043eH983KZld+rslI76i/J0Hj/h12n65 1fGyeyOjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzE2Jrhr1zlc+G/WWc6cxl7 M8MzWd85zd3cvvxAy6ltd85HtDUG9DL8lbi7+/ausgyR0JSKqFOxq8KtDGYmTk504zm26PO2xrT DnAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_042840_099214_9102DC5E 
X-CRM114-Status: GOOD (  10.91  )
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
Reported-by: Jason Montleon <jmontleo@redhat.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---

Palmer, this is yours to take.

CC: jmontleo@redhat.com
CC: ojeda@kernel.org
CC: alex.gaynor@gmail.com
CC: boqun.feng@gmail.com
CC: gary@garyguo.net
CC: bjorn3_gh@protonmail.com
CC: benno.lossin@proton.me
CC: a.hindborg@kernel.org
CC: aliceryhl@google.com
CC: paul.walmsley@sifive.com
CC: palmer@dabbelt.com
CC: nathan@kernel.org
CC: ndesaulniers@google.com
CC: morbo@google.com
CC: justinstitt@google.com
CC: rust-for-linux@vger.kernel.org
CC: linux-riscv@lists.infradead.org
CC: llvm@lists.linux.dev
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
index 22dc5ea4196ce..76843584960c2 100644
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
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
