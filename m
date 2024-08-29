Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A50EC7115D
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Aug 2024 03:40:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G3PP/GJjyzgr5zEpt631+iyRFaeXBWxxq9f51orkHPk=; b=GJ1HUogwYJpBGw
	s4Hzr89tWNo7QUlblCKLrWBM07h2leUQ/oHVy8k1kvpuQ4RatGN++jhV2+j43dbQZiu48cwT2tZnK
	AiC76ZirirvXHlBEdOwyeDuannBxE2TyjejwqayLpkVYdSppDj3WeIAEH/lEtCkeRI8doR8POcmJA
	jPY9YnmAYnWnSB1Plk729g4GYY01BvH+cJiXeL4HGBmzSUj7HmwrJmDNNZVJIKPoLJMalLgKJdxTX
	WDkj0MU3xMLh8Rpy+Q1BOhBWdSxyGBZgJToSV/CtnUY9BoxarFPQUdCFZJnB2YLE7DXW3JNmJbahD
	nClDNEjzxePoZb8pLGYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjW1B-00000000O8e-11XJ;
	Thu, 29 Aug 2024 03:40:17 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjW0e-00000000NyZ-1JC2
	for linux-riscv@lists.infradead.org;
	Thu, 29 Aug 2024 03:39:45 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-714263cb074so167879b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 28 Aug 2024 20:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1724902783; x=1725507583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TrwXOu6Y2eq9/DutoAmZcGJLSt10/i5s5gPboSdN3cw=;
        b=GcdQU7LaAinHQM6m6a53fGQtTSBbduuKCd0ozoEKc+ZXxvQ7w73GPwHkk6H3uVN1Cd
         MJYAqyqv67YDtgWTMjNPsHcsFGM8hKrfeAoJagzV2NEpJPCjf3LWJUO1nHmhc3RM8fjL
         ZDX654H7bwWtLMFpI/ogTxNmmRu+0d+gjZ1lbbofXSxuDMiM01CuqJITzcShUdhCJypS
         6VrBI3tjghOJH/i2Fg5ZhFekwJqEF5U1UUFKCVrp92lCno8FsJYhge9uQ2002GU0vMu0
         RUNwRE2Nd98e5sK/YPQpimg1E29pf5AF+6FWtZ6mHCsaqzDhENOIplWqhZotQBUgFUU+
         1XGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724902783; x=1725507583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TrwXOu6Y2eq9/DutoAmZcGJLSt10/i5s5gPboSdN3cw=;
        b=Xu5QTXLgQcOjOFG8KXTaigskgr2dh6KJqv/frgQRxE4mjiDFNFXbOBCtXN/dWahAAY
         rDCeb8fOWO+14e725ky+DAWOG8mzr8F8Tr8rrVg3Lv8Ij0rPBuhWDlHP7jxT3qNP1Nni
         NZFThhnfjDWAl/VJNVK4d6rKDhSdxpJLlJu6xXlu5UJ+jY9m+2MlFI5K6n46JgCxsMcC
         npGHRa6Xht1rg//D6bcYGhID3Y/mBB97RjduFo3ZcAhwVdYO0yk9La04HuUwKl/xn5Wt
         8pPKXYVJXyr5hLDfEH7qItrOx/8VI5DwGJ24L/iUOaDE22UjSDt1pEs2OADCEEo/uPBG
         C5OQ==
X-Forwarded-Encrypted: i=1; AJvYcCVYwIFspbyoaGCKMFkE93p239P+lmJ96iiufUFLW200kt+7tYaD/AE0WL4Z5IGtwz+sJSuoytdZadTDoA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywa7wRKkvTW9OHsIg1y5vRQhuIuPkWVdF6AXMNFLbaO2sRrlNNz
	EuRZ2Wrqbl1EAnjqsHHRmpef23LyjpjhxOOlXPiWufPEVGbAiguWqkt3qoyItbM=
X-Google-Smtp-Source: AGHT+IGCXoBvzsnohRqBHn/iqCDm2IbaqJS23BlnE45K8XNpxo0rAp13dmNYs/C4f+WCpok9krlErA==
X-Received: by 2002:a05:6a20:e617:b0:1ca:ccd1:4b33 with SMTP id adf61e73a8af0-1cce0fed420mr1740251637.7.1724902783349;
        Wed, 28 Aug 2024 20:39:43 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20515542498sm2056065ad.188.2024.08.28.20.39.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 20:39:43 -0700 (PDT)
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
Subject: [PATCH 2/2] time-riscv: Stop stimecmp when cpu hotplug
Date: Thu, 29 Aug 2024 11:39:00 +0800
Message-Id: <20240829033904.477200-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240829033904.477200-1-nick.hu@sifive.com>
References: <20240829033904.477200-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_203944_370021_67EDAB38 
X-CRM114-Status: GOOD (  12.00  )
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
interrupt may pending while performing power down operation.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/clocksource/timer-riscv.c | 22 +++++++++++++++-------
 1 file changed, 15 insertions(+), 7 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 48ce50c5f5e6..9a6acaa8dfb0 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -32,15 +32,19 @@
 static DEFINE_STATIC_KEY_FALSE(riscv_sstc_available);
 static bool riscv_timer_cannot_wake_cpu;
 
+static void riscv_clock_stop_stimecmp(void)
+{
+	csr_write(CSR_STIMECMP, ULONG_MAX);
+	if (IS_ENABLED(CONFIG_32BIT))
+		csr_write(CSR_STIMECMPH, ULONG_MAX);
+}
+
 static void riscv_clock_event_stop(void)
 {
-	if (static_branch_likely(&riscv_sstc_available)) {
-		csr_write(CSR_STIMECMP, ULONG_MAX);
-		if (IS_ENABLED(CONFIG_32BIT))
-			csr_write(CSR_STIMECMPH, ULONG_MAX);
-	} else {
+	if (static_branch_likely(&riscv_sstc_available))
+		riscv_clock_stop_stimecmp();
+	else
 		sbi_set_timer(U64_MAX);
-	}
 }
 
 static int riscv_clock_next_event(unsigned long delta,
@@ -126,7 +130,11 @@ static int riscv_timer_starting_cpu(unsigned int cpu)
 
 static int riscv_timer_dying_cpu(unsigned int cpu)
 {
-	disable_percpu_irq(riscv_clock_event_irq);
+	if (static_branch_likely(&riscv_sstc_available))
+		riscv_clock_stop_stimecmp();
+	else
+		disable_percpu_irq(riscv_clock_event_irq);
+
 	return 0;
 }
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
