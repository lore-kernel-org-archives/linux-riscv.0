Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D42B7CAC5A8
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Sep 2025 21:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VZ6k5Uw3JW4IWzUE60P+L7iselJDmQ/8KVBAvqgGRs4=; b=hx1rxDilFgQ8Ey
	ZiRt0bGwHwZ5jbjgraPvcxpoEz9idNLWMl12hnkHufExK6i9pSkU8fZ8Ob54SK1lkknZlxkjhwkbK
	kTzMzdPBmOc8BGxe90Ojj8PNhHMwJT0KCof+2SuaISaRxpxGbEcVxpeEiIUuyimm6fGq7Fkc0zCPP
	5lhhbx1/bq/XlKSZxOg3V75I/V0Ri89wMre7PJqgwln/QX0fAv6FkqF9Jcjkc3Ns2f3bauQ8bJnCg
	3L9Y9ZhvgsTyg2Us7W96ejeSDAG9H8N3G078+j+exN0rfsw6e/XEU8G4bcdB8ypr9IUB65KC+Ki7r
	h0PVW81Y1ywmr9e1NqiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RDG-00000008ClR-09kb;
	Sun, 21 Sep 2025 21:03:14 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0RDA-00000008Cj5-04dk
	for linux-riscv@lists.infradead.org;
	Sun, 21 Sep 2025 21:03:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=cutiYl0wANGDLRaXIM0wgr5qojCK4TIzTyPKOVMBJ20=; b=VMJrVDCUvBS7dnOXzDFDjf+EVg
	cwXqXoaWOgrh/iBe7rJD9MyyqNS26Aypw1zVdQMyAaeMKwxGEdRsUtgriV4X56b4fxsNkLaM3Vwnh
	wv7SgID8k3mvY8Umo++fyHWNbsm0ucad0I3OLnJSGNN197RktI5kOVEajbfy7IVLMzyNgex+iKsr1
	wQ+LGr2Jip+TwgSuLlmDCe+DM68q1Jn6NoUl0mlGFzr6Ewhs6PX4Xz9EbVgu5jKO8Ti41jeg8rD9w
	yqzXNFdSZpWF60ka7sEBzMwqB83+aADyuUtT88tHyAFkOduUSCUmQpaC5MaoTOl+qco3FoHLOkEIV
	sgHXmQqQ==;
Received: from [2a01:e34:ec5d:a741:1ee1:92ff:feb4:5ec0] (helo=ohm.rr44.fr)
	by hall.aurel32.net with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <aurelien@aurel32.net>)
	id 1v0RCm-009LbD-2a;
	Sun, 21 Sep 2025 23:02:44 +0200
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
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support)
Subject: [PATCH 0/3] riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
Date: Sun, 21 Sep 2025 23:01:40 +0200
Message-ID: <20250921210237.943370-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250921_140308_427482_2BBC8C87 
X-CRM114-Status: UNSURE (   6.13  )
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

Aurelien Jarno (3):
  riscv: dts: spacemit: enable the i2c2 adapter on BPI-F3
  riscv: dts: spacemit: add 24c02 eeprom on BPI-F3
  riscv: dts: spacemit: add i2c aliases on BPI-F3

 .../boot/dts/spacemit/k1-bananapi-f3.dts      | 19 ++++++++++++++++++-
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 13 +++++++++++++
 3 files changed, 38 insertions(+), 1 deletion(-)

-- 
2.47.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
