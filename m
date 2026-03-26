Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FA310A3D96
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 18:38:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Pz41GYC8gbijW6ni+kMLUuTD43yFLch4Ouf4zcucMLs=; b=xChYsGPZw5ec8N
	egRV+ztbkETxvBDUAx3LGR44IOrgOFI3iTrKg6MIVZVElN5BwSHmQY/qU3FBKG+4XOUGCTrwAC2Bk
	77dUFiqNhPcUPo3B6W4DWIVOhcd7DH6M1CNGd1bVtQapz6ymgV8vmMMl9KYYZdff7mfN/llqzB5bW
	YgsMrC/1JlunxkN5YWZF93FO8APanTolM/zHZa2MIj8GasBuzxp5FBaWrORUMExlpPyNt9Ktq7fbB
	tWdmwT1aeEioXEQIRO/8kl1l8cpoCYtIR7I5yNwGBmV+qZ7jU+32EfKnEBg5o6JN+bkACB5qhYWRX
	SaxKTgJxPwcpaZ7FVkQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5paq-0000000637i-1odI;
	Thu, 26 Mar 2026 18:38:08 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5pao-0000000635Q-0p0G
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 18:38:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=pKYF2U3blSKdPTf4iCctXPVsD9JEXM2IleXwM15XUQE=; b=xpIkWgL1inn8tnUCcEBJQlSlRc
	1WIwWlcU0VvqrlGmv31oKz0EYEmCtP49fD4qV/qbDEd6XNqkHfJx/hBZss6EgkHK75s6NjDNKv/bE
	reA1bb2TMU0TMLQplE1/xB0sDnKDNgCLgOcQrPJs8Hx7ZjARpWiQTwUNBa/fyTihZzqlCVoxe5oc5
	catug6YBFqjDl8gGOTon1Yhd4R6bIG7Oc/lddSP3uOkYbC2uIDVZwD2oDSmuq3jt8vrrVg5+RvlH9
	qIHvVOiYkat2ULrOJ93A2oNiQ2T/5HZ4eDqq3YJ7ysNfFEqFAuSiZcWaM9UUG46t9Ev1DGDSvJHkh
	pcG+r0rw==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w5pad-0000000GAiw-2Nke;
	Thu, 26 Mar 2026 19:37:55 +0100
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
Subject: [PATCH v2 0/6] riscv: dts: spacemit: enable more devices on Milk-V Jupiter
Date: Thu, 26 Mar 2026 19:35:28 +0100
Message-ID: <20260326183745.1370642-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_113806_236730_8B48B6D4 
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

This patchset improves support of the Milk-V Jupiter board by enabling
more devices. Most notably the NOR flash (useful for upgrading the
bootloader), the USB 3 ports and the PCIe ports.

It was inspired by the Banana Pi F3 device tree file. It is based
against the k1/dt-for-next branch and does not have any other
dependency.


Changes between version 1 and version 2:
 - Collect Reviewed-by:
 - Remove bootph-pre-ram property from SPI NOR flash
 - Mention that the fast read opcodes is marked as supported in the SPI NOR flash datasheet
 - Fix typo in the description of patch 6

Version 1 of this series is available here:
  https://lore.kernel.org/lkml/20260322203356.2206927-1-aurelien@aurel32.net


Aurelien Jarno (6):
  riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
  riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
  riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
  riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
  riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
  riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 188 +++++++++++++++++-
 1 file changed, 187 insertions(+), 1 deletion(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
