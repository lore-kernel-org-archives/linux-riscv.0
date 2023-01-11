Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5993C54EBE
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 08:15:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R2SHemyV7nksKF0ncTcBRCrtS5j0NGqB1PzthalCWmM=; b=xzwLCEE32gdG74
	5LCWc5J7p72PnNAbq1nbEoeM7s5iotA6/nawp1jfC18AG+09qNLWF+Q/irQHfiv6FMwubVg/oPEPh
	hDDpCe5DL3vpsjuMvogtNUOoiUNbQUeY5EslCmW02mQPNVmZg/0oZX2FM/5NeRQ6fHev+Wm+6VACn
	M3oMPFMSNGmyVQxHcW0gSeRcWQAH1ks8KVS7He/1RuE8xdddhO/zoySM/GYWIxPm9pTla/n6icToH
	OydVFHxB8/18DxiQGEaUgiNwuoOLinRCBQ0uBBBt/BGzClKU03riuP6qHBSbYiGlaYkvhCymp0iws
	4i6s/6SelofBr29xuY5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWGy-00AJXy-4D; Wed, 11 Jan 2023 08:15:48 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFWGu-00AJWv-IX
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 08:15:46 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed10:d992:2e67:38c1:3ab7])
	by laurent.telenet-ops.be with bizsmtp
	id 7LFc2900222nSWd01LFcJ6; Wed, 11 Jan 2023 09:15:36 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pFWGk-001YMK-6K;
	Wed, 11 Jan 2023 09:15:36 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1pFWGl-003Bgt-Vs;
	Wed, 11 Jan 2023 09:15:36 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] RISC-V: Kconfig: Remove trailing whitespace
Date: Wed, 11 Jan 2023 09:15:33 +0100
Message-Id: <080aa959266ad842a8e7efca7111f1350c6a065a.1673424858.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_001544_787924_53E6CB9F 
X-CRM114-Status: UNSURE (   7.62  )
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

Remove trailing whitespace that hurts my eyes.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
FWIW
Fixes: 444c3dbdabd46819 ("RISC-V: introduce ARCH_FOO kconfig aliases for SOC_FOO symbols")

 arch/riscv/Kconfig.socs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 945c00d20fe19304..37d8ad51d1adbd90 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -35,7 +35,7 @@ config SOC_STARFIVE
 
 config ARCH_VIRT
 	def_bool SOC_VIRT
-	
+
 config SOC_VIRT
 	bool "QEMU Virt Machine"
 	select CLINT_TIMER if RISCV_M_MODE
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
