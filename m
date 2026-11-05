Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1BD2606A329
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2026 16:17:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X4lSu3DD;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=YPSPbUp/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=WMGjAbcFwOJse0wFNEAmnJWzwM4qoul1/2JUbPiuCjo=; b=X4lSu3DDzpDByeUda4Mx8xteCk
	aSk8E9E0WXpwtZUAFDUi3kCrAqzrTo2CVeVosJaPPmGlJBayInTGsVP7XIWkb+xboa90Nb4GIVxpL
	a6X8K3uQQlfOxFyg5HzME0nUwu3zVcSawbLvEC2p2hzXMnl65UdSSeQ8RcpCNvyPFNfSo4RPo+nyw
	FA911Z+K9EOIx6enVmIdMDVrPoUCh1LlTtQSV7c/pjGbpF7Au2p+Sd4iN8HtG6FE9jsxJTsogCzv+
	J2CERMHKE895BitSAbTaiVqbqK8FHgKEVVDf4yt8+MlAd/5VnZrDQbdbAAPlG/gSyVKdfO/8Bzk+f
	jABponVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09h-00000009ZA7-2dBz;
	Thu, 05 Nov 2026 16:17:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP09a-00000009Z8t-0zDj
	for linux-riscv@lists.infradead.org;
	Thu, 05 Nov 2026 16:17:36 +0000
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-3adc4590de4so1791460a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2026 08:17:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793895449; x=1794500249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pPA5ylsXv8X+ypVgKa/sC5fX3KTDXoivEwkyMY95mxU=;
        b=YPSPbUp/jWrqbXXXp73s3iEmfzMwRRd6sN3YzEZPT0gFm7KwwDOsZFauEoTnOihBy+
         V4nNZBUd/2jMkEiIpgvb3OAX/R/GlXzQS5ktyhdh2v98eIkwZ1spmtxg/Wlu2QAumCYC
         FXcWEP0tNoL6E8VVote2YVRZBujkd5B1X9nlXrw5NcaK9UYoLmivR4ioCoIkGOOsTASg
         TIQVohsCmKGMMb8Whvxv3v6q+W5MdG9hthl6VNN84RpPOl+rRFIOP0/BuuzTdsvAgEVl
         Ra3upCmQTuXqyDmggqTBShmruBe3O/V4rbM8oTLY+JtGmB7Rg4QpPhBevZLWOkxOFQ1g
         VzPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793895449; x=1794500249;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pPA5ylsXv8X+ypVgKa/sC5fX3KTDXoivEwkyMY95mxU=;
        b=wYv9ooU9vPDFd6KnHiO1iO2K8GzFSpo+SM/wrQR/9vY4KVySmxKBV5eKC1yM1Qyi7N
         Nrozg963uqfMkLUJXjaFslE71uHo3pZtnsyofMUASWMzuWfBnzoqZullxov07KMQNue3
         IGj8nYuysIbuQupP6PPard5Pd+ZbA+RC75H3q2k8CEoofro/jkaWAozL0lZZORItg2R7
         QjnmXWbn7t60reuAyx8Mxm4daWcllxtueNLDzphaGMH8i0WBuGM09tr3FP0KtAAhrzRT
         DF1rltSdTIo0B1iF5Wc4X/jTXe7kPDXkwQXQmPdLAOx7iorsuNcETg+eu3m16HLVbw6a
         oGIA==
X-Forwarded-Encrypted: i=1; AKwUvBylyrRDawYTKgN0h3Qw3jpofOBVqza6xKgPVjOgq9I6nxlf1Yaa2ADFxoUKdgbgGDB1cCrDdJ78WIrO5A==@lists.infradead.org
X-Gm-Message-State: APuU4Z+mhZTm8JbAifmiy+7BO3U0r9ZjMU5lHK15RoHunYjEcv7/NG5q
	27faXgmM4+1QcxkqsXPP44l+fbpViENhL7pJIxVuHAtua/u9EoR6SQX7
X-Gm-Gg: AYBFou2pwrKgOtzON7M4o87pG8MCBmNv+vFYRqp1h7yz6dEBZ8En8nrhYnCj6/ROiTv
	k787PU/z56NyHnM1/6vZ/dm3BJhevwFq2eOCgQDV1oVMBTyVHYH6Kb49v/MP0pLMxvJ+WijdbXq
	T+Wc3ObavKtxNtCVHxcr/3sqy3x9CKKxFbOp+RHyJyn19PpYGZLFlRWsjNdVGaTacRon/vUWoIh
	18z/l+Y7/nslyMT3g7V/TQeeHwaxnr+8q99DGfBprpI0ShiNU79T0NwbBP/51N4hF5MLdUH/CLU
	j68+1alKUYRUAGgHdS4S1a+NQ62hoS1dA9zrEHGdHg1rsmTdJOLZncLss+ZCqpLBzERCVE2gQF0
	lCifzZ8Bpi0i8ueMqS+oJvVhBbS6vDvk2++IvGQi2sxYiTTZU4LRq2DRBT3UhZBtInaEFI+rQuZ
	KjLidaQmp/Feq1kGs0LCVOFsic0Kg/ZTOLoqg2hGO6+0NnBOoTDL1ABEJCyYgebXNMLiN1Jn0Fl
	iDMOJ6LWAU2YdpeCOYeW3jOBVBv79KrlldS4upwqC+DfQKAmTmkTpcGTwvZmJVZ4QpWBJY9HoTL
	XncKm7zUaZ0G01F08GlYG/bCFns5jN9oI3YjwyTi1fpzhln6DURm8sHNc7AIj7Ay0Sx1wHRkOOm
	13aOxgNGT6ItFZRiOtNhJDFc=
X-Received: by 2002:a17:90a:e70c:b0:3ab:2737:3393 with SMTP id 98e67ed59e1d1-3ae89835d94mr17591365a91.40.1793895448800;
        Thu, 05 Nov 2026 08:17:28 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b3287a60sm4981556a91.13.2026.11.05.08.17.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 08:17:28 -0800 (PST)
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
Subject: [PATCH 0/8] clocksource/drivers/timer-goldfish: Fix bugs and add DT support
Date: Thu,  5 Nov 2026 16:16:54 +0000
Message-ID: <20261105161702.3515900-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.0.398.g882cbad275-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_081730_272805_73105BF9 
X-CRM114-Status: GOOD (  10.22  )
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
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The goldfish timer driver was previously only used and tested on
single core m68k virt, but the same device is also present on other
qemu virt machines such as riscv and or1k, where running on SMP exposes
several issues.

Fix the concurrency, oneshot, and registration bugs in the driver, add
device tree probing support so it can be used across these platforms,
and add a MAINTAINERS entry.

Tested on qemu m68k virt and on qemu riscv64 virt with 4 SMP cores. On
riscv64, testing was done by passing clocksource=goldfish_timer on the
kernel command line and locally bumping the clock_event_device rating
above the architected timer to verify both clocksource and oneshot
clockevent operation.

Kuan-Wei Chiu (8):
  clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
  clocksource/drivers/timer-goldfish: Fix oneshot mode spurious
    interrupt
  clocksource/drivers/timer-goldfish: Fix resource leaks in init
  clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS
    flag
  clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
  clocksource/drivers/timer-goldfish: Set clock_event_device cpumask
  clocksource/drivers/timer-goldfish: Add device tree probing support
  MAINTAINERS: Add entry for goldfish timer driver

 MAINTAINERS                          |   6 ++
 drivers/clocksource/Kconfig          |   5 +-
 drivers/clocksource/timer-goldfish.c | 113 +++++++++++++++++++++------
 3 files changed, 99 insertions(+), 25 deletions(-)

-- 
2.56.0.398.g882cbad275-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
