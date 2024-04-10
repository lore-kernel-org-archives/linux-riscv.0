Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE022CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 14:37:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QjgPd+O6UXHOIQJpOGpXZTS3syRwduqdW4fy3TOmkKk=; b=SvEffTYGNmvLDx
	2OhgLBsxhrq39RwSx4xStTbpYtUFoT8pq4l4uDfCRUEQnFssL2dp+tc79QhMtkXMKaqOhnMW9OkJL
	Ezg0d/zSCX9Zl+vzBsJNy2/zLC++lYAOZkTFei7KQ7Gx4JYjLQjP8jBwNCHH3FqA6J8SE8TUERo/6
	M9/iVlh4XraknB8wMZmqPc4Kqpzx13fl0k+5qjbIlnBoubvXJRPBSpVDblaijp08HJHpFX+zloR9M
	yBHNMFAtT1Ug4I+vADni11ATvs4o9x3WouoaH2FlxpwkfCBcJLNe68v/zH5Ubav1+OAb6yLmL3Q8q
	p4PTpty6PQQdPXwZBZ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZ4d-00000007V2Y-3EtM;
	Wed, 10 Apr 2024 14:37:15 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruZ4a-00000007Uzv-0kvT
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 14:37:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9F53361DCA;
	Wed, 10 Apr 2024 14:37:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164F7C43399;
	Wed, 10 Apr 2024 14:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712759831;
	bh=zr37AZ5P+Jsxgb/Gyxa03cQqGoKMeaJhEq3JPY4Fv7U=;
	h=From:To:Cc:Subject:Date:From;
	b=O7n5Jgf2lmc+U1ygdgCX+qRuGy1Y3+qW8hGz8Ub4A5eOdTbw00TpmssfAOwTSXy1y
	 dVa/2yAMhIWsq2bEfs9HtNnnN0uxiK/Hn3f+lIUigthhLJARcpWNoWBNV0g7Nhr815
	 I/xsOw2WJo5N/c0Bmw/O6qfCNwnKNhPRbV3XiC7iDW6j887tZ7Nl+dKaHMSyFuzZ+6
	 DkwTXzFZaHe+LL6H8LVeerY75mNvAkW9KTbELBIzTaknOHWt2pHhBqmRTlIT79LgRe
	 iIew2SZrURVtgmlyB0jqctrDZ2mzpXvVcHm7GcNVrcTLtebJsVbTSnFgtq8FvOdLMX
	 AVuM5Yl43yZvQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/2] riscv: improve nommu and timer-clint
Date: Wed, 10 Apr 2024 22:23:45 +0800
Message-ID: <20240410142347.964-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_073712_353917_9A3E7ED0 
X-CRM114-Status: GOOD (  13.78  )
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

As is known, the sophgo CV1800B contains so called little core, which
is C906 w/o MMU, so I want to run nommu linux on it. This series is
the result of the bring up. After this series, w/ proper dts, we can
run nommu linux on milkv duo's little core.

First of all, patch1 removes the PAGE_OFFSET hardcoding by introducing
DRAM_BASE Kconfig option.

Secondly, to use the T-HEAD C9xx clint in RISCV-M NOMMU env, we need
to take care two points:

1.The mtimecmp in T-Head C9xx clint only supports 32bit read/write,
implement such support.

2. As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer:
add a quirk for lacking mtime register") of opensbi:

"T-Head developers surely have a different understanding of time CSR and
CLINT's mtime register with SiFive ones, that they did not implement
the mtime register at all -- as shown in openC906 source code, their
time CSR value is just exposed at the top of their processor IP block
and expects an external continous counter, which makes it not
overrideable, and thus mtime register is not implemented, even not for
reading. However, if CLINTEE is not enabled in T-Head's MXSTATUS
extended CSR, these systems still rely on the mtimecmp registers to
generate timer interrupts. This makes it necessary to implement T-Head
C9xx CLINT support in OpenSBI MTIMER driver, which skips implementing
reading mtime register and falls back to default code that reads time
CSR."

So, we need to fall back to read time CSR instead of mtime register.
Add riscv_csr_time_available static key for this purpose.

The second patch adds T-Head C9xxx clint support to timer-clint driver
by taking care of above two points.

Since v2:
  - drop CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME, instead we use runtime
    code patch to dynamically enable CSR TIME code path or MTIME code
    path.

Since v1:
  - fix c900_clint_timer_init_dt() defined but not used build warning
  - add option CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME instead of removing
    mtime usage for all platforms, since not all platforms implement the
    time CSR in HW in M mode.
  - rebase on the timer-clint improvement series
https://lore.kernel.org/linux-riscv/20240406111757.1597-1-jszhang@kernel.org/T/#t


Jisheng Zhang (2):
  riscv: nommu: remove PAGE_OFFSET hardcoding
  clocksource/drivers/timer-clint: Add T-Head C9xx clint

 arch/riscv/Kconfig                |  8 +++++-
 arch/riscv/include/asm/clint.h    |  2 ++
 arch/riscv/include/asm/timex.h    | 18 +++++++++---
 drivers/clocksource/timer-clint.c | 48 +++++++++++++++++++++++++++----
 4 files changed, 66 insertions(+), 10 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
