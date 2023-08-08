Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E714EC001DB
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Aug 2023 04:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7Pf6D8JUdLCsvU5JgQbEteErk790hs+qX9EFQotr9GA=; b=D9drJ73/PqPWEB
	96UtOuuQqj8ga/6CblJ4WzSptJwPuiK3mV5x+cccqcDtzjbcO3jndSPvLIYlDcEmqSc81u0P2hZUM
	pLszkr2F/OEDV11ma9WzfvwaZxVaKcSLwCSLymtMdXv8FyGDUmuR1T4uMst+7WOQZd7O30caUTzoU
	mwXxYtN1RytkuTM+gxTp9OQN8CfrZli6jfZarcoJV3+CbYeThhmt3qCoWcByOhW3nDSVti1U9Uw/I
	KU9ioic3B4XsMhUrVRXVxox8j19CUtDKjkzr1bJedNiiW8UVlDbppDQ7qXD0+2FQxxLkQkq+c4Iqw
	0JVumyLDCpbJeviSZj6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qTEhV-001jNE-0q;
	Tue, 08 Aug 2023 04:52:09 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qTEhR-001jMq-2J
	for linux-riscv@lists.infradead.org;
	Tue, 08 Aug 2023 04:52:07 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bc73a2b0easo9221045ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 21:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1691470323; x=1692075123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=babUiTuTO3XII8RrX4Z4hMs56Oti8JO2J40Ktf1kYkA=;
        b=KcNeVwtyGtbQqG22qs7W4efiRlniU/geyz8ruF0DcGVxI0tEQv91lfezECH/CBKhNg
         Uh6BxjyPBimrOq9BwS77+65IAK6adoNrsSH+fvRINNhrnYZ/bkUu4F0dJg5ujIaszbct
         U4awjW+2GtS7AeAPxSYc9sA5RewFYLWr7i1NyAcr7qgKd+tsJxSFBi7XjWreTnyd+nRd
         b4csJ2A7rf/2H1Vi/2bhrOVdHwAltdO2tzF+NJMpuj9yYnqjx/77/JIQtC3U5AF5tQyQ
         UcabBdx3fjBr6FAYcL42qdeJVa/7Mu1PGLcMylqWR9RWm+cNTeLGEHM15iAHIPO9b/fg
         2Zzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691470323; x=1692075123;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=babUiTuTO3XII8RrX4Z4hMs56Oti8JO2J40Ktf1kYkA=;
        b=buJpqyrwj895YBP4QZW1FUkDWy9xmr3nTVnBcReWBtz3ELTLWVUoBOcxL1rEXrwfHm
         LP09S+BZURxUVsK0SpJrWZOfCZoyV17m85jz9330aiy3ziyvrUotAaHLA53bwiPIKZZY
         7qnijO0eKIgbKP8RFT6998TZQMPUP+ybDLhv9AylnGp0uUDqcFrxCF0sPBdfRu8Stjjl
         TsaXxgTXyACX58GTgkIz2k/6Xa+BPENVOqp8uTEk6xArKv2WMpefyfP6lHpJjSYMgExD
         J7mO5fCorMkhQC3KnCJzIL4FAFSv1ujTrH9JNIjNWqLo/9iryd50xUOupQKcbIOAamrp
         nFmA==
X-Gm-Message-State: AOJu0Yy8F30EiWTywnqW51+dzI8rdksgnWp7eHIXEiod/evqPTfUPZN+
	ybUwMwcIHclj34/+2tj7/ffmOA==
X-Google-Smtp-Source: AGHT+IFaXi9wHjqFoxKys/6UFY5qNlD7CLWDafnLI9w3DlsPiqN5DMlgGYl4JYbjmS0etpmgbEqP0A==
X-Received: by 2002:a17:903:22cd:b0:1b9:f7dc:b4f6 with SMTP id y13-20020a17090322cd00b001b9f7dcb4f6mr11455373plg.44.1691470322938;
        Mon, 07 Aug 2023 21:52:02 -0700 (PDT)
Received: from Vincent-X1Extreme-TW.. (111-251-205-117.dynamic-ip.hinet.net. [111.251.205.117])
        by smtp.gmail.com with ESMTPSA id u5-20020a17090282c500b001b7f40a8959sm7837131plz.76.2023.08.07.21.52.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 21:52:02 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	vincent.chen@sifive.com
Subject: [PATCH] [RFC PATCH v1] clocksource: entend the max_delta_ns of timer-riscv andtimer-clint to ULONG_MAX
Date: Tue,  8 Aug 2023 12:51:45 +0800
Message-Id: <20230808045145.3552312-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_215205_786438_00D80091 
X-CRM114-Status: GOOD (  12.22  )
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

From: Vincentc Chen <vincent.chen@sifive.com>

When registering the riscv-timer or clint-timer as a clock_event device,
the driver needs to specify the value of max_delta_ticks. This value
directly influences the max_delta_ns, which signifies the maximum time
interval for configuring subsequent clock events. Currently, both
riscv-timer and clint-timer are set with a max_delta_ticks value of
0x7fff_ffff. When the timer operates at a high frequency, such as 1GHz,
this causes the system only can sleep for a short time. For the 1GHz
case, the sleep cannot exceed two seconds. To address this limitation,
refer to other timer implementations to extend it to 2^(bit-width of the
timer) - 1. Because the bit-width of $mtimecmp is 64bit, so this value
becomes ULONG_MAX (0xffff_ffff_ffff_ffff).

Signed-off-by: Vincentc Chen <vincent.chen@sifive.com>
---
 drivers/clocksource/timer-clint.c | 2 +-
 drivers/clocksource/timer-riscv.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 9a55e733ae99..09fd292eb83d 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -131,7 +131,7 @@ static int clint_timer_starting_cpu(unsigned int cpu)
 	struct clock_event_device *ce = per_cpu_ptr(&clint_clock_event, cpu);
 
 	ce->cpumask = cpumask_of(cpu);
-	clockevents_config_and_register(ce, clint_timer_freq, 100, 0x7fffffff);
+	clockevents_config_and_register(ce, clint_timer_freq, 100, ULONG_MAX);
 
 	enable_percpu_irq(clint_timer_irq,
 			  irq_get_trigger_type(clint_timer_irq));
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index da3071b387eb..b25c91d41968 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -94,7 +94,7 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 	ce->irq = riscv_clock_event_irq;
 	if (riscv_timer_cannot_wake_cpu)
 		ce->features |= CLOCK_EVT_FEAT_C3STOP;
-	clockevents_config_and_register(ce, riscv_timebase, 100, 0x7fffffff);
+	clockevents_config_and_register(ce, riscv_timebase, 100, ULONG_MAX);
 
 	enable_percpu_irq(riscv_clock_event_irq,
 			  irq_get_trigger_type(riscv_clock_event_irq));
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
