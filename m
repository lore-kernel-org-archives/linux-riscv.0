Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E540E95A91
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Oct 2023 12:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y6p2t8QPKHOUM7nWsziqYTsYAZOhAghm1T0P7Yl5lJI=; b=YeylUob1UzcC43
	cffTEupJx6gozMjnhwS3E30QbadDkHipBQswr6yHbXVov45AKRjxFrcA1Fzwb2LB5DghtzjyyKcwh
	S/xjsG6p0dYyQbolSf3ZPKHQpOlWu75daI7jurIXpEvow3V0r8Qb3BMDZiw0rzu1KxU3SoYyw6mho
	GdzxIh0kiOztT+Ce6YlGepn6xHSSXfnR3mI3xuRWSSU0uAV+kA3J8XaB5VnMke7LhQNskKpzOzaCf
	yivrJTvxL2YYDJNtNzvZ0WafT4xFdDwo3cFRu4XjPqmkll4BXbL2T8zMKol/OXBizLGw3qbisr4gX
	/wuOks/+V3ik2X6w1QNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7M-00AaQu-0e;
	Mon, 09 Oct 2023 12:12:12 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpp7C-00AaFl-0q;
	Mon, 09 Oct 2023 12:12:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 64BADCE138F;
	Mon,  9 Oct 2023 12:12:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0416C433AD;
	Mon,  9 Oct 2023 12:11:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696853519;
	bh=zDATCw7GkV4as2xIWJbM5lO/ptaSO6aC4Ay36HJrvVc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ENONym6LxarYigzay1mcU79+hI/vAoV9b0fyw/J2UUuwzThWjoEsUpd5lkbA5Z4K9
	 P0/CV25CwF+cAdlJvnqs4FLOJ71AZpQHGjzgeYsO08ImaCjN2qlN1BUP8PHqIGKOXQ
	 WpPk61fewqYUGFsssDoC9aSSwPZyJhjkUCFZlDhQ8yPqKCJZLKOpL6emCCp5a+Nt0F
	 UiBPnweFH4fMygG0qDGzAA40oBFFjm3hJQIPQuWZaVzH01aIpiymcfVqNdS7u0T4Vv
	 UG1ntzuihR5n3QwqjmpsnuK/iB+fLmz4UFUxHP9y0RRrp66Z2ME/lzF5xhqIOyc6/T
	 Qq+H9HwSESlGQ==
From: Mark Brown <broonie@kernel.org>
Date: Mon, 09 Oct 2023 13:08:46 +0100
Subject: [PATCH v6 12/38] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20231009-arm64-gcs-v6-12-78e55deaa4dd@kernel.org>
References: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
In-Reply-To: <20231009-arm64-gcs-v6-0-78e55deaa4dd@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-0438c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2033; i=broonie@kernel.org;
 h=from:subject:message-id; bh=zDATCw7GkV4as2xIWJbM5lO/ptaSO6aC4Ay36HJrvVc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlI+2ay7Z6vBAn0o2n8KbXYYUHM/hfs9dGuBEwzhip
 d4LBRGmJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZSPtmgAKCRAk1otyXVSH0EiSB/
 9SbJ/RyLl4aYRdiZA9qvebhW2OnXSpQIYBFctQA1wlLoaPha9i/Ik0Vcc88mJxHtw1nMccHURGYhSU
 WCzpcB67v4hwl5zXoXemcvWBisselh+LDaTccm9Q3IeHsVH9qWHfOrV7GNYlzp2ZOhI1oOhalEzIxm
 FQ38pEJXorEZIfUyQJmBFQ7eBGdhU3kGlrCmBmdSrsXwJmRVdUFxY1e8w6BWvLbvQ3SZip6TI34YQA
 743qUcrWXijdl+JN19YmwtPdHkYckOX7l6DVS9xao5FEkQAk1Ig2lKNDNuMLRbaDa3OP1kFcEAd+/7
 Cm1jQ37tmyw8VT8okrsaLiHFvroO5P
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_051202_707426_FFC46048 
X-CRM114-Status: GOOD (  11.86  )
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
index 2b59cff8be17..9f61f34afc4c 100644
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
index 3dd5be96691b..c0fb4e8b3bbc 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -699,6 +699,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
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
index 1f0d93151a36..9649a1942dda 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,7 +352,17 @@ extern unsigned int kobjsize(const void *objp);
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
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
