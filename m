Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A905BC282D0
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=A4SDhEzFReJxYBAatnlb+d6HWOuH1ybaHSxyWdRWTMM=; b=WM2wkiNzxO95zX
	qRG2QnB9vFCiNnNEmsuNiQNlKsEVdnBHL5hWt1GT5/zSYgNfmsU/9rvyUFfHDF1B1wM/J0vtnTVRb
	cr6Uelj5U+cK+mtCSgiODIe3zAzstyVfg3on6dprzvpkFo4MIhLFS09OvCJWuq3ufjvRGReNEa9B2
	qs7Qm4iASLHY//qbF+xHBqvMIZ1QjJYPCYUrat+EwR+WthrYESBMLUtdSN8L+ZQBswVph9n9zeluc
	9HCtDRjfRr4pv/85NPVO+aH2mwRG7PxlEN+GHWJno0BOHtdmN0tNWSi72DoI+3fREeVE+l+SoMJw3
	ynX7OXQfrv9UrqSix35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6l-00000004Zkl-22a7;
	Tue, 04 Mar 2025 12:10:47 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQwi-00000004V8p-3qjx
	for linux-riscv@lists.infradead.org;
	Tue, 04 Mar 2025 12:00:26 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4394a0c65fcso59251235e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Mar 2025 04:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1741089623; x=1741694423; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKhFFnzXyWbQAGhMWM6ZzS3r16qIjR6tEgWbgaYi/y8=;
        b=WjDW5w0V8Y2Yi1IEcXujdnvYK6tyYLx5HU1Mia7L23lr+udZvsHg3SujrmBUO8jmN4
         Nbt6c7aJ2TkWObqp8YEsBOAsUMEn93AXSJXVSsNPmtECPT+dXfEx6QjOipmHbSnCkY7i
         646FdyW8EnRWjrzBeyOTYUfKTXD9UMyCpTILuECZ9hnhXNUlXcCdhQWx0KlHly0dJ1c3
         v8R/yLvG8baDE/Mc1OUMzpVTcY8dAX7SEqpkfhtUhqEMNpo4Z/IGssDP4/ojI4xJkN13
         i1qmP7n7Aw9DNcPGBjm/3TuZq4+ffvdgimhx0lPf/QaiwzQ5ZTbkVIcq4qbojupk/JkJ
         vy7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089623; x=1741694423;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qKhFFnzXyWbQAGhMWM6ZzS3r16qIjR6tEgWbgaYi/y8=;
        b=c7dUVKzPugY4tGLfSBoqx7R9KonZ9EkX6aBubW/GzvckunQhlAQqwRK1TES5QfqqrX
         s1zMZsESCGAIQ+AExFXFIL7Ol5oHSTWS1wbENE3Ljs/NUeijQ5ZxL8AQYx+JdDzgJgFs
         xMUeXgXbuGgnkR6Jr4bEy1OquEj2XHD1S8jGxgYVa71GMFQ21A3V441PntyGtcKh4/hE
         WltfylEue2hFJkg66Gjtj2wchbKhuCxg9ruKY4fBjUxgFpimXXn6K6pQImcn0udiyFfH
         mmGYRIdzACnC9wS6410UzMssQK/07USARPkvQ4X4jqMYztVhDwyKX1dRltJD4ua/w81I
         q7fw==
X-Gm-Message-State: AOJu0YzaxkfDID2LPa/QPHyoHP6XREgIu0v5nSFfoHSg3P3GfCWeBBjV
	2s+NPgQFDz+ET5IayJ0o6dnbZBCGjnJb+wC/T6SVFRaA+wYHsnfrObLf3hPXKez1deHMMo9QybH
	G
X-Gm-Gg: ASbGncuFpg0+kpvNDybxHnMvH22JaQK/v2WtT/y9FwghcqhJ8zV+4sX66RCfIA/0kFE
	pVuZuXXNqcjewn4BxLgzZ8xI3qzU02YJdUQt71/64NMm7NP3WQBscuf+K7B9jib59oXnNZMVGan
	GyzZbG5WkmFqKiQ271jIv1yMRDC/mCv/hf4AM0yKcN6n9nPJpvRA3KMgwXcvCAm24SpfArxYJN8
	nZ8zSw4u9VKZENwQIIx8h9TkKeQ4Ud+eGsc6NkWRfyvhshgI+jeduf4+X1/ZmzLB48LqqIJeAic
	r0RXSoI2H/uIJ29Monm2oOQmntoUQnqr
X-Google-Smtp-Source: AGHT+IGwC3NsIIWUjYgv3G2JO2vmP8wTEbddF/LPoT4rEkNoTbLO+SirlMYHhSaFI3g4F2HReIh7PQ==
X-Received: by 2002:a05:600c:1d8e:b0:439:b565:f457 with SMTP id 5b1f17b1804b1-43ba675c3afmr162133765e9.27.1741089623258;
        Tue, 04 Mar 2025 04:00:23 -0800 (PST)
Received: from localhost ([2a02:8308:a00c:e200::688c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43aba5871f4sm230729625e9.39.2025.03.04.04.00.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Mar 2025 04:00:22 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	alex@ghiti.fr,
	Anup Patel <apatel@ventanamicro.com>,
	corbet@lwn.net,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH v3 6/8] riscv: Fix set up of vector cpu hotplug callback
Date: Tue,  4 Mar 2025 13:00:21 +0100
Message-ID: <20250304120014.143628-16-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304120014.143628-10-ajones@ventanamicro.com>
References: <20250304120014.143628-10-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_040024_955657_AEB2E294 
X-CRM114-Status: GOOD (  11.78  )
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

Whether or not we have RISCV_PROBE_VECTOR_UNALIGNED_ACCESS we need to
set up a cpu hotplug callback to check if we have vector at all,
since, when we don't have vector, we need to set
vector_misaligned_access to unsupported rather than leave it the
default of unknown.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 31 +++++++++++-----------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index c9d3237649bb..d9d4ca1fadc7 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -356,6 +356,20 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 	per_cpu(vector_misaligned_access, cpu) = speed;
 }
 
+/* Measure unaligned access speed on all CPUs present at boot in parallel. */
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+{
+	schedule_on_each_cpu(check_vector_unaligned_access);
+
+	return 0;
+}
+#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
+static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
+{
+	return 0;
+}
+#endif
+
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
 	if (!has_vector()) {
@@ -363,27 +377,16 @@ static int riscv_online_cpu_vec(unsigned int cpu)
 		return 0;
 	}
 
+#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
 
 	check_vector_unaligned_access_emulated(NULL);
 	check_vector_unaligned_access(NULL);
-	return 0;
-}
-
-/* Measure unaligned access speed on all CPUs present at boot in parallel. */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
-{
-	schedule_on_each_cpu(check_vector_unaligned_access);
+#endif
 
 	return 0;
 }
-#else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
-static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __always_unused)
-{
-	return 0;
-}
-#endif
 
 static int __init check_unaligned_access_all_cpus(void)
 {
@@ -409,10 +412,8 @@ static int __init check_unaligned_access_all_cpus(void)
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu, riscv_offline_cpu);
 #endif
-#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu_vec, NULL);
-#endif
 
 	return 0;
 }
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
