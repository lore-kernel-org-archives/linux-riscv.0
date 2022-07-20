Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58197CCA485
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 19:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=errLoNqTxjGdC4JOOTJwbYyY6O/POXKf4fucZkKgsog=; b=Lj05Qbb5i+N27o
	W6hfxLBeyms1cVBLi1wb6KR997nynpGzS4ndTBBGamRNGaBF2cR8GWEr5L5yGo6tumR0X/nLQ6Dwf
	HSyI8OU1KEknPFh8f5w74UqnSkbnVL5H8An8Ynq/Z1LTEr1HbTgHB5xNWulQK18i3p7piiWNtRpaq
	FeseggTNHLb5N0+aEb6g4QjZutMALBud4iulycxk/dUgNA6Tw3w2MJGG4DH8J8PAkbUGTOl5YhBKB
	X5vG+ERm0MfisdJml+p2YluqV8y+jr/g97Wl7Em+vlpc9N8qSk2OyNENYpG2J4CKELPxTkTOXDDQX
	kIvBUJ7rTNi+eRwGeOPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFIj-009oVN-70; Wed, 20 Jul 2022 19:24:05 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEFIc-009oHJ-ND
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 19:24:00 +0000
Received: by mail-pg1-x535.google.com with SMTP id h132so17257628pgc.10
        for <linux-riscv@lists.infradead.org>; Wed, 20 Jul 2022 12:23:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=k7oAEso24XUyiMu0RhEG3Nlz67s2VkRn8qN/IYX5xGk=;
        b=sY9xzDFI9X3wzme+LId9I8R9+tn4yaAMLQpEbWaQ3yG2PQ5DtSBnecKXDC1IFimX6t
         K/qY0qg/2psalruNjlEzf0CEI1o2HccaVgkbFwMlwJj8LXADl7lxeiKjvIzcYUI8q5uJ
         ttyGd73sE3NX1DqDjAytZoQjw4rUEo0+iIqu765dNAOiICi/0wbNDYOGnMYM7Idiw+f9
         dxI0O1CY6sfcSs5MWgNo9pDebidl7EyZEPDZa3unG5xPqkvDeJRoKSNwIckNUA+nvsiS
         kQry5184T2awXHtc9U47ggv3Fvs0JXytLLjZ9uJzG/lLzy5sXq+hstOnl5ywDIiGBreq
         hYWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=k7oAEso24XUyiMu0RhEG3Nlz67s2VkRn8qN/IYX5xGk=;
        b=CmHpGLAmBDYPpjMAnfNHgR2mthMKOoDDBrLVnLfW9lE2HWfNJLRtx7UUP4MpgMercZ
         XZd/lV32Mz3LkDthMMWHypjTJtTg3XrOpaVNagynDnYcUsCx1KjTL7v57jXnYHI9YL9H
         GGmuxyVLtOGAZCwno1+DoqQUgpiiogSyi+JlaJTatvOEZem32AXVn5iiEPDef49qDfoG
         NrOZLeAHBhvYG861eKe/zaagQnIo+08V4P9r72Yo53tSNLaBLlfHruzC1ebx6wZxcWcg
         Wco36Qsn9Zfkmcpqv5DyMe5sig6Bc05FUFG/Jz7Tn7yGMyKSLCw3GgB/3z3drGfJ5+IJ
         v4JA==
X-Gm-Message-State: AJIora+Y0gL1+6pZuIVMGuqrw/zlBvS7kB+tN9hnkOXgQSzGQu/ioN1J
	p9WrSFt0ri9z7Hj0re/a6W1m3w==
X-Google-Smtp-Source: AGRyM1u3GnXaQ/dPKAAkFwq7+MPBAz7n0FxebmLk2pgdq9YV976oddbOqJyDP0CBIXa4PDlmreA76w==
X-Received: by 2002:a65:4501:0:b0:3fc:4895:283b with SMTP id n1-20020a654501000000b003fc4895283bmr35712773pgq.231.1658345035855;
        Wed, 20 Jul 2022 12:23:55 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id y23-20020a17090264d700b0016d2e772550sm219902pli.175.2022.07.20.12.23.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 12:23:55 -0700 (PDT)
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
	Liu Shaohua <liush@allwinnertech.com>,
	Niklas Cassel <niklas.cassel@wdc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Philipp Tomsich <philipp.tomsich@vrull.eu>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Wei Fu <wefu@redhat.com>
Subject: [PATCH v5 3/4] RISC-V: Prefer sstc extension if available
Date: Wed, 20 Jul 2022 12:23:41 -0700
Message-Id: <20220720192342.3428144-4-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220720192342.3428144-1-atishp@rivosinc.com>
References: <20220720192342.3428144-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_122358_909226_AD176A5F 
X-CRM114-Status: GOOD (  13.78  )
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
 drivers/clocksource/timer-riscv.c | 24 +++++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 593d5a957b69..3f100fb53d82 100644
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
@@ -23,11 +26,24 @@
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
 
@@ -165,6 +181,12 @@ static int __init riscv_timer_init_dt(struct device_node *n)
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
