Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE2FF606D2E0
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ErFc+fT0;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=nassQ/1B
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ShbiobzF1tAt6piY5PtRRLHtgzNpHd8kYHm5xwlwKAI=; b=ErFc+fT0xtv26RiODqUsjDR9L9
	n55qW5JEf+y1tg2dxQ4esCEI7XFhQhFGGpWJyXSoPue/PjQ+temBdTd+MnRDc/eXSGMo9RN+kZOQR
	U4MXcpey8KrdGBXUa6YHJNM1OKgBcbyIDWmtxuZyQ62BsldN8w1yU8fP/XRDh1aRn8UgRohEL+ZRB
	CEMU/y2DP8PTBN3petbgDkaw6lyC6kPg+Ws4O4s2BqFqyypbRNBAUjh85EAK2rzEZxc6x7Ayyb2gr
	TalA1Xal7jViM41OHZnSX7ZhNbihu0jypD9kEccP3cp9ljRkiuqhLyvGX5rzoqJ1uQwYRYTA5eC/z
	CFTi1AOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGH7-00000002uf9-1Yaj;
	Tue, 03 Nov 2026 15:18:13 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGH4-00000002udg-3gXC
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:18:12 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-cc147d86bebso600685a12.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 07:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719090; x=1794323890; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=qMbUoE7myG/GAn/bAOasbXOTltQ3YhdGAnoaT+YPoYA=;
        b=nassQ/1BbH/KtomqQPYI4yLturhA2w6wXF8W5EKkp8J+rMtUuhqNemP8VPcqgsobX9
         9RtfByBXRhLORogauV6N1T9o4vWzsJlITX55fNQtK3w+0CUWQCtv4gPxxbgNcjzr/8a3
         jdk/euoJoja3oiVNwmaccEkEBmyGd8/Zum6XE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719090; x=1794323890;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qMbUoE7myG/GAn/bAOasbXOTltQ3YhdGAnoaT+YPoYA=;
        b=ycZzVHqpDvpkBGo6ULDtjb4P/z7Tflx8SwcZ+6KsH4vfaC8DlpaTQvEzqaeaM4QaLx
         g43i9TWdRzNZKU3T7HC6MVya0pgctDYNU7jSyBdusSVkmRw5TqSnu4sgJ+pG/nf1+28O
         CoiyCQFdt4oQNQq92x8/khVsReKl/NI3eeqgFQ7SYHN80jLK94x+7Rl9fnh+Q7lDsczD
         IJpFLuJLOHUiqUSGl+44KPduDzJsKhnNnKR0Pn5EvFaTdFjE4Ca03BSqE1AC1JURzuJ1
         cBxANYZVI6vCunfYS/IOgN6geox/rqqJUpL6d4Lvkw6fk7Vk+unmZS7f38/woQey7oeO
         +o6g==
X-Forwarded-Encrypted: i=1; AKwUvBwdilQnZNudsFUMiMN7Ik+kY43MyVfJTs/peLVHGCj8EOBThVRM2zZJNTu4tpkpOSkRSyhwe9WY0kxV/w==@lists.infradead.org
X-Gm-Message-State: APuU4Z9kHBMeh0OdV8UZlx0EcFnuLxJLv4Y1KI7ux8xfUWRFkHfjEChX
	GXDcuJyw/K0Nu320fXUuAZpiQu8TPQoy16Oe8/aL6lUVcJWRtgPG8R3xUJfS7NKwV8Q=
X-Gm-Gg: AYBFou1IPUHe9o4p0KPaP8CI0rlEjN/j9IJXlJpTOkICOLOml4+s7j+Ry+1nC6y86dK
	FNhWS3+yfEMUSNnInqN9skDdfD7G99PrwlBYkqzYtFho8VcdhiSmzd6s9Whc2lpuhSGSGcJ8mXl
	IjltubOJhosjCTn8TtFm/ahtu9RNQnWcv4meMZQv3bMwiRGJPnWVMJamhYRQE3EaNOSUcRxb9NU
	p13FbgPHaXx3XbhCvmc10Nx+U2Z/qXmxx84nJRsdlwojGskCfzlWpSB3T4RG0bO+gmerDoeF6DE
	uN/5IGwKp4wtf8v5wS5MfwT9w4QqvPJTiMoHpYcCRoWFV4vDxpzTGLUlgpN/6vCgWMzX2inC3w+
	VN1HMNPIPn88cB5fXQxrZwzYLh90JhjR4VrAUn8VvQ3hq7VUOIiQowP2Btw92QSFVPZry72LxMj
	o92sxj9B0nnebfWyk7tClFKPldWqAYFHMZ2cv+goLC/m2kQhfnQPs4EOMXsC/F20InnYAogZfoU
	/Jq7rnxqPk5+phGo6Eb3ljyEtZn0KSjFRrlxgPXXyzmDuc+mMlcvTAU+eeLz5xQ2zlVcREogyAu
	cSb0SXdq6iFTMS1mF2OJI+X7FalGfG5KBdlUNnjpW7YCauzieckzFEz/EfzKWcRyAfvhH37nsW7
	o2xdx2zYUbqdpTyFPYYcQEUe/KMUkmUQdZZF7eiKEQS4qW2d1drqtUlKv+D4emBz6ACycg1tP
X-Received: by 2002:a17:90b:3ec7:b0:3ac:7406:b49 with SMTP id 98e67ed59e1d1-3ae896d7a1cmr6969572a91.15.1793719089722;
        Tue, 03 Nov 2026 07:18:09 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c903d0dsm4842349a91.12.2026.11.03.07.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:07 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:04 +0800
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
Subject: [PATCH v2 2/8] selftests/mm: Skip sysmap_is_sealed when system
 mappings aren't sealed
Message-ID: <6b11e9f77d8ede7ef2f16fef173970a7fa1978e5.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071811_000516_6903479E 
X-CRM114-Status: GOOD (  17.28  )
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

Now that sysmap_is_sealed runs with the other mm tests, it also runs on
kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS, where it fails.
Userspace can't tell whether the option is enabled, but a sealed [vdso]
in a new process means that it is.

So let's use [vdso] as the reference: skip if it isn't sealed, and
otherwise expect the other system mappings to be sealed too, and [stack]
not to be.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 tools/testing/selftests/mm/run_vmtests.sh     |  7 +++++-
 tools/testing/selftests/mm/sysmap_is_sealed.c | 22 +++++++++++++++++++
 tools/testing/selftests/mm/vm_util.c          |  5 +++++
 tools/testing/selftests/mm/vm_util.h          |  1 +
 4 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/mm/run_vmtests.sh b/tools/testing/selftests/mm/run_vmtests.sh
index 573da5006268..1134a2e82610 100755
--- a/tools/testing/selftests/mm/run_vmtests.sh
+++ b/tools/testing/selftests/mm/run_vmtests.sh
@@ -307,7 +307,12 @@ fi
 
 CATEGORY="mmap" run_test ./map_populate
 CATEGORY="mmap" run_test ./droppable
-CATEGORY="mmap" run_test ./sysmap_is_sealed
+if gzip -dcfq /proc/config.gz "/boot/config-$(uname -r)" 2>/dev/null |
+		grep -q "^CONFIG_MSEAL_SYSTEM_MAPPINGS=y"; then
+	CATEGORY="mmap" run_test ./sysmap_is_sealed
+else
+	CATEGORY="mmap" run_test ./sysmap_is_sealed -T expect_sealed
+fi
 
 CATEGORY="mlock" run_test ./mlock-random-test
 
diff --git a/tools/testing/selftests/mm/sysmap_is_sealed.c b/tools/testing/selftests/mm/sysmap_is_sealed.c
index cb0ca6ed7ebe..d5ab2b0d8ca7 100644
--- a/tools/testing/selftests/mm/sysmap_is_sealed.c
+++ b/tools/testing/selftests/mm/sysmap_is_sealed.c
@@ -10,9 +10,11 @@
 #include <unistd.h>
 #include <string.h>
 #include <stdbool.h>
+#include <sys/auxv.h>
 
 #include "kselftest.h"
 #include "kselftest_harness.h"
+#include "vm_util.h"
 
 #define VMFLAGS "VmFlags:"
 #define MSEAL_FLAGS "sl"
@@ -46,6 +48,23 @@ bool mapping_is_sealed(char *name, FILE *maps)
 	return false;
 }
 
+static bool sysmaps_sealed(void)
+{
+	void *vdso = (void *)getauxval(AT_SYSINFO_EHDR);
+
+	return vdso && check_vmflag_sealed(vdso);
+}
+
+/*
+ * Kernels built without CONFIG_MSEAL_SYSTEM_MAPPINGS don't seal system
+ * mappings either, so check_sealed skips if they aren't sealed. This fails
+ * instead, so run_vmtests.sh only runs it when that's set.
+ */
+TEST(expect_sealed)
+{
+	EXPECT_TRUE(sysmaps_sealed());
+}
+
 FIXTURE(basic) {
 	FILE *maps;
 };
@@ -107,6 +126,9 @@ FIXTURE_VARIANT_ADD(basic, stack) {
 
 TEST_F(basic, check_sealed)
 {
+	if (!sysmaps_sealed())
+		SKIP(return, "system mappings are not sealed");
+
 	if (!has_mapping(variant->name, self->maps)) {
 		SKIP(return, "could not find the mapping, %s",
 			variant->name);
diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 8ef226107d78..6732f76b7e61 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -785,6 +785,11 @@ bool check_vmflag_guard(void *addr)
 	return check_vmflag(addr, "gu");
 }
 
+bool check_vmflag_sealed(void *addr)
+{
+	return check_vmflag(addr, "sl");
+}
+
 bool softdirty_supported(void)
 {
 	char *addr;
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index d32cb79d9905..0e94793b0d21 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -117,6 +117,7 @@ int uffd_register_with_ioctls(int uffd, void *addr, uint64_t len,
 bool check_vmflag_io(void *addr);
 bool check_vmflag_pfnmap(void *addr);
 bool check_vmflag_guard(void *addr);
+bool check_vmflag_sealed(void *addr);
 int open_procmap(pid_t pid, struct procmap_fd *procmap_out);
 int query_procmap(struct procmap_fd *procmap);
 bool find_vma_procmap(struct procmap_fd *procmap, void *address);
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
