Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D45BDC87FCA
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 00:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MoLHRYVwW+t5eEWoLNATcPE1dWNUHrUNKb9MzPyT8Io=; b=kR/Rz13B+0cmOF
	5TAO+ZxIHg+kyOwJjVA5DaPFRhQ9Evlg/2kcs47SvYKHx0hKAVTb4nSg9Zq+/XluehZCAJGKDHWoL
	JLrL0iMycsqOoGRWyxZCRFLAUcVS1yMbPVkfuYTi1zX3+1A9YO3d9cOHwRN7y4mWc3ETH77sXn3Vu
	FVF54yZOznlYeKaI8msshS+5Kx/gAWwVAqQWqJGScm/XDZWqnMx+dNY43+2RhP10uUUIHAVhKZjBn
	e+EW/bdRPHmlNFpF6XPC1e3seqBjyawgvxr32j7vzvEbecOMHjF4s/Zg2g2HgzFpD4zlxnjb2KcOR
	v9NQfu/ck9GWKyJdVHOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijK8-00000009N1H-1XJX;
	Mon, 04 Aug 2025 00:45:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uij3d-00000009L4L-3w0b
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 00:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 96323441E1;
	Mon,  4 Aug 2025 00:28:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AAEE5C4CEEB;
	Mon,  4 Aug 2025 00:28:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267285;
	bh=1KUE5bxIJPdQBz/e5JfdWEef4SoYwPSb7HUyr5wZdBM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ksdevUY6+CAYdmkplDiLc3ymtqeV91ikLjcq96hbIfP3orwtbIxi6mn50MvSBoaru
	 S5PGbndl0kGT4JtULsWYIWv15K29oIdYLOs5RJq/kcNzHt0/35gVzbpFmjWTTLWXRo
	 bRO4TUIUMvipi+JSr32RN/YYTidAz0kZW9f1Vn2yNqGxc8o5ebt8JkkuNBed5RECjW
	 PHDPFAsUGUNFsr2ODEIKdA9wmjO/2ElBoZhVk0P+VBGvmoum3GA7tSuXEfzC3+Htod
	 6PCea8jjs6nv7nOYhxOqQvR/OK08hIu59Db7y4LitP7JJUZa/OtXBHpGcoEMSmcd6e
	 sPEEgAga8mXkg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Cynthia Huang <cynthia@andestech.com>,
	Ben Zong-You Xie <ben717@andestech.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Muhammad Usama Anjum <usama.anjum@collabora.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 05/80] selftests/futex: Define SYS_futex on 32-bit architectures with 64-bit time_t
Date: Sun,  3 Aug 2025 20:26:32 -0400
Message-Id: <20250804002747.3617039-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002747.3617039-1-sashal@kernel.org>
References: <20250804002747.3617039-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15.9
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_172806_008356_C2FA4532 
X-CRM114-Status: GOOD (  13.42  )
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

From: Cynthia Huang <cynthia@andestech.com>

[ Upstream commit 04850819c65c8242072818655d4341e70ae998b5 ]

The kernel does not provide sys_futex() on 32-bit architectures that do not
support 32-bit time representations, such as riscv32.

As a result, glibc cannot define SYS_futex, causing compilation failures in
tests that rely on this syscall. Define SYS_futex as SYS_futex_time64 in
such cases to ensure successful compilation and compatibility.

Signed-off-by: Cynthia Huang <cynthia@andestech.com>
Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
Link: https://lore.kernel.org/all/20250710103630.3156130-1-ben717@andestech.com
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real compilation failure bug**: The commit addresses a
   build failure in kernel selftests on 32-bit architectures with 64-bit
   time_t, specifically riscv32. This prevents the futex selftests from
   compiling on these architectures, which is a functional bug that
   affects testing infrastructure.

2. **Simple and contained fix**: The change is minimal - it only adds a
   conditional preprocessor definition that maps `SYS_futex` to
   `SYS_futex_time64` when the former is not defined but the latter is.
   The fix is:
  ```c
  #if !defined(SYS_futex) && defined(SYS_futex_time64)
  #define SYS_futex SYS_futex_time64
  #endif
  ```

3. **No risk of regression**: The change is guarded by preprocessor
   conditionals that only activate when `SYS_futex` is not defined AND
   `SYS_futex_time64` is defined. This means it has zero impact on
   architectures where `SYS_futex` is already defined, ensuring no
   regressions on existing systems.

4. **Affects kernel testing infrastructure**: While this is in the
   selftests directory and not core kernel code, having working
   selftests is critical for kernel stability and quality assurance. The
   futex selftests are important for validating futex functionality
   across different architectures.

5. **Addresses Y2038 compatibility**: This fix is part of the broader
   Y2038 compatibility effort where 32-bit architectures are
   transitioning to 64-bit time_t. As more 32-bit architectures adopt
   64-bit time_t, this fix becomes increasingly important.

6. **Clear problem and solution**: The commit message clearly explains
   the issue (glibc cannot define SYS_futex on certain architectures)
   and provides a clean solution that maintains compatibility.

The fix follows stable kernel rules by being a minimal change that fixes
an important bug without introducing new features or architectural
changes. It's confined to the testing infrastructure and has clear
boundaries with no side effects beyond enabling compilation of the futex
selftests on affected architectures.

 tools/testing/selftests/futex/include/futextest.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/tools/testing/selftests/futex/include/futextest.h b/tools/testing/selftests/futex/include/futextest.h
index ddbcfc9b7bac..7a5fd1d5355e 100644
--- a/tools/testing/selftests/futex/include/futextest.h
+++ b/tools/testing/selftests/futex/include/futextest.h
@@ -47,6 +47,17 @@ typedef volatile u_int32_t futex_t;
 					 FUTEX_PRIVATE_FLAG)
 #endif
 
+/*
+ * SYS_futex is expected from system C library, in glibc some 32-bit
+ * architectures (e.g. RV32) are using 64-bit time_t, therefore it doesn't have
+ * SYS_futex defined but just SYS_futex_time64. Define SYS_futex as
+ * SYS_futex_time64 in this situation to ensure the compilation and the
+ * compatibility.
+ */
+#if !defined(SYS_futex) && defined(SYS_futex_time64)
+#define SYS_futex SYS_futex_time64
+#endif
+
 /**
  * futex() - SYS_futex syscall wrapper
  * @uaddr:	address of first futex
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
