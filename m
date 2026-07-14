Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F31C44501
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Jul 2026 12:24:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NDiHDzR8o8fwFrGCY06vJDzqK/QHfb/5AIdJhMvP2Xk=; b=dMRdlwvFH/Q1ay
	Kadq8295lRByIMNfpD2w+r3HiCaFG/yPPLK3vJAEJy9YxlIuBS4Ozo5wDWQXvPQ4MbTPgrl1dHwIE
	vkmwDLIiQA9axr+UBXRh885VuLnR/86U5S0Bgc5hca1hlQ9hxGUVhDgcomeZnIvENRgpeX5RwfKsC
	g3ZF1ypQEqSi4941noCFZxuuSFOorydbdg9ntNEiaJBtF1Ynz3TthDydgnTA7kELIy0enn3G1kEIz
	1xrz35RyJuuU/6ZKD8tgJEV0M2NmibRHgdPGNKsKnUoQuq7bq3pROyNFLceFpBkwSQweRhAm6O3+S
	tEAMxSIh1RFKV2c9KU2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcBm-0000000BulW-02bg;
	Tue, 14 Jul 2026 12:24:42 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjcBi-0000000Bujm-2jZJ
	for linux-riscv@lists.infradead.org;
	Tue, 14 Jul 2026 12:24:40 +0000
X-UUID: f3ce31ca7f7e11f1aa26b74ffac11d73-20260714
X-CID-CACHE: Type:Local,Time:202607142005+08,HitQuantity:2
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:6a6ec619-f7b9-4b0d-9564-e57824157d13,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:f819ff490ccaf5fe18413fba06b8dbc4,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|136|850|865|898,TC:nil,Content:0|15|
	50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0
	,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: f3ce31ca7f7e11f1aa26b74ffac11d73-20260714
X-User: lihaofeng@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <lihaofeng@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1991047383; Tue, 14 Jul 2026 20:24:25 +0800
From: Haofeng Li <lihaofeng@kylinos.cn>
To: tglx@kernel.org
Cc: linux-kernel@vger.kernel.org,
	Haofeng Li <13266079573@163.com>,
	Haofeng Li <lihaofeng@kylinos.cn>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH 00/16] irqchip: harden initialization error paths
Date: Tue, 14 Jul 2026 20:23:35 +0800
Message-Id: <20260714122351.3274006-1-lihaofeng@kylinos.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_052439_730496_5DDBDBB0 
X-CRM114-Status: UNSURE (   7.99  )
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

An audit of irqchip initialization and allocation error paths found a
collection of resource leaks and lifetime issues across several drivers.

The most serious cases leave interrupt handlers or other globally visible
state pointing at memory that is subsequently freed or unmapped.  Other
cases leak IRQ domains, parent mappings, MMIO mappings, allocation bitmap
regions, or allocated objects when initialization fails part-way through.
The series also fixes an unbounded IMSIC MMIO lookup, a possible NULL MMIO
access in the NVIDIA T241 workaround, and two cases where useful error
information is lost or reported incorrectly.

The changes are confined to failure handling; successful initialization
paths are left unchanged.  The MIPS GIC fixes in patches 7 and 8 build on
each other, as do the Realtek RTL fixes in patches 12 and 13.  The remaining
patches are independent.

The issues addressed are:

  - bound MMIO lookup and make allocation cleanup NULL-safe;
  - roll back partially allocated IRQs, domains and bitmap regions;
  - do not free or unmap state after it has been published to live users;
  - distinguish managed from unmanaged MMIO mappings during cleanup;
  - release parent IRQ mappings, per-CPU mappings and OF node references;
  - preserve deferred-probe errors and report the correct reset error.

Haofeng Li (16):
  irqchip/riscv-imsic: fix MMIO lookup OOB and NULL cleanup
  irqchip/loongarch-ir: fix redirect free and alloc leaks
  irqchip/sifive-plic: do not iounmap devm mappings
  irqchip/crossbar: fix allocation and init cleanup
  irqchip/bcm7038-l1: clean up init failure paths
  irqchip/loongson-liointc: unmap per-core iomaps on error
  irqchip/mips-gic: clean up IRQ domain creation failure
  irqchip/mips-gic: clean up if IPI domain registration fails
  irqchip/econet: clean up VEIC initialization
  irqchip/aspeed-vic: publish handler only after domain creation
  irqchip/loongson-eiointc: preserve live state on cascade failure
  irqchip/realtek-rtl: unmap per-CPU bases on init failure
  irqchip/realtek-rtl: dispose parent mapping on domain failure
  irqchip/renesas-rzg2l: fix wrong errno in reset error log
  irqchip/gic-v3: fail T241 quirk if alias ioremap fails
  irqchip/bcm7120-l2: fix parent IRQ count error handling

 drivers/irqchip/irq-aspeed-vic.c        | 23 ++++++++++++++----
 drivers/irqchip/irq-bcm7038-l1.c        | 24 +++++++++++++++----
 drivers/irqchip/irq-bcm7120-l2.c        |  8 +++++--
 drivers/irqchip/irq-crossbar.c          | 23 ++++++++++++++++--
 drivers/irqchip/irq-econet-en751221.c   |  5 +++-
 drivers/irqchip/irq-gic-v3.c            | 11 ++++++++-
 drivers/irqchip/irq-loongarch-ir.c      | 21 +++++++++++++++--
 drivers/irqchip/irq-loongson-eiointc.c  | 13 ++++++-----
 drivers/irqchip/irq-loongson-liointc.c  |  8 +++++++
 drivers/irqchip/irq-mips-gic.c          | 31 +++++++++++++++----------
 drivers/irqchip/irq-realtek-rtl.c       | 28 ++++++++++++++++++----
 drivers/irqchip/irq-renesas-rzg2l.c     |  2 +-
 drivers/irqchip/irq-riscv-imsic-state.c | 12 ++++++----
 drivers/irqchip/irq-sifive-plic.c       |  4 +++-
 14 files changed, 168 insertions(+), 45 deletions(-)


base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
