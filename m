Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED7BD13595
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 03:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LhZgxjidiUYCjYUTwzqK/N5icFI64G0WP3/nDaK1ffY=; b=Qxzkimu/hnMkes
	s/B6FQVkh9RnrURwvafG7xBhbBtrllOaHdwOf3LDiB31PH9F6UVF8kWXO/DcTAuvINiSqqyCNtuKT
	QRaIR2FOewzEWrmxrhaRELL/daFX32mucG/dsz4bBY6HJIqvq7UM4uEemwvwpL/A3t25cxWLVlSHR
	n8u5+9PlwBAmVDxugb4sDjTcI6AEx1in45GNUXyJ8FvpzQao5t+b3SdzK0k0+eCSyz6MDiNpx1viM
	8VJHslPxHkEaYJ39JTEznIX5B2OlyeHHCmoVsmasuhqDyF7Ds7TMZGQ0TBlEn7xaI61oScUlv0+xj
	Nsc9yEx9tVc8jkjqDfUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5GcR-00000009ST7-22Sp;
	Mon, 28 Oct 2024 03:40:39 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Gbc-00000009SHl-07no
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 03:39:50 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-2e2bd347124so2863492a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 20:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1730086787; x=1730691587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ARDip39wIVC1qk/I+1tz8/feGtYsfateMnYyYJ2nUtE=;
        b=Gpa6uw39wvkDePUpsbV94fqjRlVXYDohYXA3cuvxhVvVY2C/ZJutez4iygS4b8dJ2q
         09cpsapx32LvWecseRcjY81AX5b++O26vrNtERTkLaE0hc8TvjOVH6il68nu/24pI3zf
         95un4Ub9lqsVNqD2ktZ4uudc1KP3w+UE8Co+y8fEZyaVoh1Z8grOmbTSime+ikWhYCcy
         sIT2D0YpYzVjUfW7bE/yIx7bDwOlRW1AcuXdmqOe5iRUk2dfriG10qLC0o/JNwV74Xz7
         7Bw3EMiK5TKjut4+sB22Fo7RDfsgDC2/QagSBZDWVAFNvDjYtrglv5ZP0Em6hqHOQzow
         qJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730086787; x=1730691587;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ARDip39wIVC1qk/I+1tz8/feGtYsfateMnYyYJ2nUtE=;
        b=B1+9/VartYOMMOCFLEiWKxfewqABHky4PDbpxwmPEzgW7V53BznwxItujY/msCNcSW
         w/W1uGdI99y2+44eFsJm+h7nK6Lk+GngoOgJam9KW3lQ1IU10Y1lbKEVFt8lFlRtMeGJ
         hO0F/wMzk5JnCWx+4rce/EHFyTfGNOFQqSnHU1wqQiL90ZEJto5a6Y/yhyCgeBuH3wPJ
         qyr2r+xwlR7BaQM8Vu5xEAnYhP55+RxZx4H6r5n8YLsslZzDRsFXv3G0730/bn5ZYKNL
         xDgLUoGjIGuoLHRB0ulaRuQMmqsgshEbMVm9ruGmCuhL2N36iJYgMBNCBYPbeRkYA5Ps
         4JPg==
X-Forwarded-Encrypted: i=1; AJvYcCX3t2Qztc1xUwN96rYf0GEVRHH79LjtB5shGg2EQxQNe1fjqz3GQ8uzZWrLv/493RuoftWv/3dI3i3Tmw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzuMKnV8aNIsUDkaKrDxIdICi6CJs4a0qpduesBS8bHHzK6+7ix
	tIazmSDft69SPdDtyEGskGrJXGj5hjsqITZ66rCl+OvB8IE2K7g5q9B+OqiIzCo=
X-Google-Smtp-Source: AGHT+IHaM+aLcSm1w4qstTcoHx8cZ8OUu/YAd0POOhZWcxfHlNfvpu6ayZbkZQqDbe3fkAu25t7G5Q==
X-Received: by 2002:a17:90a:b109:b0:2e2:da81:40ca with SMTP id 98e67ed59e1d1-2e8f104cb14mr8132454a91.2.1730086786918;
        Sun, 27 Oct 2024 20:39:46 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e8e340e544sm5961888a91.0.2024.10.27.20.39.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 20:39:46 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Nick Hu <nick.hu@sifive.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Anup Patel <anup@brainfault.org>
Subject: [PATCH v3 2/2] clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
Date: Mon, 28 Oct 2024 11:39:26 +0800
Message-Id: <20241028033928.223218-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028033928.223218-1-nick.hu@sifive.com>
References: <20241028033928.223218-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_203948_172893_49B89A34 
X-CRM114-Status: GOOD (  10.00  )
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

Stop the timer when the cpu is going to be offline otherwise the
timer interrupt may be pending while performing power-down.

Suggested-by: Anup Patel <anup@brainfault.org>
Link: https://lore.kernel.org/lkml/20240829033904.477200-3-nick.hu@sifive.com/T/#u
Signed-off-by: Nick Hu <nick.hu@sifive.com>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 drivers/clocksource/timer-riscv.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 48ce50c5f5e6..166dee14e46b 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -127,6 +127,12 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 static int riscv_timer_dying_cpu(unsigned int cpu)
 {
 	disable_percpu_irq(riscv_clock_event_irq);
+	/*
+	 * Stop the timer when the cpu is going to be offline otherwise
+	 * the timer interrupt may be pending while performing power-down.
+	 */
+	riscv_clock_event_stop();
+
 	return 0;
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
