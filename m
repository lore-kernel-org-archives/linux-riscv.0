Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F05C02192
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 14:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M2CMt8w2yFhJ3Mt/dk2LvAWnhTvi3AsF1HTEM5vQylM=; b=SPVc8nQJW7dlqM
	4SMZ0o2q+BqbfkkLITipYc+8HkSpUzmSB6u+NLhZE1gjG53GM+7dgPasJq4os2GZX/9cDdnrOp6Ij
	Yf41aabbV8BT2Rywn+i/gfywfbRbCsFJkDabSbBGT9vBZkJlcc1pYtrsPN1t7bT9uibYd2VFtLWtg
	rUZzU/bEEpv/0TcA0hI3O4RKhtvk7e77H1npICD2X8dMnCJFC+zQibeovLSYGtZWod4qtaRvDw6NV
	IptFRNo1Uap0vjb/QK1vXC8kRrsaAuTB/AeuK7BBRO6+xywi8Lnvs6SbG0I+rnEfKZvbzuAWrQRbw
	L9h117powm30Dhofa2sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg3s-00000003Ubw-1OmF;
	Wed, 05 Feb 2025 14:07:28 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfg3p-00000003Uam-132e
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 14:07:27 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:fa11:c14e:2df5:5273])
	by xavier.telenet-ops.be with cmsmtp
	id 9q7K2E00f3f221S01q7KkZ; Wed, 05 Feb 2025 15:07:20 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfg3X-0000000FvyS-315G;
	Wed, 05 Feb 2025 15:07:19 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tfg3j-00000006Vpg-3DNG;
	Wed, 05 Feb 2025 15:07:19 +0100
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
Subject: [PATCH v2] riscv: defconfig: Disable Renesas SoC support
Date: Wed,  5 Feb 2025 15:07:17 +0100
Message-ID: <e8a2fb273c8c68bd6d526b924b4212f397195b28.1738764211.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_060725_435407_90F80C2F 
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

Follow-up to commit e36ddf3226864e09 ("riscv: defconfig: Disable RZ/Five
peripheral support") in v6.12-rc1:

  - Disable ARCH_RENESAS, too, as currently RZ/Five is the sole Renesas
    RISC-V SoC,
  - Drop no longer needed explicit disable of USB_XHCI_RCAR, which
    depends on ARCH_RENESAS.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
---
v2:
  - Add Reviewed-by.
---
 arch/riscv/configs/defconfig | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 0f7dcbe3c45bb597..3c8e16d71e175e0e 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -26,7 +26,6 @@ CONFIG_EXPERT=y
 # CONFIG_SYSFS_SYSCALL is not set
 CONFIG_PROFILING=y
 CONFIG_ARCH_MICROCHIP=y
-CONFIG_ARCH_RENESAS=y
 CONFIG_ARCH_SIFIVE=y
 CONFIG_ARCH_SOPHGO=y
 CONFIG_ARCH_SPACEMIT=y
@@ -202,7 +201,6 @@ CONFIG_USB=y
 CONFIG_USB_OTG=y
 CONFIG_USB_XHCI_HCD=y
 CONFIG_USB_XHCI_PLATFORM=y
-# CONFIG_USB_XHCI_RCAR is not set
 CONFIG_USB_EHCI_HCD=y
 CONFIG_USB_EHCI_HCD_PLATFORM=y
 CONFIG_USB_OHCI_HCD=y
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
