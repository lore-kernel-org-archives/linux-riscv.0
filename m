Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B227C678D4
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Mar 2023 13:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u4+2ncZ+4kyGITe+85PTJX7cDg6oUWCYIVenaFBqd8E=; b=0g1xyYGZTkmrzB
	1ypdR4Q33wd5DpFpfdjF6EFmXODJDtJQHuzwEIWkA3jIQVxTX02RPLTv7bD74jmyTtg9oeSe4/3gq
	ImjaSctDujxFN6XvbkH9VtfpIJF6TnlF23CYWfFtLyWJmKYYk67+5FN9dKZnSK8phy5E+BT9yqn+O
	ygMYJ/uloUx1LRhyg/IZns+ppbUn8itspk9Ce3GEKimmOkvnJoHxn52qyk/iXvHSnGidR0lvWTNTo
	Pncpm/Ub0c8ey0C9M13nWAhfBFNuQRZZ7gD6rjpwOZATxWZoF8uKidYH8+B4pHQuaQiTm5HyYRWtN
	Bq0Om1OZ4PxwEgvcYICA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bz-006TnP-Ic; Fri, 03 Mar 2023 13:38:15 +0000
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pY5bw-006TlB-Rw
	for linux-riscv@lists.infradead.org; Fri, 03 Mar 2023 13:38:14 +0000
Received: by mail-pj1-x102b.google.com with SMTP id me6-20020a17090b17c600b0023816b0c7ceso6165949pjb.2
        for <linux-riscv@lists.infradead.org>; Fri, 03 Mar 2023 05:38:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1677850692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dMb23HWhySGYdHuXuceG1Hdu0cCgMlhnof5Rv5oG2UE=;
        b=YaLquxhCPRvn9XYOirByRSWmifW1Bn1w1P/4+23IN1f/6lO49egVrOidPasa7r+JPF
         WDNTXFtu6MYTmoqMyF7YnSg7ucqRtv3EKeD+Ugsew+MmlsK/sVg7aPZEfcC7fLlBZCH9
         5k9eNzA9Ou6s9mb3gODhGum/QIUctlbY3rJtJz2yfiJCN6aVLuoU+SrNdOuWZ57pJx/2
         OJ3JIi1t9OhDZg8c4RghkZVsvZ3MfSGFEFKnU7m1zh7fjPkHn5OZ736VSBWTSyb3qYL5
         443k5gbPfEP521j4jODRVWWcX2m68/1WuaK3r2I2hWcdxtB0Sb6rYRhztyht9vmkA2sA
         xz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677850692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dMb23HWhySGYdHuXuceG1Hdu0cCgMlhnof5Rv5oG2UE=;
        b=tyfRkKVhbUolUop0rXke6gW2YmBfYLC4ZA3CwCfscZp1MzTlFcspzgTC2EtpJEAPbQ
         jIgzaqQGm8iR4tiLbL2pYYuRdNsXMDVHNa/OHszgsaAAEVWKsiiVVfIVe4smnH+NGoDP
         gXm1IzhosBH0wOytVbfMpPy0k5W/v/+x1/Z9Eu0W2iPiTd39/ersmt6fcZ0E9+TZXk9c
         WM8Be2B4YsrvdWnhdhrxLxowqQo9Issmx85rC3zmatsvZYKlkPB0aoAI+Qx9YRHPRgKD
         nf965NuFyDiLEoUmT/JFC7Bbw63jOy0YdklOAsoaBSWwBi+hiVk8hrgvo0QgMeL9rCDF
         hpNg==
X-Gm-Message-State: AO0yUKUMrdYLYtTTXR/EygJmhqWvbnhJ9l+HzoMjsDatavLQUmvC6t04
	kj6yNF+jmr98ftIW43dS0EF9xuIzSA12DJCY
X-Google-Smtp-Source: AK7set+tm8aOgYZk9xBaZnStYA78ITXnao6Ey/Ao6F5/PsR7mqEz365HsV945p8qDb1vjZKOvue9gw==
X-Received: by 2002:a17:902:ec8d:b0:19a:a9dd:ed3f with SMTP id x13-20020a170902ec8d00b0019aa9dded3fmr2238776plg.49.1677850692265;
        Fri, 03 Mar 2023 05:38:12 -0800 (PST)
Received: from localhost.localdomain ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id m9-20020a170902768900b0019ac5d3ee9dsm1533125pll.157.2023.03.03.05.38.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Mar 2023 05:38:12 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH V3 16/20] clocksource/timer-riscv: Add ACPI support
Date: Fri,  3 Mar 2023 19:06:43 +0530
Message-Id: <20230303133647.845095-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230303133647.845095-1-sunilvl@ventanamicro.com>
References: <20230303133647.845095-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230303_053812_972908_A0126777 
X-CRM114-Status: UNSURE (   8.91  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, Jonathan Corbet <corbet@lwn.net>, Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@rivosinc.com>, 'Conor Dooley ' <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>, Thomas Gleixner <tglx@linutronix.de>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index cecc4662293b..da3071b387eb 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -207,3 +208,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 }
 
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+
+#ifdef CONFIG_ACPI
+static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
+{
+	return riscv_timer_init_common();
+}
+
+TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
