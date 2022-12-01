Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB17C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 12:40:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OpG8SN4nNeRHPjMXgZseyBExzhl6vDB3OKyUf+TxNCg=; b=OMQxbA5j/cYy/i
	6l/2LQ1fLeJJfdzIiQnY4hwc65YBreassZYtSN/cH/mBjmzFcvQZQMPH0IdCl6JyiA9S2PrBa9Y0Q
	4f94++7jRxtp2GVGcEopm1icnjGtUeAv1z1RkK0lo3oBxZRtgBgkjFo3HMgtCButrFaA5fIeGYd4x
	3JJvyrBqh8huGiLbxiwoQTPhzda0D3XnQmCddHvM6ivXlgi5zm2FmOpdr88SXkxVm9G6slvEniX/s
	4TB9SO2Mgd81jvuT32ni3ufQop3PeyfFrPZfQ4aE/dFJT03huOsYC/b2nwkU1fpy2FFFQtTVGLvPU
	UafoD5mlmuOBIfcft0IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0irZ-007LTn-M9; Thu, 01 Dec 2022 12:40:25 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0irT-007LOz-Iy
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 12:40:23 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 136so1579060pga.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 04:40:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iMerckrhZTm3FZ8D21RolrP9vW5vY1yytNXMfvZLbSs=;
        b=EW5N4fofLG283DGbnT+a/zHyAd4+0YOIWw6FGWlEpchFEMUJzLqhZWhWABAWelWgmp
         tYxkMY+aOjTkvgYbcPfiocKATHcS4FrKB9hHvgGE0qojBUvWf549A1krIqY3kTKEkQUt
         qBCFDeFj/9xscbLvW3OKFoVDxvmOSMe2vsQSrPEb+sikXyxGMCzD+eyP8SiY8DP5H88C
         aghhCxchlMILuAzqq0/vxFOIK7KUzgwIYWlErfBS5HM012J0kQSo8C/6OCx2xlYJvQLh
         SkpVTk52AuEe/ntV8JBSkQ01QQRqe38fI5aNMZk7pb+mXZcYuQuzK61yGSDiGUncfFke
         H+sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iMerckrhZTm3FZ8D21RolrP9vW5vY1yytNXMfvZLbSs=;
        b=NLLaL792gr9lq7y0O0ZZkaLM0FoL8Qul1mTpaGnLqBg77ZGwCqLPATR2H4WK8eLY+G
         YWNQxGX2WCrXlV/sox5ubW6Yv0o0vkV6g1T4Pwm2VzjdSlVk3ARF5L6yzoePECqfgBnT
         X8QEfwmep9HqMR/gRzkgfEW9Dhlpp6lN7gt6wPy/w/o5351p2PNl7aMtpyY1+cJdrJ4y
         /o77YyKft5bVvjRXGkE7YJzYdoHZhExwNcphvzUtn1IDB+4QFu5JpBWI4gy1KZYuoMqL
         BFMuvnBfziUgrDC+F94l9ITlNICfRNonNO7nKk+rAVSKRtk6oz5t7aQmq7SSiZ/Qmtnf
         lFAA==
X-Gm-Message-State: ANoB5pk1CHvfQyhJon3h1PGmCLMYvekJkcoskjy8ByT5fqkEnLc3pNbZ
	QZfeRjPAo2OzJsVntyoivELilA==
X-Google-Smtp-Source: AA0mqf782l4m814ZaZs0CFvnLfiiFisNyRXUDu+bIqwsD0IywGmhZJf0DMxA/y+agEoh/mh+ymv4Yg==
X-Received: by 2002:a05:6a00:10cd:b0:572:5c03:f7ad with SMTP id d13-20020a056a0010cd00b005725c03f7admr67744766pfu.17.1669898409211;
        Thu, 01 Dec 2022 04:40:09 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.81.69])
        by smtp.gmail.com with ESMTPSA id b65-20020a62cf44000000b0056f0753390csm3246981pfg.96.2022.12.01.04.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Dec 2022 04:40:08 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v5 1/3] RISC-V: time: initialize hrtimer based broadcast clock event device
Date: Thu,  1 Dec 2022 18:09:52 +0530
Message-Id: <20221201123954.1111603-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221201123954.1111603-1-apatel@ventanamicro.com>
References: <20221201123954.1111603-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_044019_648047_56EE6BBD 
X-CRM114-Status: GOOD (  10.24  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Similarly to commit 022eb8ae8b5e ("ARM: 8938/1: kernel: initialize
broadcast hrtimer based clock event device"), RISC-V needs to initiate
hrtimer based broadcast clock event device before C3STOP can be used.
Otherwise, the introduction of C3STOP for the RISC-V arch timer in
commit 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped
during CPU suspend") leaves us without any broadcast timer registered.
This prevents the kernel from entering oneshot mode, which breaks timer
behaviour, for example clock_nanosleep().

A test app that sleeps each cpu for 6, 5, 4, 3 ms respectively, HZ=250
& C3STOP enabled, the sleep times are rounded up to the next jiffy:
== CPU: 1 ==      == CPU: 2 ==      == CPU: 3 ==      == CPU: 4 ==
Mean: 7.974992    Mean: 7.976534    Mean: 7.962591    Mean: 3.952179
Std Dev: 0.154374 Std Dev: 0.156082 Std Dev: 0.171018 Std Dev: 0.076193
Hi: 9.472000      Hi: 10.495000     Hi: 8.864000      Hi: 4.736000
Lo: 6.087000      Lo: 6.380000      Lo: 4.872000      Lo: 3.403000
Samples: 521      Samples: 521      Samples: 521      Samples: 521

Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
Suggested-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Samuel Holland <samuel@sholland.org>
Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
---
 arch/riscv/kernel/time.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 8217b0f67c6c..1cf21db4fcc7 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/of_clk.h>
+#include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <asm/sbi.h>
@@ -29,6 +30,8 @@ void __init time_init(void)
 
 	of_clk_init(NULL);
 	timer_probe();
+
+	tick_setup_hrtimer_broadcast();
 }
 
 void clocksource_arch_init(struct clocksource *cs)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
