Return-Path: <SRS0=LibH=S6=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E8AFC43219
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2019 00:26:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 07A8E2077B
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2019 00:26:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="CevQimeI";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="lJVWxWqD"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 07A8E2077B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mnR3yaO7SAimNGYEzKf0IBplWYBsbYAH6S4zO1PnEdU=; b=CevQimeIr5VDRr
	ciYj9iYEby1GBhAHM5XZmoj0GbSSlQ0vbnXVtpPfdkqxvq8VQs1+CVql76Oo5z7JrBQ2IVb3x3y2T
	6UD/0oej8cgy+5rnLnD0ACE60d64eebj8Ts8spW9jkPYhJX5p2QJSYJWBuzWI2zqkMjuTH4APHpCH
	W0MxcbcJkd9CyY0ErFueIEiRG8jA2nr5U87U2ZlOtIlFEfYteoBdKjv38hoeMFwHEA3fyYw5wE3G4
	pGnptgEIW/Zw8EWhu+gqMdVyIiCi5SzJg0WKOupMWcXSJTnM/svx4v6xG3MBNppMOzOBp3bdtYQAt
	tKVwZCW1BAtjCH5JDBPg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hKXdx-0008Rb-Qi; Sun, 28 Apr 2019 00:26:09 +0000
Received: from esa6.hgst.iphmx.com ([216.71.154.45])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hKXdt-0008Qe-Pk; Sun, 28 Apr 2019 00:26:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1556411166; x=1587947166;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+oUGHgJqcWHwoouX7Rm0bcEfYEaHBmJ/F/1Xg9NeC+A=;
 b=lJVWxWqDQbAX7igtstoq/kLFFWmaFtafWpTZpc/TRQXAY8jc4o9pQHBW
 iBsfLG/F0PqARPVnon8vYeY6mEbIXLOiwGy6SyfGBzKWEnMNBwE1ORXIE
 UK8fWpqWazO9xab8gHsUpSC+EIE+x/nywHMVI2f3i7dl+VOcaczoqKylV
 Jz5OZ5W/pPmX2X989H0PwC+B55oRlUQO1sxhoh/4hK1irtlmUFiiq+FQP
 usN2qc8aZe0o7tkIOMzZY+5KqjbpKPgx5Z1GCgzA/p4+qp0UmuUWIEqTM
 /+935Hw3B3HvK4AAP1wLbPCTqS9pLzNbWt0uBtEP8kMAbHifB+VLpjaKI A==;
X-IronPort-AV: E=Sophos;i="5.60,403,1549900800"; d="scan'208";a="108718382"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 28 Apr 2019 08:26:01 +0800
IronPort-SDR: u1YtmyUK4ErostpjSq4khyZhTSQTp077m6sIrachlmR4iCEiDIt0pIVAifOcNeV50bsmawOAiT
 G18bgCDi9wtAfQRHFzLnvdAHTZtPRWFvzVQu7lwoD+bBdH/IkrFw1J3p7OZvmKV3yKo3C7573R
 7OuD6FcICqKiy4QflI80BzdeKOfapV8sGT8SiJCNBHaASH6X6oFe7ZzaQCXtTJoI20yVd1EfKK
 NzWd4uX5J4wRaINCjIgigm0u7ogbF09LEYrbF4FIymJVq/Lfj4tvUKUFqPcxwlEssnvmMMxmGt
 crxNOM/99SJIaxs68OmhXqWy
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP; 27 Apr 2019 17:02:27 -0700
IronPort-SDR: zKuZNCVXHVbSjmeYi7nZxcRThDHf0m26GzMjdNXhfgSLUb30lnMLtQz0/xWF+1BO5mIZ04MPOc
 uUCtIamZ7WrU5vykrnuS634CxUzyJlEt0qNwDNZNGwsJ5mKmnE0u40uhGsBz4ozIccpZx0ANC0
 Z9U8Tq7pVLGKTvz6jjhQFCIwC1go4pk9jctwlc9LmuovOv93riPIy1mp7X2oSCk+z7u70eJ7Ij
 Du31JaKTwgSIkIJpv9jbOoSmpdmmTe2BpFa4Cy3QvuA64TlAB3QgGMWkXPfmDahsMEVBYcyR4m
 Gz0=
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip02.wdc.com with ESMTP; 27 Apr 2019 17:26:02 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [RFT PATCH v4 0/5] Unify CPU topology across ARM & RISC-V 
Date: Sat, 27 Apr 2019 17:25:24 -0700
Message-Id: <20190428002529.14229-1-atish.patra@wdc.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190427_172605_902856_4A66B28A 
X-CRM114-Status: GOOD (  15.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 "Peter Zijlstra \(Intel\)" <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Palmer Dabbelt <palmer@sifive.com>,
 Will Deacon <will.deacon@arm.com>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org, Morten Rasmussen <morten.rasmussen@arm.com>,
 Anup Patel <anup@brainfault.org>, Ingo Molnar <mingo@kernel.org>,
 devicetree@vger.kernel.org, Albert Ou <aou@eecs.berkeley.edu>,
 Sudeep Holla <sudeep.holla@arm.com>, Rob Herring <robh+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>,
 linux-arm-kernel@lists.infradead.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jeremy Linton <jeremy.linton@arm.com>, Otto Sabart <ottosabart@seberm.com>,
 Andreas Schwab <schwab@suse.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The cpu-map DT entry in ARM can describe the CPU topology in much better
way compared to other existing approaches. RISC-V can easily adopt this
binding to represent its own CPU topology. Thus, both cpu-map DT
binding and topology parsing code can be moved to a common location so
that RISC-V or any other architecture can leverage that.

The relevant discussion regarding unifying cpu topology can be found in
[1].

arch_topology seems to be a perfect place to move the common code. I
have not introduced any significant functional changes in the moved code.
The only downside in this approach is that the capacity code will be
executed for RISC-V as well. But, it will exit immediately after not
able to find the appropriate DT node. If the overhead is considered too
much, we can always compile out capacity related functions under a
different config for the architectures that do not support them.

There was an opportunity to unify topology data structure for ARM32 done
by patch 3/4. But, I refrained from making any other changes as I am not
very well versed with original intention for some functions that
are present in arch_topology.c. I hope this patch series can be served
as a baseline for such changes in the future.

The patches have been tested for RISC-V and compile tested for ARM64,
ARM32 & x86.

The socket change[2] is also now part of this series.

[1] https://lkml.org/lkml/2018/11/6/19
[2] https://lkml.org/lkml/2018/11/7/918

QEMU changes for RISC-V topology are available at

https://github.com/atishp04/qemu/tree/riscv_topology_dt

HiFive Unleashed DT with topology node is available here.
https://github.com/atishp04/opensbi/tree/HiFive_unleashed_topology

It can be verified with OpenSBI with following additional compile time
option.

FW_PAYLOAD_FDT="unleashed_topology.dtb"

Changes from v3->v4
1. Get rid of ARM32 specific information in topology strucuture.
2. Remove redundant functions from ARM32 and use common code instead. 

Changes from v2->v3
1. Cover letter update with experiment DT for topology changes.
2. Added the patch for [2].

Changes from v1->v2
1. ARM32 can now use the common code as well.

Atish Patra (4):
dt-binding: cpu-topology: Move cpu-map to a common binding.
cpu-topology: Move cpu topology code to common code.
arm: Use common cpu_topology structure and functions.
RISC-V: Parse cpu topology during boot.

Sudeep Holla (1):
Documentation: DT: arm: add support for sockets defining package
boundaries

.../topology.txt => cpu/cpu-topology.txt}     | 134 ++++++--
arch/arm/include/asm/topology.h               |  20 --
arch/arm/kernel/topology.c                    |  60 +---
arch/arm64/include/asm/topology.h             |  23 --
arch/arm64/kernel/topology.c                  | 303 +-----------------
arch/riscv/Kconfig                            |   1 +
arch/riscv/kernel/smpboot.c                   |   3 +
drivers/base/arch_topology.c                  | 300 ++++++++++++++++-
drivers/base/topology.c                       |   1 +
include/linux/arch_topology.h                 |  26 ++
10 files changed, 445 insertions(+), 426 deletions(-)
rename Documentation/devicetree/bindings/{arm/topology.txt => cpu/cpu-topology.txt} (66%)

--
2.21.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
