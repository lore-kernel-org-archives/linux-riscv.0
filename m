Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAA93E74AC1
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Dec 2024 16:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PETBwkVw2idWXaBUdcqH8eqWqwzNuMD9qErYySj/E2o=; b=lrwExXuNuN4AK9
	2VeiA3taThW1CLyN3BkJ5THwOf9T1fYondSNLyLFh3ZGcIiKO7N7L5b4sx93xquNlbdEYzEN8+xWr
	Nu0MwoPweabf8ocN4FM9Cu39rqjDuGQd+cXqQWEjZc0YROJYYQtKWnzO8axjTR9cyjW2SBcZ2DN9M
	UDUaiihHjBMwyTz8dyA25LoXI3zMyPxHeXtqGl9tK/3MUbquxw4ghuZfAQ02goXkaR27OtfHhfxfJ
	bFeSKnsl2Xxzk+ipizuG54vIXTlySNj9VngV36ixX3QozQ5BLRYEDPOidchiTtLbAao1J67ziAwot
	1T/sPaNeWTFOBZPKAOlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVZE-0000000A452-2Loy;
	Tue, 03 Dec 2024 16:16:04 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIVZB-0000000A44I-09Mo
	for linux-riscv@lists.infradead.org;
	Tue, 03 Dec 2024 16:16:02 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:829d:a1e7:5b32:5d8e])
	by andre.telenet-ops.be with cmsmtp
	id kGFw2D0013sLyzB01GFwsi; Tue, 03 Dec 2024 17:15:56 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVZ5-000DLE-T6;
	Tue, 03 Dec 2024 17:15:55 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tIVZ5-00AGsi-Q0;
	Tue, 03 Dec 2024 17:15:55 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Damien Le Moal <dlemoal@kernel.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>
Cc: linux-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] riscv: Remove duplicate CLINT_TIMER selections
Date: Tue,  3 Dec 2024 17:15:53 +0100
Message-Id: <448dba3309fe341f4095b227b75ae5fc6b05f51a.1733242214.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_081601_212961_94924A8B 
X-CRM114-Status: UNSURE (   6.73  )
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

Since commit f862bbf4cdca696e ("riscv: Allow NOMMU kernels to run in
S-mode") in v6.10, CLINT_TIMER is selected by the main RISCV symbol when
RISCV_M_MODE is enabled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 arch/riscv/Kconfig.socs | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index f51bb24bc84c6e47..d4ea91cdb2b138b2 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -53,7 +53,6 @@ config ARCH_THEAD
 
 config ARCH_VIRT
 	bool "QEMU Virt Machine"
-	select CLINT_TIMER if RISCV_M_MODE
 	select POWER_RESET
 	select POWER_RESET_SYSCON
 	select POWER_RESET_SYSCON_POWEROFF
@@ -73,7 +72,6 @@ config ARCH_CANAAN
 config SOC_CANAAN_K210
 	bool "Canaan Kendryte K210 SoC"
 	depends on !MMU && ARCH_CANAAN
-	select CLINT_TIMER if RISCV_M_MODE
 	select ARCH_HAS_RESET_CONTROLLER
 	select PINCTRL
 	select COMMON_CLK
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
