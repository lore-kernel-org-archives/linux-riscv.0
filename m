Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE807C44512
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 21:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=H1B0UzsJEclL0HQPENYQ6qcLt8bd6cpD2z8Y4rF3izY=; b=VjzG2QDk+dFwHL
	A/AqNz2xMICbUDBR3C9p9njtNH0JlOl4hR2rUM1U0/Kh5tyfbTfBR8MUOEHO5al/DCQCvtLTV9499
	XhAstIjAOCRzVmDqaM1wO+At2agMYtykj3PBO0Rfu7PHvaVRDeyP+//OsWPUYW9z0pmcXi45LmnYl
	EU4NxHYcdjac/XhPnKfBNaDUtHmnZVmNLvH3vApdKEkdi48vrl1p0N9ophJmpNjl20GYx/s2kzZzx
	PZYFLX7IDPc8v8Fm46tPondIPsXgvqQ2k4Szaga5gYFeN486SaDeyp5rhSt0G616uryy59+Z73fTs
	ieNc//OUn0f4mAs9ld7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThx-00000000dBe-1G0R;
	Thu, 16 Jul 2026 21:33:29 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkThv-00000000d9u-06jS
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 21:33:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=0HiuZgwH8psQJ3IEbbD0GhfaiOqaajADnn4e7kt49ps=; b=uBwsOZEZW7IJxO8GwedATLuBoD
	w2Bhxbq19q5xeELX8wBqIel3PgLdQLjAwA2bjADbyzn+XeY/ybulnOG9oLgJLYLc1bd/tuAcOaDeT
	vFeJ8Sd4RRfIxX/J01lYxX/+CPEQlCEBtUSkWh+HdCm7Snb5710JB8d3z5OjeYXzocIjoegvnFkcZ
	v4kNdlrB9cqxIiBU6GeG1v1iXTjpV6z8nLLHHdFH2PQfnQ3UbPf8LO4boUWdIqL+VK3uysMtipMZ7
	avF9CqadBTgc5zVm8279V2Fr8CGYoH6y7nWm1M9stI+AKndkRG4RCyzzS57Jy0uqgGmdDKT/SzRSp
	hCxewZBQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wkThs-00000003GYa-1fVF;
	Thu, 16 Jul 2026 23:33:24 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH 0/4] Enable Bluetooth and WiFi rfkill on K3 Pico ITX
Date: Thu, 16 Jul 2026 23:19:00 +0200
Message-ID: <20260716213314.3027969-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_143327_068531_04BAFCAF 
X-CRM114-Status: UNSURE (   6.28  )
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

This patchset enables Bluetooth through USB on the K3 Pico ITX board and adds the
rfkill nodes for Bluetooth and WiFi so that the devices can be activated.

Note that the patch 4 is only useful with the following patch series:
- https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/
- https://lore.kernel.org/spacemit/20260703021024.495433-1-inochiama@gmail.com/
- https://lore.kernel.org/spacemit/20260709040415.977784-1-inochiama@gmail.com/
- https://lore.kernel.org/spacemit/20260715-rtw89-spacemit-k3-v1-0-e577bc63706b@oss.tenstorrent.com/

Aurelien Jarno (4):
  riscv: defconfig: enable RFKILL and RFKILL_GPIO
  riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX
    board
  riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for WLAN on Pico-ITX board

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 32 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 65 ++++++++++++++++++++
 arch/riscv/configs/defconfig                 |  2 +
 3 files changed, 99 insertions(+)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
