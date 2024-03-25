Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F09DC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2aeWets0olSEwoZI2lx5WdA5nzUQWxjr9a9yc0NmUkM=; b=wiAnEVinXvzV3T
	1Wjpnl8Iz+9u9hNGhDHRNA72Fu2hfJw+LSHKhFlk/khWRcb18+ZkO12NKqsFjK9b5Rdzl9TGZILfd
	yKMSvedHxx1njgJ/fw76/GowgjIcDP7A9AjTlH0cmwfljon/q1jdwvvtPOq8pNJqD25jxSCF6vsXp
	ZhXkKObiW/b1KUWIRcfkmCFzXMfnic/p+D7S2qZqe4JVxi5dcvafWWreX+2mBtvH83glhh+IfcdS/
	msICrJxw789S8DTLcUeADdgBkANBVVTK2SH6JBi7MJz6dNfgxY1F3pAZVA69bZ+ejIsAvESuoe3g7
	KkClTlmn8wDaCqikKW5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooZB-00000001CTd-0L0i;
	Mon, 25 Mar 2024 17:57:01 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVZ-000000019vN-2lpk;
	Mon, 25 Mar 2024 17:53:20 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1e0189323b4so34638475ad.1;
        Mon, 25 Mar 2024 10:53:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389194; x=1711993994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/YzJYq0fkceHof/EPazly4M40tZRXgMzxd6Hp1cFk9M=;
        b=Fui7CREX92ZzkyHYLW3MAeUkTBqyQBpKQPBfS6WFyqrphx0rnxM+thoQPPzaS9/YHi
         sWQtgIZ1/o7YmrjAs0pe88ZAYete2HGVm5oOWJmfV5gpraxUtMdi+RWezEejtaQa3u7W
         6KRwu5LExtqIIB2THwxCq/j5uYD5RpgvA9N/AW+GxdOu7JhilixX6+QuduxoJMMn8RSg
         fvuW7D9RrVPtQSX7Spqk6Dia1bHI0h/5kxgQYQBDhGMH/jQ5K0zMsJ+ZHK9v21Qk4isS
         7lfOywRfSdgQ3DfVmXtVdg7FnRnDKaBxgcg8vHIiaPbSdHtEjYZslOQ+DjiniTqe8SrE
         W7hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389194; x=1711993994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/YzJYq0fkceHof/EPazly4M40tZRXgMzxd6Hp1cFk9M=;
        b=WwlHY9xxhJedWRMPfrgb1B1afT6i/pYfjKBBtHgwKssbfMjfM5cI5EBOoOKTZPVQGP
         vETwGOcaeBOxB3BX0vHN2Jzy6slbdsqh4Zgkm18mcrHyBM65tYiY6XH3LlqVylPOkRc7
         IUDkLOmL1nhr2KW8v7lH+206hJEFcVvIkBR+ca5lcZwdzPvzn60hGTZLrsk3I969eOSE
         7c936Ppff2lOEjWHujKSaPu735+zMzTmPnXuLgntS2TTkpEMSwjZSF9KnlgYPqu1mMFS
         hpvQIDJHPOijoH0TZVvtQORy5c4uqmYNyCBi5HkHy014cM6kNGI3LspdN2AStmRGa/iZ
         E12A==
X-Forwarded-Encrypted: i=1; AJvYcCV6TzGa7kP8AkwDxS/gfmwlBdxMk98C3PPSOBKnKEl/yjNJeaZao7SbIFW4aBlBqsZULxQNXI/YITXaa0MF2d0OCx1+CYA4cEewcL1W3aHT7XzTGYf48IBXBrWvOiDpDNEy/PZwiTHwBCaer90TxmySNKKVseg=
X-Gm-Message-State: AOJu0Yz3TMPFao5YePWQ6RSGotCy32YnxEsbItxfd0pXSomdZMQeIUlg
	/yrU++l3JUlXa5GBRjzDuS7gF2P1GWP0Ggvio3n0jdI7hjJUFmyD
X-Google-Smtp-Source: AGHT+IH4L5pCyOM7/NriCMnotw9B9wTRd/QlGQsY00iVlUfB3rIc/3hcXxQD6OWxPS5Q16CPFVorBg==
X-Received: by 2002:a17:902:b495:b0:1de:faa5:552 with SMTP id y21-20020a170902b49500b001defaa50552mr8062370plr.56.1711389194428;
        Mon, 25 Mar 2024 10:53:14 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 1-20020a170902c10100b001db8a5ea0a3sm4986539pli.94.2024.03.25.10.53.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:14 -0700 (PDT)
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
Subject: [PATCH v2 12/14] sh: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:46 -0700
Message-Id: <20240325175248.1499046-13-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105318_022007_477B04E3 
X-CRM114-Status: GOOD (  13.16  )
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
