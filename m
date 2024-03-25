Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97A90C54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:56:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVtejD3ZB73uU9ZvmInTvFcHZbTxrCbKxvCY3Th/N8A=; b=d0Y4xfRBfkAfUS
	+qngmITxLxV8Pv8Tgf23dEWCU1SsSq4Swwb2ln5HZsdk0H0ds5kyCarjidFqmHm4ER9XdS7NeCIWH
	UukJLjZzHTDtykhL/fmzQfbjhGavX0+9803NuG768mZo/pa4evOY2+79RMA0Oy4bSJ9X9JzhEmU2R
	aDUXB3ESmBBV9TY2/UIVjA3XahsQchLgCJg/RSCc4qIwIyooEnsQSRn4zc2soKxG0T/jEwSAX6OYF
	yEZFfzsle+JQdpqOVEmwX6hysUKWMbY1gDUVCKwVCnsECYcCFwZeufjo4lKXGFIvbqfK+B4nL3Wqv
	akJDM2UAAMeYl4bxhTVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooYJ-00000001Btk-31Wq;
	Mon, 25 Mar 2024 17:56:07 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVa-000000019wJ-3UFC;
	Mon, 25 Mar 2024 17:53:21 +0000
Received: by mail-pj1-x102b.google.com with SMTP id 98e67ed59e1d1-29dfad24f36so3103377a91.0;
        Mon, 25 Mar 2024 10:53:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389196; x=1711993996; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MnI6eL/80gG1dr8sD2qxmm+TprLGleZjKTemL3in51c=;
        b=B5m7L80q0gVibNDPhnsxbMlzJQR8jEAynxdXHGB/Ptr0Klq527oPpbQ0o1U4lKJ5B7
         qa9vvVz5Tgs5Q7r5Os304G7Z1Z2GocoMw4zMkonlsH0Ry3k1dAa20L+2KdWZw6Ur0JnF
         31uP61HQcks2Vy77dQYe2OhIguu+9gz1X073NBzOEccTvckDMFKihG5o7Irq/w7IyaWX
         3A0m9XKPDAySOYpd27l4rDYEl/k+UXpCmlzl+vShu6+2JTTU60XESvB2S4JCLTCXzhZ1
         +vZ++a1eSs0IHjHR0KksAZRYjnkykTJ9jEwrqi6cfmGX1J3CeQe8VPv9Vs+vbeo+WI5z
         yY4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389196; x=1711993996;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MnI6eL/80gG1dr8sD2qxmm+TprLGleZjKTemL3in51c=;
        b=oguEkx4GkW/ACDLq3st2NEocnmJrt1/Xq3PMmj/6HTgb7UiLRMFHAJlnD18PbMtjvT
         3muHJ/uCn0piTuSMnVJqAITGkCluqaLp7EuHpW61GmGkU/HMJHoMQrIa5bfLxM3SsOFO
         ktw4qbnAbwSOzLAtH+AbEWzQdkKpmow9pk/mac/jDtG8/vHyssyEv72UQ627A/Ci968c
         1AXTMO0KUj1c6mEtiz4p9TrCE56yFvIpG9kpMvMpNxEYLlgx5YSb0h2p3EiyzOXN902S
         ANDCwSJ1ENymeclioJbxJkjjOLY+iXpykrcgtSwwH2B/CMRujFu2bkHe+q1FhMJwNBJW
         Mj2w==
X-Forwarded-Encrypted: i=1; AJvYcCUhOgzCbWM0UaSODnNa6TYVvbM2LZ1hzVx/dPDajrGD3lMAcNHHvAvSaIySmxk6TskE/Uk/RA9s2WPq3GzxWokBFwGkV+lqhByoi5AYQ6/iECHq7+H6j6Nmxx5GyPG83TjAjshG26Z9Qns9YrloR3f1p0bHjVQ=
X-Gm-Message-State: AOJu0YyZMR/bMj7t7Qba/Al0LFQu/L9b1z089raRnJ51Bl64PuX2lNRV
	ZQHv6DxH6g1QoVnTHOSQP/UV7vUclgD/1Idx+JTWBkhVrldERrCL
X-Google-Smtp-Source: AGHT+IHmG43u1pjyB8NBsXBypuvw9vgspS+EVnSj7EhdYOTyM3AqirrFZJgzW3g0aAbgHMabNWrpgg==
X-Received: by 2002:a17:90a:ec8d:b0:2a0:718a:8e49 with SMTP id f13-20020a17090aec8d00b002a0718a8e49mr2291608pjy.39.1711389196182;
        Mon, 25 Mar 2024 10:53:16 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id px8-20020a17090b270800b002a0544b81d6sm4083933pjb.35.2024.03.25.10.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:15 -0700 (PDT)
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
Subject: [PATCH v2 13/14] riscv: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:47 -0700
Message-Id: <20240325175248.1499046-14-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105319_038947_BBCDB3AC 
X-CRM114-Status: GOOD (  13.41  )
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

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

 arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..79f360af4ad8 100644
--- a/arch/riscv/include/asm/bug.h
+++ b/arch/riscv/include/asm/bug.h
@@ -30,26 +30,39 @@
 typedef u32 bug_insn_t;
 
 #ifdef CONFIG_GENERIC_BUG_RELATIVE_POINTERS
-#define __BUG_ENTRY_ADDR	RISCV_INT " 1b - ."
-#define __BUG_ENTRY_FILE	RISCV_INT " %0 - ."
+#define __BUG_REL(val)	RISCV_INT " " __stringify(val) " - ."
 #else
-#define __BUG_ENTRY_ADDR	RISCV_PTR " 1b"
-#define __BUG_ENTRY_FILE	RISCV_PTR " %0"
+#define __BUG_REL(val)	RISCV_PTR " " __stringify(val)
 #endif
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%1)
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	__BUG_ENTRY_FILE "\n\t"		\
-	RISCV_SHORT " %1\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	__BUG_REL(%0) "\n\t"		\
+	__BUG_FUNC_PTR "\n\t"		\
+	RISCV_SHORT " %2\n\t"		\
+	RISCV_SHORT " %3"
 #else
 #define __BUG_ENTRY			\
-	__BUG_ENTRY_ADDR "\n\t"		\
-	RISCV_SHORT " %2"
+	__BUG_REL(1b) "\n\t"		\
+	RISCV_SHORT " %3"
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)					\
 do {								\
 	__asm__ __volatile__ (					\
@@ -58,10 +71,11 @@ do {								\
 			".pushsection __bug_table,\"aw\"\n\t"	\
 		"2:\n\t"					\
 			__BUG_ENTRY "\n\t"			\
-			".org 2b + %3\n\t"                      \
+			".org 2b + %4\n\t"                      \
 			".popsection"				\
 		:						\
-		: "i" (__FILE__), "i" (__LINE__),		\
+		: "i" (__FILE__), "i" (__BUG_FUNC),		\
+		  "i" (__LINE__),				\
 		  "i" (flags),					\
 		  "i" (sizeof(struct bug_entry)));              \
 } while (0)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
