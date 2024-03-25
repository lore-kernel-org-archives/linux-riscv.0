Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35186C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 17:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zgVd6rLMDa7kPRjYiaLxenT6w1P2GI7CR6zi+qA8E6I=; b=mDc9TgyFrJz5+I
	S9Ccw/NfanOL+NDsn1Cp0R1305zv9i0EDlTGD+7Iua5rv4+TVwi2SroxNWHcyKFiAetFv58sTgtFw
	X6rr6AJ37vf0wZddjsSAMF0mrdWWVLw8BvvQqbENJUEfS05xf7/r2pZMK9re5Up8Fq87zhj7qUtLj
	pjBBnA+TLVzMmMX45ezG2Sp9TuadmDNyw06aOdfCiC6j+y64ZunBmU+B/1RFr7yyyLsXH7WZcS7MN
	izdFH3dd+ReX5CVl2Ls6bdeUt9uXSUzABfnx9uAYnI9Esd7s5zt0O9cf4K8r5sfk0KGuYEcUAjNDp
	aDjbOjMAXQnp74eNtuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVk-00000001A6G-2YH1;
	Mon, 25 Mar 2024 17:53:28 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rooVN-000000019lz-2lnL;
	Mon, 25 Mar 2024 17:53:07 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1de0f92e649so32339245ad.0;
        Mon, 25 Mar 2024 10:53:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711389183; x=1711993983; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TSmEsP2HwUjZ+Kmad7RzlLHqlu7fphsCj8c3+UcbJqs=;
        b=Ne+ZG8rBn8/bujsyEWyfrExjSCbNOM3q9hvZNkSyhxlIFodhS0xFZ+5PP2IxjRzoXU
         SLEykM0L+tFQTONyNIDkz8q1SueKCoghsKQ2dnWzboBk0Ffr2WnQVDiIopP0AhhjnQPl
         8iAv3Bx6jJCzbMf75g0scf+RacyO/c0mEmviy0wtdoSCjHickyZSaU2W8w+5+k+0bFsl
         XMkBcyzVVSnOifawCO6/rDeaI+fHAf3gsSXm5DxJ2Shy8FJKWgOomDLMS9pkwWblMhM8
         2JZSW8oa5ChEdBd6yqTYHtRdap0JprXFW9ZF8ex3yQacD43H3QUk4+ndbI31ujowfQTn
         vLqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711389183; x=1711993983;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TSmEsP2HwUjZ+Kmad7RzlLHqlu7fphsCj8c3+UcbJqs=;
        b=Fdx6vBlLGt+7L5H0B/L8rjRej14SD27KqNX8M1AtITAm69I4DTpfRUASWaRhHgpzy/
         lJoZ07vOP5sirlkaZUCZbZYIc3Qj6iZ4DXufE/PEVZbeZ+2rkVX1NUuitWfMN0PbTY90
         L2P986nkJTJN/W3e5krOw9/wMD3Ut+H6m71HW1VSKhhFnPzbW3fTyWZzVQ1T3w/VwtaF
         h6lTw/yKHyiNKGYhuikEQ+/7xFx+xs8MFMciC2BVb6QNoj5Bqyalm3cJy4268FCU2yzg
         jbn3KJBfG30zdxSPX2qf9RcGNrsvJKnYvTp24u6wEm0BrXLVGPzucKL8ZLfvcy/DVvkR
         DuGg==
X-Forwarded-Encrypted: i=1; AJvYcCVPEDISCafp4bchXo+HHl+QHuXyKElOxDxKU1tW7Gosy74ZaMeTOacnZ/Fe9u+xl/JSDVy0nVUcLGaleWpm4TTzRB+MelAhrJy4f9lgdnABk1NpQCF8m5mZor8uoTFY/FsinOuJIDHPr6tR41D5kfOLrBkM9Es=
X-Gm-Message-State: AOJu0Yw7RPHN2kJ3NA2+Q3cLN7zfdecgNfXtdZDStHR3XCpDRO0fhGZ7
	qUamlOn4VUAZqeHfHAW/HM+ZR9XzStCAb+7YWptdHiJQA2gTcJUj
X-Google-Smtp-Source: AGHT+IEVej1vJgDHyMhirxlQLl4uccA8YOz8D7GQmS3E1f+SiDCdIFMWODSUkw2joL6x2b4cQW8ruw==
X-Received: by 2002:a17:90a:a88a:b0:2a0:486e:780a with SMTP id h10-20020a17090aa88a00b002a0486e780amr504319pjq.15.1711389183399;
        Mon, 25 Mar 2024 10:53:03 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r12-20020a17090ad40c00b0029c68206e2bsm6603983pju.0.2024.03.25.10.53.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Mar 2024 10:53:02 -0700 (PDT)
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
Subject: [PATCH v2 05/14] drm: Suppress intentional warning backtraces in scaling unit tests
Date: Mon, 25 Mar 2024 10:52:39 -0700
Message-Id: <20240325175248.1499046-6-linux@roeck-us.net>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240325175248.1499046-1-linux@roeck-us.net>
References: <20240325175248.1499046-1-linux@roeck-us.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_105305_974556_50A7F369 
X-CRM114-Status: UNSURE (   9.84  )
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

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>
Acked-by: Dan Carpenter <dan.carpenter@linaro.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
- Rebased to v6.9-rc1
- Added Tested-by:, Acked-by:, and Reviewed-by: tags

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
