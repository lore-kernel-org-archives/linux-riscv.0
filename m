Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F02CC7EE26
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 16:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/U4MTWHndei6/uzJB3CLVPDRL8MjVPb6aJt/HzmArcs=; b=1ksFQsAOZdm3fL
	5ho5ibraNJPl1YDlsPShI5XFG2H3srSdvC6NX6GLSfFcD8PiZmDHt1hnJPSNdUalf4hkn15tphxX8
	/vYP0D3tHU0loKSYEfIsQ8uV9e8M5eCZORFvH9oKAgq6caj1bAihCeqmubS2otfp2OO6df5UygD06
	Ybu1cE7DyZMVlvySp9giSSi6uI/6yABbWYYS/mjhD4BMuDAFSy14E3J4zVzn2GBosXbWS2n3byXn/
	1GB/lXylwEGeK0SIWWADELK+PLjucHynVg75qnTM6glFpkkVxTl8Scug3WtUII5tc7ydND7QlYCqO
	b5PDTxrvAKcGxy2vvEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmmb-006a9p-1I;
	Wed, 10 May 2023 16:35:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmmY-006a90-23
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 16:35:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9306064A1B;
	Wed, 10 May 2023 16:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF292C433D2;
	Wed, 10 May 2023 16:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683736512;
	bh=xdYYdDgbeOJh27nNgHFmZzDLEDBpmLgBjwcmj+Nf3Qo=;
	h=From:To:Cc:Subject:Date:From;
	b=Ai1fuoEkb9u4C4wGl9R2tgr/RHpVl5lsEnKBu1vH6mNsGLY/jjHm8BqcvPlUHIKQ8
	 eCB1lLFWH5QTU3rFLgFZiAXV5GvfucEMWbtXp+N9ChOkxUh3T8a6+BM/z4kz5qevc3
	 qCxqhUnaRiemW6zyiwP1enG9ewAv7kMK3dSo11CCXCZC2IuPz9tAn+2Y8M5i7m02YM
	 IiOevP4GQDOabCnTmoL8PLPRwcOAaDrtsecp/R/kiuNtD3Qpwn5yUmE+cPoTkIgtrV
	 F1WGS37oCrfOJUE1oTNqpGh2wrKqXVfs0QcEaz02CM7OO9lRmQ3THYBqERDPMipx8B
	 m/wPG2pwQLLGw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Schaffner Tobias <tobias.schaffner@siemens.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH RT 0/3] riscv: add PREEMPT_RT support
Date: Thu, 11 May 2023 00:24:03 +0800
Message-Id: <20230510162406.1955-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_093514_735649_7F96BC6E 
X-CRM114-Status: GOOD (  10.23  )
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

This series is to add PREEMPT_RT support to riscv. Compared with last
try[1], there are two major changes:

1. riscv has been converted to Generic Entry. And riscv uses
asm-generic/preeempt.h, so we need to patch asm-generic's preeempt to
enable lazy preempt support for riscv. This is what patch1 does.
However, it duplicates the preempt_lazy_count() defintion, I'm sure
there must be an elegant solution. Neverless, it doesn't impact the
riscv PREEMPT_RT support itself.

2. three preparation patches(patch1/2/3 in [1]) has been merged in
mainline.

I back-ported the lastest linux-6.3.y-rt patches to the lastest Linus tree,
then cook this series.

Link: https://lore.kernel.org/linux-riscv/20220831175920.2806-1-jszhang@kernel.org/

Jisheng Zhang (3):
  asm-generic/preempt: also check preempt_lazy_count for
    should_resched() etc.
  riscv: add lazy preempt support
  riscv: Allow to enable RT

 arch/riscv/Kconfig                   | 2 ++
 arch/riscv/include/asm/thread_info.h | 5 ++++-
 arch/riscv/kernel/asm-offsets.c      | 1 +
 include/asm-generic/preempt.h        | 8 +++++++-
 4 files changed, 14 insertions(+), 2 deletions(-)

-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
