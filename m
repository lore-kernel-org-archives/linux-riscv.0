Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92FA4C61DF0
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2026 04:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+BoAQofATrwLNo0tYHlPfs8iOuej5sdHqcxTuuDpMmI=; b=G20Dvwei0lSrpw
	be7cR+oAZ7fzoIw9cuR0SlpbxgByEytqPFNVnrNh1coCc16Hcpf78lQdnkCfgRz6XcsgowT9YwG/T
	S+Ki8Z3V8vy6EUkNZqgcNf9od8nDpx2kn3IcXG4XWTEwXA20nqQxalfEjSVVjUpcgsodFPNyHD/F6
	UiwyG9IvFr32uDwfGKlgfUwBPOLo+kzJC8U39BVoulvv8cOHMDI2zzbILDnoVV9njBHLQBHNh5KjL
	SCVRVKP0Q5I4ZTarqi9WeZ871U+nbtim5peFIzz6QqbiKTI8ZvsNj+knPKZc0IrRo8HwGEeGDDWkT
	dVPvEwoI2ExC18IWHRDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tuA-00000008UhW-0mNY;
	Mon, 31 Aug 2026 04:45:58 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0tu7-00000008Ufk-1gDY
	for linux-riscv@lists.infradead.org;
	Mon, 31 Aug 2026 04:45:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=ZXkyoIVnaSDzBLzZUNxox0KZYmsWGJCl9Qvu71vdy4w=; b=nJqJGPeWSyeaMs+3tuHykj3qDr
	vLLd7iD597xbqRdaRH+lvZwO7hvr9fV2zQJL1VuHa6qtrn09su49dfqFRiCRL8cqqitvv+Bh+zIY4
	duToABx/Ycm8ukb52R+/mV9FKF6/Trg/o4aWE//pY1doMr46PpofHwfaBrC8ulOgqhVnqWLBz0Ext
	y5QMzhsX8MWeKgJcF3ew0SLvK0YRN5raY/HKScxJoYy13BHmQuaKKM+bmI7knz8p98KaG0kziO9qS
	Ki7OMldqSg8iUUCb5nHOf3bpEV8X5WXNiJBFQOmhvVMCCKkOXfaWu+RnRcgXI/dVsssGReJ+rUSTj
	2aqmSVwg==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1x0tu2-0000000Apdz-0TjU;
	Mon, 31 Aug 2026 06:45:50 +0200
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
Date: Mon, 31 Aug 2026 06:44:20 +0200
Message-ID: <20260831044540.3304350-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260830_214555_481714_5E4B7E78 
X-CRM114-Status: UNSURE (   8.28  )
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

Note that WLAN support also require the following patch series, but both
can be applied independently:
- https://lore.kernel.org/spacemit/20260709040027.958400-1-inochiama@gmail.com/

Changes v3 -> v4
- fully move the phy definition and the board level
- rebase on 7.3-rc1

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
