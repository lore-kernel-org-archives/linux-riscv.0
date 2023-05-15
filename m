Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25551C7EE24
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 05:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gi33cS/GUTnsAQkdR3cPOj1P4gRMZN5jnKvg0O9Uff8=; b=II1Oy0OGo50xZS
	HBSaIBYTp7tIFjcmUZJWpbs+ea9Nz0tCFEg6OOjcy21iNbC6+q76Zf8khLSckw6Eh+QyNwgIeqT6N
	cv+wyJaD3UXpKMnN3A1jq4y30yfSPg4cBgls3MEJJwQtcJeKZvzcK71CzPpKDBj2DaNPqoZIYGntw
	kkAqQBdEJ7+bo/ekRSS+hfuMJ9fjmVNWwcRdJJIQh+9cQ397OHRmQVPM66MPDaNlkmEiWKI6us1CG
	9VGbOQRdVvMoIfUIOfBl0DGPthgbbaoLuZmfXo3X5hq/X7IE8aK8viFg9aad/a0mMdyQjW6VUJ8vu
	WUBHSd/AtXXVPOi0pngQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR7d-0010eQ-13;
	Mon, 15 May 2023 05:51:49 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyR7b-0010cy-0o
	for linux-riscv@lists.infradead.org;
	Mon, 15 May 2023 05:51:48 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1aaf70676b6so87364555ad.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 May 2023 22:51:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129906; x=1686721906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRIRI8aArNgE1fextAvbnFu2fBTu5X0gP4d56RcrLtU=;
        b=Hx5ddCRRvEEfr/OzJAxNT5ydbiN7snxQeu3XLT1jypIPQcs5J9Sb3YKqtPl6et5F5m
         nQUl80xUgMR/+VIyy6hHjCrIJuwzq7xy94EDqKvLupgZy41/JoMKdWnGUcKu7jL2/Hfi
         136BtqgjfIX4ACnYwPRKpYdGEZc8O8u9OlU3HKpQVlYPHSrj/FXlF+ZBVHEYvgBj4aQj
         zpxMNjtkaG44t+tJwCanDbUnwuFo1mbL0WsUYHHke/VD0tCawblq4g0sZDz502y/AasP
         XSDZPt+rk+2NNonnkUbxz6/3+9kFfu7qT1YhSkS4PI1PS4prkw38aF3W6eOtLS96iNTw
         7zbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129906; x=1686721906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRIRI8aArNgE1fextAvbnFu2fBTu5X0gP4d56RcrLtU=;
        b=ATASQsqiASXhMStqSvPK4eXXMJ/rQRrL5bmKxXJ1T9E5fSRh5b/RNOsJW4QBHXGiDb
         AqJv5GW/VjmHVcNAGczNqy32eNRnh9Ko20jj5TD127M8hDGPNp4484PPmsetmM3jmpos
         fUpERgCIU84z6FQ7IB95RcBGUcPrf4wzs8A3tVyOo0wL6qCDXTChVgqVvnlWTn3s7bp2
         niTpawMnqQGQPJ9Xc69J/6mBJ5GKFrw6Ltwtt1gpyU/nf/zQbLq/xdN/MtIKUE2T9gle
         gDaRK+lnNpIQlGAmJPwPr8Yxwo3qPSumZg9OCj46YV4TM09g+FuKGTMHG+/vaGO8pKKP
         bqvQ==
X-Gm-Message-State: AC+VfDznA5l6MTycTD3ZEKUlA9IsN5yWizcNgidBjmf+/I3OshOrHxMi
	ExTYITQkPR1x/We6t459cik4NA==
X-Google-Smtp-Source: ACHHUZ7MyqMNWbnzlW+Qm5Vs15EikGz5Gk7dGMK9zmxWk7Q0Vfy73hx3hlnowhqMEf+HVQzX9PIUCw==
X-Received: by 2002:a17:902:e751:b0:1ab:1eca:f6b6 with SMTP id p17-20020a170902e75100b001ab1ecaf6b6mr45146037plf.13.1684129906775;
        Sun, 14 May 2023 22:51:46 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:51:46 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V6 19/21] RISC-V: time.c: Add ACPI support for time_init()
Date: Mon, 15 May 2023 11:19:26 +0530
Message-Id: <20230515054928.2079268-20-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_225147_286509_1F8B604B 
X-CRM114-Status: GOOD (  12.86  )
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

On ACPI based platforms, timer related information is
available in RHCT. Add ACPI based probe support to the
timer initialization.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/time.c | 25 +++++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index babaf3b48ba8..23641e82a9df 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -4,6 +4,7 @@
  * Copyright (C) 2017 SiFive
  */
 
+#include <linux/acpi.h>
 #include <linux/of_clk.h>
 #include <linux/clockchips.h>
 #include <linux/clocksource.h>
@@ -18,17 +19,29 @@ EXPORT_SYMBOL_GPL(riscv_timebase);
 void __init time_init(void)
 {
 	struct device_node *cpu;
+	struct acpi_table_rhct *rhct;
+	acpi_status status;
 	u32 prop;
 
-	cpu = of_find_node_by_path("/cpus");
-	if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
-		panic(KERN_WARNING "RISC-V system with no 'timebase-frequency' in DTS\n");
-	of_node_put(cpu);
-	riscv_timebase = prop;
+	if (acpi_disabled) {
+		cpu = of_find_node_by_path("/cpus");
+		if (!cpu || of_property_read_u32(cpu, "timebase-frequency", &prop))
+			panic("RISC-V system with no 'timebase-frequency' in DTS\n");
+
+		of_node_put(cpu);
+		riscv_timebase = prop;
+		of_clk_init(NULL);
+	} else {
+		status = acpi_get_table(ACPI_SIG_RHCT, 0, (struct acpi_table_header **)&rhct);
+		if (ACPI_FAILURE(status))
+			panic("RISC-V ACPI system with no RHCT table\n");
+
+		riscv_timebase = rhct->time_base_freq;
+		acpi_put_table((struct acpi_table_header *)rhct);
+	}
 
 	lpj_fine = riscv_timebase / HZ;
 
-	of_clk_init(NULL);
 	timer_probe();
 
 	tick_setup_hrtimer_broadcast();
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
