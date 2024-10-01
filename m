Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC12CCF3189
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Lph0uK99Md/Duw9GcQAxIA5aetzkZvbLl0afIftLfaA=; b=hK0zzCajc7rb83
	n4ogONXuxgDOfMupunxL1vskYmqAw4NvfA/Qk917vSdojyutvoVRsiPYLD9Mw92HjEMFVoxOSuD50
	VgTVms5TeXiS6Wh92NDzxh/uG0fBwIX8oCG6HPL104I8X7E+TqXcBNGvAHoc4FguoPk+bEm7xs+gJ
	fkxwsLWyJ4co+2Uf71Jj31xDwl/B/5iWBSoCDG9MV7k2kpVxtMu2lRfM7ne0bkDyDHd3hav9uFpcm
	fq6PwREDrXbJT2CUeSLOa1wcRfelEFWSe4dTVcHpw7fYzyjVyPshVXLo5dWmAgiC+p9r2/UiInhLL
	4eQTFg+Kcb4R1IZ2z55g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmGA-00000004MZ1-3hHK;
	Tue, 01 Oct 2024 23:26:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlu7-00000004HTl-3ncI;
	Tue, 01 Oct 2024 23:03:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 220F55C1060;
	Tue,  1 Oct 2024 23:03:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B91A5C4CEC6;
	Tue,  1 Oct 2024 23:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823818;
	bh=JwTS5J5Kz+XCxYDRc3FG3N1klYZC99PAyz93oxxWHns=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=h5QOvsyHwmwYJXTikpeXsVEp2A3UPoVjGZRUucHDnIEP8s20RwqCtfvtaEgYASJ3A
	 4VvT7Z9FkWpjGLRRUyAM0E57+nFfV/1smmkjKGkRZKQARGtcXv4Kr/B1Fg5EqqXPTT
	 w7iMpC+tcgCrK+qsiDR7XnELMA4PkJgDckI9vpw8SVgbifNvpYEuLSdt70HOnbcLrh
	 bILOGqSFtZOKo1haHLpTrtPKpk0NC0HS0Pd2sgi3K8cPhb+7HZxIGLJOcB3QJHfl0A
	 Gos56B/AegT6wsD2YwKq8Ie1aAdRX49w3baVX3709fSna41T6qIRdgrbFb2IW97c4V
	 0q6PzQ7x+JAPg==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:59 +0100
Subject: [PATCH v13 20/40] arm64/mm: Handle GCS data aborts
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-20-222b78d87eee@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3733; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JwTS5J5Kz+XCxYDRc3FG3N1klYZC99PAyz93oxxWHns=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7TVZ3jDKeIyJFS2xkZycVzFdIgkZ/2MVMSxegg
 PracWFmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+0wAKCRAk1otyXVSH0PPFB/
 9jOVBZ0sZYLFYt8CYSgFwth5bQAMffCYR65UIbAKTDAZV8czeEm1xDTBVqLzh2y8cJ8L9rksWGRzsa
 KoNNdusUYbP0WwOzwiB8f26x4k5gKBP8dzKhvHobyjoVwM9dwHJ1P+31Rnk9S2VC0HlJ12ukGOll7A
 CZczYl0vb1teCaug4ldvi8DJRkAAMotUN8oeVWz1J0E9GwHb+eMDvTL9igdY9wrw4EyL8kkGp2K8aF
 B+pBMS0HXzUFSpXDbnSX5eVKfGA1myQSsEM0KQsGSA4aaHTZ8Guexvn78tQkU7ofyEMejYY/2DYTmb
 IZnC/hzjnKbZohafBaYTyRcPVaFiYq
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160340_117366_BC37FE78 
X-CRM114-Status: GOOD (  19.64  )
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

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/mm/fault.c | 40 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 8b281cf308b3..c2f89a678ac0 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -504,6 +504,14 @@ static bool fault_from_pkey(unsigned long esr, struct vm_area_struct *vma,
 			false);
 }
 
+static bool is_gcs_fault(unsigned long esr)
+{
+	if (!esr_is_data_abort(esr))
+		return false;
+
+	return ESR_ELx_ISS2(esr) & ESR_ELx_GCS;
+}
+
 static bool is_el0_instruction_abort(unsigned long esr)
 {
 	return ESR_ELx_EC(esr) == ESR_ELx_EC_IABT_LOW;
@@ -518,6 +526,23 @@ static bool is_write_abort(unsigned long esr)
 	return (esr & ESR_ELx_WNR) && !(esr & ESR_ELx_CM);
 }
 
+static bool is_invalid_gcs_access(struct vm_area_struct *vma, u64 esr)
+{
+	if (!system_supports_gcs())
+		return false;
+
+	if (unlikely(is_gcs_fault(esr))) {
+		/* GCS accesses must be performed on a GCS page */
+		if (!(vma->vm_flags & VM_SHADOW_STACK))
+			return true;
+	} else if (unlikely(vma->vm_flags & VM_SHADOW_STACK)) {
+		/* Only GCS operations can write to a GCS page */
+		return esr_is_data_abort(esr) && is_write_abort(esr);
+	}
+
+	return false;
+}
+
 static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 				   struct pt_regs *regs)
 {
@@ -554,6 +579,14 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 		/* It was exec fault */
 		vm_flags = VM_EXEC;
 		mm_flags |= FAULT_FLAG_INSTRUCTION;
+	} else if (is_gcs_fault(esr)) {
+		/*
+		 * The GCS permission on a page implies both read and
+		 * write so always handle any GCS fault as a write fault,
+		 * we need to trigger CoW even for GCS reads.
+		 */
+		vm_flags = VM_WRITE;
+		mm_flags |= FAULT_FLAG_WRITE;
 	} else if (is_write_abort(esr)) {
 		/* It was write fault */
 		vm_flags = VM_WRITE;
@@ -587,6 +620,13 @@ static int __kprobes do_page_fault(unsigned long far, unsigned long esr,
 	if (!vma)
 		goto lock_mmap;
 
+	if (is_invalid_gcs_access(vma, esr)) {
+		vma_end_read(vma);
+		fault = 0;
+		si_code = SEGV_ACCERR;
+		goto bad_area;
+	}
+
 	if (!(vma->vm_flags & vm_flags)) {
 		vma_end_read(vma);
 		fault = 0;

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
