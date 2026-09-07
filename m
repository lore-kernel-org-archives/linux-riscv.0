Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3252C79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 07:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:From:Cc:Mime-Version:
	Subject:To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=6ANl0j9Qkx81OghBEToJH5jC/6G6CRDH3mwUOCcXfyM=; b=yymY+EUbBSPiXS
	/D6jtYc71x2Meqj7t5gQjDZz0gKUtgDKwgow3brGbOjrbZEwzjtD+Svz1V0ZeVJ+wJkh06JzxepUl
	FE4bMVhB1M/tO5RvcqYAuU512E+pEMz72Ur9XjTcAJKfILPMFbLc4bGmLpe9r9KS7603Q2TJjQFrb
	8P2qJfEREK3qfAggzgcz7F/KM8WhzxDoPBR4miPSE7lxouDVP0teOE9FClGiBVqfSI8xMGAnX0CQY
	NgoIFTBsl8iIiG9Eu35+RskeuvFkV0VVR4PqiJLotqRnzFTdm6RM+pFPycGjqwNWoLbO21VfnuTSs
	AmE/mazklbXCnY4Ib/1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TgI-0000000696L-2nTb;
	Mon, 07 Sep 2026 07:22:18 +0000
Received: from va-2-35.ptr.blmpb.com ([209.127.231.35])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3TgB-0000000692u-13m1
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 07:22:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1788765715; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=VwzffnaMweiWFTGCCm7C67J2s2YdHjm1W23eMUxXKb8=;
 b=q2Ns1KDBzsMKsO4Ger3Dqh0H6ydyrda4jlmh9Fw+oHuxPrRHzyQiXjbcoewryBCLNQhh2U
 +iIY+/bCVNirB7qVFVKGVtDmo23v9jxoWdfGvoQmVsP3xElZjOEq/mVZCJEzu3GtYUxiOL
 pyWmZqndespHjpaSyaghqw2Nmhdmf8l4scvUvo+ZB869F06pHaqbms8yYIB4TP/Xx1qcwG
 8zqdApRpkX6LJJWckHmHH91x0HQiscd77NgrBz4Bzou29sgaZzSdRnLrKulr+wPlGSbHmc
 u2fs3KgbWT+oOrYZT9UN9+jnKhxGg83fZf5BufWfMzjmcMXUh6wT5s58yNuFww==
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
Received: from G9WYR9K0VW ([58.250.122.114]) by smtp.feishu.cn with ESMTPS; Mon, 07 Sep 2026 15:21:52 +0800
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 0/5] Add workarounds for Picoheart erratas
X-Lms-Return-Path: <lba+26a9e6611+298069+lists.infradead.org+yang.yicong@picoheart.com>
Mime-Version: 1.0
Cc: <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, <alex@ghiti.fr>, 
	<andrew.jones@oss.qualcomm.com>, <cleger@meta.com>, 
	<geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<cuiyunhui@bytedance.com>, <yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Date: Mon,  7 Sep 2026 15:21:44 +0800
Message-Id: <20260907072149.72031-1-yang.yicong@picoheart.com>
X-Mailer: git-send-email 2.50.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_002211_382107_C4184092 
X-CRM114-Status: UNSURE (   9.71  )
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
 arch/riscv/errata/picoheart/errata.c         | 238 +++++++++++++++++++
 arch/riscv/include/asm/alternative.h         |   3 +
 arch/riscv/include/asm/cmpxchg.h             |   2 +-
 arch/riscv/include/asm/cpufeature.h          |   8 +
 arch/riscv/include/asm/csr.h                 |   1 +
 arch/riscv/include/asm/errata_list.h         |  25 +-
 arch/riscv/include/asm/errata_list_vendors.h |   4 +
 arch/riscv/include/asm/insn.h                |  63 ++++-
 arch/riscv/include/asm/processor.h           |   2 +-
 arch/riscv/include/asm/vendorid_list.h       |   1 +
 arch/riscv/kernel/alternative.c              |   5 +
 arch/riscv/kernel/asm-offsets.c              |   6 +-
 arch/riscv/kernel/cpufeature.c               |  16 +-
 arch/riscv/kernel/entry.S                    |  14 +-
 arch/riscv/kernel/traps.c                    |   4 +
 arch/riscv/kernel/traps_misaligned.c         |  52 ----
 arch/riscv/kernel/vector.c                   |   6 +-
 20 files changed, 419 insertions(+), 71 deletions(-)
 create mode 100644 arch/riscv/errata/picoheart/Makefile
 create mode 100644 arch/riscv/errata/picoheart/errata.c

-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
