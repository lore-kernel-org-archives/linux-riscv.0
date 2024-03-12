Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 737A0C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 17:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OcsriNavl34Mothp4sJTC+rkBFwjjEEZTvKYp+UCacA=; b=MNWiAyMvcKd4FC
	hhRvgr8d/aSOsdOrZH+BlvIPu1DX5nzryBZQdvIewBXObRoBQ4HThV3ECJN5tcSGToWDkHPrVXK26
	IpC+UmvLoDnCnHFG03FtNI5pv2wN0AMzBxy5KsnwelBAFuMdQ2bdwryMgKzHpYN3ERhku8/p2hVdZ
	zU2ayMOFXxCBMWCFCxH62KO5vCJCsdKE7TWRtPUM5j4++CmV8PgMbW5+luTT44N1TFwIz+cF7lc3C
	TDJpOZCDp3TMr+q5rwa+akuBOQB4IgohcMCiNaXp+EGu+CsCqjuCxRfV44CXa3rSt1xJ6UBLYXnYl
	g7pZKZ5+yYC5SAZIYhgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5Y9-00000006jSw-384M;
	Tue, 12 Mar 2024 17:04:25 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XP-00000006iqi-0rl2;
	Tue, 12 Mar 2024 17:03:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QaoPploMqkrEWkpIzUU4wfevhj/fOj8xGNuIym5RM4g=; b=a7RG6WvFH9bB152C9gr8eZpnwf
	tJBVrJUUxkLWwnSqmj3+Y6EfvGsgnnHBLA5Ynx8FFJShqTnbdays7rg0KfeT41amauaCk6jwAtD+P
	9B+whHq8ogwfKCXikLcq6PzQJeHzW73fjMbOoCvl3wvJB1QcB88D8/az+NKqRiaCsSTU0r2PD1lND
	R4bc5iUeqXbTdNaWnjEVvcbeJfcGczKpQPOTbcMtL43wp00UjRQMcPbjrCMN1OdumjRMefUmXPmDB
	FvZAdmrFELFWkeY93BvOix2O/MjroTfvPg1BytBS2gyhdfAnmzz3yr5B9Dvsp7UxxzH3pO6YxdGhN
	65EElhtQ==;
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XL-00000009YeW-492L;
	Tue, 12 Mar 2024 17:03:37 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-29c52a90417so23563a91.1;
        Tue, 12 Mar 2024 10:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263014; x=1710867814; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QaoPploMqkrEWkpIzUU4wfevhj/fOj8xGNuIym5RM4g=;
        b=BXcNxl3gYXKtKWClxdMgOqP6v86ZL8Es1En6eDzUq8Ifi0c7G4JtJRn2g+yh8OfrWH
         r7ThDKWxiXffy6qdOZzQRVRCndZKzL1UpQITGG4muhx5raJGDINEYXJSfCwWCpJvixX+
         y80l84QUGOVs5Mm1GjD9zFwAIcA/oldq/nRqx4dehb39LUj8+lU2GqAROZUZgGhmXvX2
         oepy2MaNlBxaVo/Nc30UyfHYtwL1pEeEx67ghAMbYSt3raS6/CYX1whBG2uWl70UWYQO
         Br4ieaIdnhGp0TuDT6G/a5nva0nCGZwib3SeGK/8u4LWYA8WZ3aoa6d8Eg34qOLDQ7YF
         Twyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263014; x=1710867814;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=QaoPploMqkrEWkpIzUU4wfevhj/fOj8xGNuIym5RM4g=;
        b=xD7lJ6olTIc48GEE5YYZG/BiNc+JDZgL7L9vk1568/QDtTyxvfIz/WpcO3O+v49/NQ
         6Oz//X2T0+hQYS8FaJlFxekdIzVBhurIy9+2CWNVpf++YE1+5QdTwKfSxrjnTAE95Kxh
         67xxDjTQWy7DIqPa3Lcrxc/k0J7D/9Ja415oV2wssdi1GOAyJbC1KsHmqr7wqAIt8Wri
         cq/5wb5vRZKuH4FSQirBsbxlbdPZh7d0ajrsdz/q2kmC6xja73CpJK3xkYNsdDhfQYx+
         LvanI+35MPNmwI4JscWGbSZhZfOvAIRIgxyQ43XTHQUDjL/LCY+bbTVMCYs4ua2mqQxS
         n0rg==
X-Forwarded-Encrypted: i=1; AJvYcCUbTScrpjZIaSWjdBHxxdnfnw20r6e/GFgDhlHPHpApEC1AuL3d9nEuSnz/k/37XFvTseLvwTXoH6GMWCuEsowjyXNSkZ/GBlG0pP8oK2ip4FnnjYhF0dPUtz/aKR/lZELTiPRKEijvB1PY93e6ejnWoh0FTTQ=
X-Gm-Message-State: AOJu0YwASymgdM09gUIY0PrAE3eVHhs7nu7O/Zuyp2s5W8EtKbAzaREG
	FQBAO9PMa4v++a2hQuAm1Evyy/ubSi64QemUw+fqltsMc/gIy0vO
X-Google-Smtp-Source: AGHT+IGp1mJ0KTZ+LQYMSXPX4xCWLkAXoeTNJUTBRzyrNk3iCGaW03oMbFoz7IlCFWta+THFx92xXA==
X-Received: by 2002:a17:90a:e514:b0:29a:9dd1:d45b with SMTP id t20-20020a17090ae51400b0029a9dd1d45bmr194372pjy.3.1710263013769;
        Tue, 12 Mar 2024 10:03:33 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e11-20020a17090a77cb00b0029bf32b524esm4052208pjs.13.2024.03.12.10.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:32 -0700 (PDT)
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
	netdev@lists.linux.dev,
	Guenter Roeck <linux@roeck-us.net>
Subject: [PATCH 09/14] loongarch: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:04 -0700
Message-Id: <20240312170309.2546362-10-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_170336_155982_6E6FFCC4 
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
to the __bug_table section if both CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE
are enabled. Otherwise, the __func__ assembly parameter is replaced with a
(dummy) NULL parameter to avoid an image size increase due to unused
__func__ entries (this is necessary because __func__ is not a define but a
virtual variable).

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/loongarch/include/asm/bug.h | 38 +++++++++++++++++++++++---------
 1 file changed, 27 insertions(+), 11 deletions(-)

diff --git a/arch/loongarch/include/asm/bug.h b/arch/loongarch/include/asm/bug.h
index d4ca3ba25418..25f2b5ae7702 100644
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
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)  .long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
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
 	instrumentation_end();					\
 } while (0)
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
