Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CCCC531DC
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 15:10:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5TAQM0hW2bNBkD2lgk22e75OdHulXzNEOe5pXvipUww=; b=dEkole2398fw0b
	5uovGvUSPP9U9O1jAoIaFyMMFcLNpLJkFes5XgxFHIAfRdRiqhAFwGEJJtd18r4lM3BPF4wFs0wIV
	mPtnko8iq+m40JAn13JAX9M3GdUOfj/7pIWGzVk18/HINLnVTq/Q3jQA/rhKQZ4bSB5k94IHg5sE3
	75ZKPaHPbS4HK4tbq3diblGrgT/K81X0Nq8tXAmI4sDND8nR2cd1/zPa3UtpSFqHPxn/VW/Snwcq7
	fdCrgaEVRD1VwsVubhyxny+A7ng93KX5QSY81/hKfF/w+FZIQOwacq4EgrnaPZiH/tFWIV6DCMyC4
	agTnnInGHA5nm9mquAAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyb8-0000000DKND-2PVm;
	Fri, 16 Aug 2024 15:10:38 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyaA-0000000DK5s-3dmT
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 15:09:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-428243f928cso15258495e9.3
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 08:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723820977; x=1724425777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ycsrSNVghYJYo7Kq/sAqp6MnjeFyaL9nJFuFS/dh9Nk=;
        b=xyvCllSfHZolJ6UK7A0KEJHusyFJaiyglwNdTbFk1xr6z80ASDmPs4GC5Z//AQnfta
         PYEw/qwjPXC5oA9OgtlifHQZGFC+iOpwVUqKWm61TdtXpb7p49ko4EIxbQof16npGE7b
         mcKOG42OVnHbYv/R8GDorfMvbSHhjpliimkGd3NWImhvOaSrV/0xPUxbOatfdpmAAbCK
         mlOc3khO0B/SILf0fmr1SyXZPIi4Y0FTaB86XG0onH525Mbs1aUAKWwX29JXEoUPBmy+
         9TgLjneT25fhcb6b/VNYnlliBELTgAO/SLCMLKawKU+XZgeAlgKhQW3qoORopRaczcLv
         xdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723820977; x=1724425777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ycsrSNVghYJYo7Kq/sAqp6MnjeFyaL9nJFuFS/dh9Nk=;
        b=jMnNPZJpgpmKh0Ez1YOgVyZ/TEhY+D9BK5rCmKrbwPJf5I3KeSAM669Je8vHrYawWW
         cvfq+IuFExZpCGTToYNJcmgRCAFjRhmz1YDGjrypxmGHSDOJDEKQZ31qrTYh2L5k20UB
         KcSj4xP41MrNEy35ybG2Uvb/DX9emA0AEAhnIBFfZXxyVPfcfsvpdlwba4TZ7wD0tI5y
         RNSQixMk2OY1YTSpAF8kaO7mzFu/AE0blPyz7ABGwT0+hT4KzaF7EYtHm+3oIdVvebe7
         OZYWBnFKeA6P/wGYfUfjskAiWg07LPgmqs5MUv4a1Sf3BJsPvA8oJTHf8tTLq2orBgSb
         eZTw==
X-Forwarded-Encrypted: i=1; AJvYcCXLsTt/qmfU+PtinjNqJWaG4bXl1WjlLg2r/JYvDW+B2tleDG5ezxW+OTQ/YA0Lf0uziknprULZEVlu3VscdMeUvOCOiT7YFJ5GnJucQU9l
X-Gm-Message-State: AOJu0YwfLBpHt+PXDLcb7McKD8atH5/LlSExLNCgnwk/v1WcSJcMSbrG
	gN+qcFxw7t/XsAztl19/nM4JpUF90GKVS9d1X3zpXGxAVDz63K2u6sss9E4i6Z8=
X-Google-Smtp-Source: AGHT+IFDGX+GfHixPCgcFALGkNattnCz9fLq1GjkO92ZX/36nvryecE+9MvCeLg53L+RFEWex0FMuw==
X-Received: by 2002:a5d:5442:0:b0:371:8c79:73c1 with SMTP id ffacd0b85a97d-37194317aa2mr2276336f8f.2.1723820976767;
        Fri, 16 Aug 2024 08:09:36 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718984993fsm3808758f8f.31.2024.08.16.08.09.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:09:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 2/4] cpuidle: riscv-sbi: Use scoped device node handling to simplify error paths
Date: Fri, 16 Aug 2024 17:09:29 +0200
Message-ID: <20240816150931.142208-2-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
References: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_080938_942694_3A386DDB 
X-CRM114-Status: GOOD (  14.33  )
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

Obtain the device node reference with scoped/cleanup.h to reduce error
handling and make the code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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
