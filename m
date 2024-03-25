Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5573C54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 16:53:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=j3F/sEae+0nvVTJpidTaLz3eWpoqH7geZbaHzgJz28s=; b=f55XgY+tNjxuxN
	t+y767wRPt3ualkw/t6eUIDJvO2/j5Ez7VOp5XM5brQNKgTdssGHPAYPKXujs85vH3hG2mgP674dN
	IZ7wKifYGaSl33S3TA/KD4XXi8NSnbFTE5LMqeUrxFaUogUrYxAFiJV4i58Hg0nGxM0C8cEkaf25h
	J0pAGW9nU/O+SxewUT6O+d43pMgImrZyP7Shj85ixTCzL/Bzqip8eDNR9+HnusAFcGtSRm3l7W68y
	c22vmMgK1CfFJVI8HgbELVV7NCThB1TN44k8FQ61D25u/7EYLaroxT5nsZPGew2zQIwnWLdF5Q8Z2
	ylsOOEBop1vIe9Aqg/QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZu-00000000sjr-0t1e;
	Mon, 25 Mar 2024 16:53:42 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ronZr-00000000shQ-0oqk
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 16:53:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 6574ECE1BA4;
	Mon, 25 Mar 2024 16:53:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14753C433C7;
	Mon, 25 Mar 2024 16:53:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711385616;
	bh=WannNMe3KRyek8xiVd2Lz4G8sK7Q+T+16cLq3DmwwLY=;
	h=From:To:Cc:Subject:Date:From;
	b=NNkwfSJEyxR2lSdn0xvBDIKqvHePa4ALFOJx27WKPZ18OXsNUL15K1RStdQpEqjnn
	 dqh8zQjpyHZCvtc/xHKm8uAUDMpKy5TuN9/sZ8Q1lyb9YdXlwq6hKHEHTDhAm1tDfX
	 ijOcSX1Up+8aRWTh7vneNw+makOWEqX5gTnmbpA7lS2oBXiKBNbGkiQakSgPHsiWfL
	 P2Jv01ZU+1/bLblzTvNrJHvVOU1wMD4BNRpJxCGt1AQajCplrb976zH4Uv598uMAEA
	 +zYd9bndRQ37zcSBlmohp48Ops3f96nIKv/M1xwpJTr4C0tM3oMr6GqcwnLBR5FjNM
	 EtYlFF5Un9RRQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] riscv: improve nommu and timer-clint
Date: Tue, 26 Mar 2024 00:40:16 +0800
Message-ID: <20240325164021.3229-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_095339_449163_803646F7 
X-CRM114-Status: UNSURE (   9.67  )
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

As is known, the sophgo CV1800B contains so called little core, which
is C906 w/o MMU, so I want to run nommu linux on it. This series is
the result of the bring up. After this series, w/ proper dts, we can
run nommu linux on milkv duo's little core.

First of all, patch1 removes the PAGE_OFFSET hardcoding by introducing
DRAM_BASE Kconfig option.

The following patches try to improve the get_cycles and timer-clint
by always using TIME CSR, because Per the riscv privileged spec,
"The time CSR is a read-only shadow of the memory-mapped mtime
register", "On RV32I the timeh CSR is a read-only shadow of the upper
32 bits of the memory-mapped mtime register, while time shadows only 
the lower 32 bits of mtime.".

The last patch adds T-Head C9xxx clint support to timer-clint driver.

Jisheng Zhang (5):
  riscv: nommu: remove PAGE_OFFSET hardcoding
  riscv: nommu: use CSR_TIME* for get_cycles* implementation
  clocksource/drivers/timer-clint: Remove clint_time_val
  clocksource/drivers/timer-clint: Use get_cycles()
  clocksource/drivers/timer-clint: Add T-Head C9xx clint support

 arch/riscv/Kconfig                |  8 +++-
 arch/riscv/include/asm/clint.h    | 26 ------------
 arch/riscv/include/asm/timex.h    | 40 -------------------
 drivers/clocksource/timer-clint.c | 66 ++++++++++++-------------------
 4 files changed, 32 insertions(+), 108 deletions(-)
 delete mode 100644 arch/riscv/include/asm/clint.h

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
