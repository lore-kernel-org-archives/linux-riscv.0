Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B481C5DF89
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 16:21:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=VEPn3zVqZQs6waRGeQ6fOLf7ntw0MSJum04jFHcVZtQ=; b=lUzIG7VasCQ/va
	XG9yNrMmPbSS7SFlUaKG7hR5e+rQFansgS16szk7P1p6coZ8iXfIuQGYKNDEFwZGbbZXMjm4VWrQb
	Ctpm9D6BYxI+EmLL3abbhS+VtL6q49nmuuIeHzlYRDNr47K/LqEX4KBY/o80akNtdsu4oaeIvjbPH
	5g6Wm27B8YsluWw6cn7zJbf8lF6e0Qzujv5ikoNu0ifiO5+zTECngLHXSi5kZOG/zz5JpuuCMSWXP
	pQ4LPyhjduzxsIc9AFWEJVCLYwU+JYUANF1JLmrVy/oqRTHEamHEKNfoR4yzEFytsBmgjfSa9baZ8
	FJQY8bC+iQ2Y/MxK7IlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj2s-0000000AAKY-3og7;
	Wed, 19 Aug 2026 16:21:42 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwj2m-0000000AAGR-48P5
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 16:21:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=1pyl46IuAP+khElKBqRymsMVGcIi1WVfxbaAW6P5Qns=; b=IQ1d42rg+uF1DNqDMl9+bJ+zfZ
	IMXbdPkRxgARCE4ea8BgBEHbNwVxqQJx2bZPykhMUoerWpvlNH/TssVIxhDMNhVya/ZUlOuyOYOPk
	UWkznUVcCE1/GkkLEx5GazGg49/F1zRj+EqBiHFM6crq6I/4S8eQxpwByg+Qi7DOOd9rlhdC56kYD
	5JLVkWFBsA41G/hS9D8bok9ZJYQrkqvnPfOE6JLnIRIklvyCX9jO71m5jcw7od62Jr5G3M0VJ13SX
	RFy2EVdTgJ4ovfSQz1/Eoo9iMSkILKY+VVE+txWTTxZKnw2oGDj7rI1MwEcNT/E7x3Z2beccHrlYG
	W2U15wKg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wwj2b-0000000D4kf-2fOL;
	Wed, 19 Aug 2026 18:21:25 +0200
From: Aurelien Jarno <aurelien@aurel32.net>
To: linux-kernel@vger.kernel.org,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Aurelien Jarno <aurelien@aurel32.net>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE:Keyword:riscv),
	spacemit@lists.linux.dev (open list:RISC-V SPACEMIT SoC Support:Keyword:spacemit)
Subject: [PATCH v3 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
Date: Wed, 19 Aug 2026 18:15:41 +0200
Message-ID: <20260819162115.2252812-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_092137_069507_5E97E602 
X-CRM114-Status: UNSURE (   9.60  )
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

This patchset enables Bluetooth through USB on the K3 Pico ITX board and
adds the rfkill nodes for Bluetooth and WLAN so that the devices can be
activated.

Note that WLAN support also require the following patch series, but
both series can be applied independently: 
- https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/

Changes v2 -> v3 
 - reorder patches in a more logical order
 - rebase on current linus/master
 - add patch 1 to move phy definition to the board level for the "usb3d" controller
 - remove link to USB3 phys, they can't be added if the combo phy is not configured accordingly
 - enable Bluetooth and WLAN drivers in defconfig

Aurelien Jarno (5):
  riscv: dts: spacemit: k3: move USB3 phy to board level
  riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for WLAN on the K3 Pico-ITX
    board
  riscv64: defconfig: Enable BT and WLAN support for SpacemiT K3
    Pico-ITX board

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 35 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 69 +++++++++++++++++++-
 arch/riscv/configs/defconfig                 |  8 +++
 3 files changed, 109 insertions(+), 3 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
