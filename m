Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94CECC83F33
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Sep 2023 07:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BAJpTH/1bypf0u73NKk4jVUnfXZHHUSt8SIkxq6ITsI=; b=1kXB6tpBvjiOwt
	FGgyM/gtyjxgpPZsTLGGT7zi6pWmR6L+hp3RsEBvctvKhr+JArAo/Iq3jSNFBbc6N0YX0sY8cHNbK
	Uyuhs67lmmn6hcvHRtoCm4HLyHtdeRX7srh3T9dUyQhdOfhIj0MLUA0IJWHbvXg6d6UcV8a3/iXq4
	apYY2GGpG3nR0kpYpMjl6p91rj4Ybbp2eolLWsLJr6Xz02T7QrvRYxL+xXC9UkYE/zMLPDuSvstLM
	iuYGQks2qzbm4Vs6BmLd2FJ6qsM1C/i2Gj1DeTJ7gMrZN5FRqyxeNRYuRoUrGJQgprPRVW8wOluub
	/zNxquj3VBaeOokgkXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQCC-005Qjf-1A;
	Tue, 05 Sep 2023 07:09:56 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdQC9-005QjK-1N
	for linux-riscv@lists.infradead.org;
	Tue, 05 Sep 2023 07:09:54 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bee82fad0fso12336095ad.2
        for <linux-riscv@lists.infradead.org>; Tue, 05 Sep 2023 00:09:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1693897791; x=1694502591; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A/t6gia3kis5Pkr4/PDqi3tggIgG29f6OdAUFBmTTOk=;
        b=kc736FawpmT0MLpkXRu/Wt/agrkGZ5ht4FR7FaI3jdlCK+yCV9TxFVsjeyIgpZAbTE
         WmmVVDPJdp2sKr05irhBFjwCO8qgWRPSLe/J2nxcyxyegfNMGsY7v/5XtTaedjP3UYcm
         1p1X2j8waGj9aRdzgcbEUeVTEH+XwKVQf+8EELLADnt9GGQ8bkS1fsAdgOmUkba7ohJo
         PF2NPZLmMTh/lnS8G1BF/J/V1hqMbqonBj46B4V6J9NJUO0iBK29nBTHd42etjHXm8t4
         HqntudTQB21KXH/l3VXIbLdyP1I13/CI1owSKb8k5srTJGzEOW9byWooarAztjjNUqnd
         yfPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693897791; x=1694502591;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A/t6gia3kis5Pkr4/PDqi3tggIgG29f6OdAUFBmTTOk=;
        b=g0ndKqDVvfQmQZD84CW8/IKNkRCZDp50xaKGTu1FcahtRyyVg+TzONWLfhLmVZ6vUN
         xvgLmB/OVbx8dOv3IEgYhKyg/usbmDoRBPqbHscdIoxd2gc7H5iTh4nN3Fa/72iHo/nV
         0U6rAxJkDz7dfuPdYdXJA+M7LbcdROwjicPOchPyWdIQHu/YtI8U80lfg7GWhKxdKH1E
         Rg7VOHXYHircnMt3iVvqkLUfb99II7EOrtIS5LbX6zGi1FTFwi0+FtImMhbMEn5H5EJr
         tITacOhB8LrP0y5u1Q6BtwSj9gMSN1ZC7g5NCMuOmdPJZ6XcMEDLmBUNLcNqfnj3lMgn
         7HFQ==
X-Gm-Message-State: AOJu0YwglBh7BuuyuoTOyM06q682KkRWayUZ2q632l2jQNAxbLTR+rZ4
	Vuv2xE/4JQ6ZGlJULdLd5CpBeA==
X-Google-Smtp-Source: AGHT+IFg5mjDF/xLoT8UBfYSdSyH069wYXbqbw5XRMPo3JKPzr9PBc5B4a/NsjiR4eXCDgNdqiCezQ==
X-Received: by 2002:a17:903:183:b0:1b8:865d:6e1d with SMTP id z3-20020a170903018300b001b8865d6e1dmr12529712plg.51.1693897791009;
        Tue, 05 Sep 2023 00:09:51 -0700 (PDT)
Received: from Vincent-X1Extreme-TW.. (111-251-205-31.dynamic-ip.hinet.net. [111.251.205.31])
        by smtp.gmail.com with ESMTPSA id m1-20020a170902d18100b001bf5c12e9fesm8613213plb.125.2023.09.05.00.09.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 Sep 2023 00:09:50 -0700 (PDT)
From: Vincent Chen <vincent.chen@sifive.com>
To: daniel.lezcano@linaro.org,
	tglx@linutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	vincent.chen@sifive.com
Subject: [PATCH] clocksource: extend the max_delta_ns of timer-riscv and timer-clint to ULONG_MAX
Date: Tue,  5 Sep 2023 15:09:45 +0800
Message-Id: <20230905070945.404653-1-vincent.chen@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230905_000953_557011_5D62CFC5 
X-CRM114-Status: GOOD (  11.89  )
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

When registering the riscv-timer or clint-timer as a clock_event device,
the driver needs to specify the value of max_delta_ticks. This value
directly influences the max_delta_ns, which represents the maximum time
interval for configuring subsequent clock events. Currently, both
riscv-timer and clint-timer are set with a max_delta_ticks value of
0x7fff_ffff. When the timer operates at a high frequency, this values
limists the system to sleep only for a short time. For the 1GHz case,
the sleep cannot exceed two seconds. To address this limitation, refer to
other timer implementations to extend it to 2^(bit-width of the timer) - 1.
Because the bit-width of $mtimecmp is 64bit, this value becomes ULONG_MAX
(0xffff_ffff_ffff_ffff).

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
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
