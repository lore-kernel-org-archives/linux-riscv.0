Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C641E82CB3
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 17:00:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6HopQxd8Exj0hvIU3qX3KLIsE/pYyEFSwEHtJLD/ASs=; b=hda152efirsBl+
	bEc8/BCpsTyk9w1tCI6QaI8I1iAKAkimojvducjfifH6xTSsIqkNVHW2DbWvGXO7DnlJcBvqLlpja
	AJ1OUOuB/zid2Lk20SrvtKu410mrBPy1Q5Q/+qMWFRvuWKcHYsFW9ldUx0Y9gFqz3I4wdfqTutxV2
	Rj89ijW62t5tmmCDoxFNFO6onS4hltqh+vt/D4TE5WzeMz/hpyqoQHNs0ua7/FMo8k/xtNm2ESRnB
	EtY6PXmI4l0qtZpJ8J9dNRCuWXQp6qza5tfK1Lp+EYpzrjK0G9zJhRyOwGr2SD+p7Ikh7O9mPWPPF
	G40ZlWls4iEFMa7cEQaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXu4-001TGY-0O;
	Wed, 27 Sep 2023 17:00:48 +0000
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlXu1-001TFJ-2c
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 17:00:47 +0000
Received: by mail-oo1-xc29.google.com with SMTP id 006d021491bc7-57bca5b9b0aso3147624eaf.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 10:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695834043; x=1696438843; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pG1tzQTVssTuSgiTai6pnkMjirZbD31EyyHGMhy1at0=;
        b=AnbJCBadxEZlIK0o9YI3lIEruEGM9IMJboKBE6jVTfUCnx9J9rTXWI1vvAEoJPt7KO
         Yd/2cq9OY34MvdtEHwqf33CnXxy7WsSIjjkiuDt8IVYK6BaL3aI2W8j3CjHBHsquUMgt
         W3rmW71s52P/exoN2MLmFqpfioe5con7Lr1IsCgJE7DkKT1tcF7QLZNja3jggPyAZt/v
         1OquSd4mQlzUewlz98vC6nZFFP9RT706khPfnk7CtYG5dYEI9dGk0+8f5RxhWliw+uDD
         7ftjszzdMlA1l2QhpGp8ZbMwWW63c8u1t64fehGQMGVPezttAX17vmpzB4Dj/1tRbjRH
         aUFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695834043; x=1696438843;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pG1tzQTVssTuSgiTai6pnkMjirZbD31EyyHGMhy1at0=;
        b=bFguGxsPx3r6CPQ5oKpePR3cnmwiqFlOZGaRGMoKVvExHKBLkw2n9mUliDxIbokgqI
         r1JHvmxd9TkGm7+OT4zYa6OxHJ2N4Qsn8r8hWiDOXxvXOGz74xe+Ksl0cpjN++cnlFDV
         tmW6uENscmfLMZFAvGnt8ToQyhhXnAYJR5R7l+Cvubv8QC8D1/2PEYDToz4S89yHrHW6
         1aRHHcOE8XxfzG1IBWX6b6k0EjgK4komvMSd9B0H96DHAzTtgkqqwT/5+fs99LVSf4U/
         TzSboA/YliKQSYqGLQlF1IbxZzaKTf37FjxaAtLtwrfqASV499t17fnXO7dUKGXd42Qa
         Vulg==
X-Gm-Message-State: AOJu0YzCDc2r2HDLLE8nWU1KERamTCmcbF2CI8DW35i2VHRL2v1FNPq8
	00bx+ecPBxl/xKYh9uBpYUig76r+OU0SK4hbXy4=
X-Google-Smtp-Source: AGHT+IH2up4xMxljyN4RO8Rex07vnVaVsd5wurJeyXI53/ysue+JrRu8yCN5i5l+jkbhAsdY+6qfwg==
X-Received: by 2002:a05:6358:7e84:b0:135:47e8:76e2 with SMTP id o4-20020a0563587e8400b0013547e876e2mr2445601rwn.4.1695834043334;
        Wed, 27 Sep 2023 10:00:43 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.42])
        by smtp.gmail.com with ESMTPSA id u7-20020a637907000000b00584b293d157sm3279396pgc.80.2023.09.27.10.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Sep 2023 10:00:42 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: [PATCH v2 -next 4/4] clocksource/timer-riscv: ACPI: Add timer_cannot_wakeup_cpu
Date: Wed, 27 Sep 2023 22:30:15 +0530
Message-Id: <20230927170015.295232-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230927170015.295232-1-sunilvl@ventanamicro.com>
References: <20230927170015.295232-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_100045_846081_035208DB 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: Anup Patel <apatel@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alexghiti@rivosinc.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Conor Dooley <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Ard Biesheuvel <ardb@kernel.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The timer capability to wakeup the cpu irrespective of its idle state is
provided by the flag in RHCT. Update the timer code to set this flag.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 9c8f3e2decc2..06f5bad3c3e0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -225,6 +225,10 @@ TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
 #ifdef CONFIG_ACPI
 static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
 {
+	struct acpi_table_rhct *rhct = (struct acpi_table_rhct *)table;
+
+	riscv_timer_cannot_wake_cpu = rhct->flags & ACPI_RHCT_TIMER_CANNOT_WAKEUP_CPU;
+
 	return riscv_timer_init_common();
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
