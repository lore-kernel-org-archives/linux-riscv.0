Return-Path: <SRS0=WnC5=F2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42833C433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 05:34:07 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A918E23122
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Dec 2020 05:34:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A918E23122
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:Message-Id:Date:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CGJ1wpGkwdnG43qpe4L/G22iuRM92/mq+ISHFgfZTWU=; b=0/Idn2HB4D/8n5RWXSn4n0zqD4
	qwhcwnLYV2zBMTBgTfciXOuAZbc36ieNNoSrWjdhTn9HS8En+nDdEl2k6jpRmrmfDAGpFlk/j2tk1
	leaf+3Bi9gHY04zweYZ4eRCDSxDfVM8R9ynKW/XtO/HXmRthvJzODNPYtzqsPzyA5o9EGh+t8lJTG
	BjwxGuWS1mzmp81Fkepw7n39QukusdXNgWjan8qq5oSRMDn2CEQmUQNk5YsRZCjQZIHlU+6j+NcQy
	a3zDHWhfEs6eWos858JJTCNGCbr27eGmrFbcAVQcxn+cQNaw+vuBUTsIMkBS9aPJeWU9mRZn8Zu9I
	X6n9HK8w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kraJ2-0002sg-1h; Tue, 22 Dec 2020 05:33:56 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kraIz-0002ro-60
 for linux-riscv@lists.infradead.org; Tue, 22 Dec 2020 05:33:54 +0000
Received: by mail-pg1-x536.google.com with SMTP id n10so7664760pgl.10
 for <linux-riscv@lists.infradead.org>; Mon, 21 Dec 2020 21:33:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:mime-version:content-transfer-encoding:cc
 :from:to; bh=YUHAHbCI0drInzG6ELg3dNzK8EoYj1q2s5BJB3ePa6k=;
 b=mfoIMfTH5lPKKTgLC8+6cOI8s0gn4w1bAIST6om7gq0J+FRqknNgFnQMReL7PA6Moh
 o3xKvlyl5mZvTzJ51m4rIraymck6lybAXUHgMcDKKt3TbS8q779vvJ2L4nIrOxRkF321
 5duto+vveHCKWLil7dA69JaahAiu/8oww8g1J3HD1H3qduhdT+aCRuBYaCvCFcGe2BQS
 Ccsb+qsIEyk1io5osSV9yhMZR2cUfFFKY2c87Kabf5QJCnkMknMhwCQ9yOxQ7iyjm4Ob
 W61EmqJEtszqk7dijzU9j9NqxWeL5lwQv59LiAh5uDu4mKZVWWpNV1Vos6/mtfpaNUho
 p20A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=YUHAHbCI0drInzG6ELg3dNzK8EoYj1q2s5BJB3ePa6k=;
 b=H5KA2eLm26Ypklzt3B5E+x3d0buJZ7Dk6JXAbk5IgLIwR5MaJocZWHmFuzFF4TJhqE
 DGYGQErPO7D9NSbF27jsbQDWDSXEbg+r0A1yp86fovis/K/h8EupIGHLnw5EPo9pXRmx
 wM+GbFeEXrmWYqGNpduA1SS+2UHlugLIUuIuoxdbouU55sZVmEonoqtu8j9oy8I8BsVM
 BDNIDAgLfML9fOhWRwbEz+xl2A60n5D8f3pXJWbk2OrJ5Wm2d8OYR3lGZRlC8v5Axvbg
 UeEwiKlsS78y9KVLCrNQkUQmUALhKJ3hP7wGLPhgNXN077UqWDUtlZP8AxtQzlLDFmZA
 d5mA==
X-Gm-Message-State: AOAM532F5fU+1TyRlTQ9eo8OUGuaXGk7p+CAcyx3+BSTN71WIY4gmgJS
 WZ1ouz35mX4Yo84Hzcj61R0viA==
X-Google-Smtp-Source: ABdhPJy498vO/gKUa4ozY9NZj7sN3umFjDxqbk8GZR+n2Ua9kgSLm6fENuOvhUBCMwhkH9nSj9edGA==
X-Received: by 2002:a62:7586:0:b029:19d:9ba9:c1bd with SMTP id
 q128-20020a6275860000b029019d9ba9c1bdmr18355393pfc.27.1608615226660; 
 Mon, 21 Dec 2020 21:33:46 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id d6sm18702609pfd.69.2020.12.21.21.33.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Dec 2020 21:33:46 -0800 (PST)
Subject: [PATCH] clocksource: clint: Avoid remove __iomem in get_cycles_hi()
Date: Mon, 21 Dec 2020 21:32:30 -0800
Message-Id: <20201222053230.3229427-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.29.2.729.g45daf8777d-goog
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201222_003353_241812_4E5EB420 
X-CRM114-Status: GOOD (  13.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: daniel.lezcano@linaro.org, kernel test robot <lkp@intel.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, kernel-team@android.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

This cast loses the __iomem qualifier from clint_timer_val, which
triggers an sparse warning.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 drivers/clocksource/timer-clint.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-clint.c b/drivers/clocksource/timer-clint.c
index 6cfe2ab73eb0..83a8b38d46f6 100644
--- a/drivers/clocksource/timer-clint.c
+++ b/drivers/clocksource/timer-clint.c
@@ -63,7 +63,7 @@ static struct riscv_ipi_ops clint_ipi_ops = {
 #define clint_get_cycles()	readq_relaxed(clint_timer_val)
 #else
 #define clint_get_cycles()	readl_relaxed(clint_timer_val)
-#define clint_get_cycles_hi()	readl_relaxed(((u32 *)clint_timer_val) + 1)
+#define clint_get_cycles_hi()	readl_relaxed(((u32 __iomem *)clint_timer_val) + 1)
 #endif
 
 #ifdef CONFIG_64BIT
-- 
2.29.2.729.g45daf8777d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
