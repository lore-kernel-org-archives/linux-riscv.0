Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FD2CCA47C
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 14:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sEpi6JJ4DkmXP7qjoNrgxe/RRiXseOcKssEjwogPt/A=; b=TnuiBMYQYOhK88
	qRCsN3JKtDC6DuPFgJy7i32YFlS0xl58e7XKD/AoZCDf+XDI+J5NMjSacJi7+A7FhEgN/iQxrbsSR
	obmIV/vI3tQ7+I8WejZWSGPhWXwATQbw8UiwLPyxr7o7g6PQiK60/Q/GQfZ9oq6KRUYvQzYWIcWyw
	7rVCcGLE8w/sqLe5vNeIWAe1bXi187cE/rATVCb6p+MKR99h0sqP4DDU8c3du1M9c8UyLHuVZwCg2
	XAoa0lJwUBOC4aqx3pB1moZXadEc/2A1HrIJAsJE6a5dQ0gbCncT+eqZvSPcA6E1PqcR30OrqCrfD
	OFnu8AzdZ/U+wvJvcKzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyaF9-0085o8-Gj; Tue, 07 Jun 2022 14:31:39 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyaF0-0085iy-E5
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 14:31:32 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1nyaEv-0008Ra-8h; Tue, 07 Jun 2022 16:31:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	wefu@redhat.com,
	guoren@kernel.org,
	mick@ics.forth.gr,
	samuel@sholland.org,
	cmuellner@linux.com,
	philipp.tomsich@vrull.eu,
	hch@lst.de,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 0/2] riscv: Add macro for multiple nop instructions
Date: Tue,  7 Jun 2022 16:30:57 +0200
Message-Id: <20220607143059.1054074-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_073130_580263_81776568 
X-CRM114-Status: UNSURE (   8.47  )
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

Some cases need multiple nop instructions and arm64 already has a
nice helper for not needing to write all of them out but instead
use a helper to add n nops.

So add a similar thing to riscv and convert the T-Head PMA
alternative to use it.


Heiko Stuebner (2):
  riscv: introduce nops and __nops macros for NOP sequences
  riscv: convert the t-head pbmt errata to use the __nops macro

 arch/riscv/include/asm/asm.h         | 15 +++++++++++++++
 arch/riscv/include/asm/barrier.h     |  2 ++
 arch/riscv/include/asm/errata_list.h |  8 +-------
 3 files changed, 18 insertions(+), 7 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
