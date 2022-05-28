Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7BC22C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 28 May 2022 00:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QP5Zei67+85/fSh/vbaiQPU25M+BQtVHE7kULc5J38g=; b=yi26kP8gh1nsf5
	hngsEd9PRpPZczlTKZAJBDzrQGtX9j6LMTdVWEEvAQrQ7E6XcgE2ndZ/0hD/AUpZAODQUo+U8atBS
	m4sNILZfOGQFND8Xri5DXDe/suVcz9F6jwqbM2rpfsaBdvNIUKRackeMQ7JWflGXQbvOL1GTHN+o0
	xKItK6ESgVHhWsMOyiE+xQTUShkSC6wAydJFihC3MQgdwWpo6lWumzNZJ4vPW4HIMMixJJafGnUSX
	T1W3ssHFxybz9zygsTvz3kiixC1NF6CeLSn2tGFy7RPfFak+N7fDd2gjxJ+Bu5KfgRY3/ZpW52rAB
	VakLTnPU9aPBA9RIL8SA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuk1n-001A54-SM; Sat, 28 May 2022 00:09:59 +0000
Received: from smtp-relay-canonical-1.canonical.com ([185.125.188.121])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nuk1l-001A4E-J0
	for linux-riscv@lists.infradead.org; Sat, 28 May 2022 00:09:59 +0000
Received: from LT2ubnt.fritz.box (ip-062-143-094-109.um16.pools.vodafone-ip.de [62.143.94.109])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-canonical-1.canonical.com (Postfix) with ESMTPSA id 6FE243FC04;
	Sat, 28 May 2022 00:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1653696586;
	bh=iv6C6fb+pb6Y/qg9+Rbp2J7/UDs4R9jxDja5tAInZvs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
	b=vfn2mRnDkLHtcQWe5nge9Kmsvfj6Dw8W3BTCGgFGW+lXLE5oC82z85GzkhJ/a5pKe
	 CYV5F0NeBJAr5cfH4BlzTTJwZqkATcyF83BdwAZ7QGV145FuBuPaozgf308pTjaHRK
	 bafShU/bTw/s0UuG+B1WHIJ2K56HNbq12SHxvqI+9TN4okbKvIJ1izswMCgwoslLTa
	 aftF3zCQwyp2irCm+GIPmSr6tH1ZSBo4jcIfkvEazZIrqPBomVEZQzfQWg0E4efCkU
	 0YNDYmFqFLPfo7Tz30oZsoBJYt5aYyy54dv1Qtrp3O0mcMYr9kja8aco+eX599uuap
	 Xr1Gj6hm4+spQ==
From: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
Subject: [PATCH 1/1] riscv: fix typo 'repalce'
Date: Sat, 28 May 2022 02:09:34 +0200
Message-Id: <20220528000934.21182-1-heinrich.schuchardt@canonical.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220527_170957_798290_8286B43E 
X-CRM114-Status: UNSURE (   9.03  )
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

%s/repalce/replace/

Signed-off-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
---
 arch/riscv/Kconfig.erratas | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.erratas b/arch/riscv/Kconfig.erratas
index ebfcd5cc6eaf..6957b4e6c5e8 100644
--- a/arch/riscv/Kconfig.erratas
+++ b/arch/riscv/Kconfig.erratas
@@ -27,7 +27,7 @@ config ERRATA_SIFIVE_CIP_1200
 	depends on ERRATA_SIFIVE && 64BIT
 	default y
 	help
-	  This will apply the SiFive CIP-1200 errata to repalce all
+	  This will apply the SiFive CIP-1200 errata to replace all
 	  "sfence.vma addr" with "sfence.vma" to ensure that the addr
 	  has been flushed from TLB.
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
