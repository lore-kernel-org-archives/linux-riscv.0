Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4449FC53200
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UyYqpgPlELTgWWvoiWa+59Jwg0AN52Q4KcQBVCvhyOA=; b=Vbh8ZmM7KeJFkf
	CwWo6ScwsupDUBAkdkmVOeynlAzJUYikQwjrv03hNAdeRaYhz/MK5my/kVcBYgI15SG1vTyPMBzAP
	FKNTKlCc+gUfPoVQXB7V/Ne1VDIDj4eSPIrr6TA1K3r9WHO5TgMRVY3R1bTOJZosenFub3qgsZ9rT
	qPRUEfpJ9lNYoZtrNSPCciDk1UWBQugyEmnwMAIQSlExXMUxLkFFDl5ierN2fjT1f0lrw8JXCJLte
	iFRWl/S2BRYWQtbzeDy+7psQCVnLeeY7c+owfEXhZnvWMog4sfEobhDsapTAPsZ7kkqK7u0Xebt/D
	lz/BOf4zIt4aFDa6fkGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp81c-00000008gxJ-21Hi;
	Wed, 29 Jul 2026 17:25:00 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp81Z-00000008gvV-2CgB
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 17:24:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=aLCUqsHes7MSmPIPuyE6Y7oiHgf3ZzmbZtoVZyCV8oQ=; b=WmI6vuZqobvqOM8DE7nxezDcSc
	2h5Sx76p4rl0AfLURaYeO/PxIoCoZCdTBXA1PpYzwyVtRy+eR5OKsAFwNzytynYUlSiR43Bk7tFMO
	gd7WvHwHgDLVgPRvA3tw3VvgS7LAzEyUCR66/316DfxJxNx2WM5MXrihPfCbl9MtNn7zMKGv5vp6U
	OJNs8k6v1KA3vsH7A2Qg1IbseguwsjRGJt63fb4pnf8KTwCc3doyLla1ycZyc97Pw8g3gn0QLlXgr
	42qJXysnanVbEqFv2KgsX14CYVOoQ2hSJO3U2KxWMP3jmGtsJPwb3iken6tDYA9M/z5ZMB4s/4E+I
	ueCZk8Bg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1wp81W-00000002mWi-1kXs;
	Wed, 29 Jul 2026 19:24:54 +0200
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
Subject: [PATCH v2 0/4] Enable Bluetooth and WiFi rfkill on K3 Pico ITX
Date: Wed, 29 Jul 2026 19:20:22 +0200
Message-ID: <20260729172450.1660418-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_102457_571477_7BCC9C57 
X-CRM114-Status: UNSURE (   7.76  )
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

Note that the patch 4 is only useful with the following patch series
(but it doesn't hurt appying it before):
- https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/

Changes v1 -> v2:
 - Rebase on current spacemit/dt-for-next branch
 - Collect Tested-by tag
 - Add link to USB3 PHYs in DT now that K3 PHY support is merged

Aurelien Jarno (4):
  riscv: defconfig: enable RFKILL and RFKILL_GPIO
  riscv: dts: spacemit: k3: add rfkill node for Bluetooth on Pico-ITX
    board
  riscv: dts: spacemit: k3: add USB3 B and C controllers for Pico-ITX
    board
  riscv: dts: spacemit: k3: add rfkill node for WLAN

 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 32 ++++++++++
 arch/riscv/boot/dts/spacemit/k3.dtsi         | 66 ++++++++++++++++++++
 arch/riscv/configs/defconfig                 |  2 +
 3 files changed, 100 insertions(+)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
