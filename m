Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55A37C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:24:33 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB21660FED
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:24:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org EB21660FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6Ej8C9wU8iCQeG+k6mp3vsxDlnlT2d1VJRPSt8qcChc=; b=NTRdrR0JA/QXaAupl5rWL/rVzC
	87oa93j448vr4F4AigXHoawoxV/ZP/1kUJ4tpyd8CQ6O3Ku1cbWPP9tSzTvujDPKlxknjHFGnqWrk
	zqqG8xskpbmo7qlZYDgLwX+IgeTJM+8W6uStl/HZgGaxKSowGoVxaP5rQEWU+5k9ZlWxOSiV/hTlR
	XQzFEiKfRsxZj2lCvyffjuMbaXY7DxOgnHxOiJeOM6nRSFRu3Bw4xC5FPmk2ZUB4U930pigvkweLS
	yr79xNjfeqDJCeKMsnXwDVT3VjnTq6h/ncBFTRoD9z7lL5I98jyDp/syJ2TJ8xy1g8KE6fInmpotj
	8Va+k4Wg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRblW-006mnR-Hu; Wed, 31 Mar 2021 14:24:14 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRblJ-006m68-0c; Wed, 31 Mar 2021 14:24:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 725C060FED;
 Wed, 31 Mar 2021 14:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617200639;
 bh=MKND8RUjXo0TsNaafQ2pFvm3xr35TmSoHeHO5Oj9xjQ=;
 h=From:To:Cc:Subject:Date:From;
 b=TAXb6eUsGCa4pdiVCqqKZnGfljZXt9haax8xWlFgCI3e0unvgRQx8xBTVeRrFGV/q
 ifZGF5satsq3w54m9YLloJlD4yd2NX9uvO/KNJ8oESnJDgML/1NhMS+UOSZqrNVaVB
 LOeHARVji+rKirnnqECw1FuhzLstxw2Vju9F73YHNEp4DrZmDImtmvzWpwBG3HHmkU
 gyTLq73p2b/dG60fDAuaUlJ92XmMV6XhiJLMiNEc5a1fHlv3Qz8pkdKafJ7VR5xJgS
 Ch6PZXwz4Jdc6b/Yk37ku10IPVem2+6nVLkRC8BEnQFfEbcLU9I3SOjITDFAaL1C8C
 nZikeyOe+Fp1w==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 Borislav Petkov <bp@alien8.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Christopher Lameter <cl@linux.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>,
 Elena Reshetova <elena.reshetova@intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Ingo Molnar <mingo@redhat.com>,
 James Bottomley <jejb@linux.ibm.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Matthew Wilcox <willy@infradead.org>,
 Matthew Garrett <mjg59@srcf.ucam.org>, Mark Rutland <mark.rutland@arm.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@linux.ibm.com>,
 Mike Rapoport <rppt@kernel.org>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Shakeel Butt <shakeelb@google.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>, Tycho Andersen <tycho@tycho.ws>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 linux-api@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org,
 linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-nvdimm@lists.01.org,
 linux-riscv@lists.infradead.org, x86@kernel.org
Subject: [PATCH] memfd_secret: use unsigned int rather than long as syscall
 flags type
Date: Wed, 31 Mar 2021 17:23:45 +0300
Message-Id: <20210331142345.27532-1-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_152401_520066_3D80913F 
X-CRM114-Status: GOOD (  14.71  )
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

From: Mike Rapoport <rppt@linux.ibm.com>

Yuri Norov says:

  If parameter size is the same for native and compat ABIs, we may
  wire a syscall made by compat client to native handler. This is
  true for unsigned int, but not true for unsigned long or pointer.

  That's why I suggest using unsigned int and so avoid creating compat
  entry point.

Use unsigned int as the type of the flags parameter in memfd_secret()
system call.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---

@Andrew,
The patch is vs v5.12-rc5-mmots-2021-03-30-23, I'd appreciate if it would
be added as a fixup to the memfd_secret series.

 include/linux/syscalls.h                  | 2 +-
 mm/secretmem.c                            | 2 +-
 tools/testing/selftests/vm/memfd_secret.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
index 49c93c906893..1a1b5d724497 100644
--- a/include/linux/syscalls.h
+++ b/include/linux/syscalls.h
@@ -1050,7 +1050,7 @@ asmlinkage long sys_landlock_create_ruleset(const struct landlock_ruleset_attr _
 asmlinkage long sys_landlock_add_rule(int ruleset_fd, enum landlock_rule_type rule_type,
 		const void __user *rule_attr, __u32 flags);
 asmlinkage long sys_landlock_restrict_self(int ruleset_fd, __u32 flags);
-asmlinkage long sys_memfd_secret(unsigned long flags);
+asmlinkage long sys_memfd_secret(unsigned int flags);
 
 /*
  * Architecture-specific system calls
diff --git a/mm/secretmem.c b/mm/secretmem.c
index f2ae3f32a193..3b1ba3991964 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -199,7 +199,7 @@ static struct file *secretmem_file_create(unsigned long flags)
 	return file;
 }
 
-SYSCALL_DEFINE1(memfd_secret, unsigned long, flags)
+SYSCALL_DEFINE1(memfd_secret, unsigned int, flags)
 {
 	struct file *file;
 	int fd, err;
diff --git a/tools/testing/selftests/vm/memfd_secret.c b/tools/testing/selftests/vm/memfd_secret.c
index c878c2b841fc..2462f52e9c96 100644
--- a/tools/testing/selftests/vm/memfd_secret.c
+++ b/tools/testing/selftests/vm/memfd_secret.c
@@ -38,7 +38,7 @@ static unsigned long page_size;
 static unsigned long mlock_limit_cur;
 static unsigned long mlock_limit_max;
 
-static int memfd_secret(unsigned long flags)
+static int memfd_secret(unsigned int flags)
 {
 	return syscall(__NR_memfd_secret, flags);
 }
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
