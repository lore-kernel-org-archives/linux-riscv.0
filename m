Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C796F606A680
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UNyxUkDQ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I6ElT61z
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=zfcGlITMKQnU21eamUNg0HSfTQDi03AbDdnSCYfE0YI=; b=UNyxUkDQHDjXrjN7IlF7woAuYW
	OsBusBWC+jgD7yITUY6JVchDl0P7a5RyVtHtWC/tUZLNdXX7Fv7ExzLQo5OoEi2hTkmPzmwUSFAdQ
	fpUM3lhSSoDyrf8ZDNGaZIntD/chK9oUg+f78qsGp9m9Zeubtza6K+J8LyTZWvIOh54jYpcKFdVs+
	+rM0Jb0vuXFSWJ1XHL6BJBHU/RJ3UJDNamQ4+XxAFeqP94tnc0Vk8jivx85eI9vo2QQkwWZkEA+xe
	zPzQ+soplIBXgPKn9zUqTi6mvOyh2+n1sNHpT9lJnI2b0CnWC0Ax+YcTjlPGAbVinC189Bfk7Gd1R
	nBndEcKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwd-0000000E8xP-11Sg;
	Thu, 26 Nov 2026 18:11:43 +0000
Received: from mail-dl1-x1235.google.com ([2607:f8b0:4864:20::1235])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwY-0000000E8tC-1ucD
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:41 +0000
Received: by mail-dl1-x1235.google.com with SMTP id a92af1059eb24-1b24f4b15c4so3336852c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716697; x=1796321497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sbsm1O/Ieag9dY8M3YCLGdU176C6qc/f0JKOmTZPEHE=;
        b=I6ElT61zeJnW2SCRGn8/UzM0XIEgcnZt7rlPZgGM2hWu9lfQMl+FEm3S958SyYsZmu
         gEcKqsRdr5cy99W7LLEAN+z1bXKrSTlFkz9uXssgvYA8Lkr7evhL5276CuHT5x7ulsUH
         g995mj8k555DF7FXCJrM6kblW5YWFXvrEK1vi6BU03z/QuiC8yrhYq8WyPv2Rtzj9Q8D
         UPUhJuiQ4IyQ/r7pd/oTCUIBv2QaxC5W9daTRbodUZp/IWZ4n2HcXVG/DduK+o9YypOL
         cxizTfkrJg0VpUvIGQUPrNOHTuYQdeGKqUczEomM/Vj3k5OFEzYEqSXeE+JTt3+BrC1f
         sD/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716697; x=1796321497;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sbsm1O/Ieag9dY8M3YCLGdU176C6qc/f0JKOmTZPEHE=;
        b=0rzkhpT5oI1pWmuSR+f/bi4l083/HwIqCaEYvePPKZ4PR8gooeNtV7bixkQnMn4kBh
         z0pIIgAiJ7a9WbvHb3dnzd5SPf4OzzYN8AOnMxqw1SNUs9YRzZ1S9zNGebTbpCp631TP
         m99x6mtbANYDAS184F0fm3qrnVviw38pfJ2jadeozIxqapPL8Cwdtl4zLA9h9dfDowtj
         wzwbCYsNYJgsv+Q3ODK9JlncxZvjzRqxtv8P89l57rriAPRrBuiGs4d29T0Mk7RKHWWb
         SGFtQf5Z2UCcMsQXrejJbl2NqrXXmSNSji7/rStKPgKaSCENj7M9lMvI0nlotUXobpqu
         EA/w==
X-Forwarded-Encrypted: i=1; AL+hErH7krf1amC2Tb4TlsqIqC8RD4QFHW9+Odmj7M8bPVvh6KRqHsGmCJCujVUdW7ICWj5JS+ylHw5zzYpG+w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/ubFCep9aG+iS1UnA803sv5LgGnB7oNU/iQr10/eNYNVCqnjUQ
	DEfwKLreNGY1RXeUToSxgRi/uWmUfFsQd78SkXCyLFTQUbPvSSAfGgc1
X-Gm-Gg: AZFdTZe+2VJLW0774JTfwI1VggHWlhjWaf6u7CrkWibn559wZte5db7oNX14epkTwex
	WXLhwBBdfwFp9EDmPGx8oe5wfEasprSQe51+arG6M1jTikoBvf7jbVbKMs9K9sjvboUd6Am0lMD
	RUEmLWF5G05XY88m0HXtxB2ERtM/hRL2eKku3blozDyj1YF/7U1tWTsCeam0bUnqLSFjOhjQZ3A
	0LPLbLd8YWQIctCkdzAc9SNdYFULOcgs7boQS2NjvlF/nfOlz/TfVKqqvIvvZh+uzxF4iLj+LY4
	xmu4O3/j9Ylzxv3CJwogqRSMUTL/R1WuvtG310QiqvldtiHktd05Iy6TXyYfE716WtsQaEduBXU
	rEpDXrjyTZocW1g7yotb0UFlslMrj6R9mJ8Cag5bQiHw/cDPq2pw1+tFsFrcOJblM8z6k94GEMs
	6M4S4bZQWQygBsXMpxuJzUhE8rJhWz1lXF4k9/S8BFdGZDbCofWmkPY4M9FXt4ZH4iX+x0T9n11
	SpQ1iZbPT9cLcAJ5hxFGwXSZ/mRdfUxmcGwrmE1paljyGNpHparFoQ2zGH8qhGhTjR8XiI/0X1R
	jpKDQEPPtHIapFcplGSlQCqIQaOTtuQwTGHW7wyhzOOxfnPd7z/d1ZMgT6fEvRM/w5zKvLZkBPO
	Aw92X0ael9c5BOxo/uQNMgzYt
X-Received: by 2002:a05:7022:1703:b0:1b5:64c0:d2be with SMTP id a92af1059eb24-1b564c0d31fmr16340401c88.19.1795716697184;
        Thu, 26 Nov 2026 10:11:37 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:36 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH v2 4/9] clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS flag
Date: Thu, 26 Nov 2026 18:10:56 +0000
Message-ID: <20261126181101.3715754-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101140_555770_4090EFF6 
X-CRM114-Status: GOOD (  11.71  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The goldfish timer is a free-running counter, but timerdrv->cs.flags is
set to 0. Without CLOCK_SOURCE_IS_CONTINUOUS, the clocksource core does
not mark it as valid for high-resolution timers, preventing the kernel
from switching to it when oneshot mode is active:

  [    0.751173] clocksource: Override clocksource goldfish_timer is not currently HRT compatible - deferring

Set .flags to CLOCK_SOURCE_IS_CONTINUOUS.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 8c312c3a64a6..88253bd1f569 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -139,7 +139,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.rating		= 400,
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
-		.flags		= 0,
+		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 		.max_idle_ns	= LONG_MAX,
 	};
 
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
