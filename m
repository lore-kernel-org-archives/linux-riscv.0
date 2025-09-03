Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4152CA0FF2
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Sep 2025 11:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kO746oDsWyBo/YZxfNJPEm8KtamHRaVMxIIuD8hR8yk=; b=gCYoJWMe/dZGJt
	jYhUw9mF6yEwFMcKmsVZBaQnKHIFNELb1lIFoHYBXh8jU9wymhuGJ8MexvTQBbnhmAC9HVYZOJA74
	vLtRya1aWYvxjyck8Kz2nPFmmNeDgd/SYQqV5WYzgQFkdTQZqtQsFvn7kSYF+v7l0g9fVuGw42YRv
	am1z48etIOF8L26knthJurap3QkqgqID/OGl1DpmB2K9/bWYR7xwVZUFRbDcqLoajDvCZUAJSP1aE
	7cycEdw0kLLQcY1AOIO+eBr+u40Bh1PhWJ50U24mNWxmPYwqXGfTEPTSaqmd0xqEI85HjXm6zOewQ
	oRYC/8Z9nC7o33DBdwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utlSC-00000006CFv-0Okx;
	Wed, 03 Sep 2025 11:15:04 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utkW8-000000064RP-3dbk
	for linux-riscv@lists.infradead.org;
	Wed, 03 Sep 2025 10:15:06 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 3F4E1B22007F;
	Wed,  3 Sep 2025 12:14:58 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v1 0/2] riscv: dts: starfive: jh7110-common: drop no-mmc and power-on-delay-ms from mmc interfaces
Date: Wed,  3 Sep 2025 03:13:34 -0700
Message-ID: <20250903101346.861076-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_031505_050149_BBDF740A 
X-CRM114-Status: UNSURE (   5.09  )
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

Drop no-mmc and power-on-delay-ms properties.

The committer cannot be reached for comment and per discussion [1] and
testing there is not any observable problem that is being solved by
having these properties for the VisionFive 2 or similar variant boards
through the jh7110-common.dtsi include.

E Shattow (2):
  riscv: dts: starfive: jh7110-common: drop no-mmc property from mmc1
  riscv: dts: starfive: jh7110-common: drop mmc post-power-on-delay-ms

 arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 3 ---
 1 file changed, 3 deletions(-)


base-commit: f66eb149b87677da3171a0ed51c77c3599ad55d6
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
