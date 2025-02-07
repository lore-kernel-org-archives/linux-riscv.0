Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D70C02199
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Feb 2025 16:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ovMIzkaD6cJNqKqklnpSy7zrs7WX4r5/LLBmqRubgSc=; b=Pev+sVWu7A9pl8
	DXDO6lGuMucaNq5JVLBP9ti131Ca+RlSzTipCj74hY2DA8kO04lHPFNpCTUPkCW0mT9XyOIWmXlCa
	uSbYfpDPlAioUZ1TXqVnqBxLTtuixKhKVVzzQkKREku22wSlCOA/5hKWLBYjhV2UdEslM04HLeQim
	w/WED06QcdYpfw/GmgZPZZwGvDqY7dhMY7pG27HZWu9z3FuObluS92zv2dIlBzdmPLLbLC8VLSCOZ
	NCDopI2o2ci3RXQhdwY5RK8R/9i+YJ03pYebBHD85MuMaMHn0xVEqjUnvklFQA/KaKvWPnkZ5F2aj
	jYRzHpwOKQqdaJVVoTRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5o-0000000AFcj-2XWN;
	Fri, 07 Feb 2025 16:20:36 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgR5l-0000000AFaV-40Zm
	for linux-riscv@lists.infradead.org;
	Fri, 07 Feb 2025 16:20:35 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38dc33931d3so878893f8f.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Feb 2025 08:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945232; x=1739550032; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Po82zolBmxhVPQkc00G0dtG6NMWIt9O8oQKIvW2rpQo=;
        b=YCZIotZT7GjnQCBzcaEobEop63WE30+B4F7TiiP3SLFnRjyP2Lk77Vr3MsKO+e6AwL
         XBGe2ews8XLndOedQhIjRHtYdBtL5rEZBAVQUxelNVI3FBn+szR8whlkzzZRDoSzAYcc
         fhGve2hoJJa3ENxYDzls3uk+McIbXcqEyKqnYebuEn8heP7OP9zFkFFqL05A40wkETjY
         60DxeDOny4szeWdcrdBGRsoOIOVC+HwjKLvm54UAFMdBriK72bQIfqQVR6dkEKaLDD9Q
         tVbf11QyyFFUvd7RY5Iz++iKRQB7i91JWYMXlOMx+zFxlzsfUay6eDxmqyz5e3hnX6E9
         rwAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945232; x=1739550032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Po82zolBmxhVPQkc00G0dtG6NMWIt9O8oQKIvW2rpQo=;
        b=owmp2g+1eQpbRaA9UXiI30KTrULJnAxVRBNPnhZ69v2RsUIvjnA/6may8S27Gn2e63
         TRa5m3frwxsrVeTzvRhc0YQ2Z9Q1DT1CC8G6SjEtp7erLB3E7al7kBwillrw8n9wle8y
         RiIC/sxT59BwUtjySu0XWuBZKsGMv926FGvMIYgD38uqWScYrRRmo9wJ61st1f3anEJ1
         IBBBXipI07up09BU9KPOMM8Sn3yfr/Y3QSRM/XE+EfEr8LI1Hsn4y5GGa44KwXi+2aJx
         poXTRcPtE/iTVoMi9IUvusJQHd5AuCda7+EY9+lVFlXfI/4tIjlEtbuVnjc4BRqSb6K2
         B8zA==
X-Gm-Message-State: AOJu0YzkkeEZZCyHdU0kVwUG1NZKXvEGdQyj2a9jMOefw3vVNatIsojv
	z3aMvKSdanJVQ0XbC7L5CvpWLv8MHq8cuQfMIn0FvJ6GcXWcGsh3q8cGsT+8rdxAnSUaOpP9R0A
	c30g=
X-Gm-Gg: ASbGncsRbw1TYgxI3xyt7l15Sn6l+5DNbomJMVtKz/kkMTyB1SUEfzR1+YQ5h3pjTmD
	ebkUP8Wg2ZbkM1GjmunecU4o88lZdI50MFlqcb9YXmqUinHAJgoSLd1eSYn+BWDd9xzAe9jKzwD
	EA9KJQLtobcx4w5lgJCRutNGyRolFMj5l5zk+W5MMwuVQ5krJ71PS9zxh+RCHtb4hM77lZqm+LA
	eOcVGJciyTkd/fvmi0nxS3o+zyniXFq6OIjSNijAqHYYvjPFaB0YW+ju00wUBaMUV2gaYwCmMZt
	WlUvC9udglTEgoKjXzL/6x8H39Jvf5G0PqFHa8YLOSrztcs3BYxU2rHvQw==
X-Google-Smtp-Source: AGHT+IFYzRkLD2/iNXs8ekCwva+Q7XAjeoRJSdBX1SHt2e7DvSU1eBo/Pp0WwXjQHrpcwp7IId0zvg==
X-Received: by 2002:a5d:598d:0:b0:38d:ac2d:6dbc with SMTP id ffacd0b85a97d-38dc8dc1ab0mr2372712f8f.17.1738945232146;
        Fri, 07 Feb 2025 08:20:32 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db10b2fsm94032895e9.33.2025.02.07.08.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:20:31 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 6/9] riscv: Fix set up of vector cpu hotplug callback
Date: Fri,  7 Feb 2025 17:19:46 +0100
Message-ID: <20250207161939.46139-17-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_082033_996737_813B4CE0 
X-CRM114-Status: GOOD (  11.08  )
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
