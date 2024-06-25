Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85A1C2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:04:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ncb8tLH/BMOFu/2dIWzKTaWsMRQlXOEDwGXBqRsD+us=; b=xcRIRgvhTjzA//
	KrzUhSF408o2La/rmbuHRyRxYC6BP0xiWEpG6j+a+jim9mG3ZaznDJrUUJvFRi2/qZnaQsaD0tly+
	bzksUZWJyeb1l0PR2JwPdKr41Q2IcQPq3c6KiyvX2H2sMl76HGVUvCsN6yqziVs/U24PmRs/3Eyze
	8QX78wUeL6bY6oZ5XGxIT4UxVXdHABPeEKHGtWUFgz7VIy38AMt3T3V3fD4ZQPI5Fug6A69M973dT
	N3G8KnwXMr0SP5dIhpBmNnVYRRC92ZHQ3ayETQaj2uQB1liktVWmCBUQGMzYl35JK8Y5F3Mtei7ev
	1isZrRy8N4zDFmd8+LYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7ic-00000003M2W-0JNJ;
	Tue, 25 Jun 2024 15:04:26 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7gP-00000003KD7-2k27;
	Tue, 25 Jun 2024 15:02:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 93606CE1B7E;
	Tue, 25 Jun 2024 15:02:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EEDBC32786;
	Tue, 25 Jun 2024 15:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327725;
	bh=VuG0ltlteCeZ/4k6bojlfT0W44+SKVrRLZbC9hnNujY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=beNCUVs+G6Zn5FAQHKN6Nt0Pwm6rLF22QV0VRU4rYnkvURD1UZQCe3vVKmCo1UKVi
	 FiqWPBa6TOiqgCACUxIfDVIvWuZeTcJiOUs5dgepYOUHxgzJGZABr7hO6vYRTdnXnq
	 nD3/wGk6yn2U6Wv1Swn0USywXyFD7gakSh6WA9RG8H3h85JfjOXV1J4JMcrb77GoUv
	 gy6gRmzoEtabQG0ThNjX6p/J0ezfbHbI/P2DxiDoHNdXbxedAPbJE66du/fzgzSawV
	 ju2hhFwU//Yic98PXLTjx1ZdLar6wsli10UEK74gs5+atzdIV5/1cPlNsKtsUce9qX
	 PGC8Vz5aqwK5g==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:40 +0100
Subject: [PATCH v9 12/39] arm64/mm: Map pages for guarded control stack
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-12-0f634469b8f0@kernel.org>
References: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
In-Reply-To: <20240625-arm64-gcs-v9-0-0f634469b8f0@kernel.org>
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
X-Mailer: b4 0.14-dev-d4707
X-Developer-Signature: v=1; a=openpgp-sha256; l=1903; i=broonie@kernel.org;
 h=from:subject:message-id; bh=VuG0ltlteCeZ/4k6bojlfT0W44+SKVrRLZbC9hnNujY=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmett7/zcfVGPMnD8A1EYvs1Lrbx1uJS8YV4aHxLr1
 42VixbSJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbewAKCRAk1otyXVSH0O4xB/
 9jRMGcN9VYBiS1w2bLk5J1eyjmYaOK1F77J4lI9wHRHHmV5Je7D2sEkWkFenHfMmmLRgEUxY1g3Qfp
 tY+gB6n1Cn8ae9pH2lQLIbZ/8InLffFmqHMUHS3M6H1h78MClzXmGvKcRGsScPuMiqBWDDWCIxD9Fh
 c7l7SRDT42f63ePDVK1z9CvvvU2rysYlXVk5b4eA8/leysGX7w/iukie610QzU5KmtECp+wJE9vIfo
 U6Hq9SNIIDpdWc6U3tlqgFgVDlgOlZaP3RmDO9P8t1n1sObibs7XRnb+VBo1Hqtph9ktjdx2nxraCu
 TTG/KF06eBoEhcWjlYQVd90nWDjsZS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080210_627344_D8088A8E 
X-CRM114-Status: GOOD (  13.88  )
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
index 642bdf908b22..68a17bd09d00 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -83,9 +83,20 @@ arch_initcall(adjust_protection_map);
 
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
 
+	/* VM_ARM64_BTI on a GCS is rejected in arch_validate_flags() */
 	if (vm_flags & VM_ARM64_BTI)
 		prot |= PTE_GP;
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
