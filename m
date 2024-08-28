Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CCFC7114C
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IpPCf9ZpNm9TJStWvwhlZym3/KXQEwuHexmd6W144DY=; b=hB042CVJdoMLBx
	JACofnWyYXCUQB1BdavLSrWNyqsAb3uT68nfEXAVwDLjL6WbFswK3FNynoFfLRCHvG5HlnFaJZHqC
	bkdFlDYuliHLg59lHfJ+/8k9Rj5CPcn2hUnxfZtO7BvCn/J2XRFErOoqZDiDhRZAXidHqE/p/EyQw
	lVY2iWL+IUNvj8ve30er8uRMr799nXCXwncBsNF7Z1p9UB95AE43yD1uJWYL2u1WPGxOaxLHpVOfi
	7Y6bgQId+hVBMw7xyCPqsnCP5wmhvkq4EEmXUNb/ROwmPUi164RS4swQyO0Lqt5J6ITKImeydfjcf
	lYu+y1+fzntKAkZjXnqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjSGQ-0000000HQrx-2XxC;
	Wed, 28 Aug 2024 23:39:46 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS7F-0000000HMNr-2gTa;
	Wed, 28 Aug 2024 23:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C1D53CE19BB;
	Wed, 28 Aug 2024 23:30:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E576DC4CEC5;
	Wed, 28 Aug 2024 23:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887815;
	bh=q8jtVg186GFJVIbjl1JCrkiZnz/oBLnR/HtHUgXvMfA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=csXIYlPbjsq0/jESzviJXGLS5PVUMwFyPcl9Xf8tCAU3CGgzUzcSXEOOGrzJGOi4n
	 +LVpTfKWkimkyH2gkwgyYFLAqrNxMfByqvcuy0VRXO4vSBMDQDGRLkHTzLYPfpeOy2
	 AyEWc7lOsYqAfbBDM8Bc6mJym3P1TCGwFH6JYwLsXtYbilIWgJGJBuUIWwEF4ruBzk
	 Irzl16KGJZap13BwqZWYzbzXWP+4eyR9laKqpNp69phFVR0DOgEfIDlzw09zIlvjZg
	 aqd4HA+U9jzpvZJm3UVCJjQd5uoKjF5Q0gQa5Ttxa0UAOtqwlc/QdBtfEypp/Uxek/
	 Eb/XXqGaqeeCg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:30 +0100
Subject: [PATCH v12 14/39] arm64/mm: Map pages for guarded control stack
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-14-42fec947436a@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824; i=broonie@kernel.org;
 h=from:subject:message-id; bh=q8jtVg186GFJVIbjl1JCrkiZnz/oBLnR/HtHUgXvMfA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7KDz+A8JTqcELz4cAJ592v00no+g1aVltB8BmzS
 YLVlld6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+ygwAKCRAk1otyXVSH0GfJB/
 49HQhF+L8EiPWM7v3hZ36OyfEAtuZYOAa7yxbdtNlpOsOKuJCieWaGUjCl4V7oMxDUXRoMqIYkJ2Y7
 0UjpPJ2A/OzEmFWXJzvSlVo9eCTfasoJ4KB8k9tuDNt/wmQ2GuY7C+9u0ds83AmngnuKcfDeqVE0VW
 8xDc5pxqMmvZE+kh51h7AXaa+kMQTlm7Dnb4gtNI554joq08SMIgk7fZKptpoJne0VPkT1C7gUBfTG
 r3ZYOx8kpQ6ZA2hstniXP3cfObhdDaqIBtvnccak5YaFOo4qP9sUvzJOoHVrguVBLRswG/5kNuET2U
 0gXB7BzsUfSt94B6y9IbRGc5knJOAA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_163018_066452_F13818C1 
X-CRM114-Status: GOOD (  12.46  )
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

Map pages flagged as being part of a GCS as such rather than using the
full set of generic VM flags.

This is done using a conditional rather than extending the size of
protection_map since that would make for a very sparse array.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/mman.h | 9 +++++++++
 arch/arm64/mm/mmap.c          | 9 ++++++++-
 2 files changed, 17 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
index c21849ffdd88..37dfd2882f04 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -61,6 +61,15 @@ static inline bool arch_validate_flags(unsigned long vm_flags)
 			return false;
 	}
 
+	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
+		/* An executable GCS isn't a good idea. */
+		if (vm_flags & VM_EXEC)
+			return false;
+
+		/* The memory management core should prevent this */
+		VM_WARN_ON(vm_flags & VM_SHARED);
+	}
+
 	return true;
 
 }
diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 642bdf908b22..5943898f366b 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -83,8 +83,15 @@ arch_initcall(adjust_protection_map);
 
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	pteval_t prot = pgprot_val(protection_map[vm_flags &
+	pteval_t prot;
+
+	/* Short circuit GCS to avoid bloating the table. */
+	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
+		prot = _PAGE_GCS_RO;
+	} else {
+		prot = pgprot_val(protection_map[vm_flags &
 				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
+	}
 
 	if (vm_flags & VM_ARM64_BTI)
 		prot |= PTE_GP;

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
