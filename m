Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8E6F6071A12
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Nov 2026 15:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=iKQ0Rqbx;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=GG7xzjk/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=1ThxrTHtdsZGg+pIlCMYW9Jx7JA145USTHZUPLTr/JQ=; b=iKQ0RqbxVQRwTJRNMoVDMImU4O
	zyk3Vzpntep9pAQbdVbty4uxTRD6K8seiXa4VPJtdqSrx/b4tGCfAIdZAFyird/FGgg6VTp7EX+jF
	7kcVs8EBxApFBr3nTBYwweYmLLDLnjzQefudP01LylEDesz73HzSC/jXUZzGdCRnTO24nj6yrQ8Ej
	Njjhs/Qjb+zAKZx2M7d4Umm8z1UjpxbLEuR+SKiibEDTFpHhwv+LReFm2jFHa8eRGUdI7szM9nLM2
	KHZRxNvNfXXbjj8LfJC8y50/UFv5bioii2VtJabiYymKTs6j/YHdkEsRzITeB5gqOsiKqIMG5+xJ6
	/chNnhDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGHR-00000002uq6-3nPf;
	Tue, 03 Nov 2026 15:18:33 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOGHM-00000002uke-0Sq3
	for linux-riscv@lists.infradead.org;
	Tue, 03 Nov 2026 15:18:32 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-2ea94541adbso18875975ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 03 Nov 2026 07:18:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793719107; x=1794323907; darn=lists.infradead.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
        b=GG7xzjk/ZoL2k5UJ+hPbYzZzqWXSKOjejmNmYnvFlLkOwXJJXOJWY0wfqUiJO3s30a
         obRWVlulSXGw3ko6pPkGJRf4/PCTW/sPMwq1oKTzpkjLIZzgCAgLJNpFgkAaKFxMW3wi
         IodEqAezQiqjmg5VdLWaiBrGZ3aZMGTYfMxhQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793719107; x=1794323907;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DEpA7EB35ETX+QEM+S0rPeRue+CXb/aqgZ9fcs/1WrA=;
        b=bmKWjWbl238EH0ae1woLjQ0DYwyOUW42qWb5LKitKpEWmhe/6RfNEMBRkU8YxScuPq
         loWKG5/Vu+oixhmT/2Ye+rVWtXOrGnmVEQMwqhN+8xTzuNofVMIQf/PYo35LnNNH3KYo
         YGXlixIlGRaV9xY88Uz7Qbt5GjdyPsfNGirMh/UzVhHWJH4k0yHmPX87fWzculoj5/Ks
         k/504XLsshxgKJvlgNecTwQTZHPxoeHih/Aoq00xpLLLgboxKrEebPVF7fIUFaZ+z2Ow
         mvlVZieGFzUwEzZuXfg29ANihWLm6o5wrizSl9S0NMfjjV9J1NiaBn8kokgYA8Cnud1O
         5X8Q==
X-Forwarded-Encrypted: i=1; AKwUvByqMFFEnyT3iK3ZvUg/vvKcbACsZp2FrqZ83ZLOc79tRFH7h8TGJfQEjMY2zhQIKptTvmYKFKBTVal9lw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/Wcw0cApiOYRcoy6IgiIsxKAkOvhL+SM72N+TM5r6h+cJy0b8x
	lVIG+ltVfMc7YFcwptGcqowLRQoTk7u/09P/ycd+KsmXKRMM59FWGrsh/M0i6Q8U77E=
X-Gm-Gg: AYBFou39Wt3EydGedhPRQto6yxD16Kw69xYfwXXyeGn2xssNpf8q7LV2H+ppr9dmvo0
	/C1X4jvQ8JkicbKrGB0HYOn35+/zpcigzMm6of1oQKhKTiU9GSA0rhTA/0UzmJeX5HN0T8sRPCq
	sSlKNKXah4Y3T50kJuiYR0PoI2tTihlHjVGxl3mpXCcVEb0HNSCJJdNZnXAWA1yDes85Fkj8jAR
	dty6a6g2BIHK1g7UpRQOeVmyZWRDMrOrwHdVgxmptynMXZfEtg95XtpuMPpXb0poEfOnG5gP+pg
	5RCtczOn/Xv5QuQBzEY9vLuqrvMEV2YGfBRgvxq2WAtb5l33KYtiOe5phpk/No80x9eVvqMjl6o
	RDNWdehtG8CeleYqpXMVbk4yHxYbJEqDC+82c/2tfNlFho/+hqnZQl2pXI6apFGsD13roENU3pH
	wA4TU8/1xg1hKJD31Ktfa8w9c9VnYAmi7vQQSxEP07acI110uCFCPnY8dFHSwIo3XrmM1H5i15I
	rQrrXVaJFEZ5MZFvaIxgq6siazqznzs5tFQZ6XmAIXMNb5EwdQxFk3WYXi+W7j/NAMW5ly0OaQN
	3+nNLRiB6p/CSUULmfBbv1jGw/g5KquUVl+H7X29u0K0BulniXmb4NIbxu0mefkqv+O/ns+EyJV
	oXV+T+AzOGuaOMfQPeobPK0w+RSqYa5oRMSOVtjjc5SuvMudfQP81vL21lbsCzcPh7PPLCvoBKR
	m5hAseD2g83qFiZahxaEk=
X-Received: by 2002:a17:903:1aef:b0:2e2:f2f9:b1ef with SMTP id d9443c01a7336-2eb364bc076mr131151785ad.39.1793719107092;
        Tue, 03 Nov 2026 07:18:27 -0800 (PST)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb392613bbsm43426035ad.37.2026.11.03.07.18.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:18:25 -0800 (PST)
Date: Tue, 3 Nov 2026 23:18:23 +0800
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
Subject: [PATCH v2 4/8] mm/mseal: Move MSEAL_SYSTEM_MAPPINGS to mm/Kconfig
Message-ID: <6d72b96fdd36c8870393d8d6e67a811a9bce9e4f.1793718940.git.chris@chrisdown.name>
References: <cover.1793718940.git.chris@chrisdown.name>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <cover.1793718940.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_071830_058463_2B590B7C 
X-CRM114-Status: GOOD (  16.58  )
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

MSEAL_SYSTEM_MAPPINGS is in security/Kconfig, but it's an mm feature,
it's implemented in mm, and changes to it need to go past mm.

Let's move it to mm/Kconfig, next to the other VMA features. No
functional change.

Suggested-by: Lorenzo Stoakes <ljs@kernel.org>
Signed-off-by: Chris Down <chris@chrisdown.name>
---
 mm/Kconfig       | 21 +++++++++++++++++++++
 security/Kconfig | 21 ---------------------
 2 files changed, 21 insertions(+), 21 deletions(-)

diff --git a/mm/Kconfig b/mm/Kconfig
index afff1b25b543..40172787dfa7 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1355,6 +1355,27 @@ config ANON_VMA_NAME
 	  area from being merged with adjacent virtual memory areas due to the
 	  difference in their name.
 
+config MSEAL_SYSTEM_MAPPINGS
+	bool "mseal system mappings"
+	depends on 64BIT
+	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
+	depends on !CHECKPOINT_RESTORE
+	help
+	  Apply mseal on system mappings.
+	  The system mappings includes vdso, vvar, vvar_vclock,
+	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
+
+	  A 64-bit kernel is required for the memory sealing feature.
+	  No specific hardware features from the CPU are needed.
+
+	  WARNING: This feature breaks programs which rely on relocating
+	  or unmapping system mappings. Known broken software at the time
+	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
+	  this config can't be enabled universally.
+
+	  For complete descriptions of memory sealing, please see
+	  Documentation/userspace-api/mseal.rst
+
 config HAVE_ARCH_USERFAULTFD_WP
 	bool
 	help
diff --git a/security/Kconfig b/security/Kconfig
index f7bf6cdc6229..1679e8d009c3 100644
--- a/security/Kconfig
+++ b/security/Kconfig
@@ -49,27 +49,6 @@ config PROC_MEM_NO_FORCE
 
 endchoice
 
-config MSEAL_SYSTEM_MAPPINGS
-	bool "mseal system mappings"
-	depends on 64BIT
-	depends on ARCH_SUPPORTS_MSEAL_SYSTEM_MAPPINGS
-	depends on !CHECKPOINT_RESTORE
-	help
-	  Apply mseal on system mappings.
-	  The system mappings includes vdso, vvar, vvar_vclock,
-	  vectors (arm compat-mode), sigpage (arm compat-mode), uprobes.
-
-	  A 64-bit kernel is required for the memory sealing feature.
-	  No specific hardware features from the CPU are needed.
-
-	  WARNING: This feature breaks programs which rely on relocating
-	  or unmapping system mappings. Known broken software at the time
-	  of writing includes CHECKPOINT_RESTORE, UML, gVisor, rr. Therefore
-	  this config can't be enabled universally.
-
-	  For complete descriptions of memory sealing, please see
-	  Documentation/userspace-api/mseal.rst
-
 config SECURITY
 	bool "Enable different security models"
 	depends on SYSFS
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
