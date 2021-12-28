Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38525C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:48:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=2EXrCN53/WCx5A8eL5yAnsvivmw4MfOdN01mZPaGP/Y=; b=igobWW7dNpMtBj
	0/wMd8MjEu02tAcz4g+BfA9vv2hUUpKLExFkExzwtFtHs8PGBFmMc6TkzywvxmaMLCC0dnC9CiY/I
	7NyrHtgGoiOaK8t+FoP7ivijqj1aEZ4G3GHAqb0oM20K7WcS5WCgt3K0tAejaY+E+A8D7iXRLte/t
	BVpiI99Oo/x52Dn9P83I6PLlDjqErzSjm86J2DU5qWXncYxNd0jsYnj6g7eM9B+qN6bYh3TIU4Rv5
	5/ty4eFdkntfWB0elPRwp15eyydiuzNQsNlSSz0MgUrioDrhcVOXAvVek8iXizTFuOf0u7T0pFqq2
	j7lSOJgAbcnj4dr9q5AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26H3-000Glj-JQ; Tue, 28 Dec 2021 06:47:53 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26Gs-000Gii-4R; Tue, 28 Dec 2021 06:47:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id B8E1D6116B;
 Tue, 28 Dec 2021 06:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD265C36AE8;
 Tue, 28 Dec 2021 06:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674060;
 bh=pDkAgbZHBe02te6liij9nNRo6iDaWmoyo0HIE9qWJ7Q=;
 h=From:To:Cc:Subject:Date:From;
 b=J0tQTGU5yi38c+R7BCY6ovWaCF+3fcuMSMVPO0ZRPYD6cNTNbp6xwPfIVbvfPfsyJ
 Lepzv4jyp/tVTUjWsJIfMwPMiLq14rKXa3U3oMr52+7hhJoH1ePjkE/8VN2amD8bU5
 bkXgWGHWueeTbotl81lQ3/pKiQaiBBWeyq4F9gHflYHKxFQ026DrAOVB8E8bYuS7UP
 6a4Jc7YE3Qc7t1WXocvq21585wOb1llRUc6Qb/luci8VZ1KbmEaVFJ3/fFnSFPK3/u
 yppWVn13Bbucm8V7j+yKYEMcyL9CzCmkboFrXy6S/12731Coph7/qfrwdAyU+SHMqy
 Pi1bm8dXC+iEQ==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 0/8] sched: Remove unused TASK_SIZE_OF for all archs
Date: Tue, 28 Dec 2021 14:47:21 +0800
Message-Id: <20211228064730.2882351-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_224742_264727_09914D6C 
X-CRM114-Status: UNSURE (   8.35  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux, now. Delete in include/linux/sched.h
and arch's include/asm. This would confuse people who are
implementing the COMPAT feature for architecture.

Changes in v3:
 - Fixup Documentation/process/submitting-patches.rst, add sender
   Signed-off-by.

Changes in v2:
 - Add Arnd's comment in main patch
 - Optimize coding convention with Christophe's advise

Guo Ren (8):
  sched: Remove unused TASK_SIZE_OF
  sched: x86: Remove unused TASK_SIZE_OF
  sched: sparc: Remove unused TASK_SIZE_OF
  sched: powerpc: Remove unused TASK_SIZE_OF
  sched: s390: Remove unused TASK_SIZE_OF
  sched: parisc: Remove unused TASK_SIZE_OF
  sched: arm64: Remove unused TASK_SIZE_OF
  sched: mips: Remove unused TASK_SIZE_OF

 arch/arm64/include/asm/processor.h      | 2 --
 arch/mips/include/asm/processor.h       | 3 ---
 arch/parisc/include/asm/processor.h     | 3 +--
 arch/powerpc/include/asm/task_size_64.h | 6 +-----
 arch/s390/include/asm/processor.h       | 3 +--
 arch/sparc/include/asm/processor_64.h   | 3 ---
 arch/x86/include/asm/page_64_types.h    | 2 --
 include/linux/sched.h                   | 4 ----
 8 files changed, 3 insertions(+), 23 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
