Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A24D58CA1
	for <linux-riscv@archiver.kernel.org>; Sun, 22 Mar 2026 20:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=imAodrE3JpRU/TMMzL2ApqEX23E6uMueZNDPZCI+nIo=; b=1ZQYwtWuSBH1I7
	KKJTNy8ytqglsZ3zpOsh7G7TCxQUahMLAsZ3LCOpvOjy3CeiUFrcQeQQQTgUW9RIr7kmKffxj6+la
	0wfdn0/HhT1hXpPre64hNLJRq6KFKjatMH6EShgm8vMgmiKyP/iS+gv9iNkXX/mkhCsvs5KvGNTWt
	cLs5hQQJiAR6vtgw9KmGXd3Fsv/caEhuUkJ+6l0LK5EIFUw95xBTVneGZAsQBChV1MrgkV7jyqvY3
	085u6BA7Czcnvl4QTDwyOJeMk3a7WifEIJ+vR1CEOqaQZklwAxxX+Xz5OuQDBTITIBEyl9cDl0DY9
	4KxqSQKpxGbgEMRLlPeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PUz-0000000FdwG-3cgQ;
	Sun, 22 Mar 2026 20:34:13 +0000
Received: from hall.aurel32.net ([2001:bc8:30d7:100::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4PUx-0000000FdvA-0znz
	for linux-riscv@lists.infradead.org;
	Sun, 22 Mar 2026 20:34:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=aurel32.net
	; s=202004.hall; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Content-Type:From:Reply-To:Subject:Content-ID:
	Content-Description:In-Reply-To:References:X-Debbugs-Cc;
	bh=lp7abrTQ6VxxE1XhWtGPfA4HAn/URXX9XttQo6UUTBw=; b=v92QgJZVosE46A58gLkH9bQAe9
	fq9EE5JYqp5yVH9H+U4235M7BQsc8QIhfZ/RwaZh5fixFUFjFnT9/f7ASVoM8F/xX1CCArjIEGO12
	+fkCCrLT7EwdBmhq/bCvT28lNz56DwVevlCg8nmWJKKvqKqmd/J22skVqN360wviISIsRoW/xDalU
	6DALOM1ve7drmRua3wyCGjUJKLBMJMvoHpEm6R7DcMD7wfD00WuhRnk9jLgeIquCj0gR06IeFFk0H
	spKHC/3sX3sGfVM19F8VT/YKUaLaMm0UCxm7TdNbNBLwiR/Vh3U7/2PV4yuKavMPQgj2uACTl2LIg
	QkW1TX6w==;
Received: from authenticated user
	by hall.aurel32.net with esmtpsa  (TLS1.3)  tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <aurelien@aurel32.net>)
	id 1w4PUu-0000000Asdt-3tUW;
	Sun, 22 Mar 2026 21:34:08 +0100
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
Subject: [PATCH 0/6] riscv: dts: spacemit: enable more devices
Date: Sun, 22 Mar 2026 21:28:31 +0100
Message-ID: <20260322203356.2206927-1-aurelien@aurel32.net>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_133411_281646_AE2BC37B 
X-CRM114-Status: UNSURE (   6.48  )
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

Aurelien Jarno (6):
  riscv: dts: spacemit: add LEDs for Milk-V Jupiter board
  riscv: dts: spacemit: add 24c04 eeprom on Milk-V Jupiter
  riscv: dts: spacemit: add i2c aliases on Milk-V Jupiter
  riscv: dts: spacemit: enable QSPI and add SPI NOR on Milk-V Jupiter
  riscv: dts: spacemit: enable USB 3 ports on Milk-V Jupiter
  riscv: dts: spacemit: enable PCIe ports on Milk-V Jupiter

 .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 189 +++++++++++++++++-
 1 file changed, 188 insertions(+), 1 deletion(-)

-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
