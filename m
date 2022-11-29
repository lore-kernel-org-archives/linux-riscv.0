Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172FAC4708D
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Nov 2022 14:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BZb81G0pcTviN5ojJSS29qTczzGQ5si4zJCT3kpMmog=; b=36F2Ao5e40BR9E
	wHytBp+ilAQbQxQLsv5ilwi18xQcyzqfPON5HTl9UcgBAboQBDFZkXzaa/M17SqgZk2a6+9XUCoFh
	bzcvdQjKGB5TXNLwTNmhjpdDGJF7vkcTs5i6kOgQNRiPXSL+CmvlwzQqoCFPN/yxOBlZt3fr1hmyW
	TnNCaiJcID4QbT6/HzIryYF5KsywvM8rU6iHljrOl7lGCrXcP2TIBMiuT2klAil+bnsTeHdZ1hd3u
	XrAGZVGoQ+AmpTMvcTpk1ezRZ8yMwahwtbEbs9PE1YSkIjclAA1vGTWzxjUzThE7WemoloiC7e9mi
	1sZpfw7YTHfWBOw0RXng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Cx-00930k-RF; Tue, 29 Nov 2022 14:03:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p01Ct-0092tK-Oi
	for linux-riscv@lists.infradead.org; Tue, 29 Nov 2022 14:03:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id o5-20020a17090a678500b00218cd5a21c9so13513249pjj.4
        for <linux-riscv@lists.infradead.org>; Tue, 29 Nov 2022 06:03:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dmATt0XXLfjGq8KTAB6LQCwLbX+al5xHeC21A61DKj0=;
        b=hY/6z86R84EwODbjkiiGC6QK0QG6Br2dUspKKN2xxrJ8I9quSTGKQCLag9z6OAVc5U
         EATKmpotnBhW0OItmcD9+yaySF26TlP5OjXCEIpBptR7dWma01PR8ptk7OemJ66JbquV
         Lb+PnPKW6yYk7VWlNMmwkLfSvnLEfccmBsdRACeew8SunS8mKXTJtt7wCEbM+WTstp9Z
         Tv880hcMAeQY8/X4jWNG5kueNio+R32G6GlAnPPkSudTu8fBS2MKf4j9utmOa0AYl5vL
         w7M/n4cIsxQfcp57UyuMiKkFo6dRWmxjFWQ5FM6+Al2cicW24t2uEeZKqUm2/PHm5el3
         wYHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dmATt0XXLfjGq8KTAB6LQCwLbX+al5xHeC21A61DKj0=;
        b=niHOiKc3DOalMLvJ1NenouIn/1OEeu9I8giroZf/2MJgLk57XhciygxeCwWQy17WSw
         nUzxWDDPRV8cfz9Wv+Ufl8BlWaWGNZi+5Vr8i2RspgIpnvhW5Jq6KwF4Fqj/uf7CQsSQ
         DKColliI4DGE+Jqt4H1faLIC6lOiOm1XhHit/g6CqJgxfCoS3EN8ucwaH2seAd+XfnT+
         tNaIMJX9N0oSurYDKQyRja8HHk6e/KNdtzXBj3GjTip7K9FoHsG2XXQfsD3N2Kq18Anv
         FnjO8ba0I3hB47TDA081n01Irmrdrkz6aZUcL5A1NMkypnUNDx0ctIrBez6+OBKXChXm
         R0gQ==
X-Gm-Message-State: ANoB5pnsmbUJf7fnZ/TBBYbPl+h2XdWV2ozs8oMFf7J5mrTUtde1uf9t
	hbfO2VrpsuEma/A+fByV8SpaSg==
X-Google-Smtp-Source: AA0mqf53M2VbsnM+2H/qCK2bbZJbD9dskoicTq7vf6i7UsemhtdUPZBj0ZAKIkhFlUctXmNdwVz6fQ==
X-Received: by 2002:a17:902:70c9:b0:176:a0cc:5eff with SMTP id l9-20020a17090270c900b00176a0cc5effmr46522128plt.128.1669730607996;
        Tue, 29 Nov 2022 06:03:27 -0800 (PST)
Received: from anup-ubuntu-vm.localdomain ([171.76.84.98])
        by smtp.gmail.com with ESMTPSA id k30-20020aa79d1e000000b00574f83c5d51sm6013747pfp.198.2022.11.29.06.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Nov 2022 06:03:27 -0800 (PST)
From: Anup Patel <apatel@ventanamicro.com>
To: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: Andrew Jones <ajones@ventanamicro.com>,
	Atish Patra <atishp@atishpatra.org>,
	Samuel Holland <samuel@sholland.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Anup Patel <anup@brainfault.org>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 1/3] RISC-V: time: initialize broadcast hrtimer based clock event device
Date: Tue, 29 Nov 2022 19:33:11 +0530
Message-Id: <20221129140313.886192-2-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221129140313.886192-1-apatel@ventanamicro.com>
References: <20221129140313.886192-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_060331_840892_418C78C2 
X-CRM114-Status: GOOD (  10.61  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Similarly to commit 022eb8ae8b5e ("ARM: 8938/1: kernel: initialize
broadcast hrtimer based clock event device"), RISC-V needs to initiate
hrtimers before C3STOP can be used. Otherwise, the introduction of C3STOP
for the RISC-V arch timer in commit 232ccac1bd9b
("clocksource/drivers/riscv: Events are stopped during CPU suspend")
breaks timer behaviour, for example clock_nanosleep().

A test app that sleeps each cpu for 6, 5, 4, 3 ms respectively, HZ=250
& C3STOP enabled, the sleep times are rounded up to the next jiffy:
== CPU: 1 ==      == CPU: 2 ==      == CPU: 3 ==      == CPU: 4 ==
Mean: 7.974992    Mean: 7.976534    Mean: 7.962591    Mean: 3.952179
Std Dev: 0.154374 Std Dev: 0.156082 Std Dev: 0.171018 Std Dev: 0.076193
Hi: 9.472000      Hi: 10.495000     Hi: 8.864000      Hi: 4.736000
Lo: 6.087000      Lo: 6.380000      Lo: 4.872000      Lo: 3.403000
Samples: 521      Samples: 521      Samples: 521      Samples: 521

Link: https://lore.kernel.org/linux-riscv/YzYTNQRxLr7Q9JR0@spud/
Fixes: 232ccac1bd9b ("clocksource/drivers/riscv: Events are stopped during CPU suspend")
Suggested-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/time.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 8217b0f67c6c..1cf21db4fcc7 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -5,6 +5,7 @@
  */
 
 #include <linux/of_clk.h>
+#include <linux/clockchips.h>
 #include <linux/clocksource.h>
 #include <linux/delay.h>
 #include <asm/sbi.h>
@@ -29,6 +30,8 @@ void __init time_init(void)
 
 	of_clk_init(NULL);
 	timer_probe();
+
+	tick_setup_hrtimer_broadcast();
 }
 
 void clocksource_arch_init(struct clocksource *cs)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
