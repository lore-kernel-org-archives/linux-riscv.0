Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FB27C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 16:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CsV/bx+Ixa4NSlH1ZDcU5XZAwfSmJM7+QXhnxHzf4CM=; b=itTwLAwLtIFT0w
	2xHGBBMeM9AjtDp3zI/A/9kH2Lp99Xg/71is1EYCepIJ1sJbx8x7Ra9WPWFeNdSwQnqRbW3BSNjWw
	BEqX1bG7cbWeJK61vSJkoM9HtgbGREO3/hq8D5nu+I3QcJx3/kum/02I0sWCfiq1klwz9IDMFm8Ah
	eCMWGSBho/qYSZRGh6/2X2RnwLjziiYL+s24xrx9Duyq9fdxbDatiUSFf2OD4VxCMbsfl1LrGUWGx
	yn5ZtQesoxrv6ZQBmtlfHd0qsg5XQIq90b1/lNrZvZtPEJV5mkyYZbB6sgWD9rPBpxzBgeKlN9YlS
	etd81nFkQKEKHj885WBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzi7X-007Zzf-1P; Tue, 21 Dec 2021 16:36:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mzi7T-007Zww-HB
 for linux-riscv@lists.infradead.org; Tue, 21 Dec 2021 16:36:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 028D5616AA;
 Tue, 21 Dec 2021 16:36:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4D353C36AEA;
 Tue, 21 Dec 2021 16:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640104566;
 bh=faphGyURWtXEOMLKUCGGnY6spV2KyoBcjjwgGbOApL0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aR/lUQ3Dl/Yrlw2FPQpM8gDT3ARBPF5FXM+b7HA2ng28yMnFUO6rxFWxKmsmJT0Xi
 cAfsd31NvOSrnEzrHbhpPRcWHE2pLL+b2JfaPqbFeqiERHGx60Xl4qOnp/YWbCw4Qh
 tbtJ2+eCNx5b3jmpR6mzxVUTb18DrtjHAYBAUmNYgSTE8YF0Z00XgSp1RfER8jkFu9
 OCEAMYW7ntoWpg+XcHMIy8zGsYdNXzsw7D42lTB+uWG1PvMAtxyo2D0BgaTS1YHe8R
 F9+/wdd2guvw60dADD1QmDVxx14WxZA/sgjV0FraFibyNP0e1QxLyaW2mjTuCF/IUH
 m8U61P3lOguJQ==
From: guoren@kernel.org
To: guoren@kernel.org, palmer@dabbelt.com, arnd@arndb.de, anup.patel@wdc.com,
 gregkh@linuxfoundation.org, liush@allwinnertech.com, wefu@redhat.com,
 drew@beagleboard.org, wangjunqiang@iscas.ac.cn, lazyparser@gmail.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-csky@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 05/13] riscv: compat: syscall: Add compat_sys_call_table
 implementation
Date: Wed, 22 Dec 2021 00:35:24 +0800
Message-Id: <20211221163532.2636028-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221163532.2636028-1-guoren@kernel.org>
References: <20211221163532.2636028-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_083607_676863_63D7E293 
X-CRM114-Status: GOOD (  14.35  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Implement compat_syscall_table.c with compat_sys_call_table & fixup
system call such as truncate64,pread64,fallocate which need two
regs to indicate 64bit-arg (copied from arm64).

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/include/asm/syscall.h         |  3 +
 arch/riscv/kernel/compat_syscall_table.c | 84 ++++++++++++++++++++++++
 2 files changed, 87 insertions(+)
 create mode 100644 arch/riscv/kernel/compat_syscall_table.c

diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
index 7ac6a0e275f2..4ff98a22ef24 100644
--- a/arch/riscv/include/asm/syscall.h
+++ b/arch/riscv/include/asm/syscall.h
@@ -16,6 +16,9 @@
 
 /* The array of function pointers for syscalls. */
 extern void * const sys_call_table[];
+#ifdef CONFIG_COMPAT
+extern void * const compat_sys_call_table[];
+#endif
 
 /*
  * Only the low 32 bits of orig_r0 are meaningful, so we return int.
diff --git a/arch/riscv/kernel/compat_syscall_table.c b/arch/riscv/kernel/compat_syscall_table.c
new file mode 100644
index 000000000000..9b81fb9a8683
--- /dev/null
+++ b/arch/riscv/kernel/compat_syscall_table.c
@@ -0,0 +1,84 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#define __SYSCALL_COMPAT
+#undef __LP64__
+
+#include <linux/compat.h>
+#include <linux/syscalls.h>
+#include <asm-generic/mman-common.h>
+#include <asm-generic/syscalls.h>
+#include <asm/syscall.h>
+
+SYSCALL_DEFINE6(mmap2, unsigned long, addr, unsigned long, len,
+	unsigned long, prot, unsigned long, flags,
+	unsigned long, fd, unsigned long, offset)
+{
+	if ((prot & PROT_WRITE) && (prot & PROT_EXEC))
+		if (unlikely(!(prot & PROT_READ)))
+			return -EINVAL;
+
+	return ksys_mmap_pgoff(addr, len, prot, flags, fd, offset);
+}
+
+#define arg_u32p(name)  u32, name##_lo, u32, name##_hi
+
+#define arg_u64(name)   (((u64)name##_hi << 32) | \
+			 ((u64)name##_lo & 0xffffffff))
+
+COMPAT_SYSCALL_DEFINE3(truncate64, const char __user *, pathname,
+		       arg_u32p(length))
+{
+	return ksys_truncate(pathname, arg_u64(length));
+}
+
+COMPAT_SYSCALL_DEFINE3(ftruncate64, unsigned int, fd, arg_u32p(length))
+{
+	return ksys_ftruncate(fd, arg_u64(length));
+}
+
+COMPAT_SYSCALL_DEFINE6(fallocate, int, fd, int, mode,
+		       arg_u32p(offset), arg_u32p(len))
+{
+	return ksys_fallocate(fd, mode, arg_u64(offset), arg_u64(len));
+}
+
+COMPAT_SYSCALL_DEFINE5(pread64, unsigned int, fd, char __user *, buf,
+		       size_t, count, arg_u32p(pos))
+{
+	return ksys_pread64(fd, buf, count, arg_u64(pos));
+}
+
+COMPAT_SYSCALL_DEFINE5(pwrite64, unsigned int, fd,
+		       const char __user *, buf, size_t, count, arg_u32p(pos))
+{
+	return ksys_pwrite64(fd, buf, count, arg_u64(pos));
+}
+
+COMPAT_SYSCALL_DEFINE6(sync_file_range, int, fd, arg_u32p(offset),
+		       arg_u32p(nbytes), unsigned int, flags)
+{
+	return ksys_sync_file_range(fd, arg_u64(offset), arg_u64(nbytes),
+				    flags);
+}
+
+COMPAT_SYSCALL_DEFINE4(readahead, int, fd, arg_u32p(offset),
+		       size_t, count)
+{
+	return ksys_readahead(fd, arg_u64(offset), count);
+}
+
+COMPAT_SYSCALL_DEFINE6(fadvise64_64, int, fd, int, advice, arg_u32p(offset),
+		       arg_u32p(len))
+{
+	return ksys_fadvise64_64(fd, arg_u64(offset), arg_u64(len), advice);
+}
+
+#undef __SYSCALL
+#define __SYSCALL(nr, call)      [nr] = (call),
+
+asmlinkage long compat_sys_rt_sigreturn(void);
+
+void * const compat_sys_call_table[__NR_syscalls] = {
+	[0 ... __NR_syscalls - 1] = sys_ni_syscall,
+#include <asm/unistd.h>
+};
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
