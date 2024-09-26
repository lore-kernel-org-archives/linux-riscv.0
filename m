Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5DB9CCF9E9
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Sep 2024 07:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0JgDQvxS7d1wa6dsJLA15kz1UfkeOHhq9uJbPDVUjQM=; b=48wXcI/Nty9D9f
	mcs/q7yfe3i19lDSc64XmCNo79QSiFMjRwJvBjYZr6xmsGMhHC2px/yxRn9E3er2xM9yIBHgZwCf1
	8jqBJ6Ebq/qG448vyWLpnQ6C83D/1cIQcJD2TbQFtoPzwTDjckKn45KVIFY5JnXZe1b3fptHQN8ih
	00Zy/7tqoaQZhS5iTUZPrvgP7j5KeS9yfJK2I3Exml4Prs2R5sAXSZoTRS0zT4yXN7elnA4etxnlB
	rWYlHEhNYqY4eqIfo5EC9NU3xUu/e3WkVnKLl1VwqoxIc2Nj7jgE4ZkF88kJL4gDwBWVl797dwx9W
	Vc90nv+qCKXLufxwIRQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1stiir-00000007TOS-3Tnj;
	Thu, 26 Sep 2024 07:15:33 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1stiQ4-00000007PZQ-0Oj8
	for linux-riscv@lists.infradead.org;
	Thu, 26 Sep 2024 06:56:09 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-7e6d04f74faso467995a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 25 Sep 2024 23:56:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1727333767; x=1727938567; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4Pc22EUqI7DPrVM6a23jwJ8zZFnPa3YTszP9VJN1ZIc=;
        b=LJroFsv69bZE+zPKKDcIir+1TzKmpOQ6CUpHNLruHxiuZpF9PrlHY5jkRk5D6LHzdo
         4hlwg+mC/0BdffXpCFNF5bBI+eCDivGSSv0eCgVM45LafeKqO+W5FX3vbV/WEOXG1DBy
         9xgW/8d7MyFc5W3q4NUslSaA/zmPFYaGXoZqLYvHeLBS2vs9bg7mq3KcH0ic6wH2fBVV
         aNwVKD397GaVSln2K+JgNQRFyiayDGlgnuWdxGJRPQTwKhnzgTg8REBJCRy8X9uu+TK1
         kCkhh7Y+EeMdwFi+QKJWs1yCMJ2Op0nWM/QNk2hp58ptIMRtYUfOEn84GQczQ2Ygd5UU
         sAcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727333767; x=1727938567;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Pc22EUqI7DPrVM6a23jwJ8zZFnPa3YTszP9VJN1ZIc=;
        b=XlO9UP3m89REVwniPITQZqLfNJ1NBmCb1d6Y/Nht/11QBXdnIhl7SxNYjPVdAeVjS4
         SUGzGF2MHPR8S4Nb7+1JYQhC0KpsF7lWo5V1FKkNuOYMS7IAexp+/uV64AKHcwhRMR3P
         eGb8ReEf8zvUerNMgBTOBLJ1ExVUZLfBP192wX5d6e+gmIbzhNdAAd9v4G+haLSPec41
         38T37sNvdAy9+9gl+ss8NKh7s9TMNO9ZohBydhTf0YvKRRXTMSpRPOGB1rhbxkbQ4eNw
         /b5AdwDjqQuFF2AfSWMAY3Swos3KwgO4eVwmfvJb/R48rcS3wn/aXpOD9P2SSfpos+9F
         qL6Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrIeimL99FpiysTGrq/sC36w+yW+QMEwFtw1hKU+tU+SDtSnhwgOVUX2bHxxRvlziJSYbAbe3AKTe+vA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7cmO5hHQz9KcHnUnBtWC7dh3sSyvd7WqPTummasNb1WIo9972
	uo1l/rjaATwEwQ0mJzEospdjxZ8q5hj6mY5z1J6E9YjJ1tiTDfCmjVDy9p+DZxU=
X-Google-Smtp-Source: AGHT+IEO6HyO9ourHKj89akn4hwO0QEWGH3NS+KxhD+L1x5BptifZgMYW8BoqFjQGO0+rzUQWyRL/Q==
X-Received: by 2002:a05:6a20:7490:b0:1cc:e71d:ea10 with SMTP id adf61e73a8af0-1d4ebe73f00mr3514567637.14.1727333766880;
        Wed, 25 Sep 2024 23:56:06 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7e6b7c73120sm3592352a12.68.2024.09.25.23.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Sep 2024 23:56:06 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: greentime.hu@sifive.com,
	zong.li@sifive.com,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Pavel Machek <pavel@ucw.cz>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Anup Patel <anup@brainfault.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Atish Patra <atishp@rivosinc.com>,
	Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 3/3] clocksource/drivers/timer-riscv: Stop stimecmp when cpu hotplug
Date: Thu, 26 Sep 2024 14:54:18 +0800
Message-Id: <20240926065422.226518-4-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240926065422.226518-1-nick.hu@sifive.com>
References: <20240926065422.226518-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240925_235608_158921_70049D93 
X-CRM114-Status: GOOD (  10.78  )
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

Stop the stimecmp when the cpu is going to be off otherwise the timer
stimecmp register while cpu non retention suspend.

Suggested-by: Anup Patel <anup@brainfault.org>
Link: https://lore.kernel.org/lkml/20240829033904.477200-3-nick.hu@sifive.com/T/#u
Signed-off-by: Nick Hu <nick.hu@sifive.com>
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
