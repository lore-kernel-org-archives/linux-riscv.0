Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1231FC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1lRTXYl/b4paB/Rf99ic/BCV316/TOro3T27epiKcK4=; b=uKesSY1dHGILdb
	XF5rf2sS+ed7ke7h4EBwdGpAAH8bQ4veovBjQ4Fq2vhMJYJ9gHc2y9si/35AAI/rsoauOvB1iDx6J
	PVd1mraU+cs2VvPlSKdcgZSfsBm/VhFTqK5TZg+VKRjrbgVJAMX3abfVXN7sVF/z7mNZ5Exnd8TxC
	SWTRDxUC/BcNhHTRR7LeNXBWTGvX1VhbS4IeMNr44qKu0Vq5/oNWMVe0lsMIJBYXHQ/p+G7i6saGf
	lff67buJJg8gLqkEmfQ6cayddTT3+BYhSBIKBXC+9r1J39WU5MvRpXhSZdcNax295nRZse0SnDZ8V
	6QjtVkqTa6vOJ7dilbUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6t1-004KHk-2s;
	Wed, 02 Aug 2023 08:07:15 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR6sw-004KEb-32
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 08:07:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-3fb4146e8fcso3876885e9.0
        for <linux-riscv@lists.infradead.org>; Wed, 02 Aug 2023 01:07:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690963626; x=1691568426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5NmnsqQcLcAcVyns3syLHoHVHQj0n5HXKDOsH4jqkjI=;
        b=EqQKZOT61wkw+20RF7X+vngIlAAxYuK9F0GA2VouTd7oFXT5ntfwtYpZ65vElTzBEI
         wH5WqXLM2utEn/AVCcSCea1hsOXZ8i3aXn/w842xXxrNUKm32EQa5fLaIVpl0cNMIHBA
         +c2LELxLXrtMirm1rF9berVJ2KtHsRaITSeS1M+KdFJXVYpYmPPuTeo7FTB3bGGLyEz2
         i0dJ001MWYG3LvzqQo33rZeJbqO6lwB9NkntoRVG3eabn/XookqijpJlrXimCR/5xZOn
         nVj+mtm78nD/FUE0hkiICkuXb0btj6HPYkJZmMIVvrmByMgFSyjvHWpuR/Ph7oszmYH9
         NC2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690963626; x=1691568426;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5NmnsqQcLcAcVyns3syLHoHVHQj0n5HXKDOsH4jqkjI=;
        b=R0Jl9NCTnDcicFDbfwahkHVJY7/M462c7UfQAL4wDYrqwr1fzHDtgXL2FuUPwKKEJI
         KNzyVV6R4Plm8se7yfzryAjZ6HITOk6C0KMZg+CNutyUhTE4kZbrTdrPsOgojax7SDTn
         qkNSeuE8/E8y1K0AFz1ZoMj4W+yHT0MKLLhndajw9vfp+Wp+zc7Wsw/FrnXyiq82yFY9
         lg2FO/W1aefbFwdbo2Rx8TbuRkQdyCvwMCeJbGsxOGaQb5kjf39HN1iFwrkMK11TdEHZ
         N0T7gelUg5fYPPkVKTP7vG5jt0lw+fSTyOpy16cwtrGUICsZqNyyNbeQzyy9N6W368Nv
         QfxQ==
X-Gm-Message-State: ABy/qLYIaztZ4H/HGkxdb5Zln5RvnFwR9KZH6MmM20Bic92yWoG87wx6
	vk7i7DMxBv4GgNTqJFtFrEhcxw==
X-Google-Smtp-Source: APBJJlGDzgNazOAZ9jBH2AiWYRrB1BJQBMr756Ojt9mmeUaI5QW0YfrzDigug65Vaw8o9yJrXEXpNg==
X-Received: by 2002:a05:600c:4d0d:b0:3fe:2120:eb7c with SMTP id u13-20020a05600c4d0d00b003fe2120eb7cmr4595794wmp.0.1690963625700;
        Wed, 02 Aug 2023 01:07:05 -0700 (PDT)
Received: from alex-rivos.ba.rivosinc.com (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r6-20020adfce86000000b003179b3fd837sm11037093wrn.33.2023.08.02.01.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Aug 2023 01:07:05 -0700 (PDT)
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
	=?UTF-8?q?R=C3=A9mi=20Denis-Courmont?= <remi@remlab.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v6 03/10] riscv: Make legacy counter enum match the HW numbering
Date: Wed,  2 Aug 2023 10:03:21 +0200
Message-Id: <20230802080328.1213905-4-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230802080328.1213905-1-alexghiti@rivosinc.com>
References: <20230802080328.1213905-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_010710_981127_3C1FA208 
X-CRM114-Status: GOOD (  12.78  )
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

RISCV_PMU_LEGACY_INSTRET used to be set to 1 whereas the offset of this
hardware counter from CSR_CYCLE is actually 2: make this offset match the
real hw offset so that we can directly expose those values to userspace.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/perf/riscv_pmu_legacy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_legacy.c b/drivers/perf/riscv_pmu_legacy.c
index ca9e20bfc7ac..6a000abc28bb 100644
--- a/drivers/perf/riscv_pmu_legacy.c
+++ b/drivers/perf/riscv_pmu_legacy.c
@@ -13,7 +13,7 @@
 #include <linux/platform_device.h>
 
 #define RISCV_PMU_LEGACY_CYCLE		0
-#define RISCV_PMU_LEGACY_INSTRET	1
+#define RISCV_PMU_LEGACY_INSTRET	2
 
 static bool pmu_init_done;
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
