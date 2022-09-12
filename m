Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A985ECAAA1
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Sep 2022 08:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=umcYFFw+WWy6r1OSwM+Liivra1kOWdHw6ZTZfIkWX4c=; b=HLwNnQ20u5q3BI
	TflyJrGe2KWIFRlaZaCD0fmfh5mqKJ0Zq9qT0clwuQNTrHkD0Msyor9g3gTJpohh+EVsxHxtVoSoS
	9/NBcwvHfIpfoRY0SIVGAtloqPuQ4mrHdT0Wr2ZmhjQbdHtK/MSanWIEWUvgcp0dc4DDacb3F9Z7G
	joHjcBDZoiiuy+4xDGf5umHuCshwrDs6UsWF8AgqYfjRvz6b4Lko9oA0lQ9BZZxbp7pvuMl9F7gUr
	xIpr7irwefE8Jfijwrh7PmeRYbl86MgfRxBZ9dSRTiXFbFdQCzshIWFJznELz5x8JkP/88sR7KHiF
	dEGWHUs9TN1pBeyaP47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXeMv-007esW-0a; Mon, 12 Sep 2022 08:00:37 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oXdHN-007Jor-D5
	for linux-riscv@lists.infradead.org; Mon, 12 Sep 2022 06:50:51 +0000
Received: by mail-pf1-x42a.google.com with SMTP id z187so7675822pfb.12
        for <linux-riscv@lists.infradead.org>; Sun, 11 Sep 2022 23:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date;
        bh=6Xe3R/apOfj9yPTgHstXk1duLFBJjDM/Rtwt0f9H5Eo=;
        b=LanQLFvf6RQo3FztPxAXUGZuOt8XUCf0383mzuu7l36i5lBuVM7bi3iPqfx+wzmfyi
         uAlDr3GoCXquZqHzwvBrhDMXi0YtylvsZwA7YId+/ApLY1U5XJj0rN/I5QmWb3MuF4mC
         m9sgzjS2xK2t+nt4fHR7dRPUE0LxTuedAV6S5+a94szVmhw/tch7jvfdX5N8jMUoRye8
         xz0O7JnDIoV3PayCrYsZ7jYT5OP6Jd7Kh3ndLlupvIYW7p5AByJ1ucJyzKvsKrhNusWC
         NcDZRyT4fxBkMHfgo6RQKyXC7/+Yo59BMEgUpZLNG2E3VKWnxuV+cKwjSztuqIOtiR48
         ElmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date;
        bh=6Xe3R/apOfj9yPTgHstXk1duLFBJjDM/Rtwt0f9H5Eo=;
        b=7w34EAtFV6O4cP8ZD/Qpw6jR/Kb0sDhrPMpaZFPA67FaH4zGNO7+cQzawbSIonAPwi
         uGixkaINM7cR3Mzzk9Ep6t64L/lBWSuPRo37Ebg+qmNkRi5rcowroDohwioINBycHmU3
         TM2b+xH5BfrrBl1yPGihkzpOQJ9BX728VBJBzbmj9Y8z3g7y8zS1PB7NECqJXX8OUvO7
         OquitjPZ5EcULToEs17dnXeb/ZbpxkqTu6eU7mu2Hi2H8tExZhAO9HPAVPklTHRuae0H
         jb9J56iaFyATFyImflBCPdpRCVuAGcUlCbcfDNcf9+hwdDkxHw/l2NZYGLqzFYfOgiKi
         I+Pg==
X-Gm-Message-State: ACgBeo1cmNHHq8vLvolfitFf4KbFjj2DUqZFAH1gQbH/WYjOtPdlL+yw
	CqV6bXoK3+btCYv3JRbo1ks4Uw==
X-Google-Smtp-Source: AA6agR4JOxDScrdlY2QeBhFk8ibiBQ+YL8tlBtJH7FnoTf9lRCe8Mq0poUexl6SesZaolsHcCoBjjA==
X-Received: by 2002:a65:6cc4:0:b0:412:35fa:5bce with SMTP id g4-20020a656cc4000000b0041235fa5bcemr21758036pgw.466.1662965448405;
        Sun, 11 Sep 2022 23:50:48 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id v62-20020a632f41000000b00430c6fd7ffbsm4705716pgv.84.2022.09.11.23.50.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 23:50:47 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	aou@eecs.berkeley.edu,
	greentime.hu@sifive.com,
	conor.dooley@microchip.com,
	ben.dooks@sifive.com,
	bp@alien8.de,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-edac@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 4/6] soc: sifive: ccache: reduce printing on init
Date: Mon, 12 Sep 2022 06:50:27 +0000
Message-Id: <20220912065029.1793-5-zong.li@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220912065029.1793-1-zong.li@sifive.com>
References: <20220912065029.1793-1-zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220911_235049_623861_CD023F13 
X-CRM114-Status: GOOD (  10.66  )
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

From: Ben Dooks <ben.dooks@sifive.com>

The driver prints out 6 lines on startup, which can easily be redcued
to two lines without losing any information.

Note, to make the types work better, uint64_t has been replaced with
ULL to make the unsigned long long match the format in the print
statement.

Signed-off-by: Ben Dooks <ben.dooks@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/sifive/sifive_ccache.c | 25 +++++++++++--------------
 1 file changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/soc/sifive/sifive_ccache.c b/drivers/soc/sifive/sifive_ccache.c
index b361b661ea09..17080af7dfa0 100644
--- a/drivers/soc/sifive/sifive_ccache.c
+++ b/drivers/soc/sifive/sifive_ccache.c
@@ -81,20 +81,17 @@ static void setup_sifive_debug(void)
 
 static void ccache_config_read(void)
 {
-	u32 regval, val;
-
-	regval = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
-	val = regval & 0xFF;
-	pr_info("CCACHE: No. of Banks in the cache: %d\n", val);
-	val = (regval & 0xFF00) >> 8;
-	pr_info("CCACHE: No. of ways per bank: %d\n", val);
-	val = (regval & 0xFF0000) >> 16;
-	pr_info("CCACHE: Sets per bank: %llu\n", (uint64_t)1 << val);
-	val = (regval & 0xFF000000) >> 24;
-	pr_info("CCACHE: Bytes per cache block: %llu\n", (uint64_t)1 << val);
-
-	regval = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
-	pr_info("CCACHE: Index of the largest way enabled: %d\n", regval);
+	u32 cfg;
+
+	cfg = readl(ccache_base + SIFIVE_CCACHE_CONFIG);
+
+	pr_info("CCACHE: %u banks, %u ways, sets/bank=%llu, bytes/block=%llu\n",
+		(cfg & 0xff), (cfg >> 8) & 0xff,
+		BIT_ULL((cfg >> 16) & 0xff),
+		BIT_ULL((cfg >> 24) & 0xff));
+
+	cfg = readl(ccache_base + SIFIVE_CCACHE_WAYENABLE);
+	pr_info("CCACHE: Index of the largest way enabled: %u\n", cfg);
 }
 
 static const struct of_device_id sifive_ccache_ids[] = {
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
