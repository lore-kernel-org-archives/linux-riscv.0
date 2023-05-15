Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 672FDC77B7D
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=D0iy7nuV7T1yy18/6y+iy79GmhGnpwaS1Oa/R7VDfEc=; b=Z18+OCy91szX+c
	ATitrlRrg3CkMxLmA1/SWEdU3Id5fLa0s1+GZKIdL3immhElnywcnn49Nx13kfJh8aTjIuNBQCTzm
	zgDpGEBalYOdCGxs0FhxeQGnDvt1VpreLF71lBUPX+iMuiXPoEbVh2qCjgl9azB3hEAarbcWvxvEl
	XDyTDk0lFYI5RH7RrLYkg+i2h4LTZ/iIrgYZ3vDxV79e1wCKzGMVYj+XocyWujdQ8caGRQGvR6PMA
	RPt6QDQUrHr0L6rkYN/iDDDJo9MbuM3OiRIdhBEQIu+cL18ffaabZf+Ww7Ht/Ggp7y5YdCdMLU7/N
	N8iIxGGJkKZXqqzOiczg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR7W-0010Zw-1n;
	Mon, 15 May 2023 05:51:42 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR7U-0010YV-1H
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:51:41 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-51452556acdso8373818a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129900; x=1686721900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=B/2s07xO4JsvpjeFQXLK9epGxKSolGR137ahXL6Xqpu6cvJdjAuvwFfJTToBH27hFx
         iU1eFj0lfQMJxAK3JCa7YpUoLShxQppRs9krLSWJt0lywC6dWcEPg/rXvsy8hGJZBrZQ
         aAqH2ZDdzbSNReetY5GYcij66xNie7S3Ek1SV0mHfB2S6EjF5fy4DYd2rkos7AXiUp7r
         A7mM1MxwDNuHsULDMKmoeD2CS+aY1S1YK7CEPqzDEfCTjgx/DjSdsn3f6HZ1Og81975E
         71WOPu6Hm4MeLzAZvw6s1lAIaAMu94JwdS+HB8ZmbyvdOAqMnV3uLCalVpLAenNxNcVi
         9S1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129900; x=1686721900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yTcS6ERydBi3sd7UUw2QFTJaMwmeqvxl7dgO0DDj6Ys=;
        b=DNHxQP7Si+SSJJhennHCnip5+pSnVuYNepYz+z7ZjS8miQ2UOKPm2yWHvL7K0WTnh/
         Sh4yPY1CpfZ20NgGS/rm68XKGcYmBJmp4MV+RvAW4FhBWzGoHUfeSwoXYdu1ZyS/6fqm
         Vin/hDfy1IE+0Ahx5OIZV+5BAinpWv1KYXEAvlirxHHLdv6vlLSDmdKI86Wb9TSaDYXB
         MbRuTsvQYalEz7h5+wgOVbvZlmssrXadxeLfF1W9QUGbmnXO9cpjLNvL9ZGEqkUwmvSR
         lZjRkJcU6+xbcDF0Man+jZmcEW3q4l/ein+W3EX1gLJmPK/GWQIl6t7nUBTMx8+oG3HW
         APDQ==
X-Gm-Message-State: AC+VfDwhwDSKbK1ITDJ5dlReIrgcVeXgpm2Vlif2VJn6O4lGfVtx3sLb
	Rcy59OhI/AkCLwhoqdz0Gq6vIw==
X-Google-Smtp-Source: ACHHUZ5p6rTF1JyYq/6jX97XqVSLRtHjCcktupUgoSF3DN/rvwg29xnalX3XmhPORDR68lFdXczR3Q==
X-Received: by 2002:a17:902:e80c:b0:1ab:1dff:9540 with SMTP id u12-20020a170902e80c00b001ab1dff9540mr41677533plg.14.1684129899921;
        Sun, 14 May 2023 22:51:39 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:39 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 18/21] clocksource/timer-riscv: Add ACPI support
Date: Mon, 15 May 2023 11:19:25 +0530
Message-Id: <20230515054928.2079268-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225140_433785_BA9B313C 
X-CRM114-Status: UNSURE (   9.93  )
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
