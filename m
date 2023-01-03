Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3C6C46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZwMDho0zkFrer8evlxUUNfNExUeWDwuEOkPFu0rCwFg=; b=AjGAAOHw6u0Wc0
	Md7uvEP5bzqDHphuEWGbSpBfTWDOJYmtTdDJ2nXqADjmWS8uIA/rYm4wwWZiwvaIcR9L8uBnyqZQr
	rBKAiyT/aa5AzrrhEisVgf+lUwXkw5/Ep2hRXdJMVvhSIZ0Uv2g+NLqzXssdnGJhq3dUEOX+HhwLe
	YLW3l4wJDKc952JAu2RjJkMAPrZ/JE+S4MWXy0GUE5Rm1d2SE1v7PrlBDJumcFEIruGXnjSIvrBn0
	HZzI13uCkdjhlYpClU4s0i61j/m4hV+CiloFsmokhxCv6N53xil9ftmQWoilAaU575LqjWh8e4oUM
	dAl540U8cvx3wIfgNRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCkeR-003BTF-64; Tue, 03 Jan 2023 17:00:35 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCi0e-001pxm-Ul
	for linux-riscv@lists.infradead.org; Tue, 03 Jan 2023 14:11:22 +0000
Received: by mail-pj1-x1031.google.com with SMTP id o31-20020a17090a0a2200b00223fedffb30so31202343pjo.3
        for <linux-riscv@lists.infradead.org>; Tue, 03 Jan 2023 06:11:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dlh2CMNdSoUIQxTaEwlbl5D9rexWqbuQ4H+cWHRWlxo=;
        b=gzxbqIdlnLfc3CYwtD5PIBA+jLZSmjFqO8TrRQZJuC42pQak+JX3HPhYh9kRLnYkaQ
         IaNUcVXwgUgpIb7WxUwbVgIZTjHbJrnm6mkhnhjO3DW6Zg/KlWGnVI4/aNBMGdR2Lusq
         JBoCwrorLqqrMfcK9UZRKP8m6KfWIgDYLVLMIutcA9c7n3zw1DeAgC+FR88evKH7XaiP
         J5OC6TsRJ13W6bv21/QL4g+jkB3ZNW1N5XNfxobqRPNJgkHoS+m/sLHIWLbijyCJtlxB
         kNl7QDifcdudr9IwAvQj38CfDJ6gjsGhJKHdo6UfuELXzch5CTYyyl97H1pfxicIvnSV
         WBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dlh2CMNdSoUIQxTaEwlbl5D9rexWqbuQ4H+cWHRWlxo=;
        b=tNyK+JfEk9M+TjSuxZSStSwyFiH732DXtxcCQJigHqCzTzTiwxAPNNBE/VvuIMUI9A
         Z+Jl9FFW/Y6LPVqm7hajGHxb0Lto9OWYgsbSKRVRExy8BAxngB0pI+uKvSaxrxUV5iCu
         jvLmki+8vL3ZKgMi0K6oofHxDYGnui+txY3bTmwZJy4WrEMSzW1OgMjMZqfVLdP+iqbN
         EJmXbH7zoc+cBpokHouUfzh+XbcF5Md6alFJiQ+ASVvjcXfq6Ev3ux6zknYeead3FEU7
         6LKnaWNDUqg8cFohcMr/AU6rPRoxk4XzS80Brq6xA6lQjVzFbDUsGXPHvSV+s2LwVwBV
         pR7g==
X-Gm-Message-State: AFqh2ko1b9+PxaaARqZH+sfFDvfpcS7EbZ5MWv96ovjJlb9mt4VRk27y
	WbrjW/IPlz21hq7Qs0mJQK4cEw==
X-Google-Smtp-Source: AMrXdXvvhbldGv1zoWD3s9+n/qqO1/Vrk7Z3TW+8cYf8u4sdHtpTbSDvzlPBk4S/2Jm8tkENFlkpOQ==
X-Received: by 2002:a17:902:d3cc:b0:192:9141:ace5 with SMTP id w12-20020a170902d3cc00b001929141ace5mr25598340plb.13.1672755078370;
        Tue, 03 Jan 2023 06:11:18 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.85.241])
        by smtp.gmail.com with ESMTPSA id l3-20020a170902e2c300b00192bf7eaf28sm6146117plc.286.2023.01.03.06.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jan 2023 06:11:17 -0800 (PST)
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
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v6 1/3] RISC-V: time: initialize hrtimer based broadcast clock event device
Date: Tue,  3 Jan 2023 19:41:00 +0530
Message-Id: <20230103141102.772228-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230103141102.772228-1-apatel@ventanamicro.com>
References: <20230103141102.772228-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_061121_410354_BD8E5133 
X-CRM114-Status: GOOD (  10.85  )
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
Signed-off-by: Anup Patel <apatel@ventanamicro.com>
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
