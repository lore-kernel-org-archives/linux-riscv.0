Return-Path: <SRS0=bFkC=DQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8481FC4363D
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:11 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 287742240B
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Oct 2020 21:14:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n0QmhPpV";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="N+Oh5OB2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 287742240B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZVcvgzyNjdOeFRZqupHPyYxBrD1rHWrTVjxUHrsoa3M=; b=n0QmhPpVSkcsxcidG5mJmBCDCd
	s6NEnsO5oceyPPWvioN5BjBrRk3Ff3aIcV2kKhHss2XzcLradeaRhonz1hNFQdsvy4K+yhMBsID9W
	1yddnPJzWGH6nx38Z41DkbmJAEh58upHLJni3v46xPKzRUZ5sHE4rStYBN1INAC5vpXN0Ch0XnsAj
	s2X4p7MtK3iyeEWGjTNnAVWQzFQNbUNGFq2rim8MV75KVY+GyW7p5YL5FAYgEQFKgtvN02h++1j17
	AGxAcwiNy4cZHfOndpegOulRoya9QVxy/S5uTiygNGB2rAJ6qLucdoAzV4ZNfK55JQJrZ59h/jTD5
	335QjZWQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kQziC-0004nl-2y; Fri, 09 Oct 2020 21:14:00 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kQzi8-0004kL-9M
 for linux-riscv@lists.infradead.org; Fri, 09 Oct 2020 21:13:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1602278036; x=1633814036;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=P6MToLoY21O2rZVwNli0IYzCJtAmEa+Tym9KCg1Gq3Q=;
 b=N+Oh5OB2pPlJ4ydAHtJYjNcwYqr1CdOE1jiOqAG577dvuqmPW4B3x8h1
 ZeI238wNo24zdshuNWXfcNPCvZKKMHrBdbawynRdCyIAFbvWvSsOdv4U1
 nHQ+JMCaCGcS+d2YlKA0cNFOJZLTTo3PU9oIT01eHzcriOKGdXcgEyput
 KRO+rMb+MqdYlnwhDh+7qWkHkp8q2kOYPWiiSg4d4ERXf+iNbtUwS8+38
 +ElqnE7L+4Sc5s20u/X/TsNVCdHLAjMVfroHPthbx53zxAqkCbV4bQzav
 nFZMiaoqMiHjdreZQurolq+DBDyGIpFzHPg4+NyiVoAZYuzk56scnTO9c Q==;
IronPort-SDR: Rw3ZRCfD/hid43jXwdAqzytiqdKPvl8VWtGPGjv75MOeIk/aDyimdMTWXorhzFhwrjRltefmx6
 9Wc5evkPGQALP8vXRK9QVEAVFYavTihYLP/CbAp7k2cYLwVORzzrU4Np8gQNBGIMO/JmOzESy2
 qwsXpsI+w64Z7eJkE95IDxsNpzLwXIGLMvrKfqkQ6qL7CFeJlB/zcwaqFLAUEdwBDjU3cwFOnD
 z8JpTx5hsTC7QFjHGvfHNiSYY4xDf62YNDLz8/LcJqA8czUZKm14QL2J89TRu6PxLq7+dduy92
 RH8=
X-IronPort-AV: E=Sophos;i="5.77,356,1596470400"; d="scan'208";a="149406010"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 10 Oct 2020 05:13:52 +0800
IronPort-SDR: 6yeTczDPsB7wfRx/PwXV7x78db6Fbn2xAoujZ9coj9+8pwm0I88I0IkNz/TYN9gdH/rVCMe96g
 FzkAMHc3qxlpVHRPPYJmJJiYmL5MkOyAIowO4JI8HjS33PmChH+Rmm4GSC7DDYuq5BzxjnHUb/
 aeDK6XKYcStdtLeV0DyEFQ3PHw21busKqKtNfqoghvtdUfjEcAdSy6a037FGD+ln8MmtMAq+cq
 UkiuKORibha5px0qeUiWFH9ObhKK3YwtY1BTgxCbRwo+f7bN0kJDkKH66XMFqikAktW/hpOiak
 dcqe7FVbuOPI4clBcGKRKmH+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 13:59:40 -0700
IronPort-SDR: awzyS2FKyWwGRL2l9UN6x4T3nQsC2SFXYZlWDZBGgRgs9wdh/EUzSaXW6aAwGazTcEn3zVzUV4
 DXGWftDkcWrPmwbWdz6/9GoJEQA5JQkgjvzMAwgMGTxzrOPu0992/21TbYmVInH1zLtAQBqbFq
 Onl44KPAf9AfNWvzrtCPJ9zTPYjm1T1Y+3/ct1iaaqn0o8CJNsQHp1igR8Q2yuwsTylJaZ8ZBH
 eewJwyhKvOsLr9I4L+1dBvNSLtFb155iPBDs0Ma1h6ysErWop6/ZP3nLoLFh585JZi8Nw29CNR
 XCM=
WDCIronportException: Internal
Received: from usa003000.ad.shared (HELO jedi-01.hgst.com) ([10.86.60.38])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Oct 2020 14:13:52 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 0/5] Improve kernel section protections
Date: Fri,  9 Oct 2020 14:13:39 -0700
Message-Id: <20201009211344.2358688-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201009_171356_456043_CED4CF37 
X-CRM114-Status: UNSURE (   9.45  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 Atish Patra <atish.patra@wdc.com>, Guo Ren <guoren@linux.alibaba.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Greentime Hu <greentime.hu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>, Borislav Petkov <bp@suse.de>,
 Michel Lespinasse <walken@google.com>, Ard Biesheuvel <ardb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This series aims at improving kernel permissions by doing following things.

1. Protect kernel sections early instead of after /init.
2. Protect .init.text & .init.data sections with appropriate permissions.
3. Move dynamic relocation section to _init.

This series is based on Guo's static object fixes[1].

[1]https://patchwork.kernel.org/project/linux-riscv/list/?series=360951

Atish Patra (5):
RISC-V: Move __start_kernel to .head.text
RISC-V: Initialize SBI early
RISC-V: Enforce protections for kernel sections early
RISC-V: Protect .init.text & .init.data
RISC-V: Move dynamic relocation section under __init

arch/riscv/include/asm/sections.h   |  2 ++
arch/riscv/include/asm/set_memory.h |  4 ++++
arch/riscv/kernel/head.S            |  1 -
arch/riscv/kernel/setup.c           | 13 +++++++++----
arch/riscv/kernel/vmlinux.lds.S     | 18 +++++++++++++-----
arch/riscv/mm/init.c                | 17 +++++++++++++++--
arch/riscv/mm/pageattr.c            |  6 ++++++
7 files changed, 49 insertions(+), 12 deletions(-)

--
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
