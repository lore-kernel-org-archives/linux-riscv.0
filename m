Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 516C7606D80A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Prm7oomU;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UF1qwqz/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IxB0BROEOsSP4EY39yq3wUBDXbcqKWV593yGrXAtGso=; b=Prm7oomUXzPN+kKa+o/9TBd7iu
	SaPaY9649z52UW930LwPFrC791MWTQ6ND9bLdsGSw5DbDBUyS2905CuttUAQ3PHOEajTD9r/ygLx4
	1V32BA4OcC9RTfoZmOmarpP+far/JoFgyzgX2QFwp37KskACXje0LOLY6rITaL/8dHI+RXnYIddqb
	I/SyVPFLfIND6vR0lw/YxlXKWOofiCqC3ku8g6mPGsgFoO7VYW2XGM5F8sz5pd/G1cAdLtiNo6N9g
	384yc7mOtJT7wyBcK2it1jBCz2C+ykS0bIwsHBE0RrP1JzjEQjo3DDj3hID6k3Nl4bRzjNXVMwLW6
	taotflFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP0Aj-00000009ZSU-04yo;
	Thu, 05 Nov 2026 16:18:41 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09w-00000009ZEB-17C8
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:18:18 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc7d154ec4fso964425a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895471; x=1794500271; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1d0Bz7grZ5N14ov6UkXjfbPvCgrK/lOG24d5Ad8AHHw=;
        b=UF1qwqz/y2KOcsjhuK6kbMP783DxhtOkY92d9q47vb6Id/b2PuD6EU1feM1rgeJ0uV
         swA24FBGo8v1xervmFMzA5Hfhd9HOqokqiL8QjAAGskrd5ioor/jawT7Frpz4NPzKKJA
         KkV94d8kRHirjePNB/dcA+YHfZ/LPXbW0mrFtxbBGtvSi9L4YnWisyBHVTfiWX97B9bl
         Qm15HFHZd450Ay+b3e3PxnQS3Koq9ZoJBYfK668oaJIELaqnGWOlMW2slppas1qmZR7Q
         roPI8w3rTUHIA14VyyjjgZVEDL5FjXAs07Noila6RflzmcQZTO1iVRE5afUDliixqx82
         JwYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895471; x=1794500271;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1d0Bz7grZ5N14ov6UkXjfbPvCgrK/lOG24d5Ad8AHHw=;
        b=nWgcM6Y8fdFgs94LB3C9cLQj8Co6H/5EU14rWoAb1/+9e9rp0VSMsgStVl+fOFeE11
         BRTlfW8Pq25RQG97KwpK5hy7rsjv0wgSGcO6/5N0JttxYF/Ke+Dsr7w8Ze1VPdSzw+E/
         yUyYkIDkltecy4c7HijQRgKRtr3Ko/TIgSz1zzwB8RtBii5o1U+ZHCW+AO0wL8vEuM+9
         VajP4Npzm7ZZkowYQEkV5FRUEe+TPfD3e/gQ16IdJ5lxgVAnirBt5u+83LlRW8W7mljG
         LPNjuczixVZvGDdLH5wstRuYtf/2Ox1Obd33x1FYNwJgWUR40pp0pQqNovvoNcfFxkGA
         Mkig==
X-Forwarded-Encrypted: i=1; AKwUvBwn+ou9EBNHoubvlFqoeFjN5qbW3520oYRpH2wn27XRpXJjpIygKon8ipGobLpKHD1OVbV1Xip+zh/Ovw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/a6UOCvT725IZWYOS/xv83N/YnGcVDmmw2le+um47wwDLlgMXO
	aZ6lsjqi8P4HmBOI8T8E476p2eMa/WrUFjfRIElk+HYxmcrxy+RMtqYJ
X-Gm-Gg: AYBFou2qJ/3sHpYYeSOi4+8wMVRscjvJm7beHGozwj0k382FxjjBCUZKqh9o0mRgxNX
	cjxLMABbVWSIdBZWGfj3cczQZ7iLCfiemTMZSPK+At6F9BPh3J23fvZCt2qsOInZjutYgIKb1HG
	RN23SfJKFMhW9Fy5tDZVikgoZz+As1pkt17riznd/DZYi8tNNe1FLaV9EI4gW/97omxjAFnxN1E
	xQqLgOcCFS5IgkKRnD5tGbklHDeuo2BsYvdS1rpiZaL9TmEJ9tyvd3r+ygqHqMUJogQ2paMejid
	M/pxcBmTZ9IXvvRZ6Zzno+EDYo3NY/2ELHaC8FomKLZ1jc0gxWcg7bCo0+BMp8eFthLsEgPpgis
	ov78Bz4looZSsUEYGj/TCm0wWjkS3tZA00FKrMnZJoR0Kqamk8Z1HSujwdwcSqcHZUIOKwAEeqK
	H29qp8obeJ3ok/xU4RtiwAsEc29LMic3rVqTREXfQSXdTRoFqCB42fGZQzE+FVPt/KlYrdO6ZZK
	MirlyBbop20n/GozdguKAwYootDynSFE498pXcuMFXjeLo3yPstbVonE3NeSuqCdJcsanVamODU
	MwhAtEeBVACysewlnYE7U64/+y14DZJTVLhw4YaJCLCZgKw28ehgckfHuMuVLlAMpWcqKlo+0U/
	n2tO66j+n0XBJQcYY6BBpIgs=
X-Received: by 2002:a17:90b:3844:b0:3ab:36c4:b502 with SMTP id 98e67ed59e1d1-3ae89814e4fmr17090993a91.30.1793895471151;
        Thu, 05 Nov 2026 08:17:51 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:50 -0800 (PST)
From: Kuan-Wei Chiu <visitorckw@gmail.com>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	geert@linux-m68k.org,
	laurent@vivier.eu,
	marscheng@google.com,
	eleanor15x@gmail.com,
	jserv@ccns.ncku.edu.tw,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-m68k@lists.linux-m68k.org,
	Kuan-Wei Chiu <visitorckw@gmail.com>
Subject: [PATCH 4/8] clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS flag
Date: Thu,  5 Nov 2026 16:16:58 +0000
Message-ID: <20261105161702.3515900-5-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_081802_900954_800C27FB 
X-CRM114-Status: GOOD (  11.42  )
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
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
