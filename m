Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28B5BCD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:21:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcjBrCHKEJp1m+DMER0m9trfSEylWJub97IdAqz/jow=; b=KyNmqSg/rfpYvu
	AzwyEbVykp1jxDE48uEqrXmslTW6FlCafsOuLzha0ZwNjEbc8r4O/ci+/cmgZYVgoU/cD5v6URwzZ
	9+KJEpahbK9uSAfENGD8wORZVEng3xbPht8FNYanGYEZTtSaxDNrqAJyQqxbtfE/trkeDpGdR5Jh2
	ivsqIuSc9BUzuMk2otWN/drs7r6JelXhyldCjmTHh3b1b6i+eIHjqR52kjaReKU7wUzj8TACtrXOa
	jL1fy2jcBFYpE3dvoBQESGCstHKcbr0deXN67Zi4QBxNtJ9ISDsnOiO+800E0QZa7DcINKh8rggJB
	l8g6+JrTSAbzQoC2gjHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0YX-0000000G9hQ-05Ul;
	Wed, 03 Apr 2024 13:21:33 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XI-0000000G8nb-1Wxe;
	Wed, 03 Apr 2024 13:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=acDD7oYfD3QQ420QQJRR06Qs6MsGb4dTYH+kiSwK7vU=; b=IAPInJyOb5j8f6gBTcqim8FtOk
	NnG3uqTM3Frj7r7G4OmGakQrbYo5Jkko1y4QAZPEFu8obAz321M+spMMvomIV91Q4h+eCIRXabqC1
	2jJe/WquDFqQ8eqoFs54M4LGQdmSlJho2KUSdWOFNbaUCV8kfs0S83u0cFW+Nf/VJf0p9CQb1V+w7
	qLc7/RkmmKQFDRVHduJZuike93PIkhBZRP1tZIc6M+ilJtpTn6yD/vWZ4NSTfDvs51VOAcZ6DfKz+
	eNPDGJCv7IkECH475UJbJs27eF7/bK7OO1hujsmgvkEg1OuteREdHeNWWCc76vn7H37n3loHy/x3I
	6WQ2Wbpw==;
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XB-00000005eWQ-0QNs;
	Wed, 03 Apr 2024 13:20:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6e6bee809b8so5980729b3a.1;
        Wed, 03 Apr 2024 06:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150403; x=1712755203; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=acDD7oYfD3QQ420QQJRR06Qs6MsGb4dTYH+kiSwK7vU=;
        b=DbPmfoLYc/SUogg2TMO+vdJegvOdTRm2qyDpr0EtuwHaB5BSNIf8SIxZlYEwR33SPs
         hH7RkVubc4pjBg+pRLjgxdIfBEc0ETMdfEibOTeFWpDzeH5YsR4U3TX/eyF+AdDhoofz
         nrUiEUxF+eKmMdV9uSKszTlAl14Jekgxp2XeUVz0Bgi1rS2o9fLk38ThfpfDvgqD+7A4
         DM6Be+slwXE7Orsqz92V+QXgxRr0IqN8GkVD07/VXUbSmgancdaB9qgpe/eVRec2NNt8
         b8QNvK2aWo/rC8GoDHxgc5DDnXgL1VxSkNvOR+nvN6mcwejAM1s337O1KbaEkIewvCXM
         a8cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150403; x=1712755203;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=acDD7oYfD3QQ420QQJRR06Qs6MsGb4dTYH+kiSwK7vU=;
        b=Pry9kjywV1aYxxu9D/L8dlFQzzpntIn+vxFQHH2OkgKQ/7ktgjLE2jZKclJNL365jD
         fuq07MrcRS0Jk/69BTDJ4PcS4LwsH2b+kFJ+spjkWZB4xn5dMnm+oQot4BfCDicphaCU
         djQd85sxadl2+aBqNE+TKGr1fTjhGwt6xqreXM/rNnnoUaBYtjekdLF+YEwRvWq/UsBV
         eqaXlzn7COk1VkLZgCtidp3Gg42z+JelqdBEHPEwB7JakUeDBCvo96OEq+BY3EifMBFb
         A/HQI0GM5sEhtjFrumUoOXLbUHRBS8t+p6bnrZUCBwBcXhOYM3ENVR8HdXuiLQgWAtaf
         PCfA==
X-Forwarded-Encrypted: i=1; AJvYcCV1lXBZkceeJXCH4dsZQAVJx0mFTuUR7RBDxyhsb/IGdrewYa6NaV6qMSbvvV57Tdm3aEQHR6/zRbk+7w/adSCKUPstQKhhdtQNiM+Bi4ZZBst6LitPDXbfeXv5ftWZOyX1TSdQaqbR+TmOv7nsL18d3uA0mcU=
X-Gm-Message-State: AOJu0YzzXYDPXkGjD89tAPKFpiasRtgKVnwznTtAUITUxITsGUXDwAdt
	MskeKwZvzFr/JClIA8EZdKs/WlXNrhbp4cAEfYvs+jaFdgwZ5pQk
X-Google-Smtp-Source: AGHT+IH8rm/3VYkllAG+Ph/J3KijfrTneW29i0jWUjHAEJZozpI7yZ7ux/mQaa8T08FdPB1wOfWR4w==
X-Received: by 2002:a05:6a00:21cf:b0:6ea:c9c3:94a5 with SMTP id t15-20020a056a0021cf00b006eac9c394a5mr19496685pfj.0.1712150402646;
        Wed, 03 Apr 2024 06:20:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u32-20020a634720000000b005e838955bc4sm11440044pga.58.2024.04.03.06.20.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:02 -0700 (PDT)
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
	Yoshinori Sato <ysato@users.sourceforge.jp>,
	Rich Felker <dalias@libc.org>,
	John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Subject: [PATCH v3 12/15] sh: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:33 -0700
Message-Id: <20240403131936.787234-13-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_142009_209201_5EE88428 
X-CRM114-Status: GOOD (  13.13  )
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
Cc: Yoshinori Sato <ysato@users.sourceforge.jp>
Cc: Rich Felker <dalias@libc.org>
Cc: John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
