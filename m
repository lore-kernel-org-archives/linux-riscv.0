Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D04FC54E5D
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Mar 2024 19:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0CYp+OLsW4sg9p5o5rGUmUwj27ahpdIl+U9syXj2JUk=; b=SKMvLsTFI1Ziha
	irHvadq7Xri4IclBlQ2dzrCKF+UVozUvng9MRgWoNXrcP+aMkCAikNf7dAkr3pqbc4abpAw2w0n2T
	kCoHwTcsfSO8z7+tdZ+9i7PakTzKgkRiirbWdjMAfDW2poD4fOzdWATRGzGq3rzBIvVCk1lugLfz3
	v0lAlcLMtlkDNNNjlYEwqBLNOUyyd3u7knz3I6swnZuenifbzIp8r1tcGqGZr9hP13vxA0diBa4O7
	iY1IVSwizRp8+5SMJdyu1NuS5oh5ikibrxlozeXS8XO1xNNfb2mWanvC/CXIVU9UF/gAeasAsw0A2
	4kYwX6rO2wrOdqSn6isw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk7qS-00000007ICY-31XU;
	Tue, 12 Mar 2024 19:31:28 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rk5XF-00000006idb-0xJ5;
	Tue, 12 Mar 2024 17:03:33 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6e6adc557f3so577032b3a.1;
        Tue, 12 Mar 2024 10:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710263005; x=1710867805; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
        b=FuGLyEshx6ZssHealmxyS3HK48hr+IPl4R8AdPiMXnNftnOsZHDcXGhDcJmocEozQ4
         n3+MMN2vucsx8qQY2pkIaggcJY0M5M8cEYpZ6IRzSxt0xu9Nap/4hHHHcCy+9T8zsPKd
         NerMH408j8nEK2eU0LjwL7PEn1totwMN/JXGWp+ruKF+LyeHp3Fw1LjVVz6nv0csdZt5
         kYaiZK512+5vrRErf3Z2IP/EgFwCaAUBqVvx4oHKMNrGzQVlbWLVE7tjpPFWhzeviu4f
         G7Vw75Yjh/I2i0pqHc1HBWduKEXe/tgC+kfeg5/xXMrd3jcFNShkTy8NvwMe7G056VqF
         C3XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710263005; x=1710867805;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NGQg+0HBD/PmNnv+fI5fQqG3IGlyLsIaZmNJE7ZYwjo=;
        b=FjVjOzq0VUGsr6gVWJM4SYB0NhJcEJJkCOFOEF9Jdbd6QA0oAYJJ334BrvaSD+kqhb
         LeCpZMAoPQrg7cMKpnTpKtDqjcY07hIkG3dvfK0Z+gYYH7PuxWgQPasJmZ8suBQ/eKue
         g1mRLY4HhP/vuXjXmYBVYcIm3ZWaLYvJmCD/cs98Ae8J1vsa0XWfiVzpF4Z4hHWyEjHf
         xITUm6rEAPVy3HyrvQcdQG7y5DGSWUA2nYb9xw4jTaSn3MbEmaeGK8Ln2sr6ahol0LPN
         oKXCm3jYh+CrMIOisgj4Gh98Vx4AA/W6RYMhYsDyliDNo/2FXPFXXyCuL6rQkHDE9sYH
         LNSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQCizT3GDOTwlEixcP52kmJZjK4RNr9vI7SjQgDmeG79URP9eXs9unzStj1NlxxjpAwEpUDT/gIFoGlksCCjZxYvZYm2D1RkN5A/4kEMjkb5wNDRVFUgsvNSCu3IW1ZB500BuhXjvApnPzlYbUButPxRnBkTA=
X-Gm-Message-State: AOJu0Yw/CKOHVdvS5NTXByhsjZroHITTTpwAC24LnrWflS6wfxP8mRYu
	ny4h1kJWZY+bpYDWIncs3p02pjpgX7tOOe4sm8zqJDYfGrsSQ1+m
X-Google-Smtp-Source: AGHT+IGxFzq6cbK7MrvIXcZlkGCehcjfwe014BGxyN94I+kP8/p7v7PJMJz1gy7c7O8kch/y3R6C8g==
X-Received: by 2002:a05:6a20:1a8f:b0:1a1:4ea8:1844 with SMTP id ci15-20020a056a201a8f00b001a14ea81844mr8418900pzb.26.1710263004751;
        Tue, 12 Mar 2024 10:03:24 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id t123-20020a628181000000b006e657c72cf8sm6830699pfd.148.2024.03.12.10.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Mar 2024 10:03:23 -0700 (PDT)
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
Subject: [PATCH 05/14] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Tue, 12 Mar 2024 10:03:00 -0700
Message-Id: <20240312170309.2546362-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240312170309.2546362-1-linux@roeck-us.net>
References: <20240312170309.2546362-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240312_100330_502353_A6DB281E 
X-CRM114-Status: UNSURE (   9.52  )
X-CRM114-Notice: Please train this message.
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

The drm_test_rect_calc_hscale and drm_test_rect_calc_vscale unit tests
intentionally trigger warning backtraces by providing bad parameters to
the tested functions. What is tested is the return value, not the existence
of a warning backtrace. Suppress the backtraces to avoid clogging the
kernel log.

Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/gpu/drm/tests/drm_rect_test.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_rect_test.c b/drivers/gpu/drm/tests/drm_rect_test.c
index 76332cd2ead8..75614cb4deb5 100644
--- a/drivers/gpu/drm/tests/drm_rect_test.c
+++ b/drivers/gpu/drm/tests/drm_rect_test.c
@@ -406,22 +406,28 @@ KUNIT_ARRAY_PARAM(drm_rect_scale, drm_rect_scale_cases, drm_rect_scale_case_desc
 
 static void drm_test_rect_calc_hscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_hscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
 
 static void drm_test_rect_calc_vscale(struct kunit *test)
 {
+	DEFINE_SUPPRESSED_WARNING(drm_calc_scale);
 	const struct drm_rect_scale_case *params = test->param_value;
 	int scaling_factor;
 
+	START_SUPPRESSED_WARNING(drm_calc_scale);
 	scaling_factor = drm_rect_calc_vscale(&params->src, &params->dst,
 					      params->min_range, params->max_range);
+	END_SUPPRESSED_WARNING(drm_calc_scale);
 
 	KUNIT_EXPECT_EQ(test, scaling_factor, params->expected_scaling_factor);
 }
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
