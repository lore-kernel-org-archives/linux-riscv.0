Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11560C001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jul 2023 13:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cZlKquIfDibs8rx0FLyz75GR3bUHIWg9D8rOuGGwxU=; b=RtVR7tgqt7uNY5
	mL8MUaJXoZD9RZyV+dFcv7jFKgIfQqqXn9qLp1iD3zSWghM3wU31XsdbNKjOzEIWNkqD8A8C1JRhb
	VsT37zhXwUV1XkfRcqIB4XDYJelc0jUNSuBGjmIXf5TRj/f60i9tOv83+Ant3OqbXUx0mzP/93rCd
	2aGiI3mDabwEfkD+LZrrdpkxKLk2Bp3fbpDqQGwLyxhUn2K9WWwsszhBzFHlD7RhyKc1HirBSyaNU
	a1Fws0SGJ95uGKQgRuPdlY8E5nBjeBLOJBy6pf8exlSxARq+nVx4LUvJm0tJmC5JhBqV7A9jlHbmH
	/JhVnlk0B5u3AhSYCdng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTKN-00FskU-0a;
	Mon, 31 Jul 2023 13:52:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qQTJR-00Fs0m-0p;
	Mon, 31 Jul 2023 13:51:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B0F7F6116A;
	Mon, 31 Jul 2023 13:51:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A3DCC433CC;
	Mon, 31 Jul 2023 13:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690811512;
	bh=38AeaFL37vV9MyUQ5JVKuM1gVCMvtkdVnDbNL3TTQpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qXoeRFLMwwXBpDHEWa1gDstWXEEHjUcKFQ0iBfCJF2J1w6lcePBo/i6CFeI9Y5QVw
	 GVJvkYFg05z6AIECrkSeve9cLXOqlYt0kz+8w064UlspHZkXH/XaawvmKRq2hWPc8Z
	 et4Gq7xTDU8PBiesJLn6Tf2powPoFSO9Fb6sNqIp1XRmXacYZq/5dxBAmPv0uO9kuF
	 Vxyu8Rs/4n5DM9RDgeztpMUTPDR2Cu+29akc7H14VtcOWvW+JsZIpiX88HA89Iid+i
	 7qdIOpWxhQCKWHZpGNSPN/zYk8IAXsVKjIW8z/xPnKA8fUCTNyPPIOTvHUAQCQtH6I
	 63sqWGnRy9cCg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 31 Jul 2023 14:43:19 +0100
Subject: [PATCH v3 10/36] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20230731-arm64-gcs-v3-10-cddf9f980d98@kernel.org>
References: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
In-Reply-To: <20230731-arm64-gcs-v3-0-cddf9f980d98@kernel.org>
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
 h=from:subject:message-id; bh=38AeaFL37vV9MyUQ5JVKuM1gVCMvtkdVnDbNL3TTQpU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkx7wc+fxQLx5AMos/eVhTjWc+kjOb8LaCH/tyLrqi
 Eph2tqWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZMe8HAAKCRAk1otyXVSH0J1LCA
 CGe3cA/HGImzb2h80srHaycpVWYUNkTTKJs5IlcA/d3k+PrXURJAKmJvdRi6ZLVPNZ5XWjFIiVpb69
 0KZ4xEb8L2bsjrvc6dxtiON2Z6Js7joQzDwH87E06xwBZqAktGUNHUBYFljhSCkpO9GFmhm+2spmMj
 8X4k0CTdl+z/4wUScg15dN73TuZK2imHZ8uzOpS5bBJ0QJKBPN0YbpzWdbehgpwonxUOeSfR8D6Cak
 Jeda+JA/v8A1cOTZq2iTG0Emh7FnW1JKSaEUJ1t7e0rTAKFEO6RJLp+kwYC0ILj8LpsMhL7A7OUzN2
 XbVFnL7eKd5md/Eesl2Of3cxn+YO92
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230731_065153_422723_9E29D26F 
X-CRM114-Status: GOOD (  13.46  )
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
index 43fe625b85aa..3f939ae212e5 100644
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
