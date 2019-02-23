Return-Path: <SRS0=x6/5=Q6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D8EEC43381
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Feb 2019 13:08:59 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F205220675
	for <infradead-linux-riscv@archiver.kernel.org>; Sat, 23 Feb 2019 13:08:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="N67fHgyD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IwFsOfX9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F205220675
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	In-Reply-To:Message-Id:Date:Subject:To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=UXI3uaF5tVjBwnX3yrEuyoYJSJKRvDReDMwUaJCoU04=; b=N67fHgyDcXAyAX2k9zxxAvZ6ht
	MAzc7cpafV5SLJ2sLoiq5R1YW2UixhFQ9/dmx+yRoEwZnh+MzRhH1CVy8XEsUeVUtWvsK/ifofPns
	a7heewVimG4J+8+z8duqM7yBvEzVGuxnUscBAjnZMgbUyTZzxyzWazxCQlWmymZKc06egMchTQQCU
	9eckAgeSPd0ckL050wDYYLDs6Qt2TyxMqFRGxrifupCaWfRCDLETzydqeV56jnwv1Lr+JFF9R9Qxh
	LybCqebCATvR/4BLINLrez9ywPBk77bfwjB0pQgmayK0wlwf+Q24+KS2Gj90u9dfXyK7LmQ/jwR3M
	PKn/dVww==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxX31-0002Gv-1f; Sat, 23 Feb 2019 13:08:55 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxX2E-0001Kv-NV
 for linux-riscv@lists.infradead.org; Sat, 23 Feb 2019 13:08:12 +0000
Received: by mail-wm1-x341.google.com with SMTP id j125so4275738wmj.1
 for <linux-riscv@lists.infradead.org>; Sat, 23 Feb 2019 05:08:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=FvWbQwT7yD0J6wXiJv9iSEtwBLiuq9ZwuzA1XeKrA9g=;
 b=IwFsOfX98LVVF+r7B8EMzjeW6rylRGOIFvg/d1eTz8NQWX5DF2V0ksBTYDYAo9pKRm
 oZ9ycTByKDlmw5uywBGZH1GzlmrQToRsQEq4uz8L6EX4XvUbEHGHtWlGX540oZaB5OFK
 s3oKIVSQ71Hc7brd87dYmPE84xFwU5RPM/j3ht/ljkSWwm65jWXyKbvaMQP7kRbbG0cs
 tR/rwvkPFHQI21Wc90u3M41xkavzkyTAC1DCRcSxjDGfhjlrwE08/zmVDgcjWIznom3G
 rhdPt6QwydZbX3+fvqcxMC/3HpfZtTpFwURHceq+80/6Y45hdAkHVQnZ+WTBUF/1YaWS
 MQdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=FvWbQwT7yD0J6wXiJv9iSEtwBLiuq9ZwuzA1XeKrA9g=;
 b=igemVE2wAE1ejnR+SiCASLTv0wSlrqtAHRM+pu6pE67WpGri+cb57oz8mnlzHkgZCo
 RUxQYJ/T1ItDgIwjyqU6Azeea1OGqQ96piwOlaoyFn343YECyrxWTnuBkFDSxCyCuAGr
 Zk6OXFmf5XTDmXcxG38IaFlOdfSdhMqhNHk9lzUXGoxyBBioWDS8a5tAsAHcR3u/tJLp
 dhaNNdjyYgLmNwoMJXPyyD5ORde7HBrTXBuMrI7Q5clZtUekGjMroeBFy8hX6L1yifQZ
 +2hci6h2ZcRS48tUUvqNt/CtIMAxFwgAO7sIo6JysdVVFMdhvJfAjVFLo+X4+/HyZA8c
 TSNg==
X-Gm-Message-State: AHQUAuZjviaEutsCA+uaDCM0+fCretrsdHnI3AgwMbtQVaT2JrrqRBat
 /f1J44fHCWVWcIhpRHII+rZ1cHbtzD8=
X-Google-Smtp-Source: AHgI3Ias4KcVPoc17ozN6m5RJJSZcPhaaIFTt5CqkYQhqOaBZ+y9ug5Nv4yZQD5V3FVg4SQT75Hy5g==
X-Received: by 2002:a1c:2743:: with SMTP id n64mr4706807wmn.143.1550927284690; 
 Sat, 23 Feb 2019 05:08:04 -0800 (PST)
Received: from clegane.local (189.126.130.77.rev.sfr.net. [77.130.126.189])
 by smtp.gmail.com with ESMTPSA id i12sm7830746wrq.21.2019.02.23.05.08.03
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Sat, 23 Feb 2019 05:08:04 -0800 (PST)
From: Daniel Lezcano <daniel.lezcano@linaro.org>
To: tglx@linutronix.de
Subject: [PATCH 07/18] clocksource/drivers/riscv: Add required checks during
 clock source init
Date: Sat, 23 Feb 2019 14:06:55 +0100
Message-Id: <20190223130707.16704-7-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190223130707.16704-1-daniel.lezcano@linaro.org>
References: <b5d75b05-b78c-535c-2b35-9a1f5a3a853f@linaro.org>
 <20190223130707.16704-1-daniel.lezcano@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190223_050807_334053_18A4D560 
X-CRM114-Status: GOOD (  11.76  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 "open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

From: Atish Patra <atish.patra@wdc.com>

Currently, clocksource registration happens for an invalid cpu for
non-smp kernels. This lead to kernel panic as cpu hotplug registration
will fail for those cpus. Moreover, riscv_hartid_to_cpuid can return
errors now.

Do not proceed if hartid or cpuid is invalid. Take this opportunity to
print appropriate error strings for different failure cases.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/clocksource/timer-riscv.c | 23 ++++++++++++++++++++---
 1 file changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 431892200a08..e8163693e936 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -95,13 +95,30 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 	struct clocksource *cs;
 
 	hartid = riscv_of_processor_hartid(n);
+	if (hartid < 0) {
+		pr_warn("Not valid hartid for node [%pOF] error = [%d]\n",
+			n, hartid);
+		return hartid;
+	}
+
 	cpuid = riscv_hartid_to_cpuid(hartid);
+	if (cpuid < 0) {
+		pr_warn("Invalid cpuid for hartid [%d]\n", hartid);
+		return cpuid;
+	}
 
 	if (cpuid != smp_processor_id())
 		return 0;
 
+	pr_info("%s: Registering clocksource cpuid [%d] hartid [%d]\n",
+	       __func__, cpuid, hartid);
 	cs = per_cpu_ptr(&riscv_clocksource, cpuid);
-	clocksource_register_hz(cs, riscv_timebase);
+	error = clocksource_register_hz(cs, riscv_timebase);
+	if (error) {
+		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
+		       error, cpuid);
+		return error;
+	}
 
 	sched_clock_register(riscv_sched_clock,
 			BITS_PER_LONG, riscv_timebase);
@@ -110,8 +127,8 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
 	if (error)
-		pr_err("RISCV timer register failed [%d] for cpu = [%d]\n",
-		       error, cpuid);
+		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
+		       error);
 	return error;
 }
 
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
