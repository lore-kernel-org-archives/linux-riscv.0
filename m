Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44979C71150
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 23:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lsx14ARSdkK+MyKouBiHjocT39AUEo7M6gnMb2yLeDI=; b=R2PnAibQTxG3Po
	YD56XiSu+cKeYYjp5i1fj17GhZVXrSHYHGVyCbJHW7lTsxd8jfASSU6PhGB7avOQ2zZFyuh5CFmXK
	0a+qdLZqr3EJTirGCfhWJPFZ93yezmegBeBSvA9msfjgeOPuXlROFd8zQRi9KcCD/JJJPcNSjJcWk
	RpYkrM9QYbqJuR7FSF0g0zrR8pDDEqjOE5FnBU0uwbMJacobOYEq95ujlZhz5U2upL3ubPaNZOrJz
	BPi5ApmUgbQjSxJcruO9vGH9vw0CQMMdEBuUB90KyKBGFad0PDAXBRreFS17sCh863n9hr6YgLZA8
	bmbpXcF2QDwQdyWzuxpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS7U-0000000HMVk-2KE5;
	Wed, 28 Aug 2024 23:30:32 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjS5i-0000000HLOs-0Jtz;
	Wed, 28 Aug 2024 23:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B6C96CE19B2;
	Wed, 28 Aug 2024 23:28:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 068C2C4CEC6;
	Wed, 28 Aug 2024 23:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724887719;
	bh=rFBO85foTdFO3Yh8vyJHtUZjp9uE/dcEpKRiB9tMlcU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Gw16Eci9InmTxeQ/v1QW7kxYKwophg4FALCY/PpN4dJ76jY+jkkPcLa/dolPFzQun
	 VJDTzYf5e5BhG4tmy7HttDryPNy1TQnLRtjJLvUYuQhf0ISni7s9KXf7j0aGTvgb7g
	 dDf5wKBsWjvEncVR8jEJYw+DeW6adMLd4Hy5/WGZZUYTs+SFUMCSGwQk5ZCt+Zm4FI
	 VepVGfYGX86W6Ch+pXH1fFFOHG6rqC2Wc57mpFukSmqGXwAAyzdVPgZbDM8vliymaR
	 dPgTK9+lIPRstG8HVSiTYtDcdMpjlO6sFeKuLl0niQQGcP5/hMimcRIb7fBAN3tCjz
	 RaDEK+jjwNZFg==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 29 Aug 2024 00:27:17 +0100
Subject: [PATCH v12 01/39] mm: Introduce ARCH_HAS_USER_SHADOW_STACK
MIME-Version: 1.0
Message-Id: <20240829-arm64-gcs-v12-1-42fec947436a@kernel.org>
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
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>, 
 David Hildenbrand <david@redhat.com>, 
 "Mike Rapoport (IBM)" <rppt@kernel.org>, Kees Cook <kees@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>
X-Mailer: b4 0.15-dev-37811
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rFBO85foTdFO3Yh8vyJHtUZjp9uE/dcEpKRiB9tMlcU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmz7J5rOeiVZD0x1hdWNMwUC4132egoBxx8QjkFmK5
 Pv24bDmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZs+yeQAKCRAk1otyXVSH0EmcB/
 4pkgEaT4pdaEuaaASONlHltej/0jAvGExqIf5J2OhugKd+NHHJ0jsvzrA6g2c0QV0rfR2cuvQ2ljk1
 RneeaD/6oRc2906gCLFz6qxPdc/szByaOGpmkFWAGOXusNxL4NMnfWG0N+hig4uXIfD/c9l2uaeXhq
 mfnW7i8Yqh/kkl2wism7g/xMtO4gUXlW5pO0na3MebQeWcZo41gsk2cJAZxBJqVMMa2gkQIkqCK6P9
 9wSeJTrUogqeEkopqqK8cXNJ7AUmy4ENF9YK2/VNlb5hLQgmQkJ08ujQat/pcqbq8+eYPEbOjxptOx
 i1rHnmVb55SzZIQwmmp3Q4k24enVQl
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_162842_572837_4AD6AD73 
X-CRM114-Status: GOOD (  13.26  )
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

Since multiple architectures have support for shadow stacks and we need to
select support for this feature in several places in the generic code
provide a generic config option that the architectures can select.

Suggested-by: David Hildenbrand <david@redhat.com>
Acked-by: David Hildenbrand <david@redhat.com>
Reviewed-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Rick Edgecombe <rick.p.edgecombe@intel.com>
Reviewed-by: Mike Rapoport (IBM) <rppt@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Kees Cook <kees@kernel.org>
Tested-by: Kees Cook <kees@kernel.org>
Acked-by: Shuah Khan <skhan@linuxfoundation.org>
Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/x86/Kconfig   | 1 +
 fs/proc/task_mmu.c | 2 +-
 include/linux/mm.h | 2 +-
 mm/Kconfig         | 6 ++++++
 4 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 007bab9f2a0e..320e1f411163 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -1957,6 +1957,7 @@ config X86_USER_SHADOW_STACK
 	depends on AS_WRUSS
 	depends on X86_64
 	select ARCH_USES_HIGH_VMA_FLAGS
+	select ARCH_HAS_USER_SHADOW_STACK
 	select X86_CET
 	help
 	  Shadow stack protection is a hardware feature that detects function
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 5f171ad7b436..0ea49725f524 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -984,7 +984,7 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #ifdef CONFIG_HAVE_ARCH_USERFAULTFD_MINOR
 		[ilog2(VM_UFFD_MINOR)]	= "ui",
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 #ifdef CONFIG_64BIT
diff --git a/include/linux/mm.h b/include/linux/mm.h
index c4b238a20b76..3357625c1db3 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -342,7 +342,7 @@ extern unsigned int kobjsize(const void *objp);
 #endif
 #endif /* CONFIG_ARCH_HAS_PKEYS */
 
-#ifdef CONFIG_X86_USER_SHADOW_STACK
+#ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 /*
  * VM_SHADOW_STACK should not be set with VM_SHARED because of lack of
  * support core mm.
diff --git a/mm/Kconfig b/mm/Kconfig
index b72e7d040f78..3167be663bca 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1263,6 +1263,12 @@ config IOMMU_MM_DATA
 config EXECMEM
 	bool
 
+config ARCH_HAS_USER_SHADOW_STACK
+	bool
+	help
+	  The architecture has hardware support for userspace shadow call
+          stacks (eg, x86 CET, arm64 GCS or RISC-V Zicfiss).
+
 source "mm/damon/Kconfig"
 
 endmenu

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
