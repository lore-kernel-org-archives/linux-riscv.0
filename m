Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 311B2C54E60
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 17:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MV4s32sjQOJqcATWomJdeKikRD0qdq8TinI8LHIideo=; b=dRJ3jPBFWPSe83
	U80+CI39M4cHyK3QM2NhJULo+pjx7GTQkfJCGN1Iotw/uEgS9+o1KOxUUVZuA/cOr2WEqMLJnptbl
	RQgWclAvimUl6Q5VpJ+1ckBlBfnKxRdj/6w23yOj17YE2yn7ZFJk19luC/Cr+4c+UFqymU22iWoty
	Dai2DjYvX8615W5XtAlLXFrJ1TvE0jJKJFzHNHJZZwYHh+5cfoG83xQADuNpamGgl8wk4mpRanNl4
	cyA7iI8Lmu0rfNoTsEXRT05i8ScktOLie8D+tBFvSk04tJz4xMCst+jnOcLefKGRlFGKQGmogzR5O
	mak9nfzlREIHlHDr+QSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5Xl-00000006jA1-1FPy;
	Tue, 12 Mar 2024 17:04:01 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XB-00000006icT-0Q0r;
	Tue, 12 Mar 2024 17:03:27 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1dca3951ad9so47285635ad.3;
        Tue, 12 Mar 2024 10:03:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263002; x=1710867802; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=36BrykVX1YEJvDrrNJGSTLQfgxZ1lgqGPC6PgqTTbEw=;
        b=GbMSCdmYmzTeoAE1M2oKR1Kw62noH7EBXDmdZs1Un8RRDnzoDunyyYjc+U7NNUtVF0
         p0WqvZGNRXOJ+NSrwTvg8o0Y2aR/Ohz6GDuD6htd+R7Lioy/UqXFNB8l9jXTaXL5e250
         sTsMKdDnkBiWAJZwXsyc8gY5u5CW91xGal7VRD7WhA1vCFd6495sGk5rRsLqXUjqFwLz
         E7jDAausmV8Sg1mP3o824ynm870oMrrbD4BmNJqAl4DHt2h7wo/7T616SMKbhIbcoQMI
         q/PBg9rQ2LwWSzP4WSyAYBFbQWV8/qXuhpIzRCgjn3xeWhggYw1HzS5bPDoYlLz4fV56
         2OIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263002; x=1710867802;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=36BrykVX1YEJvDrrNJGSTLQfgxZ1lgqGPC6PgqTTbEw=;
        b=GElk2twe191iq2ec2DphmbTFST5IINdcNfPq68hP9bnYq+k2mqC8OOmb1Dpy8lk5oW
         9jnYMwi/kR/gtydGRBzo7796fQgoMUGM0SK8bSEq5r6YY8lJaTHs/HP2tn71YPDl/rjP
         /iiMQkIQ131LnrCBTjAgE7ZoSdkkeSIswYMlxnkU/8tZgpYcbW2OPx0VE47pfh2jXWh7
         zPWWtuQ1YWMq/Onpjf45u91ysZNGZbtYXLEhGiNhIUblnkk2+aGqb/shzjd1MyuNYzj4
         QtZSLtOInFvHV5qN/GuqY+sy1F1y6uyuTo6+TMWSG1ibbYlKFwyXsuqFsbg7YXWKDIYj
         GMgA==
X-Forwarded-Encrypted: i=1; AJvYcCX1EaWAWbOAwkUwEZ6pKCGxQWcgSt7hgaz3XvP/LICF9Y+EB/r2tEYaD6h8rQUsxAOG1BjTCxjEC3dBbksLdxKVa+gFv5m4L2odxzN28+lAbCm9Xb1VtxqpNf6v0VnAUxtYN9hHlEvhLKATZ4ogwgYqCfs/J94=
X-Gm-Message-State: AOJu0Yy/aYYgNXT81NGJljcK9gKtBds+SMP2tdD1f7R5SikWEHMqsiob
	rp20MXvi8E4VL1ryZAL0knjoSR/VWn13RrdBClPwyDyRYb3tjZky
X-Google-Smtp-Source: AGHT+IHYAZUPDqsFw7GWyh1RSbVI2Qwrh9Mdl1wKcQdsH3Ao31Ql441CQm7bvVJxkQ6v+AiS/8LElw==
X-Received: by 2002:a17:902:b198:b0:1dc:d8de:5664 with SMTP id s24-20020a170902b19800b001dcd8de5664mr9227736plr.33.1710263002517;
        Tue, 12 Mar 2024 10:03:22 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1-20020a170902a3c100b001dbb6fef41fsm7095813plb.257.2024.03.12.10.03.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:21 -0700 (PDT)
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
Subject: [PATCH 04/14] kunit: Add documentation for warning backtrace suppression API
Date: Tue, 12 Mar 2024 10:02:59 -0700
Message-Id: <20240312170309.2546362-5-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_100325_453138_0929894E 
X-CRM114-Status: GOOD (  14.19  )
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

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
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
