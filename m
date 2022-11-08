Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625F1C4332F
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Nov 2022 17:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ibMVU3nIKXAAD0mJnVURJDLyq+Nr0+QQPoLn93AYHN8=; b=MsKSlcwTXGYTrc
	jr7UUEYko2J8n1L8OrVClsr1WkzMc/Wr/c5CU+T3XtdFjJSb1bcEoYMq2sVTi0oMHclBE50y2IBFl
	wFTJv2rmmlGtdRoeBRzEiB8aE9ser5AmkZoBp9QfJNvclGniQRbCFqAdyJhnyJ8zYci0TYGKHQaxk
	B+N4CMJHl6UE3JYn3o+FGIbcjOgEBNvJzSy1EGB6pj00lxd6F36H6eWNLydmz7MgFjXnaPIZIf/EN
	Y2+2IZYC0RgKM0FnW0F9d0I9gJs3FJWyEX1PzYqHxNe2xbcwxba8ih/gwIput4aDtWEJiS8uCC1A/
	0DErXwqavoxyTuO5yLkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSAY-006yrm-GH; Tue, 08 Nov 2022 17:13:50 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osSAV-006yqj-Fl
	for linux-riscv@lists.infradead.org; Tue, 08 Nov 2022 17:13:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 041BEB81BAC;
	Tue,  8 Nov 2022 17:13:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24078C433C1;
	Tue,  8 Nov 2022 17:13:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667927621;
	bh=Q9Hg77J+hEn8L00u0qa6BZ7pMVT5amjAWhxu/7L9ZfU=;
	h=From:To:Cc:Subject:Date:From;
	b=Lo6dFWKcTlR9+dBOhuw/BumPrjFGR31fDofSYIHW4hMcd+70Ib7hElVF+T04rsJBd
	 dttFiSyH4eZG7yDGwrdqJsrYliD7HmYwxmfbB+ZeNgqW+xUE8l9e+tHIMb0uz0CKn3
	 zSqzGk3cgxLirqeItEJIKNTiWAu6fHIW3x+vO9EWgKG27jr3oeP3VXM6jco8a2N8l3
	 DbpIhLnsy98oVwwEit8gHJS7Kqx0ZKhoQ3TFW674pEW+EpBp10prQz2wqwYrKlWTev
	 Esnkqw7i+WHgTrojt5j2AcAxDDlxb1xuz5ilVudLyjxyHrT/4Qqr/T/h3Zcgwd4QII
	 Cl8v5Jp+qcs9g==
From: Nathan Chancellor <nathan@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	patches@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] RISC-V: vdso: Do not add missing symbols to version section in linker script
Date: Tue,  8 Nov 2022 10:13:23 -0700
Message-Id: <20221108171324.3377226-1-nathan@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221108_091347_712548_2F06CC08 
X-CRM114-Status: GOOD (  10.36  )
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

Recently, ld.lld moved from '--undefined-version' to
'--no-undefined-version' as the default, which breaks the compat vDSO
build:

  ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_gettimeofday' failed: symbol not defined
  ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_clock_gettime' failed: symbol not defined
  ld.lld: error: version script assignment of 'LINUX_4.15' to symbol '__vdso_clock_getres' failed: symbol not defined

These symbols are not present in the compat vDSO or the regular vDSO for
32-bit but they are unconditionally included in the version section of
the linker script, which is prohibited with '--no-undefined-version'.

Fix this issue by only including the symbols that are actually exported
in the version section of the linker script.

Link: https://github.com/ClangBuiltLinux/linux/issues/1756
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/kernel/vdso/Makefile   | 3 +++
 arch/riscv/kernel/vdso/vdso.lds.S | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/vdso/Makefile b/arch/riscv/kernel/vdso/Makefile
index f2e065671e4d..82416ebf4cca 100644
--- a/arch/riscv/kernel/vdso/Makefile
+++ b/arch/riscv/kernel/vdso/Makefile
@@ -28,6 +28,9 @@ obj-vdso := $(addprefix $(obj)/, $(obj-vdso))
 
 obj-y += vdso.o
 CPPFLAGS_vdso.lds += -P -C -U$(ARCH)
+ifneq ($(filter vgettimeofday, $(vdso-syms)),)
+CPPFLAGS_vdso.lds += -DHAS_VGETTIMEOFDAY
+endif
 
 # Disable -pg to prevent insert call site
 CFLAGS_REMOVE_vgettimeofday.o = $(CC_FLAGS_FTRACE) -Os
diff --git a/arch/riscv/kernel/vdso/vdso.lds.S b/arch/riscv/kernel/vdso/vdso.lds.S
index 01d94aae5bf5..150b1a572e61 100644
--- a/arch/riscv/kernel/vdso/vdso.lds.S
+++ b/arch/riscv/kernel/vdso/vdso.lds.S
@@ -68,9 +68,11 @@ VERSION
 	LINUX_4.15 {
 	global:
 		__vdso_rt_sigreturn;
+#ifdef HAS_VGETTIMEOFDAY
 		__vdso_gettimeofday;
 		__vdso_clock_gettime;
 		__vdso_clock_getres;
+#endif
 		__vdso_getcpu;
 		__vdso_flush_icache;
 	local: *;

base-commit: f0c4d9fc9cc9462659728d168387191387e903cc
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
