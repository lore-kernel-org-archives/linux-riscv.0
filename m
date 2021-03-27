Return-Path: <SRS0=+x6g=IZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74692C433DB
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 18:07:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0F17F61971
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Mar 2021 18:07:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0F17F61971
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=tJdGygRcLFzLaPAvpFxGE7QsMa6R/M8P8POPOVKL1YU=; b=Kt0Bl6J1B1UfXYsek2/12ZK09w
	9pDT9vwQwXfvSl1DrdDR2ldHRNYmEPCPZoUiGAipGOmJzJJKtEm2lFeZ/SAmCZAbgtbtqWaZJwrUE
	gXujUACmTlOOymypRae+iNm6D6W6FF73lVsexAFC++HXIWVw37aK0eWq+odL6KlFRjG5Z45Tcb3lK
	S9eGQzqdKvkCKfUpPAqVFqL0YPuaekphkmLLSYJZ+Hnxph8hdUsF5K8IwVskh1fTlT13MtpuHr4RV
	yvhe+hcKWZggsP7Kj519NWt2OF3XRHkYx+H2T/jFiQHKea0k2XTx3Wm0XkmmcY5vrxnd//Yec1inc
	R4EMlpZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lQDLS-005OOy-Ve; Sat, 27 Mar 2021 18:07:35 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lQDLO-005OO1-RE
 for linux-riscv@lists.infradead.org; Sat, 27 Mar 2021 18:07:33 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3102E61971;
 Sat, 27 Mar 2021 18:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1616868447;
 bh=jOjbe1bkmnmiLoMyYXpPV5LKMugQ9fEQ5nrJ29GUIc4=;
 h=From:To:Cc:Subject:Date:From;
 b=QnO8uaJANl2WK3/TSy5NyvRa0HtcCox/KyFmkdXVNBiD5Sv3pjR2yMw5wuHbViQ+Q
 QqPhA4BcmkYLmox7w0qz3woi53OwRGpbXq0B2pMx6s9iav0OFIAyWboLfCk3jIg4Vq
 KfW+vK5Bg9FDTLXGknXKye9nVGP4IS9rhMb5qJpG7CWRQenDNQ446u404J9fU9tWXK
 vFOw4Ix6lYhPvksO+5OCMBdbBGN6VNQUAEbRX+q0JdrFlCy+gI1xBKsgNJFww60rNf
 NgEMC1SJP2ewGymKaa4Czon2swVmLU4sAx76arr2ZujjZ/EhFPPc32OQLQfx7+crSe
 WN+Z+3cByBzSg==
From: guoren@kernel.org
To: guoren@kernel.org
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, linux-arch@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH v4 0/4] riscv: Add qspinlock/qrwlock
Date: Sat, 27 Mar 2021 18:06:35 +0000
Message-Id: <1616868399-82848-1-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210327_180731_374379_3A88CA56 
X-CRM114-Status: UNSURE (   6.01  )
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

Change V4:
 - Remove custom sub-word xchg implementation
 - Add ARCH_USE_QUEUED_SPINLOCKS_XCHG32 in locking/qspinlock 

Change V3:
 - Coding convention by Peter Zijlstra's advices 

Change V2:
 - Coding convention in cmpxchg.h
 - Re-implement short xchg
 - Remove char & cmpxchg implementations

Guo Ren (3):
  riscv: cmpxchg.h: Cleanup unused code
  riscv: cmpxchg.h: Merge macros
  riscv: cmpxchg.h: Implement xchg for short

Michael Clark (1):
  riscv: Convert custom spinlock/rwlock to generic qspinlock/qrwlock

 arch/riscv/Kconfig                      |   2 +
 arch/riscv/include/asm/Kbuild           |   3 +
 arch/riscv/include/asm/cmpxchg.h        | 211 ++++++------------------
 arch/riscv/include/asm/spinlock.h       | 126 +-------------
 arch/riscv/include/asm/spinlock_types.h |  15 +-
 5 files changed, 58 insertions(+), 299 deletions(-)

-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
