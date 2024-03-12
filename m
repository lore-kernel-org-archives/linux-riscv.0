Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 791AFC54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 17:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cgeCRQlPGqNO7iGFDZXg+veBUkU9dFDTzxRbZsrLmtk=; b=o49uK0iaXqNSH4
	//0r5Ko0lC3iyHIOgnGJIMmVGAtTevHGKUNvU2FCQY16woK3B85fkvrUpa+kh7rzliYieo2QqhdJm
	j1PyjaiN3KNc1estWKrzsIV5YWVNONL0IL4XA2dfQcqaAebjjpZwcIc5hAM8T4KIJkE9Pr5FHcFZl
	eajS5l7MM0cTuGGOqTtfYIhovnKXSvMcwfrFBCzB9c2juZX9rE0uKk6rzony3OvgX9Aq3cmWtkjCL
	oQ4SnQUL86PrIlym4XuoQLNLv1Ec1/lAhBhN+8/N76918QQOsQR8BUuvh8ZD9/EVYWEc/yBrp6f2S
	FmUcTFLA22Pwj1BGjpZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5YL-00000006jdZ-2yZn;
	Tue, 12 Mar 2024 17:04:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XT-00000006iuR-0QUm;
	Tue, 12 Mar 2024 17:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8yPqiFdiMaUo8CT/x9a2ZlbShLK74ZzL6qnaxWOIrD0=; b=Pz3eZG19Kg5XQ7JRC8YEnCSHrq
	BGmuC7ff+NrBhdKoI2KPVr6SqnvUauJChtY2yd5hHayafYLgSWAeyyfFLJYnhBWmDViIsNCEz6f17
	R+0gbDOkPYqB40gAn+ebAHN/UMx4Q/EtGDkhv8ixG+nyqmHSvNlMh2dD1Quz8WP/FWVaUE5E4h/1S
	jfDKpuJWKJabQaVf4snJueZHbeGxwrARxphuaT38/Yr5byNOTMrddFP2tUH2xvKuwXEe1xj9GRf5G
	5xKxrYlCblFqe50uSMQnJ9kJQWKagnHLibg0nvC0usH8u+44yoQf9+gN9SNjcu0OYnWNUdxnq4n6J
	eq/zvrug==;
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XP-00000009Yf2-1HWd;
	Tue, 12 Mar 2024 17:03:41 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dd68d4cff1so32065325ad.2;
        Tue, 12 Mar 2024 10:03:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263016; x=1710867816; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8yPqiFdiMaUo8CT/x9a2ZlbShLK74ZzL6qnaxWOIrD0=;
        b=azDUqEIJmsd02QTbqAxWbDkAm+ZZqXvhg5+6G7XLKfe2Kck93sA04cyQlQur0rrjLu
         VgbriKSxcrULDQvBzuX973E54UVM4/93MzQemJW5eHIPpyw9x73IiB9T+bhTU5Yw5M3z
         9fcB9QiSK+DKIXzsAG0Gu26UU2/1TFNv3TxDys/ul4QmY30VRYkuk118M1DYsiWqYf6R
         4s1BW2qINL2R7jGDtbU260EQUgpqwKK9bZC7yY4AFE8OepKPDnSdA9stsaU19m8tWyxt
         iQjC9Zk4P1ab9HBSxxgCg3APotrxOCA7GQqAxChzqr1T++EDsFAX6JYbTWSjJ//Ee1Vr
         xp1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263016; x=1710867816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8yPqiFdiMaUo8CT/x9a2ZlbShLK74ZzL6qnaxWOIrD0=;
        b=KWPNDyTYIBYRG+m/VCzbrrFYhxbMrhme9P2rhBpGnC3z3/KKLgNLAByMKBW8bS/8+5
         4QfFNNnZL/IJD4ySTvP05mE3U5ZGTfRlX/hL6Tgh2svDQZCZzciieu/6Nuow/f6qGxLU
         EBawpx2TyYWft3wUbXYG8/zdxNEdnoy/OosuSMuim8uU7WkAPeQGNy0hJmErMpbYPgOe
         u3ksCzekcOcL7A9yTehnGdtNpzLBm0Oa3x3x1+iykrKdlvgcmUi5+EIRaDDAJrMc2+m2
         cSg3Z1g++q8oPUrd+tVlidI/ADpdIphoMzC+tu2ZQlEH92kc8VMXWOWVTYzUZBj/Ykni
         uPqQ==
X-Forwarded-Encrypted: i=1; AJvYcCW04s8b5cOs+GvC3iIo9GGiNgaVrQiKejycD1jkQeK44CbNrG2i/5qZn6fH89NK1H2gGZzaUdt4BCFDFPUL9Wdz9shLiusFxJYfFLePX3OBGVgudqzfjNC+tG1Va5e2+OeJkKoD2wKgCI8ZRi/uRXf+qlzGg8w=
X-Gm-Message-State: AOJu0YzhUD3Q/P+FPBbNm8KfBO/v0B1vuB2Mo/tEu6hLiyCcHekVyPNJ
	Pz5GLX/Kq35wS935uHbP1DP7hfJzMniFJFWA6E5MdHCbxBntdSpo
X-Google-Smtp-Source: AGHT+IFoEsNPPrMLHPvnKMDpnnejQqa8I+dYMyPxL8EBJ4sDwkePMFxEwmxbDBpOVTaOpj6jJj/c1w==
X-Received: by 2002:a17:903:2349:b0:1dd:afc9:a34f with SMTP id c9-20020a170903234900b001ddafc9a34fmr4471610plh.50.1710263016146;
        Tue, 12 Mar 2024 10:03:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id b21-20020a170902ed1500b001d9a42f6183sm6958877pld.45.2024.03.12.10.03.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:35 -0700 (PDT)
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
Subject: [PATCH 10/14] parisc: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:05 -0700
Message-Id: <20240312170309.2546362-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_170339_806047_523C7299 
X-CRM114-Status: GOOD (  11.63  )
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

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 833555f74ffa..792dacc2a653 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -23,8 +23,17 @@
 # define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
-
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define BUG()								\
 	do {								\
 		asm volatile("\n"					\
@@ -33,10 +42,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %c3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (0), "i" (sizeof(struct bug_entry)) );	\
 		unreachable();						\
 	} while(0)
@@ -58,10 +69,12 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t" __BUG_REL(%c0)  "\n"			\
-			     "\t.short %1, %2\n"			\
-			     "\t.blockz %3-2*4-2*2\n"			\
+			     "\t" __BUG_FUNC_PTR  "\n"			\
+			     "\t.short %c2, %3\n"			\
+			     "\t.blockz %c4-(.-2b)\n"			\
 			     "\t.popsection"				\
-			     : : "i" (__FILE__), "i" (__LINE__),	\
+			     : : "i" (__FILE__), "i" (__BUG_FUNC),	\
+			     "i" (__LINE__),				\
 			     "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
 	} while(0)
@@ -74,7 +87,7 @@
 			     "\t.align 4\n"				\
 			     "2:\t" __BUG_REL(1b) "\n"			\
 			     "\t.short %0\n"				\
-			     "\t.blockz %1-4-2\n"			\
+			     "\t.blockz %c1-(.-2b)\n"			\
 			     "\t.popsection"				\
 			     : : "i" (BUGFLAG_WARNING|(flags)),		\
 			     "i" (sizeof(struct bug_entry)) );		\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
