Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CA59CF318A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Oct 2024 23:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=i8J6IGk4DawiREyMOi+LPyOwmb3OxEPGZ190gzSYn3U=; b=i0VtUIXtWyggLa
	gW5+w+aknycQBlVzsHrOmYCjDA7LG8ymasBY3ygXYEnMAAhpP7d2S8eTL3DVEq1NgxTkYGKAV8ptk
	DIBZTFr6nBlI1WcdeksMumITzCLN463gWAInfG+JWR4Mjv0zk4M+Mf5sJd3O92oTtWvwQFmQpSTla
	iDOGM9ggj2Qg3Ey/kj8uIwIAVYGsxjTndyH0rgEHC2iEkA6PwdnogJW6aBk1EPhH2BRtziT5Z3rQ7
	QQJOcUagnN+FCoJThU7AGBaNxAHYKphypqHKlT1FsnNwdPtg7Y8516Jv0WWRSen4beOxuQgJGCuM2
	jJuT3qn2hr/2f+4lgW1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svmAE-00000004Lsx-28n1;
	Tue, 01 Oct 2024 23:20:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svlt9-00000004H0a-0gOt;
	Tue, 01 Oct 2024 23:02:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 72E885C5543;
	Tue,  1 Oct 2024 23:02:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32691C4CEC6;
	Tue,  1 Oct 2024 23:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1727823758;
	bh=iaOo/eHnt7nVAYYY04s0CJoGcZR71Wh0L0z0tfAjj5s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gUqqh7nY8DifOXx4W85pnErZS2D1gnTtAy+3DgFxNMmQtLboM/sTyjbKi0UGUvxYE
	 MnPV6ZCsIIJ6o7qGezeh+gI3YMVvc9Jb6VGhEpr3Ph1WOsyCPsnWO/QMsj4eHdpx20
	 P5298HT7y+dw1g1P5hyBAQlmS4D34zxnf2h9aYrrJGJtHSPGXczECZxbvomv0JSMEI
	 2brqU6kp7yqRC63sx+2NCcxw7ZEYrBATr3AqXdUwFLg8qnmQ0HQYdQ5eBj99fc3UTK
	 3WHErdya4+QHcjBF9VZIutYVj3Booae9dNtS22ZpYGEV1wpuiYpI32CInMnHzD7Phl
	 eZsvlvNUlqAyQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 01 Oct 2024 23:58:54 +0100
Subject: [PATCH v13 15/40] arm64/mm: Map pages for guarded control stack
MIME-Version: 1.0
Message-Id: <20241001-arm64-gcs-v13-15-222b78d87eee@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1824; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iaOo/eHnt7nVAYYY04s0CJoGcZR71Wh0L0z0tfAjj5s=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBm/H7P1EJJZsPfYIE0QBq/tINqmBg6uzvjA9MNO4G2
 WFi9f7CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZvx+zwAKCRAk1otyXVSH0IY5B/
 9I4+JyQBe97ebsZEscKo1qo7/m+PT10LjgI7Sgz+xOEzztCrZMsOVvxpJOfRz9LSx3HXo7l/r2fMhO
 o70EbKlG3Ndfo8ukorzVw/0u/VlVIE+M0+uxJE46CJS+gaJLEvLlTr/mr9roUwkqHeI5YJ3u1qCxDg
 sfdiVWbdejibK6kkPIsuDcMl7qLDgPPgfGyCaCEVo58dYkq5niIfdflsydhtntcNM/C56Pa+c0aUx3
 c1CWAKMjvXY1Y+G6FwbVbqON1ejk1JFXdCKgSslWxH6sD1MB8vblGF7f9LD5Jkj1AV8uIM49MW5V/u
 qCNkmAnsAgQFFEoUsAkeMHuk7yKJ/0
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241001_160239_373718_F4BAFD4E 
X-CRM114-Status: GOOD (  12.29  )
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
index 03b790fd0ad8..f6d784f8e6e0 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -71,6 +71,15 @@ static inline bool arch_validate_flags(unsigned long vm_flags)
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
index 7e3ad97e27d8..07aeab8a7606 100644
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
