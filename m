Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64FCCCD1284
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 11:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4f3MK30Sr5NXLUgPEh5OOANUn6OV50JXW6VmbsfjyFI=; b=QsIPbNujkP0NsK
	h5nMsU/z/yp96Uo1Edt/4LCNTzJSEAEPCnMSnvCOLhPPib1s940tjKlZ351D52JAnnAuIfk3NE95R
	NWxnZ50eMvwpDb/QhGHNJviRtnKPmha+aZiwY6pzL14IFtUpCf4Og8v3bHVi6LYoFSxN12BZIgBf/
	Uz7x6Kd1VVv0nrUhWJZmB32RZxbsEN907uV2rMFVBApI9mprPZ1jYvlkNKVCF6XKHMqkmBTCMLLhC
	ZrrdoXMtZBD2Ax67jk9UaBTr7aD2ebD7Hx6GIIZX8tdD/6bxXYuVPqPWLlA2Fv/+ot1rXY2L+Qg9U
	x1XibJNGxO5XpVpEQt7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4KT-0000000ADej-1Cpc;
	Sat, 06 Apr 2024 11:35:25 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rt4KR-0000000ADe0-0atY
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 11:35:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19C6260B31;
	Sat,  6 Apr 2024 11:35:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB3CFC433C7;
	Sat,  6 Apr 2024 11:35:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712403320;
	bh=4HEh5WRadPdje54XUg02xBIGtsPiwVv0rVvT7xJfEk0=;
	h=From:To:Cc:Subject:Date:From;
	b=uD0O65Wk9uJH8AXJ2ZmiqCtPoxCXg/KzCbxCB0QyR+OPe0U8JUsf7b+ZcA2KDIU9e
	 jS69HJe/aT2pALTTIov1Fn6CL4IPzU+PQNKzRa+5+qqIeXHj0ijqENHdNlz1uX9GsY
	 0r90y3yk6X9wiBp48G3owAIkbB1aohKHufqoHrkmG4Q908ALgcdwkXLVgEz82odRl8
	 m4PUpJfIOdM/jqW1z2/LLODExoPFYbQRWqy2UbhLlxiI4bReShyONl0k/XeUUr3f8v
	 yY2hQzYZcQYSdjjZIa4sxFZmo8+yqTMeEuptJvAMfmhVb6rawEQXJMk55+eZsO3IUB
	 gok77/w7a1KPA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] riscv: improve nommu and timer-clint
Date: Sat,  6 Apr 2024 19:21:56 +0800
Message-ID: <20240406112159.1634-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240406_043523_263498_6355CF2B 
X-CRM114-Status: GOOD (  12.73  )
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

As pointed out by commit ca7810aecdba ("lib: utils/timer: mtimer: add a
quirk for lacking mtime register") of opensbi:
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
So the second patch adds an option CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME
for this purpose.

The last patch adds T-Head C9xxx clint support to timer-clint driver.

Since v1:
  - fix c900_clint_timer_init_dt() defined but not used build warning
  - add option CONFIG_CLINT_USE_CSR_INSTEADOF_MTIME instead of removing
    mtime usage for all platforms, since not all platforms implement the
    time CSR in HW in M mode.
  - rebase on the timer-clint improvement series
https://lore.kernel.org/linux-riscv/20240406111757.1597-1-jszhang@kernel.org/T/#t

Jisheng Zhang (3):
  riscv: nommu: remove PAGE_OFFSET hardcoding
  clocksource/drivers/timer-clint: Add option to use CSR instead of
    mtime
  clocksource/drivers/timer-clint: Add T-Head C9xx clint

 arch/riscv/Kconfig                |  8 +++++++-
 arch/riscv/include/asm/timex.h    |  6 +++---
 drivers/clocksource/Kconfig       |  9 +++++++++
 drivers/clocksource/timer-clint.c | 31 +++++++++++++++++++++++++++++++
 4 files changed, 50 insertions(+), 4 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
