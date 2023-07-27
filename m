Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482B8C0015E
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jul 2023 14:16:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekf2qRZ0aQTrLAPulJl16rA9hLquRu3HvkH6zbfZC2E=; b=1ZjvMGSpO4JGMC
	orRQfKtkTSmZpEEWySUc9xZFA9B7w79sLjZ+PvJQO7qj84159LJfqTzPDpglQP8jfQPjiN9sPJNCs
	egJxQcEsLQauC+q4a2C1lsRpKTTSb83yoK4MYX1toHhQHa8MchGQr66EV8dmJllT73kwWFdCUZS+6
	3MIV9j305S01lIGFOSyPf/SMn6YuIfj7vVWciwk24sGNwe9uk6Q2mxoQ41E1djnA23kcdOr3WqyuP
	zN7rBCL+EIxaspcvkIzs2hztmSKSq6RwDMMcHw+QAVCznZhweiLw2plWh26Sjt+KuOyJZoKzDZhhu
	4SAnch2S2Rxhsds/C+mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1nK-00F3wt-2s;
	Thu, 27 Jul 2023 14:16:46 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qP1nI-00F3r9-0h
	for linux-riscv@lists.infradead.org;
	Thu, 27 Jul 2023 14:16:45 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-3fbc54cab6fso10485345e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 27 Jul 2023 07:16:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1690467400; x=1691072200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=1D/LtkuWMncLALJQA5Oohv9cG2Yw+utKrrqtK7JM1Yn+RymNvnSY9fFX1PAdOFVeFE
         +EX6RtgOuFxjr92TeijPn7uPEeNPprpopyNfm4DKu1YQS60vpDYm97TMm2WA9IjYgrq9
         Z3b4kymmbenBoGqlHA4IGwvWqjIUqqdILO4p1ldIlhsqIgrkvJWVsxVRnD2pr40UmyvI
         GUkRgoCKbYOQGm+SSqgBoGHcyLTdDbsx0VDmg6KBrY1rScjMUOHT4RauNbC6fqgNdVIN
         KPlCA2ru+fvWXDWpul7da/vvCtyBhVp3gfp0i7CgchDcih5kFfwJsBrXkPJzk7TYoh+F
         k/Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690467400; x=1691072200;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nFKT0CCXN0CmmHE2x8MUQw5sccSB1SdakxOhkM1UsG4=;
        b=j4k/8ACATQOJKx6iXb+KV0v3tSNEPJPjUswGbwIsfdjRIEmGvcXDIzX0xT0QjELxI/
         cjH0POmC49ttMuKRfu3Aj2ZU3sIL5C4dnnvd6mdgqY9YtZ8WAc0Ss9KRharjIXub4mZc
         r5RdLXjVBXJEPSDm8ccFuxrtqfpsNfi4Y21HMwQy3oYrCo/RB6PkHUtS5JDQ9Ousnqs0
         YQhuTX0oMAK8PveacU6S0W7IExX7sXxA+/Itqi7Fs3IJE5Yw8sRuBtzmvrdyjerhgAI+
         sPx5fjkj3czQvzosGb3za+ZhKBOQ6AUkGnFHvWQXhScmImHvDDcogu612+dWiY1Q/kxE
         KLZA==
X-Gm-Message-State: ABy/qLbOhdDfSjKOGE6BCPaT6QaQLEp+3EA6WoN1eizcXPuKmyqZHINH
	MYxLdIt0/qXHv7X077e0IyiQ4Q==
X-Google-Smtp-Source: APBJJlFGXcEc5+7cQs2g/tb5RaUcskCDcRqTea7shaZLYg1es1PZHB8gAvi5TEUY06Z7+y5IFGcPcw==
X-Received: by 2002:a05:600c:20d4:b0:3fb:c9f4:150e with SMTP id y20-20020a05600c20d400b003fbc9f4150emr1784324wmm.14.1690467400406;
        Thu, 27 Jul 2023 07:16:40 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id v16-20020a1cf710000000b003fc080acf68sm4789003wmh.34.2023.07.27.07.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Jul 2023 07:16:39 -0700 (PDT)
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
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 02/10] include: riscv: Fix wrong include guard in riscv_pmu.h
Date: Thu, 27 Jul 2023 16:14:20 +0200
Message-Id: <20230727141428.962286-3-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727141428.962286-1-alexghiti@rivosinc.com>
References: <20230727141428.962286-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230727_071644_259381_4AF3157C 
X-CRM114-Status: GOOD (  11.80  )
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
