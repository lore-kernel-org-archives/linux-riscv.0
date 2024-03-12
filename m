Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16BAAC54E66
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QwDkCmjZ9Y27CU2RDEs8bFe5+2pjbZczcddpXs7dNFE=; b=G+jfiXxdIkr6vX
	URoLbnCpOeZV/zG9MWI3Rbfll0NrZxioAcmPoilIWuGWLnyVUE6XHRhBf3iG4PbitSpcMXrUSdip6
	ag2yChl7w2SvOgMQsx5YRHTsSKGMKHt8HznJvcgj17DsZ5/guxFsK/XmcuRvzdhDjyvv5Sp5PkBmU
	IfW3ikKXBFV/VmnmPFkzmeVfDFFiMBo8kG5K0BDa2QLqjWbWA+V21/EvPPhpCjxa0kYWD7rqvZXRm
	FtglMkWtR6IJQsu/FX5tbXmLir/LfeCz7M2kftmiIdz7wTPZm9vAhN23eWNn9vMSvG1Lmi2Og26Ip
	/6z7gxBHdC6L80epvEMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7qQ-00000007IBf-2TLu;
	Tue, 12 Mar 2024 19:31:26 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5X5-00000006iac-3WsT;
	Tue, 12 Mar 2024 17:03:21 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1dc49b00bdbso34336775ad.3;
        Tue, 12 Mar 2024 10:03:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710262999; x=1710867799; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R3Kc+Yh+XQ4llosDDGAwX/2k1FGi6g14GWlRJRORANM=;
        b=mUkelREQqLvN8BVawZEUf7EbtBBW3ePLGSKJVVNjP2ez66BiL/hHHZYuy2Jq/f9gKU
         Dgp2+yYWlRnqpLdOhEhu0qOYD7lLywaA3HavUmVK1aj/nUuFaE9txaRvpCKfQX1DbxXP
         ymvYsqMm1oPn6jolsEMZKUKqr82GPpPaXDdyGCeix02gB5b3Zxa4j3ZAaxjasz3rgzfJ
         rD85Xb8jjP67Mcuzhxeu6qqdGzIf6RwiUvuUOBT9HFsjeh2vTmU4q39RxVo+2y4cYQXh
         Ty++hhw2VvuL+wi+CqkmvSRIzRC/VQhZe90YuG6+ssayX7+xcmPO5a5O37Hukg11iRHX
         3yRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710262999; x=1710867799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=R3Kc+Yh+XQ4llosDDGAwX/2k1FGi6g14GWlRJRORANM=;
        b=IAphAlI4ejzgUQ/iuJRaoQ0NB4zipi7h25IQUUuuGdGEdmfdPXr5EUg5w+MNfazIAd
         6jkszv57piAnUNRH6usGZhORv7qeLfgXmp9nWhGlnuER2Q96iB5DHr8p8LbSJMs8JD11
         A3yH9WwMwQBgV5v83/ZFRJCGFCyuexeD7emx8uqLj7j6OccGhpP5V8tVTbnSSZ16z8IX
         +L+u8dT260n/PNxGCclE0305zfNYUeCuVZvIdxLnzNuLWfk8AtwzfbqE024vktb7dqOY
         Ilyeukd+oUwriYGQqCfPuB5ebA4nn++t2yZdJrrVQzToxBmxlYwGru8r+Cz2ta0+b4bw
         i4Lg==
X-Forwarded-Encrypted: i=1; AJvYcCVGd6sAiGe3qZ4SnaszWqY9VqmD4K5IV3m5o9E0ElhS9A4X8J+rvUWm6jtiP/zkHRPkGDz95ib34xbELv9/ZLN22yzpThtsxYy2mL0YDD9jdzOiXvveuUNfS+B6Snw1qa1xLa2l34ApIPIj0/V3U/4FbZwY4eA=
X-Gm-Message-State: AOJu0Yx15JSY3NjqKYdC05C4fqwR+p5F8f1s5Qacpim0NFFRZY7pa2E5
	TmJkPR9Nl2btuyu2Ci4/yizX2YEH5nvkpvvqvJgsZRVjBrL4vss4
X-Google-Smtp-Source: AGHT+IEtMqO0igDV/OJPl9l/q0X7vf8EgJ9VbKv7ARIuPeUFcb0gEvMyJN5DQCEgr2SoDMnFKNIL1A==
X-Received: by 2002:a17:902:7b95:b0:1dc:418f:890b with SMTP id w21-20020a1709027b9500b001dc418f890bmr8936395pll.40.1710262998624;
        Tue, 12 Mar 2024 10:03:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e4-20020a170902b78400b001dcc3a46a6bsm6883069pls.262.2024.03.12.10.03.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:18 -0700 (PDT)
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
Subject: [PATCH 02/14] kunit: bug: Count suppressed warning backtraces
Date: Tue, 12 Mar 2024 10:02:57 -0700
Message-Id: <20240312170309.2546362-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_100319_918818_0F4C550B 
X-CRM114-Status: GOOD (  13.82  )
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 include/kunit/bug.h | 7 ++++++-
 lib/kunit/bug.c     | 4 +++-
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/include/kunit/bug.h b/include/kunit/bug.h
index 1e34da961599..2097a854ac8c 100644
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
 #else /* CONFIG_KUNIT */
 
 #define DEFINE_SUPPRESSED_WARNING(func)
 #define START_SUPPRESSED_WARNING(func)
 #define END_SUPPRESSED_WARNING(func)
 #define IS_SUPPRESSED_WARNING(func) (false)
+#define SUPPRESSED_WARNING_COUNT(func) (0)
 
 #endif /* CONFIG_KUNIT */
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
