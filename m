Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73845C07E9D
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vWHg+JQ5fh+lPU2NhONPyOshBMdZCkSC2araujpLPqg=; b=oC77nJbAOdDTC3
	s7axrlvrMBjT3J4JzgtYTS6tckM6P3Z2dtjS10P7V9fn5h+a+nCB2sNsPrTtnAyRxbXaBvv9eCvqh
	VPEpTvQTb0EN0Lk+9XuoS/AaBFsCBc3dAt7oGq1aeAvysS+zN0DtVQ+Pr4ORQcpfmzu4yYArwSxZn
	5+C0sTUARyWCINz2Lfx4uCXUPh7xWx0Dd/7368uX+wVFXLb78HmFhs3I38dYylmFrkPCJfE3YAx/g
	bPhAjqrYU2dxpgkAMQww7lMsP3tSdzgpZXwnHvwC0p9xW25MUNoAv9EJo7HP5ys4Ob6r85lCn2bYF
	BVkFRR3aZGi/0CcWHnlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnsU-005RGS-6u; Fri, 23 Sep 2022 18:58:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrw-005Qjs-6q
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 61A6D61018;
	Fri, 23 Sep 2022 18:57:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EBDC433D7;
	Fri, 23 Sep 2022 18:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959466;
	bh=o8yYtFzTxfYF9ovwoLxfPrCEJP5EIR1tNU1feWxyUgM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SyP3BiXhKJxYLf++6efH8CAoMmHGGYUiwaO19tGtXew2qK1yQY4A/lZhitV4j0rYG
	 yNNmPiAGkVvdcPvkOJF6HTuKmXhTW5xC9/yB+llVPE1RBluztncCmqZWLRH8X81ZBR
	 PgrZkW+jAxvZLSB8D8tLOPpFEZqKBs7AJBxi/kb7IM5b0KaEVmsrgxfRdc4vLTsvwE
	 j+fHoUfK+lnsmI2nfYKQwVhzxIlY83yG1qLYI+w7ORrYPD6GjKjpX9vrEkVDnRq6OL
	 f5xS+xKB5AsnxvOMgIUOduxYDNMp3ozPAlEfDpIHCaDn+vH9qNudUccUXA3K7RtUl0
	 X2nWPKhfv9AXQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 17/27] riscv: stop selecting SiFive clock and serial drivers directly
Date: Fri, 23 Sep 2022 19:55:56 +0100
Message-Id: <20220923185605.1900083-18-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923185605.1900083-1-conor@kernel.org>
References: <20220923185605.1900083-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115748_357847_6FC52AFA 
X-CRM114-Status: UNSURE (   9.21  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The SiFive clock and serial drivers will now default to the value of
ARCH_SIFIVE so there is no need to directly select their symbols
anymore.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 3604b90251b4..811338720cbd 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -8,10 +8,6 @@ config ARCH_MICROCHIP
 
 config ARCH_SIFIVE
 	bool "SiFive SoCs"
-	select SERIAL_SIFIVE if TTY
-	select SERIAL_SIFIVE_CONSOLE if TTY
-	select CLK_SIFIVE
-	select CLK_SIFIVE_PRCI
 	select SIFIVE_PLIC
 	select ERRATA_SIFIVE if !XIP_KERNEL
 	help
-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
