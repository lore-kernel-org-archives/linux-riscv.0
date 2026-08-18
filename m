Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A213BC5DF8B
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Aug 2026 15:32:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2RWMkLp/1r8KQxhLgyUR/I0EEGBNRS5bZ7YzXDoudHo=; b=nx0kYn5rU0RF5o
	l5MGhXNUaTzGibPtgGl7XFaXHaU8xrlp1o9BChA8IdISRFzsWygSvthydy5w4GxDA7LPmkLTYhbSB
	GTucr5pkEFm6jXAkAvJg2fzGIgijzezOsLuAodKxMfEi3lrTIW/KdwMB5aYbfonsRvNH+OxDr7csR
	iLx02AbftRe72CdZb91fejB2K2uh7gKj3McpwTBuHUfG5pNNEb2aUe6rG6qkUeJnEUfczvwLcTNZf
	FhrWRf7l1/4RKSdg86oSpHpYwJSe4UdhjgO/IZ7EdfWNuWFXilMueHTSeij4dfxxGRkfl85TmVupT
	/MvJSCSOvOh8IRZNPqMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4kF-0000000Bo3E-3FJR;
	Thu, 20 Aug 2026 15:31:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wx4kC-0000000Bo1W-0iX0
	for linux-riscv@lists.infradead.org;
	Thu, 20 Aug 2026 15:31:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D041691;
	Thu, 20 Aug 2026 08:31:45 -0700 (PDT)
Received: from fedora (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF05A3F763;
	Thu, 20 Aug 2026 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787239909; bh=i3IVg9/IsAijQfkogrB4lEzc6L9iguV8iX0Bfx9OVtQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t3pY1HjtOuX6eDBKXjOuIvX6DHW5c/WnM7RMPGswlzJy5qaaKh6Mo1WzjqDMM9tD6
	 SBJV8u9muytpDmDygBqYqVAG3lXz8hVKn4pFr3rGu6uDSz8kG8hAHKS0Ij2Lb45XFW
	 fQbe0F6v9VYDaDcCaaz/etrm1sVPQh4mabaY776Y=
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
Subject: [PATCH v3 1/5] selftests/x86: fix Makefile dependencies
Date: Tue, 18 Aug 2026 17:54:24 -0500
Message-ID: <20260818225428.1983328-2-bill.roberts@arm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818225428.1983328-1-bill.roberts@arm.com>
References: <20260818225428.1983328-1-bill.roberts@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260820_083152_347531_4650D3C5 
X-CRM114-Status: UNSURE (   9.28  )
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
 tools/testing/selftests/x86/Makefile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/tools/testing/selftests/x86/Makefile b/tools/testing/selftests/x86/Makefile
index 434065215d12..a9a229f83b77 100644
--- a/tools/testing/selftests/x86/Makefile
+++ b/tools/testing/selftests/x86/Makefile
@@ -124,6 +124,10 @@ $(eval $(call extra-files,test_syscall_vdso_32,thunks_32.S))
 $(eval $(call extra-files,fsgsbase_restore_64,clang_helpers_64.S))
 $(eval $(call extra-files,fsgsbase_restore_32,clang_helpers_32.S))
 $(eval $(call extra-files,sysret_rip_64,clang_helpers_64.S))
+$(eval $(call extra-files,amx_64,xstate.c))
+$(eval $(call extra-files,avx_64,xstate.c))
+$(eval $(call extra-files,avx_64,xstate.c))
+$(eval $(call extra-files,apx_64,xstate.c))
 
 # check_initial_reg_state is special: it needs a custom entry, and it
 # needs to be static so that its interpreter doesn't destroy its initial
@@ -135,6 +139,3 @@ $(OUTPUT)/nx_stack_32: CFLAGS += -Wl,-z,noexecstack
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
