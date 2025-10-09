Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A07CCA470
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Oct 2025 03:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wEKMhBvOZZp2jUqSkKyur26FP58CtNU92OWY0CVUHy0=; b=Z7neAac96hcW5k
	sVNJxDUH8BLQ3aYB01sgYAmaiKoUlUVJMj8A+MmM0ZJD5iP4YCeyw38uYUBd5t8YsxrAgrrv5WJ7D
	nx86K1xC4z0dO9fAf+9Df9DefasO5GyC2mfqw09S9a3R62hx7GNNcCg/GgipfkErXwNhbsKT5vB9V
	y+2EYyIXNFuA466Dclktbl2SWuPHdObSmj7x6reoeJGEuEUnoqY4VR+3t0jv5TRgc47k9Vx0seYjO
	4pALSEhjY4uIw1gCF5sXfqhBeWYWV1xzis9zfpiRvd3MYGX64qAWZPBmzl9NtA6wf0gZZMFFZYEZ8
	NderrCmN76+FFJ/o59cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLO-0000000561N-0foS;
	Thu, 09 Oct 2025 03:29:30 +0000
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6hLL-00000005603-014i
	for linux-riscv@lists.infradead.org;
	Thu, 09 Oct 2025 03:29:28 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-793021f348fso419960b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Oct 2025 20:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1759980563; x=1760585363; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JpBrYi8OaSK64ZsI47g3j0U1q75t5NwItcJ4jghSQ6k=;
        b=f/sjDDhbbajUMNtd54vKX1hM0Wxzx0xJNA4GiHB9/U+1LbdWYPRw+YTr7SyUu1rpsC
         muH4Qdx7XKOshNqt3Q8bVfXfcgd0QDjuAoFDiBi94Yvt07ITgNqVTVThhU556I9UI+bY
         L+yOi6QuWJ555WlvzOLUz5baedQKcF5bYR2M6qdQWIUeMRlEgnlSSLHjcgpMAsA/t7uN
         /i1NrTqvnllCSwZFBmHm+DF4AA4nnoBfEIIKBT9UHpChvAU5fzLu7eQzg2bN5bevOwKP
         QUyc8b0/chSpeSsggDV9xDGH/iX/cvbZDvHObihL/EVM6EbUYrGlflNKtXO4/XBp9e+2
         l1TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759980563; x=1760585363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JpBrYi8OaSK64ZsI47g3j0U1q75t5NwItcJ4jghSQ6k=;
        b=crGk+xAx6TPGwrgRV2WgqKm5vZ8Cv/4aott0nxSSP/sXE2w27moHzJO1b7yzZh1xSg
         DOmD3KX29nzDyE7bnYRjlmrHvGhs4nkOsdUVP9h0DTITxOfumXsdU7t+OAKxBZSA5tuD
         MXPoN1sOK5WH3cd7Q6nMXHzceD5hgvamawSx+KF/otJP1qNtvPTpQ/bdpWw3mx+cS28G
         8RyLmDdo5mPXJjyLHcmcYGLym2e6tCdTU/YoOjUymO/fhfVmsx9q0XzDAnflAl27XRZN
         LpUfn2hCM+CrxDTVJ7OCZA3Nmx2kqzPaZdniC5Itnw5qdPdin5DM8iH24sqgOOlEjt9A
         Odsw==
X-Forwarded-Encrypted: i=1; AJvYcCVoVbkp7j6gCUeXMR0QsrFB46ThaZ0436a0AjMhIqZkDJ4P2A7gVi6UzKu//Fq/FI0B3CE64MC201W+pQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwOYYes6rQOfZ9V/FEPcRNYCI4fhcPzXDHI36HNEBAv/MD+PSEz
	Q8B2eExlElYDsPWZqeRXAlpQ06+FNb5jm0Ao5gztotXXWr/bV4+5Nra98+geOVork+A=
X-Gm-Gg: ASbGncs0O88BCFYNbuO80AMSFn0s/Uh1JavIzY+2le96qqV4SJukCWlbP7zBXK99NkJ
	A051CyTa4n4ZgUBy6UqgK3heGeakLTZ9y9q2SIpSx831Somd5/qAgwc5uq+F5/7rktTZ5T3Nrwd
	HBUfn2TulXexJ7tNYI9X7vaEdftdgpqRycbI9zOmPiVH7RW8YsIp+l7Zus/fTwGax1rPGDwuKRc
	Opk2KGWIHPqK9sq9WKbTAjrWbWA2NVr0KEfiI8H7DwG1lbutpSQvQ8tXqVa2Fi/Q4x8WQCBjpoD
	Frb0hESK3WctSgoH6FS5KhwX7VyJab0iO8N7/yisAQt+rRQjBVtKGhFTYBuXKI/TFQibul8kHYv
	YM9rtVcJpU+f5V+njFOJSbwCkKZ+bFHeKN1+ob/iZnCObtCG+2XyXhbiBGoF9g46qosKnM7VBw0
	KC317f16Rh0tGah25pbdsLsg==
X-Google-Smtp-Source: AGHT+IFRlFMSgpyV+I+rT5AczJyjaNpsL4H8TkyxvKqiDHtqjU3VLps9m9B9k3wusNgIZV/khJ/OsA==
X-Received: by 2002:aa7:88c8:0:b0:77f:143d:eff2 with SMTP id d2e1a72fcca58-79387c191fcmr6789523b3a.28.1759980562388;
        Wed, 08 Oct 2025 20:29:22 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.226])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-794d4b39400sm1271306b3a.15.2025.10.08.20.29.13
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 08 Oct 2025 20:29:22 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add HARDLOCKUP_DETECTOR_PERF support for RISC-V
Date: Thu,  9 Oct 2025 11:28:36 +0800
Message-Id: <20251009032838.63060-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251008_202927_037778_06F4AA99 
X-CRM114-Status: UNSURE (   9.77  )
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

Link: https://lore.kernel.org/all/CAD=FV=UEhVCD6JehQi1wor2sSmtTLDyf=37xfo-DOTK1=u1xzA@mail.gmail.com/ [1]
Link: https://lore.kernel.org/all/20250916145122.416128-1-wangjinchao600@gmail.com/ [2]

Yunhui Cui (2):
  watchdog: move arm64 watchdog_hld into common code
  riscv: add HARDLOCKUP_DETECTOR_PERF support

 arch/arm64/Kconfig               |  2 +
 arch/arm64/kernel/Makefile       |  1 -
 arch/arm64/kernel/watchdog_hld.c | 94 --------------------------------
 arch/riscv/Kconfig               |  4 ++
 drivers/perf/arm_pmu.c           | 10 +++-
 drivers/perf/riscv_pmu_sbi.c     | 10 ++++
 include/linux/perf/arm_pmu.h     |  2 -
 kernel/watchdog_perf.c           | 83 ++++++++++++++++++++++++++++
 lib/Kconfig.debug                |  8 +++
 9 files changed, 116 insertions(+), 98 deletions(-)
 delete mode 100644 arch/arm64/kernel/watchdog_hld.c

-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
