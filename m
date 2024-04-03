Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBD94CD1292
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fVp4zkEps1P0+fuWCDeOBC1Q74OBc1AOtQXmdK5YVU8=; b=q+a1z417ffvm89
	xUWmMrctS9RuRVMatrUFuDQzi+yAwzuP1IeVK1dAim6UMI2IsmCJYBIoclQ3ZEhusMcAyFli/Pd9z
	vKzhgFAaVAhdFG68iCuyZEzHGDrbpGgHU56N7ovXwkVRTCiok4q7Biqa4LkJrU40We7i8E96rTAXO
	fq6UJWyP/VKPANzPBEsyWwFjECngFciefvw2XTmBKt3GY2ajOjRxoAFXYjR+iSzZ8Jcfbtk6CjCae
	UNh8DdaHLyg6Y+Gb6HHQXHtNIyODf2HsVTuHuTdYh8Gww1mHgVBCm8u2w+VPq4R4ZQ8jJ2RBd863j
	2pW+rfAU+SQzIBzpJYfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0YG-0000000G9TK-2vg4;
	Wed, 03 Apr 2024 13:21:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XE-0000000G8mF-3w7H;
	Wed, 03 Apr 2024 13:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9dfx4BAIsIiEeZYorwHVQiaeI+Aj0IBngtjLPvcVHyE=; b=et5/SWhTtjRtFkgEM+Xi5XaquY
	lEh2uEOQ1+/kPO7BHbtrih+2rnUsGpMh1kNzLKQPj9+jmdjSaNxaSXmPFZ23ZPlPHHH+giLZ9ExpM
	SkX5o2gb0ciKSNr8j2sVCKEa8F0+y3feQda6uu3crk12tpvSuW++OdoL2eHk52ePBIhlcIFmkP8Z8
	H3Tcxz6XWTMJhTm4gOXnnLJs9NkF6l43VBUzGK/KrfKr1SKa5BuUIfm9wdyR3ez+289iKkD/jvHX7
	pBm39e8HcLjHbHu7GK4EqAs9inFLXGSss9nNLyDAgOAnKAt4TJlRvuVGG2VGx0hvaPyjbX0pTCyht
	G07yGMcw==;
Received: from mail-pl1-f173.google.com ([209.85.214.173])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XA-00000004ERK-0NQt;
	Wed, 03 Apr 2024 13:20:11 +0000
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1e28be94d32so8110655ad.0;
        Wed, 03 Apr 2024 06:20:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150399; x=1712755199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9dfx4BAIsIiEeZYorwHVQiaeI+Aj0IBngtjLPvcVHyE=;
        b=HGbhRvyo7y68rs5nwbuWExAYODQ4Se1Gw11PxAwwp0cJCImB3LdOaknIa9x81XoE33
         tVq7qNjelQ8WZMLwP1rkmRqaKkUS9Bj+B7VR0BL90GI+bBcnQk2MFrjH7zxWLRfos0lO
         ZMVK4IIvNOW4iyR3WFYQ8skamgaW4Pbcf4bSVVc29g94fiXegapRzZ5OCWSii7mNp4Ft
         Cvp9uQ1YQDALbfnMnoDOUPCr1AojiXaJcYPSpkb3x2REwukK6mDrHjHy1JWwiASfScJ8
         KYPGWTv01B1gtW641SV4IPKJm2vHQpcVbv9Tum8bXO+i5+xN0NCaqT5YoV0HLx14XL0/
         9kNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150399; x=1712755199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9dfx4BAIsIiEeZYorwHVQiaeI+Aj0IBngtjLPvcVHyE=;
        b=s7O9Lxx5zOAocyDjP42+sW3vrQfD6hRt2m5fLr8IuPbEvD8Y6Kfgi3oBaJ8l27KST1
         8NNIiSontWwFpyEnkNXyrpZ6FAsPmXNEAXk/NQWRBkFjrJrv2r2TIVDQima6bn3JJxv7
         6tIY5yEx8hnvkODn6fMKl/LOitxkvhMYXIa5a+/bAYp9Z1rSmgQIEvLII+BAT70poI05
         bpxmFTjbpLBXTlnKb8Pbsy2pTgMX7OHLXUOkq3a2gSR7pu5Zkr39ijAymFKO5vyRLCky
         cz0UMHAvvMu3fo+lrJP+y9LABH5bKCr3pv4VtowNpkoLkDyzeb/dLZ2qpgCb4qVi61hL
         O3+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCDLjAJKzFWPfDZwLNit6LZef8WLKZSj/LPZMYnEXHljR5lnpq9kjiiW93q89+Xfb84ulPgpyWYy8UL2c48Gb+Te1CD6XhjuUCwrM33LmAgBg8zXnVUiUIstTu9YjljgMti6EWoxEDfGAyQdbI933Ea6370UI=
X-Gm-Message-State: AOJu0YwuqlBS9NyODlv189tI5rYN6xsXUJQyX9RVOpQVCERv2Vcboupc
	zlq3G7JuZ8xtle4Uyhn85w0k7UeGbzSdtVTzqWTkOZG4NCVOlurP
X-Google-Smtp-Source: AGHT+IGbWkjRTcooZ5OE5cFx+wdKtwDNdTLrjwriJaWh51uLS/GGpEV8fzA7vGhwR64nNp+19Aq+wg==
X-Received: by 2002:a17:902:d4c4:b0:1e2:a0cf:c3dd with SMTP id o4-20020a170902d4c400b001e2a0cfc3ddmr376556plg.7.1712150399532;
        Wed, 03 Apr 2024 06:19:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l11-20020a170903120b00b001dddaa7d046sm13268622plh.29.2024.04.03.06.19.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:58 -0700 (PDT)
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
	Helge Deller <deller@gmx.de>
Subject: [PATCH v3 10/15] parisc: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:31 -0700
Message-Id: <20240403131936.787234-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_142008_318595_808085BD 
X-CRM114-Status: GOOD (  11.35  )
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

While at it, declare assembler parameters as constants where possible.
Refine .blockz instructions to calculate the necessary padding instead
of using fixed values.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Acked-by: Helge Deller <deller@gmx.de>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

 arch/parisc/include/asm/bug.h | 29 +++++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/arch/parisc/include/asm/bug.h b/arch/parisc/include/asm/bug.h
index 833555f74ffa..b59c3f7380bf 100644
--- a/arch/parisc/include/asm/bug.h
+++ b/arch/parisc/include/asm/bug.h
@@ -23,8 +23,17 @@
 # define __BUG_REL(val) ".word " __stringify(val)
 #endif
 
-
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
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
