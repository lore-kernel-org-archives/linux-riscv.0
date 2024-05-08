Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BB7C04FFE
	for <linux-riscv@archiver.kernel.org>; Wed,  8 May 2024 10:21:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pH00R4WQYI96pKzL6AADrwhqti1mJ2m4vTmBLnVBJuU=; b=PeX0Qdx/o7bgWn
	/JFkcvvYIzApPaDCOebgma+M06YjNfTpQMB2pAnCZJkdMW4DU2zS0kR7PXQKKy6QqO2PDAcHWyPRP
	QW9LtN2Uupaxw+0fBLVEeuUd1sA9MkUH1s9T8uJUZSnfhGnbvHBg2K1K2SwXd02QeEP2TJR9MVSNC
	LjNh1NOI8OSMvcyHnwPuyIy4Tzl3YhdagGPzlAvmC5/54pBneCnLtHzKJA7fwEnlOHwJ/AeppI+aK
	KOwBEk1b79+lteNCgP9lPy3JsZriBIlrDgxLKajSUfr5pp5ZE+UQj8uKZCnqAvVTnpdgucy+Sy6zj
	JyfxqdY2GVFfJw+WeXfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4eQL-0000000ExP8-3hhc;
	Wed, 08 May 2024 10:21:21 +0000
Received: from albert.telenet-ops.be ([2a02:1800:110:4::f00:1a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4eQI-0000000ExN4-2oon
	for linux-riscv@lists.infradead.org;
	Wed, 08 May 2024 10:21:20 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:985a:f2a2:ae2e:5981])
	by albert.telenet-ops.be with bizsmtp
	id LaMA2C00J241EGo06aMA0o; Wed, 08 May 2024 12:21:11 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s4ePO-00EExs-2Z;
	Wed, 08 May 2024 12:21:10 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1s4eQA-00HAxx-8W;
	Wed, 08 May 2024 12:21:10 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Conor Dooley <conor@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/2] riscv: dts: canaan: Unused devices cleanup
Date: Wed,  8 May 2024 12:20:56 +0200
Message-Id: <cover.1715163174.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240508_032118_902698_6CD0F47E 
X-CRM114-Status: GOOD (  13.93  )
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

	Hi all,

This patch series clean ups aliases and device enablement for unused
devices on Kendryte K210-based systems.

Thanks for your comments!

Geert Uytterhoeven (2):
  riscv: dts: canaan: Clean up serial aliases
  riscv: dts: canaan: Disable I/O devices unless used

 arch/riscv/boot/dts/canaan/canaan_kd233.dts   |  7 +++++-
 arch/riscv/boot/dts/canaan/k210.dtsi          | 23 +++++++++++++------
 arch/riscv/boot/dts/canaan/k210_generic.dts   |  5 +++-
 .../riscv/boot/dts/canaan/sipeed_maix_bit.dts |  9 +++++++-
 .../boot/dts/canaan/sipeed_maix_dock.dts      |  7 +++++-
 arch/riscv/boot/dts/canaan/sipeed_maix_go.dts |  9 +++++++-
 .../boot/dts/canaan/sipeed_maixduino.dts      | 10 ++++++--
 7 files changed, 56 insertions(+), 14 deletions(-)

-- 
2.34.1

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
