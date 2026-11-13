Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E7DA60A261C
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Nov 2026 01:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ZLNzmzWv;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=yQbRwKos
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=DKPYE4ELjnR2VYNW61Cyn0uva6Nc/xVVW6nxD7k43sk=; b=ZLNzmzWvz+AzG9qQjRzJd3buE3
	2l4D9Bkcke6C7tOcgfnhicXWsoVjSOj4lzP0RVWbVvfKO3wQSXil+bJbgn3twuA4Ez1PvkCn05DPC
	VZ+4oKhmKSwghWTy/f3yCPwPFedKQZqvJxUpzkwVdllJelBwJlxAAGgsvh28fPG64BJGfMEH1ZfQd
	uoGxF5O6UzvVYWG6qjsqJuT55/RW1GNgNd2nD+iXz4WUmSrM+hyOpbsfEPeuhkE+CfMMYyVwP8kPO
	4CRrReA7PL+5GwGRT8eM9OiI752cUqEjCEu6OyrVohfl6EofRb6k3mz9CF920+maqC9tdcbHtUyAJ
	xy7ueFpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfl6-0000000BPOO-1QrI;
	Fri, 13 Nov 2026 01:07:16 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRfl4-0000000BPNx-0QBJ
	for linux-riscv@lists.infradead.org;
	Fri, 13 Nov 2026 01:07:15 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-3a49a022221so4317021fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 12 Nov 2026 17:07:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794532032; x=1795136832; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aKwOL7gGfUnR/4FiMNley7wGOgKp+Q8U8I3EBmgYU4E=;
        b=yQbRwKosiME6z9XBJBtdKqeq6OcBMBk8sGrAj+rB8ImKgqOyQ/Dg9eKE++dfYv/5NX
         cMTMGX7DsDy2+RRC/Niw8s0pO/XXGyyWNw8xqk0Gbf8fGAdpGhPjFSwtT0cVnStAx+M4
         pozubXWCVF0Op8y5BUbIgD5RXDj4YHLMt/PdGSfNaCcSsCFLMCzOEceWTiRgjQ7sZ9rG
         bi8Euu1+8KaqDqrg9FZIW3e1c4pFEYOGkxGke0FitB2AOpA9BcMvatb1wzEpNGWzILHR
         v9LV+2IqoaxZUrcQG9GZcgxkDENJQ/A+Kze2egrAWlqmW/9Md67tvIaTyXMMd8UNyL1z
         F68w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794532032; x=1795136832;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aKwOL7gGfUnR/4FiMNley7wGOgKp+Q8U8I3EBmgYU4E=;
        b=mWvgrOLlDm+40pFGVMT7RVKb+UecKxJNIJTqEJblraSlP2E0Uy//OKyfAVrMJumWYA
         iYkjEquj4GYIBsV8NmU8LHGiOcO2d9vKOOCoVuzJHPxHLEnxIZyj6TJSkHhGgEVDI2Cv
         UK5I8dv54AcGQ3KtFivau11wI5D3KJCAoHJUI5Uace4qjY3DMeNYq9v0BMPPIS6y8YvX
         evSSOufByPqsacKCVjREaOntsazBd/mc4TiMnBoYLw8PQKkYJnEa2rZ2fNDceKKdaaSr
         XzpsDeiPjsxeuur7xZTWh9O8TJnu1k1tz0A+M8OSVPodep1Md9Qw5zjBqKaKNweHJAD+
         xMqA==
X-Forwarded-Encrypted: i=1; AL+hErGNsxtlFrPm+iNcSrSpfz0X142Xn1O1oEHaOeNGFjaZtRltfFpMduwVqLEBNbzqylJ/madwRyEI6QcyHg==@lists.infradead.org
X-Gm-Message-State: APuU4Z9lIBh+FJJb5NPbn9NTu+sydt5nWFHUMf3FhwDV6hPxIpCPHSyq
	mO/89pD4WbkaC9fOVxXrvQIpag461qS75qjtUKfDLIFiqllIbnJjJoL2QpU9iEtIF00=
X-Gm-Gg: AYBFou3TPrs7eEk8/uSGLA/9h77S4epziVpKVRVc+rCQ8jLfQQdq1IcL1ZZpIBgGcni
	OkhnZgnTGUc9N04d7RW5ULoaIA9Id/0Z0qVpVmiudNoylM5Zto6UsFgycR3uEp4xtBjuJ0A6l9G
	KSN8QMlHcqS7sXaBIoeMigDB2+YIusQnLobArYhmc9/t+axR35cQfiErSrxKsepc6s5UqnnJNmX
	oLLDtC2pcIzNEhDH9qB3cXufz+73WRAPQcWORDke/Dduun7REbvfGcKQaxxXlykhXwMNPRkhrdg
	uUvFk4gj417DPk8hsV0/8NVD7I1w+i11Sdhsfu+zS+2FHgp995JUrHEea4LeDESK0v9xXwZGe0u
	wTMA4zQTbPQgSvgJiNOzLduW4Y3zh3te8xzpjgdaSqiGRqpg0mkIC05/+6bW+0qBjU6LRqb18p4
	sfAdsq75814O9UAUPvd8uDu80SUOitmdryd0dJeQ2NsPUOntkNO5qk6hAApR6OrOxpa9ohsNnaf
	nfnswbmS2j0U2srKRgvB+LmSmYMR28nV2sbvWO5IcJiz81tiiBnobdr6DYtxoPFwxjWIh9csOSI
	sKEcMzg0AIiien/TwLtujyf8Fe0RlncmRfNff9YKSNE43c3repvYQ2mXEah78NXkbh1sBFDOs/J
	/c4JkqnErLQ==
X-Received: by 2002:a05:651c:41cf:b0:3a7:6d4a:1c9f with SMTP id 38308e7fff4ca-3ae2b4f54f0mr3050361fa.15.1794532031836;
        Thu, 12 Nov 2026 17:07:11 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae2b7d183bsm3133941fa.31.2026.11.12.17.07.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 17:07:11 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 06/10] riscv: fix duplicate extern declarations
Date: Fri, 13 Nov 2026 05:06:11 +0400
Message-ID: <20261113010631.139191-7-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261113010631.139191-1-safocl88@gmail.com>
References: <20261113010631.139191-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_170714_176029_5A5B3962 
X-CRM114-Status: GOOD (  11.71  )
X-Spam-Score: -1.9 (-)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Compiling a kernel module with a C++ compiler results in a "duplicate
extern specifier" error.
This occurs because the code contains `extern asmlinkage`, and `asmlinkage`
expands to `extern C` when processed by a C++ compiler.
Since the code already contains sections that respond to a C++ compiler,
I believe it is a perfectly valid approach to gradually move toward a state
where kernel modules can be compiled by a C++ compiler without any issues.
The `extern` specifier must be removed.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=222257

Signed-off-by: Safocl Stollmannovic <safocl88@gmail.com>
---
 arch/riscv/include/asm/string.h | 24 ++++++++++++------------
 arch/riscv/kernel/process.c     |  4 ++--
 arch/riscv/kernel/stacktrace.c  |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index 764ffe8f6..ac895358c 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -10,33 +10,33 @@
 #include <linux/linkage.h>
 
 #define __HAVE_ARCH_MEMSET
-extern asmlinkage void *memset(void *, int, size_t);
-extern asmlinkage void *__memset(void *, int, size_t);
+asmlinkage void *memset(void *, int, size_t);
+asmlinkage void *__memset(void *, int, size_t);
 #define __HAVE_ARCH_MEMCPY
-extern asmlinkage void *memcpy(void *, const void *, size_t);
-extern asmlinkage void *__memcpy(void *, const void *, size_t);
+asmlinkage void *memcpy(void *, const void *, size_t);
+asmlinkage void *__memcpy(void *, const void *, size_t);
 #define __HAVE_ARCH_MEMMOVE
-extern asmlinkage void *memmove(void *, const void *, size_t);
-extern asmlinkage void *__memmove(void *, const void *, size_t);
+asmlinkage void *memmove(void *, const void *, size_t);
+asmlinkage void *__memmove(void *, const void *, size_t);
 
 #if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
 #define __HAVE_ARCH_STRCMP
-extern asmlinkage int strcmp(const char *cs, const char *ct);
+asmlinkage int strcmp(const char *cs, const char *ct);
 
 #define __HAVE_ARCH_STRLEN
-extern asmlinkage __kernel_size_t strlen(const char *);
+asmlinkage __kernel_size_t strlen(const char *);
 
 #define __HAVE_ARCH_STRNCMP
-extern asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
+asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
 
 #define __HAVE_ARCH_STRNLEN
-extern asmlinkage __kernel_size_t strnlen(const char *, size_t);
+asmlinkage __kernel_size_t strnlen(const char *, size_t);
 
 #define __HAVE_ARCH_STRCHR
-extern asmlinkage char *strchr(const char *, int);
+asmlinkage char *strchr(const char *, int);
 
 #define __HAVE_ARCH_STRRCHR
-extern asmlinkage char *strrchr(const char *, int);
+asmlinkage char *strrchr(const char *, int);
 #endif
 
 /* For those files which don't want to check by kasan. */
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 34c1d498d..3e531b6d0 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -39,8 +39,8 @@ unsigned long __stack_chk_guard __read_mostly;
 EXPORT_SYMBOL(__stack_chk_guard);
 #endif
 
-extern asmlinkage void ret_from_fork_kernel_asm(void);
-extern asmlinkage void ret_from_fork_user_asm(void);
+asmlinkage void ret_from_fork_kernel_asm(void);
+asmlinkage void ret_from_fork_user_asm(void);
 
 void noinstr arch_cpu_idle(void)
 {
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c75554471..6ca60cd3d 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -32,7 +32,7 @@
 	val;						\
 })
 
-extern asmlinkage void handle_exception(void);
+asmlinkage void handle_exception(void);
 extern unsigned long ret_from_exception_end;
 
 static inline int fp_is_valid(unsigned long fp, unsigned long sp)
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
