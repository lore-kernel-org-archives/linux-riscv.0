Return-Path: <SRS0=3Oe1=PR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3618EC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 12:39:51 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EB4466113E
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Oct 2021 12:39:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EB4466113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YlS1kL3xVjQ5wCcjwJIW1GmqtFYuEpMcU2nS1ZBTBI8=; b=OCoCeQGpA3X1B9
	wvxKOD3nc6IJbtPGI28fON3i8wFYAOPlGduvDmG5EitsbF20laLcgYzzYe6KpUVfwm5wtQHbLv2Df
	qIPzOKFP/9ddvWL6UtxjnJoeY745cWoXmXPhIgbowDK+60PaCCOPIh9DCMmYXL/TiJC6/aMMuedNY
	49yyLvqiebwiO0FQXkyVBz6pudiLRdGQLgLCx2y6YC064LyUJyKBiZeblvtt257LYXRPICr+AsXQt
	u/J86nzJBIM07qypzSaqtzfLww4/rUwpdT23wRfswzzWzrUHazitrljREEJuRx/xj7h3jBqypoXfF
	FGgYAVnTDYlizAe+NCnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mgRAe-00AwW9-2c; Fri, 29 Oct 2021 12:39:44 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mgRAP-00AwQH-JW
 for linux-riscv@lists.infradead.org; Fri, 29 Oct 2021 12:39:32 +0000
Received: by mail-lf1-x129.google.com with SMTP id c28so20714437lfv.13
 for <linux-riscv@lists.infradead.org>; Fri, 29 Oct 2021 05:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2T3v4jXO25JT49qo2reiE0rneUAVuElVzG5JppoEM8=;
 b=jxD6biwTfe3xu6SqBzLET7VGwK1z+O5kXXr9D9ld+3oXexNknMqaFCW9F2LVUIXD+G
 ucuVD7vOA4sZwbtUVVm7VzO3veKFGjRJHKI0vsCgqedXMckkcCuS5RX2luse2sdk1Twa
 WBDj6uMCqZkJ/KYciN73SIqRqEBtCSDSF63zmsvalZsfnmh4tgcEAgjPi9ilrgDdWMVb
 ZEJT/Qe6glvFD7+mxzhPkUnG56DeqPTqZIJn0EwzCL6fb0mJg+J37Y3J8rVtha2bb88g
 FhnpS+0RzDdrfPrw09Zk0fIpd8IvICd3VoueJ91jfIvaJiW7UN68emvVY/bbOQyolIXI
 WutQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=B2T3v4jXO25JT49qo2reiE0rneUAVuElVzG5JppoEM8=;
 b=EPQ/t54WdsLl59Y8/srJO9MVgqvveOxJNitwgHHKxwSItUBrl1zdSW/nQuqUObywog
 vV6bwK+t3t+ywepV58LQCOw3v3cR/5Ztal+/gJ8aGaulbfayU0jL55YuQ6PoJDYF0diw
 86cCCfQmZQbvYDIy1XfzRK+p1iYp/x39mW5eDY1IW2ryjhSpX1eBS6crWP8p1QKb2zAQ
 Ypi9Tc7J63TowzyM2D+jVVvmCgeqOQ23Cv99IDZuhmqoJAz4CTQLnxehjrMbLcSbNsbT
 WAmH3RLPG3xsC1ZR//LJQzYc8ucFJ7bTDOtYAh741CenDawbjRT7nzbYlZvPvEdqgSRr
 zflg==
X-Gm-Message-State: AOAM530bOl1gky55NlNWT2BS+iPGEwGHFmOYU7w+gwR5XnzD+kh6J7Ri
 O7jojo7N8en+2Lj+lrq1iTF7dw==
X-Google-Smtp-Source: ABdhPJyTjynt3OjUbfPQGjnjOlAGOKmxPdHzyoRf35p2/vo3MySu4coNCsQpIc9on1MRDnXuPapytw==
X-Received: by 2002:a05:6512:2309:: with SMTP id
 o9mr10050460lfu.124.1635511166794; 
 Fri, 29 Oct 2021 05:39:26 -0700 (PDT)
Received: from localhost.localdomain (h-155-4-129-146.NA.cust.bahnhof.se.
 [155.4.129.146])
 by smtp.gmail.com with ESMTPSA id y35sm602528lfa.16.2021.10.29.05.39.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Oct 2021 05:39:25 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rafael@kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>,
 Daniel Lezcano <daniel.lezcano@linaro.org>, linux-pm@vger.kernel.org
Cc: Maulik Shah <mkshah@codeaurora.org>, Anup Patel <anup.patel@wdc.com>,
 Len Brown <len.brown@intel.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Ulf Hansson <ulf.hansson@linaro.org>, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] PM: sleep: Fix runtime PM based cpuidle support
Date: Fri, 29 Oct 2021 14:38:55 +0200
Message-Id: <20211029123855.80344-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211029_053929_675145_9E3CF666 
X-CRM114-Status: GOOD (  12.60  )
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

In the cpuidle-psci case, runtime PM in combination with the generic PM
domain (genpd), may be used when entering/exiting a shared idlestate. More
precisely, genpd relies on runtime PM to be enabled for the attached device
(in this case it belongs to a CPU), to properly manage the reference
counting of its PM domain.

This works fine most of the time, but during system suspend in
dpm_suspend_late(), the PM core disables runtime PM for all devices. Beyond
this point, calls to pm_runtime_get_sync() to runtime resume a device may
fail and therefore it could also mess up the reference counting in genpd.

To fix this problem, let's call wake_up_all_idle_cpus() in
dpm_suspend_late(), prior to disabling runtime PM. In this way a device
that belongs to a CPU, becomes runtime resumed through cpuidle-psci and
stays like that, because the runtime PM usage count has been bumped in
device_prepare().

Diagnosed-by: Maulik Shah <mkshah@codeaurora.org>
Suggested-by: Rafael J. Wysocki <rafael@kernel.org>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v2:
	- Moved away from using cpuidle_pause|resume() to solve the problem, but
	instead just waking up idle CPUs is suffient, due to other recent merged
	changes.

---
 drivers/base/power/main.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index ac4dde8fdb8b..2fb08d4f1aca 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -1463,6 +1463,7 @@ int dpm_suspend_late(pm_message_t state)
 	int error = 0;
 
 	trace_suspend_resume(TPS("dpm_suspend_late"), state.event, true);
+	wake_up_all_idle_cpus();
 	mutex_lock(&dpm_list_mtx);
 	pm_transition = state;
 	async_error = 0;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
