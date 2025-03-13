Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F038C282DE
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 12:16:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hn4NicO1wStWLH12rFfSqYKAlUgk8TfNrssCIQf+DVY=; b=eOUq7Yql7dFhb4
	kONW0aB+yzEq5uinXTlV6EGfZR0v8qUVaW0jrWos3L1+HMJnMBZI2gxx0KcfZ5Z7gFZ4ggjN9NMz1
	N8WBRNH7UmhJQu843DAy890M06RE6kUO1iJ+n84r33bahueVla3aZnvTTnxp7bMDikvb2V5U3k19z
	ZNZ2Q/paHas1RnWNhoB5obor/pGrEjNiA+35FJ76bfWDB7KfZUHZOSdaH7WW605npCem3HGHBaT4W
	6Wq3DPJFLZfkydN8fsM/kh/OCRMpCraH/oNLXfqtDl++gA7wsX2NybLxnBk6X2zX1MyTe9jTHrwpO
	uIIvsVQeDN5JxGz/MAig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshUB-0000000BD5L-1ZIf;
	Thu, 13 Mar 2025 12:16:27 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh1h-0000000B6BF-40rN
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 11:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866421;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=;
	b=frspNvJTyWWLt6zSu2Xs5mqLTfPMoywV7611fqxgf07nxgkIhFUgtkXuQCrYoEMzzMQ0Ok
	CoAfCSSxljhCp+ulJDX/U2YEJZyLUaToS7XKWpbQCPYZhGzFBU03Ga1Ooh49pxD+WkMleO
	HOtlTvOeItJJr4XWMfPML9lXgZufaXc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-656-GVsCbHyhNnCpsBy-tsQKDA-1; Thu, 13 Mar 2025 07:44:55 -0400
X-MC-Unique: GVsCbHyhNnCpsBy-tsQKDA-1
X-Mimecast-MFC-AGG-ID: GVsCbHyhNnCpsBy-tsQKDA_1741866294
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43d00017e9dso4357245e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 04:44:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866294; x=1742471094;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fuCFF39iXwBMHtdVpJheMeZKmjdk+AFM9NbRaPloTHM=;
        b=cuiu7rBvMpwNylqpJg73ngCTfV296fAa06qgj+ymxX+eozQDV7AM9Yk5y3xJ7OE81L
         jKJYkXtzL51L3n0HCv6VYaeW6F7cirdnV7zHRvH6obJaPaGZd3gY7ITgbdz1j/EF1fki
         3Ua68sR6Jt8Q1IhWMmjdxZisC0Q83zgRPtOe34v8/9u0nBorj9SJ6PyfETkRkDaJDo4S
         EO6/Nt/9kI9CedNg6KflU1zf3z2iSjJA78Ji8iKJH9+ilzSe/CbRYyDVd+hOxhWwj/hh
         oCjOTHSjxMLqt/wGO16Xe5XsPDei/IcJ+/HisG80WyWzPYQey74M5TM0vCz2re1fqwce
         VAjA==
X-Forwarded-Encrypted: i=1; AJvYcCWSap0PYkXE04ByHPSqwBtfVxEgttTlOdx6C0nfiJRkNpRWIufS8kWNxxXzW/1gUIOnR+0Q8BCesmQ0og==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy0h9hUqX7Xu7tmdb+KNSglY4tHZR8Ogwdi9dU+Ll3hhPA2NtGK
	g8EL1Xu7sEdRB6irs3HiXs0+X3tNg1ZtWabzpVpTMUaEciDF/FKQzOkT//z1T4hx9h4emaB52/j
	/DK4VmRXcdTX/MMr542hT9AWnibB+FHXEOMDB646CsZkB3vLPZQXGGsQTHhMIMLRFag==
X-Gm-Gg: ASbGncuqRVnh0aPUuMlRe983LzLO92Il8CMrj7cE0oboibWiMmRQvEnGZkEabn0foSL
	DsPPxBYG5THpdCUMIKpQo9MhN/24UM19/i5Hosc3XB3NjQeHXxXfnkFFkJOKbsi6qC5olWvrwlg
	gQOKCjdCj6Mqh28Nc2nnC00/W2uZEkOLscfcYFWn4ccg5VWE6z7Qqo7i9Ned7Dch70sonmetcgO
	97bZMleqZqCYsjleofJrWvqJ1l7b4bPXSjNxbRpGwA0lIbD1CvYsT8LerIfBPkrd1MySQ6zMOl8
	QN/xqpgGHedbS6/Jqs81
X-Received: by 2002:a05:600c:448a:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43cee6235b7mr136023295e9.27.1741866293863;
        Thu, 13 Mar 2025 04:44:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0wHJ2zwJ8yj3cYw/s9VH9lfhVlHVsfQsMYeCFjOVxBPaF+5L2/VWS3+5UdzriUt/uCnhyuw==
X-Received: by 2002:a05:600c:448a:b0:43c:ee62:33f5 with SMTP id 5b1f17b1804b1-43cee6235b7mr136023005e9.27.1741866293519;
        Thu, 13 Mar 2025 04:44:53 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:52 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 11/14] sh: Add support for suppressing warning backtraces
Date: Thu, 13 Mar 2025 11:43:26 +0000
Message-Id: <20250313114329.284104-12-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UsRwQpDyOVFQIfkstc7EmWWrZ2Mi98VkK85qMABT0HQ_1741866294
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044702_064960_81D24D84 
X-CRM114-Status: GOOD (  12.36  )
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..470ce6567d20 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b, %O1\n"			\
-	"\t.short %O2, %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	__BUG_FUNC_PTR				\
+	"\t.short %O3, %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	"\t.pushsection __bug_table,\"aw\"\n"	\
 	"2:\t.long 1b\n"			\
-	"\t.short %O3\n"			\
-	"\t.org 2b+%O4\n"			\
+	"\t.short %O4\n"			\
+	"\t.org 2b+%O5\n"			\
 	"\t.popsection\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG()						\
 do {							\
 	__asm__ __volatile__ (				\
@@ -47,6 +62,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__), "i" (0),		\
 		   "i" (sizeof(struct bug_entry)));	\
 	unreachable();					\
@@ -60,6 +76,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_WARNING|(flags)),	\
 		   "i" (sizeof(struct bug_entry)));	\
@@ -85,6 +102,7 @@ do {							\
 		 :					\
 		 : "n" (TRAPA_BUG_OPCODE),		\
 		   "i" (__FILE__),			\
+		   "i" (__BUG_FUNC),			\
 		   "i" (__LINE__),			\
 		   "i" (BUGFLAG_UNWINDER),		\
 		   "i" (sizeof(struct bug_entry)));	\
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
