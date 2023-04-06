Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1B2CC76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 20:58:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TviLHQobkITiy9nczQcOz4Mph/1mCEfKd6WYLGPI/sY=; b=K5kYmxpBR404Qq
	6w1GpCCp8k25Ker3efz1oGvlpkebB11f1UjY1CyF5wCv3RUJlfxU52TsosifdxGNnpkH1GG7oi77q
	sFzi77dvKlR6XaIvXYBzk48vo0hvvw7B2tfW1vii6IbGE4AurZCcI49cyYS9EACR/GR/o1ZgB0Qr5
	ulaUY23bseWrHrRuDAn2i2yBJ2OrI922lxxgdPyhy8T0022Mt1boO1KxeijNvkvxudK5rs925KoC4
	TExnTG+p9Y4pRJtNv88V1BWX+MCwEIXBQ5BLpLw/+XS+MDTWerVvbuHjXqd8h+QKpxr+KfpAtc5Us
	EQE1waIcnqX4vNDr0OWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgr-008ayv-37;
	Thu, 06 Apr 2023 20:58:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgp-008axx-2P
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 20:58:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5083764BD9;
	Thu,  6 Apr 2023 20:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FAEBC4339C;
	Thu,  6 Apr 2023 20:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680814718;
	bh=hPhh8oTx1kYLc913G4HIdxuV/0cdfFWp2HgdjSh+vKE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uExbzvaTeBK8FlkbTfXpl+myDNnYUfc3M+u9y5qwGUKWlFphYo/+osPoZLU/y+oMl
	 muWRLkrK2GuHVwNFIul5kMhjhgkkEoHmutbFJb1n5Ga/MgeVhFG4IpbrQcfXL4li7l
	 kRpeUyrWe2U1g9ehZ3RDwmSzdMy70t1MZCMXsuSufSJjtAY6VQdfSupVK06PkLLn+u
	 POzOU6xTsqPl1C0fARDoPfY8MproJ8TT6C4+mT0hH+2Nppwjm3RLqtJUaKGMXIQpoD
	 3LRmwrvFcLyJ5p9wdRwpfY34JaAu7c43C5E2vpJ1LU5kweXBPdCK6JRYGtZYzK3DCk
	 MDUccGPJH+FmQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kw@linux.com>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v1 4/4] serial: make SiFive serial drivers depend on ARCH_ symbols
Date: Thu,  6 Apr 2023 21:57:50 +0100
Message-Id: <20230406-carnival-aspirate-fcf69a30078c@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406-undertake-stowing-50f45b90413a@spud>
References: <20230406-undertake-stowing-50f45b90413a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1169; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=/uqEAT4mwA891sbEf4x2pVtUF/+D0Dq2ST7GwztNFHQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCn6Rl5R2spbv9u90F5UuaaO5erlaZvmnu/cxvSQ9Wjqm wslG1cadpSyMIhxMMiKKbIk3u5rkVr/x2WHc89bmDmsTCBDGLg4BWAiB6sZGW4uq/Y16WEukDZk rKlvKHrFfXKHYWP422dLndbMbSgRmM7wV3K/9/yq1/9j5l+vnZulbCLz9NVmu7Mmq9/7K7892BT MxQwA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_135839_826438_BD2AB5FE 
X-CRM114-Status: GOOD (  13.30  )
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

As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
use of such symbols on other architectures, convert the SiFive serial
driver Kconfig entries from the SOC_ symbols to ARCH_ instead.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I hope you like the message-id Greg ;)
---
 drivers/tty/serial/Kconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/tty/serial/Kconfig b/drivers/tty/serial/Kconfig
index 39a0078f54f6..398e5aac2e77 100644
--- a/drivers/tty/serial/Kconfig
+++ b/drivers/tty/serial/Kconfig
@@ -951,7 +951,7 @@ config SERIAL_OMAP_CONSOLE
 config SERIAL_SIFIVE
 	tristate "SiFive UART support"
 	depends on OF
-	default SOC_SIFIVE || SOC_CANAAN
+	default ARCH_SIFIVE || ARCH_CANAAN
 	select SERIAL_CORE
 	help
 	  Select this option if you are building a kernel for a device that
@@ -961,7 +961,7 @@ config SERIAL_SIFIVE
 config SERIAL_SIFIVE_CONSOLE
 	bool "Console on SiFive UART"
 	depends on SERIAL_SIFIVE=y
-	default SOC_SIFIVE || SOC_CANAAN
+	default ARCH_SIFIVE || ARCH_CANAAN
 	select SERIAL_CORE_CONSOLE
 	select SERIAL_EARLYCON
 	help
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
