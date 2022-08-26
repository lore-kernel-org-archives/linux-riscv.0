Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A354AECAAD8
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 20:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93GTNoO++fR+TKpcWtqp/g8vi0NbaAkIWbLTCzFp0Vc=; b=OGGQMvMtDdgeun
	jWk8f3pKfxa2kKBE0j4QLTzbRj20Dd3ZPK/UR0Pm678SdpgJDL4xZDVZicYclcX0fcOO77evj1kF0
	sb2M+SZf+WmRjgSm2s+dVN2OeutXUhJgk5NwHeUwtBWLG5tJbqrOz8JMz1rxjyMBCY57PAZhaN1Hq
	3Hzc7qBhXPslIaM7ziIvpuYp3WYXIoDIrHf9DvjA0XtePP1Kjna26tzf/CWAd7a2idOxsrlwMsN6y
	R6c+OygiU2wuc5KJhf9eydUubLbP0vWff3VRxnKChwzbltQ557LFGgsLzCHJSt7NDjvaMa0/38dDN
	arbbP8vHYCslf1Dnb1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg2h-00BtaT-1Y; Fri, 26 Aug 2022 20:35:03 +0000
Received: from mail-lj1-x233.google.com ([2a00:1450:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRg2c-00BtRP-29
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 20:34:59 +0000
Received: by mail-lj1-x233.google.com with SMTP id bn9so2631702ljb.6
        for <linux-riscv@lists.infradead.org>; Fri, 26 Aug 2022 13:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=JMv/ay/ULWm9ASAW+jE6/Sp3Gmh6pFf+PUyoe9TwLDo=;
        b=ngtQ1ZexHkenJ2038kNIdF599UfRrePrLedpRq7Gdwl2wNrAPs1ZcfCgG8rtNVfGAh
         qFLckj3jYU/q7eA0WuRs7nttIKF8bcnIAJoAgE1Emqiag54q71nbYz0Y1Ezgvwo2GjHx
         aolU9gaCgkgam6R7gojeby6Ii78wDr0hLXDNxF6hkCVliOIRDdC/6xhij0O+O1mk/2K+
         FqH6oIXGvI0W+M8H075nO9kl8W7T5RiqlVTiEPEXhFwzf7tNtMX403+ZjYA9p7kGxsv1
         SVArQ7sQq7B4mGpAr1ShjXDXJ+yChLIFyX+yic2oYw9UBYUovBNqpKhgdA3k+YUSx3VV
         g7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=JMv/ay/ULWm9ASAW+jE6/Sp3Gmh6pFf+PUyoe9TwLDo=;
        b=n/eBFociTCV1v9yxYVqalC6TCYdX1F6C3RUdarDBl2t/VfJnMIxqA6DkvVQpJ+uezo
         2q0w54RjwA8iHH1vcEagkyFyvb2gSajpcxhRxib6Gulipa3nyGdt8Po9TYxAVoiEaerA
         q5BOzJI9ARAN2B5RgewsFSJaycqA/i3RsIpgDmYRF/UrQbdOe7oWBR5FwB5B3+h9e/Nr
         qI/UIYO36WhZGkPHfqgGtKJJvLAb7wvhq7Kmf1GOO8heD8t60IAZekYWFTkBgvt7XbJA
         SoH/AkYatHn2uvnjmfOS1rFTtgC8ctqIMuCNnVeMZCn+5pY8n6xYCuU+ggfkgZ41/t+K
         KeCg==
X-Gm-Message-State: ACgBeo32tJBdtjpohmZKAoduZUIG7pfNk4nQluF+i5SYfU5S2v4VA+43
	GLWTRVN5OFbAkXfy6Ol0DMmVh958xVA=
X-Google-Smtp-Source: AA6agR4psT+Y8JaUrHI6ZDKKGl70SzPAnbzG2ap6G9wB/toDNa2q8B1Lygjx72xbvHhMw1NsnoSK3g==
X-Received: by 2002:a2e:bc1e:0:b0:261:cee3:e35a with SMTP id b30-20020a2ebc1e000000b00261cee3e35amr2949221ljf.249.1661546095577;
        Fri, 26 Aug 2022 13:34:55 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id v6-20020a05651203a600b00493014c3d7csm452424lfp.309.2022.08.26.13.34.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Aug 2022 13:34:55 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org,
	Atish Patra <atishp@atishpatra.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Will Deacon <will@kernel.org>
Cc: Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH v3 3/3] perf: RISC-V: throttle perf events
Date: Fri, 26 Aug 2022 23:34:43 +0300
Message-Id: <20220826203443.823906-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220826203443.823906-1-geomatsi@gmail.com>
References: <20220826203443.823906-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_133458_122751_56B30D30 
X-CRM114-Status: GOOD (  11.82  )
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

From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>

Call perf_sample_event_took() to report time spent in overflow
interrupts. Perf core uses these measurements to throttle
perf events properly.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 drivers/perf/riscv_pmu_sbi.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index bc7db9739d5a..15e5a47be7d5 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -18,6 +18,7 @@
 #include <linux/of_irq.h>
 #include <linux/of.h>
 #include <linux/cpu_pm.h>
+#include <linux/sched/clock.h>
 
 #include <asm/sbi.h>
 #include <asm/hwcap.h>
@@ -570,6 +571,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 	unsigned long overflow;
 	unsigned long overflowed_ctrs = 0;
 	struct cpu_hw_events *cpu_hw_evt = dev;
+	u64 start_clock = sched_clock();
 
 	if (WARN_ON_ONCE(!cpu_hw_evt))
 		return IRQ_NONE;
@@ -638,7 +640,9 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			perf_event_overflow(event, &data, regs);
 		}
 	}
+
 	pmu_sbi_start_overflow_mask(pmu, overflowed_ctrs);
+	perf_sample_event_took(sched_clock() - start_clock);
 
 	return IRQ_HANDLED;
 }
-- 
2.37.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
