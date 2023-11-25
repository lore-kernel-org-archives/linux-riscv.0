Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F62C636BD
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Nov 2023 08:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x7M0hsfge2UQqBlbv5/dxaJ9V3vdWiNADvkh8h+w6u4=; b=X9mBpo7VWKU7QE
	IUwritqr65ZUKE6pbxfMnjX2Y0qWs8g7vM6Rr+9Zb8eqOtOvvCpFL3oBKcggMZ9qod3inxDmcSbLf
	aKYO34fm616FuxQNnTuNpaLKQGFYaaIgl2xgig9NhztsUeVtMdzoo4HvQbAnOFaHn9hF1HVoSlNLS
	Qzi36f6wMXKW0OS9dogClqhm16JbUDdjwOozlHN0pQKdDbiOVWr7VCbWxaMJRG3b0a15SXbvZDax+
	1rH1XeZ45NVsCVad2BtBvPNxTADkSRg2PjNsQj4BSBE1twGYnbZGOPWKcvPe29WzwrX9dtJejJbLh
	EXsNJ9GIlAUwhecjZq/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r6o7C-008qqv-0x;
	Sat, 25 Nov 2023 08:34:14 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r6o79-008qpV-0Y
	for linux-riscv@lists.infradead.org;
	Sat, 25 Nov 2023 08:34:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id EFDD1B80AE0;
	Sat, 25 Nov 2023 08:34:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5559CC433C8;
	Sat, 25 Nov 2023 08:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1700901247;
	bh=yNvTs5UAx1BPwJURTZLeQZMlvThqxFtraUOhYepUN5M=;
	h=From:To:Cc:Subject:Date:From;
	b=UjamK1+9ds2rJGs2WYR5sxyO4tcp6KWr2aF1r20jgEr59ZYHAzGTRPAC1pWeqHUq6
	 eqBJmXhEmwS2V3z+4K3ONEYLkC4ijNo6z/9Q/4otmf4kCPE5zsbnP1BLekrGVYeATV
	 Vn9M79nY6o8gIbBPet/QBUnOOsst56flsG8QUNklHC6IH9voZfb9qn8gUzAPyBzS4Q
	 M9e8Ghy3DF6Ne0z3+irHpZ9fsn4oz3LprYK6O6eE8DwXqlmKd4DOMvtTx+j9SiBDIZ
	 dmwC+I9tGn1ZU8uNTnXHkkJ4dTizhS45yLz+8s+NDE85jqq56MK/xQamaRSp8dDGgT
	 yDJrnB07prqUQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] riscv: enable lockless lockref implementation
Date: Sat, 25 Nov 2023 16:21:42 +0800
Message-Id: <20231125082144.311-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231125_003411_368736_72520F6F 
X-CRM114-Status: UNSURE (   6.49  )
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

This series selects ARCH_USE_CMPXCHG_LOCKREF to enable the
cmpxchg-based lockless lockref implementation for riscv. Then,
implement arch_cmpxchg64_{relaxed|acquire|release}.

After patch1:
Using Linus' test case[1] on TH1520 platform, I see a 11.2% improvement.
On JH7110 platform, I see 12.0% improvement.

After patch2:
on both TH1520 and JH7110 platforms, I didn't see obvious
performance improvement with Linus' test case [1]. IMHO, this may
be related with the fence and lr.d/sc.d hw implementations. In theory,
lr/sc without fence could give performance improvement over lr/sc plus
fence, so add the code here to leave performance improvement room on
newer HW platforms.

Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]

Jisheng Zhang (2):
  riscv: select ARCH_USE_CMPXCHG_LOCKREF
  riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}

 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/cmpxchg.h | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
