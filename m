Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EA9EC4828D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wKbGSXLy/76KlFHrIPK0uz1kbE6vufVjKVbgKLgZK5k=; b=O1+FAoSM5JZEz6
	7dpbia+HH+XHcSKvJsr55D3ACNgICaO5gSgvEPDSKXxGD5n4j26/5l9/H2ARgF8N85de+Wme7ern7
	jSUu2f35UR3EG7E59wny6XOaV6K3aHNQzUhhNsiQ37FQQ5YfTUbS4PfAhn5UQYg+0v/frrfVQC2Jg
	+1Q6dpeFNZuXWUVwbY7lDVOWNLJnXYUZrwZhB4qOQEjL0Da9TmTT5Y61H/Br4UkW3ZMNhSZVPf8lk
	wFxhfK8fuYZjxkJdS1a9uli2K2Uh81FukA2b9KG73/nVoYOrit1LueBv1FfM+a8/UOLJxpAT/E46+
	+UBYU99GbkYKv7M6Mi/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF72-0000000GHQR-3BiT;
	Sat, 03 Feb 2024 12:27:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWF6z-0000000GHOr-0GO0;
	Sat, 03 Feb 2024 12:27:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B4EB5CE1F10;
	Sat,  3 Feb 2024 12:27:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 06800C433F1;
	Sat,  3 Feb 2024 12:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963225;
	bh=pFAvrTvTUMO0xGKH/cMXrv1R9nlyUOOKoHgSKri2XFo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C/gZ15/Ih7YAjtmLdHR/TtvRO+E/8UJIq9lmPTUvseNjdRw+s/0VC3c8URiH6Nbmx
	 5VUZhGl3pA1i6VI+ObcmVcAwxp/GorH94ALCXaIJHgg3PGT/wLzihdncGDlOR5tJak
	 4M9B7NVXSmdX/cqc/hLdE43xQ2poQNoEbnSy5k2IDMDbZx6jtvF224lDFrHpZo9nla
	 2tCEW1yrzfYUs0pUcW5taI+xnzeUZMGnvQ1IZIN//VN+Nnha+a9WZc8fa+0FwlKh1x
	 l9htZ7I8HwV9mWsnCWI/GhhzsAoNusqgcHBVJOzXa7+vmdeoI98LlvML84DcXXcrKs
	 HJQXs31uFwAAQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:27 +0000
Subject: [PATCH v8 01/38] arm64/mm: Restructure arch_validate_flags() for
 extensibility
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-1-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
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
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303; i=broonie@kernel.org;
 h=from:subject:message-id; bh=pFAvrTvTUMO0xGKH/cMXrv1R9nlyUOOKoHgSKri2XFo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDRUU8pHKDrpqmD8Z5/cQPWcT2fxI/PTb43xILE
 3klUGLuJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w0QAKCRAk1otyXVSH0ILuCA
 CCaSAWHZ2GgIQmRN8CmYFqqP3TAAMCqBy0U8CCN9L9hh2nWPnKUBPuzE6mZMeadLSL/HQ1G4LHuG0x
 6OMIPqSfSx2wXoguzb8jtTGGQoLKWUT7dsVMq5iVJxUx1BB4yL1EYKRR9o3XdciRZaC7oU3y4jQuQl
 wI4JBRvGqQAIVk6X4V19TKXJBDc+acfsTQK2r4Bc4dtVrYqEyijuhBVKUvyEpec9c97DRYA+gyOdda
 ELM5NGe4shdaggm7TEMjjzbSsUBBc5c5bx2wu+SouBMKV/1Jiq4WYAdo8eW469DQ0awge1JhDylMyX
 jVKn98vbXMa7Xs3VGJ4pR7EQH6Tu24
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_042709_498817_555D1A3A 
X-CRM114-Status: GOOD (  11.44  )
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

Currently arch_validate_flags() is written in a very non-extensible
fashion, returning immediately if MTE is not supported and writing the MTE
check as a direct return. Since we will want to add more checks for GCS
refactor the existing code to be more extensible, no functional change
intended.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/mman.h | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/include/asm/mman.h b/arch/arm64/include/asm/mman.h
index 5966ee4a6154..c21849ffdd88 100644
--- a/arch/arm64/include/asm/mman.h
+++ b/arch/arm64/include/asm/mman.h
@@ -52,11 +52,17 @@ static inline bool arch_validate_prot(unsigned long prot,
 
 static inline bool arch_validate_flags(unsigned long vm_flags)
 {
-	if (!system_supports_mte())
-		return true;
+	if (system_supports_mte()) {
+		/*
+		 * only allow VM_MTE if VM_MTE_ALLOWED has been set
+		 * previously
+		 */
+		if ((vm_flags & VM_MTE) && !(vm_flags & VM_MTE_ALLOWED))
+			return false;
+	}
+
+	return true;
 
-	/* only allow VM_MTE if VM_MTE_ALLOWED has been set previously */
-	return !(vm_flags & VM_MTE) || (vm_flags & VM_MTE_ALLOWED);
 }
 #define arch_validate_flags(vm_flags) arch_validate_flags(vm_flags)
 

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
