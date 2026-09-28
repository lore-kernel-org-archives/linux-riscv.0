Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3F0FCA5FA6
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 20:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bCkgy1CNd1GwCq6rQpmO7sOvI9x+r7cgx/ZObB+7DKY=; b=YXE+Gt8vEQnUpG
	Uialt5km84MKGvB2XCokJmsGJ69UyyNR5IENhHKRFPhUC7NEjmig/sNpFcRmZPIxck/a1Ar/lz1dY
	Uw8w1vzESMwc1fTRLBhFVIen8/8qqR4ebtic3tObOZY2Nt7gdYlSbHgwCI147VoX+7xIYZ9q2VvjN
	C9XA6sCg83QNuUg0izmESSbvd7+CBIFegXZBDKGbjs2n4xX5gYexzpixEzApHuW6GUlA0QcAfE3oh
	7NBHeFBpHJhouFxtj0Rv9s2blmzwqKnPjugLbtIld9/ZbsONx+qCtOk3UDCD1QYTNDdGsNI2JE5EL
	QJ1yBHQXXK03JZIY2K5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIJQ-00000001c6Q-20ho;
	Mon, 28 Sep 2026 20:51:00 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBIJL-00000001c3n-2UIy
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 20:50:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=KihxK1P3oy+g5YHPx1kzAUcYW62SHsTbFZU9CTfYxe8=; b=YdzikDFXBbNRK3Br3DaLrq0aLv
	cYf5zrb8YvUPQbIGalWvvk2A9Z1+ZDoyCi33RH9hOHPTp2ctmQ/kdV4Jir3l5DU4sBlEzXgrbAYBv
	M4WbRX0CiTCRSF1GiUT9EUKl07Aeo1mi8yveCukrK6a19WTozePNIxs0uOwnkshYU+l4eJ349AoTS
	fF+Kdi/+1/mpumFP6FKLtxPNsPVAt9XI3PGP3rtM2giibuOsLyM/zKi3Ac/ZRpnM81a0gGEhFJ4yH
	+adRlj4OeFDuinTiCKDb/2r2C/yG0FS0ssbKpMVMnBpBK3L9nPqSOEs6bGgDwzxEwBaLPYowRDPyI
	UGY8ABfQ==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1xBIJF-0000000F7qP-3wNI;
	Mon, 28 Sep 2026 22:50:49 +0200
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
Subject: [PATCH v5 0/5] Enable Bluetooth and WiFi on K3 Pico ITX
Date: Mon, 28 Sep 2026 22:49:05 +0200
Message-ID: <20260928205012.3689405-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_135055_663379_0ED95241 
X-CRM114-Status: GOOD (  10.47  )
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

Note that WLAN support (patch 4) is only useful with the following
patchset, but they can be applied independently:
- https://lore.kernel.org/spacemit/20260923015016.64069-1-inochiama@gmail.com/T/#t

Changes v4 (unfortunately wrongly submitted as v3) -> v5
- rebase onto spacemit/dt-for-next
- explain in patch1 why the change does not impact the DT schema
  validation (reported by Sashiko)
     
Changes v3 -> v4
- fully move the phy definition and the board level
- rebase onto 7.3-rc1

Changes v2 -> v3 
 - reorder patches in a more logical order
 - rebase on current linus/master
 - add patch 1 to move phy definition to the board level for the "usb3d"
   controller
 - remove link to USB3 phys, they can't be added if the combo phy is not
   configured accordingly - also enable Bluetooth and WLAN drivers in
   defconfig

Changes v1 -> v2
 - Rebase on current spacemit/dt-for-next branch
 - Collect Tested-by tag
 - Add link to USB3 PHYs in DT now that K3 PHY support is merged


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

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 38 ++++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 63 +++++++++++++++++++-
 arch/riscv/configs/defconfig                 |  8 +++
 3 files changed, 106 insertions(+), 3 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
