Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1ADEC71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FkpP+AdRPypt90e9L7GTOsL7Fh6ATb1WzJNj9tZk5S8=; b=HzlFXu+yJVfyD3
	kdDU509sE+vClMuejGjrdbmeD2lhIDv5m4Io0GR9bLYr8IgB+LEWryrDn4vHjShA1Xh8tcmF8uch5
	/D3+PPGX7aKdjLONIircE4VezoqwIRYMjieJLTN0ndSo0KXEC084CKsNa0OVhblf/hRCMWumEyiQJ
	lriaqJrjIkfDXPIsNjTJbZsad3dJG2oGm7UBpACD6RH5NSmbvEFfI3swuKY5NVW1yYLZ0hcOI8F8M
	rGJol7rubU1QopkWrEf2kB4VDyfb7uk0PLmKP5PPdSZQu2/EWTa6fLOfqAPLLCivbjX64RbeTDC8e
	BbhLWGMMK59w56z5jfMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSOD-0000000HTkD-1qB3;
	Wed, 28 Aug 2024 23:47:49 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS8L-0000000HMxi-0Dgu;
	Wed, 28 Aug 2024 23:31:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1ABF5CE180A;
	Wed, 28 Aug 2024 23:31:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38069C4CEC4;
	Wed, 28 Aug 2024 23:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887882;
	bh=QZaW0hCLawS24gfsrOh/tioIJLs0ZSMp+GQyLn6Fkyg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fovBxTdhiD2VqYg10EgfUytuiZHI0AoPc/51GcFsjNd40/y9kJ89gK5C6JqZ+uXAk
	 J+9y0SvG8fBAf/r9+hJeLKROupJ0IvBIkJAmdSRG/VSulTsQPHsmOBhhvWIF0BSAkV
	 gIT5XmBo1uMl0Datb23vtxSiWJnKrQrKC/ygiCngnSY2HD5bLDu5dPhSVnUoebrmvD
	 bULwgQ8WOce3MUoBxGlGZb4vz36yk/xjlSVuKzvFWtLJPXgIdN97N78FQkMXQSlqt7
	 vRJhZFShmSy8+aV/L3BWwCytVYSKv3zdGbg24IFfjFYvbauMbS5mMMYT4Xtghrg0C4
	 2lrilOvILazxw==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:39 +0100
Subject: [PATCH v12 23/39] arm64/mm: Implement map_shadow_stack()
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-23-42fec947436a@kernel.org>
References: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
In-Reply-To: <20240829-arm64-gcs-v12-0-42fec947436a@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=3111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=QZaW0hCLawS24gfsrOh/tioIJLs0ZSMp+GQyLn6Fkyg=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KKThZ/6LRaIIP82jKaeHi/u1K7PI3KtMSJ/Eyu
 a0lLpT2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yigAKCRAk1otyXVSH0PJmB/
 9UdvhfrTKb0KEJxHdMW577qcwze1tFePB+X559s8pp/SgfIA+XNNhYVab1hTQHpVx/ibLczLzsUhgf
 qtIoJ8wh9/MPww97uUH1ALY8ZN+OM3AuUyEVSIVawsSdoZJgKfehXQ4tSjW5pHxmsFJk0pDVUCtKD6
 zMjRggMvXV95HoUi1TX4UJWldJLrzu+TIcN2ZuRcMBZtDsfaRMwr2I+icr/ctzLoUv//gGO/xR8OvU
 eLtv0qDsbSE2+fny8IODbznNRjeCa+RSX156PyHJYffrFGge9CTM1MKO8yJorXsiu7DsHjW6QuDGb7
 PUuXQqdl47bIqXIaufxHO1zjbaiEv1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163126_108197_CE597991 
X-CRM114-Status: GOOD (  18.51  )
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
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/gcs.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 979e02cece93..cdd4a9d7ff7d 100644
--- a/arch/arm64/mm/gcs.c
+++ b/arch/arm64/mm/gcs.c
@@ -68,6 +68,70 @@ unsigned long gcs_alloc_thread_stack(struct task_struct *tsk,
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
+	if (!PAGE_ALIGNED(addr))
+		return -EINVAL;
+
+	if (size == 8 || !IS_ALIGNED(size, 8))
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
+	addr = alloc_gcs(addr, alloc_size);
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
+		/*
+		 * Ensure the new cap is ordered before standard
+		 * memory accesses to the same location.
+		 */
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
