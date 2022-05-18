Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9693DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 18 May 2022 17:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KJh0VKvwr0DXFXRNigXSXgLEuX98ACK7kLA0IBiw2AU=; b=1cutNSAlPHDPcf
	U9bPOYmT9xGLTguXi5yKz2TobY07ShSGpLCOwknj23dkHY4dUti9NdqT+aLwlzTQHUKvRlDY4AKhe
	5u0J84edptol6Y7MQKFU3aJx4kSJUzX7gpBc7jE3GE5uI5RFMLLZwlhwg3kJVvNOdwceJHlFE3cSM
	UJrfPpv9RJ2a2AmzicmF5kNujR25+PrTUz6xmDUgm9ffZUXUaobmTw7Fufet0o5ILaDL667vRNkr+
	7IkosPsQLtOl2tng71j1rfbHQhYM/IA+g+AzIrao3/BaDXXHxHngOIrEtoWmqgDAqFaA8EWW9pOyT
	Bzkf6blu6g/DKTH37Gdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrN4l-003ACV-BV; Wed, 18 May 2022 17:03:07 +0000
Received: from gloria.sntech.de ([185.11.138.130])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrN4h-003A9Y-NG
 for linux-riscv@lists.infradead.org; Wed, 18 May 2022 17:03:04 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88]
 helo=phil.lan)
 by gloria.sntech.de with esmtpsa (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <heiko@sntech.de>)
 id 1nrN4c-0001Pv-8E; Wed, 18 May 2022 19:02:58 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: palmer@dabbelt.com,
	paul.walmsley@sifive.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 wefu@redhat.com, guoren@kernel.org, mick@ics.forth.gr, samuel@sholland.org,
 cmuellner@linux.com, philipp.tomsich@vrull.eu, hch@lst.de,
 Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 0/4] riscv: some svpbmt fixes
Date: Wed, 18 May 2022 19:02:50 +0200
Message-Id: <20220518170254.3178923-1-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220518_100303_817345_D40830C3 
X-CRM114-Status: UNSURE (   7.77  )
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

Some additionals comments and notes from autobuilders received
after the series got applied, warranted some changes.

So this is a small collection of cleanups for the svpbmt v10 series.

Heiko Stuebner (4):
  riscv: drop cpufeature_apply_feature tracking variable
  riscv: Improve description for RISCV_ISA_SVPBMT Kconfig symbol
  riscv: make patch-function pointer more generic in
    cpu_manufacturer_info struct
  riscv: fix dependency for t-head errata

 arch/riscv/Kconfig              |  9 +++++++--
 arch/riscv/Kconfig.erratas      |  1 +
 arch/riscv/kernel/alternative.c | 18 +++++++++---------
 arch/riscv/kernel/cpufeature.c  |  5 +----
 4 files changed, 18 insertions(+), 15 deletions(-)

-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
