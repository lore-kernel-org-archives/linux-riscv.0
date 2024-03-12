Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754C0C54E68
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fNeBsEnOpPHojrcwpmk10TFB8bGMSnmLR3viXmarZmE=; b=iRsiQ6rpjHAomj
	mttF+c0JJKJCcqHwxFCBY1kt7Exk5w/PNTdrnd+ta5jEia4Fs1RdZwySK7GjjPj8L8XfvtXzLtDWN
	zG2D5uB1YiemyxYNjK+wHyscbEizLzo8XLlwo9+qlXze3bNFlAHdlE0cfVReYaI1LNiNULrNJcVVg
	4zcp95MVpjjmAu2Yc3eU7NNZHL2yg4fI1I7jQRIqsY0xTYdTixF21CK474VFz6gJtCVFJYxTgNKo3
	xvVptEzZ+nJ/gH0Uj8CafbDPAKRsYU807wK+hWFMOswKM35IrRzzdS80+IvYDBVLjghMc/9OVFZQL
	Bp0YsrS7XvQTmYVvs9lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7qa-00000007IHv-0qdq;
	Tue, 12 Mar 2024 19:31:36 +0000
Received: from mail-pf1-f175.google.com ([209.85.210.175])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XT-00000006itp-1Pl4;
	Tue, 12 Mar 2024 17:03:56 +0000
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-6e62c65865cso4818350b3a.2;
        Tue, 12 Mar 2024 10:03:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263021; x=1710867821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bXPfnReuSHXGXOVrQxZxvKsOYxRmb4ItarTkuVBwfPs=;
        b=YnqqgK3MmA4VJ0RTwNwQsYg0L52NRFyNie69JlCW9INqOckwo95AmBGGgUl6GGrDu3
         Hgm9K83/Ct5kgLc7+aqzozT8X6FDhsnL8Lll5Qc9GvGI3WOFKVBtVo6mpriNYpehizRv
         mtQ4irU5/1nmKYhDSr7T3ZNoq3pwOQMEZw+K7OwiOZXfuuI5Po/yhIFBO8vzU9ldP1UR
         O0cKy3tDmdDHu65pt1qpIR4xb1XAafKki2SAGmG1Y+F5U7vHUwWDREQ0ZfYJdgWnzRzC
         NNMZgF4HMLHcRAKISQvL3N1v9bUV06C6sJ1oOncVhglvUZ/qnSyLarZGbpisa6tGSCG0
         uESA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263021; x=1710867821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bXPfnReuSHXGXOVrQxZxvKsOYxRmb4ItarTkuVBwfPs=;
        b=GrY7xfc9GfisARM51noGpxPbkid8cJCnScgdVRHJ22KGPD74AaDWbWehXym4PdfHVo
         Y6rlBNdVFLqhSul+cFN/n9YR7ERK6bUoyB6g+hr59jpnvO6XHETxhj/cS7c4+jjDnfZO
         N11SewGvCPtqy1KN8dOxWLObZvBBqLR024ZVEIOylL1Kjdkd7lujfA8R9VZ8OgKUKxhp
         f3gMZuWv88s+eqMrGON36l2oZP1+06hC166yUP9HBdpwFr+35TFjyRw3KFSEFHKnER0j
         9HkG91Pc4E2bzScImmcOGRZ8celwQ3pg8UGNy+ZlCivMbxwQ9NRSMd9Q2WA7HZL6G2DM
         WDDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPBF6zb+lS4nI4hz4bdUXOaRrZiVPz/Gsrsx1rkb3NYAMiJLfRylg+nDffTZe5Cl+1+xIAF+OTZ+2Lmdm8LzKTCCkUlMm41IV3O4L7wR6xT5Otn3/c+09F+xf9DvBb4aRJvD0BvQ3fD5i5gACrJGpbrJwIO00=
X-Gm-Message-State: AOJu0YxYddm+kt7fuD3bSZ+S6iXQMrl152mqe8XaYrUySJhoxwcoHt6S
	HxLmuvIcwMpGKf70um0qHYq7YmiNBEk2rPSq7tw58nZm0hsbYNKH
X-Google-Smtp-Source: AGHT+IE4fVqqJ6hNP2W9YJrC0c7a73CCPEj82DwWsP9/bD/wztKwzROAlQDxzJc7BU6W2bM1RSgz/A==
X-Received: by 2002:a05:6a20:9f06:b0:1a2:ba3f:e530 with SMTP id mk6-20020a056a209f0600b001a2ba3fe530mr11544554pzb.50.1710263020818;
        Tue, 12 Mar 2024 10:03:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g1-20020a056a000b8100b006e674ef94b2sm1453577pfj.159.2024.03.12.10.03.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:40 -0700 (PDT)
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
Subject: [PATCH 12/14] sh: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:07 -0700
Message-Id: <20240312170309.2546362-13-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_100343_670769_D1AF6782 
X-CRM114-Status: GOOD (  12.89  )
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
 arch/sh/include/asm/bug.h | 26 ++++++++++++++++++++++----
 1 file changed, 22 insertions(+), 4 deletions(-)

diff --git a/arch/sh/include/asm/bug.h b/arch/sh/include/asm/bug.h
index 05a485c4fabc..cadc335eb759 100644
--- a/arch/sh/include/asm/bug.h
+++ b/arch/sh/include/asm/bug.h
@@ -24,21 +24,36 @@
  * The offending file and line are encoded in the __bug_table section.
  */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"\t.long %O2\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
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
