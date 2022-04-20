Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA28C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Apr 2022 14:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=trAviUpL37J8oe6/Rany/r3EfUsQW3moVHRL6Yec9fQ=; b=TO/m846XlOsTiz
	v0N8FM7TyVh9lgf8NGbwaxbs+NaHZ/ZlVfow4oJruKSyc2BEZQQQ4VI3gT+k8waL7UgDxkYrcxx6R
	6cKSG7Ecr+6mTisyQ/gSlo7uh+FUBIMLz9GSyali9dLft8IoShvo2mHdvJjxldpkPLay3rx5TBOOl
	o39fqpExZ1Pca6JKVP2rjdl2npNOPpdDD9XrP9suDeLLhyJ8pE0b9MaWpFgV1Kl0zB7iADlCnfc3s
	V/EMQBQrSixPUMmtyJoki8OF7UPGMjUHZWxLnPfiwsqXvSNTpOfEDf0+JB1q5tJj63HXbYSuq7rop
	LiivRYzxZg0qrCtubPMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhBZO-009RFA-2F; Wed, 20 Apr 2022 14:44:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhBZL-009RDR-CF
 for linux-riscv@lists.infradead.org; Wed, 20 Apr 2022 14:44:36 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id D2DB1B81F16;
 Wed, 20 Apr 2022 14:44:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B81AC385A0;
 Wed, 20 Apr 2022 14:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1650465872;
 bh=BJxtalf9Zs0yPnSPPVBN7503uk3AMK3IvHLCi2cAlLE=;
 h=From:To:Cc:Subject:Date:From;
 b=Cuhm4C+Fa6dviUDglNCm/8TyKK6NfQD7flxTILDwzI286WtwozK+tcR8hv+54Og/H
 TeziLf/5kWa0FwTuYC4Tdvq7aWiRf3TiwrIKopqR3gGU+mHMx7OcxQZfH4L8PypO/d
 kEXdHkNbW7whFULqddKLuwzIYS4kRMbOQfF4yfVuaWWbZ+ooFYWCedMlj+hILBdlCs
 mplvrcsCV48vq6dfUMfWehbzkxrYQh/LGc5bfhi+3s+pGxrgWWcyteP6TSTxQAzD4J
 GVPh2tXct1MsIM4bnHBPDv/F0QMSZY60ZKFpYG2oFPt8h7i7S30B6EvV9gRKdbiH+o
 4dZzBLeWVxaqg==
From: guoren@kernel.org
To: guoren@kernel.org, arnd@arndb.de, palmer@dabbelt.com, mark.rutland@arm.com,
 will@kernel.org, peterz@infradead.org, boqun.feng@gmail.com,
 dlustig@nvidia.com, parri.andrea@gmail.com
Cc: linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 0/5] riscv: atomic: Optimize AMO instructions usage
Date: Wed, 20 Apr 2022 22:44:12 +0800
Message-Id: <20220420144417.2453958-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220420_074435_583453_2697CB69 
X-CRM114-Status: UNSURE (   6.72  )
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

These patch series contain one cleanup and some optimizations for
atomic operations.

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

 arch/riscv/include/asm/atomic.h  | 168 ++++++++++++++++++++++++++++---
 arch/riscv/include/asm/cmpxchg.h |  30 ++----
 2 files changed, 160 insertions(+), 38 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
