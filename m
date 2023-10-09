Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F9E2E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QqUhLCp9fddDlEGq8AA2R1ujRGoq/XRgSDxt1imyhbQ=; b=Gz1g8f0IoeOKZR
	R0aRUhS9gi5U1wZXswxONR5fFwgGbdM356HeFGvJxTzvwQuFqeR5KzXYF7y8x5GHhfxCmPSjCqjXP
	pZbvkhXrybqKa39buYq7c08KVeoG69wQijRCdoGyC3FBIn8R8i+SMQQfqIjj7tjaS0j4lzM0gW4Ox
	fWHX4TyC6hBlXdCjrudb7tGE8u5R3Ez8+V4uAFtXShmEu/qM7MzZnZSXp1XCwi8ccWpi6yHxyAD0y
	aIrjy0dDqnTSXgyQSGaCWE0QaUWxW/yX/1PQ5CW5QHNSOYPGmiKpnhcSNAZe9yXWYRqBmFp2JacP7
	u1bVyow6CilPXgTYJVBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7A-00AaEE-06;
	Mon, 09 Oct 2023 12:12:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp74-00Aa7L-2O;
	Mon, 09 Oct 2023 12:11:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 0D82BB80D95;
	Mon,  9 Oct 2023 12:11:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B865C433CC;
	Mon,  9 Oct 2023 12:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853512;
	bh=42MhIHJYoAESIQOg6Faf648pZFSDD4v6BdFtVSfz3SE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Edg0MkiXTgq0915C8p+R0ggtuWzow4Y1+CyDxlrdLxMNLcdP876Pfi+Z4iJaoh6Ii
	 2yar+LS0z1DWsttaTGOfOfQkpzOpdvnuOOaQS8fYdA3KJljRY9GhfphtTKAGquocrC
	 0tiN3n9LytAnZ8oHKWq9YNpf77rmGP1otZgx157zCHs/aDF9t2Kv5q48lDAki8lD9G
	 wuQ+d8ZY6ju5sVJX+UnkNdLMtNw5IlNsqJFhkKrpEkuGaOXgwLHSEEQrcw/0c8iDtF
	 WalKM+IELiCcWgONrK/a5o7fg5/czE0+2IXgjgjrpOLdG6cWRdwHsmBYJv2hdAzzmE
	 x6DiVLPYyCH6w==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:45 +0100
Subject: [PATCH v6 11/38] arm64/mm: Allocate PIE slots for EL0 guarded
 control stack
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-11-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2918; i=broonie@kernel.org;
 h=from:subject:message-id; bh=42MhIHJYoAESIQOg6Faf648pZFSDD4v6BdFtVSfz3SE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2ZJRM/idFdS62wSkMToCjd7iU1NYZRbt5LlFz+
 CFhJnEOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtmQAKCRAk1otyXVSH0IWBB/
 9ziSylzGcu5afgUxGvT7hjnE7Uc44cyH5zSZbtg0jtpfkjqQEuCg/+aUmduG9pHKiIS13aD+T0OsAM
 tv28vqEdVmh/ont4bU8MGEfTdaSBvxCUX6+Gk05UBUOF1vhGLRKuj7XKWWvOdD22A/05tM3jepQ0Au
 T4Flrh771B4GAFJ8jT5r+ARzgqeSIyDXjkFMMpAtR/z9UG+OFIYep/LUqxo8wAI8e5LzzwU79iKrgJ
 Uz9oEPRfu/G69F6okL5SmJn+heGcKjP2qmT8OB52h2HmvSaGqVOFpysYgnwztsTNa0P6LU+2JO2PI0
 r3LrEVJzW+5tdSZupMleqt5dgTwb7V
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051155_103574_63190415 
X-CRM114-Status: GOOD (  11.61  )
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
