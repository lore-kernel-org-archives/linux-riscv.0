Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F7C3064D
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=saM7L4m7Mvaf17sBimiSHVgKcUklHpHFoOhKTWxCZvQ=; b=yPNfLGGQRjHUqk
	6ibcjIVPYu7d7XguTCxOhwXT/bLkZHsYXhkPC2BU9c4HNakQfMP9KwuzHJpCHImbZfyS6UAGIMGHq
	pXsKQAZ9XlFi6KyQFXTyT/CECdDtM+XBPvWYXzvOCU1/qU/R3UXC6yzXqEiGv9IGqNiDqajn7RuKW
	KXNoZ77Jl5oQ5XiRjiuOYrvQvdS4c3RjdupFk+t/mY0xbQM4PputBbD8tdf9j2LX4JKZEXbQDK1vj
	IiatOxGjEeF5qg0oVmrEqSqRKjr0188cMUgd49VHoY5NSaNrmopEXoc604L0cBiHrjjTCXqcLiXTe
	lPd5LsTjDS8Nu8a5Xy9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7kP-00000003NNt-1Ixe;
	Tue, 25 Jun 2024 15:06:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7hX-00000003LDt-2DoE;
	Tue, 25 Jun 2024 15:03:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B10D5614A8;
	Tue, 25 Jun 2024 15:03:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A9D9C32786;
	Tue, 25 Jun 2024 15:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327798;
	bh=Z21AWasSolhz5J/5c3s78sHem1nY4uu+1qvn/s9636U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YDScwu9InvdeNgK+aqQ8J/hft/U+qyQUnoOjYAg6t4bAVWWn5H+aPxwHYZmdEnukq
	 dJKGVC4AfFZqiWzIsvkOEG5KEaLV2ct7AcRmq0fkCAAeiQIC//CIuGw8ea0IptNNP7
	 +Z/FctVB8JE7ZF4n49LA5JkQhXvQNzHUySkteY+FxbjZg41txQyr/W6IVgJZYtrJLb
	 otnwOy7OIfi0/GH5bFqBmeiVmSqYuDO/S+kg/pXZpyjHPC7al3EIM0fnj+s1ivXBbf
	 kxaJb+HcD2AC9v4XH+WDNWlx/1uwXXbBI6GwvuL/P+EHSeJdIFUBrOEZlm+1mKwt4I
	 vOb0ouLv4jkGA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:50 +0100
Subject: [PATCH v9 22/39] arm64/mm: Implement map_shadow_stack()
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-22-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>, Kees Cook <kees@kernel.org>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 Ross Burton <ross.burton@arm.com>, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, kvmarm@lists.linux.dev, 
 linux-fsdevel@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-mm@kvack.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=2997; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Z21AWasSolhz5J/5c3s78sHem1nY4uu+1qvn/s9636U=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmetuDgBGhsGNt6urfwiqNBknViTYtmdy0dfkzlTfV
 tuvsHI2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbgwAKCRAk1otyXVSH0BSWB/
 90CNgm4LPzeTEljHtp42jqZxx5NRjOcF5UPwn5bhwBHZt4Vvh+G0AhRI2t3RBBxfjDegG/EQulsvNL
 UwVuDcQ/kUJC1c4Os4mMIiNBCihT3EszdXXCWaxY7+Wf6MSkFVpRTKS0zItLUiSaRMTlrrBwN1T5GS
 KpQ8sGdqNjxetej3A1uVuFQH+IXyerstHNoHWT3DWh54P8V6u0EYBgERs0cEhylH9kfbVxHsBrcvgu
 Nn41IPVVWUsPcr4Zhy+Rzu8krZrPjLWx+vu9QkTq2cLR1jBXJ4WVTeC6AATc6DMgdc/C9ptIu/uSoj
 VI2F3/ySC2M3YL30Xi7WKg2x+dOUOa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080320_088758_2408D72A 
X-CRM114-Status: GOOD (  17.55  )
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

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/gcs.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index c6fae0eb9bd6..918d50ba53c6 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -141,6 +141,67 @@ unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
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
