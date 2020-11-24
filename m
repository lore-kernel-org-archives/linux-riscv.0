Return-Path: <SRS0=DJxK=E6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAB88C63777
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 19:17:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4A080206B5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2020 19:17:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="25sXB+00"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4A080206B5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gE2JMvT5if+6rlvdbrr7BaeARdB8fBNdT4ubqxrqMIU=; b=25sXB+00iJ0ECMBB4xQ9OV9aAi
	uqEnyIYgoHASevDyLddoKv7NugHiFCE7AV8eVR+grhibuI7C2ULZpPaw8WSMbIz2c5IYM7o6I3i1x
	assG5vi9vIDgtP5Wm2+HcBFzMCUP2ENzKt8BbrHoeLC8iJgLr6/W7AgPWaf6zDXrNnfBQKONbB9G6
	ZsjJxURLWyDo/49DfwvQxNc2KPjTLgfarEhrAW7Sp3MFoFVCFDCEpXw7/ufGB/X5XwXSzW7jkRv+W
	nI1ddb3AUzsJx5+Clnwp5M7cQUrLv9nDIjsFl382DWmSreT7fIru1WAXFCNUUPnFz/Hd2Q4+k6XuQ
	UETvZ/Xw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1khdo7-0005qi-H5; Tue, 24 Nov 2020 19:16:55 +0000
Received: from baptiste.telenet-ops.be ([2a02:1800:120:4::f00:13])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1khdo5-0005pJ-BL
 for linux-riscv@lists.infradead.org; Tue, 24 Nov 2020 19:16:54 +0000
Received: from ramsan.of.borg ([84.195.186.194])
 by baptiste.telenet-ops.be with bizsmtp
 id wKGo2300Y4C55Sk01KGpEU; Tue, 24 Nov 2020 20:16:51 +0100
Received: from rox.of.borg ([192.168.97.57])
 by ramsan.of.borg with esmtps (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1khdo0-005XKS-NH; Tue, 24 Nov 2020 20:16:48 +0100
Received: from geert by rox.of.borg with local (Exim 4.93)
 (envelope-from <geert@linux-m68k.org>)
 id 1khdnz-00Ew4C-S7; Tue, 24 Nov 2020 20:16:47 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH] efi: EFI_EARLYCON should depend on EFI
Date: Tue, 24 Nov 2020 20:16:46 +0100
Message-Id: <20201124191646.3559757-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201124_141653_550250_AD4DC2F2 
X-CRM114-Status: GOOD (  11.03  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Damien Le Moal <damien.lemoal@wdc.com>, linux-efi@vger.kernel.org,
 linux-kernel@vger.kernel.org, Alexander Graf <agraf@suse.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>, linux-riscv@lists.infradead.org,
 Ingo Molnar <mingo@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CONFIG_EFI_EARLYCON defaults to yes, and thus is enabled on systems that
do not support EFI, or do not have EFI support enabled, but do satisfy
the symbol's other dependencies.

While drivers/firmware/efi/ won't be entered during the build phase if
CONFIG_EFI=n, and drivers/firmware/efi/earlycon.c itself thus won't be
built, enabling EFI_EARLYCON does force-enable CONFIG_FONT_SUPPORT and
CONFIG_ARCH_USE_MEMREMAP_PROT, and CONFIG_FONT_8x16, which is
undesirable.

Fix this by making CONFIG_EFI_EARLYCON depend on CONFIG_EFI.

This reduces kernel size on headless systems by more than 4 KiB.

Fixes: 69c1f396f25b805a ("efi/x86: Convert x86 EFI earlyprintk into generic earlycon implementation")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
 drivers/firmware/efi/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/efi/Kconfig b/drivers/firmware/efi/Kconfig
index b452cfa2100b401c..1dd1f7784f0888ff 100644
--- a/drivers/firmware/efi/Kconfig
+++ b/drivers/firmware/efi/Kconfig
@@ -270,7 +270,7 @@ config EFI_DEV_PATH_PARSER
 
 config EFI_EARLYCON
 	def_bool y
-	depends on SERIAL_EARLYCON && !ARM && !IA64
+	depends on EFI && SERIAL_EARLYCON && !ARM && !IA64
 	select FONT_SUPPORT
 	select ARCH_USE_MEMREMAP_PROT
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
