Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE73C3DA4A
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Aug 2024 09:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tc1WNoWmGA0bJNVZj+Ge6NR0EiCq5nPfYTxO6W4wsRQ=; b=CZQ1wJGTCS4LJ1
	QY8zEKw82BnY90rCLjkAvle18VSIeRHl5q2Boqy4n6cL4TBOMH/66AoY6X17M71YbjnnjPZhycENb
	MNEBYaGOey+MkAJJXtXPcgcwfuRtNahwl+vGFaT78S2Z+qErQCbu0Nq75pS0+E3mJYfHpTqOvzQdK
	fYUOvCuYqPgP5xGSw0kJf+96O3yvgpHebnsl3zJLUwYn/qhgaXYEFnCG9g4fqL4Qb5rhdQhFOWbKM
	VRr7jd0wBiYXwfYMZCgfT22ta59NnDQ2CTjH2yEmjCERnqEl44xfp/11P19yhM/pF61zTMS6ZZSdU
	ud/ctqTmYCN4ZjnEFScA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLPd-00000004dpy-0urN;
	Tue, 20 Aug 2024 09:44:25 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sgLLp-00000004cbt-017i
	for linux-riscv@lists.infradead.org;
	Tue, 20 Aug 2024 09:40:30 +0000
Received: by mail-ej1-x62a.google.com with SMTP id a640c23a62f3a-a8647056026so77638766b.0
        for <linux-riscv@lists.infradead.org>; Tue, 20 Aug 2024 02:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1724146827; x=1724751627; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ml5kmP2AZ4rRTo1ml+BArOzT8EmV3i5O4Bq4nH6wu1k=;
        b=h3mEfBAWBxrzC4jmr5tNibLB9yLYVFllUrHov923tCiAzb9nUc/XR4yf/vbzP8HIQo
         ql1v1rdNWkXeGOt80Y9xlkUhPMCue/ClN2WRv7yZAnZpNnsoPo6xu3J2jPyV8gT6pfJ0
         sQD7FZNkOPiVOaywavosT//As4im0/i+IbLwFNJXaMzhM79yiaw7X9XF9rD+ncv1UDvU
         XyiSJs3WG7I2SF7tGU7mMsjb8Da/ZzzsA866JyE03izlv07WTmlcs7EK0qzgk4SHlMla
         c/poRfK7jwmY21KCK4Pj1yMFGSem1ntXiRZUG8Qqi84+VFOW56MiZsaA7pnqNPUicdUz
         Av9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724146827; x=1724751627;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ml5kmP2AZ4rRTo1ml+BArOzT8EmV3i5O4Bq4nH6wu1k=;
        b=p5IyseWqZqxOf3DGwehsP4iGOHU1l3jTRk86QB50XaiWtMJZTthocrtHZZ1N2v3IeE
         JCth6tZMtqmgxFHqNaCogIcsy3mwSDjSBmqDX2KsoWMnWXZOq+bkReo3lbzS6vXt0Pkk
         OtVj5HF/3oUqkiH9raKmkwrCU/lQjSqjjc+z2e1wIj4Zs6/GCOIhU0DXWe7lKa8pbP32
         2iZW9Bn+pS75KBEcd9RrCcMM87NfmZRFXk6bwmbbOOgxShzRy5YHps26YT7nctZ35PJn
         uLbltI5sb0fdZGK2SQDk6jn2UFaBWNb8RF1ipBKkQKpCAzAnWwRUEaCigtanKonUNaq8
         OeBA==
X-Forwarded-Encrypted: i=1; AJvYcCXzzy4OJX0FVJJmarTy/fXRlAO4z640yzGikyecjip95uRNVYNYJ3F50YZzzL6CzYdGDLG7Q+zXnfHgDfVrTpxkDdE3mwnXPNjyuT2xev9C
X-Gm-Message-State: AOJu0YymhkBWVDo5xvyaMpaBGtpllVPuPdsNGeZLU1tktSByHQ0ttRKR
	i7PJnGWrYx7xTqCTbmyYHLGZG2Nt82refcibQ89wuk7TgR+wiQd3kv8rap62BidMnIkX4y33Eh8
	Y
X-Google-Smtp-Source: AGHT+IFWIcPWJD7AezJob3CaaT6BEKEOeCZ2xK2iLUqEJ3Fjit54kT8/4nWS9N5eeGL5wXOTPMbcfw==
X-Received: by 2002:a17:907:e207:b0:a7a:bad3:e5b9 with SMTP id a640c23a62f3a-a83928a9ea4mr984286166b.11.1724146827093;
        Tue, 20 Aug 2024 02:40:27 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a83838d023dsm733613366b.64.2024.08.20.02.40.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Aug 2024 02:40:26 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@rivosinc.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] cpuidle: riscv-sbi: Use scoped device node handling to fix missing of_node_put
Date: Tue, 20 Aug 2024 11:40:22 +0200
Message-ID: <20240820094023.61155-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240820_024029_090570_A9F2AB85 
X-CRM114-Status: GOOD (  14.06  )
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

Two return statements in sbi_cpuidle_dt_init_states() did not drop the
OF node reference count.  Solve the issue and simplify entire error
handling with scoped/cleanup.h.

Fixes: 6abf32f1d9c5 ("cpuidle: Add RISC-V SBI CPU idle driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

---

Changes in v2:
1. Re-write commit msg, because this is actually a fix.
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 21 +++++++--------------
 1 file changed, 7 insertions(+), 14 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index a6e123dfe394..5bb3401220d2 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -8,6 +8,7 @@
 
 #define pr_fmt(fmt) "cpuidle-riscv-sbi: " fmt
 
+#include <linux/cleanup.h>
 #include <linux/cpuhotplug.h>
 #include <linux/cpuidle.h>
 #include <linux/cpumask.h>
@@ -236,19 +237,16 @@ static int sbi_cpuidle_dt_init_states(struct device *dev,
 {
 	struct sbi_cpuidle_data *data = per_cpu_ptr(&sbi_cpuidle_data, cpu);
 	struct device_node *state_node;
-	struct device_node *cpu_node;
 	u32 *states;
 	int i, ret;
 
-	cpu_node = of_cpu_device_node_get(cpu);
+	struct device_node *cpu_node __free(device_node) = of_cpu_device_node_get(cpu);
 	if (!cpu_node)
 		return -ENODEV;
 
 	states = devm_kcalloc(dev, state_count, sizeof(*states), GFP_KERNEL);
-	if (!states) {
-		ret = -ENOMEM;
-		goto fail;
-	}
+	if (!states)
+		return -ENOMEM;
 
 	/* Parse SBI specific details from state DT nodes */
 	for (i = 1; i < state_count; i++) {
@@ -264,10 +262,8 @@ static int sbi_cpuidle_dt_init_states(struct device *dev,
 
 		pr_debug("sbi-state %#x index %d\n", states[i], i);
 	}
-	if (i != state_count) {
-		ret = -ENODEV;
-		goto fail;
-	}
+	if (i != state_count)
+		return -ENODEV;
 
 	/* Initialize optional data, used for the hierarchical topology. */
 	ret = sbi_dt_cpu_init_topology(drv, data, state_count, cpu);
@@ -277,10 +273,7 @@ static int sbi_cpuidle_dt_init_states(struct device *dev,
 	/* Store states in the per-cpu struct. */
 	data->states = states;
 
-fail:
-	of_node_put(cpu_node);
-
-	return ret;
+	return 0;
 }
 
 static void sbi_cpuidle_deinit_cpu(int cpu)
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
