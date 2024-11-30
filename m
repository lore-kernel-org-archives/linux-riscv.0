Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D0EFD735FC
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Nov 2024 10:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HXwKwq6x0wneTZCfa5h2yUoxIVKUDVDTLuD0lUV5RLc=; b=a/9S/c30/sOKA7
	2rNZUoajC/dINE5Ta2H1n/Cdi5EveG9Zh3m9h42ACUXn6KSoEQoGvuqLZxzUHaOROCq2QcDTHLLUP
	/hLtrA9smt9oT6x3vhjvmlhX75I7QeNQwevk2rEDLBPcb7+5WlxLZsu/atXsnb0PETjXGjZKy/7eF
	oRqrk+IaqD8XgmB6s6o8XbUjeVZv5pfMSAygHdduFIyxxxTTosF02lSeImyt2S9P8NnQPNGzFvRuG
	mNv7XnCcTlysvlZXpileWvm75oXwQYD6dtUc7WyIcO5tweRGk5/jl424MzfJQWKnjzYBVOlfD/Bh+
	DNdKRV6MOwd245tBv1/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKNu-00000001o65-3HBb;
	Sat, 30 Nov 2024 10:07:30 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tHKNt-00000001o5W-0eQ0
	for linux-riscv@lists.infradead.org;
	Sat, 30 Nov 2024 10:07:30 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-aa55171d73cso659507166b.0
        for <linux-riscv@lists.infradead.org>; Sat, 30 Nov 2024 02:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1732961247; x=1733566047; darn=lists.infradead.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q3IOEa3AQiadqfvRPE7ZHtURn1mAXU3PzuocV6bnPJs=;
        b=aivXSN6o3DJiyo59/1sEOvZaEgMnolQUr3iUkFnhsWQXPcMgsX9SlpjkUXxuOxikjK
         yRxyml3IGAwcjDWXPJWBWbc5sDH7pt4pm3BerI6WLu35NWs9ysPZiVX2hlqsaQNQN+qg
         AgplZKWMyD3Tdh1uLxyq28MUGAYl+rS6Z/okg1hzrjqmkFGj7/akg34/meE0MjOQX6YX
         rWJGCIq/TRSGdVl0rweIFhpIRMxfqNjRwZMaI5GO87MVq5vqVmNzhmjXHPFF5yBswykn
         wcQlWGck+mORI8yKSNw5oU7OfHVk/FIMfXztwCfu10sIT4rK1SYXEiFgU7Dw5XreQGkN
         ShNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732961247; x=1733566047;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q3IOEa3AQiadqfvRPE7ZHtURn1mAXU3PzuocV6bnPJs=;
        b=azJ9uMSuOxXn7559bysLsJmtjO/qUEtRWV/zxPIFGGCgp9yUbAYpOjQ2nmfSIgP4Dd
         shp1q8AEkAckbTNUvJ3NAJ82jN6bnJ1pG4kuDGDC06BKHh7e1/ac7N8h6/dK/8xJph9K
         T+eaw8xqEtQtr9ddUc5JEG3+e7B6xX4TiUBG0JZXO52hOpJ3m9aZmJwKenIpV0t5AdwC
         zRszLsRTTAd78l1x71ABx8nZo4yZ0UBmQ4ASJvbkcIT7j23sQBPyEy+hbVUGE1Wp9mv6
         dpIeBlzlP5E9sUzjr2n7zahKoekJWNY9zL0s0dUj9ynWdAqtfvy9+ojicSPBMs/hNdms
         NhUA==
X-Forwarded-Encrypted: i=1; AJvYcCXnDNzyFAwwi8iNyA0CJGomsQsnZai45uDUZv0D0JBgDlAqTZWv0OsJJIzVm7L7WV0necKkf6Wm0e//IA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxYNkCS89UDU7lwvqk7Dr1eePQ3jOxee+SftokxRdKzkCW1VDav
	hzkdacYP4oYrI6niJW17ZqlTaG4OBgl7ol4GSLn770Vnx+Bd3TlgbTguCGxk82g=
X-Gm-Gg: ASbGncv8tHn5oD7f18KQgIE8iQu3owmuutU3l0Xr0bh+Qc/+qY9XC+DjXOLesvIQ1tF
	EZLjs3sp6kJFopJJ5CQJCyOU7IeWBpUDMhqP6oklSJw2KTl6Y74FDMJX0b3HmYlxeK43QgzFzfv
	+Jzm6Q3aA2ctsQvpzoWyThBrHsFd9Lhv25+pWkatg8kI5ygoqF6wsOxuY/w5CET3pRIuFr21xpo
	guwWd4ycGrGMoCHuTgDCOAEWfcvpyGbcMZWl61//Y9SwS6qaOlOZopASzgy+TPGGBhmjZMA
X-Google-Smtp-Source: AGHT+IGEehsqRqqchxpEeMpH2p56+C1aMQS6P8kLj4wjLRwyQQPVWBU9FOYoHm9xPFqfOvMYDmrCvQ==
X-Received: by 2002:a17:907:7ba0:b0:a9e:b08f:867e with SMTP id a640c23a62f3a-aa5945dd02fmr1077135366b.16.1732961247420;
        Sat, 30 Nov 2024 02:07:27 -0800 (PST)
Received: from localhost (h1109.n1.ips.mtn.co.ug. [41.210.145.9])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa59990a783sm264103866b.171.2024.11.30.02.07.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 30 Nov 2024 02:07:27 -0800 (PST)
Date: Sat, 30 Nov 2024 13:07:23 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Daire McNamara <daire.mcnamara@microchip.com>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org
Subject: [PATCH] mailbox: mpfs: fix copy and paste bug in probe
Message-ID: <9e760329-80ed-4bf7-8d4f-dbb16a736497@stanley.mountain>
MIME-Version: 1.0
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241130_020729_192222_C1FD68BC 
X-CRM114-Status: GOOD (  10.98  )
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

This code accidentally checks ->ctrl_base instead of ->mbox_base so the
error handling can never be triggered.

Fixes: a4123ffab9ec ("mailbox: mpfs: support new, syscon based, devicetree configuration")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/mailbox/mailbox-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mailbox/mailbox-mpfs.c b/drivers/mailbox/mailbox-mpfs.c
index 4df546e3b7ea..d5d9effece97 100644
--- a/drivers/mailbox/mailbox-mpfs.c
+++ b/drivers/mailbox/mailbox-mpfs.c
@@ -251,7 +251,7 @@ static inline int mpfs_mbox_syscon_probe(struct mpfs_mbox *mbox, struct platform
 		return PTR_ERR(mbox->sysreg_scb);
 
 	mbox->mbox_base = devm_platform_ioremap_resource(pdev, 0);
-	if (IS_ERR(mbox->ctrl_base))
+	if (IS_ERR(mbox->mbox_base))
 		return PTR_ERR(mbox->mbox_base);
 
 	return 0;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
