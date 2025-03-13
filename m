Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CED85C2BA1B
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:01:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=duFjqaKD3abognlhdyBr6gFAEbF8A2I5QQw+o8i083E=; b=aK7juhrVzVPshi
	aCevEknpLtb4cbCfsKck36NQRRfkN9wO7wT6sIaDB4RuqoXOVnmHYjHr7bKQTW+GUm8gg9D7/Ai0s
	xHZT93XSpWNcj10D7qAhSHHZY+UrI//LQM5X0S+FcWTxzvxeMjpxD5dPtLPD2RbERxFuFDuFTvsf2
	A5LVmVhrs/DChHrLGHkLlKyMN8a27TfwSVFhPv10Ic6TnZPafyrMtS+diJDMFwhN7Cl1ZQF6GB2oU
	EdTiIoPEA9IzCWUHjYV3dlQOKVbHjZDBbIlZlmWpOB04EVcYWAObKlpwzbecn/+tc8AytlnBF4tgH
	SnkEN0UqnqV2nSJVNbWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshFT-0000000BADA-1FZf;
	Thu, 13 Mar 2025 12:01:15 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh0v-0000000B5uy-1Ios
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866372;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
	b=Ci9VJgM8lf8++v7H56AskHiBonueMkX1/yCkfFK2/s0zQA5vQhOZLEcNnfrNY6qvcU8oNx
	jdqmxIQdvHvkJjazpnHHsiSClDtQj3Kl3zXme1XMvT2fruFJ6xFSgeICpJji5hAkxw3Vr4
	LLPmnOiHr8UVLBfIlWjllpMjXFHsTAk=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-65-7Rvjc968NPmOtHrIgmhElA-1; Thu, 13 Mar 2025 07:44:48 -0400
X-MC-Unique: 7Rvjc968NPmOtHrIgmhElA-1
X-Mimecast-MFC-AGG-ID: 7Rvjc968NPmOtHrIgmhElA_1741866287
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43935e09897so6482285e9.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 04:44:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866287; x=1742471087;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PbqX7vwCNjEpHKJ2wPiix10XVQC29l2r3Yj9fEcNr2k=;
        b=GWqoJwxM5sciKyQzyuolrsmJGpYVNhh+E4PQq//GNXCvJeLnRC4w3LaUaqdDLLRbBW
         vmxcAHyG+yk8PshhVmo1x1AnL2XCpXaAl3sBUu28SrlXnsgPRwvPcfAE2bccyJGs6nxP
         GkwfL3fK8zLTKtZaJLc0MBum9XvOBoS9P0GFVpLAPx6k/U3f6/2oYtFukixo338ohlWE
         yCiXTMObYX7ZXUwz0qW9YjB2o01R0S5zJyblzSWI06bcAikUP21PWpW4hk99Fv7oA/ha
         IDQeTT2AK8Mr9ZN5bBLiLpjVsOdyi0/gserxGghUTIqcFvS4SlpAdQ7MIZ+7Awoi5hCi
         XksQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmJo9wenW9qEvmsg3B/+hR4+3RL3MEm7KVWheY4X2nSWRefOvm0/QKhRQjUxR/BzW/Gg1XAHbbu/n6Cg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwrflXvoi0s5hl6/ghXUDeBWEPdHJ9M4TKaIreEY+8FTAuPbOAN
	0JRlYhHM83VGqVcxpRupEUeT88bLravK6Xh7nxnm9sA7zDeqqwmYchAUMtTYS+4MQS/OmopBpY7
	A/8CWRncQmSWQSIiPdrZIrTkitY6f3N13xFf48kaNXfVesmaO5Kl3Z78m1rGJH06PwA==
X-Gm-Gg: ASbGncvcaBEe8VNm1feLmyJCgsf04UycZKmYYNICu0JC6DbT4POXYuL+jtQpY5q8xGd
	N1BQg7up05+DIb0zWjsAhRuAtOxa4gdK4keoLZHerpuyCz/c/Bh5ZYwVkjmFVKQA/IyHBt9eIZU
	NQKN/TySh7iL/XG/DYPvsBDPba18yuZCsZC0t/VjyGRiX7EyXqxPnv15qw9a3qTNiaudzXUyyx5
	uLDkBmDqa2WlCYvPf6Qr0uBM2jmJLaf7V9XrXb3w5P5D6IT9b2ruGD9R4NZnnJykEzL7IAIMRYJ
	mFajXSOhiqHUm8iNXdXw
X-Received: by 2002:a05:600c:3512:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43cfe154338mr111255325e9.9.1741866287301;
        Thu, 13 Mar 2025 04:44:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDgHdaZ1G01z8VuKBQ3BfPMVXgqQ5rvdTXEZ7bpTSjr+Dr16GZrLUPpD2KPNpGCET/hDHX7g==
X-Received: by 2002:a05:600c:3512:b0:43c:fe15:41c9 with SMTP id 5b1f17b1804b1-43cfe154338mr111254865e9.9.1741866286869;
        Thu, 13 Mar 2025 04:44:46 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:45 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
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
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
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
	x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 08/14] loongarch: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:23 +0000
Message-Id: <20250313114329.284104-9-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UsxFps8pTUb8o9xoktL6cDZKNuhH7C1oG9-dqMeot8s_1741866287
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044613_426082_F9DE7741 
X-CRM114-Status: GOOD (  12.06  )
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

From: Guenter Roeck <linux@roeck-us.net>

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
Cc: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/loongarch/include/asm/bug.h | 42 ++++++++++++++++++++++----------
 1 file changed, 29 insertions(+), 13 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index f6f254f2c5db..b79ff6696ce6 100644
--- a/arch/loongarch/include/asm/bug.h
+++ b/arch/loongarch/include/asm/bug.h
@@ -3,49 +3,65 @@
 #define __ASM_BUG_H
 
 #include <asm/break.h>
+#include <kunit/bug.h>
 #include <linux/stringify.h>
 #include <linux/objtool.h>
 
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
 	break		BRK_BUG;
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
+
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC    __func__
+#else
+# define __BUG_FUNC    NULL
+#endif
 
-#define __BUG_FLAGS(flags, extra)					\
-	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags))		\
-			     extra);
+#define __BUG_FLAGS(flags, extra)				\
+	asm_inline volatile (__stringify(ASM_BUG_FLAGS(flags, %0)) \
+			     extra : : "i" (__BUG_FUNC) );
 
 #define __WARN_FLAGS(flags)					\
 do {								\
 	instrumentation_begin();				\
-	__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
+	if (!KUNIT_IS_SUPPRESSED_WARNING(__func__))			\
+		__BUG_FLAGS(BUGFLAG_WARNING|(flags), ANNOTATE_REACHABLE(10001b));\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
