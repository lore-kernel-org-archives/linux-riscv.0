Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AFF7C28B2E
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Mar 2025 11:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XLz7RZknHEAb0npEgGnq4tglfWX0f1Ut7mbjKX0gYaE=; b=fXc8Wn4aK2Tq2z
	pcy0PHMrEkihH1VHmTwmkmT+dDuOGVe0N5EcOYV/jGVconAbugoHKKkOhFOJ9Agrr4pHlKeXHs2Wu
	u4eE3fkyYTIG/+3QXthT0XcFajLZ/JqPKJnOYSv4NsKn0TDDY5PgBogY9pgmDOcGbvbp9RyUCdeDH
	jFbCjQbY9Wx0I4MUXHCApxHaRZez4Rzlb5quRjRkFD6L49JhC3tdWLAsyD8Vr56bcv532tCPV0vta
	FzNUlTdI8D9c+uhNGkQJJANw18zc1NiuZ4RL0cuOSXWWgsV29qpckq7Y8K6xhAO/gOYYrvlczOeb/
	YiG8YC7z8nJWDMaeimFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tshAZ-0000000B9DD-15Lx;
	Thu, 13 Mar 2025 11:56:11 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsh0m-0000000B5pZ-3YSt
	for linux-riscv@lists.infradead.org;
	Thu, 13 Mar 2025 11:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741866364;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
	b=RTGQDTIUALBVYAFVrkocKVY2d+ieQ9Evt8yAZGdCqMmmg8GRoMg2tK/tLBH6aIJFEP8Isn
	wKKE29zjSK7DR2bPSrkkg6g77dxKXFW/TkHdEKPamwIP8Y/u0PgGSjVHQq1Se1f2zxE7gA
	PYT7/Zrc97qdn7NJNg1LPTBltxk41uw=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-124-VLP3ZrFCPRaCgy8Sfbbcgw-1; Thu, 13 Mar 2025 07:44:39 -0400
X-MC-Unique: VLP3ZrFCPRaCgy8Sfbbcgw-1
X-Mimecast-MFC-AGG-ID: VLP3ZrFCPRaCgy8Sfbbcgw_1741866278
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-39135d31ca4so448463f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Mar 2025 04:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741866278; x=1742471078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=piebsVU5QZFL/FeYXj8vMs1AI4HP2ZYK+Wi3o0pUrOA=;
        b=ksrQ2wTCwP2YS2avMORnzTxzfyfaL4SU3RRjL4JLa5vp+6yqe7Blm7nX6INPMhcI1P
         p6HSvskCQ/HKgSWcRp++S3vOXiJdwwgFw7rdwT3R5RcYTVBe9vtyVSwAGQYNR3Fv9T78
         tiR8SF2iFgq8Mx+0UfF9l256c44uVfQwCBqBt4moWb4rJkyQcR/JjRMC54/d80BQMXKt
         nmLOoodV3LE4bZwklMqDqQ9K0ye4Le09c77ThrMzIEQqvSU9uRiCU8rt/guLw19prd+P
         e0OvP6KKyT941at/VnLn+F6MaB2P2d8OkEdjCJjH3CkdK3EIWPQrAvTWskP1TG0LcwFg
         tQCw==
X-Forwarded-Encrypted: i=1; AJvYcCWmnD5N4Gy/ze1I2gamwQcEHPs9RucVxXt21RvwYKsIcJ/CIF/BL3mu78dMKsFfeFtLHgxPYeWFr9Z5yA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvJI4kQxStA+EJ/iaHDqqHQcRnd0UXazkmSYH+DiEceteXyfol
	Yum3kPFi19csmRp6Ob2urWluYnFa38RjM30vglIutPJKQ1c+cZa7PPEjnn/yAYmY9HgMz0yVhR1
	3VyoYm2zlLYR/kSVAqJsSM2b4TpBoFHn0HDvYhRc+IwOUjwM7XpXS5DQh+W+CK95Ceg==
X-Gm-Gg: ASbGncvJjtphlWHT1mLw8ddyKw/4RoSYQKYc6W58E/s1d0qMkGvWn13Jz9W50U/6xgi
	0rDNe4rz03G4WhIgTQdoTfsBZr/zNg81JAlmqyLgbnVuRHZUNvIobp/Ze17EAcCQzn9Xk3dFS8j
	Os5IyKHjgq9/d2M3Wlh/5kq9Hb6iVaNvkhw1gdAO/NtNic8udoe7C2mZcWtgWKmV/dEEkvN+TvG
	HVLtJglB5yegSUbawAaxAz+4FHJSwrONR1pK+dDqIYiOE4lz/i9/RsLGzTqKY4qNvoI4pfUc+V0
	o24iMUgZ3uhRNyygKGNt
X-Received: by 2002:a05:6000:1fa9:b0:390:f025:9e85 with SMTP id ffacd0b85a97d-395b954eeeamr1447630f8f.21.1741866277751;
        Thu, 13 Mar 2025 04:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPsIsJrLJpu/wcDWacnMw+4SNJEtb8GetI5Mzi5kv4VuMQGkXurfVfuA8bqNlB7JY189Yj3A==
X-Received: by 2002:a05:6000:1fa9:b0:390:f025:9e85 with SMTP id ffacd0b85a97d-395b954eeeamr1447604f8f.21.1741866277398;
        Thu, 13 Mar 2025 04:44:37 -0700 (PDT)
Received: from lab.hqhome163.com ([81.57.75.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43d188b754asm17844115e9.14.2025.03.13.04.44.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Mar 2025 04:44:36 -0700 (PDT)
From: Alessandro Carminati <acarmina@redhat.com>
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
	Guenter Roeck <linux@roeck-us.net>,
	Alessandro Carminati <alessandro.carminati@gmail.com>,
	Jani Nikula <jani.nikula@intel.com>,
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
	x86@kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>,
	Alessandro Carminati <acarmina@redhat.com>
Subject: [PATCH v4 04/14] kunit: Add documentation for warning backtrace suppression API
Date: Thu, 13 Mar 2025 11:43:19 +0000
Message-Id: <20250313114329.284104-5-acarmina@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313114329.284104-1-acarmina@redhat.com>
References: <20250313114329.284104-1-acarmina@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WGfzcWZ89jBG3NPNrr_6EQl7JewLc3ghYQAdHzG3X8g_1741866278
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_044604_951429_FFD479B4 
X-CRM114-Status: GOOD (  13.18  )
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

From: Guenter Roeck <linux@roeck-us.net>

Document API functions for suppressing warning backtraces.

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Reviewed-by: Kees Cook <keescook@chromium.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: David Gow <davidgow@google.com>
Signed-off-by: Alessandro Carminati <acarmina@redhat.com>
---
 Documentation/dev-tools/kunit/usage.rst | 30 ++++++++++++++++++++++++-
 1 file changed, 29 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/kunit/usage.rst b/Documentation/dev-tools/kunit/usage.rst
index 22955d56b379..b2f1e56d53b4 100644
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
+		KUNIT_START_SUPPRESSED_WARNING(some_function);
+		trigger_backtrace();
+		KUNIT_END_SUPPRESSED_WARNING(some_function);
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
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
