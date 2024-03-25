Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 512B6C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0SafrlTtYkW9yKqLyjnXg0VqIjUqTqMSXgbnYV6AcmQ=; b=hmtZHRz3K+YJ4d
	vg9VwnlniGzRxe3ee7SVGqCA+amd2rgmh6BeHXyq7InqZLWW9QrJ/erm/5jamhSCPTjfiQQbl7m0G
	yk6FYHBtD/iZWrkXD/FEcgwpjBweTH2F+U/Tdao1h0PNnf6BBNUOY5FuUJKAKuVl/onNldeAIyBAP
	f0SXxUFazKxyHcqXhX0WIFTxST1uSr7ltLt66K8g0QWTGdSmziSZB7cRKJRd7AtUO52mIh8Mxw8we
	RrY10r3ExLOmsi22cUNCk48s4PfSzzCjx0vObhPx1qitr3XuYYAQ7l1yxFl0mt0LPuFmun/NPRxmH
	U+qzBMgfWfyjSvJ8fXhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooWV-00000001AlS-2vMa;
	Mon, 25 Mar 2024 17:54:15 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVS-000000019pp-3Pjt;
	Mon, 25 Mar 2024 17:53:13 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5dc949f998fso2659916a12.3;
        Mon, 25 Mar 2024 10:53:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389188; x=1711993988; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=29uUGQwcrU/fnHD36qAwKUJZLrgVV8mBHbW4bk0/nVs=;
        b=Gv8cJK5Rd3Xa9yhZLuuQkDrqPryLUYtKh96+eLvoKqUpI3zPMO3+NZaqgWgFNitPAH
         gj2nNxrMwnyqFYS+bt8tJORRn04EV1SKqoqyXytk1XlAA8SdeqV1ENMPyrbexFBFLWpe
         v26mzTRU1FxxKyt7dwl0ISiVebG1bBZzPxV1stdkeMnyfjM+9xrtKpVNXv92HKKoJVA5
         sMEu4BLAG3B2DJt6eyUEzSX/UjR+rGBriF6GIYxlEKxTTVCnsM+5+WolHjfASbXKweap
         2ZJsj8epR4hHs+n9vQYNXcaTW36zwMylUtP7I0ZzX6Cvfl72X/6sAMZJE9V6xephiu/R
         gAdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389188; x=1711993988;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=29uUGQwcrU/fnHD36qAwKUJZLrgVV8mBHbW4bk0/nVs=;
        b=j0fkQeWhYAegcdPJukXeJmjvsfZkrptFZGsKgXD/1Zzwy587DTHnG7Zm0XK/lrYbh5
         WKKTeQ6M3Za/56fCFNu9de5q/Ilm8S8ZowskasbJEXF7rPjDMu2I3W/779jLvPhQOtpB
         abngQ9adOU8dN133a2kMH3i9JiiK/kNneTKjdRmzSTtsm0t8CbiQWJi9ReVcY93zbWiJ
         Qy1GbpNYu0YOs/3Vt2MNzVYI5HKe/LizP11HxyaUrfTbGkTkeACiR6XwH2Rzhx63lFdp
         QAIJJH6igCHNs9huxqC23jCqDmxc1gtCSzRaEfoQJhvkmrfSbqjda0aHw3+uS2fp7dXd
         ZfPg==
X-Forwarded-Encrypted: i=1; AJvYcCUo75rCLeGF9tGd1yX0A0W3RZJ+RgIxo50MC7GZ+mDkPaKzNz0XJXrlsw2r0EVGAgZ+BTktk6W1uEb5Z5A2WhBV6vzHINDe0W/rGAgDRA5t5UNeozTL6ovs4PSjI2bQcvkETOCwad1p2ng+l8WUE9mPhAkL99o=
X-Gm-Message-State: AOJu0YxwiuVC6k85WIf3Su04HptQD8xH2qNYxBbLTET1iRY8p14WN/s1
	h96eOkRYRTlCYTmbMpa3qtZyZ5FVuafv+eWTLUcTGtuM/B81tyse
X-Google-Smtp-Source: AGHT+IE/thXvavJDDiOrkU/GUVbH11qVlMEIp4a5f7HZiiXWgBurXkKTZ7C3J9NAO13pjibm2KTwhQ==
X-Received: by 2002:a17:90a:4383:b0:2a0:3c2b:7f22 with SMTP id r3-20020a17090a438300b002a03c2b7f22mr5502580pjg.29.1711389188187;
        Mon, 25 Mar 2024 10:53:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id ee15-20020a17090afc4f00b002a03defa1b4sm6076305pjb.14.2024.03.25.10.53.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:07 -0700 (PDT)
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
Subject: [PATCH v2 08/14] arm64: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:42 -0700
Message-Id: <20240325175248.1499046-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105311_660958_B3350E64 
X-CRM114-Status: GOOD (  13.78  )
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
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/arm64/include/asm/asm-bug.h | 29 +++++++++++++++++++----------
 arch/arm64/include/asm/bug.h     |  8 +++++++-
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index c762038ba400..c6d22e3cd840 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -8,36 +8,45 @@
 #include <asm/brk-imm.h>
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
-#define __BUGVERBOSE_LOCATION(file, line)			\
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)	.long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
+
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
+#define __BUGVERBOSE_LOCATION(file, func, line)		\
 		.pushsection .rodata.str,"aMS",@progbits,1;	\
 	14472:	.string file;					\
 		.popsection;					\
 								\
 		.long 14472b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
 #else
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
 
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY(flags, func)			\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)		\
+		.short flags;				\
 		.popsection;				\
 	14471:
 #else
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #endif
 
-#define ASM_BUG_FLAGS(flags)				\
-	__BUG_ENTRY(flags)				\
+#define ASM_BUG_FLAGS(flags, func)			\
+	__BUG_ENTRY(flags, func)			\
 	brk	BUG_BRK_IMM
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
 
 #endif /* __ASM_ASM_BUG_H */
diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
index 28be048db3f6..044c5e24a17d 100644
--- a/arch/arm64/include/asm/bug.h
+++ b/arch/arm64/include/asm/bug.h
@@ -11,8 +11,14 @@
 
 #include <asm/asm-bug.h>
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)				\
-	asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
 
 #define BUG() do {					\
 	__BUG_FLAGS(0);					\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
