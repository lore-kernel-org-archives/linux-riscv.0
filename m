Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9AA6C54E58
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 17:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Hgoe4dyrKYUHelGAsdBpbsadSYFrlCNImhikRbNBd+4=; b=RtfwJMaFdrEJZk
	5zJSahKfEj+NsX2oEjff0RE1Yb8+VnUgh84ClMVXEr0zYPUA2C0fFUcnOodJhoWe1w6uaRD63brfT
	+BpV1Y6NU9/sAb9hY0p8mVfx/jqhVclRn9ALCUrywrDyeBvk/2LH5hv283Inpb7bsDrPI2IeeNs6a
	iwm5XDJXnaAamYUF9trVAhaNmFk3OIEmmlYCbVqh4vZDXg6WK2zZjMv3c4nfJ22+2lf5QBvc81kWT
	Vo+T0Ow7zeiYFNnR5Ruy5uyRp9ljWY95jz3fSSingws412y2YGVjrtpu4GzzOd//ntZ8kpP7XRRME
	rx0p/Vm/8sLeLKyriRQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5Y2-00000006jNJ-0dNJ;
	Tue, 12 Mar 2024 17:04:18 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XN-00000006iot-1B35;
	Tue, 12 Mar 2024 17:03:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=mgfFEM0oJIh4ATTR993DWw0sPyKQH24EY/4/QOUPczo=; b=L2yDXwezvXsa7i/RJTCOhhmJcW
	7g+dt2Ct745cD+C7ibdYRA06tWMqRpmQO2iSfrI8oPBY67u+6lfgWZPoOL2796qMyWifKbAxTETaj
	OVo88WdBsHmoaNHk4Ux+lemxVuo3zrWHJt08XmdtJgUe4SxaD2ka0qsMg+dOZVUl5XuHfJWpAocrF
	pXRWdNx7GvZJuBu0mZGA+EM/rLRClRfo2WFbrQUuZ/lTIhv3313hPXN2zwKYFUkud5au3kv+VWsUo
	ZLDXuGdj//HXC+SlVOuRTlVhS8His0eRShphMAIvUwZHClupNj6NrLTr99VOCOh2Kswp+SWdSFOSz
	aOgiFleA==;
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XJ-00000009YeB-35AV;
	Tue, 12 Mar 2024 17:03:35 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-6e5dddd3b95so31874b3a.1;
        Tue, 12 Mar 2024 10:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263012; x=1710867812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mgfFEM0oJIh4ATTR993DWw0sPyKQH24EY/4/QOUPczo=;
        b=gqoW2xs7xdgcOIJSq5iqOPUdHx8T/wyxjZ+VKCDff+iScnq9MmqrMhfl8bl8G3YWb2
         aLL6bKTP95f3bt2Ui0NxjaWufL7j/7gDMY/LtmCvBp0zbIqQbzJxaqSqvevJ+/tvtZMv
         Fo3PMoeci1Q0sKlJUjh3W0GzyNx5ciYCzcH8wLNbV3xgEku2cxWKjAYP/1uzjA556u6n
         1trd14TAV6XA7VE2iA6KHpffe6Z8cAE16jN0bnyPgSg73IxGKNGM5MpRxBohfIdf3/2E
         Th3Cl4KaFRCVvu7ZakYQRiFlBLZRVZWmHyO/xZLHpcDRzfuk3wK1GizO+a6WbPWMg/Mn
         +W9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263012; x=1710867812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mgfFEM0oJIh4ATTR993DWw0sPyKQH24EY/4/QOUPczo=;
        b=r5wGCp9wnsmTtVhWid8Qczkpq15I0eUmiCiAEjwVxwe+qgpnhfBP36HLsqt5My05cm
         B+3TGv6J18MQQGk4U36HmqDLsYsF6f/RmUKQcHt/ZJ6SxJdpiYsOoQQ8QWeTM/dkEZSr
         ravuykOusJaM/IgkpVf2Y6YcWQWIPa+/a2s39FYt7FEfp4sYBGwjn9wxZ4Gcv79bZoCH
         rLQzYaMEAarLbYRfbuhir9EZrMgWsimiSOHj1nb3Ffi4RFy0RSzJgzyciuzXBKGqW01/
         Q+QCDGCLHb6X8wDexT1ptq7qTjN6ePUJ8cblzUeNQyvVvpBPURuCxG1Np7Zw4Dl3hQiV
         2zAA==
X-Forwarded-Encrypted: i=1; AJvYcCWmvEMwielpnNkjFFmpd7cEp5jEB3yaiwy5TL8eJ/8CZGxzAKSiUcuQX3Qan+83sWDjd6XWzHvHm/zAQNnj5VgekNVwiaRFOIdKquy6xZT6T4ZpD9RR+rdJvXvFf27Ixb7F/ziqHu7rUfhcRNOO4xT2a+VqRXM=
X-Gm-Message-State: AOJu0YwJPI8buH1zmynaq+ptKFL+sifWnzIna8syrjNUe8JWU5LbPli9
	XNbLSg5kPa/ZPtaDCetmhoVphDVpQWr+dqtUfWK+1jdupTPuf7xf
X-Google-Smtp-Source: AGHT+IFq2CL0ds18qlKLUiBCru+tEydVmq2O3jl6A2X5cUl3NOOBJhsozkjJ4JcvCmlm7vgxw0hJ7g==
X-Received: by 2002:a05:6a00:3a0c:b0:6e6:96cb:3ab8 with SMTP id fj12-20020a056a003a0c00b006e696cb3ab8mr29726pfb.10.1710263011492;
        Tue, 12 Mar 2024 10:03:31 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 29-20020a63125d000000b005dc98d9114bsm6228742pgs.43.2024.03.12.10.03.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:30 -0700 (PDT)
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
Subject: [PATCH 08/14] arm64: Add support for suppressing warning backtraces
Date: Tue, 12 Mar 2024 10:03:03 -0700
Message-Id: <20240312170309.2546362-9-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_170333_904706_1AFA1BB2 
X-CRM114-Status: GOOD (  13.64  )
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
 arch/arm64/include/asm/asm-bug.h | 29 +++++++++++++++++++----------
 arch/arm64/include/asm/bug.h     |  8 +++++++-
 2 files changed, 26 insertions(+), 11 deletions(-)

diff --git a/arch/arm64/include/asm/asm-bug.h b/arch/arm64/include/asm/asm-bug.h
index c762038ba400..6884089a7191 100644
--- a/arch/arm64/include/asm/asm-bug.h
+++ b/arch/arm64/include/asm/asm-bug.h
@@ -8,36 +8,45 @@
 #include <asm/brk-imm.h>
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
-#define _BUGVERBOSE_LOCATION(file, line) __BUGVERBOSE_LOCATION(file, line)
-#define __BUGVERBOSE_LOCATION(file, line)			\
+
+#if IS_ENABLED(CONFIG_KUNIT)
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR(func)	.long func - .;
+#else
+# define __BUG_FUNC_PTR(func)
+#endif
+
+#define _BUGVERBOSE_LOCATION(file, func, line) __BUGVERBOSE_LOCATION(file, func, line)
+#define __BUGVERBOSE_LOCATION(file, func, line)		\
 		.pushsection .rodata.str,"aMS",@progbits,1;	\
 	14472:	.string file;					\
 		.popsection;					\
 								\
 		.long 14472b - .;				\
+		__BUG_FUNC_PTR(func)				\
 		.short line;
 #else
-#define _BUGVERBOSE_LOCATION(file, line)
+#define _BUGVERBOSE_LOCATION(file, func, line)
 #endif
 
 #ifdef CONFIG_GENERIC_BUG
 
-#define __BUG_ENTRY(flags) 				\
+#define __BUG_ENTRY(flags, func)			\
 		.pushsection __bug_table,"aw";		\
 		.align 2;				\
 	14470:	.long 14471f - .;			\
-_BUGVERBOSE_LOCATION(__FILE__, __LINE__)		\
-		.short flags; 				\
+_BUGVERBOSE_LOCATION(__FILE__, func, __LINE__)		\
+		.short flags;				\
 		.popsection;				\
 	14471:
 #else
-#define __BUG_ENTRY(flags)
+#define __BUG_ENTRY(flags, func)
 #endif
 
-#define ASM_BUG_FLAGS(flags)				\
-	__BUG_ENTRY(flags)				\
+#define ASM_BUG_FLAGS(flags, func)			\
+	__BUG_ENTRY(flags, func)			\
 	brk	BUG_BRK_IMM
 
-#define ASM_BUG()	ASM_BUG_FLAGS(0)
+#define ASM_BUG()	ASM_BUG_FLAGS(0, .)
 
 #endif /* __ASM_ASM_BUG_H */
diff --git a/arch/arm64/include/asm/bug.h b/arch/arm64/include/asm/bug.h
index 28be048db3f6..044c5e24a17d 100644
--- a/arch/arm64/include/asm/bug.h
+++ b/arch/arm64/include/asm/bug.h
@@ -11,8 +11,14 @@
 
 #include <asm/asm-bug.h>
 
+#ifdef HAVE_BUG_FUNCTION
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC	NULL
+#endif
+
 #define __BUG_FLAGS(flags)				\
-	asm volatile (__stringify(ASM_BUG_FLAGS(flags)));
+	asm volatile (__stringify(ASM_BUG_FLAGS(flags, %c0)) : : "i" (__BUG_FUNC));
 
 #define BUG() do {					\
 	__BUG_FLAGS(0);					\
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
