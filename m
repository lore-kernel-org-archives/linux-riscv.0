Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7692AC282EC
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 00:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KKk2ZgVePhQO1TpImiucbZLEGmeVVldSQARIBlJeWvA=; b=ExrvP3ye21O+nd
	GcqUprazNqvVjvfQFpk3kgQLBoZbViULmzb3Jzf+2X9upHBpAhTep7vq8ybTN/ZRTBGZxANqucSkG
	unAplxetEkpXpuhboO9/+LJd/1QN2aJhRxoxP9mOwehQ9a2A7ySr2MeFpGyWeP0lrL//bIjVeP5Fx
	n5QuNzkGiH28JYSzbFnEdkU24DjPGVGGlQTaRRFjuHAE0pohxA47UaH6KMxYAkrbBm8dmWbiK5gux
	B3XJkAhq0KhyFHYWv/RjJ2+dYjsKTIlGsF5nSyKoFEwIf/6TBd60REBs3JCoewvXNtSUNyiStggLy
	lQs0fiAxbVTtZaGrL8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9zb-00000007FjM-2THr;
	Wed, 12 Mar 2025 00:30:39 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ts9zY-00000007Fic-3BOe
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 00:30:38 +0000
Received: from localhost (unknown [116.232.18.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id BAC8534313D;
	Wed, 12 Mar 2025 00:30:33 +0000 (UTC)
Date: Wed, 12 Mar 2025 00:30:23 +0000
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Conor Dooley <conor@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-riscv <linux-riscv@lists.infradead.org>,
	spacemit@lists.linux.dev
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.15
Message-ID: <20250312003023-GYA76989@gentoo>
MIME-Version: 1.0
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_173036_826169_4DC4A6F7 
X-CRM114-Status: UNSURE (   7.59  )
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

Hi Arnd:

Here is SpacemiT's device tree changes for v6.15, thanks


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.15-1

for you to fetch changes up to 5b90a3d6092d9292d3c4fe4eef8969282e070ae3:

  riscv: dts: spacemit: Add Milk-V Jupiter board device tree (2025-02-17 21:11:50 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.15

- Add Milk-V Jupiter board
- MAINTAINERS info

----------------------------------------------------------------
Javier Martinez Canillas (2):
      dt-bindings: riscv: spacemit: Add Milk-V Jupiter board compatible
      riscv: dts: spacemit: Add Milk-V Jupiter board device tree

Yixun Lan (1):
      MAINTAINERS: spacemit: update various info

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 MAINTAINERS                                        |  3 +++
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  | 27 ++++++++++++++++++++++
 4 files changed, 32 insertions(+)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts

-- 
Yixun Lan (dlan)
Gentoo Linux Developer
GPG Key ID AABEFD55

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
