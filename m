Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3FDC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 18:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b2tPIDpe2yZslqVJCe1on4Hpv90p/6jqVJMdysEy+qQ=; b=g2sSN2zrkmgECQ
	C3nuTtUk0hF6Bnmxb6ONWhqQqs57lOk9cP0fS/iwSaLRplgJXD0hS4mTUUbRnOTfpSchAdwL3iddM
	MviDVQ2l+DvJCJj8X8JNrFD9JOPJdpHzFxtIW3PDpZZbsAXRrjkiqgUG+QtWwgSlOamUdLnIQt0Ce
	yopUmr0QDF3ZpQctWkYisRMuQETxk2dpHky5TUwq2Q9IGbRHSXDkUo8QPMDpB3NUox9NfY+pahk+U
	ylhYDI0O/TUWIkXQoeJdxKP+X7DhTFY9TAbdC6o5ubO4zlqq7A0anZi+WJCDXNyUff7bairie1RXR
	Dkxxe0UYvtg/otW2GrCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitb-00BUGA-0Z; Thu, 16 Feb 2023 18:22:15 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSitY-00BUAo-OM
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 18:22:14 +0000
Received: by mail-pj1-x1032.google.com with SMTP id f16-20020a17090a9b1000b0023058bbd7b2so3021618pjp.0
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 10:22:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vv/SJn971dfjdTrZfssRImVac3G99NBb7ONmt1Vsq2I=;
        b=myJLNPbRJLi/wYDYC+up98t51CDSvleQNl+jgG0GytS3WhARAlv6QffJ1MZuDRuhyU
         8nx+Iqk3/0KdzmA3KZj7nwInkmfGs4j8tDN+L8Vu+X478ausemy9Wu5+S7F96/g0/aP4
         6SJcqu0eqxByONPkPg6XnsFYBAkhdoWdSfHoNJetFsAg24XKyXXc6ALuunxuhMjGApeS
         3RJQ1bIyZZJRcBM/v640JXSPpA8mjzq5s2a72ChX7W0uTYD2fOAIchRGYp/4yOEjIl5D
         tDnC5SXkZ9P0rYtWqNgSCJ5fpvmDvMwd9aOziTUVR0hXElPSBVuov+zz6/eecwNO7wHJ
         xDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vv/SJn971dfjdTrZfssRImVac3G99NBb7ONmt1Vsq2I=;
        b=AioxFJ1hf/IpNQSiZXeg4IZqD6KE4I2vW+b1lt38A8Je/SjIsQmV8HVMngHWXdtJH8
         zcsxoMYUVv1miaGPDOHu8Q+c3wecJaL0iNOCO2hsblqT13iBijKuyUaE+i6d8vj2kyC6
         1egJxuAzNgb7T1yScUn6m5MiLqIb5CnP4YEfxpBVVqMoeqMv7XCopMh9KTzDn5+ytlWq
         rFl3o3V983V12O0dKqxaXwsqRT5HvgCGsCaXXe+zvwPngDd86HDuHYu2vieG2thzirIy
         kn8wh+8vsMfpSBCeC7KDpSXm4MXSc+3H+rncG7r05RCyfT+et2DzagkcmM95W1KQUXE/
         fZhA==
X-Gm-Message-State: AO0yUKU8glhwEmQ2pQ4YkIsEgzPF8lg3bLZMrxbuzEr2mZgU3XET4758
	Lymne+9+4PyyxwY8Pd1fUoCx8g==
X-Google-Smtp-Source: AK7set+NBRmM54Hgp3O9CpS/Jfakh9iB+b7vBRwhQtSjUmCXjPcQd5RBQeVnlUJ0IOn5iswQgx12sA==
X-Received: by 2002:a05:6a21:338c:b0:bc:b1ec:89f3 with SMTP id yy12-20020a056a21338c00b000bcb1ec89f3mr7638758pzb.50.1676571729309;
        Thu, 16 Feb 2023 10:22:09 -0800 (PST)
Received: from kerodi.Dlink ([49.206.14.226])
        by smtp.gmail.com with ESMTPSA id n21-20020a637215000000b004dff15fc121sm1517574pgc.36.2023.02.16.10.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Feb 2023 10:22:08 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH V2 16/21] clocksource/timer-riscv: Add ACPI support
Date: Thu, 16 Feb 2023 23:50:38 +0530
Message-Id: <20230216182043.1946553-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
References: <20230216182043.1946553-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_102212_822190_576999AD 
X-CRM114-Status: UNSURE (   8.85  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Initialize the timer driver based on RHCT table on ACPI based
platforms.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/clocksource/timer-riscv.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 2ae8e300d303..5fb0eac52bdd 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -201,3 +202,13 @@ static int __init riscv_timer_init_dt(struct device_node *n)
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
