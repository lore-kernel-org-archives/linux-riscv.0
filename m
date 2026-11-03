Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A111606A780
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:19:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=NBCDbW1I;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=WGi3Rlf9
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ylWwyyrVVKdyeQnIrlhhLc7evEvxWU6UcmYavMGtSAU=; b=NBCDbW1ILAUWpSxS+09AekmIrz
	Vw9SWMtHXgcIA0DHx55/5QaFiVizKmu08AiE8N21ZuGttMKGLickLjV/gB3v/VCYogZksFEUkWhV3
	kF4XDDNdluga3k5WNw28bOUblNtPim26ab5f6MS5llwC1vMa3j945O5tscb4VY7PQgNysATIRQmki
	GmWfjoYC3p4E3LB9HZdzuOf4Tyj4yTyRpLXmkGvpOa1rFWbBwsQW8aN1RlhXs42hpK4DFSh+d4LYw
	RGujTFkWGbLCbhCG2NkZMTAu5ycn2Dt9Fb69tOxaUM2cKfEXxuRgIlO3h1q4S/0qKOukRTmSc/7N/
	jztDUmtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGIS-00000002vyc-0KQb;
	Tue, 03 Nov 2026 15:19:36 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGHw-00000002vRs-3ODX
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:19:13 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e8b20a899fso29464815ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 07:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719144; x=1794323944; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=Ed/gwawEhmgCUsO2zTzDURm/4rT61HQtm1nt/NY8TTM=;
        b=WGi3Rlf9YiGW0vFHQNSnOm7cdw3B72i95xXuq1W58Ford6te0x2yGywCPUWWGt8N9+
         uZM8udMFFMn4Wwx38/vfueHAue3mLhZtdIXvVJyCV0NO/mUSBzblmOYtFcRv8J6+ZWRH
         QTTMVebTWadZwkZs1vSpKSXk4Cj1+s5PXX/EE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719144; x=1794323944;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ed/gwawEhmgCUsO2zTzDURm/4rT61HQtm1nt/NY8TTM=;
        b=SbIA4mpH7wVC5o0xX8keyZlR32J06Vw63G8AhM7hR7SJO4qWyWUBYJBrwF5RvSYwwK
         xgGbLGeFd2FQgAhWLKKYZfA1BhycP+c8ZxuGtOs1B4xGJAKyXhQU41CgYS6L/m+dyh9w
         N6OQxnTm8jjpEPnhLBWYKZS3fbw29VOxGcpAv/Zdhq0M6GCvFMrLbtEHJILLLARB3nX3
         0DHbczSe1ZDBqAwMVKtfYLR5DMh5i7+AyVAffhtSSQhmHN8e6ylV3fhIsyJPxxIc9q6M
         wiO/uhNLD8gEKY50liO1NSSyvRImisK5ziSJYTHSnC2rghfkGoYqE5qSjLtpyTe0zz/a
         BXAw==
X-Forwarded-Encrypted: i=1; AKwUvBw5frWO3+HUw8fVBSA2B5GF3X9OFXzfjYaIuwzSNOw3VwEWnORDJmyVVIgc++wNK1OtQ3URKyCnceL1NQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z8S7dAHeR0LgFyXFuXsBcYhAmF51EuDfFyjp573XNshB3sVvUNT
	daSS87t43QD3nl/qpGmSQMouuS/0UTGkNJEqFDtJJ/F71rmM4n4f8tGB9JYgysR8cf0=
X-Gm-Gg: AYBFou21XgHb7GgyyXirFCswVIIUkoC8wBg1/PmKjD1IvgE9BGwtbN1CoTIxC7T4WGq
	ZGrjtC+8zoG6LsPOPgFfLFJg7zNe7V1osaJEM+FKZgkTW+JKjKYZFeGbqUcn41Z3h1r2Y8wCA/H
	KJ1l+Gx+OlLuMYEQYDzHhnfjlt4D0xC5Fc15PZYxZRsrX/Eg2bM8l7N85NQy5QguOwlFSnqUp3j
	xS4pQBp7B4Tg2GxDwSsttM5sRqeJkADsOJktuhXGeUBY8TO4bRejTetZYOO5OS4EsM3NPBRzA8B
	7lhkKDaM41PeCCE1xfsKAh2G2Wyqsp8TpsLBzjSjAC0hWKA333zZAxPnR05q4pJlMNNnyNdAnG+
	GfPTAxweKJ72DC8De/SEXqn8YFO+9ivMKL2FIUGzURxJzZI5EXRT62ATT6tJlaXgX2LydHvZZ6i
	iSxiEs6BB2pU0my7HrqeLli1WgrRnxC4t563J1kixDHbPtTbn+9eWwlx0lpV1M0oVP/LSROUirk
	c7tl7I7UfnIvXimIw9ODZsormVx6BvTgyDhMuHJaCCpbESE1/pGqO5XNoiE36cchAddAgUaorAy
	cAOCTXilC0Oc61n2Bd18k3vFb8yIg5zlDHNMELaMAe3R3s+Apk53kYoDCvr6mF6JRyLOdn2cuz5
	AHqiXncmlDMYVQbzyNLnnsJEYPRdhP3/Uq8baqzIPl8f8X1sBnAYNEk6eD/wslZL1dGNys54yu2
	os1h6W7O2wAjx1lA4Qzw==
X-Received: by 2002:a17:903:1b05:b0:2db:733c:fd1f with SMTP id d9443c01a7336-2eb364005f0mr112964235ad.8.1793719143805;
        Tue, 03 Nov 2026 07:19:03 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb39262c47sm43118815ad.38.2026.11.03.07.19.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:19:02 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:59 +0800
From: Chris Down <chris@chrisdown.name>
To: Andrew Morton <akpm@linux-foundation.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Lorenzo Stoakes <ljs@kernel.org>
Cc: Jeff Xu <jeffxu@google.com>, David Hildenbrand <david@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>, Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Kees Cook <kees@kernel.org>,
	Andrey Vagin <avagin@gmail.com>,
	Alexander Mikhalitsyn <alexander@mihalicyn.com>,
	Shuah Khan <shuah@kernel.org>, Oleg Nesterov <oleg@redhat.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Jiri Olsa <jolsa@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>, Andy Lutomirski <luto@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	WANG Xuerui <kernel@xen0n.name>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>, linux-mm@kvack.org,
	linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-security-module@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: [PATCH v2 7/8] mm/mseal: Add no_mseal_sys_mappings boot parameter
Message-ID: <701a3346a0105e801d247c11139853f156a8d15a.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071907_803684_DD9D7191 
X-CRM114-Status: GOOD (  26.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CONFIG_MSEAL_SYSTEM_MAPPINGS seals each process' system mappings, such
as the vDSO, when they are created. These are read-only or execute-only
mappings which every process trusts, so sealing them means that a memory
corruption bug which can pass a bad pointer to mprotect(), mremap() or
munmap() can't be used to make them writable, or to move or replace
them.

However, sealing can only be chosen at build time, and it breaks
software which moves or modifies these mappings. This is not ideal,
since hosts which want sealing and hosts which run such software then
can't share a kernel.

For example, at Meta, we build sealing into the kernel for our VM hosts,
and we'd like it on as much of the rest of the fleet as possible. The
problem is that the rest of the fleet also runs things which it breaks.
As one example among many, Reverie (which our deterministic execution
tool, Hermit, is built on) patches the vDSO of the processes it traces
by injecting an mprotect() [0]. So right now the hosts which want
sealing need their own kernel image, and this option is one of the
things which forces that.

So, to improve this, let's add no_mseal_sys_mappings. That way one
kernel can be built with CONFIG_MSEAL_SYSTEM_MAPPINGS=y, keep sealing on
by default, and turn it off only on the hosts which need it. Kernels
built without the option are unchanged.

Since sealing can now be turned off at boot, MSEAL_SYSTEM_MAPPINGS also
no longer needs to depend on !CHECKPOINT_RESTORE. The option is off by
default and already documents that it breaks CRIU, so let's drop the
dependency. For the same reason, the documentation no longer needs to
say that it can't be enabled universally.

Link: https://docs.rs/reverie-core/latest/reverie/vdso/index.html # [0]
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
 Documentation/userspace-api/mseal.rst           |  9 +++++----
 mm/Kconfig                                      | 15 ++++++++-------
 mm/mseal.c                                      | 12 ++++++++++++
 mm/vma.h                                        |  5 ++++-
 5 files changed, 36 insertions(+), 12 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..a72904ebb98d 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4603,6 +4603,13 @@ Kernel parameters
 
 	nomodule	Disable module load
 
+	no_mseal_sys_mappings
+			[KNL,EARLY] With CONFIG_MSEAL_SYSTEM_MAPPINGS, don't
+			seal system mappings such as the vDSO. Sealing them
+			breaks software which moves, unmaps or modifies them,
+			such as CHECKPOINT_RESTORE (CRIU), UML, gVisor and rr.
+			See Documentation/userspace-api/mseal.rst.
+
 	nonmi_ipi	[X86] Disable using NMI IPIs during panic/reboot to
 			shutdown the other cpus.  Instead use the REBOOT_VECTOR
 			irq.
diff --git a/Documentation/userspace-api/mseal.rst b/Documentation/userspace-api/mseal.rst
index 060c9829306b..0efdc5469085 100644
--- a/Documentation/userspace-api/mseal.rst
+++ b/Documentation/userspace-api/mseal.rst
@@ -143,12 +143,13 @@ Use cases
 
   If supported by an architecture (CONFIG_ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS),
   the CONFIG_MSEAL_SYSTEM_MAPPINGS seals all system mappings of this
-  architecture.
+  architecture. The ``no_mseal_sys_mappings`` kernel command line parameter
+  turns this off.
 
   WARNING: This feature breaks programs which rely on relocating
-  or unmapping system mappings. Known broken software at the time
-  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
-  this config can't be enabled universally.
+  or unmapping system mappings. Software known to break with it
+  at the time of writing includes CHECKPOINT_RESTORE, UML, gVisor
+  and rr.
 
 When not to use mseal
 =====================
diff --git a/mm/Kconfig b/mm/Kconfig
index 316515589cdb..bb2a60f52c8e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1359,24 +1359,25 @@ config MSEAL_SYSTEM_MAPPINGS
 	bool "mseal system mappings"
 	depends on 64BIT
 	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
-	depends on !CHECKPOINT_RESTORE
 	help
 	  Apply mseal on system mappings.
 	  The system mappings includes vdso, vvar, vvar_vclock,
 	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes,
 	  uprobe trampolines (x86).
 
-	  A 64-bit kernel is required for the memory sealing feature.
-	  No specific hardware features from the CPU are needed.
-
 	  WARNING: This feature breaks programs which rely on relocating
-	  or unmapping system mappings. Known broken software at the time
-	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
-	  this config can't be enabled universally.
+	  or unmapping system mappings. Software known to break with it
+	  at the time of writing includes CHECKPOINT_RESTORE, UML, gVisor
+	  and rr.
+
+	  With this configuration option set, the feature can be disabled
+	  with the no_mseal_sys_mappings boot parameter.
 
 	  For complete descriptions of memory sealing, please see
 	  Documentation/userspace-api/mseal.rst
 
+	  If unsure, say N.
+
 config HAVE_ARCH_USERFAULTFD_WP
 	bool
 	help
diff --git a/mm/mseal.c b/mm/mseal.c
index 7a8ac66dc215..271b44e628c5 100644
--- a/mm/mseal.c
+++ b/mm/mseal.c
@@ -7,6 +7,7 @@
  *  Author: Jeff Xu <jeffxu@chromium.org>
  */
 
+#include <linux/init.h>
 #include <linux/mempolicy.h>
 #include <linux/minmax.h>
 #include <linux/mman.h>
@@ -16,6 +17,17 @@
 #include <linux/sched.h>
 #include "internal.h"
 
+#ifdef CONFIG_MSEAL_SYSTEM_MAPPINGS
+bool mseal_system_mappings_disabled __ro_after_init;
+
+static int __init early_no_mseal_sys_mappings(char *buf)
+{
+	mseal_system_mappings_disabled = true;
+	return 0;
+}
+early_param("no_mseal_sys_mappings", early_no_mseal_sys_mappings);
+#endif
+
 static bool range_contains_unmapped(unsigned long start, unsigned long end)
 {
 	VMA_ITERATOR(vmi, current->mm, start);
diff --git a/mm/vma.h b/mm/vma.h
index 3982b239d0b4..11ff9c7d6592 100644
--- a/mm/vma.h
+++ b/mm/vma.h
@@ -800,9 +800,12 @@ static inline bool vma_is_sealed(struct vm_area_struct *vma)
 }
 #endif
 
+extern bool mseal_system_mappings_disabled;
+
 static inline bool mseal_system_mappings(void)
 {
-	return IS_ENABLED(CONFIG_MSEAL_SYSTEM_MAPPINGS);
+	return IS_ENABLED(CONFIG_MSEAL_SYSTEM_MAPPINGS) &&
+	       !mseal_system_mappings_disabled;
 }
 
 #if defined(CONFIG_STACK_GROWSUP)
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
