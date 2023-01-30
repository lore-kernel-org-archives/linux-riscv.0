Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C79BC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 18:26:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sc7mzUVizArlY8ni0gUNhyDz+oEqP0Ew/diju0s819w=; b=hgknxfgQfDIFiz
	3FqkXtoOIZhqUq5gvti5RVq/PEjWL0ndFcH4UI2rUnL+cZeaCeUhul+g/uaCLZ6bhc1RBOo9Tw/Yz
	wogM1gUPND6Dm/xxMUoFHHUdd1K4kk6F/sLSBlBPFNlIQACfml+JydJnFc4MNpnTNDLy9qsM447yZ
	d5eKe2y0awfGVhdQ/OM5LMZwY1WvTbpszPOtb+Y3eioY8GvVOjQQbK2ZvvReFHWVioP5cYAi5WcjB
	uqit/UctBfe3Gutj9g9G/ScsAxi8IWVsxOrjw84vGNhBLqTfC3z+MIcu0bFIGBC6Hxx5b8ld6kfKW
	hEPUX4PPxwTJ4dD+JjrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYrX-004yu3-Df; Mon, 30 Jan 2023 18:26:39 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMYom-004xGv-Lx
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 18:23:50 +0000
Received: by mail-pj1-x1036.google.com with SMTP id b24-20020a17090a551800b0022beefa7a23so16361527pji.5
        for <linux-riscv@lists.infradead.org>; Mon, 30 Jan 2023 10:23:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2cCnuU35jZVdGCs4yph98OuVncVWSdeJqbA2ZAZB9Sg=;
        b=NVtPhRYVJSJbR/Cn4eg5T9W8xFMyMV7bk4qOp93b6jBCozBeskRQIZ+EA9Z1qfBD9j
         E1Sd1jPsX8pG7hOnlx6mIsqgKxStk6YpAQcNjkgsOFtvhEZSA8JE9p8vBxv6rbLiQkV1
         Whf1k/35Fovb7D3gyWhiSxoyXLHY0vPKsJI+5P8rjVD6Dg7KTUu/cGAtD74EGAWRsWzV
         rlnZitm/zmG3r4ZBslpFcNOnpb3QnyJeq/86JXJhcLrbn9ElxHwIWy0mJDeRMLn20Toy
         Hs80lxP5/A0rw3/QNj9Xqoegzn7mciAe5fzStukCmQpvpk7Ruh0qJh+GbNRkJPovzpHF
         05Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2cCnuU35jZVdGCs4yph98OuVncVWSdeJqbA2ZAZB9Sg=;
        b=vSc3sBrwIRrVyUtoFE83E+DZ7BR88fIBTxgfRasB5glXwJotLAhBdG9vimRuJv9YBW
         mKhGkPerr5wKnz1ATSZZt44lAACvFEDpRmqst+2FtNJwFmc3xuJeIuch/mN4TWPkQZ1w
         bOuoXmuQmjydNyBlx3FM70dURZwJPfD+oBumiy1T+TPuYcPxqznKjIg+ArPLbovKodEI
         HmxBJpvFGOG98xGnC8tPP5/uSSL85kG9IULSz/e8L+T9CQKHmBY95CZssdurK9ZpSpMK
         W6FCRzJz7jEqCTdQ62fXWVdV/GMUXTsqBxKLVr3pxalmCRNA68lszuLuAJfsTO5fB7Hr
         PmIQ==
X-Gm-Message-State: AO0yUKXILtezsQ8OgrsGYY1U69hvWl5qYhgY51zQpMoiEvkv2P7MSv0q
	eyvqDYeEtTEOEuaK+SW5dmEmmQ==
X-Google-Smtp-Source: AK7set/sHqOwf+i227vA8zak7mnLlMCBogBTamE5mkGyExKgvQi0skSSDX6wAhSKthnfxNl70LtsQw==
X-Received: by 2002:a05:6a20:4282:b0:be:a189:1475 with SMTP id o2-20020a056a20428200b000bea1891475mr3044724pzj.47.1675103026826;
        Mon, 30 Jan 2023 10:23:46 -0800 (PST)
Received: from kerodipc.Dlink ([49.206.9.96])
        by smtp.gmail.com with ESMTPSA id j193-20020a638bca000000b00478162d9923sm7000291pge.13.2023.01.30.10.23.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 10:23:46 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 16/24] RISC-V: ACPI: clocksource/timer-riscv: Add ACPI support
Date: Mon, 30 Jan 2023 23:52:17 +0530
Message-Id: <20230130182225.2471414-17-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.38.0
In-Reply-To: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
References: <20230130182225.2471414-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_102348_753979_17EE4A19 
X-CRM114-Status: UNSURE (   9.27  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, linux-doc@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

timer-riscv driver needs to get the timebase-frequency from
RISC-V Hart Capabilities Table (RHCT) on ACPI platforms. Add
support to read the information from RHCT.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 4016c065a01c..8079666753a6 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -10,6 +10,7 @@
 
 #define pr_fmt(fmt) "riscv-timer: " fmt
 
+#include <linux/acpi.h>
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -198,3 +199,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 }
 
 TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
+
+#ifdef CONFIG_ACPI
+static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
+{
+	return riscv_timer_init_common();
+}
+TIMER_ACPI_DECLARE(aclint_mtimer, ACPI_SIG_RHCT, riscv_timer_acpi_init);
+#endif
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
