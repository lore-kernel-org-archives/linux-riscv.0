Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13167C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ORvUhEu92QFdriUapundCuNbMW/6ohCO6AbWjIwtJM=; b=JbEYZNNBBiocqt
	aDtGk21TBFqKHApMikv9FQhg9vKFTc9ZKKZcF6DbV4yLII2w9sveXvbK4Ijpbj8+uvyFCIeLlZ5Gc
	Y1vQSLpa/R5Zq8AgaTZEfdPCIkzTwuvzDnGlfSEbjpc5ygyriiWyPfq3vlniBQBRbyxeKRLWXMwyD
	DLF4+d5b0lJ1SOg2JjBeatoCkP9HFv3xe6VHz+9UpNEI953oAfIvZ7OmP3DmZzOKHSdQ1OPmuVjh0
	IyVZfMGS3lvUSOTl/Qfsj/biiIIZ85U5f6XwxtI+QNm5FxY5aUOwVqu5AKPb7j88/65s1dh8iJYs1
	Tk6y/hF75PkNPF9dN28w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7qX-00000007IFK-1YCw;
	Tue, 12 Mar 2024 19:31:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XY-00000006izZ-3nmA;
	Tue, 12 Mar 2024 17:03:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=Mb4FmIopiSO+/3QwXjaWJkazatuyJXVbnhhdOwFBf/s=; b=C1C9BSPxYKeWLvPZNE4RXj9sxo
	sP5t8BUKZAIlDmxLvtGtKGprfGtEXS/brvRIsh8KXYACKL0091BXQ/HGL8ZW5ZJT6oj2tfVajRoU/
	d5Xn6tvNxS+FBLAswvYPoICOZhyxCstWrI6XZtZn2HmOlBabBARQ/O35pf9sYb8DSjgFADirfdc9k
	oPVXE7Hqg+OnEWrpnmweON5yMNM0QKolG4osTM1anRSKvyY4VOS9vyL0DQtP5eTR2YBGQgdMOVLe3
	buFqPRLMF+JUMV8fF3cFgVr8hKHrJj+WwTjrhGGIYvBUnEapUk3GhCuLfsYv3MR7DP6LqfTeoIMNe
	3Yb6YjHg==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XV-00000009YiT-3w8X;
	Tue, 12 Mar 2024 17:03:47 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1ddbad11823so7183545ad.0;
        Tue, 12 Mar 2024 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263023; x=1710867823; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mb4FmIopiSO+/3QwXjaWJkazatuyJXVbnhhdOwFBf/s=;
        b=daMLGT0W93Dr1nG0HbF0X5z4xyEa1++bVHEAN5ajFgOu7VcvXhpTRcA51xQkT4Mhtc
         YHQcVG3Rp08B+2bFpo5SVkNQCZt9wr4fHURQ4bSAQtaeyxn9omfYw/oVzAJOs0OQzgY6
         TA4lDwgt81lhGzxhJ65Q2Ht30gwuSToGOg3YkEHQaMbegh4vLrA7XUGlA0yMpv2K5Pkf
         3Cs8Av0O8jkZ+uG7/viIY0QKrgO3aXKPloO1kIgdYemr1XpLYfUjsiTMte+jOt4Rllhg
         ohCFJ/T+D5DLCGJSfqZ4da+Jfmy8VhOQomFvcxpzoZwqf5NJfBt4MG8+18g5WLsMmue/
         7qpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263024; x=1710867824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mb4FmIopiSO+/3QwXjaWJkazatuyJXVbnhhdOwFBf/s=;
        b=TxW68i2CRJei6HP0tNFpffRddw4k3cFlTAzV/KIKv1CGl4VBgDsURXsAEUF+xum3wd
         fMmB2DCv2gzJGRJsz3flP484VrZNL0CFSk5rWVQmIDliVLeqyVhVxe0vJ6WEsnXSJnTa
         zf1JzRS4pkpJUFUOrPnJrrPNpktHxLPshwYbF1mJQ6pl7Wj2cRhSPVxvFx/bav16QTAL
         uboCSNE2ovAhTatHaELWJBmHeA0Q9krjGHHxf1tw0blriTPIDq0leaDsJiHfMo1DGdQP
         5Xe39TGwUG1O6p7LhTfx34C4s7TCE2+DMi0GgF2iTiBz+M+1t4rNKoO0wJGdHDyNRWlp
         Fqsw==
X-Forwarded-Encrypted: i=1; AJvYcCWZhLIQyqVRCn7mSBBGBrvzL+Y62WX524gUztQJx40LtQzuB5yXjCeZJ+kmrPYB5M0U3q/izulFyzuP5V3IdR4PveXQ/0qbAeo/7c6/wf1XoEFkp5/Eb/elYFsiWw4S+RXjcc+KPJrk3MiHNpc9rNO1MJo5QtA=
X-Gm-Message-State: AOJu0Yz3U2yjIjNIX4eofJB5tCelwIiDxLeOA6oAVKHOI0XC4oM+SxVy
	EsmOw3r1z92vyNyZSgV+N/N0BSOAg2jGhkEtamFtmyzWdPqv6EdF
X-Google-Smtp-Source: AGHT+IESK+W76sbv32507e8vr+AETbi9zHy7dM6LrGga9gr4qnmj+9kyX8nY1a/g+A7cAY64N5ru0w==
X-Received: by 2002:a17:902:edd0:b0:1dc:a8aa:3c86 with SMTP id q16-20020a170902edd000b001dca8aa3c86mr9530991plk.5.1710263023689;
        Tue, 12 Mar 2024 10:03:43 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id w17-20020a170902d11100b001dca68b97d3sm6991774plw.44.2024.03.12.10.03.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:43 -0700 (PDT)
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
Subject: [PATCH 13/14] riscv: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:08 -0700
Message-Id: <20240312170309.2546362-14-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_170346_126473_21843BDC 
X-CRM114-Status: GOOD (  13.09  )
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

To simplify the implementation, unify the __BUG_ENTRY_ADDR and
__BUG_ENTRY_FILE macros into a single macro named __BUG_REL() which takes
the address, file, or function reference as parameter.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/riscv/include/asm/bug.h | 38 ++++++++++++++++++++++++------------
 1 file changed, 26 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/bug.h b/arch/riscv/include/asm/bug.h
index 1aaea81fb141..8955ee5c1c27 100644
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
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%1)
+#else
+# define __BUG_FUNC_PTR
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
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
