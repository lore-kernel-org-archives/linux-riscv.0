Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C41DC55174
	for <linux-riscv@archiver.kernel.org>; Sat,  8 Aug 2026 06:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hP+1jjhCBAQ/mx8OyTsKSwWM51d90aQMOqhrvDOcmUQ=; b=4VHqg7XHsobuZM
	2IhKUe2bxRYIDRBIWxD18N24dttyCFxzTcVyT1aOmG5obFOGH3T1FOO7FzpHxO7u/LsU3gdnlH1v5
	z9MqQShzOSTefI0lNg1X2LewcLj9qXZ7lju6x4cxzLWNh0IyXAfx5QK68Uk3wi4ss0Mbpm077LAS+
	Wdwfk2mCgDXmbWSdrVTmpkdndLz7IX4hjuplypZFkZDz3Pw4Ue7WGfvH87i9PmeJ74OILuPnReaps
	yPwrXKl6t69U9fi/X3BrOIwyyE4y66HkYAW1mvhSUBxvcBalmdxSQLUMgIJi6hXWJaN+qad14adPQ
	QAxMOi7C1tG/6OazeZ3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsaca-000000096Af-3Tsm;
	Sat, 08 Aug 2026 06:33:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsacY-000000096AK-06GE
	for linux-riscv@lists.infradead.org;
	Sat, 08 Aug 2026 06:33:27 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2cea3004256so3594605ad.0
        for <linux-riscv@lists.infradead.org>; Fri, 07 Aug 2026 23:33:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1786170805; x=1786775605; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=EVfLKOBoXlsoQX+adLzXxBoyONh9CYzhxwPG0dbz6v8=;
        b=bc95ZDu46bwzg9jDN/cMSXo87mytkzFhe/cXclSe+uyPkbGqju+oQKuYi09a67bhqP
         mUP7LgrySAr07snhXCw6rHMdUkcCG7veIIbwadJOeIaVOSuZUaYlqvEMkJdJ0aMAihiQ
         ZMgnZ66Y1QcfH85/VPpAEBHmZYxw8GRhA956J2bAseadwuVIV+dD1TnUVZLQoDxo76SX
         cCndNftq6OkskTRXRbuazoDsQjERHI6NZUucWqSQNc6U/UMqRh42f05rE3pKR/oMAvfe
         6wow5rWI8G1pLfIUYQSu2FBIrKIEtZ9aUfss7btELwCqrK+zAb38shbERGGL/ujMBRL9
         ws5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786170805; x=1786775605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=EVfLKOBoXlsoQX+adLzXxBoyONh9CYzhxwPG0dbz6v8=;
        b=bVBH7IcSCazsvgn3yPw5Q1Y63DYPKsPyQTSeu593DRqWkN9Jw7WlswnY7TiKsIQsl7
         uP8PRdXHbj2+Cc9JU78e7wca/aGBEh1QE+fKcOcWuXyfBMdnsQ0donHHiKQ7qjjgRmq6
         rHLg7G+YvZaVTmFb+9SIl+xioFDWVycwe73/Kb9rCFuGGeQB2UTFgza+fLUEJLxbQlf8
         X0U8osRaVe5QDHgcZXmSe98UnKJ6MAPnD/OWBDAtJw3IPt65bzFHOt/F7tuB9pXtyDsO
         29vma54E6LeU4LlICjVMTc25Jervh9zGSs3oFkXjtDS6Vv/FPk4ZvIoC9TR91v2TB9vP
         KkVA==
X-Forwarded-Encrypted: i=1; AHgh+Ro8Hnlat2GOBwIIcqR1nyg2EafhorNi7+crSmLS/v41NO+xfk6u/ljv5A30Q6+519lNEBgm6MNJwsCtEQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxQvgnvBRPMdItpjItcVMSnAAsjLj5psWZqqh6+aJm1AUFBctyE
	trA7Ljyp86izM6QrsdqEQs6i+da7kRVBEBwAnsIeGHkD+V9wIIAhp01owGqvr2T4ESM=
X-Gm-Gg: AR+sD11FzCoZlrMBA+qaBouPfOl7vw3wUN3HI+GnWkzNSJ53cd9Q3SEnXwDK/3hwGa7
	cXWghbxIlz5BB1rsj3+d7LDsli3+1CthxI37u+c0pa7/mAiROqyBjtCPy/+rWgdrH6e766HNzhh
	HVQJqji4+AmoVfLobVyY43R8he46o839mdKVI5K0T7CHUQ1Un2LHBh+In5S9B4wQg1Dj9byV3zb
	1GISQnXJ6PMfNl3jfMDxk56ef9fnCkdeDc4uWDRz2BMqBbvMDNi8cZaO/LjRPyVizJ2lkHzzBHF
	QvwjSMfhbXpzyPPImqkXyafhehOFgARfOzVhREnWuFvG9JOEnS9+18LF3sIe4I9ro0/rL+5XIx3
	r4z5wNrz3At4lfVz6O1+OWJm61wFYzg195mWt+2iTLvAzAYmJWaHmPQ94EE/GBAEpvAi09UJfJr
	u2fCKERhDg2cQ7TS1jfomTt5/JGR6LBVgfqYQ7aXgLP5oMO7HHR1Dyah1x4lfNOQHLmRb4/N/Ie
	n05e/a+lec=
X-Received: by 2002:a17:903:1746:b0:2cf:afe8:b722 with SMTP id d9443c01a7336-2d0ca761e0amr323978905ad.11.1786170804803;
        Fri, 07 Aug 2026 23:33:24 -0700 (PDT)
Received: from hsinchu01.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d16c4a35c0sm15983645ad.63.2026.08.07.23.33.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 23:33:24 -0700 (PDT)
From: Jimmy Ho <jimmy.ho@sifive.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	Hui Wang <hui.wang@canonical.com>,
	Ben Dooks <ben.dooks@codethink.co.uk>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jimmy Ho <jimmy.ho@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH] riscv: cpu_ops_sbi: retry checking if CPU is stopped
Date: Sat,  8 Aug 2026 14:32:41 +0800
Message-ID: <20260808063242.20178-1-jimmy.ho@sifive.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260807_233326_089331_B09231CF 
X-CRM114-Status: GOOD (  10.59  )
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

Introduce a retry loop with a timeout to wait for the HSM state
of the core being hotplugged down to properly transition to
HSM_STATE_STOPPED.

Suggested-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Jimmy Ho <jimmy.ho@sifive.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index ee6e4b5cc39e..41e577400591 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2020 Western Digital Corporation or its affiliates.
  */
 
+#include <linux/delay.h>
 #include <linux/init.h>
 #include <linux/mm.h>
 #include <linux/sched/task_stack.h>
@@ -87,8 +88,23 @@ static bool sbi_cpu_is_stopped(unsigned int cpuid)
 {
 	int rc;
 	unsigned long hartid = cpuid_to_hartid_map(cpuid);
-
-	rc = sbi_hsm_hart_get_status(hartid);
+	unsigned long start, end;
+
+	/*
+	 * The core that is being hotplugged down might still
+	 * be processing SBI ecall hotplug down.
+	 * So, try again a few times.
+	 */
+
+	start = jiffies;
+	end = start + msecs_to_jiffies(100);
+	do {
+		rc = sbi_hsm_hart_get_status(hartid);
+		if (rc == SBI_HSM_STATE_STOPPED)
+			break;
+
+		usleep_range(100, 1000);
+	} while (time_before(jiffies, end));
 
 	if (rc != SBI_HSM_STATE_STOPPED) {
 		pr_warn("HART%lu isn't stopped; status %d\n", hartid, rc);
-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
