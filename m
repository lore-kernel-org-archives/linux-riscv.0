Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA143CAC5B9
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Sep 2025 17:59:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=h7zBf/zpZFpBsifpaq5By9+lbDiqO3Scg6XRvMWAiHk=; b=YyeKb7hHYpMUxv
	bq71cjMp8OjBUO506B7kkBc5rhmDwUhZeTMpPphLVY5UWZbSPBdevHWndR6Zt+ggJxQRUqbQZoKqD
	j3AkbGY07CS7Gz5wpjJmy9FzfRBYPpAN1ogq4S3iQ/J+blNt1D0OyqOcDJlLH4du8LHgKELHMmtcM
	UgJ/W5PNls+DX7CDZXzW7hfx17NVahMk135XGPUnxPAoyYevdeCrKebKSeM2Cyih6SVphTeLcXKcd
	X2rcXZxTOxfCpIDEZaQeohoR98+o/OFDVewgbRWxMABiqnGJF6Cec5SF8kjGNz0/V4sF3ZdtsbYXf
	Getx0/g6Lm6VzfxoPncQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2Cid-00000003Ook-0DYI;
	Fri, 26 Sep 2025 17:58:55 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2CiX-00000003Olc-3GIv
	for linux-riscv@lists.infradead.org;
	Fri, 26 Sep 2025 17:58:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=ddGZ1/Ar7m3TEGD6GxrlzybOX3lu01Igr3wsVjMtEgI=; b=i8h6KWdpRrYlAfR07pFrcfZ3w5
	W8v3nfjz/DzK3TeGM85vUcjgYHyFQbxE/oGFOl3PpMdB2mRjobdNxV6U4kA3ENxaGl5doBk/YRAng
	aQNq0C+ts7bYTaaMSoC7Ve8wkzo3BMqFyL8RW8D76GY17VSdK1W5qlRlrFwh6eLJArjnEi1uz0vn/
	VY+Y/9RvKtzaWdrpvR+24YMGhveO9mStavfW5xytzy5l3z/0KaiJR9Y28qQTc2V8mdbrvXrMdvqAu
	QtUSIvuNevvSQVsxtcNdG9ij0Un73pojSxx6zsU309SMA1qkjr07xWl/CdAkgJmk9SWM5aONVJa9b
	Jx8oe2hw==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v2CiP-00GPWH-1C;
	Fri, 26 Sep 2025 19:58:41 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@gentoo.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: [PATCH v3 0/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Date: Fri, 26 Sep 2025 19:54:36 +0200
Message-ID: <20250926175833.3048516-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_105850_248689_52BC3937 
X-CRM114-Status: UNSURE (   9.79  )
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

Changes between version 2 and version 3:
  
- Revert the name change for i2c2-0-cfg and i2c2-0-pins, the second cell
  is not a function number, but an index.

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20250923205028.2355244-1-aurelien@aurel32.net/  

Changes between version 1 and version 2:
 - Rename i2c2-0-cfg and i2c2-0-pins into i2c2-4-cfg and i2c2-4-pins to match
   the naming convention encoding the function number in the second cell.
 - Rename the 24c02 supply name label to buck3_1v8
 - Add a onie,tlv-layout nvmem layout describing the content of the 24c02 eeprom

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250921210237.943370-1-aurelien@aurel32.net/


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
