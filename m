Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA94CCF9E3
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Nov 2025 07:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tSBt1Exus7hRY2yOjsjt6BFaV9ULGQ7tvAM9u/O297U=; b=zVvoOcRsGxz1FY
	IfmYuzo27TMb6IS3JpXFXvID8xDT9nHzEKDRpGbboXADP+9oVN22ZvZ4RemlNAeSqXAxhHT2YrztT
	eeDC66hosjKeG7dUtmJnfQXOeGiYy0BYQKne0U2dFc7X/ya2ot1QmtTjKtOGR3czvuf9LD3FxmqFK
	R/aQGFdo0TmLBSmyvGDvhNTShbJPMjL01p5WCR+kBbuG+WdnVV0oqImW2LbgZRT26/Sw4deD1pCFy
	l2SMfRaxIt4rEK6c5CdC04SVL2Q20xFFW2jkD7J7mfQNf5ddRHKWGlsqrwxsSL+iy0n7RgcwFUG1+
	DhKzzzcBigAHRFbVc9og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiuV-00000006h44-23Vh;
	Tue, 11 Nov 2025 07:35:27 +0000
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIiuS-00000006h37-3XXt
	for linux-riscv@lists.infradead.org;
	Tue, 11 Nov 2025 07:35:26 +0000
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-b6ceb3b68eeso2439623a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 10 Nov 2025 23:35:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1762846524; x=1763451324; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=533MpmlhqTKJtLtKqvZVG6ekGMT1k9z8ZUML8V8gWiY=;
        b=grs8J0X8Pn5D+xmWvhnzJbhqNQCidXcBilb87CCUwIT/Fg9l+9y3fbtLvVK5m2rWX1
         h78zPT/uu9dDxzUtW1Vk/8bLiZCaZPQb4d0tsqtUOnq98JpqeFhViQ0W/NNZkv0KwYeJ
         AtouCHhvJRcFoPc7SihDboz6/hw1rST7AMXrJJBz5lgfU9t35YMgfd7BLQE4+QbPixqm
         T2k37LyW/weeE227S4woFQSZeEhthsaPz4oo8yOzh+iXV+BYMMWLLUYsqbfuyNq/NYa6
         lp+hZQindKOH33AqWyGDIsnYl6cXOuHxGQzfNc2rpz0HuT8BYM3Vf+cz/gfCMBjuBJLI
         0vzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762846524; x=1763451324;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=533MpmlhqTKJtLtKqvZVG6ekGMT1k9z8ZUML8V8gWiY=;
        b=vxwmaRWkKkHsNan7xzcAplFxKrUTsk3hQ/U/OiO0lY8bjg1ZEkeRV0Qg2qUYIV56ih
         sMGd5agubrHbnoS9hWRcU8Vg/dIwp5lpzIMf52Fp5XBwBtlLg4sGuCq263FgTOCJw9lZ
         P5sUqxa6hFLJvPHtmQ9hDIkANcAtW0fm+wPN8VMGhvbyu6qIGt5TxNfH+cDs2g23DhLH
         xCcJDHu3/iEErYlUdO4eu0WTXIEiNyWKHLL+Oml++tFH3CuawJLkuKQskhbTgE2S/+ka
         uXjcKm9OsRbzZy1RAa1jfokHTWmnsrbBDVj85J17BRSloLbN4DbaIr2Jz3H1/FP7reVA
         tZwQ==
X-Forwarded-Encrypted: i=1; AJvYcCVM/4r10kzst/AZIKBa/X6x5UL0GLD/jVk2Gdo9NsQGy+D50guMKKFFW4N6OFXyzBOPMJEvB9hsAEwKzQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxl9xqpjb5pX+VqoxIp2tJRgePE0HHo2PEW8MjhlcZq38RqxJ+G
	B+sKzGWFbaJD3cw/TR8Epufa1U9aGp1aVmh3EiK68Yk/MSjTrnZ8obcR9bqNHc+Kwbs=
X-Gm-Gg: ASbGncuAiKTWVDDl03ZUP7IYlpVhlBXfU47ofENi9gk3MSRL5koLzmeUkEMPh+Pcbql
	p2oqFPJzyL9oAPLDSkimV4HA4iNPg5u30qzeMsH7vjhRQ0rhX+pF7BovvyiiNVXoxckYBQGW/qU
	8xhjNry7K2YfA0yX+9suh4qgyGRFl7Ba1lDG6x3JbKybws9+X3bA/hYkUgQO7SghR/tpMgmYxjI
	M27MRRPyioGfBBsACOoefT2jgKYNIEh+P4qhu9nIsO5AvkB8+Z7x4UfS3xfitKsgViTs4/zQlyw
	cHEh88x5Tx540/8w/+VdGjKz0hGu2j4zJN8mY1Ws3IP09VZejTYIBTI7nZFLGkELsEyA9Sv1gcl
	998mD+iCquN228jiI+wsoocVo7979UEXKPMkkTAuXog/eszPqNTVuNKGLmRrDbibqHVZY00udFA
	DM5henbVeV6nLRllShO86LVEl42TBGUJA=
X-Google-Smtp-Source: AGHT+IHc4/svjuXEJqiJPblrTTMmTzjo8sWSLvFxa7A/n/1dDjeXQeMDKykLsDl5TXqJ0t2zOlW8CA==
X-Received: by 2002:a17:902:f684:b0:295:987d:f7ff with SMTP id d9443c01a7336-297e56df951mr138535025ad.42.1762846523563;
        Mon, 10 Nov 2025 23:35:23 -0800 (PST)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.12])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29651c94abasm172928885ad.82.2025.11.10.23.35.15
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 10 Nov 2025 23:35:23 -0800 (PST)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: akpm@linux-foundation.org,
	alex@ghiti.fr,
	anup@brainfault.org,
	aou@eecs.berkeley.edu,
	atish.patra@linux.dev,
	catalin.marinas@arm.com,
	cuiyunhui@bytedance.com,
	dianders@chromium.org,
	johannes@sipsolutions.net,
	lihuafei1@huawei.com,
	mark.rutland@arm.com,
	masahiroy@kernel.org,
	maz@kernel.org,
	mingo@kernel.org,
	nicolas.schier@linux.dev,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	suzuki.poulose@arm.com,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	will@kernel.org,
	yangyicong@hisilicon.com,
	zhanjie9@hisilicon.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Tue, 11 Nov 2025 15:34:57 +0800
Message-Id: <20251111073459.44030-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_233524_908586_42636764 
X-CRM114-Status: UNSURE (   9.51  )
X-CRM114-Notice: Please train this message.
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

After discussion [1],[2], hardlockup_perf cannot be completely replaced by
the hardlockup_buddy approach, so this patch is still being submitted.

v1->v2:
The contents of arch/arm64/watchdog_hld.c are directly consolidated into
kernel/watchdog_perf.c.


v2->v3:
Add CONFIG_WATCHDOG_PERF_ADJUST_PERIOD to enclose the period update logic,
select it by default on arm64 and riscv, without affecting other arches
like x86 and PPC.

v3->v4:
Place the line "select WATCHDOG_PERF_ADJUST_PERIOD if HARDLOCKUP_DETECTOR_PERF && CPU_FREQ"
in the Kconfig files for arm64 and riscv in one line, with no line breaks.

v4->v5:
Remove __weak from hw_nmi_get_sample_period()

Link: https://lore.kernel.org/all/CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@gmail.com/ [2]

Yunhui Cui (2):
  watchdog: move arm64 watchdog_hld into common code
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/Kconfig               |  1 +
 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 arch/riscv/Kconfig               |  3 +
 drivers/perf/arm_pmu.c           | 10 +++-
 drivers/perf/riscv_pmu_sbi.c     | 10 ++++
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
 lib/Kconfig.debug                |  8 +++
 9 files changed, 114 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
