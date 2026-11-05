Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA35606A326
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qPhTjb38;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EDdUrsG5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=WucKL/dATuxtZ/WvcF1VRzH/fFqmth2ZH0zfiEIt9mk=; b=qPhTjb38P4CgVvrPdUuVWCcENk
	TOBhn/cPNY+Z+5JhBiFeTHAx6F5BtcOL33LyBsFJG3mpT/jDTUkLVRYvgBHAGDqe0jK+plF3FcV+1
	QX7VSwEKuXG7Sk1nQucnMN6MEj4gMa2TaVWOqOw1taZoMu2Rqz4lWM+ehPa8FEwbCBG/ZX4CIzk2K
	JCpPTcE4Ztndymvzg++zdVXq7kkM85+0Ptav9Nnnvb+YbQ+hVOpqWdFPoAiozDzB0wgevsBZ6KNfL
	btjJBa3/X6rMVsSt1xG9ybg4Adc1yWMOYmQivussrqYWIo3Vq3/B4kKrJvMzhgyHhXlBYwfSSE14V
	Y4+yuUJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09j-00000009ZAW-1IWY;
	Thu, 05 Nov 2026 16:17:39 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09f-00000009Z9X-47de
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:17:37 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3b09a83d12aso1149597a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895455; x=1794500255; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sbmd56cc2B8bxAxFxQAEiOtDnzrJfFeIJKzZDYlgN4Q=;
        b=EDdUrsG5L/n4+EFlrt6aJ0QOXsBWE7UZ7ktY+ucVhwMwkOE+4M8uum9T83Jot1P5NB
         OWuLrKhdVDSkZKq8jBazmcDLSWih8kdZ5cPfh0caZU0Oo4A6TAxFkDpzBmTLtkNPSaI1
         lYSN+iMH3QgGtyBwSSScfBVRV9vTR7PKfoJ1yDCLEPfzaI5ZjQVjwjw7TuAlyqKsaGBK
         OeZpoygDN+EnrX0alwc7OATtLXNu3qATzO2MebIfGfADRFTqNW0xyr04nlquZ5lK37FA
         qJp5S3LopfR6Vx58ML1i20c8E/KPwy6W9DXweE/o6rtL2tPwzA0dCubyUVHTARfgcHTQ
         8CTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895455; x=1794500255;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sbmd56cc2B8bxAxFxQAEiOtDnzrJfFeIJKzZDYlgN4Q=;
        b=L5a9RiTy17063IvqjorFLfpqdBOWy2VuQMZ+A9dxSSEv//xrzZxM7J+HKp1z3UVBie
         QqGtu+lSYz2+l1kTSw9JrgNmJXNAPmrFEj0/Vn8IQl6iZqNu1uGJ220lDaTKvuyeqRm7
         T2+RKAhZ38vIqn8F1mt/OLHPzAZOf/4XDue47XDz7FznSh9S7PaT8yqgjrbIXdaGGD3q
         twhgp9cfRSedpYh6DauKPjVhWeIE3rIY7AxvUMyvgItv/zMoYvG7E0I+LytWM98LLOMn
         ybjp32QHTXmTSTEmCFcvHGBA8u9L76qsEpFhtgj2fq59na66l655b5YwSDZSdMnpizoX
         hDaQ==
X-Forwarded-Encrypted: i=1; AKwUvByILnSRtULEQBUIDX61jmCDOniJSU3G6ed17b15exaYVYygEjh15l0xHHTAKVvLp2STUS4kBJqvqUooEw==@lists.infradead.org
X-Gm-Message-State: APuU4Z/GrbFJXjb1nq663gvyw+0CCWHT1dou2Kkb0Gk15iQrkFXW8ipp
	BRbuSxVR+5ccMywt13GSvbE7j7H0sydBNYVy/AjpDJ9QusWeKxVmKRi2
X-Gm-Gg: AYBFou0M5M3F2ahmYywHTvcuv/JO27r31E1dB1OjyfabaCVVDYjUP0RJP0IE/DtsbLs
	2fFfT1ZusDelq53zOKdVu8mjkUAoC05A7IRywnhexJAF8dtwDP+B0HpxWXk+wA+uj0leE9rHtAP
	2kWrXBTcY6qGK8RxQNF8DRGdySsk/QhmVMd13DOxFAryHwwigN+O/GU4XiSKsOKbFVs+ALBpIrY
	NqCcxdz5ncHRl4h5g7M5HgGF/wKj3koBWW25xbENEZAlIUqF/r029cuinaHkT7+bhRlDpk4MMUR
	+hNsTmcjU6IV+ljQv47bz+Hb5an6INFXkX0d4sj5fYPsxk7+65ZL7AEGLmpMunbiL36kiAmwREl
	zLricr+rTl+OApNoKxygjADux7ru7K/NpT7kamWeN9zZpVvyf1agalwz1uqdCHdwOGGJcct16q1
	mDSi7WobaiylyM9ZB/6uyTA8zC7WFs19/YIZPbyhS8EMG1CM15ki8y/Uzh0r//+e/LcIs3wmQGS
	69DqqgSc5OsoVI3KsFT00Vj0ll2E3vx+g1B9gt3gz6Erpv7mLp2wE7Tdl7xSNBzdiDuXuIWufZC
	EROFddl5c0VH7raIfQOZ3EbvWu7tKtAVeuwCbIPXgkzHJWzf8YLTjc0trT7C3cJGLg2ovWu5HlP
	7FcFSVK1orRzYi2QZqxtO9DWpvrhU3iw+PdvSUUAW3ize
X-Received: by 2002:a17:90b:4b90:b0:3a4:7730:33dd with SMTP id 98e67ed59e1d1-3ae8984b662mr17099226a91.58.1793895455036;
        Thu, 05 Nov 2026 08:17:35 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:33 -0800 (PST)
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
Subject: [PATCH 1/8] clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
Date: Thu,  5 Nov 2026 16:16:55 +0000
Message-ID: <20261105161702.3515900-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
In-Reply-To: <20261105161702.3515900-1-visitorckw@gmail.com>
References: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_081736_066124_F9363C3D 
X-CRM114-Status: GOOD (  10.81  )
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

Reading TIMER_TIME_LOW latches the upper 32 bits of the current time
into TIMER_TIME_HIGH. Because goldfish_timer_read() reads these two
registers without synchronization, a concurrent reader from an interrupt
or another CPU can read TIMER_TIME_LOW in between and overwrite the
latched high bits.

Protect the register read sequence with a raw spinlock.

Fixes: c92e7ef16400 ("clocksource/drivers: Add a goldfish-timer clocksource")
Signed-off-by: Kuan-Wei Chiu <visitorckw@gmail.com>
---
 drivers/clocksource/timer-goldfish.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clocksource/timer-goldfish.c b/drivers/clocksource/timer-goldfish.c
index 3fe12c7ee7b7..cc02b012ff76 100644
--- a/drivers/clocksource/timer-goldfish.c
+++ b/drivers/clocksource/timer-goldfish.c
@@ -6,6 +6,7 @@
 #include <linux/clockchips.h>
 #include <linux/module.h>
 #include <linux/slab.h>
+#include <linux/spinlock.h>
 #include <linux/goldfish.h>
 #include <clocksource/timer-goldfish.h>
 
@@ -14,6 +15,7 @@ struct goldfish_timer {
 	struct clock_event_device ced;
 	struct resource res;
 	void __iomem *base;
+	raw_spinlock_t lock;
 };
 
 static struct goldfish_timer *ced_to_gf(struct clock_event_device *ced)
@@ -30,6 +32,7 @@ static u64 goldfish_timer_read(struct clocksource *cs)
 {
 	struct goldfish_timer *timerdrv = cs_to_gf(cs);
 	void __iomem *base = timerdrv->base;
+	unsigned long flags;
 	u32 time_low, time_high;
 	u64 ticks;
 
@@ -37,8 +40,10 @@ static u64 goldfish_timer_read(struct clocksource *cs)
 	 * time_low: get low bits of current time and update time_high
 	 * time_high: get high bits of time at last time_low read
 	 */
+	raw_spin_lock_irqsave(&timerdrv->lock, flags);
 	time_low = gf_ioread32(base + TIMER_TIME_LOW);
 	time_high = gf_ioread32(base + TIMER_TIME_HIGH);
+	raw_spin_unlock_irqrestore(&timerdrv->lock, flags);
 
 	ticks = ((u64)time_high << 32) | time_low;
 
@@ -107,6 +112,7 @@ int __init goldfish_timer_init(int irq, void __iomem *base)
 		return -ENOMEM;
 
 	timerdrv->base = base;
+	raw_spin_lock_init(&timerdrv->lock);
 
 	timerdrv->ced = (struct clock_event_device){
 		.name			= "goldfish_timer",
-- 
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
