Return-Path: <SRS0=tgI3=Q5=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6202C43381
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:42:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8F16D206BB
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 22 Feb 2019 19:42:32 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Da47mZCj";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="o7fUN/NT"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8F16D206BB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=vhB4PIxY4Ps/tzpwujeCzUnLjQhZ3qhFka7klmXlLQw=; b=Da4
	7mZCjZOt9bg8JA914VwITxKcbOBqMQ3V3rp94qPZnMiu9Rg+6ZzUFSs/D4Tm33M7sZMTlGdUonyoJ
	nNZS+YGuIsuudgLHKoe/5GfrFjuZNDnKiOa3HWc9MT+0nJ52veJEWwWG+24dN28iJt27PG6YIBX7t
	ifMXWTla+KZT4+saKCNLvKkrWihFqHX1MZzCS9+Wqg01zFlwex5A5yTnuMUpaVmmYVLzt+wHYSa1t
	tcyoBaqd1+NBdXrWuZN8PHlyjNQ/Itp8BhfatiujleUbwu/OI4Ntr/rEFds6GoYkCYluyMuwC+XdG
	fSjfDC/q9UEPXV4jLOoMNZZgjck0aRg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gxGiL-0007Qt-2O; Fri, 22 Feb 2019 19:42:29 +0000
Received: from esa4.hgst.iphmx.com ([216.71.154.42])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gxGiG-0007Jh-Aq
 for linux-riscv@lists.infradead.org; Fri, 22 Feb 2019 19:42:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1550864544; x=1582400544;
 h=from:to:cc:subject:date:message-id;
 bh=wb0dw4T5YMS0q07wWKgtgtrcUdnKjfeD2XfS99Hk2IU=;
 b=o7fUN/NTH8jF24y3ozmJgknZaXIXpSkOnCYETFnsg9mr3r3e3MWEB50n
 xZ/qUKRt2TpT2fiVw6yQsxrz1I6tpQWLPrNjqWAE6YoaTMRYJ715BdhmI
 qpkMy/UvF8T/BeuxbJZT7V3Kuw21yvIcjcrbK5qpALPzmFDtUdaIep/Vk
 1zZYmyyWY9/t+Nyv95rdmr+9OSp3vL16VAGcyWM8drRlngTiFWepIJpXh
 KHefs6Dl2dyTmtKYFC8ZV78yCDMRbU/hFBITem11pdCRJCIsF4F4Qxm7Z
 gzS+/SLS/G6q4gFls5mL+Wb6yWCle7Cr6i7hhOKDbpLigji/qSejD1rx2 g==;
X-IronPort-AV: E=Sophos;i="5.58,400,1544457600"; d="scan'208";a="101966786"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 23 Feb 2019 03:42:04 +0800
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP; 22 Feb 2019 11:20:02 -0800
Received: from jedi-01.sdcorp.global.sandisk.com (HELO
 jedi-01.int.fusionio.com) ([10.11.143.218])
 by uls-op-cesaip01.wdc.com with ESMTP; 22 Feb 2019 11:41:44 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-riscv@lists.infradead.org
Subject: [v6 PATCH 0/6] Various SMP related fixes
Date: Fri, 22 Feb 2019 11:41:34 -0800
Message-Id: <1550864500-13652-1-git-send-email-atish.patra@wdc.com>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190222_114224_432370_B82BAE2A 
X-CRM114-Status: UNSURE (   8.18  )
X-CRM114-Notice: Please train this message.
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alan Kao <alankao@andestech.com>,
 Dmitriy Cherkasov <dmitriy@oss-tech.org>, Anup Patel <anup@brainfault.org>,
 Palmer Dabbelt <palmer@sifive.com>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, Atish Patra <atish.patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Andreas Schwab <schwab@suse.de>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The existing upstream kernel doesn't boot for non-smp configuration.
This patch series address various issues with non-smp configurations.

The patch series is based on 5.0-rc7 + Johan's below mentioned patch
series. Tested on both QEMU and HiFive Unleashed board using both
OpenSBI & BBL.

https://lore.kernel.org/lkml/20190118140308.9599-1-johan@kernel.org/   

Changes from v5->v6
1. Dropped driver patches as they have been accepted via drivers tree.

Changes from v4->v5
1. Continue processing other harts even if isa string is incorrect for
   a single hart during HWCAP processing.

Changes from v3->v4
1. Fixed commit text length issues.
2. Updated hwcap patch to use common capabilities of all harts.
3. Rebased on Johan's patch series.

Changes from v2->v3

1. Fixed spurious white space.
2. Added lockdep for smpboot completion variable.
2. Added a sanity check for hwcap.

Changes from v1->v2

1. Move the cpuid to hartid map to smp.c from setup.c
2. Split 3rd patch into several small patches based on
   logical grouping.
3. Added a new patch that fixes an issue in hwcap query.
4. Changed the title of the patch series.

Atish Patra (6):
RISC-V: Do not wait indefinitely in __cpu_up
RISC-V: Move cpuid to hartid mapping to SMP.
RISC-V: Remove NR_CPUs check during hartid search from DT
RISC-V: Allow hartid-to-cpuid function to fail.
RISC-V: Compare cpuid with NR_CPUS before mapping.
RISC-V: Assign hwcap as per comman capabilities.

arch/riscv/include/asm/smp.h   | 18 +++++++++++++-----
arch/riscv/kernel/cpu.c        |  4 ----
arch/riscv/kernel/cpufeature.c | 41 ++++++++++++++++++++++-------------------
arch/riscv/kernel/setup.c      |  9 ---------
arch/riscv/kernel/smp.c        | 10 +++++++++-
arch/riscv/kernel/smpboot.c    | 20 +++++++++++++++++---
6 files changed, 61 insertions(+), 41 deletions(-)

--
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
