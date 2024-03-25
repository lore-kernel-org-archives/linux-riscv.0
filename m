Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954CFC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8tKlO2Sfs86n9L9EDAaDuVSrlkjTu784qKHpu9Tn8MA=; b=zgeab7EFu1HnTu
	eJHisLmpMLcXdJzBZH68yTAC1hE47k6JOCVHYABAs3nKdXOpXKwPgWxI9Lrj4ghn+DDECdkLJXzYF
	1d2eT1xzYhcsuiOGjpCq2qgGaRUHExehLDadZGZZt7nq90Idz7fbcA9x5tilbbMiyC1RRWi9I6wsz
	mQKi63epe3ddJ+L/WBr8vIX+bqujqkLgxQQ8b6baqy10nrk7uA9laKChNtQrw/nifEZVgkGZhm2vx
	TBrcMS+U5gUJ67UG4Ik/iagV0hY7S/dFxK38rHX7elWMMmjlb1UkV2oDgEg1Mp8kyiY//Sb9Pfqks
	gRYIjd/WVnxg7O0mEQtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooWi-00000001AuN-1KmF;
	Mon, 25 Mar 2024 17:54:28 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVU-000000019qx-3kLx;
	Mon, 25 Mar 2024 17:53:16 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5a485724ddaso2776281eaf.1;
        Mon, 25 Mar 2024 10:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389190; x=1711993990; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F30AvGE946RVy95xtPHKquJN7yP343T7iOtn6SBetHs=;
        b=Y2vP/PfzbgctTppoZSnlm4LRZc8RAoYWFdTzvg7T09DBJ2wW5p2rQAE6BvQY5IM/08
         owh41m7Pi6DYG7TqsoJKPZ/8mQm/3xPj7B+ZBzCWKlSV4LYTdxLGOmiXT/dV/MxQQNgs
         fSTAmE5pIIBsmlDZkLGQ5IHdGbc21sdiIm2jwJaigP/WhznlpUCOyDqWJUDFcQ0xU5rD
         RollM/K4/ewDaJMIJ4piAe0OngH+tJS01MDJDBrUfS2KXV0cGmM2yLSrvcq6TTj1jIJD
         Vf58etDr96N2otmQ89q2iqZFa4XH/1nYjk+8OjWEC4GfYYctHkWkp1g9SnmTM0iCTtw+
         FqKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389190; x=1711993990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F30AvGE946RVy95xtPHKquJN7yP343T7iOtn6SBetHs=;
        b=mZcfJ2/4OrDAR7EYPY2ThnT/K1wHcZCmmzv59lwnYsXtzyQLdZFYMG1/qWwbzx/l22
         sx1UQas9JATBI0wZzCK57IM52SGjfwpcANFaYeRIrFkdZmT7k4JyRkzNx+4wH8WJC9hq
         0XpneWmr+LFfRfZCsOwx/n/S2Vw4RWGAcf/AEudk+3psdcr4b/t2KlQy6rAaKKyLKNE2
         fe306vu/Ay9x/4ppZHhv7nWbO7WOdUhkDM/12MBjbgCcjhvokDtnIbcPytueGDA0jFAi
         W9WMraCELxZCY93a/P8gGuQ2b49vB2kSv0rx/5AI5J95u907MZI+BSI4H6kacB+PkOc3
         5jXA==
X-Forwarded-Encrypted: i=1; AJvYcCWQLVqvAwbRiWcfdThV34pGXKJx6c/9kemjTSAMrs3Ekp8KqjDvjODrbVH/px2pBD6bLu+RCC4/9TwryDiSn1lANV3647qm1y3iDdtsDg49M1O2Al/Eui74fnUzHVT7RzMidi6q+kEV1bJO5sgDs+9TWDTFA4Q=
X-Gm-Message-State: AOJu0YzKJokthNrQ9wnSQVlQGB3rPLlCm3FGNpuACd/l5DC3OYyL491Q
	rLck8jsNdg+oT/g/eLYq/PWFd7AZ7e7+F4cx1rsSXj12fWS14rL2
X-Google-Smtp-Source: AGHT+IGEgVL6INIMyDJU0IaAEGEaDLUMgFRfTdxKfmOhvRWOloE0bqtXSOQ5POYMBfg/SxiyshOSnA==
X-Received: by 2002:a05:6358:2922:b0:17e:4cad:a11b with SMTP id y34-20020a056358292200b0017e4cada11bmr9108706rwb.19.1711389189758;
        Mon, 25 Mar 2024 10:53:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w62-20020a638241000000b005e485fbd455sm6068607pgd.45.2024.03.25.10.53.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:09 -0700 (PDT)
From: Guenter Roeck <linux@roeck-us.net>
To: linux-kselftest@vger.kernel.org
Cc: David Airlie <airlied@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>,
	=?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Kees Cook <keescook@chromium.org>,
	Daniel Diaz <daniel.diaz@linaro.org>,
	David Gow <davidgow@google.com>,
	Arthur Grillo <arthurgrillo@riseup.net>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	Naresh Kamboju <naresh.kamboju@linaro.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	=?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	dri-devel@lists.freedesktop.org,
	kunit-dev@googlegroups.com,
	linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	loongarch@lists.linux.dev,
	netdev@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v2 09/14] loongarch: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:43 -0700
Message-Id: <20240325175248.1499046-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105313_994498_E15A1C8D 
X-CRM114-Status: GOOD (  13.96  )
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

Add name of functions triggering warning backtraces to the __bug_table
object section to enable support for suppressing WARNING backtraces.

To limit image size impact, the pointer to the function name is only added
to the __bug_table section if both CONFIG_KUNIT_SUPPRESS_BACKTRACE and
CONFIG_DEBUG_BUGVERBOSE are enabled. Otherwise, the __func__ assembly
parameter is replaced with a (dummy) NULL parameter to avoid an image size
increase due to unused __func__ entries (this is necessary because __func__
is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1; resolved context conflict
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/loongarch/include/asm/bug.h | 38 +++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index 08388876ade4..193f396d81a0 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -3,47 +3,63 @@
 #define __ASM_BUG_H
 
 #include <asm/break.h>
+#include <kunit/bug.h>
 #include <linux/stringify.h>
 
 #ifndef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #else
-#define __BUGVERBOSE_LOCATION(file, line)			\
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)  .long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
+#define __BUGVERBOSE_LOCATION(file, func, line)			\
 		.pushsection .rodata.str, "aMS", @progbits, 1;	\
 	10002:	.string file;					\
 		.popsection;					\
 								\
 		.long 10002b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifndef CONFIG_GENERIC_BUG
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #else
-#define __BUG_ENTRY(flags) 					\
+#define __BUG_ENTRY(flags, func)				\
 		.pushsection __bug_table, "aw";			\
 		.align 2;					\
 	10000:	.long 10001f - .;				\
-		_BUGVERBOSE_LOCATION(__FILE__, __LINE__)	\
+		_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)	\
 		.short flags; 					\
 		.popsection;					\
 	10001:
 #endif
 
-#define ASM_BUG_FLAGS(flags)					\
-	__BUG_ENTRY(flags)					\
+#define ASM_BUG_FLAGS(flags, func)				\
+	__BUG_ENTRY(flags, func)				\
 	break		BRK_BUG
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
+
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC    __func__
+#else
+# define __BUG_FUNC    NULL
+#endif
 
 #define __BUG_FLAGS(flags)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags, %0)) : : "i" (__BUG_FUNC));
 
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags));			\
+	if (!IS_SUPPRESSED_WARNING(__func__))			\
+		__BUG_FLAGS(BUGFLAG_WARNING|(flags));		\
 	annotate_reachable();					\
 	instrumentation_end();					\
 } while (0)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
