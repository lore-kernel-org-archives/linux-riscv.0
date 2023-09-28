Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82B26CE7B17
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 10:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pv1QX2Wn2cwsqLpm6tvtnlkrFIJYCZdi18xJ9zM69oo=; b=fGqmNFrEt5LigJ
	BHtkg5ov3bRshR+X7U1hE7AEF/A3t7rdX8SC2GyXi/OCqGF0UBFJOYQ8sBdfyhOAk5HwaOF8ytX1R
	1cKjVXDFNw8qQdd7W97rwh6Feyp0FFadMRNhf/8sxPwUY5blMfkJEqIHarewk0+iIuj8P+fI5Rc2R
	jZrh4lIwHisSL8mQYSFwkrs+ECyVGxJwAn5Rlh/WZ9pYLR8JZUB8wLM2xzmc67lDYJAHLk1e+bVZP
	yCgcmmGODxtfxtDwz5gmIuQkJGZlrDkehHoGQm6zVf3vVRKrkBgP6DbVdA+SFOqIj+OP+9ofV1rwX
	v+p4+odrdGovmVJKp0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qloWs-002vb7-0b;
	Thu, 28 Sep 2023 10:45:58 +0000
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qloWn-002vY4-1Q
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 10:45:56 +0000
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3226cc3e324so11584954f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Sep 2023 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695897948; x=1696502748; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VhkKgzeF+Wc46hzctnSH5naMu5wzs0T1BbFDxxyizyE=;
        b=UPyRyLLHmZB141Uc9DK9aF2UfCUAzRZwEMGPioqltQrIy4mY8ob6AGlZhbtKeCRP92
         qdvht1/ifa6kdayG6mT7ziIqZhhxrIgMM2nG/QjNd4Ii5iiULaJOxKc30vm9dsIA3asw
         NuQAQPedJ5cOxHLWe7onUkwjui//sJ0TT3aDjrDNHoL8MzFvG9XLnA9FMoD2GdWgfXoh
         HswgqMIQ3+9T+6qIfeV8kbCllYEQQ7NoVJk2ceGhfGxDNKM6NDv18s1ff7jeujS3/Kdc
         vHWFUZTwI8CLdX/kb6nCIbS5G2O3MRV+Q1btH1KoG/KzvFT5O1QPYPhOJ1hFpIu1TCSZ
         9rpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695897948; x=1696502748;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VhkKgzeF+Wc46hzctnSH5naMu5wzs0T1BbFDxxyizyE=;
        b=KAyK1w0IC6yDBPW8PsuiS3DX8tmuZFNN70w8J5JVKAfBPemyXFh0eB6KT8vkvDkSgW
         n9wfFjqB6p5F0vyLffWgRhPXxlNJkC5MJXGzoKNReoAmfIHnTqM+WW2b3VuJid/pll0r
         RMtjTaCJGZG7qgV4vGZ8/xvzKgIC+htihWXJ3IsD3FF3nIv4pX/qN4JPEjkVZ+sYfur6
         V1BC0r93BywRQEPKGw7hYXSRv+MNDJFnqW75MnS+VGmRxvLlD0niBJihQJQ/lB6ixgZ/
         wETxuhiUtWT4cN3X+8caBqXQkBCS467zVfojtb9hRwFS0UoboncTsli9GTk0z872hDWl
         Dvng==
X-Gm-Message-State: AOJu0YzofPOuRNuATBGg+HRrjrCFCAnddBwxiH8jQMKNAN2NYqshpIJP
	0G+a8Pm5G+p9KdrHVp26ne4=
X-Google-Smtp-Source: AGHT+IEAWxV3yJ+fenO/6XYiC3Fe00mDOYaWiRYIlW7tjH9MozduQaMk04bQ199omksdGYfidBadgw==
X-Received: by 2002:a5d:49c2:0:b0:322:5251:d798 with SMTP id t2-20020a5d49c2000000b003225251d798mr791432wrs.70.1695897947919;
        Thu, 28 Sep 2023 03:45:47 -0700 (PDT)
Received: from prasmi.home ([2a00:23c8:2501:c701:b263:a94d:3c0:fce6])
        by smtp.gmail.com with ESMTPSA id q25-20020a7bce99000000b00405ee9dc69esm7303522wmj.18.2023.09.28.03.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Sep 2023 03:45:47 -0700 (PDT)
From: Prabhakar <prabhakar.csengg@gmail.com>
X-Google-Original-From: Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Samuel Holland <samuel@sholland.org>,
	Anup Patel <anup@brainfault.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Conor Dooley <conor.dooley@microchip.com>,
	Biju Das <biju.das.jz@bp.renesas.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Prabhakar <prabhakar.csengg@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: [PATCH] clocksource/drivers/riscv: Increase the clock_event rating
Date: Thu, 28 Sep 2023 11:45:20 +0100
Message-Id: <20230928104520.24768-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_034553_516908_1A9D38B0 
X-CRM114-Status: GOOD (  13.93  )
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

Renesas RZ/Five SoC has OSTM blocks which can be used for clock_event and
clocksource [0]. The clock_event rating for the OSTM is set 300 but
whereas the rating for riscv-timer clock_event is set to 100 due to which
the kernel is choosing OSTM for clock_event.

As riscv-timer is much more efficient than MMIO clock_event, increase the
rating to 400 so that the kernel prefers riscv-timer over the MMIO based
clock_event.

[0] drivers/clocksource/renesas-ostm.c

Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
Note, Ive set the rating similar to RISC-V clocksource, on ARM architecture
the rating for clk_event is set to 450.
---
 drivers/clocksource/timer-riscv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index da3071b387eb..e4fc5da119a2 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -54,7 +54,7 @@ static unsigned int riscv_clock_event_irq;
 static DEFINE_PER_CPU(struct clock_event_device, riscv_clock_event) = {
 	.name			= "riscv_timer_clockevent",
 	.features		= CLOCK_EVT_FEAT_ONESHOT,
-	.rating			= 100,
+	.rating			= 400,
 	.set_next_event		= riscv_clock_next_event,
 };
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
