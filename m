Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0EA6C61D9C
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 09:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htwp7SIAhkzk5VkznXB5B2s2oWm7RDrrOzJSRiEgM/M=; b=irtCQzZCrkYehu
	PDGdzHx9lxvT3opo9Tg+VTiMb0Wb7Bwj36tdtOO2lUcEWQsepLbzlZuGOXL+q4TOcRALNuy+6jBJN
	zQ0aoxDE11xDyWyj2Gwv9sdhZ5NsD5a1UA/bFRBp4S9ZUCCTVNFbMhV8EvXCCL3TFQbybq9aMPRk7
	kNO3vnNkz8PwMA94mDJu08PLqXyHrrhk1dLbYKIwDME2NZ8EHV5ifqVFYx39On+gEM/Of0Hu3N/Af
	P8lW3hw7JM++0Sl0yCPpl/FRJuzVZ06+JitmZaY6n43xjTZ8dMJM706MgN5dQeEWHMuGdKQDFZa7J
	gHFJdQMaddgGrr2c8c9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jny-001I3Q-25;
	Wed, 22 Nov 2023 09:45:58 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5jnI-001HIN-1p;
	Wed, 22 Nov 2023 09:45:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 18A5DB81183;
	Wed, 22 Nov 2023 09:45:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEE1DC433C8;
	Wed, 22 Nov 2023 09:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700646314;
	bh=BzV/RIjxnxMn9VbcnDWXuF4bpk5mXr34eQJiBtwP4NE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=l/tPHDZNixS3bQk2n+SQhubpzTfcvaboniqmwUh/PTbCtGaJTfzsMFW7xRRZgI7QS
	 iDE7cilI1DbJeAIwmDbOwO1mCCxOaIuTdR27BQhkBBc96Q7dT+6aLYUnAWSz4LUfqS
	 wca9ympps1BSiJrViPZBxwqOIYjvs+Cu2pjPu8UHjcTdLxe209jcyhOb8S+92tP93r
	 azGWWAvwK+SVC3z+7QS1CM2oNASn21FY+PMbJs3GDyS8RPf8e/bhbklg09GkGiJIcg
	 hdpXy/Qq3ZPD9ODrfB7CvUWAmiZpuaUPoVHyapkCxoEFHvcrqWe74qnkqE/a3ZRzPR
	 Yb5KCzU8Uh2Xg==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 22 Nov 2023 09:42:29 +0000
Subject: [PATCH v7 19/39] arm64/mm: Handle GCS data aborts
MIME-Version: 1.0
Message-Id: <20231122-arm64-gcs-v7-19-201c483bd775@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5688; i=broonie@kernel.org;
 h=from:subject:message-id; bh=BzV/RIjxnxMn9VbcnDWXuF4bpk5mXr34eQJiBtwP4NE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlXc0FZrStz9Xr8Prvr2S0JFwovux2nNPRmOouZ
 p8eOCwtpimJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZV3NBQAKCRAk1otyXVSH
 0NmMB/9iOfF48aW2DH8GfqhVA2m6OttDsfi8udYamecnJPcdti7OK5IEBs6O/7ccnIxI6+Dt8H3
 Dm4IDlD9qdSD04W5mGrRffn6p3plw6PmIuzC7gd4iqjAG+6QDVAnQ2vRWkISWgXJ8VojIpu5cJg
 jETt5f7+meyZpX7Dz6KDygBxHgMpOs4Ua9UmN/yeDU6ZMIpCMGqOljcXee/8Xg5yn2itZwWOs0b
 MM2K35WGayANmXha1Z1vIME/dVrDqVqaF81BflwSn+dVaBejDxkNnVaECEDo4Y6qvCWsBs1OrYL
 OSJsoHrfhXZPAVAeHEiCu4/SYLssCMlwH/7uyX4yQ17OTMQx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_014516_907878_921F8297 
X-CRM114-Status: GOOD (  23.39  )
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

All GCS operations at EL0 must happen on a page which is marked as
having UnprivGCS access, including read operations.  If a GCS operation
attempts to access a page without this then it will generate a data
abort with the GCS bit set in ESR_EL1.ISS2.

EL0 may validly generate such faults, for example due to copy on write
which will cause the GCS data to be stored in a read only page with no
GCS permissions until the actual copy happens.  Since UnprivGCS allows
both reads and writes to the GCS (though only through GCS operations) we
need to ensure that the memory management subsystem handles GCS accesses
as writes at all times.  Do this by adding FAULT_FLAG_WRITE to any GCS
page faults, adding handling to ensure that invalid cases are identfied
as such early so the memory management core does not think they will
succeed.  The core cannot distinguish between VMAs which are generally
writeable and VMAs which are only writeable through GCS operations.

EL1 may validly write to EL0 GCS for management purposes (eg, while
initialising with cap tokens).

We also report any GCS faults in VMAs not marked as part of a GCS as
access violations, causing a fault to be delivered to userspace if it
attempts to do GCS operations outside a GCS.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/fault.c | 79 +++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 71 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 460d799e1296..28de0807b4a1 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -494,13 +494,30 @@ static void do_bad_area(unsigned long far, unsigned long esr,
 	}
 }
 
+/*
+ * Note: not valid for EL1 DC IVAC, but we never use that such that it
+ * should fault. EL0 cannot issue DC IVAC (undef).
+ */
+static bool is_write_abort(unsigned long esr)
+{
+	return (esr & ESR_ELx_WNR) && !(esr & ESR_ELx_CM);
+}
+
+static bool is_gcs_fault(unsigned long esr)
+{
+	if (!esr_is_data_abort(esr))
+		return false;
+
+	return ESR_ELx_ISS2(esr) & ESR_ELx_GCS;
+}
+
 #define VM_FAULT_BADMAP		((__force vm_fault_t)0x010000)
 #define VM_FAULT_BADACCESS	((__force vm_fault_t)0x020000)
 
 static vm_fault_t __do_page_fault(struct mm_struct *mm,
 				  struct vm_area_struct *vma, unsigned long addr,
 				  unsigned int mm_flags, unsigned long vm_flags,
-				  struct pt_regs *regs)
+				  unsigned long esr, struct pt_regs *regs)
 {
 	/*
 	 * Ok, we have a good vm_area for this memory access, so we can handle
@@ -510,6 +527,26 @@ static vm_fault_t __do_page_fault(struct mm_struct *mm,
 	 */
 	if (!(vma->vm_flags & vm_flags))
 		return VM_FAULT_BADACCESS;
+
+	if (vma->vm_flags & VM_SHADOW_STACK) {
+		/*
+		 * Writes to a GCS must either be generated by a GCS
+		 * operation or be from EL1.
+		 */
+		if (is_write_abort(esr) &&
+		    !(is_gcs_fault(esr) || is_el1_data_abort(esr)))
+			return VM_FAULT_BADACCESS;
+	} else {
+		/*
+		 * GCS faults should never happen for pages that are
+		 * not part of a GCS and the operation being attempted
+		 * can never succeed.
+		 */
+		if (is_gcs_fault(esr))
+			return VM_FAULT_BADACCESS;
+	}
+
+
 	return handle_mm_fault(vma, addr, mm_flags, regs);
 }
 
@@ -518,13 +555,18 @@ static bool is_el0_instruction_abort(unsigned long esr)
 	return ESR_ELx_EC(esr) == ESR_ELx_EC_IABT_LOW;
 }
 
-/*
- * Note: not valid for EL1 DC IVAC, but we never use that such that it
- * should fault. EL0 cannot issue DC IVAC (undef).
- */
-static bool is_write_abort(unsigned long esr)
+static bool is_invalid_el0_gcs_access(struct vm_area_struct *vma, u64 esr)
 {
-	return (esr & ESR_ELx_WNR) && !(esr & ESR_ELx_CM);
+	if (!system_supports_gcs())
+		return false;
+	if (likely(!(vma->vm_flags & VM_SHADOW_STACK))) {
+		if (is_gcs_fault(esr))
+			return true;
+		return false;
+	}
+	if (is_gcs_fault(esr))
+		return false;
+	return is_write_abort(esr);
 }
 
 static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
@@ -573,6 +615,13 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		/* If EPAN is absent then exec implies read */
 		if (!alternative_has_cap_unlikely(ARM64_HAS_EPAN))
 			vm_flags |= VM_EXEC;
+		/*
+		 * Upgrade read faults to write faults, GCS reads must
+		 * occur on a page marked as GCS so we need to trigger
+		 * copy on write always.
+		 */
+		if (is_gcs_fault(esr))
+			mm_flags |= FAULT_FLAG_WRITE;
 	}
 
 	if (is_ttbr0_addr(addr) && is_el1_permission_fault(addr, esr, regs)) {
@@ -594,6 +643,20 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	if (!vma)
 		goto lock_mmap;
 
+	/*
+	 * We get legitimate write faults for GCS pages from GCS
+	 * operations, even when the initial operation was a read, as
+	 * a result of upgrading GCS accesses to writes for CoW but
+	 * GCS acceses outside of a GCS must fail.  Specifically check
+	 * for this since the mm core isn't able to distinguish
+	 * invalid GCS access from valid ones and will try to resolve
+	 * the fault.
+	 */
+	if (is_invalid_el0_gcs_access(vma, esr)) {
+		vma_end_read(vma);
+		goto lock_mmap;
+	}
+
 	if (!(vma->vm_flags & vm_flags)) {
 		vma_end_read(vma);
 		goto lock_mmap;
@@ -623,7 +686,7 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		goto done;
 	}
 
-	fault = __do_page_fault(mm, vma, addr, mm_flags, vm_flags, regs);
+	fault = __do_page_fault(mm, vma, addr, mm_flags, vm_flags, esr, regs);
 
 	/* Quick path to respond to signals */
 	if (fault_signal_pending(fault, regs)) {

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
