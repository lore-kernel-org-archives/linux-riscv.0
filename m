Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15259CF3189
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Oct 2024 01:46:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aXWlC3lZ4WdkwJmsuF5pn8TQkujZ1XXHgELXCaO0prE=; b=264Zm8X5o5IwHY
	FvvZ6si3wZjfq+9OBteYNh+BYJh9Hw/bpaGhUTdxP+hLuQsVcotzZBZwBtO6DO7xIy9P/+s9azZqF
	st1IUvuAfb48W11HlPuNqdcYmZC/f+UBtweKyc+7jrnjmSnIjs70W1NDy8teSldsMpkDFLNRT0KZ1
	CjJ44ToxYe00IijyzktHfokIrfJykoNT1jS2cbGY6dtF/li1P/cQfqHfPHO+NAdqTI8I7Huf0INTi
	CGwEJynKqIPpk5uDc/jJoKffIl/AqR28nWHT0xP9pQ7TOTVzv8zFVAr1AtyzWCmbQwBYFEM8kJsSr
	KnQ6STPaELqvMhy1ijsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svoRu-00000004ZTk-46Jj;
	Wed, 02 Oct 2024 01:46:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlut-00000004Hps-2WkS;
	Tue, 01 Oct 2024 23:04:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EF91C5C0339;
	Tue,  1 Oct 2024 23:04:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2731BC4CEC6;
	Tue,  1 Oct 2024 23:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823866;
	bh=qUaWHBHdN5KhPSaC2shYeXLiosV3WxoA3aMO7oZsLVE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=R5eOO/CwUjlApWCgKSs8nP1G9FbTW6gonLZZKFpKZtiXZTuq5ksbI0wpEZjOTU8yG
	 xKBo6Dd0I2/GI0kHJEkkXYarMC1cRGNbblyUwlD/NHUJB0gNe2M34+Pvj+i5NMs2oW
	 AQUVAUxEn0i8MeiNshGyJtj0LUF/KvnAe3Q76pZS78zE69xC5Ne9aYD9h3mJjXX39m
	 WvwPuQhQeS2KJ4LBzyZMXZmT9HjML+MzgorTHGfC0IFNwyg630Fv4fYif2qm7VlHqP
	 ieU/iLIRdW7+XBOXwFy6sWKRc9mDVgT4WTb5lVgTRBUoaFCDboJBJV5vPgPvvQHQfu
	 x3so/N3EBojRw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:59:03 +0100
Subject: [PATCH v13 24/40] arm64/mm: Implement map_shadow_stack()
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-24-222b78d87eee@kernel.org>
References: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
In-Reply-To: <20241001-arm64-gcs-v13-0-222b78d87eee@kernel.org>
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
 Ross Burton <ross.burton@arm.com>, David Spickett <david.spickett@arm.com>, 
 Yury Khrustalev <yury.khrustalev@arm.com>, 
 Wilco Dijkstra <wilco.dijkstra@arm.com>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=openpgp-sha256; l=3164; i=broonie@kernel.org;
 h=from:subject:message-id; bh=qUaWHBHdN5KhPSaC2shYeXLiosV3WxoA3aMO7oZsLVE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7W5jFfBYx0dD/AiVB3co7PUfmUOb1RGg81DGmy
 uzTdjduJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+1gAKCRAk1otyXVSH0O7/B/
 42dRKw5u6PwVHw5uyGMv0ruX389ObAvdjm3Y36WIttnDUP0tWY+nfpebp14vMHoDi1oOFtcjrptu1r
 ZlVTVs7h1ekurkDzRQ2XJm89Mop9C4VeausdyagksJAtlGy43yqbrsMZysKPPEPLgeMJrgL+bs0yhY
 hHpo0pRPoFNGUK3Jzl9WSDCsKobZbzpSDpA+7AdL8f93D4UFUH7XCRkK0oY7mo/u2UCTFOK+8fNwkL
 CVDcP/EVT9hqzjaMyv4mIH4Ij7rJyU6y/ZXTMMHEPZUQZUOqHuYMaoePQShnA8T4Qw8zPwyZ4dkJZ0
 KnR47/XLkVLmJuFGlBMHuGsjK6mlZf
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160427_793951_A1AB2419 
X-CRM114-Status: GOOD (  18.52  )
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
Acked-by: Yury Khrustalev <yury.khrustalev@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/gcs.c | 64 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 64 insertions(+)

diff --git a/arch/arm64/mm/gcs.c b/arch/arm64/mm/gcs.c
index 61a80de6baf8..5c46ec527b1c 100644
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
