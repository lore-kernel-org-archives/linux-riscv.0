Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDDD0C04FDF
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Jul 2023 21:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=75qsat41vbObsYds3RA/GEYjm0YR4fSkI09A5LMaSrQ=; b=tUSIO/9lqSnWB9
	HcP8dhgXlyGoKgPEpuAuFOL/hp81Vi6jIjDXaPhaKos0xYczO92Si9A9kK34iA+RuPL+yyrhw2CrG
	E8KNaU9eUQfxmxGT1RO/vNOKrqgGYnn5cMBCKQcEzq/70a/kJ1xTiuhSt94y0X6eseew6n0Rp/DBj
	IuCl2JXF4LP6RVYafPPLupTDlxywmXjmmDycrRPrB+/YBUkG0M7kqU8MowWUOKDvhhSXxKi95R8gV
	xCBF+Hgp9loLxavGVbsdBNlZiHHN4HZicI3++vUN/7ouPLyiq54bHeXtsQn61l4KRHya019VRJ8S4
	l/7nwoAESTojnkGzc5Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9iB-00FtIG-0L;
	Sun, 16 Jul 2023 21:55:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qL9gk-00FrxO-2x;
	Sun, 16 Jul 2023 21:54:02 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C02E60EBC;
	Sun, 16 Jul 2023 21:53:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 228C0C43391;
	Sun, 16 Jul 2023 21:53:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689544437;
	bh=ufPJWcWWu+6JM5PZqp1IxvkydElVfjSFTlywESeiyGo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lzRdJXTo9N1xMkzBJ4HfAyjULGlOFa/mVmdLxxy9olUV7hXENG9iy0FUWWgh32cvA
	 EZLnaY7YkBNlhe1OFL1pFzQufrumuzamHF7cqIAYugdds0nWfewqnKRz+5K0LVyxxD
	 3GaBOMnd8NBl9yhSfvgP2iCwV36Pbw8qj0Opl/vleSeS27Ry/xFnSzEDC9mOZ87KEv
	 /D+uxFghuLK60yFGUtY/zWigdDPc65NQe0SylrU0s+SGFnhxE+RLp3xysvUMe3vxz3
	 qLBZbumD11u7bV2iO5NYDzt/sej57EhLQ8rVg+I/mfOHcfR47V+h2a0f3bAH72nCz6
	 l/vAFhoQFM2XQ==
From: Mark Brown <broonie@kernel.org>
Date: Sun, 16 Jul 2023 22:51:07 +0100
Subject: [PATCH 11/35] mm: Define VM_SHADOW_STACK for arm64 when we support
 GCS
MIME-Version: 1.0
Message-Id: <20230716-arm64-gcs-v1-11-bf567f93bba6@kernel.org>
References: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
In-Reply-To: <20230716-arm64-gcs-v1-0-bf567f93bba6@kernel.org>
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
X-Mailer: b4 0.13-dev-099c9
X-Developer-Signature: v=1; a=openpgp-sha256; l=2027; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ufPJWcWWu+6JM5PZqp1IxvkydElVfjSFTlywESeiyGo=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBktGaXF2oYYZQdYSl/hcMDijqHILEl2w8VSBPWp4zr
 LQDC8xCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZLRmlwAKCRAk1otyXVSH0JBHB/
 0UMsUIVGuhNOpmEycSG+UXYN2beXnLM5L8SfuikOrBSp/GQvhGB4w7gh/BPFR8+CexF6Qe+/ELvupM
 bJNv7jA+8nrgUJnWTVu0NTJ/V+FwH2trT8qp8qfvb2z/7enJaZn0nfz4DXZaeagQMX6hom7CBEzzVW
 /Bj5Nft1u7JkLIUyzRJ/lUdfHkv3WcyIe9NVisS8JrhANKeQ5NSYrf4BDtcjSzPVp5XG5zZQ/OCAz5
 FrsHtOE9d1BW96V4j6dbESpJexmGOJrMycPmff4yo6kMNDeqlfetekL7TWS8bTxcHFbRXVqMDs1EI8
 wYdNjyJyRwRg0C3CqrERuwxLeS24k1
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230716_145400_337455_22CAF98A 
X-CRM114-Status: GOOD (  12.89  )
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

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/filesystems/proc.rst |  2 +-
 fs/proc/task_mmu.c                 |  3 +++
 include/linux/mm.h                 | 12 +++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 6ccb57089a06..086a0408a4d7 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -566,7 +566,7 @@ encoded manner. The codes are the following:
     mt    arm64 MTE allocation tags are enabled
     um    userfaultfd missing tracking
     uw    userfaultfd wr-protect tracking
-    ss    shadow stack page
+    ss    shadow/guarded control stack page
     ==    =======================================
 
 Note that there is no guarantee that every flag and associated mnemonic will
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index cfab855fe7e9..e8c50848bb16 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -711,6 +711,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 #ifdef CONFIG_X86_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
+#endif
+#ifdef CONFIG_ARM64_GCS
+		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 	};
 	size_t i;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index bf16edf2fcd9..f526032c4dc6 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -372,7 +372,17 @@ extern unsigned int kobjsize(const void *objp);
  * having a PAGE_SIZE guard gap.
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
