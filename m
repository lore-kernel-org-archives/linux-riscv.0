Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB685C47073
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ksa+MR+4Yv3t/EAPLY4q6v9sTrQtIr2YkqCKfWftEQU=; b=MfFOdJk6YwGVbk
	EAIDZolv2cBo/OghMCA3RKqI99O8a5ZoWofcS4Ew+J6iwGB6TZbd81co2orGeQJy3Y/higOS5gXqI
	/EoKQS7oWgukiDErGSPzbSzg2peQ1oHGiu2REMXJGgFEGSU+PiV+RHWysqEKamlw9KogDqmyifYRb
	QZV6S2H5GxlDi0tnumgno5MUQoJ6gbiiBB6odA6s+yxDvEPWb2PNGYbou67JteAINtlvBMhRN3roj
	qGxQQdljtrUOWHvnOXkhVOMg6NLzgR/V0/W+4jnW180gPOq6QwLp7+Xw32VwLNcdLZZ59vYtZCFDh
	Ex9AhBbJrCViAlzpEbAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3gL-00BKEA-1c;
	Wed, 03 Jan 2024 16:01:25 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3gI-00BKBv-0M
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 16:01:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1704297681;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pGw3FQc0MsxvF9cxW/ZiV7CdITqr1kZ41Lg1YYp8Ods=;
	b=SM+PW+ufcKvrlQSkhzHzkFcsdhpXHysZObJHiJXAtSQyCidL5+Ngl521dWXv94aeCOTvW0
	TYGc/cboEbMTgnEEijlna9EK2eEfqyRenck9qi+GGB3iSQswCTJvH5j4iKfN9tYpatSnkn
	chIx8Ywcx8AaBCzItQuRKNccSF/JT4g=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-FLBE86TyPamIMYh0KuevOg-1; Wed, 03 Jan 2024 11:01:14 -0500
X-MC-Unique: FLBE86TyPamIMYh0KuevOg-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-28bbe965866so6292800a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jan 2024 08:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704297673; x=1704902473;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pGw3FQc0MsxvF9cxW/ZiV7CdITqr1kZ41Lg1YYp8Ods=;
        b=YjGXsSdoQBJRr4EC+bQzUGiIzKKcqdDqq1gAOuTNnMcPcfXrQMkFow31lg7IRwGOHx
         1p3EFr3Ag8iyiQVdw3c2yJyLI9rMz2RJV98zqxBxAbfmTmfZBSPHSZh6XLKejWfTtfR8
         FO7XVR8ryM3NsGWzI8wn/3ssufLURAS4bVqsDr1C/s2Y7FkkPT/O2wQOqAjJQRZjWkXT
         nhYl+IPzg/aCw2VC9Vne6/FfqfAA4n6FoMv42BkFeZFv0VxH/kUBsgvdl8YFiKewUWUX
         9c0WaySZ2ZkbLtaCDWIKgNhI4h53HTnvqbsi05Z5FuCQyUglB3CIzv8qjrhU2VEYEFio
         LBHQ==
X-Gm-Message-State: AOJu0YyDQaBgd8Sse3hE1o7T1rmgec9UOzF2ghFs5uQLnOjd4uoSlKHK
	cAU+o/qanLGSOxkdo6OE52/waPZqcFfmD2EDNbh3+6Zt8y491MTNG7NqCNiEtPS2GOEOFThE0tc
	F6n61tX5341aIvegdEUc/5zfL6wIFxRFkvJtG
X-Received: by 2002:a17:90b:4f82:b0:28b:cf7f:3f17 with SMTP id qe2-20020a17090b4f8200b0028bcf7f3f17mr6279174pjb.77.1704297673439;
        Wed, 03 Jan 2024 08:01:13 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2RComsIUtAWCzXZpT7ImLMVrEUH4zz96VXv/Gywk03MIGNb3i0+fYpKYCJQlz+rbFDL1dHg==
X-Received: by 2002:a17:90b:4f82:b0:28b:cf7f:3f17 with SMTP id qe2-20020a17090b4f8200b0028bcf7f3f17mr6279141pjb.77.1704297672832;
        Wed, 03 Jan 2024 08:01:12 -0800 (PST)
Received: from localhost.localdomain ([2804:431:c7ec:911:6911:ca60:846:eb46])
        by smtp.gmail.com with ESMTPSA id qc8-20020a17090b288800b0028b1fce7c01sm1922253pjb.37.2024.01.03.08.01.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jan 2024 08:01:12 -0800 (PST)
From: Leonardo Bras <leobras@redhat.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Leonardo Bras <leobras@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Andy Chiu <andy.chiu@sifive.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Xiao Wang <xiao.w.wang@intel.com>,
	Vincent Chen <vincent.chen@sifive.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Greg Ungerer <gerg@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	David Hildenbrand <david@redhat.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Greentime Hu <greentime.hu@sifive.com>,
	Baoquan He <bhe@redhat.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH v1 3/5] riscv: add compile-time test into is_compat_task()
Date: Wed,  3 Jan 2024 13:00:21 -0300
Message-ID: <20240103160024.70305-5-leobras@redhat.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240103160024.70305-2-leobras@redhat.com>
References: <20240103160024.70305-2-leobras@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_080122_248079_E67CA9F7 
X-CRM114-Status: GOOD (  18.26  )
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

Currently several places will test for CONFIG_COMPAT before testing
is_compat_task(), probably in order to avoid a run-time test into the task
structure.

Since is_compat_task() is an inlined function, it would be helpful to add a
compile-time test of CONFIG_COMPAT, making sure it always returns zero when
the option is not enabled during the kernel build.

With this, the compiler is able to understand in build-time that
is_compat_task() will always return 0, and optimize-out some of the extra
code introduced by the option.

This will also allow removing a lot #ifdefs that were introduced, and make
the code more clean.

Signed-off-by: Leonardo Bras <leobras@redhat.com>
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/compat.h    | 3 +++
 arch/riscv/include/asm/elf.h       | 4 ----
 arch/riscv/include/asm/pgtable.h   | 6 ------
 arch/riscv/include/asm/processor.h | 4 ++--
 4 files changed, 5 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/compat.h b/arch/riscv/include/asm/compat.h
index 2ac955b51148f..91517b51b8e27 100644
--- a/arch/riscv/include/asm/compat.h
+++ b/arch/riscv/include/asm/compat.h
@@ -14,6 +14,9 @@
 
 static inline int is_compat_task(void)
 {
+	if (!IS_ENABLED(CONFIG_COMPAT))
+		return 0;
+
 	return test_thread_flag(TIF_32BIT);
 }
 
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index 59a08367fddd7..2e88257cafaea 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -53,13 +53,9 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #define ELF_ET_DYN_BASE		((DEFAULT_MAP_WINDOW / 3) * 2)
 
 #ifdef CONFIG_64BIT
-#ifdef CONFIG_COMPAT
 #define STACK_RND_MASK		(is_compat_task() ? \
 				 0x7ff >> (PAGE_SHIFT - 12) : \
 				 0x3ffff >> (PAGE_SHIFT - 12))
-#else
-#define STACK_RND_MASK		(0x3ffff >> (PAGE_SHIFT - 12))
-#endif
 #endif
 
 /*
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1d472b31e0cfe..ea5b269be223a 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -127,16 +127,10 @@
 #define VA_USER_SV48 (UL(1) << (VA_BITS_SV48 - 1))
 #define VA_USER_SV57 (UL(1) << (VA_BITS_SV57 - 1))
 
-#ifdef CONFIG_COMPAT
 #define MMAP_VA_BITS_64 ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
 #define MMAP_MIN_VA_BITS_64 (VA_BITS_SV39)
 #define MMAP_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_VA_BITS_64)
 #define MMAP_MIN_VA_BITS (is_compat_task() ? VA_BITS_SV32 : MMAP_MIN_VA_BITS_64)
-#else
-#define MMAP_VA_BITS ((VA_BITS >= VA_BITS_SV48) ? VA_BITS_SV48 : VA_BITS)
-#define MMAP_MIN_VA_BITS (VA_BITS_SV39)
-#endif /* CONFIG_COMPAT */
-
 #else
 #include <asm/pgtable-32.h>
 #endif /* CONFIG_64BIT */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 2278e2a8362af..d2d7ce30baf3e 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -28,7 +28,7 @@
 ({								\
 	unsigned long mmap_end;					\
 	typeof(addr) _addr = (addr);				\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 || is_compat_task())			\
 		mmap_end = STACK_TOP_MAX;			\
 	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
 		mmap_end = VA_USER_SV57;			\
@@ -45,7 +45,7 @@
 	typeof(addr) _addr = (addr);				\
 	typeof(base) _base = (base);				\
 	unsigned long rnd_gap = DEFAULT_MAP_WINDOW - (_base);	\
-	if ((_addr) == 0 || (IS_ENABLED(CONFIG_COMPAT) && is_compat_task())) \
+	if ((_addr) == 0 || is_compat_task())			\
 		mmap_base = (_base);				\
 	else if (((_addr) >= VA_USER_SV57) && (VA_BITS >= VA_BITS_SV57)) \
 		mmap_base = VA_USER_SV57 - rnd_gap;		\
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
