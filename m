Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B423C433FE
	for <linux-riscv@archiver.kernel.org>; Thu,  5 May 2022 03:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zeFYTie1k9xAaobRUfCUqPp5AJmuiVOduBiRmCJpROI=; b=kG1B47cdM3oPsG
	OAt0VJdDd2s7Zl1e8yEnTPqqX9xSUWV6RspzESej1214S52PGwOXXOpNZHF6YfOjqf+aYkpVRX8Re
	+dqJog6yRvvp8N9F82YtvkRcNEEvGoM03y2/uvauep4WOGQsf0qppwxQ88LmFrBve9Jae55Cg5thC
	9S6TSUCLaJmJhh91407EOl9mcW2/tmA7nYP27Ahiz8rbaMf0W2bZ5w/dwKGN4Rpzb56U2rzDOOBhW
	V1ZvolBz9uurBBJsuXSjMTQoSpsgkS+PH+0f+keAmgtF3Z0ix+aqrmSwdxsDGnEVmV9hm1CpOhpcH
	KioZgsGWVcrJNxXgGQPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmSag-00Dqlr-0u; Thu, 05 May 2022 03:55:46 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmSad-00DqlD-8i
 for linux-riscv@lists.infradead.org; Thu, 05 May 2022 03:55:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 961916195F;
 Thu,  5 May 2022 03:55:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3AD2C385AC;
 Thu,  5 May 2022 03:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1651722942;
 bh=WtKfSSpJyyg8U7WnHs0+h877cAtlMW6k7Jts1zje+Yc=;
 h=From:To:Cc:Subject:Date:From;
 b=BLyjvww/B/ExPUb6b/Pk1RsHg+gDHh12Smnakuo3vtpcjA/Gfyrrl5GbQmSy7NSkz
 Sa90xNvLa5TzNNJtPCNdhdslVHc2fuiGV6Ra9c38lZrH+PznvaswjdiDo29al//gV1
 /P464VGIHNqGjDdaz7ETsrsjCrNH5j2kL4qHay5NTK+dJLnBrIV+aAMWxQvmYFk732
 s9O0mpeYfo2QG3X9NIOTe6UiuOm3DCwMij+65LerUhc6nwkLzpN8Q4CpNW3wALir8U
 p15YjkTYyRb66N056wfPtxuv8SfS8m0GdhRJPPExolHzQvm7jWYrkivUwe3IAGQD/2
 zw8LPryNF0SbQ==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V4 0/5] riscv: Optimize atomic implementation
Date: Thu,  5 May 2022 11:55:21 +0800
Message-Id: <20220505035526.2974382-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_205543_386481_95716456 
X-CRM114-Status: UNSURE (   8.01  )
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

Here are some optimizations for riscv atomic implementation, the first
three patches are normal cleanup and custom implementation without
relating to atomic semantics.

The 4th is the same as arm64 LSE with using embedded .aq/.rl
annotation.

The 5th is good for riscv implementation with reducing a full-barrier
cost.

Changes in V4:
 - Coding convention & optimize the comments
 - Re-order the patchset

Changes in V3:
 - Fixup usage of lr.rl & sc.aq with violation of ISA
 - Add Optimize dec_if_positive functions
 - Add conditional atomic operations' optimization

Changes in V2:
 - Fixup LR/SC memory barrier semantic problems which pointed by
   Rutland
 - Combine patches into one patchset series
 - Separate AMO optimization & LRSC optimization for convenience
   patch review

Guo Ren (5):
  riscv: atomic: Cleanup unnecessary definition
  riscv: atomic: Optimize acquire and release for AMO operations
  riscv: atomic: Optimize memory barrier semantics of LRSC-pairs
  riscv: atomic: Optimize dec_if_positive functions
  riscv: atomic: Add conditional atomic operations' optimization

Guo Ren (5):
  riscv: atomic: Cleanup unnecessary definition
  riscv: atomic: Optimize dec_if_positive functions
  riscv: atomic: Add custom conditional atomic operation implementation
  riscv: atomic: Optimize atomic_ops & xchg with .aq/rl annotation
  riscv: atomic: Optimize LRSC-pairs atomic ops with .aqrl annotation

 arch/riscv/include/asm/atomic.h  | 174 +++++++++++++++++++++++++++----
 arch/riscv/include/asm/cmpxchg.h |  30 ++----
 2 files changed, 162 insertions(+), 42 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
