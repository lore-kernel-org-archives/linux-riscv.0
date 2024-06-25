Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 090BDC2BBCA
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Jun 2024 15:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ITYJKEppAFsb8PGJ7+llsl1vIkGNsrRV9vdgb+1GVu8=; b=IxpKJzLnFYMRz7
	wNSGg9eAzrlGT03jfnP0mhr3GJVb+1PeesMQY/nLOdfWHBTI2jyRGIEmBxJ+Lfy+/nspwseSc9K+l
	VGVXdrtGAU+Y7bsTif575JQoZnyD6B7QE+SbHThC9d69kXHyWAQW997Kroza4ze2ZGgEApeVkxVxE
	jgHEGrTzNQUrG0oMPKuMb3c1dnzj161Q0bVfU9PkZV+zf/87v++qhO2dypGQEmIZbqwrGRZcNkPrQ
	AlrBK08YXOaQ58JcceRlOP/2jQDbe+iZxdLTZQd+AQFAlDFvzNdSjuXLX1PtRUCWBdcUxejWL/Njz
	L/HLBNX9NtfKxB+ngaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7hm-00000003LQV-0UCm;
	Tue, 25 Jun 2024 15:03:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sM7gG-00000003K5B-0KWb;
	Tue, 25 Jun 2024 15:02:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30B08614AE;
	Tue, 25 Jun 2024 15:01:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53D8AC4AF0C;
	Tue, 25 Jun 2024 15:01:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719327718;
	bh=Unhd124rE/jqvvDlek/bJidtCfK7zFCpWUHj1gtJAlA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kvOcYQElA61q4vtgFvHH6iNGxADyiqY0YwdCW+iuPCtYmIDdprU6J2LZNTqJZ7B7I
	 0sc+IHtBYeIfkavamiFKuOLWcXFXTg93HPGGilGYd5IkCmMASrwxJyti+ApCFaVuTH
	 SfkSeytMwYCYX9hs5vqdYzwqFT0feI1bjJ/CBV+8mX+4EeVCCU5Xi6H9tc83PEL/Y/
	 uECyOkyl4CT2WE7XlCyYJPq95sl48a7ZWupJ8YDnMHUyQgsNgckFyOB3P3dFkHWZiu
	 w2yv9T1b++jG0N5Cvo9w3Dt23fPGM/CBALJcycU1kiPEapEg0VKQEzVXE79SBamAtF
	 jEnImrd60svcw==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Jun 2024 15:57:39 +0100
Subject: [PATCH v9 11/39] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20240625-arm64-gcs-v9-11-0f634469b8f0@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2104; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Unhd124rE/jqvvDlek/bJidtCfK7zFCpWUHj1gtJAlA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmett62ORcDGXHQwaoqfcnrvquyIulzKV0+KAWZJZe
 QPlQBiWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZnrbegAKCRAk1otyXVSH0JBFB/
 4+UsKy2BohvSlBZDXDtE1oilRwWH9qcfuSZrbCrB5+QlcpiplVi9twh40tvp6skJth8Spv9+9jN9oU
 QTm7pt5Wgq08OmDUCdkSa3AOyV/gaFYfmPxrsRgm8tUH8pJKcDGCigaJGhlA1XEWIUncy5BH8e22n2
 39RaNarJ9tB413TLxdGlIPf9zpOYgUsceFpOSWTTad5fk5QHy8slxg+knnaM4oQ90wt6uusO/soT8D
 M4O0a06fkkRut6qjhZ5Cdo54D5qEZg9uXsKLS9fJXY1xtPdCEJi5/mDHKas/L6Sg6cs50W4xoQLJXf
 cG2s6O8xEVu9ASeqP+Y3BGNK0/wL2Q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_080200_613504_D5D154E7 
X-CRM114-Status: GOOD (  11.63  )
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

Use VM_HIGH_ARCH_5 for guarded control stack pages.

Reviewed-by: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/filesystems/proc.rst |  2 +-
 fs/proc/task_mmu.c                 |  3 +++
 include/linux/mm.h                 | 12 +++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 7c3a565ffbef..105312a0b33d 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -570,7 +570,7 @@ encoded manner. The codes are the following:
     mt    arm64 MTE allocation tags are enabled
     um    userfaultfd missing tracking
     uw    userfaultfd wr-protect tracking
-    ss    shadow stack page
+    ss    shadow/guarded control stack page
     ==    =======================================
 
 Note that there is no guarantee that every flag and associated mnemonic will
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index 1b56c1077507..6ef1137bcad8 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -706,6 +706,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 #ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
+#endif
+#ifdef CONFIG_ARM64_GCS
+		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 	};
 	size_t i;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 120abcfaf974..73211cfe7b31 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -353,7 +353,17 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
-#else
+#endif
+
+#if defined(CONFIG_ARM64_GCS)
+/*
+ * arm64's Guarded Control Stack implements similar functionality and
+ * has similar constraints to shadow stacks.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
+#ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
