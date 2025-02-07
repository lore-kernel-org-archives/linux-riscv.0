Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ECF0C02194
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:20:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mIdAU0E+euJH84/3NtpxDnoyQMDdo4H5ls1Ntiacg/c=; b=la9XY+tDfMLVGA
	Dj3h5955o5poUxsyyp00TEfaZuyujA8SYeuhV4djgvpYCXM229UXvzHpD+RAupSR2roVx4KKfM8sd
	yEa2t8yVfmvJfG7p0QNSgDEvZYB4kErnK7QEKH0N0fgdB7CQQYkDfKGatjPmkK6Q3HBMcSjxZaPD6
	PO+D0XboO4DuzZxq/cDYuk473xXB1Pjyx08eRCNCSAdobkrlmqNDlL7dcUeJMlWPAK4Pto22+3IOI
	NtOza40nERxZuLtEznHDk9pK3HnYZmYFHkHxiBq4jDP55rcwL3e6WrUNbq+zxWXLvM5cnBugVzHjf
	BwXTPCGwkVGqqIiTjk3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5c-0000000AFVq-3whP;
	Fri, 07 Feb 2025 16:20:24 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5a-0000000AFTo-2XQk
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:20:23 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-43690d4605dso15880485e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:20:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945221; x=1739550021; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EPC+Zc9/VMADj7AL3TU4wV27hjuGZt3xK3eoVREeXu0=;
        b=pkv3mse5K4u4m7JCOryHejONwE8co5P49T1k9Qypb5BPN+RHbJiuKSht4CYUAc+W2I
         XJm2bqaD9g00xFlfliS0hm01pN2RJxXEEh0PWu9ZISA8Rz9ZKNsqOdouRH3pU1M9X1oi
         Z2wDeW6+VK+thG2pE6JySgg/q/de1itLqpTN9Uubdj1HiSk9z9x6M7jGPNaVJDlGke+a
         j5ZH5vzN1NDaHQkUBLosUQ3P6MuXv+qylvHIxUIX5Rjpz0H9PP1+1IcBrOcTn6SV77qK
         EKQpdh46UwiGN0TdQ3s1BD3JOi1JCxmxjsaCpnXmRVKdzFN36PsRVjF9VLWDselYzGpE
         61Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945221; x=1739550021;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EPC+Zc9/VMADj7AL3TU4wV27hjuGZt3xK3eoVREeXu0=;
        b=YFVgvgFMGJJ2H9vyjyqrl3+TUH/2YzgMzqSghaIbk628+taaEhsVjsKZGM5i5OuaXW
         y/kq4H5W082NTQCXyRpQvqJ+zSHPb/9F2FhT8iFjgv0gZ6uOPwky+pT3dFf1+oHpkn1q
         x8ZON0C3LOzXCA8EBapnt3j3M/PkIeebA50bG8rhsCFb1HcfOkhxtsSenoTfl3aQJ37U
         P1OYN6jzq3BwARBOVAghdJrDU9DouKtyeHE85V2J2UEiqHLzlbKmL+xlnbsomuHdGOgz
         gwFNkkS3ne3xtGG3FoNabALXBmw4njPQEXeGzCn1gMAwd+OkjPFrfWzb0o8vtK4lZ8XZ
         F2Og==
X-Gm-Message-State: AOJu0YwPhnvL56VEpRDfqb0o8LyZGNvZN/mL/w1uUeWtx6OtpYuz3tst
	A50cDEf8V2A25SsZ78SQhI86TgUu2Ug6n4wlLmFtRXfnj74oIHqEpaOyhAqnf1LUzYJGnzYCKFH
	pO6o=
X-Gm-Gg: ASbGnctFljyk40JgSLwwuiziunZpzBuQKR2hZi/DiJsXqiCjoIpxnCXV+tn2eIeSXIX
	CFujJ2GIcnejl1Vm7CdzdyCjZl1BiIGjwJxLxv2Lt7qPyOW74dgGXdbk8K1bKi0CbFINuzIPl37
	ebJyvCZDkmDo3giGQrs+ADBRY8+GaUGiywbOzZHJvyIHxUmZhKHcoCfGS/Erig4jbkbLLjzTr5L
	ARsSSyw3cJ86lnh/HH8A9iuLQG65fz45KHVnWEMlvGYUxrn/MSr31Wc8ykCsN90NUZFun9x6GgB
	J338Zw7vZ23ZgiTE8nHeHwMRFGmqVToF7noxEYhTwp2tREvgmNYTzvySvw==
X-Google-Smtp-Source: AGHT+IGFd0vA7i2TE/EqWQzSneLkfz1wZqI3DHki2JEKLR0vkj9VuQIpV1+0LuH7EO7EbRwBTj9qwg==
X-Received: by 2002:a05:600c:3c9b:b0:436:5fc9:30ba with SMTP id 5b1f17b1804b1-439249c385cmr37153945e9.29.1738945221124;
        Fri, 07 Feb 2025 08:20:21 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43907f16ffasm77934055e9.1.2025.02.07.08.20.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:20 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 5/9] riscv: Fix set up of cpu hotplug callbacks
Date: Fri,  7 Feb 2025 17:19:45 +0100
Message-ID: <20250207161939.46139-16-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082022_646195_25685AE3 
X-CRM114-Status: GOOD (  12.48  )
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

CPU hotplug callbacks should be set up even if we detected all
current cpus emulate misaligned accesses, since we want to
ensure our expectations of all cpus emulating is maintained.

Fixes: 6e5ce7f2eae3 ("riscv: Decouple emulated unaligned accesses from access speed")
Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 27 +++++++++++-----------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 780f1c5f512a..c9d3237649bb 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -247,13 +247,6 @@ static void __init check_unaligned_access_speed_all_cpus(void)
 	/* Check core 0. */
 	smp_call_on_cpu(0, check_unaligned_access, bufs[0], true);
 
-	/*
-	 * Setup hotplug callbacks for any new CPUs that come online or go
-	 * offline.
-	 */
-	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
-				  riscv_online_cpu, riscv_offline_cpu);
-
 out:
 	for_each_cpu(cpu, cpu_online_mask) {
 		if (bufs[cpu])
@@ -383,13 +376,6 @@ static int __init vec_check_unaligned_access_speed_all_cpus(void *unused __alway
 {
 	schedule_on_each_cpu(check_vector_unaligned_access);
 
-	/*
-	 * Setup hotplug callbacks for any new CPUs that come online or go
-	 * offline.
-	 */
-	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
-				  riscv_online_cpu_vec, NULL);
-
 	return 0;
 }
 #else /* CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS */
@@ -415,6 +401,19 @@ static int __init check_unaligned_access_all_cpus(void)
 			    NULL, "vec_check_unaligned_access_speed_all_cpus");
 	}
 
+	/*
+	 * Setup hotplug callbacks for any new CPUs that come online or go
+	 * offline.
+	 */
+#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
+				  riscv_online_cpu, riscv_offline_cpu);
+#endif
+#ifdef CONFIG_RISCV_PROBE_VECTOR_UNALIGNED_ACCESS
+	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
+				  riscv_online_cpu_vec, NULL);
+#endif
+
 	return 0;
 }
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
