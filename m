Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1666BC3DA64
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Aug 2024 13:05:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qlcD/gzQtfzqtxsIbN9k6lxYekrcpTedn4jYErG6eOs=; b=KMFSorv8VyFlPM
	XohikBFWuLcWqe51JfMc9WWs3yq7nFrty0N7ewWUk1FJK7uW4kPvHjLUQdWb1HWo4GdH2FKCrnGce
	2sK51HRaWPk2SQ9BpvaKpwxt5lyAIjst1zk+9qQxMrYWhyxNSJAq37ERu1UG8uDRPmU6eKArVzGSe
	q0HlLbQa6UO/bMhTSbfcvAIp0Kj2zbcMy5vLzi6YgDs9zBfyloW70qMQDmZe+QSTFXsPefrXaGlCS
	cB7JQqP3aJtAOwrGvlMv37THr8ezhQEzreVbeNTLzIR7BDA3s6h3IWoki+r7Q5nJmDriWZPs98ZEV
	LfyOTeEmegRvwRUevI9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVUQ-00000005MOY-35GF;
	Thu, 01 Aug 2024 13:05:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sZVOE-00000005ITs-3FBs;
	Thu, 01 Aug 2024 12:58:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3BD716288E;
	Thu,  1 Aug 2024 12:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AC6DC32786;
	Thu,  1 Aug 2024 12:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722517121;
	bh=yrclwp0293yC9GB/YqBAfQERM0nqbhUl6FyE+eoviK4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OMtPH0QQtyjuzyGFLmvxodnUhI1RcowGJgcVcqpXjp4OIMCKEYXxKeS0Zloiu6ACe
	 7Y0zfhO07G3VFrL/o+SIq6MmOl0CJLDz3Wt6U0/2E55zxehJVMzg68p8qQVBCwdKiZ
	 anTd5o27Tlj8IjZenRvzKlL3K8DnhbnStCp2mm7Aj+m14jz3gCWAaY0P1ghrYK8ThN
	 sZ0TjouWrlUahzC6QOq8d3RjUdUdVoo6Dt9TxzB077E65bzGk5bzRo6b5CF553uAV/
	 6ys2f9aLFBLXha2iCi5+SRM03qQNBGQHs4Y6nVLW37PCjew/gusoTL2CruWyy1GzK8
	 6+IyQV6Ac1uTQ==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 01 Aug 2024 13:06:39 +0100
Subject: [PATCH v10 12/40] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20240801-arm64-gcs-v10-12-699e2bd2190b@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1520; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yrclwp0293yC9GB/YqBAfQERM0nqbhUl6FyE+eoviK4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBmq4YPVQ6/NKZ2FgJD9BDBgenwO3uVt2vwx+JEk7wS
 a+dSp5eJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZquGDwAKCRAk1otyXVSH0PO9B/
 9FjPI6PZJke3DvcVt+TVF5+jjcO2FhunyyoZQBXwVwx0e14Z0TzTQv+M+eqDtAdVaXxEw+nVpGUhKj
 Rzyuud84uh5DfziIcGXe0HGokGGysRLk9OSG+dbJcWvI929qOFL/U5T2T/nCAnz61Mop8929qqKQFV
 W6vCejrk+xyxch2pG67qESCQw8vVyb6VAx2Z4PRuLxokX1bbhCX6+vRKt8Fv1dw01bV0RUfa8/6NsL
 vrLpbU65aCMhK4yG3IA5211146YV98aCoLl9L2ka2dgkMxupbf+n9aISI9eXd5SlWhJZBx2craAReK
 S2fhv2FZ2s1iixEVEAAABxmUNJ0aCK
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240801_055842_954558_99FC28FC 
X-CRM114-Status: GOOD (  10.50  )
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
 include/linux/mm.h                 | 12 +++++++++++-
 2 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index e834779d9611..6a882c57a7e7 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -579,7 +579,7 @@ encoded manner. The codes are the following:
     mt    arm64 MTE allocation tags are enabled
     um    userfaultfd missing tracking
     uw    userfaultfd wr-protect tracking
-    ss    shadow stack page
+    ss    shadow/guarded control stack page
     sl    sealed
     ==    =======================================
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 96faf26b6083..c6c7454ce4e0 100644
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
