Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99730C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iiRTgwaHLD3lsLmmGauwQIKPNv5PSGGJ3G+U+icQO2M=; b=fqprnJc869Iqai
	AyF3hO0WGz5aNbgpmEimNqR9P5w/awNx3vUUhBF6wdEe8K6CSPYKJ5Ba8GV9+AhI6R9bMwxCBOIxx
	+JxR3gQEhgJ2vc8jDJJjXQ6mQbduhlLvPgFKJp9NtGr/D19d6G2xRe95ZM0uGwGGFAmINaMdQQrv4
	+Rv4NlL7tOSzpKw9JZAQzszfZ/6g+wyDtWHNmK7gA24CK4rMz/CBBp6rnu9r1eX77G/Jt0Ufq/ZSV
	h7jWE76SmJqy6u0Gbq2WxyKPSQVu08GhJAouzlYTGPwUhPobTVJmDax/q2n0UBDlSzzjyJ8lt41WO
	/7WVV+csZ7b6JyGaNZGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooWM-00000001AcT-1uiU;
	Mon, 25 Mar 2024 17:54:06 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVP-000000019kl-4BsK;
	Mon, 25 Mar 2024 17:53:10 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-6e709e0c123so3506114b3a.1;
        Mon, 25 Mar 2024 10:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389178; x=1711993978; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FTOeGU6FQqXFkFqXhTXI5f43XSJm9vhCGcg9SgmVgjc=;
        b=jZFSpPHVyt0n8DoSE9/wJEdT0++PFZUX1fZpNfUA2atcGG6m0LePR1d0B6E/mD25pc
         0d0TvH5gT1x0EI/ACQH0L59Ewc+MDGUVBU5B3HMyz381OlXfpmUDvTmwB01HzcAGAcYl
         Io+lyQQRw1eH31Jwg/mkS7/4EQNt82QMkCDBvyR18GUz5Gecs6s6pfw0qrMuR8KYxFKo
         jWa/WlVeWRMgjtteGiyo70Yo6M7Ti+jXq/4fXp64L7dGIaXQOL+byJTGLgZwUX56SWkA
         3eNbjH1ZJCyfhZnt7lzVZbBj+Mlm9N3TZJUKxBOrvGhVB6aX9ttzIyt9a9Ym48eOk+Pi
         9zlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389178; x=1711993978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FTOeGU6FQqXFkFqXhTXI5f43XSJm9vhCGcg9SgmVgjc=;
        b=LaI9yywmKf3qJgsXStAxiyyc+ZgxJSdPUsOKvnYQ1gpZVX7ivfhAOhjdZj0jYvKyqI
         Ztcs1ADio9HHB3sr2txkFQsc6Os3/rUthvXr3MuLLH5mjYJjg0PFHHpHTj/eoEmxHtJR
         JJS2mnqy5w942YAWmHMs1AqMr3VhsfbkeVzVa1TKHB+uiIpFE6ayGzKhU0d7jftyQZw4
         NmSdwPyYX30610W02YpADympB+Z1GLgsLuGdcqmqR8gjbqnTwXxz0Epqhc5s6UikRPVA
         QuYC6JbhA8t6igYTDpTc8mQEJGMOz5DRl6z1ZAdow8CDrRpZFi7/Dn0uxCCqmoeKXztY
         kioQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+TULCrp0zBeNycyRAO+8w7GYHpnpNIdaqrRNJNiAct7WoW7qYZybwgXPLolBWyeXeJ+gOmiWKx3SpsBYWWydcpFIQXb5fNcUXSSjGWQ6GhPRCjh66OBhXRYggNbYYmPRw8bzDRfrffsZIeAQygYedJ9V9arQ=
X-Gm-Message-State: AOJu0YwsQfNuC2sIFV7sToXK7ft+O67k9QklSl0K6rWR4oYgxTsruVra
	j4d4IIM47PK6oUQOITwgf/KlKINQ5PwiiH+psBh+i4DnhZVjRLnC
X-Google-Smtp-Source: AGHT+IHUF5/gztmPtcgdfhPMYdq4be7TA0gGRpEdurcbuiSF4hiBELhPQZ43z3ayY8PxmvtmmRl6tQ==
X-Received: by 2002:a05:6a00:990:b0:6e7:b3c4:43a4 with SMTP id u16-20020a056a00099000b006e7b3c443a4mr8121119pfg.25.1711389178489;
        Mon, 25 Mar 2024 10:52:58 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r6-20020aa78b86000000b006ea92de360esm4522577pfd.93.2024.03.25.10.52.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:52:58 -0700 (PDT)
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
Subject: [PATCH v2 02/14] kunit: bug: Count suppressed warning backtraces
Date: Mon, 25 Mar 2024 10:52:36 -0700
Message-Id: <20240325175248.1499046-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105308_211008_36B1BC52 
X-CRM114-Status: GOOD (  14.13  )
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
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
- Introduced KUNIT_SUPPRESS_BACKTRACE configuration option

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
