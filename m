Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37A6BC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 13:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SuJg8dX3fMHzUpwU3WustWyWnOr7TJ3qww/zlkjhZ10=; b=21z5HtLo43RbMj
	EAv9yBxxYleJDRPuC5sBinq9aD5T4j2Jyvb4parvZfcrNmIrpfoh4R7lVe59CyiSRJGp2PFeodPNV
	JNRfSLk+k+rOWhbMIffjLkElHMDIkIMuHGIxLp611nr+xJNytlVwsPUPrYuuIpmN7L8S5cleuer+q
	aTK7hsRF4klxRBlFFoQDjYgGpI2rDDosm0wjoU+520ACfLoJGsUbIoxgrWgSdHbDVRXlEzhniOtUz
	5b0gZXHhD5kdAFLHhm8+6N5ghC8UNFG0SfI8hy7qBBpY7LroOa7voEOTSGJTP4OA5Cl3Xi5eXv2lR
	66q9ZIcI1IgvsH13tl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jq8-002X19-Es; Fri, 24 Jun 2022 13:59:16 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4jq3-002Wyp-Jj
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 13:59:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id f39so4669999lfv.3
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 06:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=V9S0bxS6LLivfcCzNuQd6AQUcLLtKRJg34fWBBXn5Ek=;
        b=gB3BKKlBXEMfeLEroziQqikBIs3bGucFUEHJr61w9x5wOO/zumhjOmuVoViKWVX3M8
         sAXBZ2J9fupjfAHpZi5q5rS/+AFFc8tuJhqki9YwPR/awcB9zNentNaAHx9eYw+kFiNl
         2ofRaz7D70CGzr91BuGmnrzEoTjPNaJKYuY2MQ0UsUGvQrWA1NjbQZu5reXVy0RW7vtD
         KrSCbg5EK8rJe6aNrgIyluYD8HW0+VsuEo65W60fYq8Vf/xe0lgYA4M29ePrSqMGkPgQ
         kDpepkhiteaNeBgQd/GU9IsIMemHWyktxnodJMWA0FNIWozSmUcH5O3l2ruZ7qOR2T4r
         ha+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=V9S0bxS6LLivfcCzNuQd6AQUcLLtKRJg34fWBBXn5Ek=;
        b=F6QkdalhUVwD8w6CXOpy9rgyAnbRDYzDDa3+60QXexpPj0y/94hEKz+X2wwQB0bPIU
         A3JgeldrlK6lKV4IDO9eZqb5CsNAVMVmMf5VyQ+IU0iq4RpfEH16GHI+DCmwQNpVVy/B
         RI4UEzgRZDecsUbWtw/2nYOtnplH5HjB5USujFlXYzbyZ117itENN8RVNf8tetv/rI0Z
         O9WJaBcnLjGHbZdF3sJAE/h1jTMy1eSEcrIFnA0d1O+tUz6tcJAXNu1B2iYrzPQ5D5Um
         coVC28Xl/XfqPSsjnI0OyBk+lieKx6Bg02K80ncH9beaUfeGEAC61MzJhSjdPq+Ga2fO
         5jbg==
X-Gm-Message-State: AJIora8eCYOirRWUDSGyofwGEpCdcvOoYmOG6vy4pIoeyIegVr2WXjVS
	VrJlus28vEjWrKoIqOAGnjN50RaVq4HAjw==
X-Google-Smtp-Source: AGRyM1uaeE2tp7988s0bgm69k/DKDX8gmYw5crB64EZu85x2NgozNI+rcVO7LKj0liOkZsgaTXVtPg==
X-Received: by 2002:a05:6512:11c4:b0:47f:2356:8ce2 with SMTP id h4-20020a05651211c400b0047f23568ce2mr8828300lfr.365.1656079145338;
        Fri, 24 Jun 2022 06:59:05 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
        by smtp.googlemail.com with ESMTPSA id p14-20020a05651211ee00b00477cb9b8762sm385762lfs.50.2022.06.24.06.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jun 2022 06:59:05 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: linux-riscv@lists.infradead.org
Cc: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>,
	Sergey Matyukevich <geomatsi@gmail.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: [PATCH v2 1/2] perf: RISC-V: fix access beyond allocated array
Date: Fri, 24 Jun 2022 16:59:01 +0300
Message-Id: <20220624135902.520748-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220624135902.520748-1-geomatsi@gmail.com>
References: <20220624135902.520748-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_065911_686420_ECFDD03A 
X-CRM114-Status: GOOD (  16.37  )
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

The root cause could be related to the interpretation of the number of
counters reported by SBI firmware. For instance, if we assume that unused
timer counter with index 1 is not reported, then the range is correct
and larger array needs to be allocated.

This is not the case though since SBI firmware is supposed to report the
total number of firmware and hardware counters including special or
unused ones like the timer counter. So just fix the range in for-loop.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
---
 drivers/perf/riscv_pmu_sbi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index dca3537a8dcc..a5d25b51beac 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -457,7 +457,7 @@ static int pmu_sbi_get_ctrinfo(int nctr)
 	if (!pmu_ctr_list)
 		return -ENOMEM;
 
-	for (i = 0; i <= nctr; i++) {
+	for (i = 0; i < nctr; i++) {
 		ret = sbi_ecall(SBI_EXT_PMU, SBI_EXT_PMU_COUNTER_GET_INFO, i, 0, 0, 0, 0, 0);
 		if (ret.error)
 			/* The logical counter ids are not expected to be contiguous */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
