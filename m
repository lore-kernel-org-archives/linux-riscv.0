Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5481BC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 13:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gi33cS/GUTnsAQkdR3cPOj1P4gRMZN5jnKvg0O9Uff8=; b=bDgHUDDtQgN22p
	mCXHP4ag7ONGr+4UPX8aXVYYsHpX1ljiCBe2IwV9lbxJ0vCnfiWUbm188BFVY67KO63+vFDppjIeu
	HfZi/ly7VRpb7XTGV4T/D5yB7uqcb7b/5nGL3iigVIWdiNLU5ttppnKAXUWpbYSmVI3PYd8Q5oK8C
	/bQjyn6/SXX/lTBtCrfamaGmpMPq0sGraIn66kAzu8RyqaPDrpeVeFnYcROSZFjLBa63rpUl9KW1y
	2TjzcRIPslJ2xFZwehX7wwSv2B+jTALT6nauUldTUhQ/P5/zzuQ9rbC/eQHXhbi4FfgWQXzuKy5nj
	k9l7GrVy7TmKgLmH/fqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw0Tq-000ZrH-0D;
	Mon, 08 May 2023 13:00:42 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pvzSg-000Sh4-0B
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 11:55:27 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-64115eef620so33804635b3a.1
        for <linux-riscv@lists.infradead.org>; Mon, 08 May 2023 04:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546924; x=1686138924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRIRI8aArNgE1fextAvbnFu2fBTu5X0gP4d56RcrLtU=;
        b=dPMbOuJszGZR9AahCXbvkNUwii+U9QMTSbyX/g4rgl2Q6FpYBFAPcbDw395JVWTi3S
         E6urCy+MpwA2mwwR1jCyAvffT1l31W8/LPIcJGeeFTD5aLYHDEquT54qiJ2PiGwewAK/
         7/al2D5PTVEakeiZsNEdWqALf2XkQL0K7k9aFb+4iJxePbBgZXZVkfp8vW4aBTIcs+SD
         +bz/l9nW3Yjj7WFv+zwFHYEfdt26tbRHLOQXJbw4w/Xh1zaR7Z1ODfJ0Z4leFb0BXw7C
         UqtjGgxhDIEAThPM+W99EdZymdIczjmy/IDVSEpiG7tDS91x79zJImn26Sq77ax+bOHo
         zOIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546924; x=1686138924;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRIRI8aArNgE1fextAvbnFu2fBTu5X0gP4d56RcrLtU=;
        b=d6Yu95LQm/h8mSMS7lBfxkXR0gaJTdE0HZdwNAlYRaxHBtdivbbAwPKvijEotCOMkp
         gODH37YYD1ZUfNx0fm/15GblDzCknbh/+6gZIBo7GwTAHjDL+uuA5OZmn3nxzH3cIqLx
         gLKAbCev9LdXHmVbz/8gJQ0JvMjXyoZ/Hbwkf/GB6icdzlDLdkDflADHBavEamwXnMmL
         geh6WA2ONBTuYdJBexiyiGG3ltIbYgP5LDMsgTx31XesjuvHs7xOYGchxbn4KBIU5gdh
         XLYveDhR1nv9XM5bar5Rm4p/rUzKoq2AUWoJyQ3E8GmSJsAztv+v8RJ7oJdnGeEnZ68z
         c3zA==
X-Gm-Message-State: AC+VfDwf0Zi3ifdlzea3hloMjJhJ2ALP8gqOQ9k1cDYHqNFoC6zlbL1a
	rxIXpcO0RUY1Uh/j84nrhhLRAA==
X-Google-Smtp-Source: ACHHUZ6789eMhEedD+DjgP1qLrd+M1OvHlv3gMG5XLhQSR4jt23EMajfCnuU+TlGtnZrH0ieEuaCGA==
X-Received: by 2002:a17:902:e550:b0:1a6:e564:6044 with SMTP id n16-20020a170902e55000b001a6e5646044mr12627890plf.7.1683546924015;
        Mon, 08 May 2023 04:55:24 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:55:23 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V5 18/21] RISC-V: time.c: Add ACPI support for time_init()
Date: Mon,  8 May 2023 17:22:34 +0530
Message-Id: <20230508115237.216337-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_045526_098318_A3DCB37D 
X-CRM114-Status: GOOD (  12.93  )
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
