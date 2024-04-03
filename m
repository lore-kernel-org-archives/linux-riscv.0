Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C405CD128A
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Apr 2024 13:20:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=soimj1aURj9HauCMCOx2Z8lFnQC1ivQFAOBsD+eTdgk=; b=q2prQZXmd+5ZJJ
	ENyvYb9c0VqdQ4I3KI0cqdiKJITwWJ/POuYhLPaUX5OT633AwL9Pdmk+7g8gfBTuvLhA0ktg96UOD
	1+SCYd2P2VJ+rG3G1a9LbFpBEC0fOXE+YFPMbgtZRVIjgKHPn7ZXiLCV4u9Ea7IR6xp5FVytj4a9j
	tRgvG+rwT4Bftgs6ZglezK7u4x2nXMKrFSV7k968VNUsNtpY9MkWI9WsOi/SGja07kEuyld0ssd5E
	zFxqudL72j5ozQEk+RRDbsAATLEOqcrvkpH1ReTF/jmDHxdA7sWwNClrv4YvDTUZGVQJxf6t5IDWn
	XVUbYQA4J8ZmKufazI+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0XY-0000000G8vp-3E59;
	Wed, 03 Apr 2024 13:20:32 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rs0Wu-0000000G8VQ-1mWc;
	Wed, 03 Apr 2024 13:19:58 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1e0f0398553so56799295ad.3;
        Wed, 03 Apr 2024 06:19:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712150390; x=1712755190; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KUpuwFkhA/ZZkaJrm+5DUMvKoRunaI4/ZlB0ejZmZW4=;
        b=RIJC9ec7pfE/DMp+PXsR+50UbpFdJYIjJ65n6lPB3Dim7p8MTiP9tg82N1CzBhI8/X
         qy51pJSK3Ph8kR7GrOsdvxtm+AZzZ/9ThWOy43gnTNsN7gcWT4I9LIIxc1naW/sRkBzC
         E2keNWMIEtjbpgCvsgn/pB7cOOCrm5fUqnoIsJxtIvwZ2EEaqfwQtoDk8hwrKQ7nVexi
         6iskNr2SAOEC9hojkvUvEsohZJM1dFVgUb2wdpR4Hd3W9+5ZJFczQ9joFfCWZThB9X3K
         AKkO6L0v6JV/Qe/G/bEYp0rLlcYkiCcHhwjuor9wbWk5CrffjKSocgAEyfCL9jRHUR5x
         uNvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712150390; x=1712755190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KUpuwFkhA/ZZkaJrm+5DUMvKoRunaI4/ZlB0ejZmZW4=;
        b=SvG5ZD5XjxCzLpCUIs2GzVg07IKMGrRy/JzNotwuYUvhkZdtME+pHSl6LJWkkJ6L/8
         y+yhWTvpkLOMzX14aa8Z1raNrxh4CzLnu1VKSw4zdvXpDLNV5Pzgwy5HqwWT8RPqCw9Z
         NYHKVObwD6DZ+/SwQQY8T2kgGLzyHu9tWi1Smtzkmrrk0c/gK4YM80d2I9UrQ/iMMSDt
         QIonady6uguiK8Y4+AjydRO7DZqlIijQ169UNZp8zzIyVEBopAlvCvt+G1cQik1IeBo3
         01/h53Y2RG45NFyIp44dhLH+ravY9wUKN/G+JTbN3ljLeLf+Og8UpXXjENBl1RxbRGfz
         oJWg==
X-Forwarded-Encrypted: i=1; AJvYcCXDGNxf3KDwjxlAauYlGQXZnytOO9MI57piOJLtEJJ1wyXqnrsZ/QQjaayFjcvMAntVDDj67pu4qXRHnZCVWZoRDq1ivWL86UJMzeUvoSMIqov6e2RYgHPxtsnDj37lNKlKmRkGIIua1rberWzIKQB+qXcnbm4=
X-Gm-Message-State: AOJu0Yx9tDxamNDSffmY6b3nLpxM0mC91OnK96oQMvTY9PPaPXgGfd+4
	JdVXvwMONrnCXu1HQ4K8UBlymFQ95u0/vFEgCDS99xDvPJq92cq0
X-Google-Smtp-Source: AGHT+IE/2OacMp/2cfvaRksBgAjGZgKxyI++pmI4VDvZRW0+d8012wJeFPX8kGKifNbdvVT4SH77dg==
X-Received: by 2002:a17:902:f68a:b0:1e2:9205:5254 with SMTP id l10-20020a170902f68a00b001e292055254mr1881147plg.7.1712150389795;
        Wed, 03 Apr 2024 06:19:49 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id k10-20020a170902694a00b001e088a9e2bcsm13158796plt.292.2024.04.03.06.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Apr 2024 06:19:49 -0700 (PDT)
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
Subject: [PATCH v3 04/15] kunit: Add documentation for warning backtrace suppression API
Date: Wed,  3 Apr 2024 06:19:25 -0700
Message-Id: <20240403131936.787234-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240403131936.787234-1-linux@roeck-us.net>
References: <20240403131936.787234-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240403_061952_670781_9471E740 
X-CRM114-Status: GOOD (  14.51  )
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

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2:
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags
v3:
- Rebased to v6.9-rc2

 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..8d3d36d4103d 100644
--- a/Documentation/dev-tools/kunit/usage.rst
+++ b/Documentation/dev-tools/kunit/usage.rst
@@ -157,6 +157,34 @@ Alternatively, one can take full control over the error message by using
 	if (some_setup_function())
 		KUNIT_FAIL(test, "Failed to setup thing for testing");
 
+Suppressing warning backtraces
+------------------------------
+
+Some unit tests trigger warning backtraces either intentionally or as side
+effect. Such backtraces are normally undesirable since they distract from
+the actual test and may result in the impression that there is a problem.
+
+Such backtraces can be suppressed. To suppress a backtrace in some_function(),
+use the following code.
+
+.. code-block:: c
+
+	static void some_test(struct kunit *test)
+	{
+		DEFINE_SUPPRESSED_WARNING(some_function);
+
+		START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		END_SUPPRESSED_WARNING(some_function);
+	}
+
+SUPPRESSED_WARNING_COUNT() returns the number of suppressed backtraces. If the
+suppressed backtrace was triggered on purpose, this can be used to check if
+the backtrace was actually triggered.
+
+.. code-block:: c
+
+	KUNIT_EXPECT_EQ(test, SUPPRESSED_WARNING_COUNT(some_function), 1);
 
 Test Suites
 ~~~~~~~~~~~
@@ -857,4 +885,4 @@ For example:
 		dev_managed_string = devm_kstrdup(fake_device, "Hello, World!");
 
 		// Everything is cleaned up automatically when the test ends.
-	}
\ No newline at end of file
+	}
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
