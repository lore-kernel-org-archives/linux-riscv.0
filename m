Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783DAC61D9D
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:46:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RTio1E24R7LtuazDKkKXPjuFKDtH2udJrrV+h3T/mcc=; b=nA9MQzEao683PE
	P32Lpfp0/2Z1qtByeFdoY0VQkYqbaCqHhAX7Wvsz4xWjfjMSre9CVlQmKwu43dIJk3RLBwk2siq+J
	Mco8iA0VfPohZ7jqiCOzX/j6HDugs/CuQZUG3xcKRC8255Jb2bJ5H0SxZR/w7I0MRZtKLyj/t3izv
	WIwQG7AhHk3+/iKj6YnP2y5QJkimSu5jc9NUHkArx6UzX6mYvA0Zi5XrTMqJlBXNMx93WmhM4QeWD
	L85O6Chx2+XAZj/USpGIW/IesIPbpCesr4VF15vodPRiohLoabAkYy9TNHicKWm3qq3z+rApBxaK4
	GeB6YBNw5P3nZk8x8u0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5joU-001Icr-2h;
	Wed, 22 Nov 2023 09:46:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jno-001HrA-0A;
	Wed, 22 Nov 2023 09:45:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E388EB8118A;
	Wed, 22 Nov 2023 09:45:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FF98C43395;
	Wed, 22 Nov 2023 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646345;
	bh=NWVJpdky41RR5z+76XsSxPAX8JBO81FQgE/78Pibz4I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=K/G00O1WsBVKAEIul9z7M9wwqUCctNvCWPIaRc94+Gvlyf4ztcyShJLjmynNGk+0B
	 7hq8h2uawUA22gE15dEZ51ZTQ925UaN/8M9vgcTDnOwWQsuUaff39e7A4k0MYaYQei
	 kbeJ26pPSy+RavFC5jiQzP68OxdewcWNTDUx+97/iR+Wod7dBZrpJhL+zFSllgaOU4
	 tTAwtGqFpeCW/XVRsAzFRAm4U0v25Q+Vt+EYrKl876crUoM8lp3JjUPcemuqRNmigp
	 osHPuhMKVym0baNytxZlIId5GP3XNo+tBA2/HwMdSZQ13zyKoep+bol7KRP3sZl1Y6
	 5c5nQ4gyCyVog==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:33 +0000
Subject: [PATCH v7 23/39] arm64/mm: Implement map_shadow_stack()
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-23-201c483bd775@kernel.org>
References: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
In-Reply-To: <20231122-arm64-gcs-v7-0-201c483bd775@kernel.org>
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
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=3103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=NWVJpdky41RR5z+76XsSxPAX8JBO81FQgE/78Pibz4I=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0Ip6PqHo/mfAIYxGDeH30hQhlkTVEtnfk4p
 U/mjwHwk4uJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NCAAKCRAk1otyXVSH
 0MvzB/9fzWnM1qf2rhce2NWjEOKbFvvKGljLcOVUTHACXD9yQBR9F7owkcySZ9VXjzQbfvkKGXP
 9KBhY9vBnEONt/apYyW01/mhfN+uI9680+VgwQRrwPP2yyMoTRFej/ZISyD4X7zqhOohmgBMTls
 we4TRIcF7x/2ZIRovz3jyjHZW4De+AalqERXlrJXgUEBHNiMQyi97JE+muLMn0kqMhzS0KM0fqo
 EUqWgO/phoFoU4p6c8gieIGuKOJ8elT3uUiZAeB+kK2rCc7bZbL9koFjnhS4mYcFlRDToQhQpFv
 GD6HdRG8hNRI9z4hGkH/MB88HcPqkexmwToLVqmqilFiuS8b
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014548_386568_5C163013 
X-CRM114-Status: GOOD (  18.66  )
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

Implement this for arm64.  Two flags are provided, allowing applications
to request that the stack be initialised with a valid cap token at the
top of the stack and optionally also an end of stack marker above that.
We support requesting an end of stack marker alone but since this is a
NULL pointer it is indistinguishable from not initialising anything by
itself.

Since the x86 code has not yet been rebased to v6.5-rc1 this includes
the architecture neutral parts of Rick Edgecmbe's "x86/shstk: Introduce
map_shadow_stack syscall".

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/gcs.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 315bd698de86..02f8f6046c10 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -84,6 +84,67 @@ unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
 	return addr;
 }
 
+SYSCALL_DEFINE3(map_shadow_stack, unsigned long, addr, unsigned long, size, unsigned int, flags)
+{
+	unsigned long alloc_size;
+	unsigned long __user *cap_ptr;
+	unsigned long cap_val;
+	int ret = 0;
+	int cap_offset;
+
+	if (!system_supports_gcs())
+		return -EOPNOTSUPP;
+
+	if (flags & ~(SHADOW_STACK_SET_TOKEN | SHADOW_STACK_SET_MARKER))
+		return -EINVAL;
+
+	if (addr && (addr % PAGE_SIZE))
+		return -EINVAL;
+
+	if (size == 8 || size % 8)
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
+	if (flags & SHADOW_STACK_SET_TOKEN) {
+		/* Leave an extra empty frame as a top of stack marker? */
+		if (flags & SHADOW_STACK_SET_MARKER)
+			cap_offset = 2;
+		else
+			cap_offset = 1;
+
+		cap_ptr = (unsigned long __user *)(addr + size -
+						   (cap_offset * sizeof(unsigned long)));
+		cap_val = GCS_CAP(cap_ptr);
+
+		put_user_gcs(cap_val, cap_ptr, &ret);
+		if (ret != 0) {
+			vm_munmap(addr, size);
+			return -EFAULT;
+		}
+
+		/* Ensure the new cap is viaible for GCS */
+		gcsb_dsync();
+	}
+
+	return addr;
+}
+
 /*
  * Apply the GCS mode configured for the specified task to the
  * hardware.

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
