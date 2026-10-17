Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A569CCF2CA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 08:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:From:Cc:Message-Id:Mime-Version
	:Date:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=l6m4XITP8t421y2eKr834m1u2lxqdsDuYiC6B8l7pDc=; b=xYLmFDFjuut31F
	c2eU2COGZZyD5okAqRWhfgodfBf2sZ9M66hM3+/DrVgEO4XLQTY0xkf+xpztZ8x9Qp/y9kIIABFhY
	8uLot3Q7xXvd6R/lvRjIpxG69DCTQ0AWNCQSX8xMagVcCdBqnY2Sx1Y1dF9h0iSLll1G8SUt0vOLh
	0peRfZOZCBpl0SJsogxZnhvZNS1h4hzudyk9UAwEFwluba/i2UMFFBASZJmyPI624I/Nj3gFEbuPo
	Mm5s2lIspRF/U0f82zDS58qBxalKRNo6QpFVRiSmiDQr9wvOXUCZANFznpVMJ0pLDSwZ45Q1dupqo
	1cjOjdd/bvI0CRkKNGNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzp8-00000004Zg6-1Hwj;
	Sat, 17 Oct 2026 08:31:27 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHzox-00000004Zag-11zl
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 08:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1792225865; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=W4Z5e7cL8CTuE7DWzbc6vlg8nBRKHyLd+pZ+zsazn7s=;
 b=xKdHFtrGo1Q0NvntVGE3nzWhS9GI+TXD7DCBiA4x/ROp7md9BiYfbISMXMzpvLY5vUA9LY
 3NQQaHagDme67Q7hxTlNsR9yrhGDduux3gfDX8eyI888y8nuhrgeVvFtHQtLkAh+KPFIdC
 ismHIkUlKPYxIpBoN4l8Fh6AfbHKI+dyuB5MvwM3pvCjPQ8UANiM3YFSsWWLjl9Q/sxvCc
 dFgoCR6W9RiwWho/yUpTCUYJnmBSY3LIAx2mQ3slqbDmq/VGlX1EVW1cv4RhbeE6SddlOk
 rx0vqmajhNqofni3IQXudhzXA9Amn5geo9il31s/w/yJEAszOto0Vbvk8AsCyQ==
Received: from G9WYR9K0VW.bytedance.net ([58.250.106.101]) by smtp.feishu.cn with ESMTPS; Sat, 17 Oct 2026 16:31:03 +0800
X-Mailer: git-send-email 2.54.0
X-Lms-Return-Path: <lba+26ad33247+910332+lists.infradead.org+yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Date: Sat, 17 Oct 2026 16:30:55 +0800
Mime-Version: 1.0
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Message-Id: <20261017083100.40157-1-yang.yicong@picoheart.com>
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH v5 0/5] Add workarounds for Picoheart erratas
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_013115_498742_058DAC3F 
X-CRM114-Status: UNSURE (   8.83  )
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

Changes since v4:
- rebase on 7.3-rc7
- make cbo errata depend on MMU
- limit MXR enable only for __get_user()
- Restrict Picoheart errata to 64BIT and skip alternative patching during
  RISCV_ALTERNATIVES_EARLY_BOOT
Link: https://lore.kernel.org/linux-riscv/20260915083305.81913-1-yang.yicong@picoheart.com/

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

 arch/riscv/Kconfig.errata                    |  35 +++
 arch/riscv/errata/Makefile                   |   1 +
 arch/riscv/errata/picoheart/Makefile         |   5 +
 arch/riscv/errata/picoheart/errata.c         | 235 +++++++++++++++++++
 arch/riscv/include/asm/alternative.h         |   3 +
 arch/riscv/include/asm/cmpxchg.h             |  21 +-
 arch/riscv/include/asm/csr.h                 |   1 +
 arch/riscv/include/asm/errata_list.h         |  25 +-
 arch/riscv/include/asm/errata_list_vendors.h |   5 +
 arch/riscv/include/asm/insn.h                |  70 +++++-
 arch/riscv/include/asm/processor.h           |   2 +-
 arch/riscv/include/asm/vendorid_list.h       |   1 +
 arch/riscv/kernel/alternative.c              |   5 +
 arch/riscv/kernel/asm-offsets.c              |   6 +-
 arch/riscv/kernel/cpufeature.c               |   3 +
 arch/riscv/kernel/entry.S                    |  14 +-
 arch/riscv/kernel/traps.c                    |   4 +
 arch/riscv/kernel/traps_misaligned.c         |  52 ----
 arch/riscv/kernel/vector.c                   |   6 +-
 19 files changed, 424 insertions(+), 70 deletions(-)
 create mode 100644 arch/riscv/errata/picoheart/Makefile
 create mode 100644 arch/riscv/errata/picoheart/errata.c

-- 
2.54.0 (Apple Git-157)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
