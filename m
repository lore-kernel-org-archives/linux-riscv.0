Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4942C001DF
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Aug 2023 18:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o/P/VW1/W37vnx5aFwZgq9PPjzjRsXwYjNCpv+RR7XA=; b=aQwcnO3vIqH187
	weG+NmNgWZeiEpCp/lyRNAicL7Qd6mcfE4xC1nkUpeOmdjo+VPM/vSj3uZQ2YpsKftw/cAGqmPWGV
	vRICy1Wv+pBt81PaXAKYk5lm6fuXVTzCgSJNWC9tyLykpyLYxZ/IhqPyjJgSpVpGCk57NwZzRsw34
	CKpKHdKfGuHcYNb/1yBgAkwceL2vYWfUxJrfWJmWT/1oxpgZecz+wXF/l/myJ2LDLh4BiDVTxc1X/
	4DayBoKBw+M1zbXY7kDlsF3r5P/GvXcnR7lz+PLI3fjeoGTTshY/eZm283UicLFdCU5B6mQUZoX9e
	qUAkq9wAZq3QgiR0bm9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRcd3-00AVBm-1P;
	Thu, 03 Aug 2023 18:00:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRccz-00AV7Y-0n
	for linux-riscv@lists.infradead.org;
	Thu, 03 Aug 2023 18:00:52 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-686daaa5f1fso893279b3a.3
        for <linux-riscv@lists.infradead.org>; Thu, 03 Aug 2023 11:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691085648; x=1691690448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LwCzqc1PMCRcx2h1vYzs9FDmhl8QjorV5J8xX30vpfA=;
        b=lGptm+1FaVB2szu9+1FrX5AfEizhjltUyo0aBH0MmslTFeM8tX/ihvgQP5IVG7Tg7A
         TBFasNuPmX1HxnupljC5J7LAW031DE7hpjg43EwE0xDPU/lp/UPU+kc+wx4Dk9R1qb5t
         7jDVmYJE9VCa4riLTon3hZNN5NOLOY08WqDcPqdaOX8wu39mZPD6VF0osJ32v9gvrbfY
         XACNR92dJTW4PA3wpYNW/UJoNaiuDBuB6RIXDK48vy2YclaDlPWCQiIFi0kIXCFjOqjQ
         6Ca8u30WmNCuPrp25cbilzk20B3sOHrjBX7H62pImD4I+4KWuK1qabDwfjQuxSkrh1iP
         XS3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691085648; x=1691690448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LwCzqc1PMCRcx2h1vYzs9FDmhl8QjorV5J8xX30vpfA=;
        b=YxHkZkrllpU6607jmAlaRcfX7b8CjJb1IM/MvOHkMOjEfsiFUSrG+EhcmAs2k3DAmy
         BoSvxY+fcBEaIkFADd0WnVYmbSgy1M+5V10D/8Pa4aruYVBskNyKBR+8iBNQQ9soSKJp
         63dD22eSBf4AwkcVis6UKoAuwpPG+4vIBPRBUzzijPKi1Lbxic1WQ18aPa/fa1kanZ6d
         VbDm/lsUFJ7YwnuhdizuOPVhRba3JE3kyqNGQB3GNusDQPj9JHwVqzLe5Y2dSGMwSnCF
         MFwX4ouutTLspvXcJ7TlVy2KbrlunZTOMCPwpxFtBHj4MrUgZRZlfe7rb+XzqvkSEKBf
         OrcA==
X-Gm-Message-State: ABy/qLaNd/bNKC22dRhSNVP40dPRX7x3n5lHIBpqcwPH2Skd2tweY6kc
	k1h6BDEQczex404fb8ozOfVIkA==
X-Google-Smtp-Source: APBJJlEZPAolOiWsswMUNb/3O27FzwqkU7VHoLeXdU05Nm8+s6t/U8LeZFnf7BD1irhpUyClA9ox0w==
X-Received: by 2002:a05:6a00:14d1:b0:63d:260d:f9dd with SMTP id w17-20020a056a0014d100b0063d260df9ddmr21845288pfu.33.1691085648649;
        Thu, 03 Aug 2023 11:00:48 -0700 (PDT)
Received: from sunil-pc.Dlink ([106.51.190.143])
        by smtp.gmail.com with ESMTPSA id s8-20020aa78d48000000b0065a1b05193asm134952pfe.185.2023.08.03.11.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Aug 2023 11:00:48 -0700 (PDT)
From: Sunil V L <sunilvl@ventanamicro.com>
To: linux-doc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-acpi@vger.kernel.org,
	linux-pci@vger.kernel.org
Subject: [RFC PATCH v1 10/21] clocksource/timer-riscv: ACPI: Add timer_cannot_wakeup_cpu
Date: Thu,  3 Aug 2023 23:29:05 +0530
Message-Id: <20230803175916.3174453-11-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_110049_324889_2113E160 
X-CRM114-Status: GOOD (  10.39  )
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
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, "Rafael J . Wysocki" <rafael@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Atish Kumar Patra <atishp@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>, Will Deacon <will@kernel.org>, Haibo Xu <haibo1.xu@intel.com>, Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Robert Moore <robert.moore@intel.com>, Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Paul Walmsley <paul.walmsley@sifive.com>, Bjorn Helgaas <bhelgaas@google.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Daniel Scally <djrscally@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Anup Patel <anup@brainfault.org>, Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The timer capability to wakeup the cpu irrespective of its
idle state is provided by the flag in RHCT. Update the timer
code to set this flag.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/clocksource/timer-riscv.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index da3071b387eb..50198657230e 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -212,6 +212,10 @@ TIMER_OF_DECLARE(riscv_timer, "riscv", riscv_timer_init_dt);
 #ifdef CONFIG_ACPI
 static int __init riscv_timer_acpi_init(struct acpi_table_header *table)
 {
+	struct acpi_table_rhct *rhct = (struct acpi_table_rhct *)table;
+
+	riscv_timer_cannot_wake_cpu = rhct->flags & ACPI_RHCT_TIMER_CANNOT_WAKEUP_CPU;
+
 	return riscv_timer_init_common();
 }
 
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
