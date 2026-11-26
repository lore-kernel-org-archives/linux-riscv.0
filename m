Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB7B7606A334
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 18:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=eCuMDtFq;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=syqUgwFR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=MiPamKxAuRwTVbKG7QeY/jFDyRz6J3P5nnIeGXM/MxI=; b=eCuMDtFqwCTWoHr9PG68WPMU7X
	7WvVMC85YvTasBvZc256zC2qfp+FHel7GsP9IwXEWiccqucvIAlYA7hYM3LAIGdJV2UC3HjC+s5Wc
	PrKivMqhGr6m8ndjmTE/KLrwoYs3VJ+mXM/W2klwypJAuRLjzAwMHOiSBB4hriFH5oWTRCe6b11wx
	R1uYZJebogZUDLZqkah5bSV5VvX1BUi10JIl9g3vHad1b/jfDEAueuwAWyZRz2OLmJjyCmYjlPyP2
	GlIQA/s6D4HnBrnxzTl/mt+mSRTIIR4YNxhf48i5XE+VQVQVKZHt4W/KoxLUtWIbLSJtaTxGPdsgp
	MTPdZ6yA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwL-0000000E8mY-2wn4;
	Thu, 26 Nov 2026 18:11:25 +0000
Received: from mail-dl1-x122b.google.com ([2607:f8b0:4864:20::122b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWdwJ-0000000E8lI-2D06
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 18:11:25 +0000
Received: by mail-dl1-x122b.google.com with SMTP id a92af1059eb24-170135e43c7so11299543c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 10:11:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795716680; x=1796321480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xFsTNbg6lSpPb9VHhNPoPU7xGJLiib7jmQ/aLuF0bIU=;
        b=syqUgwFRJe7eT0N/oN0gJaYXreMdXhNsKREd4tUTnnoZuT0xokVMFkyq6lhvONelC8
         nPebZHWilV9yoCVpjhalsRojXBJaFyt+kM3dQpb3zsIdhL80uMN7HSRe7CvXygkAc1GD
         hAwbF8UYGG/GegOTKtVhLGfQDEyst8+uVMJ4iQyiwEllfki4QWHT5HgAQpcaUqxK0utd
         Mc3k2OI9jAH7BGtTntyvKePCGUzoStUs6vaVPtcnRk78bx3r5mrkN+zUH6Mqe6x8CrM5
         2hdyKVLKuCMKE6o8ayhdNlLg1niTp8gb+Ghttu5KpRTFtvoHks7v27cuGEk7dhFSPJfZ
         cezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795716680; x=1796321480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xFsTNbg6lSpPb9VHhNPoPU7xGJLiib7jmQ/aLuF0bIU=;
        b=sLSQFXtdySJbnezfZua6/j0jqoSSjDCZQu5tmSLp4HsZXcopY9Sh78+s7bfVQd2sAi
         LfcZNUujq1YUgl/fmDEzN6c/0YzotUuGjx9ROhFVEffQ7vKlMpv+Qp7mb6tlwYFQSf8s
         ZysQ0Qw+OYyfoylpXZUWh3vaDQge8ffLqBjZm4fvE/gsR+OJY7pnqndq9QLBRjcMVGoF
         KGCMTtBmXG5wB3TngnmIoEkxRCYYLPYD117+lGZlSsHOn/gux1JOwt2dXNzStbUyY9En
         36B+koHgvubbpbyd/KQ9mSiyqvrVsJOQROVwYbGHJFZWbmsiGi4PFYlwnMKYAP+AyY8p
         /ETg==
X-Forwarded-Encrypted: i=1; AL+hErHMSqItTzHlsBCAofo6jPLqAvmnrtR4/SdbEtE61Eng9WKni+w1Zi0x5ZqWitIQCnCT1ljl8YALGGWVFA==@lists.infradead.org
X-Gm-Message-State: APuU4Z8vkvxevH1cN8yUyspD2/AJtH+aXGSvV2DGBW35cC/Y9yHC/X/X
	nRdac/zcBmonomnuI4e1ZXDq913NLGTRns+bq5TOhxn8KUB5TCy3/cWG
X-Gm-Gg: AZFdTZeSQDcnNSyagKjGdv5s4zX8ZXUxJ8nrV1CfQmiJoAV9s4WU8akHYKhHU5d3LB9
	jQerBXoVrzDcRTH3St+LRBnkABqG3bT0Dxf7iDv0WYFm5amBVhRbOgSS0sYLMjHYx0mK2ALsxDB
	c3dJ4L27V7X7Pwp0BjJBJ5RN7R5oRLILexOU95dZ+Hl+Ly0ftGZFE6f70/xh5yeJqS/9Tw9fMXL
	yRX4sop1ZT2Oz085qKztZILQXyzEDXUa54jcFjBasf7ruvv1HsPs8dFwH33281yAHviPve0dJu0
	n/kU9fpE+61z9Hyn0CO3U3HzW1CnjsZUUnuQKxgxLZNS7RxArDFx/dAMSBpaMH7OqCXNYFVKMkj
	06VQuiV/Mu91584bpJuvIExY5+FEchMAeYtfbty+CuwYcjTvi+RyjTMHMZqkdw0VGhr4Vlgl9To
	Yk5lw5tWm3u56p5tvx23DbQR4Jngki3UWZCafvPzrG5dSy9ZxBtHBfmV1oSgt4VyNjrx+cKJvna
	hO1oiJ5a8toPhgvBczSoFVyFzC9aWXp6+lF8QcAb9RSmTdoyzucotoH/gC4LSqTlqcjoGKeNOuB
	p82lB5Gm1fjsCDikSc4iNUk2z86OJ1//WgnZnqDZUPTBjzJ6cCScluPBYSkaaF8vYHSm/lxSlCl
	oYDMgXF+TC/M6CoTNF91cIYM=
X-Received: by 2002:a05:7022:3b8e:b0:1b5:32d7:7d73 with SMTP id a92af1059eb24-1b5568f3283mr26472626c88.30.1795716680250;
        Thu, 26 Nov 2026 10:11:20 -0800 (PST)
Received: from visitorckw-work01.c.googlers.com.com (55.11.81.34.bc.googleusercontent.com. [34.81.11.55])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b55681301asm51183875c88.8.2026.11.26.10.11.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 10:11:19 -0800 (PST)
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
Subject: [PATCH v2 0/9] clocksource/drivers/timer-goldfish: Fix bugs and add DT support
Date: Thu, 26 Nov 2026 18:10:52 +0000
Message-ID: <20261126181101.3715754-1-visitorckw@gmail.com>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_101123_886938_147F6C2A 
X-CRM114-Status: GOOD (  11.86  )
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
---
Changes in v2:
- Initialize timerdrv->ced.irq alongside cpumask so SMP tick
registration operates on the timer IRQ instead of IRQ 0.
- Set timerdrv->ced.rating to 100 as a base-level rating.
- Change the Kconfig dependency from !RTC_DRV_GOLDFISH to
RTC_DRV_GOLDFISH=n to also exclude the module case.
- Rebase onto latest master.

Link to v1: https://lore.kernel.org/r/20261105161702.3515900-1-visitorckw@gmail.com

Kuan-Wei Chiu (9):
  clocksource/drivers/timer-goldfish: Fix latch corruption with spinlock
  clocksource/drivers/timer-goldfish: Fix oneshot mode spurious
    interrupt
  clocksource/drivers/timer-goldfish: Fix resource leaks in init
  clocksource/drivers/timer-goldfish: Set CLOCK_SOURCE_IS_CONTINUOUS
    flag
  clocksource/drivers/timer-goldfish: Drop redundant max_idle_ns setting
  clocksource/drivers/timer-goldfish: Set clockevent cpumask and irq
  clocksource/drivers/timer-goldfish: Set clock_event_device rating
  clocksource/drivers/timer-goldfish: Add device tree probing support
  MAINTAINERS: Add entry for goldfish timer driver

 MAINTAINERS                          |   6 ++
 drivers/clocksource/Kconfig          |   5 +-
 drivers/clocksource/timer-goldfish.c | 115 +++++++++++++++++++++------
 3 files changed, 101 insertions(+), 25 deletions(-)

-- 
2.56.1.839.g22a8290db9-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
