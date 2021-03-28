Return-Path: <SRS0=/ZyV=I2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41035C433DB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:40 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id AC9516198F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Mar 2021 06:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AC9516198F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hrAvwbu33xlud4sQaYFKmcTdB2dSxQBpQFnPGjT3esU=; b=RlsxPTVZUUy9t6DBcnCpV7Ds0d
	ubXB1hjUqP2sw/Cll6hQkb/XR09CGGePjWyp+CcyZi7otuAKLnNSt+DUAF7R+bp5OfSL5gLGiicC9
	8uDex3+KqV1T9rcL39+3TwqtWOVavalLlc2GAr0lsRkRnzq6P4DTOefWlCZ9Zc6A30ikrtm8ZKTEX
	38iUTcfdly0UHSCS70b0e4zLmJqQ4T/Pt0IdIDP8R0mgVQJgQfZJ0CFDeSgmEXkcuNIRq3mfpu+pi
	SOobX9AAPtEOrLFZK00sJIRO8sQ8Liu4ImztBRyxl0dNPit7bZya3ULOsbbuKrm3DWnqJnLDj0+GM
	R2AjjFCw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQOxI-005utM-Fv; Sun, 28 Mar 2021 06:31:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQOxD-005urk-U9
 for linux-riscv@lists.infradead.org; Sun, 28 Mar 2021 06:31:22 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id A43E36197C;
 Sun, 28 Mar 2021 06:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616913076;
 bh=fIYmtiiVahTZKgHaQD+jDuMxYY5AvOy62Q+boojOK1E=;
 h=From:To:Cc:Subject:Date:From;
 b=TZ3ei7zBeAgVBpKeSMgUIfT7cFEsCeH1gjJAc1Xka+xh1tEnN6M+Juhcxj4cMHSJ6
 WmILreZnGkimmxPtbMXMLKfedRa/wD37UVBmGCsKO3FB75rnREvgypwcEkfIe51j4u
 /lAcvsk3EEHh9Hg1GmHcvDQb7ilTxctp3FsxA13LHoejLlR7k2ECSFxo9LF+OTle7G
 sS1dndQX+pK0CxgW0gsgWvaFbWNF+lH/vurb0mQGAd1dG3eq4gg6flYOpQa4HmQrua
 0CR5asMfgeWZ1rL4qzvhyivvy1moujsSCNT4SCYn4sfSp0zU71oleIAtjphFxp9yb1
 MVZVtA9yLHxfA==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH v5 0/7] riscv: Add qspinlock/qrwlock
Date: Sun, 28 Mar 2021 06:30:21 +0000
Message-Id: <1616913028-83376-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210328_073120_302621_91D5F391 
X-CRM114-Status: UNSURE (   6.61  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Current riscv is still using baby spinlock implementation. It'll cause
fairness and cache line bouncing problems. Many people are involved
and pay the efforts to improve it:

 - The first version of patch was made in 2019.1:
   https://lore.kernel.org/linux-riscv/20190211043829.30096-1-michaeljclark@mac.com/#r

 - The second version was made in 2020.11:
   https://lore.kernel.org/linux-riscv/1606225437-22948-2-git-send-email-guoren@kernel.org/

 - A good discussion at Platform HSC.2021-03-08:
   https://drive.google.com/drive/folders/1ooqdnIsYx7XKor5O1XTtM6D1CHp4hc0p

Hope your comments and Tested-by or Co-developed-by or Reviewed-by ...

Let's kick the qspinlock into riscv right now (Also for the
architecture which hasn't xchg16 atomic instruction.)

Change V5:
 - Fixup #endif comment typo by Waiman
 - Remove cmpxchg coding convention patches which will get into a
   separate patchset later by Arnd's advice
 - Try to involve more architectures in the discussion

Change V4:
 - Remove custom sub-word xchg implementation
 - Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32 in locking/qspinlock

Change V3:
 - Coding convention by Peter Zijlstra's advices

Change V2:
 - Coding convention in cmpxchg.h
 - Re-implement short xchg
 - Remove char & cmpxchg implementations

Guo Ren (6):
  locking/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  csky: Convert custom spinlock/rwlock to generic qspinlock/qrwlock
  powerpc/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  openrisc: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  sparc: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  xtensa: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32

Michael Clark (1):
  riscv: Convert custom spinlock/rwlock to generic qspinlock/qrwlock

 arch/csky/Kconfig                       |   2 +
 arch/csky/include/asm/Kbuild            |   2 +
 arch/csky/include/asm/spinlock.h        |  82 +--------------
 arch/csky/include/asm/spinlock_types.h  |  16 +--
 arch/openrisc/Kconfig                   |   1 +
 arch/powerpc/Kconfig                    |   1 +
 arch/riscv/Kconfig                      |   3 +
 arch/riscv/include/asm/Kbuild           |   3 +
 arch/riscv/include/asm/spinlock.h       | 126 +-----------------------
 arch/riscv/include/asm/spinlock_types.h |  15 +--
 arch/sparc/Kconfig                      |   1 +
 arch/xtensa/Kconfig                     |   1 +
 kernel/Kconfig.locks                    |   3 +
 kernel/locking/qspinlock.c              |  46 +++++----
 14 files changed, 49 insertions(+), 253 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
