Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 379E5C05027
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 19:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Cc:Date:Message-Id:Subject:
	Mime-Version:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=ogvUivw25CJQJaThLo/3Hqe+8Ui8UzKsA3UJOYodiHs=; b=oYt
	0IOCJ27uUQH+RZ4AGv9ikzJJxGiLlbrhO4xMUXKT2KHMFlPqvk23m0DtVCbIYO3rN/pbrGLm6U8nF
	8QdfsgiGgSsPdNQKPhWSqtHuyC1+Wt5rgnZ8RRwUsumYcLL58tmHIdjHuMWuYMqLI0aKS4WdtBgs8
	kxl01duAvvLcTLWozPuEwafGr8MvDRnSbq8ceBKZ8nYrC75ShZF8I6I4LtpX/FMNrvCiBTzbKlvXj
	wRCn5TYX5XGe/vbirUn3kcz8AZ2x5ZDZu7Uq9B3tJwWPAiHOWSMsxyzV9GfReMCkdYiPKoDCPmP83
	8LxMGyV7lzBBxA/qBa0J5GXHfZVSCzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJ78-00DQrJ-Iy; Wed, 01 Feb 2023 19:49:50 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pNJ75-00DQqG-Qz
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 19:49:49 +0000
Received: by mail-pl1-x62f.google.com with SMTP id v23so19569971plo.1
        for <linux-riscv@lists.infradead.org>; Wed, 01 Feb 2023 11:49:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1dg+uXzaaDlrvsfZB5ZVYE69CBYsnyR8HC8FMGd9uOk=;
        b=mUdhzyCgYPNycF/3bkAMsoqXvQQ/tso4Texyq30NkVnpEYdcyRuKmzz2Rr9fp34Eje
         PStVXCIBfTeS/ewMRxcWIN0eZkpiwVz+K9wrlYOCPExPoX8XDqDeXpo/xdlz8Mb6P8yH
         rcBTRdi3v3r589fekBvveOZSmC7+ooKvp8fSGwL7tL9TYZnQkCuAxoflAaTlkZplc+kS
         eEtwnPc7zlSIS/pHv8ONU0y+IeI1t0HUSWZ8XxQfIZDEqXbwAz2erCpu4iuptmGQRHkV
         n2pvh7Je1PuerQguKUAuzrm4EdS0tWGOF8oz7CtrfidrPzyq9yyoll/nea+iLRYeDveu
         pE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:cc:date:message-id:subject:mime-version
         :content-transfer-encoding:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1dg+uXzaaDlrvsfZB5ZVYE69CBYsnyR8HC8FMGd9uOk=;
        b=1zS7jBVn1WFOMutLxkjKCy1GYt/kgQ1GJbU8Cd5F8xOfaGgE55Sxiv8TWs/y/zDYTg
         W7d9qsnAWKqkwpkN1gPifHLG6YRsKCikU34kMlLasHAtCXWqA7uHgDNOBNzJwVMg2iLq
         8kZGofnVt/BM50j0kvQxJl95rdAhfaZefZbqT5nlUaUPls5Syw3m0ZyD0rguumzA62wg
         1jozD47EQAdFICrvw36QsmPA2w5k/Fb9gb5gM/6yelTGbCuQv4RHURqtcJ5bG/REW4vH
         GI/mJiS88xHtYlHweYD0a9TzmQk8iTNk8Ldd+HK51kt9AP0Hk84WtsbjkpMgUYxx33Il
         CQdw==
X-Gm-Message-State: AO0yUKU58GL6x7x9wPagdUftY31nUsO+BvmqwAJVBk/9ENIWYyJqwfsE
	xiBZxN0MprygBilwhHcGU8tmGg==
X-Google-Smtp-Source: AK7set+GulbmfTJcMlD3KZbcW1D0M9MZZW397DAJ+hjZSoE0ohBkXfhXkx7rlEzwdgu1mqowUP6nKw==
X-Received: by 2002:a17:902:d415:b0:196:6298:6226 with SMTP id b21-20020a170902d41500b0019662986226mr3453841ple.49.1675280986263;
        Wed, 01 Feb 2023 11:49:46 -0800 (PST)
Received: from smtpclient.apple ([51.52.155.79])
        by smtp.gmail.com with ESMTPSA id q9-20020a170902b10900b0019608291564sm4015021plr.134.2023.02.01.11.49.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 01 Feb 2023 11:49:45 -0800 (PST)
From: Matt Evans <mev@rivosinc.com>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3696.120.41.1.1\))
Subject: [PATCH V2] clocksource: riscv: Patch riscv_clock_next_event() jump
 before first use
Message-Id: <CDDAB2D0-264E-42F3-8E31-BA210BEB8EC1@rivosinc.com>
Date: Wed, 1 Feb 2023 19:49:42 +0000
Cc: linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Atish Patra <atishp@rivosinc.com>,
 Palmer Dabbelt <palmer@dabbelt.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 Thomas Gleixner <tglx@linutronix.de>
X-Mailer: Apple Mail (2.3696.120.41.1.1)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230201_114948_125633_FF7CFD38 
X-CRM114-Status: GOOD (  14.02  )
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

A static key is used to select between SBI and Sstc timer usage in
riscv_clock_next_event(), but currently the direction is resolved
after cpuhp_setup_state() is called (which sets the next event).  The
first event will therefore fall through the sbi_set_timer() path; this
breaks Sstc-only systems.  So, apply the jump patching before first
use.

Fixes: 9f7a8ff6391f ("RISC-V: Prefer sstc extension if available")
Signed-off-by: Matt Evans <mev@rivosinc.com>
---

V1 -> V2: Commit msg tweak.

 drivers/clocksource/timer-riscv.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 969a552da8d2..a36d173fd6cd 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -177,6 +177,11 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return error;
 	}
 
+	if (riscv_isa_extension_available(NULL, SSTC)) {
+		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
+		static_branch_enable(&riscv_sstc_available);
+	}
+
 	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
@@ -184,11 +189,6 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
 
-	if (riscv_isa_extension_available(NULL, SSTC)) {
-		pr_info("Timer interrupt in S-mode is available via sstc extension\n");
-		static_branch_enable(&riscv_sstc_available);
-	}
-
 	return error;
 }
 
-- 
2.30.2



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
