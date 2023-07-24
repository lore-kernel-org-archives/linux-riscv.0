Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD5DBC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 12:48:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iUiyjAGhH61fdFKlO/S1pwsTGzmY58Nkdx351sN0frs=; b=avs6mPql5h2VqA
	ZXnggrgwp1Fq6/IratoeulAa8fpI9Sfb/LdAE6S3fN17yqxKKMf6ggzPAkni0U1xeU5qTCCRp2Jmr
	ikIBdhLw2g+R53SniQJ2ZMJ+gZCOrl/RQfeN2O2axNGlPLQBJA6QdQvKL2uIFSDN9NOZDeSlCU7dt
	HFQuo2HKHSdSs9qPNno5xQnsSh/zkS+eRzLHkhaQM4H/Jkuse65WaUTd9SjxMSuDAC5tAd874XENB
	QEOxALPIkd630ilCy0L1Oc59gDOP3SyPlEBfHjs83jpeX1S2l3v3v4qRYG7LuNx4BkNWHogt75e8U
	ok7Cud0nNrg2pyaLtdUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuzL-004I0m-1J;
	Mon, 24 Jul 2023 12:48:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNuyp-004HY5-0j;
	Mon, 24 Jul 2023 12:48:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B33C061155;
	Mon, 24 Jul 2023 12:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AE72C433C8;
	Mon, 24 Jul 2023 12:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690202882;
	bh=XgAXaxiI+LNUcKtRlH2zykI6sDdksLTFFqJ3d2DlV6Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QGcM4fnx8swpQgYlAoCdgwpYJMLiVk400mojxwsQVLI9u7WmzRJGtjcGmpf1rONDi
	 Xtl0CNWv/G1fjwhLgbOmsjdZGuyrmwVKXp/5dm+/vQL9JmjprgmAxj1w9oVlZOaTTX
	 ofd0nIM5qeZ3BWWsFtmVr8FT6ONga/FRlNL+mdbnCRYlQGpV05t1flnZD1i4BKnzO+
	 nuShnz44zVYhXhF38ilgLT0jabJMYVYktsFVB4G3zxi1wzrt5470MePGh4sNQ8PIs1
	 ck/eqVSuihlN6lGd64GLZFrREDPRbgtoDzTm5R3dJtKyDCT2EkNa1yntyc8ts7GnJs
	 +XXpha8iGolAg==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 24 Jul 2023 13:45:57 +0100
Subject: [PATCH v2 10/35] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20230724-arm64-gcs-v2-10-dc2c1d44c2eb@kernel.org>
References: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
In-Reply-To: <20230724-arm64-gcs-v2-0-dc2c1d44c2eb@kernel.org>
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
 h=from:subject:message-id; bh=XgAXaxiI+LNUcKtRlH2zykI6sDdksLTFFqJ3d2DlV6Q=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBkvnKOdTEcLahkBp5IvWyRhmcZw9T/1AqgLdEteVGJ
 Q6Hg5S2JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZL5yjgAKCRAk1otyXVSH0J4CB/
 9rhqw0udDoYi8sudj/nInZ2l8ch9RyA2y9LlyMnS5EK2PCPsTlwwDG8zCkzr2Jf//EF5g3JIkU3F+J
 XthObw2KIyQ0tYX6oE97ECWKXNidZz8FppyIjF+x/kMI9CeBzOqWvEPh8t2unhLhgWVMqR8NmNMypi
 pnXvc7tLLYYFLfJFYfdsQvaEhlRbAwtAxBJi3WlKEUh8fGTnLU004p6Csd8bW3V2rkU3ApTPpkp51M
 asuqbjt59yH0eTxwGOfrL1qj8Lui/gvJDdjlwnzphEwC/rwfKQhcy8Chgg/9rRm/hQrcawBHad4rWx
 dfQezidZRepEyWt91teiL0228x6T8k
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_054803_346955_68AC0E83 
X-CRM114-Status: GOOD (  13.17  )
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
index c57c5030ef6c..c6af8daceb56 100644
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
