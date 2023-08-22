Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A546CEE49A3
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 14:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqUhLCp9fddDlEGq8AA2R1ujRGoq/XRgSDxt1imyhbQ=; b=gReWecmdA81vY7
	Yypcd2Eep2EtC3wHr8cyJxYw+ro+L4BRE4t8ciHmytG1IxrtmuPQj3GZRsU/l5Wrl0BYh404yIhM1
	/g6xUnRqMtGyv/q0N2kxdJBBGeJroqsCt1c05oiyDR4r7AJ2PyZ9Gzm4VDoaFsMl6pfbRI8+7irjf
	5muj3FPW55Lzmbodgspi95nYCIGs1N86MPUhmYH5UcVYfKmf4PcmSDJowkExsdMOxer44AmU0zreN
	IqtgSnlEcH2AZyi90r43TZn+VzoPdK0mJ0Q28rjPMyejYtG+7946TSMCjC4poEGWODTt6Sh8lZ+YG
	MHRq54a8Lzl+lY5bL66A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRze-00G6wl-1i;
	Tue, 22 Aug 2023 14:04:26 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRzK-00G6ea-1B;
	Tue, 22 Aug 2023 14:04:09 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BCCFF65331;
	Tue, 22 Aug 2023 14:04:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C217C433C7;
	Tue, 22 Aug 2023 14:03:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692713045;
	bh=42MhIHJYoAESIQOg6Faf648pZFSDD4v6BdFtVSfz3SE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=RLFNa9Uu4Gf/IZmKYQAwoU1DAl1Hrmh2Iep8SGKsvQEKOEHPyb5fUEVcQEfPp9Zsx
	 3vyeMFKljiFHgFmJICo7VVLUSMdbEmT0LoKzY/c4Sscr4JuxfFmqY8hT77rlILH/C+
	 /p2zl8WQpQZoaWgI4dIiGYbryBDDyOqXd7WacCmOkLyyjDWvy4pNKNMDm2q14iuLMY
	 FrsjK5fKEQY2JlutcLgBJKLz2ttQEAx6O9UCD96Kam73zZXyIcdlrcnEukHfr3OQAr
	 bmT7yN7NeIP07EmFZOipKzaNIYq15DADZanNYdbGvM6tEdy8e6GNdTHwBn3SQ7aJbG
	 KwJtAumt8OWXw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Aug 2023 14:56:43 +0100
Subject: [PATCH v5 10/37] arm64/mm: Allocate PIE slots for EL0 guarded
 control stack
MIME-Version: 1.0
Message-Id: <20230822-arm64-gcs-v5-10-9ef181dd6324@kernel.org>
References: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
In-Reply-To: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
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
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=broonie@kernel.org;
 h=from:subject:message-id; bh=42MhIHJYoAESIQOg6Faf648pZFSDD4v6BdFtVSfz3SE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk5L/3hW5oZiOunRpUElIP898sxVS1Ayfi7DnWRp83
 LRzZhluJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZOS/9wAKCRAk1otyXVSH0CCGB/
 488rTmer0QnJdYCuSJvdBZjqeKqHon2s4W7KYBzMD9MGNYzP/M4XqQip3ex7pV9nreiJiryRUFk5jL
 +6VZkaymNyHu9fhuybghCY5IPhZAxxf3w3aqlIif1y0u4+DlkXSX9DlVxQOmGQKNEs1tYhJ+5/q5MI
 +7c98wdhp2vuhnRKfH/4PH3eitKskrf2UJ1pKJn6OjKruWRXtsQNojXWsy//ximT3nxER3ikwfQn0W
 76U2AmbxfTgwmQUBHnniHSWWcsVqHj2U5zDLIggqX+rjB3iAtgQ0VAfw9yKgmr4A2h4yhvjd/Ij99y
 vPmQisiZ1EGOvgcAjO3toSCMS3m/oz
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_070406_539779_54073E0C 
X-CRM114-Status: GOOD (  12.57  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/pgtable-prot.h | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable-prot.h b/arch/arm64/include/asm/pgtable-prot.h
index eed814b00a38..d71474d0d2f4 100644
--- a/arch/arm64/include/asm/pgtable-prot.h
+++ b/arch/arm64/include/asm/pgtable-prot.h
@@ -131,15 +131,23 @@ extern bool arm64_use_ng_mappings;
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
 
+#define _PAGE_GCS	(_PAGE_DEFAULT | PTE_UXN | PTE_WRITE | PTE_USER)
+#define _PAGE_GCS_RO	(_PAGE_DEFAULT | PTE_UXN | PTE_USER)
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
@@ -147,6 +155,8 @@ extern bool arm64_use_ng_mappings;
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED),        PIE_RW))
 
 #define PIE_E1	( \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS),           PIE_NONE_O) | \
+	PIRx_ELx_PERM(pte_pi_index(_PAGE_GCS_RO),        PIE_NONE_O) | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_EXECONLY),      PIE_NONE_O) | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_READONLY_EXEC), PIE_R)      | \
 	PIRx_ELx_PERM(pte_pi_index(_PAGE_SHARED_EXEC),   PIE_RW)     | \

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
