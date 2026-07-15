Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB1EC44507
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 08:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Message-Id:Subject:To:Mime-Version:From
	:Date:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UBlrdQAS5HJv3CNkJTCcy5ydV7lkO8s/jILN7WHw/2k=; b=2eoaDLVfVA/7p9
	TXm42WMzd801TVwfA3RL3VSpIpPUc6/G6vilfugrQcoe8DV/REwRBlr3L41BC/A8fiSAUa2OpI6sG
	jnn5KXFTyMRS/X8rx1uFhJLLgzCICKLo2dOCe/iFuTWcGrzFqREMVB64rmNy00vsYNM/W7R9KwGEt
	GQG8WKIvvtGX1+qI2Uak/KGVbriwLtLbSICLdWeD+OpsvUOjH25imZdoGx4E280+2QC5R7nlTHnF1
	0KRCi+Cdsi68eVchQPcCX9Y5lKdTbud60rc/umO3k2shQKodrq64HZaK2rrmMunhUnLXSepO610gG
	KCT3aHpjjL4pLEXT8OQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvHK-0000000ECAO-05m5;
	Wed, 15 Jul 2026 08:47:42 +0000
Received: from va-2-26.ptr.blmpb.com ([209.127.231.26])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjvHH-0000000EC9M-1Rky
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 08:47:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=feishu2604151535; d=picoheart.com; t=1784105250; h=from:subject:
 mime-version:from:date:message-id:subject:to:cc:reply-to:content-type:
 mime-version:in-reply-to:message-id;
 bh=rq0GZ1ZG2gU7ZVhf3vfT21vG/Iblw41YHZKVS8MsPdI=;
 b=xKge4aUpZtqDOmJS0RKbKvtyW8UVyPiQgg8uKtU5qI7N0zx9MkT5OVSZiAiO5dl2RcF36f
 ndndmL7HsjeFlw6DGqhrRph1gvxfgAvTUuvw85HHLwE5SFPTHYydPGNk/1Y7aKuT5BLA5W
 kBPvho7BtBJedy4ltq25CkbxTr04PqQMQNbogpaqV0+vA/IBIbzaOGbGp6+E9Y6vXCgY1O
 m7aPgJ0JXRWxFtlqRJsx63AbPduKYdyeorBzQdFpi/nAFxT63SIi12kzb6sd2atFh/NM6B
 3Dgl2nz0bVXEdAUky9dmlQ574fFIWAdHIOevtofbZouNqk7DzZf1q3wVZHWR2g==
X-Mailer: git-send-email 2.50.1
Cc: <geshijian@picoheart.com>, <niehaitao@picoheart.com>, 
	<yang.yicong@picoheart.com>, <cuiyunhui@bytedance.com>
Date: Wed, 15 Jul 2026 16:47:21 +0800
X-Lms-Return-Path: <lba+26a574920+29069a+lists.infradead.org+yang.yicong@picoheart.com>
From: "Yicong Yang" <yang.yicong@picoheart.com>
Mime-Version: 1.0
Received: from G9WYR9K0VW.bytedance.net ([61.141.241.112]) by smtp.feishu.cn with ESMTPS; Wed, 15 Jul 2026 16:47:27 +0800
X-Original-From: Yicong Yang <yang.yicong@picoheart.com>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, 
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v1 0/3] Add workarounds for Picoheart erratas
Message-Id: <20260715084724.26578-1-yang.yicong@picoheart.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_014739_580433_90DA6987 
X-CRM114-Status: UNSURE (   7.97  )
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
erratas on our hardware.

Yicong Yang (3):
  riscv: errata: Add init framework for picoheart errata
  riscv: errata: picoheart: Add workaround for cbo.clean errata
  riscv: errata: picoheart: Add workaround for AMOCASQ errata

 arch/riscv/Kconfig.errata                    |  34 +++
 arch/riscv/errata/Makefile                   |   1 +
 arch/riscv/errata/picoheart/Makefile         |   5 +
 arch/riscv/errata/picoheart/errata.c         | 223 +++++++++++++++++++
 arch/riscv/include/asm/alternative.h         |   3 +
 arch/riscv/include/asm/cmpxchg.h             |   2 +-
 arch/riscv/include/asm/cpufeature.h          |   8 +
 arch/riscv/include/asm/errata_list.h         |  25 ++-
 arch/riscv/include/asm/errata_list_vendors.h |   4 +
 arch/riscv/include/asm/insn.h                |   4 +
 arch/riscv/include/asm/vendorid_list.h       |   1 +
 arch/riscv/kernel/alternative.c              |   5 +
 arch/riscv/kernel/cpufeature.c               |  16 +-
 arch/riscv/kernel/traps.c                    |   4 +
 14 files changed, 332 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/errata/picoheart/Makefile
 create mode 100644 arch/riscv/errata/picoheart/errata.c

-- 
2.50.1 (Apple Git-155)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
