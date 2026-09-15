Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 884CBC88E53
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 08:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Mime-Version:Cc:Date:To:From:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x7qRk0VTKmT9nWjStkEe1FdieYUu2hhSYupec6fq2Zw=; b=1CF7XdSBRGJWyh
	mmaIcaBC5UY3nZU1MUGleMO89uTAFYV5Ybh0IDQxRyS7IOc5VlsxLrRsC/ZyjgZvsBSDR2XwuunqD
	rshnnz7I60cGKsBzMBplB6FPTg+Wq45XE9oiPtL0QcYwBUuEq+l2Cohs616LItURwRH7Rzyyfe3Mn
	/r2oCTiqO4pu7BK149z/C++l5axONs558pBjw8VR+AAhQCtVT6IleMZgh6BHMc5RiRzNyQmYrHvEW
	pT1irWd4wshit96SsTQWqbj/+7xa3to1Dx76wDvh+iKBg7ABbZWM2zdN8D1LF3y5RuyAg6SeiJWe/
	NCTukpmmMzH4jDyLtCSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Oba-00000005clp-1Dj8;
	Tue, 15 Sep 2026 08:33:30 +0000
Received: from va-2-30.ptr.blmpb.com ([209.127.231.30])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ObW-00000005cka-4BGc
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 08:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1789461190; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=92tdN+E27rrgsH/n7R1ulnF7unHwW8icOlgymWr5S3Q=;
 b=QK/qxi1JY0tAx+62EchpEwtKPibVAYVqsgCf3Ar+NFZbv7V0oKo/ugq4K0bOSIJ1kSgrlB
 LR2Z9wNob2LjVgRsyNPudMzmnk3TflnU/4i0b6kt2oij3xdIifkvucvYBvaRKtU12hhHr3
 1pGOx52/F8fQo1cbVhJmq5fQsPv3tbL4/zWyzEAj6oBFVysy4AtGVE15tA3FGTmcQbYGK0
 3iDrNzHKcDXrheuUHYGKDVGxMGbEVBfvcC2PSKfHwK3ocCnJHRMq2I4NBrdUTYBZ3iQ/xY
 7gAEFrLN3lYKAfU0fI4Bbg3BSJBeTrjV3C9LXBzOaSvWoaNQI365cq/Z9P5wnQ==
Message-Id: <20260915083305.81913-1-yang.yicong@picoheart.com>
X-Lms-Return-Path: <lba+26aa902c5+9a63ed+lists.infradead.org+yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.120]) by smtp.feishu.cn with ESMTPS; Tue, 15 Sep 2026 16:33:07 +0800
X-Mailer: git-send-email 2.50.1
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Date: Tue, 15 Sep 2026 16:33:00 +0800
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
Mime-Version: 1.0
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Subject: [PATCH v4 0/5] Add workarounds for Picoheart erratas
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_013327_230685_F304602E 
X-CRM114-Status: UNSURE (   9.29  )
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

This series add basic errata framework for Picoheart SoCs for handling
upcoming Picoheart erratas. And add workarounds for the first two
erratas on our hardware. Also do some fixups and refactor in support
of the erratas.

Change since v3:
- workaround CASQ by patching the system_support_cmpxhg128()
Link: https://lore.kernel.org/linux-riscv/20260907072149.72031-1-yang.yicong@picoheart.com/

Change since v2:
- rebase on 7.3-rc2
- merge the MXR fix and get_insn extraction into one patch
Link: https://lore.kernel.org/linux-riscv/20260728094627.94975-1-yang.yicong@picoheart.com/

Change since v1:
- factor out a common get_insn for reading userspace instructions
- fix the issue from reading instructions of a exec-only mapping
- cleanups and code style refinements per comments
Link: https://lore.kernel.org/linux-riscv/20260715084724.26578-1-yang.yicong@picoheart.com/

Yicong Yang (5):
  riscv: Make get_insn public for instruction fault handling
  riscv: insn: Support decoding of CBO instructions
  riscv: errata: Add init framework for picoheart errata
  riscv: errata: picoheart: Add workaround for cbo.clean errata
  riscv: errata: picoheart: Add workaround for AMOCASQ errata

 arch/riscv/Kconfig.errata                    |  34 +++
 arch/riscv/errata/Makefile                   |   1 +
 arch/riscv/errata/picoheart/Makefile         |   5 +
 arch/riscv/errata/picoheart/errata.c         | 242 +++++++++++++++++++
 arch/riscv/include/asm/alternative.h         |   3 +
 arch/riscv/include/asm/cmpxchg.h             |  21 +-
 arch/riscv/include/asm/csr.h                 |   1 +
 arch/riscv/include/asm/errata_list.h         |  25 +-
 arch/riscv/include/asm/errata_list_vendors.h |   5 +
 arch/riscv/include/asm/insn.h                |  63 ++++-
 arch/riscv/include/asm/processor.h           |   2 +-
 arch/riscv/include/asm/vendorid_list.h       |   1 +
 arch/riscv/kernel/alternative.c              |   5 +
 arch/riscv/kernel/asm-offsets.c              |   6 +-
 arch/riscv/kernel/cpufeature.c               |   3 +
 arch/riscv/kernel/entry.S                    |  14 +-
 arch/riscv/kernel/traps.c                    |   4 +
 arch/riscv/kernel/traps_misaligned.c         |  52 ----
 arch/riscv/kernel/vector.c                   |   6 +-
 19 files changed, 423 insertions(+), 70 deletions(-)
 create mode 100644 arch/riscv/errata/picoheart/Makefile
 create mode 100644 arch/riscv/errata/picoheart/errata.c

-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
