Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87C59D63923
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2024 10:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=nrq4cTwjxuj8I+4VaaaD8vAoYybgMwnNXkZl3RUUZC4=; b=AmbGlMV7veMbpl
	laXaAacP/d/xXcTIKoskAoFfobmmVcSMlAb+71neX8ith1Amj1IVf4CzywGgiilwEJJm7IKSLbs0A
	FTkyRmjQ20+Op4FHe0hO0YDMXutWXKII8SC0j9QTBXJDwcRO/N7DT6+AIsywjkOKm3YL22uj5n221
	GP/mYUZyPERhVbd6K/Kzy980QW1zP3RdGpho6nkdKH+kQxZ1Hi/N5UQkIJf8JA9iVY7Aqva8Icc+Z
	kJsuT9YzjmJepHMEvGjSqxjL6yXRjMunY+wZU+pLe+pAvrFJ/sTqadvD1GSfxbk0vKkKIydk5zeeZ
	yDUwGKjvnMwJye2dM6LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhwD-0000000F3Tt-437z;
	Wed, 20 Nov 2024 10:27:57 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDhwB-0000000F3Rw-2P64
	for linux-riscv@lists.infradead.org;
	Wed, 20 Nov 2024 10:27:56 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:35da:ab43:467b:7991])
	by xavier.telenet-ops.be with cmsmtp
	id eyTr2D0153gUftr01yTrbZ; Wed, 20 Nov 2024 11:27:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhvk-007bjq-FD;
	Wed, 20 Nov 2024 11:27:51 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tDhw7-005PUd-NR;
	Wed, 20 Nov 2024 11:27:51 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: linux-riscv@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: defconfig: Disable Renesas SoC support
Date: Wed, 20 Nov 2024 11:27:50 +0100
Message-Id: <d33c9e3245c0bd3073d9618fcd014ba37e90e6bd.1732098271.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_022755_747757_09C29A7B 
X-CRM114-Status: UNSURE (   7.82  )
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

Follow-up to commit e36ddf3226864e09 ("riscv: defconfig: Disable RZ/Five
peripheral support") in v6.12-rc1:

  - Disable ARCH_RENESAS, too, as currently RZ/Five is the sole Renesas
    RISC-V SoC,
  - Drop no longer needed explicit disable of USB_XHCI_RCAR, which
    depends on ARCH_RENESAS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
Apparently I forgot to submit this, probably due to Palmer's version
https://lore.kernel.org/all/20240917131936.18980-1-palmer@rivosinc.com

 arch/riscv/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index b4a37345703eb357..db0ce2c2c766ac15 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -27,7 +27,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP=y
-CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_SOC_STARFIVE=y
@@ -201,7 +200,6 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
-# CONFIG_USB_XHCI_RCAR is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
