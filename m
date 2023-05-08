Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 893A2C77B7F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 11:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0iy7nuV7T1yy18/6y+iy79GmhGnpwaS1Oa/R7VDfEc=; b=DiQaa2uyjOzaqO
	nLlQ6RqRs3zAmSUTmorn67pePsSK/o8UfF3XhK0vTtLAVNEBYB5dLpv3i73b7/jNq0YH9qVpjRo8r
	W7HaCzJmvEKQ9TXlWX6AOH/FH0D/tcVDzbHQEclJ71rgn+EsgnxvlgKRCq7iBH3Tf1EAn7nuOONiZ
	tTW9KvT3dTFj5KdIrsHovr8+oSTRC2QV68dZrnjcZ+HXKzgHJbzSePoVNp7DAe9aBvPjQ38DPLYDQ
	Le2NEqUCAxN8qQW2/Wjm7dm5s5XActqx3nlATF1iWpi/0yIh+PHer+l3gvUEA7lCeOCUB/UctOxQf
	spuyglVFxC20goHSidcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzSa-000Sf4-0l;
	Mon, 08 May 2023 11:55:20 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzSY-000Scl-0S
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:55:19 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-52c6504974dso4028749a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:55:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546915; x=1686138915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=fw9w2wVvyg18HQUViAb/q8qFm0YGCFl6OA5t0nEkt/x4efJjZz1AlZazIVHATLSW+w
         heUG1plkNWqhle47JUQzWHWSG+vGxo82ayY9ANGhfWkzbQO8Dr6YUiheG3svkLfmg+NN
         2GZx2gFnSEjoQGMVoLG9jHAqVyTSd707Zvc6pVK2NLdcrbmEHn3Glt7k/emJkDKaKSq2
         MIRlCk1P2l9380YHjRqRfnRuqH8OWIWYheVO0szdRaxlAliT5X3EoD3CDOtTxHsFXQ1y
         F8OptUnVg8xt4KdB2scf8uJ5YrNv+5MozGjfHscY0OiyRNm/5t2/AQGAJfIYOrKzz/J2
         rCFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546915; x=1686138915;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=YRQLJMODUfyV79+hj2hv7caqjvHUL8JeKFlT68yC4bYTvdq8JmCBf6gYupa92RyAtJ
         fsd3r1PKKfIwmuIP4ezM5I6eYJFNFxGL9feMLWyL7tK/DsnzIDvUk06q2wUscFPZ5fPu
         6YQPDq3zZ1IZ5cu/9ksJODEfO1ovN9Jy2gLy2347AP054nVrw3SE0FEEo4a5ppEJm8tT
         IPEl1qTI44Si4xZDSsFwXKqMCJSMQfK/tKV/MJQ7LbjrQ91uN10644+6626LioLBAa5p
         l7zLHtA3FiyJGcaZRwUsI3qxdLVgOWLjth14Oq0EM2hJtUuvXoV6geMNOTwe/WynukEl
         QJ4A==
X-Gm-Message-State: AC+VfDx/nEZh2OyZF3tfi3z1Ar24j/Vzol0zr4CCbJjSOb2peUgGPu19
	5AzlcA/gDQQvx4xq9Hp3rImZXA==
X-Google-Smtp-Source: ACHHUZ5LX88i99DmSCUmXSBK7hbOW5754EnsnTa/mud3XPBdrIA3mmjSCvDHn3cMXRSoaPysS72Dog==
X-Received: by 2002:a17:902:868f:b0:1a6:b971:faf8 with SMTP id g15-20020a170902868f00b001a6b971faf8mr9907040plo.53.1683546915118;
        Mon, 08 May 2023 04:55:15 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:55:14 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 17/21] clocksource/timer-riscv: Add ACPI support
Date: Mon,  8 May 2023 17:22:33 +0530
Message-Id: <20230508115237.216337-18-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045518_179902_5D59E4AD 
X-CRM114-Status: GOOD (  10.02  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Tom Rix <trix@redhat.com>, Conor Dooley <conor.dooley@microchip.com>, Weili Qian <qianweili@huawei.com>, Herbert Xu <herbert@gondor.apana.org.au>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Mark Gross <markgross@kernel.org>, Hans de Goede <hdegoede@redhat.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, Zhou Wang <wangzhou1@hisilicon.com>, Palmer Dabbelt <palmer@dabbelt.com>, Len Brown <lenb@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, "David S . Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Currently, ACPI doesn't support a flag to indicate that the
timer interrupt can wake up the cpu irrespective of its
power state. It will be added in future update.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
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
