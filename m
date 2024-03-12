Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A720C54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:31:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jbzyty2RCuYT4JpfoiLhtewLrmDYtPbc/o9FJgeiBvc=; b=dkF07v+eUhYVJr
	VKkMIRpx4xJvRHsEG8E1UjQeCBS/mpe77tJnYZHRhwW9HOj7/cTs6ps4A+Qkq+7nq4e4c2ase5iss
	+p7Ot87GE//1LUFI9b/bJ0SAC6EvmrF9PORcFSFG+ib7Lu3jBO8MEMoA9IjD+YUulUlEVhy4FCfiW
	/odj+/1pmTic1dkw72IvDE3kM82AbJd2qjGcZJdGScKN8NLrhwJ6WWGwxB9rcvwsoG0EEZTkeCPss
	SLC2/Y1dG+j2psgBBpfcBMaWx/zr45rIl9sb1b7Rb6AjazHT2jxkHM4rRhhXOMgdVRCHw/At9gn1+
	l/F8C8viVeQDz27VJaHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7qc-00000007IJx-41Uy;
	Tue, 12 Mar 2024 19:31:40 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XY-00000006iyk-1QZO;
	Tue, 12 Mar 2024 17:03:59 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1dd9568fc51so22813505ad.2;
        Tue, 12 Mar 2024 10:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263026; x=1710867826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f6JeHPuNf2fPfe8/IgMEBFCbi+8s7x8ZP+Ypz6wTBFE=;
        b=X4CdKql5kCwSqcXSiksaOH0kTonaB+/SdZE35RxxYkzz2vnZMBCZ9xpWP9SUPCcCc/
         SvHCHJOFL34CQfDSd+tMd5L80tdHDVyOxNMyFD2TsYp6+nIO1a3DEHijL8QRcBdBLu8M
         h5qHJkZ9Ik/dD67ry/RvKZdNYKBqcQvJHgENet8J/aqrR8QMTgA2IryCCn0DAkSLAHqW
         1PkqKAwQdaUuRf6sqv/it338RWMUxLIZClg+ndwh8hAurNJnpXjxP4aHnVFi+FgVTaLU
         PNuI6HKM83dV/JdL2a1MVs3a0VqrQzUR/41Iq30Om2pVRuF/cBP5E56uqWlAmeC366ws
         4vrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263026; x=1710867826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=f6JeHPuNf2fPfe8/IgMEBFCbi+8s7x8ZP+Ypz6wTBFE=;
        b=SkYddvKkinUWc9Ud5+1koNVezBs74Hvpm4GgPu/nfgpnHzRvtqF1Y18wmHExsz2Ns+
         pjcF29oEFmvfzecKeE/vVueZmlJdYlHD2R68uqw6iWWJVIzpVdFwydDCrGFoQH7EU4GF
         /M+qZ9vv7KSuUMOjkmE48Za+AqlJdTPnqaTtTLeoND9vhs0wtwvBaLUdFjgvLLo7Bmai
         3jCj3MrO7hnEKdqR2nnSIxfrFnvMr8dyyS8nt5/WAYs5AXzmlfGxPn/8oAnSPcoEQX/j
         bPPGlUKbHXWPJapXZLha7NJ9etzqxrLYKqFlQcm1FKdlnyeqrx/vwK/onPHVjK7vuMrz
         Z96Q==
X-Forwarded-Encrypted: i=1; AJvYcCUPkNtAWnMzYZ5oFNoDyHzKePwmD+tPelRY60VjSvWfa0L7ccB5CprQ1o/ujwMwwJIUgmG/GnS8H6f+RAgWrWOoptUhBsn4MK1meiTIP+XCA92rnNM1v/+hXe1keArgvS9F0/kKZDIcg8P5MRtNjkqLdxY3o6Q=
X-Gm-Message-State: AOJu0Yxd1Ql7UI4I5W9MVfftWdwfqc96FHLSTGC49w97wBdalSd/TtpB
	WD9LvJDqN55ugI7BpPjZmhcdVa64jpw9uLNOPa23wb6+HMUvULXg
X-Google-Smtp-Source: AGHT+IFeKRBmX0VW7sv5rUHfZ0tynia7OwMdWO6tHkvskc+E+k+IhaoGejd1DMN70lLMBnMgohEXxQ==
X-Received: by 2002:a17:903:483:b0:1dc:fba1:1522 with SMTP id jj3-20020a170903048300b001dcfba11522mr6685263plb.41.1710263026027;
        Tue, 12 Mar 2024 10:03:46 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e10-20020a170902f1ca00b001dd75d4c78csm7006194plc.221.2024.03.12.10.03.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:44 -0700 (PDT)
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
Subject: [PATCH 14/14] powerpc: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:09 -0700
Message-Id: <20240312170309.2546362-15-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_100348_666779_B6F56D5D 
X-CRM114-Status: GOOD (  12.78  )
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
 arch/powerpc/include/asm/bug.h | 37 +++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/arch/powerpc/include/asm/bug.h b/arch/powerpc/include/asm/bug.h
index 1db485aacbd9..330d4983f90e 100644
--- a/arch/powerpc/include/asm/bug.h
+++ b/arch/powerpc/include/asm/bug.h
@@ -14,6 +14,9 @@
 	 .section __bug_table,"aw"
 5001:	 .4byte \addr - .
 	 .4byte 5002f - .
+#if IS_ENABLED(CONFIG_KUNIT)
+	 .4byte 0
+#endif
 	 .short \line, \flags
 	 .org 5001b+BUG_ENTRY_SIZE
 	 .previous
@@ -32,30 +35,46 @@
 #endif /* verbose */
 
 #else /* !__ASSEMBLY__ */
-/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3 to be FILE, LINE, flags and
-   sizeof(struct bug_entry), respectively */
+/* _EMIT_BUG_ENTRY expects args %0,%1,%2,%3,%4 to be FILE, __func__, LINE, flags
+   and sizeof(struct bug_entry), respectively */
 #ifdef CONFIG_DEBUG_BUGVERBOSE
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.4byte %1 - .\n"
+#else
+# define __BUG_FUNC_PTR
+#endif /* IS_ENABLED(CONFIG_KUNIT) */
+
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
 	"	.4byte %0 - .\n"		\
-	"	.short %1, %2\n"		\
-	".org 2b+%3\n"				\
+	__BUG_FUNC_PTR				\
+	"	.short %2, %3\n"		\
+	".org 2b+%4\n"				\
 	".previous\n"
 #else
 #define _EMIT_BUG_ENTRY				\
 	".section __bug_table,\"aw\"\n"		\
 	"2:	.4byte 1b - .\n"		\
-	"	.short %2\n"			\
-	".org 2b+%3\n"				\
+	"	.short %3\n"			\
+	".org 2b+%4\n"				\
 	".previous\n"
 #endif
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define BUG_ENTRY(insn, flags, ...)			\
 	__asm__ __volatile__(				\
 		"1:	" insn "\n"			\
 		_EMIT_BUG_ENTRY				\
-		: : "i" (__FILE__), "i" (__LINE__),	\
+		: : "i" (__FILE__), "i" (__BUG_FUNC),	\
+		  "i" (__LINE__),			\
 		  "i" (flags),				\
 		  "i" (sizeof(struct bug_entry)),	\
 		  ##__VA_ARGS__)
@@ -80,7 +99,7 @@
 		if (x)						\
 			BUG();					\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0", 0, "r" ((__force long)(x)));	\
+		BUG_ENTRY(PPC_TLNEI " %5, 0", 0, "r" ((__force long)(x)));	\
 	}							\
 } while (0)
 
@@ -90,7 +109,7 @@
 		if (__ret_warn_on)				\
 			__WARN();				\
 	} else {						\
-		BUG_ENTRY(PPC_TLNEI " %4, 0",			\
+		BUG_ENTRY(PPC_TLNEI " %5, 0",			\
 			  BUGFLAG_WARNING | BUGFLAG_TAINT(TAINT_WARN),	\
 			  "r" (__ret_warn_on));	\
 	}							\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
