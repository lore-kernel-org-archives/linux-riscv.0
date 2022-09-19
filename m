Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A97C54EE9
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Sep 2022 15:57:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YnMPr6FSVXP2J1IjvdlBC8GD207hemKqqlMRs8NEW3Q=; b=c0j/1ehziID10c
	xw2Q7tz3q4cRLQIQfEpNsEMruJdXUTd8MJmRqaD2qxyfotXkbum1QKaNYehLqq6mpSI/RuOZa+tyQ
	/wbjgw08T2nt3CzSuJ2U2Yw6LxUFi4waYAW59Io3M1zWWUo+oYOaVn6V3EtNyn0gyduF+IDOZEhBG
	HqlsSBSScU53k5gG2m4Z9nnUm1e6QKcnAeakyFSIPkBRsetFaO73NAyupOyJg0b+Hywvm9B7OhPEA
	YnSllRZGwtLyzw+gxSd1/1sbOAgS+dncj161001OBl1ObLiCHAUpeddQxwjll1Em1WkTW5/kXs3uh
	o/s09sbnsI2P3CWQ75gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJ8s-00CgvZ-AL; Mon, 19 Sep 2022 15:57:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oaJ4H-00CfAp-I1
	for linux-riscv@lists.infradead.org; Mon, 19 Sep 2022 15:52:23 +0000
Received: by mail-pj1-x1035.google.com with SMTP id a5-20020a17090aa50500b002008eeb040eso6727392pjq.1
        for <linux-riscv@lists.infradead.org>; Mon, 19 Sep 2022 08:52:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=VG+RJJkr/1eR1dIR3SMuhxIbuyYkn8UpdJ3IYD59SVc=;
        b=dcbEYT2XZ0mPD0Y48wSUjSvJrqricZrWFiVHGwcLN5kZptAjndk6EUFcY/58wvP8ut
         9MxsbcF06UNYcefe5bXbmTvTMRU7xXpANgYzqibV3QxP7YhotuSkt0w8nG1B2F0w8XuH
         qnVuPhYE8IuyHmOAIGh2YD8vkUwOnhAU90JctVyWT0trWKu49xzXzwXCkqU3GWcHt8FM
         oK8BgRabq19MSiNcPthvYSM4nFtQkCMcehM0oM3k/wkyxSNjPH+zIbx6ZWBKn2lm7u4U
         O5ow8UdpjZhw6+jlFYaWDZ3TSi/7cM5pxUG1rpu42Yf/Gpykzo/0PC6Bu4XzO4Jj/XrL
         H4Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=VG+RJJkr/1eR1dIR3SMuhxIbuyYkn8UpdJ3IYD59SVc=;
        b=maDMzZDFNCh3pnIrV7voBzOsHVZ/e2lP9folevyYYcVghPIf3mtuLgUgGEJ0nXzgyp
         Xf1GbvHsY7gDSHa3JpE4Styox2uXHC8nj2Ikgt5PhB75cItGb2SnTMHXDTRfd6c5paWw
         456S+jc+C6qQyYUC4P9qcXcv9uMVcscC8jdf+D78E1rQ8lcfZx2MeG/6phu0/I8U1Tb+
         mdnwgkTjQfBqKXr1MXYeaEWTJIPNoyIDc3pAdb5fhR17ZzXKqu7Kw7fpEq60VuZa+ZmR
         vYMHNrhbzvtNq0wKTwZ7BUYlOYtEPORjUReE9lUMVclP1DXSzIcBuXoNPlRvgfRAF6mq
         XxYg==
X-Gm-Message-State: ACrzQf2RNmGPk+v7KTi+HFD3eAmWdyak4jPqYcGud3IX/DzS0xHNsZHL
	Mn7lhuNN6p2vsW8GjEVh99qgig==
X-Google-Smtp-Source: AMsMyM4vDQZ6MxG/v3H9a1Tv29fmOupsLMva8V9mDbgTYGVruyUaUvDDavINpIJ4IJ9dkjPWpK+GsA==
X-Received: by 2002:a17:90a:f3d3:b0:203:182b:9cd9 with SMTP id ha19-20020a17090af3d300b00203182b9cd9mr20337645pjb.41.1663602738971;
        Mon, 19 Sep 2022 08:52:18 -0700 (PDT)
Received: from ThinkPad-T490.dc1.ventanamicro.com ([103.97.165.210])
        by smtp.googlemail.com with ESMTPSA id n3-20020a170902f60300b00174c0dd29f0sm20741717plg.144.2022.09.19.08.52.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 08:52:18 -0700 (PDT)
From: Mayuresh Chitale <mchitale@ventanamicro.com>
To: Atish Patra <atishp@atishpatra.org>,
	Anup Patel <anup@brainfault.org>
Cc: Mayuresh Chitale <mchitale@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH] perf: RISC-V: fix failure for custom firmware events
Date: Mon, 19 Sep 2022 21:22:11 +0530
Message-Id: <20220919155211.14453-1-mchitale@ventanamicro.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220919_085221_640346_71C3B722 
X-CRM114-Status: GOOD (  11.92  )
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

We can have SBI implementation specific firmware events in addition
to standard firmware events so we should not check firmware event code
against any limit. This patch removes the check so that programming
of the custom firmware events can be supported by the driver.

Fixes: e9991434596f5 ("RISC-V: Add perf platform driver based on SBI PMU extension")
Signed-off-by: Mayuresh Chitale <mchitale@ventanamicro.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/perf/riscv_pmu_sbi.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index 8de4ca2fef21..df044292615c 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -381,11 +381,8 @@ static int pmu_sbi_event_map(struct perf_event *event, u64 *econfig)
 		bSoftware = config >> 63;
 		raw_config_val = config & RISCV_PMU_RAW_EVENT_MASK;
 		if (bSoftware) {
-			if (raw_config_val < SBI_PMU_FW_MAX)
-				ret = (raw_config_val & 0xFFFF) |
-				      (SBI_PMU_EVENT_TYPE_FW << 16);
-			else
-				return -EINVAL;
+			ret = (raw_config_val & 0xFFFF) |
+				(SBI_PMU_EVENT_TYPE_FW << 16);
 		} else {
 			ret = RISCV_PMU_RAW_EVENT_IDX;
 			*econfig = raw_config_val;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
