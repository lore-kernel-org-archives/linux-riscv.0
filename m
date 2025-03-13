Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C6FC2BA1B
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E/uxaN5KRQnm1zUt+UXiMAkWNs7Sx70INhRCaFPqiQg=; b=sudnNUVP9b6AOU
	9SQcq0qoS12LnMUG3IuHyITHK/rCauVEVgo5aIxNfofxCC9yc4DqAR2JRZA6fq+btz6f1kWGXaXt2
	ynnxi+VubVvBhYB3ThnmFRj1QuFa2sKgX7qPvPG0Ww5OXSOz4Un1GQvLXoA+UJPtTbHn5dnIXiHe5
	7D8fRhrxeGsSMMpOLZ33z4jlV2EYcv/aClqQ8ggkCB/i7nZElDcB9XvTzGfHBlhmoD0++u0ltjJBc
	uC3X1Unx17aC5UacFzne7n/b6TdoOqlpPo1RloV6pvomi9DAS3wWpWYgSGB4yg2vEuPr4jIdK2L5R
	miTV4cgLzwHRcJbkC0ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshNd-0000000BBpS-0xgB;
	Thu, 13 Mar 2025 12:09:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh17-0000000B60W-2FCT
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gL6tEDolxd3AJJcGJnpcVh0p0Gir2o2MhbQax2LwBfI=;
	b=dMuHn+mRm+CNZFyid06pRdGJ15JUfwAEdLIyovzT6eTCahNdZDgTI7YsQRhUVJ0Vs/xT+m
	OVzTEJ3VlH2sIRGJEvys2Hv40TVvH92ImzNafTExOGdv5qRlbFQ+naMQ9qVIKdGw8Zjdpb
	RYQ7MlPICX29XpIGACop8G9u4eLwkEk=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-688-WkKgFQUyPNqXzz24_aDavA-1; Thu, 13 Mar 2025 07:44:59 -0400
X-MC-Unique: WkKgFQUyPNqXzz24_aDavA-1
X-Mimecast-MFC-AGG-ID: WkKgFQUyPNqXzz24_aDavA_1741866298
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so5905995e9.2
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 04:44:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866298; x=1742471098;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gL6tEDolxd3AJJcGJnpcVh0p0Gir2o2MhbQax2LwBfI=;
        b=PR4mp+5QhdH6WqZL3anpiX+sfLTosvNO/cZCCwOacYrUUAdPN+9wuVvCzCVTfYKz+D
         eEf9K/HyCslSrRj8c3Pb3I1O7DLjCBrBAc/pagWJZWBH0vBcighTeG/mKVIlykCnYQ6j
         6dpePjTBKktvGkKDbn8QIY2yMqpwHOxrUuZX0za4btvxpiJEaqPAJnfbUgbqW7eeTVE1
         yLOtH3oFmRt/ijZ7qI9JbtTkqxgE4SKi86SmKyWiJxaPI4wTgR8cemRGUnEdE1L/ulwB
         dIdqxYYtoxBXUdPVm2guf5S4Zlu/+rJja4cbpep9LfSQvCZDLuzFjFm2g+om9iesGVf3
         MH7Q==
X-Forwarded-Encrypted: i=1; AJvYcCXDcJQJ0DD3ypKEs+4qUTm0Hs+6kSbqfKPOtl3pueVY2ZloqnDBfSdjVYgs/v1kmaZm4u14e2vnvziMBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwV/3poepKhxkPKEmI62szDAaZsqMfKh2CtVS47DPoejbNxgMZH
	9MwkWJLuu3zKyiHjNoxXfjZi4IyBxsDlt23h3szX3GTaG4XplIX4uHVPFEGERyfeuM99TGM8RiQ
	rVypTJ/xL+6qVSBrb3UcsgWouWHyjFmKui/B51yUOVpgEhrMiHYg4+Q4V3ZF9nr1wPA==
X-Gm-Gg: ASbGncsfhqyIPDqjQlV78E9OWZ4f6fu+Kw8VtQ1GhMr6KLXA4IEWuoay8mR2+Sge+VN
	4tWBIN7Xjj5Nk1Fr/qC8ayzfXywGJErWlwy4M+9xoFf2/HMjE0tPrWYJQJ7xf5gGTcgirmQeXgd
	iLQlyr48rQPNWXBExZrRvAyaO+x4ftEGdu8n+48E5rt0gpQoNfVFuzt4eP2Mz+gmm0aswBXVYSj
	zZOea2zj7062NfpVFnwz3dNb8y5KOUCdM58Xr0DyhTvi5S/6KcTbeitlWHuLZ9ArB9M02rTA+1R
	V65KyvmtXiU5MO4118NU
X-Received: by 2002:a05:600c:1908:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43cec28d58fmr198762405e9.10.1741866298363;
        Thu, 13 Mar 2025 04:44:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3R3Nh+MesHXp5r1AiRFiydlKhpsUv7CB4RneKkaatJviaz79nmlaZTG/mhvpsulZ3LqTgOQ==
X-Received: by 2002:a05:600c:1908:b0:43c:ec28:d31b with SMTP id 5b1f17b1804b1-43cec28d58fmr198761995e9.10.1741866297943;
        Thu, 13 Mar 2025 04:44:57 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:57 -0700 (PDT)
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
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 13/14] riscv: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:28 +0000
Message-Id: <20250313114329.284104-14-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GGcYY5BzwtAe27U-rbBYrsLts0bYCklr0ZkASuXO0UI_1741866298
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044625_650299_BBFA41A5 
X-CRM114-Status: GOOD (  12.97  )
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

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
