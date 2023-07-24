Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DEA3C0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:50:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vNQa3nPJPyUXppSGVx+gmVfsa9d7k55U/A4tNZ1o5bY=; b=ky/V7BNPUR84a7
	kD342oXLbjwPxapuxwAbUlwt6SjTi2wjihYyU6MyixvANq4i4VQnMnq/H9hmeNlxi9a3QRCdHwPlU
	kx8SVYNnQmCsdyeCSsrGvoK92GZZvnpRWIDUyNgNDDbqLjFDPlU7EKCkbM1xvTKTpk1Ude0/Hfdr/
	tTTbNpllrz5Lsr08fw9Jc5Sb+T0ydoCqEAxlrcowffFcdqFTbola8Ss2ArMA0AlFtVuWk8hybudUQ
	f10O1eJUtmy4+IqS9NaMIH3NxiSyhurPXoiXJh8/0mw2iRK456MRYFa4+Ss3qAZay1gLhwDGg/9Q+
	DzBPIbI9vjTsu8+E4dGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNv10-004JWY-2V;
	Mon, 24 Jul 2023 12:50:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuzz-004IX8-0S;
	Mon, 24 Jul 2023 12:49:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 968746115A;
	Mon, 24 Jul 2023 12:49:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 326E7C433CB;
	Mon, 24 Jul 2023 12:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202954;
	bh=oiakJxhCl2ggQgHDbaP+YYLLswWzPu+vDfVc2y5agDo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=iW4c/cKlMkXGakJEmv5ZwTIxvq878gnNDj+1oSPH1KFmgWa6wBDpZxSUhj7nvUg0R
	 C7EX0V38YzWq4SHlqfCI/khHXiWAYgGihlh5r0pD3fSIOgJLNmHqrVVQc90LoUiYV2
	 78UomftH4dyLkiXIShFrg03qx0augPdJW5PvzhQYlbrdlVazVDdixcrfac6GMQaPOH
	 psokPim4W/YjQvcX/EiPPgtL4JOiu9KUKxZMyBelYO9nJHA3UCs1i3KuzVjoznhZ4x
	 BnQckU+EdV+0GilnY0gysLZXiNFw62zJxnzQuAJbSwrSSfz/hJ1Mjfob3plWceCAWu
	 Ie1I6yA9wwfdg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:46:08 +0100
Subject: [PATCH v2 21/35] arm64/mm: Implement map_shadow_stack()
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-21-dc2c1d44c2eb@kernel.org>
References: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
In-Reply-To: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=4500; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oiakJxhCl2ggQgHDbaP+YYLLswWzPu+vDfVc2y5agDo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKktMiW5/GsUPeWzIjvMe318oOP15ClcHBNUp4G
 MyFwT8yJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5ypAAKCRAk1otyXVSH0PNoB/
 9zFHT1nbXDtnhngqR1FqjYTuHzb8PFLjwSV3lGPDApwGMZUbIiH07S2VAlsQBAKasLM8PVd9fz280e
 cMzuJUk31R6C/icE3L4wa5pjg43SqaF/ViWBiD1gfXsqb67Q4D/eizuJy8uSsDCSUT295YUVhsWqvx
 I/DggO8L0BTSmd1MeKgyqhYr+1cbQ9VuewlaI3JYErjhqxxNDo1dn6Ete7+Zyhf6IbxnHo/bI9z6Jo
 MKQyU0WANNLBpdu2O9cdoKBa59xw7dolesWpa419qwAQ3eNv1C2CKkEBXnF9ARkGRXA0ysA7CJQOJ7
 sfqPYQo9jxN0xvTRaxLXDO3AaoYW+j
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054915_295111_691B3694 
X-CRM114-Status: GOOD (  21.74  )
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

As discussed extensively in the changelog for the addition of this
syscall on x86 ("x86/shstk: Introduce map_shadow_stack syscall") the
existing mmap() and madvise() syscalls do not map entirely well onto the
security requirements for guarded control stacks since they lead to
windows where memory is allocated but not yet protected or stacks which
are not properly and safely initialised. Instead a new syscall
map_shadow_stack() has been defined which allocates and initialises a
shadow stack page.

Implement this for arm64, initialising memory allocated this way with
the top two entries in the stack being 0 (to allow detection of the end
of the GCS) and a GCS cap token (to allow switching to the newly
allocated GCS via the GCS switch instructions).

Since the x86 code has not yet been rebased to v6.5-rc1 this includes
the architecture neutral parts of Rick Edgecmbe's "x86/shstk: Introduce
map_shadow_stack syscall".

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/gcs.c               | 50 ++++++++++++++++++++++++++++++++++++++-
 include/linux/syscalls.h          |  1 +
 include/uapi/asm-generic/unistd.h |  5 +++-
 kernel/sys_ni.c                   |  1 +
 4 files changed, 55 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 64c9f9a85925..c24fe367e15a 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -52,7 +52,6 @@ unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 		return 0;
 
 	size = gcs_size(size);
-
 	addr = alloc_gcs(0, size, 0, 0);
 	if (IS_ERR_VALUE(addr))
 		return addr;
@@ -64,6 +63,55 @@ unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 	return addr;
 }
 
+SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
+{
+	unsigned long alloc_size;
+	unsigned long __user *cap_ptr;
+	unsigned long cap_val;
+	int ret;
+
+	if (!system_supports_gcs())
+		return -EOPNOTSUPP;
+
+	if (flags)
+		return -EINVAL;
+
+	if (addr % 16)
+		return -EINVAL;
+
+	if (size == 16 || size % 16)
+		return -EINVAL;
+
+	/*
+	 * An overflow would result in attempting to write the restore token
+	 * to the wrong location. Not catastrophic, but just return the right
+	 * error code and block it.
+	 */
+	alloc_size = PAGE_ALIGN(size);
+	if (alloc_size < size)
+		return -EOVERFLOW;
+
+	addr = alloc_gcs(addr, alloc_size, 0, false);
+	if (IS_ERR_VALUE(addr))
+		return addr;
+
+	/*
+	 * Put a cap token at the end of the allocated region so it
+	 * can be switched to.
+	 */
+	cap_ptr = (unsigned long __user *)(addr + size -
+					   (2 * sizeof(unsigned long)));
+	cap_val = GCS_CAP(cap_ptr);
+
+	ret = copy_to_user_gcs(cap_ptr, &cap_val, 1);
+	if (ret != 0) {
+		vm_munmap(addr, size);
+		return -EFAULT;
+	}
+
+	return addr;
+}
+
 /*
  * Apply the GCS mode configured for the specified task to the
  * hardware.
diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 03e3d0121d5e..7f6dc0988197 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -953,6 +953,7 @@ asmlinkage long sys_set_mempolicy_home_node(unsigned long start, unsigned long l
 asmlinkage long sys_cachestat(unsigned int fd,
 		struct cachestat_range __user *cstat_range,
 		struct cachestat __user *cstat, unsigned int flags);
+asmlinkage long sys_map_shadow_stack(unsigned long addr, unsigned long size, unsigned int flags);
 
 /*
  * Architecture-specific system calls
diff --git a/include/uapi/asm-generic/unistd.h b/include/uapi/asm-generic/unistd.h
index fd6c1cb585db..38885a795ea6 100644
--- a/include/uapi/asm-generic/unistd.h
+++ b/include/uapi/asm-generic/unistd.h
@@ -820,8 +820,11 @@ __SYSCALL(__NR_set_mempolicy_home_node, sys_set_mempolicy_home_node)
 #define __NR_cachestat 451
 __SYSCALL(__NR_cachestat, sys_cachestat)
 
+#define __NR_map_shadow_stack 452
+__SYSCALL(__NR_map_shadow_stack, sys_map_shadow_stack)
+
 #undef __NR_syscalls
-#define __NR_syscalls 452
+#define __NR_syscalls 453
 
 /*
  * 32 bit systems traditionally used different
diff --git a/kernel/sys_ni.c b/kernel/sys_ni.c
index 781de7cc6a4e..e137c1385c56 100644
--- a/kernel/sys_ni.c
+++ b/kernel/sys_ni.c
@@ -274,6 +274,7 @@ COND_SYSCALL(vm86old);
 COND_SYSCALL(modify_ldt);
 COND_SYSCALL(vm86);
 COND_SYSCALL(kexec_file_load);
+COND_SYSCALL(map_shadow_stack);
 
 /* s390 */
 COND_SYSCALL(s390_pci_mmio_read);

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
