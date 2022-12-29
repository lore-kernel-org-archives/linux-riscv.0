Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 231DCC3DA79
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Dec 2022 22:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tajnLdy+l0Q7eQuAh/+7WXDZ5yI3zFRHsrIcwlU+PZk=; b=bCFOB1QLukCybw
	h8l630+pAkPKQpjBt0JsPiP3S2EsJwfM3Vjac5ppQBW7nuiYW8RHPpw8TM2HBxOvf5fBDS7JYghy9
	pKY5ha+yRZajZ2AqOFK0Ft/7s8NCHAX0+xuiDNMe0CNBFkYSR8z4otPU9/vj0phXRf/VT6vMlssuz
	Wo/0KE0QDeddNxJUCN/ZouzSwEwhuR2fvAN7UNUwSLU8iXvyMJXMDeeX4N1jL4wAa9NjdKYLYF4nS
	YewAfqg/YT4yDniAxg02m6Z/ZZFiAkl5YRdNLrvCRBotIZQXdo/1kADJPd6Gd1J8aw3diM7XxEv3n
	/AKIzLgODu6+ZQw9mlOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB1jJ-002qDB-Gg; Thu, 29 Dec 2022 22:50:29 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pB1j6-002q9s-41
	for linux-riscv@lists.infradead.org; Thu, 29 Dec 2022 22:50:18 +0000
Received: by mail-wr1-x42d.google.com with SMTP id h16so18444830wrz.12
        for <linux-riscv@lists.infradead.org>; Thu, 29 Dec 2022 14:50:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9pHkqivt6f67irNbuQhpHiA1tWMOcGwgyjN35gn979k=;
        b=Yli7mHNFzGQhoCn7aw91t3u9/1u5SB02O1NkR7W+efSrpymfrp0zw5IHjDnlN2dYMp
         uiKSjApGAPXeupU3PEceX0aMiGVx0fxpn8o+LMW7P0ANKAPKhpAGS3yIxWIxi3wZ7SCZ
         JZ8BB/6V6Cre5SbPEDl5BX9rKf2JBipH+DkmhDku+IjvjW2Q1fC/ogDFAvbGSFPKMVaX
         JEZtrEuGbhxeJTuuFOM1BB+ggSwhH7Vj1yDCDaXxPyvIRt+hYxEjzbd9OiZouVYIGH7Z
         J//1hzHm5FznN7yksxVTTSItoUd1YHMl7GN/OKZalmshaujHERrh33pxRATlQFYPyXWY
         X6OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9pHkqivt6f67irNbuQhpHiA1tWMOcGwgyjN35gn979k=;
        b=q1kEJ6dN1m67hFeEBldkOSSayg9xEwt54a9QWFwvfguj0yU1bAB9iTeWOGerruF21M
         uJlFsSGeY7tYAkLzlo6sHMYNijbnmv6pXxW7Mio2P5euWk0s9HM3DAsLjnS2KNs/zbuJ
         lBMH97te04K+sdzrGPH+fqntFJGQ2Wu1RpsQLjJP/P7/LOB3JURzPoDBNFrtMS7obxVw
         UmMWqfEOyDyz9RKhRkfkNqLXKqgvyPqAfosIsTgbvd+VGrMGvdINUoz+4ORdWj5vVsVz
         INST0URy9uTE0cq/xW7rGMsQe7gciCsLDqhCd3eOaH0xz9ujZuFmnBa3WAWJOQgM2LGH
         8Djg==
X-Gm-Message-State: AFqh2kpgEDrA7dv/v0QsVpMbd29Uzy/7/ZT7y5gtpHNZTZaqUB0hmtB5
	wJ46Dl7d1OhsVZVDNHyZqbs=
X-Google-Smtp-Source: AMrXdXuAHURvza0jONNVDbmBntBXkmiTXZBHq9TEUxwwGlnr1ut7EMqEA3bQIVslZNW9Su6lxo5Q1g==
X-Received: by 2002:a5d:6e0c:0:b0:27d:a1ea:dcfa with SMTP id h12-20020a5d6e0c000000b0027da1eadcfamr9450830wrz.19.1672354213671;
        Thu, 29 Dec 2022 14:50:13 -0800 (PST)
Received: from prasmi.home ([2a00:23c8:2501:c701:88e9:3a08:4328:85c4])
        by smtp.gmail.com with ESMTPSA id o2-20020a5d58c2000000b0026a4bb75477sm18497702wrf.28.2022.12.29.14.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Dec 2022 14:50:12 -0800 (PST)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v2] clocksource/drivers/riscv: Get rid of clocksource_arch_init() callback
Date: Thu, 29 Dec 2022 22:46:01 +0000
Message-Id: <20221229224601.103851-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221229_145016_390253_910E2032 
X-CRM114-Status: GOOD (  12.16  )
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

From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Having a clocksource_arch_init() callback always sets vdso_clock_mode to
VDSO_CLOCKMODE_ARCHTIMER if GENERIC_GETTIMEOFDAY is enabled, this is
required for the riscv-timer.

This works for platforms where just riscv-timer clocksource is present.
On platforms where other clock sources are available we want them to
register with vdso_clock_mode set to VDSO_CLOCKMODE_NONE.

On the Renesas RZ/Five SoC OSTM block can be used as clocksource [0], to
avoid multiple clock sources being registered as VDSO_CLOCKMODE_ARCHTIMER
move setting of vdso_clock_mode in the riscv-timer driver instead of doing
this in clocksource_arch_init() callback as done similarly for ARM/64
architecture.

[0] drivers/clocksource/renesas-ostm.c

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Tested-by: Samuel Holland <samuel@sholland.org>
---
RFC -> v2
* Dropped vdso_default static global variable
* Used IS_ENABLED() macro
* Included Tested-by from Samuel

RFC:
https://patchwork.kernel.org/project/linux-renesas-soc/patch/20221211215843.24024-1-prabhakar.mahadev-lad.rj@bp.renesas.com/
---
 arch/riscv/Kconfig                | 1 -
 arch/riscv/kernel/time.c          | 9 ---------
 drivers/clocksource/timer-riscv.c | 5 +++++
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..9c687da7756d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -12,7 +12,6 @@ config 32BIT
 
 config RISCV
 	def_bool y
-	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_HAS_BINFMT_FLAT
diff --git a/arch/riscv/kernel/time.c b/arch/riscv/kernel/time.c
index 8217b0f67c6c..42bee305e997 100644
--- a/arch/riscv/kernel/time.c
+++ b/arch/riscv/kernel/time.c
@@ -30,12 +30,3 @@ void __init time_init(void)
 	of_clk_init(NULL);
 	timer_probe();
 }
-
-void clocksource_arch_init(struct clocksource *cs)
-{
-#ifdef CONFIG_GENERIC_GETTIMEOFDAY
-	cs->vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER;
-#else
-	cs->vdso_clock_mode = VDSO_CLOCKMODE_NONE;
-#endif
-}
diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index 55dad7965f43..c416e5e934bf 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -77,6 +77,11 @@ static struct clocksource riscv_clocksource = {
 	.mask		= CLOCKSOURCE_MASK(64),
 	.flags		= CLOCK_SOURCE_IS_CONTINUOUS,
 	.read		= riscv_clocksource_rdtime,
+#if IS_ENABLED(CONFIG_GENERIC_GETTIMEOFDAY)
+	.vdso_clock_mode = VDSO_CLOCKMODE_ARCHTIMER,
+#else
+	.vdso_clock_mode = VDSO_CLOCKMODE_NONE,
+#endif
 };
 
 static int riscv_timer_starting_cpu(unsigned int cpu)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
