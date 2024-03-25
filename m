Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B98C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 19:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L5tdNmBRP0NbvV0OEyItF6hQgWFD/RVTB9D1iZa1O2c=; b=wPxIvyjAaXjyAw
	cRpvpSUzt2blDTEGBf+e9HFFzNcx0/3wPk5N7vK9hzcPPGujHKLp/Jye9GVwYHibtNOylYc7EsykL
	8y2k5FtjHCUo2s4MPAAVvduQzVsHwLVAkQ1yKp1OTuHjY9b4ZXxmQ+vqc694/ehhbI6Q+ym5j+Kk3
	yhh2pIegNso6wBKzXUDeGXSaNAj4f7xKXh2HLEGbgvFUvR0WGQNbFqnebhH7FfclSUaAxBcAUHcXG
	Zymd1kc0OafK2h/Ja1UQqVdxjUETRfMjVFFfEOq4y8wGG88Vr+5CX8mEouab7jDbpwJSWUKwvV6cc
	9H4y1pmfLSpf1fUz25Ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ropYI-00000001TkI-2ZvO;
	Mon, 25 Mar 2024 19:00:10 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVQ-000000019o1-43t0;
	Mon, 25 Mar 2024 17:53:12 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-29f1686ff12so3102840a91.1;
        Mon, 25 Mar 2024 10:53:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389187; x=1711993987; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NkFivhI5ysBM/6se13ha6YOC4kb+BKpi8rjyyPjulPM=;
        b=WqOf0s7VHGR5KAm3Eh0zLIMW4fvhQ/cI+PllL64pYWZfhflKVMEpZMsy3nZX4DdKnb
         2G7m5upeGCrWzH775wu6039vpAOGUfknGVn04SWdzj4EvUDgAkk+W2pBjWet8C4JQM69
         XOKiklXrrZSss3zzHuN3jrMDpIxGmy2HF79/EHfYwzTE7dRodJxJCTX1p5RyEDld+QV8
         Swyad+X84m8szPKaWfDM/5eyfx42fsc5u3ODS37FLWRJYGSdzmV0LRkY+y3bdM8Ei4uR
         /Lix1nH3I/SKPZvVIpIo4I+B7mKgmUDv6QKPXTfBGhfnXzIOaB9YA6rYkzxT2x9ycgUU
         aAkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389187; x=1711993987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NkFivhI5ysBM/6se13ha6YOC4kb+BKpi8rjyyPjulPM=;
        b=ilO3FRXSSwiuxOtA0t5XD6m/pXQiVN7I3SF/0nRAO8QKVDzMtPohzawnZ1SLQN/HLX
         cYV+5loicpv/BwbQsp1GtHV60Ho0KrOrHHVuHEr/onpiAt0BMUxJFEvdiNTmtb3Ah55P
         zK+A307OWsijVnRzYo5cQHsSdjMknzqpEPt+oqlIEIghhQAU1wMbI/8e0wNOdfv94icf
         Xc5FdpYqCdwrAPc6Z0Z/CvtFksCu9P/ITvkoA4kiWNtv/RLu9A7WbjD46170MLnXiMcF
         xEBNB+z3oZ4Y2zzq+ZhNTYts/J1A8hsvbMoBnNqKg7zj7igKrsJ9UoR820JU/nneSq10
         lBBA==
X-Forwarded-Encrypted: i=1; AJvYcCVm+d76bAhn2HZ0rLf8wQOJAFdUXOtSWRk3C2Hv7+XFNwB6NLX1snWH/ZvetlCy3/lBiMHeVMSv6CSIY3HBNAuFjN0/0CiKyZFAr37SWRBHTifmrKvtBfoHun98Z7gGcl0eeLBYCarlX0fvOPOgWPwa91n+Rbk=
X-Gm-Message-State: AOJu0YytrAZWrUiL7+6yUdNAO6W9R7w+AwGyMGeETKCbMmoNesKAYDUF
	qD4y5caFX5qceUUAMrlsESEp/2G9FmAxCIyKQdhNoYW/i1tQj4zo
X-Google-Smtp-Source: AGHT+IGbs92c//BGiqmdUL4T55P2X9QmdN/SfOH2hxAjReRZ1Fd5UIZ7am79FuHHvN6tgafQ9jOuwg==
X-Received: by 2002:a17:90b:3005:b0:29d:fe93:52ac with SMTP id hg5-20020a17090b300500b0029dfe9352acmr5131747pjb.13.1711389186749;
        Mon, 25 Mar 2024 10:53:06 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a17090ae00200b0029c693a1e6dsm6784603pjy.17.2024.03.25.10.53.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:06 -0700 (PDT)
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
Subject: [PATCH v2 07/14] x86: Add support for suppressing warning backtraces
Date: Mon, 25 Mar 2024 10:52:41 -0700
Message-Id: <20240325175248.1499046-8-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105309_335483_18D9BFB4 
X-CRM114-Status: GOOD (  12.95  )
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

 arch/x86/include/asm/bug.h | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/x86/include/asm/bug.h b/arch/x86/include/asm/bug.h
index a3ec87d198ac..7698dfa74c98 100644
--- a/arch/x86/include/asm/bug.h
+++ b/arch/x86/include/asm/bug.h
@@ -23,18 +23,28 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	__BUG_REL(%c1)
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define _BUG_FLAGS(ins, flags, extra)					\
 do {									\
 	asm_inline volatile("1:\t" ins "\n"				\
 		     ".pushsection __bug_table,\"aw\"\n"		\
 		     "2:\t" __BUG_REL(1b) "\t# bug_entry::bug_addr\n"	\
 		     "\t"  __BUG_REL(%c0) "\t# bug_entry::file\n"	\
-		     "\t.word %c1"        "\t# bug_entry::line\n"	\
-		     "\t.word %c2"        "\t# bug_entry::flags\n"	\
-		     "\t.org 2b+%c3\n"					\
+		     "\t"  __BUG_FUNC_PTR "\t# bug_entry::function\n"	\
+		     "\t.word %c2"        "\t# bug_entry::line\n"	\
+		     "\t.word %c3"        "\t# bug_entry::flags\n"	\
+		     "\t.org 2b+%c4\n"					\
 		     ".popsection\n"					\
 		     extra						\
-		     : : "i" (__FILE__), "i" (__LINE__),		\
+		     : : "i" (__FILE__), "i" (__BUG_FUNC), "i" (__LINE__),\
 			 "i" (flags),					\
 			 "i" (sizeof(struct bug_entry)));		\
 } while (0)
@@ -80,7 +90,8 @@ do {								\
 do {								\
 	__auto_type __flags = BUGFLAG_WARNING|(flags);		\
 	instrumentation_begin();				\
-	_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);		\
+	if (!IS_SUPPRESSED_WARNING(__func__))			\
+		_BUG_FLAGS(ASM_UD2, __flags, ASM_REACHABLE);	\
 	instrumentation_end();					\
 } while (0)
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
