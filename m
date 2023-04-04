Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CDABC77B75
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 18:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gi33cS/GUTnsAQkdR3cPOj1P4gRMZN5jnKvg0O9Uff8=; b=li/74X2DYGACf4
	R1IX2rqXF09/UjC+7P49Wx0AmtHPDj1TxHzARqDQ9Q+LIoFVF6p7/UJG60MDl9VCvdOTvQHKBwV6y
	DsEdDx/huLisWsfcIhiGGWK5nwBXhN0UgjSS7Xl7CJmuCdgEfR26PR5ft7atiRnVg2ZTONdnLQf7R
	Ay/Bz1Jf1bgTtlk0najO32z4ZOi2m4U1mRDMfAfQWdqsOvCd6oC6zlo7/lhYrVixW2Xd3kGMT5/Ki
	5c/uAtFovnIq9nSYxfkSnkh2+eJeTPTNChKLnz5JBl0aUoSWvxzQcxug4GeOH5C48yFixyR1TQtra
	PuqNWUi6+6DlJHAx6sLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJ6-002Ua8-10;
	Tue, 04 Apr 2023 18:23:00 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjlJ3-002UXd-1U
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 18:22:58 +0000
Received: by mail-pg1-x530.google.com with SMTP id x37so20213649pga.1
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 11:22:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680632574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yRIRI8aArNgE1fextAvbnFu2fBTu5X0gP4d56RcrLtU=;
        b=kR+s/3CyZbFI3Sunvs1k3V1ES1X4ydgZ00TjDVbTDpPayRRqJtNYWC1pnZKPyJ1E4m
         uVVFYGIBA545X9dY08nwaA59HRbUjd9EYHx2Cy1PiWpDV6St/RbMsaxMzv2ebXETqB3T
         IWyqlqUMUTxX/L/1EVEePoaOEv+J+wDut/+8wE/WfaBlVWjmx+jUJwp27J7GJSoKBFYi
         Gs/bQbROeeHt3oLkMAredzEYiNhvbVD4063BbvtSGO8KYmfh9mHElnJ91hKauVeqAuJu
         SvE1YFOFHhbkcFvYrBZqMJlKsUQmNhxYUfL6WtnalKsTb9fumEdV3JkpckGcefrlOkdm
         vcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680632574;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yRIRI8aArNgE1fextAvbnFu2fBTu5X0gP4d56RcrLtU=;
        b=4VtQLT6pSUbOy2XV4UenbBINsamTxaA/x2Fq+rkd9ylOUYw98l9hXSL76hbQSpy5pr
         xF8MY4NIxVvKIg2NZk9nK3JrGEamLSh4vgvjeKihaiTO8SsUenD8+v/dBIVpCjoLG/z1
         xtTDdbXl5JLVa3rbMPlTAIZyC1LqmuZXT9xfCy3r05KpWWbqYIFhgDtZp8YKdcf1/br6
         OQBA3ZvWCLE/jSETMyWXU64eHpoQGiZ5N2Am9H6cZUovY9H2nnpVbhiClcIC0qrIqdsg
         miLX11QgHjCW2W2dH7ZrNZhlS25P4O522P6wG575zLDcSqkBSUl3USzoodBYpuJe4daO
         ytOA==
X-Gm-Message-State: AAQBX9c71qitue8WB1VBbaBAXTvYX4sQqVP1gBpsmzXyhux7oKPbPi7B
	ve2reSy4r/Et9oroRtwy9S/teg==
X-Google-Smtp-Source: AKy350aOUvAN2KHzeJF/ni0AnJO33fN/5T0IIRIoH72+vO1/f1p829qUNWYOqG/SA1NQMJdYIdUYjA==
X-Received: by 2002:aa7:9568:0:b0:628:4c9:a07 with SMTP id x8-20020aa79568000000b0062804c90a07mr3040510pfq.29.1680632574272;
        Tue, 04 Apr 2023 11:22:54 -0700 (PDT)
Received: from localhost.localdomain ([106.51.184.50])
        by smtp.gmail.com with ESMTPSA id o12-20020a056a001bcc00b0062dcf5c01f9sm9018524pfw.36.2023.04.04.11.22.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 11:22:53 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH V4 18/23] RISC-V: time.c: Add ACPI support for time_init()
Date: Tue,  4 Apr 2023 23:50:32 +0530
Message-Id: <20230404182037.863533-19-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404182037.863533-1-sunilvl@ventanamicro.com>
References: <20230404182037.863533-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_112257_498452_FB622674 
X-CRM114-Status: GOOD (  13.10  )
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
