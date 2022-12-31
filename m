Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDCBDC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Dec 2022 05:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pNVdFhE1/OkWLD8QcbqeEiGDUjQGqjA6G46oTeJQaxo=; b=AS8cOvLCcj2jdz
	UINrnGbT+MarsH0ulDZO5sYEKb8yqqtm19/EHyyMg20QQ9wjjVcpL3smnxtw0ZHSkLmaiO6fXfn6z
	50joTbqT5utH/MGXwlGbV7T5SCNcgzGPRqQsXZud8wHuc/BvMshw2ulQ17GHAj/aF4JdtglU7ZY9C
	fCuHahVx4Cmt6YSJtFL2pbADnxHJmecdskvSXeQoNwZHUszK5jHtrA3nTaCmT+Yq0UGgfJbSW775q
	eyQd6/OJWTOYeJRdc5RMYRL6/hI7P5S3CZhHwjBmfWLbxd1Z4QoOv+zLK/HL9GK62X1EGXrWjp4vW
	VpC2r9IXBUxNFmbF1pog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBUPd-000rtI-Vp; Sat, 31 Dec 2022 05:28:06 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pBUPX-000rkl-Qn
	for linux-riscv@lists.infradead.org; Sat, 31 Dec 2022 05:28:01 +0000
Received: by mail-pj1-x1035.google.com with SMTP id j8-20020a17090a3e0800b00225fdd5007fso13674676pjc.2
        for <linux-riscv@lists.infradead.org>; Fri, 30 Dec 2022 21:27:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qvXUYwi5ZyU74DKdX9d8zZyO8Ta/Eto0kB/925S6woI=;
        b=eNVSgI8Iffys1qMsVkR5qdhv5aDN9L6WgHnk771KmegnIxIojGrOuyoK/H7l8rlrbe
         z0JsinNRo5iAZWKrEsqQciRzTfvRVJgkoU+6yj+lRCms6MsO96Dk8b1OweA28AWQ2yXt
         amtxjM4FZx0K5IU7pwXWQoEBARvZH9eB/XAwfkIpcfcEzgoSS6zW0PMOEmAm1mvgbnuA
         0Le//8Qj0wF2vhZ7Gn77N5TDY4GFreoykrkMxUn2vQrnSwnOFdYXiGC3Prvz8+NNRTLh
         jYTVbxpg5Y1eiDnab3Q7O1Oe2zt5yiT2BHkJ6RW/N4BPQ9x4SRw4xvSUxCn0X/BL44m+
         8FUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qvXUYwi5ZyU74DKdX9d8zZyO8Ta/Eto0kB/925S6woI=;
        b=vI0K5aWH31AnA28t6swmftlKnVvMht8CT0hDBsxjNF2djSKKlx/3n++lqMVGavVetX
         DiS9beTg7vgGZZ4tm3SLLwL7gDuKt00LT54cTHLctQPV3q7ScmM8XtbwRKlJ0vJpqBsd
         OVnwKy908FC58YyEKsMrwNy/3r/JlKgCxVm484hfS5Y5ea5TYoZqkUVk+MkcdUiluxcO
         HvKI2QFcud2xB7BRe2Tf1ceSUIUDRhHJSwxHCq8IkI/sydRuIyoWQVApTVFwZeiF4Je/
         /dsKEIyidnPIGDdJTQ0hgcxkn7vzOSh+udzfr4g4T/v6OIypG3CRSD/twbnhScgVNwk2
         yLaQ==
X-Gm-Message-State: AFqh2koOzBP7EuZYlLLoqDBvH84w3gjZwvtatgH4J/kRVOPBQrTINWbT
	TbUOp7T7rFUaq8W5/rBPzTR+Tw==
X-Google-Smtp-Source: AMrXdXsGSF4DED03XvcK7I2wPfr7RidesmY8h4auVFQgGrgKL5ewV9ZB6jZlmLnBYUDjvl/EKf/KIw==
X-Received: by 2002:a17:903:40cb:b0:192:8502:77f9 with SMTP id t11-20020a17090340cb00b00192850277f9mr18853159pld.27.1672464477035;
        Fri, 30 Dec 2022 21:27:57 -0800 (PST)
Received: from hsinchu26.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id c16-20020a170903235000b0016d773aae60sm15836612plh.19.2022.12.30.21.27.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Dec 2022 21:27:56 -0800 (PST)
From: Eric Lin <eric.lin@sifive.com>
To: peterz@infradead.org,
	acme@kernel.org,
	alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	namhyung@kernel.org,
	palmer@dabbelt.com,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	Eric Lin <eric.lin@sifive.com>
Subject: [PATCH] perf tools riscv: Fix perf tool build error on riscv
Date: Sat, 31 Dec 2022 05:27:31 +0000
Message-Id: <20221231052731.24908-1-eric.lin@sifive.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221230_212759_976264_102ED107 
X-CRM114-Status: GOOD (  11.08  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Since the definition of 'struct perf_sample' has been moved to sample.h,
we need to include this header file to fix the build error as follows:

arch/riscv/util/unwind-libdw.c: In function 'libdw__arch_set_initial_registers':
arch/riscv/util/unwind-libdw.c:12:50: error: invalid use of undefined type 'struct perf_sample'
   12 |         struct regs_dump *user_regs = &ui->sample->user_regs;
      |                                                  ^~

Fixes: 9823147da6c8 ("perf tools: Move 'struct perf_sample' to a separate header file to disentangle headers")
Signed-off-by: Eric Lin <eric.lin@sifive.com>
---
 tools/perf/arch/riscv/util/unwind-libdw.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/perf/arch/riscv/util/unwind-libdw.c b/tools/perf/arch/riscv/util/unwind-libdw.c
index 19536e172850..54a198714eb8 100644
--- a/tools/perf/arch/riscv/util/unwind-libdw.c
+++ b/tools/perf/arch/riscv/util/unwind-libdw.c
@@ -4,7 +4,7 @@
 #include <elfutils/libdwfl.h>
 #include "../../util/unwind-libdw.h"
 #include "../../util/perf_regs.h"
-#include "../../util/event.h"
+#include "../../util/sample.h"
 
 bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
 {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
