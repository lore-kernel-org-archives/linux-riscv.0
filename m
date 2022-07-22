Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F07ECCA489
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 18:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2bB1sp7svHmj7wYX7GIGas/DULR8wTtXFnd9s6XswSI=; b=iZRvT7aTY7SyFC
	Cf0a/ALZabqm0FhM/ESCq51BvMHC2OWrmDl+bhT9+IPLmZvmJ7As9hnWOnHhZQybvtl3pcg4BlgLz
	Ddnen4PD1dbdp9SACE6+QjZCXueHl3M6UJ2gl2H4fNvtNHlfP2hkot11gnU4ZWzYrYVHK82OMHuDo
	hOr56SFybz2ZROR2vr0tIXB1ZATm1ev2/E2/zaW7Cs9AL3QLJtgjDTtquCa37cR6Rj/WE5DTJF3BI
	/DjJUI0HZOPiz+NO7YSVfZZmOJyDWNA7KLzdG9SEJA6EQ3voG+Huno6jQjjLS+3dbk7NLhQcci8+T
	KLYhT9GATPC9vXU+IL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEwxM-008gJn-Hk; Fri, 22 Jul 2022 18:00:56 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEvrf-0084yr-TS
	for linux-riscv@lists.infradead.org; Fri, 22 Jul 2022 16:51:01 +0000
Received: by mail-pj1-x1033.google.com with SMTP id t3-20020a17090a3b4300b001f21eb7e8b0so8072791pjf.1
        for <linux-riscv@lists.infradead.org>; Fri, 22 Jul 2022 09:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fhiEUpY832dBqpBZs6lVDJUJh/wPjhRPH5Wz0gZOdjs=;
        b=dlpFbmXItlUG9AvAKQ4H72BXu7Ec0gAYulbojqhVRlPlmOQtGwb0eiZ2TMO2TCDDrj
         DnL31uggr5tjrAfWw7V9MNiEU/aMiiaCv86V7QRe6dTtRLRyvr/Myez57yefVPu79b9a
         R3r744egp5g760mv20a1p2v3LqLYnEICd03OzMW1NmHz9mgyBnS6xXAycfkF/JmOa7V0
         pBu2teIE9lF7a0FyNp+c9fI/Em3+ZOb4oRMHK4OnKeF3P4aKM5aDtdfr56IcgqXK2kHP
         by52M9Tm29aOBwPMFiHW4YZ2DWiSLPoihmkCKzsL7cyyoHA4euIFOr/SEF/GcVFvmD2j
         O6sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fhiEUpY832dBqpBZs6lVDJUJh/wPjhRPH5Wz0gZOdjs=;
        b=SrNWZ0ifyQSCXcU8DVFIcBuzyM/+QHOpb4rL6x8tKqUsfQLUXG0FWrViBRLee7CBjV
         Iy5SmH+9pG72BKMvkfksW99eJYTU+MYyCo9wYc+z/VsNzd5DCni7iqSiMfaqhRUS0ekm
         TXzBaWGSjk84Q4lbwKoH4EAsJnfmy6n30kNGnnjt0JR1N6kNI4crn6bopD8K+QbPNcfL
         Qf7Dc9TFzRp5DiAx9myhj3+LQtUjwpgDmUdNnITsDCckULQrb6AniZ2MsYwVApqbKwLC
         m1Yt6stLBMitOppa/3ClB9D6Q5pNUrKIzfzEMDpqI33fHk2oT6qc5E09hxSRvxXE/Nyg
         WRTw==
X-Gm-Message-State: AJIora9pQlu4S6DoWtOeX8J5ninoWOdgFW0lThqqWLrx/PTJ8gPBSJQy
	Xpnfi3oh7DkhfX3yItd4s9w45w==
X-Google-Smtp-Source: AGRyM1vRTM3hIrzt2q2YQt5RlR51I0fFh7y/0/pkqJWtGugoh6yMC2nGJ0JNrvJjfz1pnKXpBNa4Nw==
X-Received: by 2002:a17:902:70cc:b0:16c:60e0:50fb with SMTP id l12-20020a17090270cc00b0016c60e050fbmr443033plt.156.1658508658489;
        Fri, 22 Jul 2022 09:50:58 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id s7-20020a170902ea0700b0016a3f9e4865sm4028476plg.148.2022.07.22.09.50.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 09:50:58 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Anup Patel <anup@brainfault.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Atish Patra <atishp@atishpatra.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v7 3/4] RISC-V: Prefer sstc extension if available
Date: Fri, 22 Jul 2022 09:50:46 -0700
Message-Id: <20220722165047.519994-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722165047.519994-1-atishp@rivosinc.com>
References: <20220722165047.519994-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_095059_968944_070CEC00 
X-CRM114-Status: GOOD (  13.77  )
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

RISC-V ISA has sstc extension which allows updating the next clock event
via a CSR (stimecmp) instead of an SBI call. This should happen dynamically
if sstc extension is available. Otherwise, it will fallback to SBI call
to maintain backward compatibility.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 drivers/clocksource/timer-riscv.c | 25 ++++++++++++++++++++++++-
 1 file changed, 24 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 593d5a957b69..05f6cf067289 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -7,6 +7,9 @@
  * either be read from the "time" and "timeh" CSRs, and can use the SBI to
  * setup events, or directly accessed using MMIO registers.
  */
+
+#define pr_fmt(fmt) "riscv-timer: " fmt
+
 #include <linux/clocksource.h>
 #include <linux/clockchips.h>
 #include <linux/cpu.h>
@@ -20,14 +23,28 @@
 #include <linux/of_irq.h>
 #include <clocksource/timer-riscv.h>
 #include <asm/smp.h>
+#include <asm/hwcap.h>
 #include <asm/sbi.h>
 #include <asm/timex.h>
 
+static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
+
 static int riscv_clock_next_event(unsigned long delta,
 		struct clock_event_device *ce)
 {
+	u64 next_tval = get_cycles64() + delta;
+
 	csr_set(CSR_IE, IE_TIE);
-	sbi_set_timer(get_cycles64() + delta);
+	if (static_branch_likely(&riscv_sstc_available)) {
+#if defined(CONFIG_32BIT)
+		csr_write(CSR_STIMECMP, next_tval & 0xFFFFFFFF);
+		csr_write(CSR_STIMECMPH, next_tval >> 32);
+#else
+		csr_write(CSR_STIMECMP, next_tval);
+#endif
+	} else
+		sbi_set_timer(next_tval);
+
 	return 0;
 }
 
@@ -165,6 +182,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	if (error)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
+
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
+		static_branch_enable(&riscv_sstc_available);
+	}
+
 	return error;
 }
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
