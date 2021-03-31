Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06B75C433ED
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:03 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A93C260FF0
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 14:32:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A93C260FF0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jVj7v4N8OFaT3VDqeRwRQI4Yvk91pLhmuipn3h5X+oU=; b=qS74xp6HmZcvtPgCFLaWKy8638
	A2UZOeucahpfPIoR4GdDd1poPSqzK0ZiHE/JznU6jTUWXsGlvwfJWn9ftgTysIG9UVU9w7aDBZHkR
	VMXzhV2HHa6rZnYCmNGO7heTgjW8Mg3eCj6dL5O0njAPL8llrk0KvkmTOk5LC4MZYjPh7Q3BgVIZa
	1aGRsNOpiyIzfjs9Sg/R9paUKei9rMQENrHcgf1SdgbmLgUpOXwouXap1z/dD93Y4E2pvI/NylSMi
	8wVEBSjRQkoJQJbrBoJpZa0P3ghFCRSCyMMyRXZSPe7AImrBvmNEhycQThFIlJCMcHgcjGsyUylfi
	RxMbrc/g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRbsr-006oOL-Gv; Wed, 31 Mar 2021 14:31:49 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRbsn-006oNv-Tu
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 14:31:48 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 01F3760FF0;
 Wed, 31 Mar 2021 14:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1617201104;
 bh=Oq2p2++lqOERCPM++AATk5Rdw/3Ja6gaVMhRgPIzPF0=;
 h=From:To:Cc:Subject:Date:From;
 b=nzY/wb74M0jYfXHnZiSzoI4o7pq5Y3fTkzio1WdfkdRKufUohKQwkm1PBLN3tufHE
 9OgAOpE32h2+T9nnF1ZCPS1coRoUrCzNA6DyKMuNSxpqkRqMIdROAGSe2CoLT6u0u0
 /1h66strn7saF1NEJrq8/A+Hy2dp6ib8IsgmKIVMt9rrPFl0WEWvgcqy/N+E6U5hwm
 TGkr8KWwp9XlnInAw2drOXo7N61mG3GRNZ4E45pXzIx/rRrUYdKrtzVzakE1zxYrUT
 pBm1qXLMVF5/zB174lV3VS47Fv+LLoFhQ33oZLj5e8FJszP+LGNs4UTY3rumbNQKgY
 KMQvZq5datBQg==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-xtensa@linux-xtensa.org,
 openrisc@lists.librecores.org, sparclinux@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH v6 0/9] riscv: Add qspinlock/qrwlock
Date: Wed, 31 Mar 2021 14:30:31 +0000
Message-Id: <1617201040-83905-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_153146_334887_1DBDB487 
X-CRM114-Status: UNSURE (   8.33  )
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

 - A good discussion on V4 in mailling list:
   https://lore.kernel.org/linux-riscv/1616868399-82848-1-git-send-email-guoren@kernel.org/T/#t

 - Openrisc's maintainer want to implement arch_cmpxchg infrastructure.
   https://lore.kernel.org/linux-riscv/1616868399-82848-1-git-send-email-guoren@kernel.org/T/#m11b712fb6a4fda043811b1f4c3d61446951ed65a

Hope your comments and Tested-by or Co-developed-by or Reviewed-by ...

Let's kick the qspinlock into riscv right now (Also for the
architecture which hasn't xchg16 atomic instruction.)

Change V6:
 - Add  ticket-lock for riscv, default is qspinlock
 - Keep ticket-lock for csky,  default is ticketlock
 - Using smp_cond_load for riscv ticket-lock
 - Optimize csky ticketlock with smp_cond_load, store_release
 - Add PPC_LBARX_LWARX for powerpc 

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

Guo Ren (8):
  locking/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  riscv: locks: Introduce ticket-based spinlock implementation
  csky: locks: Optimize coding convention
  csky: Convert custom spinlock/rwlock to generic qspinlock/qrwlock
  openrisc: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  sparc: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  xtensa: qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32
  powerpc/qspinlock: Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32

Michael Clark (1):
  riscv: Convert custom spinlock/rwlock to generic qspinlock/qrwlock

 arch/csky/Kconfig                       |   8 ++
 arch/csky/include/asm/Kbuild            |   2 +
 arch/csky/include/asm/spinlock.h        |  15 +--
 arch/csky/include/asm/spinlock_types.h  |   4 +
 arch/openrisc/Kconfig                   |   1 +
 arch/powerpc/Kconfig                    |   1 +
 arch/riscv/Kconfig                      |   8 ++
 arch/riscv/include/asm/Kbuild           |   3 +
 arch/riscv/include/asm/spinlock.h       | 158 +++++++++---------------
 arch/riscv/include/asm/spinlock_types.h |  26 ++--
 arch/sparc/Kconfig                      |   1 +
 arch/xtensa/Kconfig                     |   1 +
 kernel/Kconfig.locks                    |   3 +
 kernel/locking/qspinlock.c              |  46 +++----
 14 files changed, 142 insertions(+), 135 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
