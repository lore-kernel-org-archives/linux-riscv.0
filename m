Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADB6EC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BKk1WPi8eBjuBEKVrCAhW0y7Xc7r0AsKK6epBvsul3Y=; b=pWWgWmBeC2Di58
	66cQHD+6p8YqAzTJbWC0xisNgvuo0uiHBTaL530gQGtHkH5LJAHxfiP2OAaHMil0txrC+NB7LfS9q
	ZlAqcg8KjupeNb84dGCTgI2G+FJsJkV9rkle8/RjU6uZXSrBjKg3TkP/9Czeqg9x/RjPoinoMuVYs
	zyPjHFKs2JCiCtSowRIBnd53fEeNxY+L27ReHyfSRMltZKzTeVy2cvbCXVgTEG04IKwAavlXsRrcC
	6GflUudUccn2t6Rjs6klqtuwmEaf4BxsBunrO6p3POpMvh8bsgJgg8e9Jq/NPB/AQIXrCGcoBEXAg
	1BBWZP+fGniB7Al3iPXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVUx-00000005Mhp-2p3z;
	Thu, 01 Aug 2024 13:05:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVOL-00000005IYS-2xie;
	Thu, 01 Aug 2024 12:58:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 33B4B6289F;
	Thu,  1 Aug 2024 12:58:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5CF41C4AF0B;
	Thu,  1 Aug 2024 12:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517128;
	bh=iKC2Iasck77jV+Uk+oAXshC4xI2+EzWFpjmjkamUboo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dyQayV0fQPSZH8iBt3r920gWMR8PRqUKHxVxDgPQjyeJut555M3l4cDwsz+/L5qQS
	 As1Fxhi/6bCXuwjr9NdjvBX6wDqf/Fxi3a8wGAE/qWUiZL5LYBhtTcPbxCWz/QML29
	 60npbjduYtAn0JzFHAUE8zwm6Q1kOxEoiKce7sC4wvjTflnDQ0DF9MalXGTrLYgS8F
	 gXhhRz+nBXf6sqzaCfAlsMkL7do3RzBVthp97yDax4qvCcZ3OHQ8g2VY2PSqMAZLNd
	 IxRDzjVoRVEX+F42dHQhDdgLvph86KDdI1LnkW1mniZkz3+zak2yx9Ro6Xt7xlGQRb
	 XzXuKvipxoNHQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:40 +0100
Subject: [PATCH v10 13/40] arm64/mm: Map pages for guarded control stack
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-13-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1838; i=broonie@kernel.org;
 h=from:subject:message-id; bh=iKC2Iasck77jV+Uk+oAXshC4xI2+EzWFpjmjkamUboo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YQi3D2wTTUJjuQQY3F7F1CBBVgw8rRNdzwjqNE
 tB9JpyaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGEAAKCRAk1otyXVSH0LglB/
 9TWv0MHUp/MwJEjSWgKUaa9AI9T9ei3Yo/iBGwhTkm2lo8TZTWMdtH0ztI+7/sV7Bv2+cOXKDxO8Wn
 xdLbDBsr/gw3zkkssfqjmj3brMAAxPZsleH+Lznr+NV+/0NRHmSZxbVAVa0JsJVu2db+gWre42Wu2T
 lPKPmT9WC8gLVXsjaY6dzYqMNV662wcZ41nyv8oPea28bIjpwZZNSJspMdUGqpSQdGnjZp/yxu68w5
 Y//Qbhz9rxsr1xOKKwh14tKc+nbFMdl2zKPVWbv5yGUS5EZEVUxqENG9eNNKup/HT0n8dZcq3Yep9V
 Z6RDFNJfx4fCy4UAAQiNxjCf+kO5rX
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055849_940923_2CC47957 
X-CRM114-Status: GOOD (  14.18  )
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
 arch/arm64/mm/mmap.c          | 10 +++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

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
index 642bdf908b22..3ed63fc8cd0a 100644
--- a/arch/arm64/mm/mmap.c
+++ b/arch/arm64/mm/mmap.c
@@ -83,9 +83,17 @@ arch_initcall(adjust_protection_map);
 
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
 
+	/* VM_ARM64_BTI on a GCS is rejected in arch_validate_flags() */
 	if (vm_flags & VM_ARM64_BTI)
 		prot |= PTE_GP;
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
