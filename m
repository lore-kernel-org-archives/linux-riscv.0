Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4529DC624D4
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 13:39:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vlUaat8/ChJruiE6tR2aRHhw4M6pHwPieVehpCths6k=; b=OYUkSGBicSFxTH
	vzyHVp19SVhcVEgnMCUAD1AKiOVlqCbMEJIUII6WoWFP+pvaeRFpHnBgEDhhOKXmOiK5oFw2TOd1q
	TmxdowzBTurSkB3PLsdUs2nS5+u8Z5ghetWGFPwiOQjiFbEgrcoKi53l1jBDDbcty2jlRnPTnGJnF
	QQyXNTANscWTkY9fb38mRPsIdQvmhmT63ChbfaOFqf7WurYs1E4P36NfGGsOwfFkV4Vnpa4mwACOs
	/nmnuyWHk7gknMklH/d6TjHGi1Ed/W72UqukUAYZ1opubOPuKtzWMrQyZNH00miaiHkJ3VafIRMqX
	Du5FdOpfiJfAwc/3/Skg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oi4-0000000CEW2-3zjQ;
	Tue, 01 Sep 2026 13:39:32 +0000
Received: from out30-110.freemail.mail.aliyun.com ([115.124.30.110])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Oi2-0000000CEUd-0nWL
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 13:39:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1788269965; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=rjZG1oum5ouwIyghJAvrKRp+c0uDhrzvhztsrMAS+V4=;
	b=f8DxVwFu1I1zMWp+9TwoNs1EYCWd/M2eIv0Tl1RQBGDwfL5gSxdEVrHThKMeAkzBsX8stfdewhgyTDCJFq8t2h3AYF0qETIjTBJ+GwlwcC617IvZWnIyGTwJtHIqdY88zGQkrJCmlDEEqHUw0HvT7MveiQzawciilNMEfvhAB58=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R201e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=fangyu.yu@linux.alibaba.com;NM=1;PH=DS;RN=20;SR=0;TI=SMTPD_---0XA9NaXm_1788269962;
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0XA9NaXm_1788269962 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Sep 2026 21:39:23 +0800
From: fangyu.yu@linux.alibaba.com
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	robin.murphy@arm.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	baolu.lu@linux.intel.com,
	jroedel@suse.de,
	zong.li@sifive.com,
	andrew.jones@oss.qualcomm.com,
	anup@brainfault.org,
	jgg@nvidia.com,
	jgg@ziepe.ca
Cc: fangyu.yu@linux.alibaba.com,
	guoren@kernel.org,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 0/3] iommu/riscv: Fix command queue publishing races
Date: Tue,  1 Sep 2026 21:39:17 +0800
Message-Id: <20260901133920.14550-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_063930_740134_0BBA4FC5 
X-CRM114-Status: GOOD (  10.71  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

This series fixes races in the RISC-V IOMMU command queue submission
path.

The current command queue code reserves a producer index before the
command is written and before the hardware tail is updated. Multiple CPUs
can therefore reserve different producer indexes concurrently and then
wait for the software tail to reach their index before publishing their
own command.

That model is fragile when a command submission fails after reserving an
index. The failed producer index is never published, so later submitters
can wait behind a hole in the software producer stream. This can also
lead to misleading IOFENCE.C completion timeouts, because the sync path
may wait for a producer index whose command was never actually enqueued.

Fix this by serializing command queue publishing with a raw spinlock.
Instead of reserving producer indexes ahead of time, the submission path
uses the current software tail as the next command index, writes the
command, publishes the hardware tail, and then advances the software tail
while holding the lock. When the command queue is full, the code drops
the lock and waits for hardware consumption before retrying, so other CPUs
are not blocked behind a long hardware poll.

The final patch changes the queue submission helper to return an error 
when enqueue fails. The IOFENCE.C sync path then avoids waiting for a
command that was never published to hardware.

This series does not attempt to add full RAS/error recovery for command 
queue failures. It keeps the existing local error reporting behavior and
only fixes the software queue state and wait semantics.

---
Changes in v2:
    - Avoid reacquiring the command queue lock after waiting for space
      times out.
    - Link to v1:
      https://lore.kernel.org/linux-riscv/20260817142728.61783-1-fangyu.yu@linux.alibaba.com/

Fangyu Yu (3):
  iommu/riscv: Add command queue lock
  iommu/riscv: Serialize command queue publishing
  iommu/riscv: Avoid waiting on failed command enqueue

 drivers/iommu/riscv/iommu.c | 117 +++++++++++++++++++++---------------
 drivers/iommu/riscv/iommu.h |   2 +
 2 files changed, 72 insertions(+), 47 deletions(-)

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
