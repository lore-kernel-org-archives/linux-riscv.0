Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AE2BCAC5A5
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Sep 2025 20:51:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=eetJlBw8OlGYoOFjaralMg+kUuHoowK/eZKpOPu4Eqk=; b=QoMHV1trIRYrE3
	IS6yVhQqdb7YOYrrteVdvffbLvWckTox1ZlJHewx2te5F1QtB1hT8asUPfDhXXgl7kGN/KoYCnwNv
	x2EOzspg44NyY/rPrak5x3ggBC7UDHI3UXI6VkNVPIX/vWYLcZhDmHqLG87bYK7lI8D8BGGtMGIMY
	/UPfSe6qeTEhZXFMQ7kZA7QRnTmwQ46djDl/trsWQTrF2ZpNTz6q8WZIKHR63y2LY6/nqgcFZMp1k
	lISeQv2ZMNE0XwVSxJhiaPZ5DtH2nDIUbxXtlSjTehVz3UWJyjwVAxzkp0hDM4b1sqN4Vvs0uMEs3
	wigWK0yCIWBhukst3r1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19yZ-0000000Eo94-24Ay;
	Tue, 23 Sep 2025 20:51:03 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v19yU-0000000Eo7R-32GF
	for linux-riscv@lists.infradead.org;
	Tue, 23 Sep 2025 20:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=S782zCaiS6n+iFj//HOlJ9oomrbwBysU57bfvWdg/Ng=; b=LxDvNElPgk5gLFeu6Kcq74YXve
	7aeh0EZNYcnYz7ScFUCjqwjqHhzLdJjVBUUP4puXPvT69tg6GN11GGyGy0+JhPqAYEchlNdeK1Zre
	iPCVWpQagZAh1neyLI4flPI1NTHOdMyuHIHbYHr/i5Nc2HSp54pMpmnql9DMv673xIkE8uDqDrAHB
	y4jNuo/TTeCI5oSw2tllsod/24V7PCiRRxx8ZLdF9+aeVRhxghvrlf/7fjz5zUOjA4+OWNq2sK2xo
	Uc8Jmf0lepEToiP7o3Wl8MqFaFmjXM4Qdda5MxGIZle6e/3Z29Bvi4A6P/aHZzedO61hIYN7354bM
	uQF1bzyQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v19yH-00CFUe-1x;
	Tue, 23 Sep 2025 22:50:45 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>,
	Vivian Wang <wangruikang@iscas.ac.cn>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: [PATCH v2 0/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Date: Tue, 23 Sep 2025 21:45:40 +0200
Message-ID: <20250923205028.2355244-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_135100_021398_8157AA0C 
X-CRM114-Status: UNSURE (   8.33  )
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

The BPI-F3 board has a 24c02 eeprom connected to the i2c bus #2. It
holds board data. This patchset adds support for it.

Version 2 incorporates changes suggested during review of v1.

Changes between version 1 and version 2:
 - Rename i2c2-0-cfg and i2c2-0-pins into i2c2-4-cfg and i2c2-4-pins to match
   the naming convention encoding the function number in the second cell.
 - Rename the 24c02 supply name label to buck3_1v8
 - Add a onie,tlv-layout nvmem layout describing the content of the 24c02 eeprom

---

Aurelien Jarno (3):
  riscv: dts: spacemit: enable the i2c2 adapter on BPI-F3
  riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
  riscv: dts: spacemit: add i2c aliases on BPI-F3

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 33 ++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  7 ++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 13 ++++++++
 3 files changed, 52 insertions(+), 1 deletion(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
