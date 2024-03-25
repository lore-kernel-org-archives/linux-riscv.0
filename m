Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F39FC54E58
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CPAblJ3liDlOYK+3um81LPlScGmZdYAkwuijeDU7/ig=; b=FPh0wLnn3tLFtk
	AM2D6XNho5iRnNXfd+PV/GbdvmqW6EuyV43Ji98ISWiugntDxzk8w24kBGKiE26Trm/lB5xqsUjKE
	8Qt43guMmw1ix+eiAYkBT664QRQWvrhtXaXHb/YtAfhsEb/xmrT1jtGwCNzzsjLQKYtGBM7So2xD9
	1LJkJ1F4xcqWxX4EzeJe/v9n+c4o16JIcMMKYbCFjrDp7fOWQk6db/60IrllXjeNWu0VZocjWhlZy
	JffnvusrH2oRoeVSWX3LS9A2JHhFftqTHdf4T6sj1zKWGDv1x7PiWvazH6Y3Qt0KHGQXvhpitLvBh
	m/Zn+KLCcRgvZPjeFBQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooXa-00000001BZH-2Uge;
	Mon, 25 Mar 2024 17:55:22 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVV-000000019sV-2M0Q;
	Mon, 25 Mar 2024 17:53:17 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e04ac4209eso41470055ad.1;
        Mon, 25 Mar 2024 10:53:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389191; x=1711993991; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dtwUXE+IqNuorT54j0aaEA4aHeW6X4Zjm5IQoCcbGI8=;
        b=S7b1VkLCvWnh2pZps1h0tRmB0mX23nqaAxd0iztiPX/QJ4PCDp12wz6iQPCG7o6YVr
         03UsKLqtPeXnM655c/wBOa7DGew4Ap7t7qfh6H+I1nfl4VHSoEBF3Lr0RQKariTHJh5E
         mlmedPgzbEsOXD+Pu+V6yNKuyo8pQiJE69PXysT568uhdebf+LZlUiDiitJhgtr4iNJu
         1CeOj+F/0GFrmKdon7j81H7C9DeAIurp3IBHGXCohiQN7sKwNxC9pKlMDJ7d6g+vK7Qm
         97acW1NFCdlifGYr3cpgSWfJhIleZqzuy0wQ4yrqF0of+BFmQGZJuEEVrOSNoIdQiLLK
         4r6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389191; x=1711993991;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dtwUXE+IqNuorT54j0aaEA4aHeW6X4Zjm5IQoCcbGI8=;
        b=QZOkWAg53pSTXP5oPxzfTqoVZSt2v6QFrEZbKy0ZJWhDWcGOpIvFAja9PDzICg6y/H
         bnAO6GZkCHNT87CeWG17yc+VCgfjjVTvxz0MoyU+MrnE6ZBZ++qsVTMX1q96qYTdvC6n
         ruoJG8yO05rWdPFzJIH7thY5L3hbOE8L4kqNjaaymuxrT1Om0kzH+gPLVLNXRoPY+rf4
         KXhxNiIKneS9la5ERXqkq2OrBoO+pmSnJ87CuEEIzDhEK47FGoar6ZyHm48mT4esgGyE
         J8YRf8wXefGqmnmy+eyzXv46Ng/tvnoMKFRi+2LaKUrCWEUJBXjO/jiAVsf0qr8NP6pp
         Vviw==
X-Forwarded-Encrypted: i=1; AJvYcCXl5F4FYWkU5qQrwwUen17GwJi4IvzFZ9vdNbXK2LgZgtcpn0aw+3UHtJk08OFiwv3fhw0HVYNboDS8zc1srBMHfTryr/oliI/q4OHbCd3xSBTdsxjs7DNkqlfDAeQ7dtxfsgPn3OFGuXK00I1ZKDNn7Wzer9E=
X-Gm-Message-State: AOJu0YyyNdHMH+o365CbX//r/doyDLnDyhq6/OWKxL2jhdu1sie134uE
	2ceLhRgVXq7laGfcm6opibcEl007+TfYc7C7rj0Mm7mpPPb9RtrF
X-Google-Smtp-Source: AGHT+IFgb86jAL+eLx1VucoqIZk09YlvJLM+FeVnRGQ5UPNHQryATu5Oxjm2FFfuTD/AWoK6+BajtA==
X-Received: by 2002:a17:902:f548:b0:1e0:94a1:95c1 with SMTP id h8-20020a170902f54800b001e094a195c1mr530124plf.29.1711389191372;
        Mon, 25 Mar 2024 10:53:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id l5-20020a170902f68500b001dda64281a9sm4953716plg.85.2024.03.25.10.53.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:10 -0700 (PDT)
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
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Helge Deller <deller@gmx.de>
Subject: [PATCH v2 10/14] parisc: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:44 -0700
Message-Id: <20240325175248.1499046-11-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105314_211055_30BA9058 
X-CRM114-Status: GOOD (  11.96  )
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
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

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
