Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77A14E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:12:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=APITggX2Gnmgifc4KXivkWWL+8hKPUaUFI4LDcNdIOQ=; b=jRTJOlPjMgoC78
	rAcG2b0xQ4pegu8yEEAvSQhDhBhLFxZc9u5tgeJJUgjW2f0TYPMu/K8VgWHNgeF/JWq86SQ2bB+MC
	Oe7FHdzMRqDf42a/s9dVXN/34QC1iXN+3gAa38wvnUzTqGyuAiaKwrRMjcdBV2J3xShUq9hYrsnlJ
	H0ycIFovBWw1asc8HpjMKQZ28sNRulD949mnJKEa/FuYQStR3OOOVLaswdoYCi1NJDnDilx8sjow2
	+GE5lIkSb93DAM2r0sa327xcKj2MoC13OLpcvUNGma2kIWpdg8HZgGQO/6ENM2qmoogT9QatcYeDE
	dhjI7PYwAnhQVYYFJCTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7Q-00AaWe-1q;
	Mon, 09 Oct 2023 12:12:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7I-00AaMq-0J;
	Mon, 09 Oct 2023 12:12:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 57D1A6111F;
	Mon,  9 Oct 2023 12:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17B99C433C8;
	Mon,  9 Oct 2023 12:11:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853527;
	bh=nFe19RrcDm61i+JVIJSNKwCFAGBQlI1oN8c03/2+1zo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cZGxWSXvQ9p+yKwDzwrWzB8K+WHJgYHI1Erz8lZPQZUjIVKP+bVL6Xl9GUFpktBxe
	 hxdvoPWujKNy0cokSw4VRdpvpwrCR38nw0uDO8tdhtSCc2Gf3hqYoN5AVuGG+dtFXl
	 B0oqdGcPg90/Pll34H0J2fLgA8jEabIHpRHztOFrhc8NklEPwg2oOIPH+N8m486WUw
	 4lTIaRy++XwgJJdJGGOxXbGqck3GBhTXmKln9du8EN9QggrY+v5LSuXXJ9JPUe35OL
	 9A2hH/x+I3R/FaCj1jk9DBSfuO83Q9lo++fe4hpLmO6s62YW1iuQmdEM1f7jfEcvxY
	 DFhl7UE1FYSYw==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:47 +0100
Subject: [PATCH v6 13/38] arm64/mm: Map pages for guarded control stack
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-13-78e55deaa4dd@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837; i=broonie@kernel.org;
 h=from:subject:message-id; bh=nFe19RrcDm61i+JVIJSNKwCFAGBQlI1oN8c03/2+1zo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2bTh8bFfyd2r4ErvGH3ueKxYkR2qokJvrjYIHe
 d3kV+mSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtmwAKCRAk1otyXVSH0GQlB/
 9cpjBNO3Hkf17J4ctj7mZ/0x9xYzjeURnc3L7chNJsl7kVZCHJwsK3oGMSJuzBGHmA8bm5zbKxGdHv
 cIzNzCvwKKPP+GpZ4iV98ewuyU2DUhLI68aHjVxzw1a5ilduYukZQVlSaOEhzaMWfa3JrWfON37j17
 U0ypx1Dn/X62XIv6vRrnZn0kGsmi1oyQ8xGTxxuW9KankfsQ68FXGsqRGt62v5teQZoIs5VHY3mdD2
 MyBLR7qTYazUymR623R0tIYIiOqlfKTrt8pcRb2punJmcVyjApsuS5jnzIRiB2CsNrWsSAbIJO2Jug
 J/T3ncAFQKv5EOKNpQTGTowHJvMb4F
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051208_237429_F8E6CF3D 
X-CRM114-Status: GOOD (  14.11  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/mman.h |  9 +++++++++
 arch/arm64/mm/mmap.c          | 13 ++++++++++++-
 2 files changed, 21 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
index c21849ffdd88..6d3fe6433a62 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -61,6 +61,15 @@ static inline bool arch_validate_flags(unsigned long vm_flags)
 			return false;
 	}
 
+	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
+		/*
+		 * An executable GCS isn't a good idea, and the mm
+		 * core can't cope with a shared GCS.
+		 */
+		if (vm_flags & (VM_EXEC | VM_ARM64_BTI | VM_SHARED))
+			return false;
+	}
+
 	return true;
 
 }
diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
index 8f5b7ce857ed..e6fc7ef83ea1 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -79,9 +79,20 @@ arch_initcall(adjust_protection_map);
 
 pgprot_t vm_get_page_prot(unsigned long vm_flags)
 {
-	pteval_t prot = pgprot_val(protection_map[vm_flags &
+	pteval_t prot;
+
+	/* If this is a GCS then only interpret VM_WRITE. */
+	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
+		if (vm_flags & VM_WRITE)
+			prot = _PAGE_GCS;
+		else
+			prot = _PAGE_GCS_RO;
+	} else {
+		prot = pgprot_val(protection_map[vm_flags &
 				   (VM_READ|VM_WRITE|VM_EXEC|VM_SHARED)]);
+	}
 
+	/* VM_ARM64_BTI on a GCS is rejected in arch_valdiate_flags() */
 	if (vm_flags & VM_ARM64_BTI)
 		prot |= PTE_GP;
 

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
