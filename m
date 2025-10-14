Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A1F3CCD185
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Oct 2025 03:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iH5/stDxeJoxz4W+jHcAjmx0JL9qWUYpBUAyP3ErMls=; b=IxGxG5kjGOre48
	5YPXB6hVkArkaFZ5RtyOh/8fOtZK/k9jPd5iIo/81PK+qXOikupWwGbrfn8vzBsDhh7sa2l2IVdag
	zk5mLkDqFHuotofWkKAPSJ04RWXIXu0gQE4zRopJ/B1of3HGDTKNLAb1bk86rn+FwdowNHZfvuPZM
	H5bfef4eRXvpvgTRxbxMNdHC1/AxuGSLJA9BfJjj9D9GlPBGJrPr5xtrvslQrvz4tbMnLxMoKnMlq
	H0DuhO3Pbl9Ps7a7ZIRH0maqhR31d0H2YK4VtHEk3ci05fbbAMOLIXw+1LPyNxIP1J2wlwTnr/GvG
	Z9KgE93mFlNcjW1S5mVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VV3-0000000F2Fr-2uL7;
	Tue, 14 Oct 2025 03:14:57 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8VUz-0000000F2EN-3cpP
	for linux-riscv@lists.infradead.org;
	Tue, 14 Oct 2025 03:14:56 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-b4755f37c3eso4258350a12.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 20:14:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1760411690; x=1761016490; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=h9mILizSboCplYbQmD86FAClfic5oRmsIwqr8yhg9y0=;
        b=BWUPZgbrr1peQujD1YFG/DSVpBLXagouB/rWK9JvvLcMUZ0gqm1s350a39AeIINlB4
         D3otxhlk0/NJk65aF1QnXpmHVHLN6v91mMZ6D2pbajBUU+2kj2YhTm8VrZ52bKLe1H6x
         djtbBmyG7U0pd5zAQ0DzcJ0IVO+u3IKkVaYHJKC7gDOEC2Itcn7iNoAAyJxjFYcn7mUT
         3POvgDN3OZsz654fPdp6QfWc7GZUtqTTuUWv1oqYimHFD5dqgTdfeiZt5g8bwHXPtCy8
         miQtA/GI8fBctMcczuws3FpJUsYqEt/dk0BtdG4nkDhf0v5a1A8faxYyoKChT/ANK+s/
         2nbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760411690; x=1761016490;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h9mILizSboCplYbQmD86FAClfic5oRmsIwqr8yhg9y0=;
        b=mjeNrR3OXGae+TNdfAC90RzqGbGjjT938O0zuYUnX9WpvV7vC/QJRF0rDtnZmT5q9O
         hdNxE/DZfSOnQaePMe30M8E6vaiSgjF13p87wk82Pz0oMmRn6b1S433m93g+rarTuNVA
         jLEsqTm2DgsdRF2FvWVv2TmaJ9Whd6FYAEzIkEBFpbc5FX7yxpbnm505tBxfms5Ubd7f
         RbWRKH777gSi7PcQCph5G1vq+TNnUM8S+EKnszHiXOL2rDaeYLqYtzZLSuBRLnJNI0Ov
         +io2r8jOSjCLoQE8UpSFzHYZhNjSggh3Gcec+kzja2dQ/oIZ0+xx0BJQmMkIdAXm4cYS
         5kGQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4yUuD2Z/M7PMKuxR2vEULDJSheT0aPIziCzTaRSgTeSzeb5iXsLqtalLkxPBtjYW3vzAAh6bSA/a5cA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTz1itgIg2Y203LA0ZlJk0mNiy5ZBx2tBNkVwFWdlAqu8nPnr+
	ggXYUKWb/gxDrvIj4nBbKklEzjrUFKcsnhZ//Hk16o5V7r8Td1MxKusSsYdLuwEJUvA=
X-Gm-Gg: ASbGncvuw6OtZm8SGS5eqlT2zwUYf65tjkg9SHZKavoBWWud8vAlhuId1th86jgXLch
	O5N/djetY0+1BM2Z7KnukUA8175zn72sDBn4xlhJKwkgGGamThe8v3fFd+WvIUFHlXASM2kd94v
	mSK11El1TpkN0lzsLGVOp9XlNU7z8fllWvRSTBYtS6zNPvk3dhMWT7lGX/PXVVNlSbHuZWc/na+
	7/AOpwx8MR9K1SPw5SwXehpY1S9LvaHskVbIDWAa9+NwyWG9RZemTUTi+EwziC/Hv9QOqPsy9rH
	qii4yA9THvPPguboQiIVwtnHdhDspKQJRU4nC73fRSZ1LXyDpdOGRUmtAXc2ml+PeQghG2EhqJE
	w1o9hUoDaUjdmZtGAHIPtYmFITkB91Vlz8d2rOaStDqmVMHY+k+ivf8gFyPUjY+JoloZA/UUdlm
	ODblMgWg==
X-Google-Smtp-Source: AGHT+IEI3jpH2kWAbzu7oGE0nlZT9oIWVCOT7IZNd6Yq9DFB9XEbqH5fgzxf/doWGth7+r0MSrD5Aw==
X-Received: by 2002:a17:903:37c3:b0:269:a4ed:13c9 with SMTP id d9443c01a7336-290273ee214mr291664165ad.30.1760411690202;
        Mon, 13 Oct 2025 20:14:50 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f3de4asm148315845ad.92.2025.10.13.20.14.40
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Oct 2025 20:14:49 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Tue, 14 Oct 2025 11:14:23 +0800
Message-Id: <20251014031425.93284-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_201453_893758_79FA840A 
X-CRM114-Status: UNSURE (   9.50  )
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
