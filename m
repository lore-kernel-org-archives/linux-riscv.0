Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F28DC0502C
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 15:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u2oV99HRUdTd8seT/ondqgFVuQ6lscpmRVzMAsPdCY0=; b=z+/UVTv8G74TUD
	OuA4+L2AfhjT32l+uahLnF3Lm2LRebjJMOCqXFsBfEr9KgEcZpAMu9CiBSiYs1/pX9uV3anx+dF3I
	XBXaSy0NNtwU6J+hySU6SUQgNsnRt3+u74h83y+ArY67bmREECXRtfnEy5YqpnfPiZvUfQqhD2Wsw
	ZNEZj05f23TjXYqplkNX7hjn5+COeKWDCKlSTnqv8NsG4jlT/OrdpW01wp8iIxoYQ4nOKCxVAqzt3
	h6Cp4ie2CCpsBY4zWWjRrZghzcMvCjhC2TwdR79PgNS0sb2xHXD0I7Jol7O1MONFWi8/w2mhJySly
	8jOYABHc/U+grJDqALQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT3YK-000PM0-K6; Tue, 30 Aug 2022 15:53:24 +0000
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT3YB-000PHy-A8
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 15:53:23 +0000
Received: by mail-lj1-x22a.google.com with SMTP id q16so11816956ljp.8
        for <linux-riscv@lists.infradead.org>; Tue, 30 Aug 2022 08:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7NqZnwnBfQR4lCqhgaLh3gKc12ajRonAwrTUZFZfrwU=;
        b=BZX1jXso+wgXIn10R5nwNoAlC27tDWqquzdRvULnna2eFsXTFCF/FvnYf6iAZee5cF
         CKj0P8uq2+YYEOSj0EqhQW2TvXzDOBb2+fg4LYJKkU3CPFA1zsuJaoXLqLHDRfBp3Be1
         rxC31kAPZ+eC5U44jQeIsuaqngP+Cj2u8TgS1YVrbg+dGLnLDeus5pQ9dXJSkUtWYDop
         ww8sSFKJmEqY/fOloR3gNpmUo/K7+LM2vPqdzQpRs3DQj+K5BfLDiJrXDfe12WnGh1eY
         HJ5EzoCW5MpNuC/HotBGlDlpa/7UYQ9Qy7f/oNP7oJfo23kEDCR0X+fkiHnyeiS8nynV
         UeFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7NqZnwnBfQR4lCqhgaLh3gKc12ajRonAwrTUZFZfrwU=;
        b=kpv+6DFJwWxWxnK7tLUWzsAkUkTnW7VK/U573Myo1ni3IAR/KMTo9lsQvv2LyZPUar
         tz3dubPmpCvmBA1era6s/J67Og6zyl56AOVIRjCRdlR2hM1geie7JceBth2l+pP4oo80
         UJzZV5xNzmLjbZceebmxZc/Jf+0d4kZNYsx1DB19Pmz1HYVN1+gtkWkWKfAi36LKk9Kx
         orTzjSAfz+WgeZ3DKUx/1vs0a/nnW+aSn2boXiOCikoTu1KZmp7yjFeWnVMfOQL8+rRo
         Zuklci0HSoP4X529yqlhobY0Csu7rDjrcyA8hHoJXuJU0NwT/O3Q9GnVNhqa7iYUk+Pl
         dOQg==
X-Gm-Message-State: ACgBeo1NXw/hD41ecwSn0AJKzwq9nX2TGHg5JejF6aPbiOGV+ohcfuUN
	o6cIKvxcxG2g2+nJ7uyGtnGe2gI2bzTkkw==
X-Google-Smtp-Source: AA6agR4x2XXKQuxC6RP1ditIUXj2/rEhK2R++fKjPavi/GgNtiZIMnF8T0d9/eJRbKTVy4NU/GeF6Q==
X-Received: by 2002:a2e:1f12:0:b0:261:962d:26a1 with SMTP id f18-20020a2e1f12000000b00261962d26a1mr7559160ljf.521.1661874792749;
        Tue, 30 Aug 2022 08:53:12 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id t6-20020a19ad06000000b0048af397c827sm1646572lfc.218.2022.08.30.08.53.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Aug 2022 08:53:12 -0700 (PDT)
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
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 3/3] perf: RISC-V: throttle perf events
Date: Tue, 30 Aug 2022 18:53:06 +0300
Message-Id: <20220830155306.301714-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220830155306.301714-1-geomatsi@gmail.com>
References: <20220830155306.301714-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_085315_369355_F17D9462 
X-CRM114-Status: GOOD (  11.87  )
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
Reviewed-by: Atish Patra <atishp@rivosinc.com>
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
