Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA3FF606A321
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=FUcd0LJK;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NqUMhmSc
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=q90TJLO0qPB3Qo++Ip91bE+Crgy1UOCPnTGrlUJHRWc=; b=FUcd0LJKbtbHwU9iYmEgQFeBZy
	1mumCWHFKa8BBPyT3lMU7+mSp8AsmheBu7m5qSwGHz8fJsDQg1/cAtjzm1VUuShy01Vx2S7En9XCb
	bQUr0WAawtrAuOyDGOMlwknO7Yvv/UMH2uDJbmFPj9E+JE2jYrMrWtGRCfWgOLr1wYru5lzhgWCK9
	xvG8gkZj5T3v+fzmwkjAiTOVawozjIm3yilVBX5OYwexBPHLcuibDhBwuRv468ywBH9qaY+3FS9+Y
	9bWk5oDkxOWa2Kmy/zmKq/C2ohPtG5vIL85PYqOByCxGG7sVeCzXgO1UkkuTK43rQK1Au4TBJ+rxZ
	gzs+sRZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwQ-0000000E8pG-3QTx;
	Thu, 26 Nov 2026 18:11:30 +0000
Received: from mail-dl1-x122f.google.com ([2607:f8b0:4864:20::122f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwL-0000000E8m8-2CZ8
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:30 +0000
Received: by mail-dl1-x122f.google.com with SMTP id a92af1059eb24-1ae58d17cd9so8174340c88.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716684; x=1796321484; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sv7Rf1rucixu4R1GE8Wfa1cFo464t6/j9QkDaOQ/q4A=;
        b=NqUMhmSc3czT+IfCSeLAvXvAQ5uDM9kXVupxSWDfo9xEFuL5nlkLOdJmjqaoju0UyC
         GFYKpDaR2FxOaGn7K144x1QQmTKokwLhsoT6D8J4CNCl/ltPmzgNX36Umfl4n5EuyZTT
         9Sc92hKVegXa+2b8aK2NgzMSaXKJkFWfFvet0sHpvNhIxSLWBIZHacZhKiFSeuXKRtPl
         Gwb2ajD+bf3AwTSG9VKgJwUHPCODeqFG2NElDeYZlT4eZtJazWckGo+NNPHvDE5VZynV
         No5VexZQTBPd1S/0PU1X992vw6kvv3JzQszHTVxWSO6o78fGAK8W/+JfRp+uysSiFb5a
         0WBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716684; x=1796321484;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=sv7Rf1rucixu4R1GE8Wfa1cFo464t6/j9QkDaOQ/q4A=;
        b=eEXvRCXCm0N0RrVNd9VRk5BJLTwZwtUpB2Q11+q/4R8Zlc3nysUfpVnUyVgq2Syswf
         RnbdNPwzU8ck/NgSzLcUOHzW0ryWC0b31jj0jr1gsk1qS4lHHmPR47Go9QgBW1B5tBlk
         ZnqH1yPM95QuQc9SacsqpK/oEoXARbP54mPnEgKlthkwEu7WYne7b/sby0LxdlzOAs2K
         eLG3BdpdwDiySSbuhi9dUgu8O460nSM0ueGTiEGQ65tQcwzztmkoGwVXEjzrlljY4fCC
         i24JBlLQXPA9qtJyIXedHsXqVQMmohVSChvsvWqA2QcSsQ7BkFZxHNwDNKPe84gbBC30
         MMxA==
X-Forwarded-Encrypted: i=1; AL+hErH6dSDiUO620/AOOxvASjLXch8OoYV5nvCi46uXkbZ/Nnd/314kegbdl7UG9p2y0aKWBV3NxoLRzuhMNA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+eGRImc7FQ9aSqqj+kReHWmgyK/+wMDk7TMsvVkRSvz/W1AB+V
	ebfKnbPVtwUFuw4M+CWF8bAQ/gEJMrJQe+nmMtwmddbTZ5wNv2ww0MYn
X-Gm-Gg: AZFdTZeI/rj7LxwxZbSllUdard31XwOkOHQLBOTG7HY3MGAuqx+SU6k5sp+z+Vhrme8
	CGtgJjjMxec3NIKbf9+nI7QaklYokBrkIyx/7ejLBgGo1rYu0l2RyE0UA1qjQOCAnvF1lAF4rfM
	w5jAMBMX6m4BkTjHt3wGi3MTpMg4LIEHdPI/CPyzqLPkzsVmHox21L+UbnHKHHVqo/7dW/5QhFV
	3KRgInWwML1HepH9QYTd9p0UcbFkD7J5pHwK+YVn5x4bhKEz556EGvQwTRuZL+3+eYKp6FJugSx
	vR+H2qp+tSJFgJOF6ZvYkWKO+TA+5v/UItgwfQOEdGFksCExRfNSMAAregfrRUMXyKMbn5B2qw3
	HmM9bTw5wx1fABWu3LWJcVUVydVcBV7YNxKuBD3qdj/rx8w2MG3QQPXjFCXmjgQuj301GHpcsdj
	ue5afsgU83Dh99GHRMt6yNT/JKg3wwXMWHMsZF3Za7CGTosK7vIRlJPGfQSfVIRCK3tSzHiehJi
	yXHPbNIjtysqGOiwEb5YSFu7L99l+d6jRWw7H5pvMzvV3WMnsRawb8NDM2e1p4+3LFzCLgKnFVV
	eNQx2CYreXL+tr9kSQ97NkAvROnpcC3GrKwuYALd7YP68ncBNkpSWe+px+/Tzb960R4BW9z3qXR
	DateiNq1vjPZ6j6C+P1NJpDmu+P0UcFnGfWeS2dlII4Fd
X-Received: by 2002:a05:701b:2604:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1b5568b9037mr21805969c88.27.1795716684439;
        Thu, 26 Nov 2026 10:11:24 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:24 -0800 (PST)
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
Subject: [PATCH v2 1/9] clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
Date: Thu, 26 Nov 2026 18:10:53 +0000
Message-ID: <20261126181101.3715754-2-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
In-Reply-To: <20261126181101.3715754-1-visitorckw@gmail.com>
References: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101125_564580_F3688CDF 
X-CRM114-Status: GOOD (  11.08  )
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
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
