Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71173CD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 14:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iF71KwmCcHsn7sJ2JB2DuORFFzmgTjHdnvterkJZ3wg=; b=mplcMLEb4iBgdX
	VVPIHqWYzmPucBfMWtBymrMAsOuuiyWPVXMXQ35dnlU2ccdzaDJOoDV8sdzyBrKZtEIy1XWxAARGR
	Zk/7vtVsYSU7K8YIrHuMQWwZQmnrajvZxmmYVKpUCdLGs3tq9rbp2BmuF38JIWosBxwc68oc9xk7y
	kuFymHngdyuDnpJ8WqYoZveU/4UM/YaI6AnYSPUnDodoCv0WaEd9OrQWamRLaAiX9lw7YpNRjx73O
	Xdbibqf6dYlzEivSsVkdIOWMSsjtBrzcMuyckzHiv3g2kGSj/qeH0LUW3fiE6/C1UkzdJpx9WoHTh
	PFoDuV4eQ3wylXqcBd2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1h3-0000000GUki-1M25;
	Wed, 03 Apr 2024 14:34:25 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XG-0000000G8nA-2HdT;
	Wed, 03 Apr 2024 13:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=W4Cw0LtOjrrGR/zeu8wuFTPQ/EpLq4I/3itsXmN/APU=; b=aIJKuzkx3FnUC8PlPLx+HibinQ
	S33j/uCrXl/jLqYanw33iaSMGpLR4JQyplkNB67H7rQtgptXljCiwR8l77k5AYKFt5cR/9lnN8Wsu
	YJjuq3PfvpTtLIBhcN9zVa9l5R3LV7LrP2lnr/nGC0sUSWJI15/HBdUUjkorOv+w92KzvQJ9TJsGR
	9KFBdgQ97kSNMH5tPNgxbMrZaJcC7U7v+cmVv/fXv24DMaW+i2v2krMLb338+WQPZFyOwLlD89LT+
	q4F0QesKkLj7BJczq/gt0LBjmodSuTj7EOSCXTuCxgbldXHSTQTbkAuhkZ+0tXQTgtPDlkQ38MLVI
	fZRl/uPQ==;
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XB-00000005eVi-0JIC;
	Wed, 03 Apr 2024 13:20:13 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1e2235c630aso29583505ad.2;
        Wed, 03 Apr 2024 06:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150398; x=1712755198; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4Cw0LtOjrrGR/zeu8wuFTPQ/EpLq4I/3itsXmN/APU=;
        b=XQIf6wdHLOuc6Cnm4OfYlnkIaeoNdkTm+mrj1wTGG2SWVa69Gj+a7BTMhPNYoTLa3G
         e2iHDcANgzxsRNy3h3BOLOdZowuy0pL8UfWrv6VSs0X39RJDjENS4L4GR1Mu38P+93Kt
         I3YxaTxohYHk2zf9NmWj5l8sy0B5+IBNIWqDqefzVw7qhkv7vHAwAdu7k1JwrCKQXpGY
         /fOwKVCwLxvpjfRtPWdj+OpHcHQ7XTPlbFw6Lt5C2oa0vpA/Wbzc+bRI4ImJbiVZTL26
         OfLcDbJn/J+0HbH00n0FGu1crMQ+awM/mQ9ff9pVfpu+voAjTLaZNzdXiz0SmAIhCJqP
         ryZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150398; x=1712755198;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4Cw0LtOjrrGR/zeu8wuFTPQ/EpLq4I/3itsXmN/APU=;
        b=Sz5gfHMdW+pp3tH9jFbCfgeBCMjkX8HqiA9Hbt+9xJjoHzghghML9V+TwbHFUMYzlI
         zgdvJq2Je8F4QUK8vGNZOEVtZM5exTOZkH2TWUC3h7yXQYLQraRLAnQEb45bQYWwwHAZ
         aPoXfn/gDyUNyMW5HxNozRxtP40kbe1yd11Q9+Ht1wlHfxq4QNsQu+9yGQibhT41l4PB
         Ag7kqtke2D6ahqg8KNcFwadPymAIkIo2ItFCbKAXhA7qH4b2lWYvKhyQx+KGqGSssrAv
         ZxVd7oHdlSGjICYyJLITI4VApay3mpgqNAV1mUQDd4uYq9DKvj1CmV52d2tl+J0wC71q
         Usfg==
X-Forwarded-Encrypted: i=1; AJvYcCV+6YScKDpm8uyWFVGXmE/9aIC/rqksHFrBeqyDrLggLviJ3qSHzQ79Eqp8ykOyS/eXlvegSJa0MUd88bXpm2Vsxo8M9H9H98k2h47pJBN95SxzgZE82PKIWxAkeiZUoWDo4doxgcTd8WxLkiqXWUhofPAWmIc=
X-Gm-Message-State: AOJu0YxHKpaaiigv8MOFLo4AVIfB/TPOzb5czienHtGNr6YqcFNttTsp
	FefdpqhSh4z31C+o6Jhq2kn5MFeNfk2mcI1JtgOIBcRTKkErxbuc
X-Google-Smtp-Source: AGHT+IFWFkTPmr0egylKtq40e/om3PfbjESX8Y3agDhfM9FAMg7tTYjJ0Fk7T/XrXLnOhqzCRkHQ4g==
X-Received: by 2002:a17:903:41c4:b0:1e0:a0d5:1d23 with SMTP id u4-20020a17090341c400b001e0a0d51d23mr17965782ple.29.1712150397884;
        Wed, 03 Apr 2024 06:19:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id i10-20020a17090332ca00b001e0f504a74csm13199577plr.269.2024.04.03.06.19.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:57 -0700 (PDT)
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
	x86@kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Huacai Chen <chenhuacai@kernel.org>
Subject: [PATCH v3 09/15] loongarch: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:30 -0700
Message-Id: <20240403131936.787234-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_142009_161515_37E3F51B 
X-CRM114-Status: GOOD (  13.39  )
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
Cc: Huacai Chen <chenhuacai@kernel.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1; resolved context conflict
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2; resolved context conflict

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
