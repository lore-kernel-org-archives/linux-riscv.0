Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6C3FCD1299
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 14:34:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hk9Pd6OlrptQsWDIIQkGneLZHwPp7drNtmqIEMvwkVU=; b=yJaKh35uhHxP2+
	hbsGuF10oHG5z0qyeSgoInwTb/8SnR059ItchRRv32r4rgi9TV3qGynyjSUKJqfOAoGMXrqaXZzPG
	kFNbSRmFSFQYv3O+1ENAFnSaWyg+dl5GFLK4UOxUhqFDzbUePyL/8y5TSmx00Ct7G/xyO59By6hQZ
	4FWs8YkJJnM9yyYojBKXZyyHnppWpaBbexmGzCXMULsBH9wVaaHBh/l/fJLMt6F2Wf5c4Fej62GKH
	JpUFqdRX7aIb9I88pPbKRYMhml1jEFy6ogkjTA3g4p/pBeYE7k1wFtRRlzT8h/M7L9+/domKeTTYh
	DZWiOnI3BAtjGuhmWXfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1h2-0000000GUjx-13Cy;
	Wed, 03 Apr 2024 14:34:24 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XL-0000000G8oR-2k9O;
	Wed, 03 Apr 2024 13:20:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=; b=KtW5y69+iG8tbxhN4I5ZXswFex
	OZzS7WKoma5JOcfY/OU0Qj7g/RRRX56keB5IPzIkt6fsCb48MKWMmnwokXpIdMolX7FQlGCTJnB2d
	X1EPn00DpddxDLTeCEDyKhayfPHnG+UwUhHDyhG1ytKBnmpU57L48fUBQFfHHwoj3LdG8JdnvrcBC
	s1HKA090wDmU22H439UukEdMRVhrP3tNx6XOEZAJS1GNZFIVGyohRjPeLgibTGcKu2OoAtGNNiijs
	RaiwFo5wp2JdmPPl94NTJtdN+vC/idO/jSV/0zm2Zv4gBch8x8D+CxamtMBWCDtZ0qwHYqOLYFNU2
	nnVvRhNA==;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XH-00000004ESF-180Y;
	Wed, 03 Apr 2024 13:20:18 +0000
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1e0ae065d24so53957995ad.1;
        Wed, 03 Apr 2024 06:20:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150401; x=1712755201; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=;
        b=kM9SkMmG24nJVJUaWNKfsesXQN4RCAwzv1Ng1kYzuQXKaqPJjXNE55J9bl+84P8gRB
         me5HVjBwa8xR3+MaXzQO5Zgos5D66kjDEJYrk/e4MLXKW2toO1Vp8lTjH5SBzCjvw9+F
         vN7xOCmO4wxU7wB03tJLPO1kGOwLimkQE1z3eyG72RZc+ZD4KkM8bQeFcydRmsr8QeDd
         rM/b2gtCIt6O5JD3ufQjyRh4fCiHEs/q1Ln6xXjMhSuojfNI2/gcmsE0A6BihjunwPzv
         +Pa+RpthUC26qC6LAizzthbdlBiWze61mkm5ieTWLn1XG0mYMCeIzO/8+IV3/8IkUJ3G
         27VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150401; x=1712755201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=klYg8xMT6MjrhYgIxkpLnDg0Lyaa6cQfR4UsA0LeN2U=;
        b=fvO2hDHD8bcrxTYchO9Q+QPp3tlqSfO+/BrewfwJTp4Q3O6O4+CjImdVhdnuSxEV7g
         o5fVnDmFn2VDbGcEfVBEk+LYc4BclTfTXhra6Rp2731aeNblwXJ6+5TwS4ZV9o5x5LO1
         DES1KCzHkzOz85IBNWbyxMe9WjAuGD6sLJ5SBc0nCIc7L7OXr49G/vQUtgCaPRA/gk1p
         +yCPrXIjbPCjsmwja0HDIeHOTfZHDXn4lvYK0eAi0NnIDcEajviNpBCnyknAbaNRhQP3
         14UN97CjFcFg42hn3HBngbLw32hRf8gigh0WbG6amTsmIjtXVm4cepEOikIbrJEQij+G
         2LYg==
X-Forwarded-Encrypted: i=1; AJvYcCU9dnok916t6pL6tQzrIccIsUm35bkG7tr+5LEomvAj1ZI/mFEkH5vZJwQ1uhhZJCNhNf9C4STyK9AXtL5FyakABuw7VfU8GtATsz2i3Yyc7qUmS5tka38GsymSabp4EavCKJ+egS8oiSwrkccNbPr33Jja5A8=
X-Gm-Message-State: AOJu0YzJnJXvQx4M0jCH/Vjh7hrIMDZdxQSyCCt1vubfjF5TW5ynDWZD
	9IU+TQSd4vsPKM0uL/CgbWQ0dgiwg6/SKjizYVW0cEebwrEQ2uru
X-Google-Smtp-Source: AGHT+IEMqe589WW9yt5k/lfzrxxoDYVpXeSOxtyZyHF9LDTCjhOnJNt1j89G1vs1iICWdJ7uWy226Q==
X-Received: by 2002:a17:902:bb16:b0:1e0:b871:53f1 with SMTP id im22-20020a170902bb1600b001e0b87153f1mr12301982plb.31.1712150401114;
        Wed, 03 Apr 2024 06:20:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id x3-20020a170902a38300b001e2461c52c6sm9309915pla.149.2024.04.03.06.20.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:20:00 -0700 (PDT)
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
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [PATCH v3 11/15] s390: Add support for suppressing warning backtraces
Date: Wed,  3 Apr 2024 06:19:32 -0700
Message-Id: <20240403131936.787234-12-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_142015_602328_0362D4F6 
X-CRM114-Status: GOOD (  12.27  )
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
increase due to unused __func__ entries (this is necessary because
__func__ is not a define but a virtual variable).

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Heiko Carstens <hca@linux.ibm.com>
Cc: Vasily Gorbik <gor@linux.ibm.com>
Cc: Alexander Gordeev <agordeev@linux.ibm.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1 (simplified assembler changes after upstream commit
  3938490e78f4 ("s390/bug: remove entry size from __bug_table section")
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

 arch/s390/include/asm/bug.h | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
index c500d45fb465..44d4e9f24ae0 100644
--- a/arch/s390/include/asm/bug.h
+++ b/arch/s390/include/asm/bug.h
@@ -8,6 +8,15 @@
 
 #ifdef CONFIG_DEBUG_BUGVERBOSE
 
+#ifdef CONFIG_KUNIT_SUPPRESS_BACKTRACE
+# define HAVE_BUG_FUNCTION
+# define __BUG_FUNC_PTR	"	.long	%0-.\n"
+# define __BUG_FUNC	__func__
+#else
+# define __BUG_FUNC_PTR
+# define __BUG_FUNC	NULL
+#endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
+
 #define __EMIT_BUG(x) do {					\
 	asm_inline volatile(					\
 		"0:	mc	0,0\n"				\
@@ -17,10 +26,12 @@
 		".section __bug_table,\"aw\"\n"			\
 		"2:	.long	0b-.\n"				\
 		"	.long	1b-.\n"				\
-		"	.short	%0,%1\n"			\
-		"	.org	2b+%2\n"			\
+		__BUG_FUNC_PTR					\
+		"	.short	%1,%2\n"			\
+		"	.org	2b+%3\n"			\
 		".previous\n"					\
-		: : "i" (__LINE__),				\
+		: : "i" (__BUG_FUNC),				\
+		    "i" (__LINE__),				\
 		    "i" (x),					\
 		    "i" (sizeof(struct bug_entry)));		\
 } while (0)
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
