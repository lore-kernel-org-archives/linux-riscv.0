Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55BCC60A2606
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 16:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ooANOnIy;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QhuujIlv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=ctiRak4fNX8x77x+lyMSU6x+9rP+9+h1nLg8Ybm4YK4=; b=ooANOnIyH/Yuq+0fGkpb5E2F82
	Bz+CV0nY3yTik4i2pRgfbh3GV84py9o9sqD+IInW+2kF7HYK0ZcIcGaJ1ecgPVeiW97GY/4PbpRx2
	bIgtkQaBwZrLdHJ6JWvYnCTDsM4qd1filoeSUUbjQGBSYSOYpIFM9urMvBK9sZqx8u5n76Noi7Iph
	5COTK5irbdzxi6zrsbNsgYccdhECOUD2PBfzbFRuVi3lwS1i9GdSocamPn3uwogDkFcIiAwhThNSg
	VWAqppfzyAPkA4POYe29Ss3fglBjxqxuloeuMi58sbxcP3gbGNF0w3cLr6G/KLd+Ch+LIDXc9WluR
	kw02wQqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSH3e-0000000GUqW-3jME;
	Sat, 14 Nov 2026 16:56:54 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSH3c-0000000GUpu-06a5
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 16:56:53 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5c102ad8420so2293050e87.1
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 08:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794675410; x=1795280210; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EFaQhSzmT3PK8VQiQr7HruQbkLNN3qjfxSYlosLuFSg=;
        b=QhuujIlv8joWr49kb0SCiCcUjE8WanO6a/OvNcMEP6Ya4bxizz0SNw61GzgdotYmre
         /23+NYYGyn+lwBiUqAaOX4eAcHKoJMB1Iy39sj98WA9Tle4Jk+1zjfzWmO65SPtusJmq
         5v/eVlLVQ1Qs/hFijASeFfsdig0tGMGH93MHWOtCmvBfc5wOO0wV/XaLf2DeH2AyZEie
         w+jAPt7/5j1juAh/2GBxKty2hJFKB82/tXnsjVqqJv+MHZGE5vU5t160veyVfJO5dlcR
         /p38V6OWNC8fkJ2XYxNhOlOEDUT0Y+cB+ZhUrYGR5UIf5bDv+Iv9nUgKUivwawLqQidj
         BTdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794675410; x=1795280210;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=EFaQhSzmT3PK8VQiQr7HruQbkLNN3qjfxSYlosLuFSg=;
        b=njp4Xp85IDwZczQOPoujc0r83fnZ62PN6tkwhXbCOwGKdH0FjdhFMR09IhXGYQnYr1
         abjkKnXGP7bDlCEJUUgNkvCSJzKJJnBff1KlVFD/4jPU5qZCo36eADKgdGcTnqWwcvE7
         cDPntZLLTibu0zrN0sYvtfMbPV94xTOVXR6PdfdRyg+xGmVIgoT4Fun/onXywQcv75fb
         m+4e3g2831l6lrx0IYSirJVmuR9XHLz4xmlQbQ1YOjxjmCPZw6HnzS6bcCN1qhIN6hPm
         iHlx9zNPl5i6cMQAGn/mBtKhsVqvYbLluRL+VBmBizTWcppCnnLG30hdSo+MK5/hBWz8
         dSmA==
X-Forwarded-Encrypted: i=1; AL+hErENVXadJ/GJM6yPO2ONU/qd1vJu27JOulkwRRO/NhvQgBY6Gv09k3DABD8JlCWSdBMIkq3URoRlNchp9w==@lists.infradead.org
X-Gm-Message-State: APuU4Z//Or+YU+jnyplG3jZFpdWCeeKb9tZYknSmwrD8WV1j2KKxq8H+
	+PoL1JsWAliauTLO2tj6dB3Rr+tQByLmiWeCLmG5EB8YWiSEsmwXh+JK
X-Gm-Gg: AYBFou31GlgtL6+Scjfu9elDbPl4dhyofrXrYswnUdavkDgldWPhmpmLPsRvWb98RlP
	d3cLjCQO0nwPQGN08AaYvy10gYoP8kFuhg1WitRPId8K3uOI+dap/7J52WGCsxxgWAqMpbz2JEz
	fFWSW4kVrcmH4VQLAYL/Wip0WOzSK8WfgTm08q2PgZ3u9Qz+7MBdC0n25/Hfaz+hPFSh+C9USRr
	PRUCBnlkG+yl5oFoIXNL9Wq39GIDZ+++3RNzFiI8EmtDU1Qaze2+Rl6qdP2KKq65YLOhdTSDQUo
	4bcyChskP1PGXAH/z6Q8ds3I0c4hViGAhnU9/RlGj28YCeZX2FHz5nfH3EaeXs2qsvhV7WQO+qI
	UeA0xVBHxt9dIfUTM/L3dZtTVHM4GSGWmfx+Qi0I/fRMGJ4YYHMmYOQq8bxfddkYYl2mcgUo+g3
	D4/zpplwBABDrAmNHQdcynVrGCIbkKU/YujTkuG7y6uTgoBgBt9o+r6S/vOdnbUsfY9Gqcl0Qmv
	YAAx6w6znqCwUfKJ+f6/hQXGB1t4B53E7phpwFSkPhbwogkLEhEXyZOkZdaWtbFOaTWWnUHV2ll
	uxT18Mjo+0ZNG8pOrq9mac6QFRPrvxNjooh7kAzeYTICEUU2cqeCJOM/Oi2FzhmsBFLOyjlhswi
	5zGmm1DaiPQ==
X-Received: by 2002:a05:6512:31d0:b0:5bf:d9b8:15f9 with SMTP id 2adb3069b0e04-5c170b1ecf6mr2496505e87.34.1794675409725;
        Sat, 14 Nov 2026 08:56:49 -0800 (PST)
Received: from SafoStation ([31.40.65.49])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1712dad26sm1792051e87.8.2026.11.14.08.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:56:49 -0800 (PST)
From: Safocl Stollmannovic <safocl88@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v3 06/14] riscv: fix duplicate extern declarations
Date: Sat, 14 Nov 2026 20:55:46 +0400
Message-ID: <20261114165612.368785-7-safocl88@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114165612.368785-1-safocl88@gmail.com>
References: <20261114165612.368785-1-safocl88@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261114_085652_099273_D40526A7 
X-CRM114-Status: GOOD (  11.40  )
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
