Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369C5C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mGp9oU6oVF042+S4yAiTtZ9rEjr8U2i5xE9kKzpZpxY=; b=c4sppjwUQayAt1
	xwExrZYMU2HpXxutC9m8IQ5QVs3+9P6yH2f96xaN9fNHPhTnVxX6AewWtRQ+mVQejwBAr5Hp6jeTX
	iZMem5711Qs+SbWaZNGndXRCLK4mn/zw7WZ1Ar24doBvCJUGnlTTVkUqbVLgd6JKU9EiQ02O6yL4c
	4/ojhfpfvR8trQKW50/KeK3R4ioWcTK9PKXDj88TCEx334Dr2foxqspB+ltNOD1DUP48Vn3Uao12Z
	saqEZNinW7fO18Nsl01/A5ikWjK84dhLfkTPp86/v0qiZcRDVr2ajxUz1J2Xc13XCOWWA9BrGNa8A
	BuuEC0I2EfE7PvbHRGDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVb-000000019z7-3SLh;
	Mon, 25 Mar 2024 17:53:20 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVM-000000019lS-0n14;
	Mon, 25 Mar 2024 17:53:06 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6da202aa138so2147397b3a.2;
        Mon, 25 Mar 2024 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389182; x=1711993982; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E5DnhCN93QNiYO14tG2AocbiB+DMWlDa/rXDsAPUdjs=;
        b=ArTRdyf/WhP4qiQ6/Q7yFyPTBuCk9RzC/6Vw5OjFkYem0HZ+EH8BOaxHBN1QoIZ9FW
         TLGJkov5f8RWb+z3n+GDGlOhhblS8eUt5EIoCBy8IA4wVb7jybISNqcjvyxx8TiwXxti
         ytn7zap0kJ6I5MQl4MGD7jozXiUc1NM9WWiQ1PDYtCuXKpPQuhdV3dO7GHZDkx4MOnoM
         Oa1S9aWJlpE/dtvVcBzgYJjyXwcVxh6/JbE2N50i741ftiZKI97yKF1k31WK+L7iw/fq
         5kqlozj6uWGQuncypyNREHrnzPo9RU01zsJS8Rf+hfdmr+l9+K0dltASOXu0mPJXSeEA
         eywQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389182; x=1711993982;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E5DnhCN93QNiYO14tG2AocbiB+DMWlDa/rXDsAPUdjs=;
        b=PZaunwMylGupNV1undOxqC/6xeaUGMtyDbwD3eoW6lTPMjyEHjjMQT+umUWugZHC1D
         5PlrDaNuVWDNmBULwBSYxi8ruPUo2NCHkdVnFA6Yzsiaj13jBg7B/CxyJu4trxjh4E40
         GY7kwdtYJhhhDNVELV2gvf3jF3xUZ94SmZ8/ns/Q8G90L1yrjfoMwxotuJwxlNdE3n/F
         3qjuQ1yfT4yGKlHFcmKp4iCmh0hcpF4r8uOytrPmDy0VYZwMblX9geOjRuWKZpL/tIjQ
         nPGcf2avCg1b92f9nygDP6aqAOzyAKjynPt9J7LbCeMdGjlT1S6WINLhYIEMiKBdPod0
         c+iA==
X-Forwarded-Encrypted: i=1; AJvYcCVSgxG6vE53padpAJUZLS7BPO4p6QciBjdoqEzoFjkxUZCE2bSElZ+a7wmU0sPe8d38Y1ESoKerFg6ybQbooDd3z0N1DWi02mk9Oa93pTkK0KnJEIVNMqGI0KYSKxUCQ8auiLayuBA1U/QH8qkD32Cutqpch04=
X-Gm-Message-State: AOJu0YyifplxYYyYIP5ZJHPzwbkmvgBc0Ke/0RZzs0GVTGrN6Xwk9+dY
	l8GiZ+OL6yNUGGM9g13uY9reNtz6TIO7bChRjNf8u6owP9QHk1im
X-Google-Smtp-Source: AGHT+IHUbFCxxsrPDRZqrZE3rVYi2h6yvmCQyCE4SU/FpvCJKM9Sju0fTz4yCOmRcDciiduCin1d7Q==
X-Received: by 2002:a05:6a00:9298:b0:6e8:b78a:29fb with SMTP id jw24-20020a056a00929800b006e8b78a29fbmr9626545pfb.2.1711389181672;
        Mon, 25 Mar 2024 10:53:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id z24-20020a630a58000000b005e83b64021fsm5516536pgk.25.2024.03.25.10.53.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:01 -0700 (PDT)
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
Subject: [PATCH v2 04/14] kunit: Add documentation for warning backtrace suppression API
Date: Mon, 25 Mar 2024 10:52:38 -0700
Message-Id: <20240325175248.1499046-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105304_670836_9696E243 
X-CRM114-Status: GOOD (  14.31  )
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
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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
