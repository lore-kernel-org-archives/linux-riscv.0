Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EDEC606A326
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Nov 2026 07:57:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=X+vq3ZUe;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=picoheart.com header.i=@picoheart.com header.a=rsa-sha256 header.s=feishu2604151535 header.b=TpF4iI+X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:Mime-Version:Subject:From:To:Date:
	Message-Id:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=TH1dyU/xysALuWmBmVwlSCurgaDsQMXKSr0KbtReftU=; b=X+vq3ZUeWkwWj7EwfmeglRIxoK
	ifFcpMkuxtXkLui8ODrAc9QVgICrNWbSa+4rAZvkpdq77sPdre5eMv64BrZw2zbInF/uX1eLziORb
	N0sreb2bEJMMhr786KrlqxiSGsDqc/4WVMcVQTuX1Z7nrF7JaM8JRrGPtHs9v8X8qynaHafcKrtS1
	Aajawfy0TI8SrdTy0/AndcYR7kpulFUEnvr0rR9wJ61dj0uJhPxY1jcWDlC79m8c/Uf2kIQhK4IFH
	sSCId762TNXFNEgwdTBeFI4QTiAeZz5KvL3O/lc4OqkKeTBqbVlEpry+wzcvJiIVXjg1RSjWhYB+4
	wyL9CQzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVs7-00000004cdw-2XDV;
	Wed, 04 Nov 2026 07:57:27 +0000
Received: from va-2-30.ptr.blmpb.com ([209.127.231.30])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOVs4-00000004cbk-0ve0
	for linux-riscv@lists.infradead.org;
	Wed, 04 Nov 2026 07:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1793779031; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=ZPtCyNRsWlQzcE1FI9/sxFlbROBKsAPk13OFr3WHzFY=;
 b=TpF4iI+XOVrp+zPD/b3dwHXEz824k14xKD8rsL3W5a3rtEpUtxzM0q62GntkNRV5rhLTSu
 2u+Z1gRKpKxVT3hk2d3qodUF4n5AJ3TGxpqg3PRXN6ZdrWDYWNvQ5Z/RpY2qNglJpgiuLu
 Bftx3n5TmYNyNfxwfqxKqLtDvPgLSiQmo/0QHIL3AippIhm8ZmGBu7uxLB7/ORTOyod2E1
 k/7e2MslTyhZ9vXMYVf7UAUFMHPFwO2BXdWBPP5ohmp30RvTBK68aRyz7SM6Swiyl+UM/i
 BQgnOA2ZJQzBx+3R6GOLCb7q3q+zYNBI3j85b3qGT8tmV5/kZZl5l3n7Wz0qEg==
Message-Id: <20261104075706.73657-1-yang.yicong@picoheart.com>
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.113]) by smtp.feishu.cn with ESMTPS; Wed, 04 Nov 2026 15:57:08 +0800
Date: Wed,  4 Nov 2026 15:57:01 +0800
X-Lms-Return-Path: <lba+26aeae555+6c554d+lists.infradead.org+yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Subject: [PATCH v6 0/5] Add workarounds for Picoheart errata
X-Archived-By: <archiver.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.54.0
Cc: <conor@kernel.org>, <wangruikang@iscas.ac.cn>, <ganboing@gmail.com>, 
	<alex@ghiti.fr>, <cleger@meta.com>, <geshijian@picoheart.com>, 
	<niehaitao@picoheart.com>, <cuiyunhui@bytedance.com>, 
	<gaohan@iscas.ac.cn>, <yang.yicong@picoheart.com>
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_235724_348935_18203DBB 
X-CRM114-Status: GOOD (  11.61  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

This series adds an errata framework for Picoheart SoCs and workarounds
for two hardware issues: unreliable cbo.clean writeback and unavailable
AMOCAS.Q despite the Zacas extension being advertised.

On affected CPUs, use cbo.flush for kernel cache writeback and trap
userspace cbo.clean/cbo.flush instructions to emulate them with cbo.flush.
Disable kernel cmpxchg128 support while retaining the other Zacas
operations. The supporting patches share the instruction-fetching helper
between fault handlers, add MXR support for execute-only mappings, and
add CBO instruction decoding definitions.

[Apply Notice]
Patch 1/5 based on below fix of stale SR_* on context switch.
https://lore.kernel.org/all/20261022083212.84721-1-cuiyunhui@bytedance.com/

Changes since v5:
- Rebase on v7.4-rc1 and drop the obsolete RISCV_ALTERNATIVE stuffs
- Use the simpler v4-style get_user() wrapper in __read_insn()
- Add Tested-by tags from Han Gao. Thanks for testing.
Link: https://lore.kernel.org/linux-riscv/20261017083100.40157-1-yang.yicong@picoheart.com/

Changes since v4:
- Rebase on v7.3-rc7.
- Make the CBO erratum depend on MMU.
- Limit MXR enablement to __get_user().
- Restrict Picoheart errata to 64BIT and skip alternative patching during
  RISCV_ALTERNATIVES_EARLY_BOOT.
Link: https://lore.kernel.org/linux-riscv/20260915083305.81913-1-yang.yicong@picoheart.com/

Changes since v3:
- Work around AMOCAS.Q by patching system_has_cmpxchg128().
Link: https://lore.kernel.org/linux-riscv/20260907072149.72031-1-yang.yicong@picoheart.com/

Changes since v2:
- Rebase on v7.3-rc2.
- Merge the MXR fix and get_insn() extraction into one patch.
Link: https://lore.kernel.org/linux-riscv/20260728094627.94975-1-yang.yicong@picoheart.com/

Changes since v1:
- Factor out a common get_insn() for reading userspace instructions.
- Fix instruction fetching from execute-only mappings.
- Apply cleanups and coding-style refinements from review.
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
 arch/riscv/include/asm/cmpxchg.h             |  18 +-
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
 19 files changed, 414 insertions(+), 70 deletions(-)
 create mode 100644 arch/riscv/errata/picoheart/Makefile
 create mode 100644 arch/riscv/errata/picoheart/errata.c

-- 
2.54.0 (Apple Git-157)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
