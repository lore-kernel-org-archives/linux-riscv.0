Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 543D4C4725D
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Jan 2024 09:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GrOJR4iFqXtAFw9Ch6A94zbbYeO5PDJqOhBwF+E3Hik=; b=u8ka2HG88jYws2
	VmAYe/HNwiQGtomFVNALjSa+aKcvKvXzUG/Ne//XHenSn23n/hea+paRvk0E9D73Q/09DiNVmJwOj
	HwKB813stUx7xdAx9KwdRPZCN/7zKFxhPpuYHMC7I1PD2ZAehlHq9fZF8HqeOZS9ULux3G80BjbJm
	eYunvGxoboxe6pcdmIGNOI/FvL5RQizYroehnt9BhRxbBzeLLlJHGE6yjVNEujRRhYU0uBJxy+lAw
	hn3kDjvyonDek2zn7DYAvdps0uIM9iOolEOJB7WnWorjno/+jL2Y2CGm22jFYZcZpgs/uHiJE8xqn
	YG44fVCEqLD2msaH2MEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrPB-00GmJ9-1U;
	Thu, 11 Jan 2024 09:31:17 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNrP8-00GmHX-3A
	for linux-riscv@lists.infradead.org;
	Thu, 11 Jan 2024 09:31:16 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-28d2c1389e8so4315803a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 11 Jan 2024 01:31:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704965472; x=1705570272; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3co2sOHjGX4HJhNcpLPUh7fyfRHhZQUX9e33G8U5XOw=;
        b=o6+nmgMwRhru86xBrCre7HEPrpFnczmWX9kU23mYCpwjayAUWEh3BTrtTMEdehfL9C
         M8k9Gh+tdSBPNfcHVcXDHrK7UZB51m2J1ZnG10Nyovb0EGvSJZATAgNAnZe7+j/KKqFt
         CMEt8G7sZezhIKpERVL0aRiujbH+AFpp2x31Q5XCjJvyMcb9WFLL43/esIDP5X5TTEi8
         q3rYcJQIq0Kgxpd7rzpRNZo3Qg7Z8rGjXC63/YXAPn2bEqHXopR5Bb+AiBPjwJWiE+g2
         rLdGRbRAbV5N+rpCmkweHaPjXm/cqk8Pe8WyhuvCI5M0mUURRX7nwBPTpZA0UlL5xj+2
         tVrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704965472; x=1705570272;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3co2sOHjGX4HJhNcpLPUh7fyfRHhZQUX9e33G8U5XOw=;
        b=qwzr67tdjGukN4aSSZdNzMz9TXqX9baai5iANw5pxHLaOPbjmvJ5pqt+BfPD0IN1Pk
         sERNsTeL/efh39ec9/hPDpI/SNWdcPfkOLzkLBEYY2CXpOy8rrsC38wpR6xq6CCc1zQw
         5HwpEbqdnvx5ACQopsZU8vCtSianpGEENjtHltSKaNKQp4Z0iAnLMmLMMsQ4cLKj21F0
         eA+nOfZx2DzB/Moje+GQn9zqbXUsw5LbcTNj74pMUmTHbI+plqJ50WHtbyF4sFjyVGqn
         R1JW4WLdRo+I6/6tbGq9n9cRPknZLLCdTAERUN+YL8eGmEiFnqR4nHzXVJk+zZIjVtkc
         xzTA==
X-Gm-Message-State: AOJu0YwPl3QRZ9BkmWvWnuWCxIwdns9RD4eZytLOVjWzhISY2bEeaoyj
	e/fOvwFxYDr3pgE+tDu38bhJ26mAdPxZNA==
X-Google-Smtp-Source: AGHT+IFssiCK0JYjvHueFW2PMxwnkSqT3RYbMAUksprK2TkSi5cy8rguDn4ZmzMpW2QBoaX72pMGgA==
X-Received: by 2002:a17:90a:2e82:b0:28c:134d:fca1 with SMTP id r2-20020a17090a2e8200b0028c134dfca1mr786132pjd.16.1704965471988;
        Thu, 11 Jan 2024 01:31:11 -0800 (PST)
Received: from sunil-laptop.. ([106.51.188.200])
        by smtp.gmail.com with ESMTPSA id jd2-20020a170903260200b001d4a7cf0673sm730566plb.117.2024.01.11.01.31.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jan 2024 01:31:11 -0800 (PST)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next 1/2] ACPI: Enable ACPI_PROCESSOR for RISC-V
Date: Thu, 11 Jan 2024 15:00:57 +0530
Message-Id: <20240111093058.121838-2-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240111093058.121838-1-sunilvl@ventanamicro.com>
References: <20240111093058.121838-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_013115_019954_A2167016 
X-CRM114-Status: UNSURE (   9.12  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, "Rafael J . Wysocki" <rafael@kernel.org>, Anup Patel <anup@brainfault.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The ACPI processor driver is not currently enabled for RISC-V.
This is required to enable CPU related functionalities like
LPI and CPPC. Hence, enable ACPI_PROCESSOR for RISC-V.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/acpi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/Kconfig b/drivers/acpi/Kconfig
index f819e760ff19..9a920752171c 100644
--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -282,7 +282,7 @@ config ACPI_CPPC_LIB
 
 config ACPI_PROCESSOR
 	tristate "Processor"
-	depends on X86 || ARM64 || LOONGARCH
+	depends on X86 || ARM64 || LOONGARCH || RISCV
 	select ACPI_PROCESSOR_IDLE
 	select ACPI_CPU_FREQ_PSS if X86 || LOONGARCH
 	select THERMAL
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
