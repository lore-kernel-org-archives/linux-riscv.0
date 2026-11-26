Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1F42606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=fhhrkLJw;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bSPrnbTs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Us7AwQ774b9eIdQvRppn+xzpwHymEUScZy2Eczt19u0=; b=fhhrkLJwoTgu91ZLtETExzQc8M
	syue/m6G4qWtHWYyop8pdgohfuVux/eIxVJcOcx+W2Z29ufvs1wk/b1Ldmp5AXbN4GlBm+A7KZ/jV
	z+kn10xkGwnrjj1KFL36H2OTAhQfmJwpH3Br86VPVKofBIYGyTLaY9z7lA2sMhbggZB40W+KnlQR8
	gJzsTdmARBEtCshTX2JG6YxAGL7J0pn108Ef39YeN0Igh3pbpg/ETZGgIPsnijuWTItWtXW9Dyq4l
	sy39hBje9+1PG7R7pklOdfSnzMehcypyWl/e08WjUe/8tfYpoRxefU5pVwfb+iibRl3NXmW8L577c
	N3C2JBLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwi-0000000E90u-1cpm;
	Thu, 26 Nov 2026 18:11:48 +0000
Received: from mail-dl1-x122e.google.com ([2607:f8b0:4864:20::122e])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwc-0000000E8wK-2TS3
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:44 +0000
Received: by mail-dl1-x122e.google.com with SMTP id a92af1059eb24-1a2761c69fbso9971202c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716701; x=1796321501; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4TDqJAeKArMi1TG5kQFBzJAxGea716ROZkpS4fTDkSM=;
        b=bSPrnbTsYchvVjr9uVsobnVl7mLBMLfB24k/ZH1wWMq7WBfP9LFB6jygA1tflViAEA
         p5/meJblPLmdEePWZobfHYCPJYn9oEGMBwKZc5md4aw2HcP4nQ6noLdIakQ19sl0PApz
         UvdvlWajJhG4MbBwpeSAY73ZAOO8yF1ea6cbsiyFWsjGtMhd5QhRb5ggWKvEWGtwKNAg
         xokzHzBAS53DDaD2Xw+e8GbGnEjYMtP5yi6cQk7KsJtXb4VHFX+m+xRERyNKXXwMVtC4
         NlzUM5oqgc9Q6MAt8wH70r9a8qISc4jioVhmmkXW7GQ5VbkccNl1dRT4iiTHbUf3ucYc
         JrMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716701; x=1796321501;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4TDqJAeKArMi1TG5kQFBzJAxGea716ROZkpS4fTDkSM=;
        b=T1sq9Cruyr64EUQWtus2H6NOOSPFc8N/Ohio6FoFRxooBE3quefGJ58tuq4+blBxlJ
         3tvSMaJwkqDHIS+FKveMkrfku9xD6Qn04WK0KqIhfL6z13PX1Ey/xJRw0elqLbEaaVeq
         QoYCyTcBD8shqBdJ5MwC9PRaMoW84BVHlkzKqucEc17baGGr5jgivxdUfkhi18VvOd3y
         LeB6D1t2jLMBay9o4aWnsJDCcW3NFkOxGde633F076G9840NMhmpKjGchS1n8UL6RmoX
         cepIibHiuCoAegVroCoqz+TXFP1gj+MRCgQTKDbBUKR9P7oS3B4ZFtOnCok2l0/zn38M
         9fHA==
X-Forwarded-Encrypted: i=1; AL+hErFZubd//7s0wmty32URXg7okKMxob6QK3upF49K5b8BP9v1PXfCCyFr2Z+czUOpTO2av6Y6/SpHgMNWPA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+Nbtt+oIoT5WBzW3AjMlrSmT9YtX4mZSSxykyP6wrlekN5uSwG
	if0j4W/rpiTYFB7IK0hmDz12dYdb6XqzJx713ND+mF97gXsaSogLRTRg
X-Gm-Gg: AZFdTZdxItNCZJTCYQeBo6IvqQMgufejTKiFGROpOluT1upYTQGGLJOGBy2L1b+9lPq
	cpojqsvqlht+nrdLgct6V7MeS7ePrrRO4ByZkVVCd6oqhI1zxZiqk1G6yAtCuI5sKy99074CAr5
	kIcVsA5+2YZtUP8SIEIlChhHvJNGriRQ65kqW0D+n+oH/z8+FKuvkhzu/gb9spzaHGEwvhbq60V
	OruOkuqQDtTcz0bvlGKGzretO2m/bcx8Yiph5mrnzi0eISB3VOSVEAW6F1OMc3As0IKy7kkpIOS
	HYp2TvAnvUb4UskpH3INHjSFKvk5ycUbrzzjoJKGCkG1gnTm6vO0TaDwiWL1Vcx8fRumpUDch1P
	MxPLw7r29vVU0QP4i26jJNj9hfCiFOBZJ4EGv72UVWfjcyP5tEpS53wU0EBxH6G4u5C/cFoN4BI
	gNPGrut8VC3vGURwMe0rce8bqu7oz0WMzcrGhv/NJWqzGLT+y5jnPZG9kHEpryKwivmeKy1N0AI
	dAmq4BfFori+56/LFL3FizNulg4Zb5K6v6fGO0AIhSVhsZEjcY6wNHNS+bDtxWSTGdNPY4H/UNc
	jf182wpwQvdFxPK1UfJoyF2sHEtxSkQ0EzITtrFp5MYgQ3tbBfY1b2tD3cStAKM4YsZ2MlLX2gk
	pK7uUfDE3CB3HlaQLTZLPvZE=
X-Received: by 2002:a05:701a:844d:10b0:1b5:888a:a1ab with SMTP id a92af1059eb24-1b5888aa35bmr6831377c88.15.1795716701414;
        Thu, 26 Nov 2026 10:11:41 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:41 -0800 (PST)
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
Subject: [PATCH v2 5/9] clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
Date: Thu, 26 Nov 2026 18:10:57 +0000
Message-ID: <20261126181101.3715754-6-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101142_661919_26D6AF63 
X-CRM114-Status: UNSURE (   8.41  )
X-CRM114-Notice: Please train this message.
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

clocksource_register_hz() automatically calculates cs->max_idle_ns, so
the explicit max_idle_ns assignment in goldfish_timer_init() is
redundant and overwritten during registration.

Remove the redundant assignment.

Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 88253bd1f569..bac84e0f9b7b 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -140,7 +140,6 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		.read		= goldfish_timer_read,
 		.mask		= CLOCKSOURCE_MASK(64),
 		.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
-		.max_idle_ns	= LONG_MAX,
 	};
 
 	ret = clocksource_register_hz(&timerdrv->cs, NSEC_PER_SEC);
-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
