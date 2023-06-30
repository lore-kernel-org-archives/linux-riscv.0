Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21570EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:33:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekf2qRZ0aQTrLAPulJl16rA9hLquRu3HvkH6zbfZC2E=; b=2oI3rffETbP3HS
	6UM79cCH7Q5lnSR6V50qbCbquSkBJSlYFL7ozgMZGUb9c7vz7zg1/Bj96ycPlxmfelNqtz7U/Ym1R
	XpcN2eVKKwMaiFTjp2QAxaNPDtHfUykrzwOb2h+fwqx3UxwHRXuW74zHzlQ3y0UzAcyI4Wn2c4Lh2
	IxInaNK+qOqSYQAMPPtUucGprbBFuIx7s5r6tB7HAqYdxB7ox4l2lUSGGso9OGCl18QhdYv1GOPk4
	AYsCAtmjKRkEiuOVT2sa2uokv/ffWh0KA/gewy0daCdla95u+fiqFFUlvf5y6MLOPOOVqq+5N9Vjz
	DnmRAmQi6Tk4PDWrFaUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9Za-003BOa-1U;
	Fri, 30 Jun 2023 08:33:46 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9ZX-003BMx-19
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:33:44 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-3fbc59de009so7034565e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 30 Jun 2023 01:33:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1688114021; x=1690706021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=YGAogcVzokF+D0qjqmU3kpfxHH4NCQmZL5hxdf7X6SSw33kykvLvK6O3yH62Wh5KJs
         AI+kFCJ+XKcyflz03tZeBSOK3mdSvkfolRUwvwoE2OoTCMNudeW3PdTVP95e6GocLU/N
         YygZJOZT/1wW8FkrtFxcSBXYCawVlOJln1BQSnbywabffKuPzm96PK063d/COMXtlZoM
         RfVe8d3eFPxGt8MI4tg2xzpfBf6tCr8koxakv9E5o1JNI2//NwB2JCt6o9+Vh8ajvvu+
         lKsjBGdikrwy1dWQPmQywiFnnCn9wnpbQ1KHhOw4ctZqEtIougO0WReOzYJMEwk93dxp
         UkBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688114021; x=1690706021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=SgQHT3RoWkujMDd4QJEYqh02jjohV2mfM86zMiiXzW7vrmiGqSF4GcLiKl9b8jjI7S
         aK/zCRLbbGhRazx+bR4/irGDaRwTD5EZWD1w5LyL/lBAg01KmcMZI2t0RLK3ok4+90QW
         nVHLRroWgA1Q8iEuv8jsIi5TVsOjnA2O4yTDHep6ipS8a5GCnTrfEFLmAZSJgwFAa5iM
         2hBULuZ7PMYYJ5dtdZkJ7aH5fAeMHfSYKCsVDyob6OieiF3zyu7y3JjqpDSn7bLvoK6c
         PCVbMYDiHM++LTyxIkAEF8zM2g8wDdGesCo5E1h/jCIV1XHb389zQpjCJK0KbegJPxd/
         FQsA==
X-Gm-Message-State: AC+VfDy9DM2Z/uMF0bCTUgxX9KCTCNMeVJYYeGAfZb5ZOjniwmnh4JCY
	x8iRd0HD/xrRjq5Twc6KFjb4JQ==
X-Google-Smtp-Source: ACHHUZ7Qad/4yQ+SzjVoKc4hjwSg7WrVeGOPcXS9LsZnNjqu+cFkrpDtf3BchhUp9ScTeVkytqKaOg==
X-Received: by 2002:a05:600c:2292:b0:3f8:fc2a:c7eb with SMTP id 18-20020a05600c229200b003f8fc2ac7ebmr1334297wmf.5.1688114021658;
        Fri, 30 Jun 2023 01:33:41 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id n20-20020a7bcbd4000000b003fb739d27aesm10273826wmi.35.2023.06.30.01.33.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Jun 2023 01:33:41 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Will Deacon <will@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v3 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
Date: Fri, 30 Jun 2023 10:30:05 +0200
Message-Id: <20230630083013.102334-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230630083013.102334-1-alexghiti@rivosinc.com>
References: <20230630083013.102334-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230630_013343_417928_48936237 
X-CRM114-Status: GOOD (  11.85  )
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

The current include guard prevents the inclusion of asm/perf_event.h
which uses the same include guard: fix the one in riscv_pmu.h so that it
matches the file name.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 include/linux/perf/riscv_pmu.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/include/linux/perf/riscv_pmu.h b/include/linux/perf/riscv_pmu.h
index 43fc892aa7d9..9f70d94942e0 100644
--- a/include/linux/perf/riscv_pmu.h
+++ b/include/linux/perf/riscv_pmu.h
@@ -6,8 +6,8 @@
  *
  */
 
-#ifndef _ASM_RISCV_PERF_EVENT_H
-#define _ASM_RISCV_PERF_EVENT_H
+#ifndef _RISCV_PMU_H
+#define _RISCV_PMU_H
 
 #include <linux/perf_event.h>
 #include <linux/ptrace.h>
@@ -81,4 +81,4 @@ int riscv_pmu_get_hpm_info(u32 *hw_ctr_width, u32 *num_hw_ctr);
 
 #endif /* CONFIG_RISCV_PMU */
 
-#endif /* _ASM_RISCV_PERF_EVENT_H */
+#endif /* _RISCV_PMU_H */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
