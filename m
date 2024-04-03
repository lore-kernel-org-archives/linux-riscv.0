Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B292BCD1288
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 14:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K7ElIdN8Tm75nauDLK0wU3sFvaaT8mBf1Qm+G0NdbIc=; b=iMo35j7kmn2M6m
	jMoc91bRn1xmAZhwG64RkVn/j3dlW9thLn4KSbEiqU0WW+pKIwL+Dq7tW5A0tZj9KDWdz5pKhjOl/
	Pg76v2+pyWWjqu3g4DhgJe3s0Wa7tZ0ug/qgbLj0ZHfZsR23qG7UHQDEt2tbDcPH+0Nr22/JSVKW7
	KJetgTvYB9r6VjrjjxFhtvbE1kti1/5ImBxxJBQakXFenTARxI5ab7aGzmt3vlBdmGCEI8hnXYeX3
	J7LROFJgntnpJcJEas74BkHHPZCbrFVRjeSfiRbcr1od8cR1lG/X3p7CC8deENB+HRnbh/n/aosKN
	jzuTwVCU12BAd8LN92NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs1gw-0000000GUg2-1cqn;
	Wed, 03 Apr 2024 14:34:18 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0Wr-0000000G8S3-1WhO;
	Wed, 03 Apr 2024 13:19:53 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1e27e174ccbso10904895ad.2;
        Wed, 03 Apr 2024 06:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150385; x=1712755185; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPi3jXYhV/VW7gVgCzBi2KBL1/Xcj6OVJJpN8P4Laxs=;
        b=Hdis1yKYxs7UzPBOWDK/7whrRx3Ma3wLxyJ46fWep9HEnnphkb7aqX1uRqaFBY3ZfS
         6GhceUUZexFSQh9vzC1wHbEQhiMowqoJkHwgFQc09ibnDKXsK7/OHHJ5ogut/K/T54Wu
         Apek/yef/Wf1v9N3hjWWV4gR5QN8bWrEFAIDoFZ40rwzhXLiEMPYqqHZz5QZqcWE3P3c
         hd32tBCXxp6zV1EbIMHJlgbJSPU5lxMWUslPTXYiF1Hey+dVMuFLGPbMufG8/W6EMNd2
         qNSWqruZNqgFfmU2HL44LMPBuoAtxMSlCJnLE6DVS1iATuhQC1N+cOIeC6L/gOBlbemb
         bDXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150385; x=1712755185;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vPi3jXYhV/VW7gVgCzBi2KBL1/Xcj6OVJJpN8P4Laxs=;
        b=vaePumFxZrOPYH5q0wWg6ifZlxWNnIRpxzjzRed89Ubxhn/hKJJ9r6mEiPUtKweFRq
         0cFixv5F3mnxSUM3wALHRdt+ZwRRuIHPrOanK7PwLooIhMyr2H93Qmf+Ec3LLWYiYr3f
         bl8a4/oTMyg0tGreoGFpduN1tKtLK4fxWntzecbrn7QKpWTWP1/ShBZSpu39zk/FWKD2
         XnNT+seeKg+GC0VpxYwlzDYwWbqbXrSriTphiXsV9CjpTfzoTRbWcCzz0KCcmCe+KxnI
         3D58UXfp+ObcGSAbANeXf9D/8Z/zuffk08HgFn9jaCnrmV0IaaiXZpv7ehpCkKAX2Vw/
         g25A==
X-Forwarded-Encrypted: i=1; AJvYcCXbKJuBzRS8hC9OF1GPo2Q3IyCMSSM+Bme8rq8/xgAtGBUfmIgE7LLDwBFI5VVFGR40pG6Wcr/UPb7lHNyMlYi52FMcpbDF5mTvuv3gaGq3NQpoOirComxJS0kIuzbIlaT2wbePfHSsmqlOyj8CJckU812eHw4=
X-Gm-Message-State: AOJu0YyvyvrU6dijouWaYWWeAIRY71wDQDneOPTMv8B745FeXYBt43Dd
	UM8RAyTpVtgJmfMHQrgGR/dPlOABNbjjXfYbOXMgJC4+0BgrlaD2
X-Google-Smtp-Source: AGHT+IEBdntNuCJK1g1Qd+nUbBCHvT+g3ANfVkijVSktnMtYlUtgHLeuVpmPgg+o1C+TJMJB0A4+8w==
X-Received: by 2002:a17:902:9004:b0:1e2:5e2f:682 with SMTP id a4-20020a170902900400b001e25e2f0682mr6996194plp.2.1712150385380;
        Wed, 03 Apr 2024 06:19:45 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id u2-20020a170902e5c200b001d8f81ecea1sm13305095plf.172.2024.04.03.06.19.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:44 -0700 (PDT)
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
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH v3 02/15] kunit: bug: Count suppressed warning backtraces
Date: Wed,  3 Apr 2024 06:19:23 -0700
Message-Id: <20240403131936.787234-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_061949_619981_ADB72F43 
X-CRM114-Status: GOOD (  13.98  )
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

Count suppressed warning backtraces to enable code which suppresses
warning backtraces to check if the expected backtrace(s) have been
observed.

Using atomics for the backtrace count resulted in build errors on some
architectures due to include file recursion, so use a plain integer
for now.

Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option
v3:
- Rebased to v6.9-rc2

 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index bd0fe047572b..72e9fb23bbd5 100644
--- a/include/kunit/bug.h
+++ b/include/kunit/bug.h
@@ -20,6 +20,7 @@
 struct __suppressed_warning {
 	struct list_head node;
 	const char *function;
+	int counter;
 };
 
 void __start_suppress_warning(struct __suppressed_warning *warning);
@@ -28,7 +29,7 @@ bool __is_suppressed_warning(const char *function);
 
 #define DEFINE_SUPPRESSED_WARNING(func)	\
 	struct __suppressed_warning __kunit_suppress_##func = \
-		{ .function = __stringify(func) }
+		{ .function = __stringify(func), .counter = 0 }
 
 #define START_SUPPRESSED_WARNING(func) \
 	__start_suppress_warning(&__kunit_suppress_##func)
@@ -39,12 +40,16 @@ bool __is_suppressed_warning(const char *function);
 #define IS_SUPPRESSED_WARNING(func) \
 	__is_suppressed_warning(func)
 
+#define SUPPRESSED_WARNING_COUNT(func) \
+	(__kunit_suppress_##func.counter)
+
 #else /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define START_SUPPRESSED_WARNING(func)
 #define END_SUPPRESSED_WARNING(func)
 #define IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT_SUPPRESS_BACKTRACE */
 #endif /* __ASSEMBLY__ */
diff --git a/lib/kunit/bug.c b/lib/kunit/bug.c
index f93544d7a9d1..13b3d896c114 100644
--- a/lib/kunit/bug.c
+++ b/lib/kunit/bug.c
@@ -32,8 +32,10 @@ bool __is_suppressed_warning(const char *function)
 		return false;
 
 	list_for_each_entry(warning, &suppressed_warnings, node) {
-		if (!strcmp(function, warning->function))
+		if (!strcmp(function, warning->function)) {
+			warning->counter++;
 			return true;
+		}
 	}
 	return false;
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
