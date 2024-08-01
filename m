Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18F71C3DA4A
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YOqoxDT+Jmkw/9QnmfT3jC+ttSRW/rZRllFuVN93l0g=; b=1i7V1sox3bOiwi
	aKyYzcC5roT2uybmFDXjb7D0MwwW4g5OMmPlN8+GLkcH5so6go8Sswg0VyZX4KMSNa4HFq2SYjDP7
	VvMlDROEFsKcOq4hV+bRB6mnAt+e0QNZG3HPAi0wNGnck/xgLhtaoPGKvpT+cpWExrvDy6JfZDghg
	8W09o4PTVQN+1KZtXP8krwv5Pj5AmxM4+2zB8l+trCWVfrRhsYxiY3trb5aqq0g4xPqRdiX5tgoi4
	yY4ZAs+9AIVg1ESGWU1Fl6s6Uuvi/dFRmTRZpRUfJV07h6jQEqvrBqVU7EF67LA+2se7gQmxbgzUV
	7URLb9rcnHxSdgg/5v0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVTp-00000005M2P-2Prm;
	Thu, 01 Aug 2024 13:04:29 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVO9-00000005IPT-2nDw;
	Thu, 01 Aug 2024 12:58:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0044DCE19AC;
	Thu,  1 Aug 2024 12:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC1D4C4AF09;
	Thu,  1 Aug 2024 12:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517115;
	bh=WqKsS1qVwE6VKZ/8GkyAqMVM3MB00X49lYjibfc4BZQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ROUBXnl4pCUlqrD8GJYnW6TX3c+9d0zCM9U4fas+nBWuRkaQxwqdCtUnMKn8bqn4f
	 gW4iKyPY2BVlKprVB71QI7AD33rbq+ETEhOL6iuO5JvB9SMkUrkTStZWPD1i68dhyb
	 xrmgb+ZCT6FWojsUOZj6gd351PNsYtllWfnQ9H6jTgRUnAAwhl+SU8CZABDSrCminc
	 eZ03nbwXn+jgVyL3n3WwLazRMvDgaaXLZFfeEFi/Z8UW9cKpE+wlA67ra7OMyRFL4M
	 bMo93Hh5OBkmjVzrucQT7Ty5gGxK4EoGVmfiKpacjYLdiBgBtAmHlK6Bgcyy0QWbfp
	 u9RKn2clTauWg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:38 +0100
Subject: [PATCH v10 11/40] arm64/mm: Allocate PIE slots for EL0 guarded
 control stack
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-11-699e2bd2190b@kernel.org>
References: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
In-Reply-To: <20240801-arm64-gcs-v10-0-699e2bd2190b@kernel.org>
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
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=3028; i=broonie@kernel.org;
 h=from:subject:message-id; bh=WqKsS1qVwE6VKZ/8GkyAqMVM3MB00X49lYjibfc4BZQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YOlw9nLbDAyfViEdCcT1ji+c6735KeAWlvvJky
 itB7ZKSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGDgAKCRAk1otyXVSH0CDDB/
 wI9T7bi6abhO/KUuxju+FabJ0MVht7CEjsBZwh9yuAMi4yLWNjlkcbPoiYxYxf+m4npTmnb92xs5+y
 HoCgsimyU+aKqsGKW8nKV97vp2l+XL0bVtlo0io9mbDGWnuR9SRwRjpCeYlvr2rNG5hKdKGNjO59Lg
 T+ofnDExR1esJIq07OYzfpCyYICWbVuwh6WapUICDZQ8TKk8wBmDpNXHSVaxX6TE8vCRIdzNk2NT+0
 6G8IURvioQ2LXI6/BS7qAZHW7jrdkFCvuEBC6VwbGn1Y/ODhX142tes7v+8niLXK5tqhALMDxjY8CF
 0rPaynHjFv2HxlL8DoQmbg6pdswtZW
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055838_114231_0F3DCD2C 
X-CRM114-Status: GOOD (  11.99  )
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

Pages used for guarded control stacks need to be described to the hardware
using the Permission Indirection Extension, GCS is not supported without
PIE. In order to support copy on write for guarded stacks we allocate two
values, one for active GCSs and one for GCS pages marked as read only prior
to copy.

Since the actual effect is defined using PIE the specific bit pattern used
does not matter to the hardware but we choose two values which differ only
in PTE_WRITE in order to help share code with non-PIE cases.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/pgtable-prot.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index b11cfb9fdd37..545d54c88520 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -144,15 +144,23 @@ static inline bool __pure lpa2_is_enabled(void)
 /* 6:                                PTE_PXN | PTE_WRITE            */
 /* 7: PAGE_SHARED_EXEC               PTE_PXN | PTE_WRITE | PTE_USER */
 /* 8: PAGE_KERNEL_ROX      PTE_UXN                                  */
-/* 9:                      PTE_UXN |                       PTE_USER */
+/* 9: PAGE_GCS_RO          PTE_UXN |                       PTE_USER */
 /* a: PAGE_KERNEL_EXEC     PTE_UXN |           PTE_WRITE            */
-/* b:                      PTE_UXN |           PTE_WRITE | PTE_USER */
+/* b: PAGE_GCS             PTE_UXN |           PTE_WRITE | PTE_USER */
 /* c: PAGE_KERNEL_RO       PTE_UXN | PTE_PXN                        */
 /* d: PAGE_READONLY        PTE_UXN | PTE_PXN |             PTE_USER */
 /* e: PAGE_KERNEL          PTE_UXN | PTE_PXN | PTE_WRITE            */
 /* f: PAGE_SHARED          PTE_UXN | PTE_PXN | PTE_WRITE | PTE_USER */
 
+#define _PAGE_GCS	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_WRITE | PTE_USER)
+#define _PAGE_GCS_RO	(_PAGE_DEFAULT | PTE_NG | PTE_UXN | PTE_USER)
+
+#define PAGE_GCS	__pgprot(_PAGE_GCS)
+#define PAGE_GCS_RO	__pgprot(_PAGE_GCS_RO)
+
 #define PIE_E0	( \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_GCS)  | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_R)   | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_X_O) | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_RX)  | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RWX) | \
@@ -160,6 +168,8 @@ static inline bool __pure lpa2_is_enabled(void)
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW))
 
 #define PIE_E1	( \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_NONE_O) | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R)      | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RW)     | \

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
