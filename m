Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5141AC77B7F
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 08:56:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMhg3Ppxnso7+kktpRZ37ss+taPKYphTs3f1++d8Y/o=; b=ajS0G31wHJ9R19
	Nz4qidKDim9qFdYJPd3SiM3Kxg3DusUEca6Cmt0AHrFYyWaTDDUcCvm0xnGc4zvO/Hgd1funW85n5
	19Fmy8O71VpJkTZT18+qBFehn3lBs8FYnQQ90ekeapt3cXfWKniyU1BLzaHIkgRzR/lx0SBgSBX7r
	nWPHy5H/gEXyirh3iKLQJh8C1CIDfFdU/Jt4IkoHwn5X8uIVnDJ2/pO+E+1EnaXttUVQl5e1V1Bo2
	F1XecJQ1KJYZYpLcQXQa1RfmxMMPNst1Po+NM2+6Nu6quJ78tpK1oaov/BKJZFpqfEAF+0jXB5EPH
	2beZrbEZSk2lGhgOJLnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOZG-00BOHb-1b;
	Fri, 12 May 2023 08:56:02 +0000
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxOZC-00BOEc-2u
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 08:56:00 +0000
Received: by mail-wr1-x431.google.com with SMTP id ffacd0b85a97d-3078c092056so4700065f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 12 May 2023 01:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1683881755; x=1686473755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7QY27g5sr+JNiqZNrge47UBk9a46tJHd9T9wI0BAUVg=;
        b=Ftw175Ch82/1rbUuTQSZES/+yQ6S8AeXWJ5VcD+TAgo+kc3ujHnyYxk4Vx9cWrqXnk
         YV1zC8iOv4vkkA6pJla1yGyDXtKGzVeWoBbvbgQIRku/rrYOOkyAl4n/In1DM2/acQxv
         Fy03pankF2FBw0WocZAXDXLeqL1Sx+IN1VNZ9xDcInu6f8+LjY5+0JSebcnEEdlyqU5R
         szfalpQSRS/qB5VqQ3dVGsQdS4BrcefwZCRWAvc6h1KgNQ94PIYkcg6HoRgC4WOIP8QD
         cr/J2fXZedxcjopfHa3NT7Tr0qGvUU921a6drV0BrkCy5kwIV9/QkaG6a2casUQCe5zo
         JsAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683881755; x=1686473755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7QY27g5sr+JNiqZNrge47UBk9a46tJHd9T9wI0BAUVg=;
        b=VX9fOhdEPpiYJOVkoosrwlwKT+rAQduQL26iBiY05CbkQpf8mxPZ4JqOjK5IZu1aCo
         k1LRXGLWfs/em459VsCDpCO4pdQWTqfTUHTn8WPEA6YCQGvkiMSsFZSjCaNXw3rrtt0d
         UvIRa39WoUsBYKKcPr3K9Y5KRRR4hLg3i0hfpLYlwUoin6IvfxaPSksFxBnp6GUE6dIb
         MTb0sUWE69XPyvBjyx0wQAYDoj76UGaMadap8uWJtwKlhXaZN82MUXBxyBuCrRyFN6TR
         1vMMJlW78fpL0dZ/WPEzvVz46sMfgJetENcEJ+T0WHo7fhsIVVO7R8ngdqqZINMaENdy
         ozKg==
X-Gm-Message-State: AC+VfDyY0N+4LRUH+3rH5HqXmE1JdkMrp9O6Av9hpfLO/L8DvZnqSdG5
	4uly3FY8KBJ8JdrSmDQ+vZxoew==
X-Google-Smtp-Source: ACHHUZ54C+iKB9qdjhqaI3PGXYLZY6qG7W+R5zNSWjtlKD00ABBpJbsQ+mSkX+9abDl3CAFaMrFsdQ==
X-Received: by 2002:adf:f344:0:b0:308:d687:c1f9 with SMTP id e4-20020adff344000000b00308d687c1f9mr641587wrp.63.1683881755165;
        Fri, 12 May 2023 01:55:55 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d4a84000000b003062b6a522bsm22955661wrq.96.2023.05.12.01.55.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 01:55:54 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
Date: Fri, 12 May 2023 10:53:13 +0200
Message-Id: <20230512085321.13259-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20230512085321.13259-1-alexghiti@rivosinc.com>
References: <20230512085321.13259-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230512_015558_952774_95352C9C 
X-CRM114-Status: GOOD (  11.82  )
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
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
