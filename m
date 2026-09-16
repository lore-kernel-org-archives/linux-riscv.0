Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2A04C88E77
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 19:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s7f/0yQK0hwep8ourJzXMd5elll3ewmWqVp3AVQqSyQ=; b=RQP4cYJgA/Fi0S
	2XhSkEC8Iw+zT9m675E50csy6OAup5C9rHRHvN8vWt0xqr5wZEhg+P3tINQto2576Sae5LLb+lC+r
	8uY5eCeeHHM6soDYGzYjkdR12UPM9PTlXAnZ4n9Nchmmd9HiGOK0zbIgT7+rDw4hSWF9QC3/f1nEW
	eyyKVazFnh8zitK2bZV1UxXaJmgRh76OdWN/bgRYuv8q5lHEaVtQU+MJPauY2jS9in6jTRsAj7Wtx
	8tbLWKGpMVwNQbgCKBSzdd/UH+pfSBf3rUdUuz6MGJJNwVhYs/JGcikYrjoGNZC/9lAUGpkVRZ9wN
	POBjG+4f9h0WVtQtyNkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoU-00000007qwi-2Ayg;
	Tue, 15 Sep 2026 19:27:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6YoS-00000007qvZ-0SAY
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 19:27:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0B1A1BF3;
	Tue, 15 Sep 2026 12:27:23 -0700 (PDT)
Received: from fedora (LJ9QCPV96V.austin.arm.com [10.118.150.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BB8E93F882;
	Tue, 15 Sep 2026 12:27:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789500447; bh=dxEbHXWTcjfRkZ8H8m2GTN3i0m/Ob9N29KEozpiedGs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=awjJPdnN/Fg/YjjVUJr8qqu9y5vM+Xdm6Rwj4IPozAnMpdCX0QnnZLuVREtuXujVa
	 B2wSZayAW9zWCfQmourO+Ib37aHjvNmkPSGuQjh4FcV0eX096ypJpJj8cM8heMjWNH
	 g5a6mKd4u+yY1PJ6OhojykObH6JHHWmxhQj+o1go=
From: Bill Roberts <bill.roberts@arm.com>
To: "H. Peter Anvin" <hpa@zytor.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Ingo Molnar <mingo@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	rick.p.edgecombe@intel.com,
	Shuah Khan <shuah@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	x86@kernel.org
Cc: bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Bill Roberts <bill.roberts@arm.com>
Subject: [PATCH v4 1/6] selftests/x86: fix Makefile dependencies
Date: Wed, 16 Sep 2026 04:52:19 -0500
Message-ID: <20260916095224.1533971-2-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916095224.1533971-1-bill.roberts@arm.com>
References: <20260916095224.1533971-1-bill.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_122728_196757_47983868 
X-CRM114-Status: UNSURE (   9.99  )
X-CRM114-Notice: Please train this message.
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

The Makefile has a macro called "extra-files" that sets up the
dependency on the target. Right now, for some targets that need
EXTRA_FILES added to the compilation, the dependency is left untracked.
Thus, to fix this, use the aforementioned macro.

Signed-off-by: Bill Roberts <bill.roberts@arm.com>
---
 tools/testing/selftests/x86/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 434065215d12..75315f1190d6 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -124,6 +124,9 @@ $(eval $(call extra-files,test_syscall_vdso_32,thunks_32.S))
 $(eval $(call extra-files,fsgsbase_restore_64,clang_helpers_64.S))
 $(eval $(call extra-files,fsgsbase_restore_32,clang_helpers_32.S))
 $(eval $(call extra-files,sysret_rip_64,clang_helpers_64.S))
+$(eval $(call extra-files,amx_64,xstate.c))
+$(eval $(call extra-files,avx_64,xstate.c))
+$(eval $(call extra-files,apx_64,xstate.c))
 
 # check_initial_reg_state is special: it needs a custom entry, and it
 # needs to be static so that its interpreter doesn't destroy its initial
@@ -135,6 +138,3 @@ $(OUTPUT)/nx_stack_32: CFLAGS += -Wl,-z,noexecstack
 $(OUTPUT)/nx_stack_64: CFLAGS += -Wl,-z,noexecstack
 
 $(OUTPUT)/avx_64: CFLAGS += -mno-avx -mno-avx512f
-$(OUTPUT)/amx_64: EXTRA_FILES += xstate.c
-$(OUTPUT)/avx_64: EXTRA_FILES += xstate.c
-$(OUTPUT)/apx_64: EXTRA_FILES += xstate.c
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
