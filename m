Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF86C77B6E
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 20:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kJSuu/pIWsb0BW9/Z2QkjREmq7/nRTynuN0yG7R4bLQ=; b=YZ5TX1ZDvpLOq/
	8bk86PvlHztnd9EoDGNR6hjyc5i9OUDBdfItoH97igeCL0GvxAz9cDGr659EiYSG7JGAGyHM7tU0A
	brYNxLiKAt6dVEOAQGyIeCOOwNzczoCmZ34V6VWM+dL9GueLEkgg2aEfiaM1GTEbs5EWPtWuOeZ8a
	SLMTsqau+mEKAaEnC1pa8CDLG15SNJmi1bLgHbhLek2GkM7uTaYJAITTB2P4mIr+XS1YSYq6jNTb6
	Tr9nmGtIbih7k8v6klcV9JYM7XyswNQNb9h7KkhHFVNFWvsPztXdbYZtxpDn9sn3K8Uwd41VlZdB+
	kPtumyMFZ76WurEdsx4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgp-008axe-0H;
	Thu, 06 Apr 2023 20:58:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkWgm-008ax6-2O
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 20:58:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5952664BE1;
	Thu,  6 Apr 2023 20:58:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1C4DC433A4;
	Thu,  6 Apr 2023 20:58:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680814715;
	bh=GUOoSqrJ3HEphPnioWv++YNspCVNct6juRt4rZsQ5Zk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RwqiZWFhztmW9W3iOP/4ITXmX+Joly7WG9QWptavLAFppW9wM9gEvqsIQiqAlHwex
	 Uw91P1eGGLH71clAFgPvovbgcywLj7mvYplgab6i1Zwi456AjwBqpLuljm+GwPXitq
	 HzE1zAVb+x3pRTaHV3njmQQhkZJHQVPuhjWkNLkK4thfmETQ2L3hIAr+RDWLyLhAFl
	 xK7UYvuVDoTkrK3v5KAUa3RY1EiemOsqowy+QS++JtNEwg5/u8nesj5t0vxiaiE7gJ
	 YI0zuN/7Hylh35WHhyBHjN7rMmw4JqiO0I6ywHu8y33rn8zIQ5CRd/d/Np1txcP+ZG
	 zQ/WsNEyoYnIQ==
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
Subject: [PATCH v1 3/4] soc: sifive: make SiFive's cache controller driver depend on ARCH_ symbols
Date: Thu,  6 Apr 2023 21:57:49 +0100
Message-Id: <20230406-subdued-observer-cbb0e2f72cc7@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230406-undertake-stowing-50f45b90413a@spud>
References: <20230406-undertake-stowing-50f45b90413a@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=718; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=9Il+wlZDZcYvFbiMxYuYNQnDgGowSqAh6MrzvX34VSo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCn6Rl7Xa0sar/bLGTzU1X7Xa/VrrZdyuYlbkKlinvGcU t8v+9d0lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCJtQYwMx2/Zz59+bt29s1w7 +s7pGE6qNclY3aGzI2hi77trW1lLWBkZNnl8Vl5dvaZRUmSO6Dbet34f3SI/f3rwcT6DxcrCfeb lvAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_135836_819077_262AC211 
X-CRM114-Status: GOOD (  11.46  )
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
use of such symbols on other architectures, convert the SiFive soc
drivers to use the new ARCH_FOO symbols.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/soc/sifive/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
index e86870be34c9..139884addc41 100644
--- a/drivers/soc/sifive/Kconfig
+++ b/drivers/soc/sifive/Kconfig
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-if SOC_SIFIVE || SOC_STARFIVE
+if ARCH_SIFIVE || ARCH_STARFIVE
 
 config SIFIVE_CCACHE
 	bool "Sifive Composable Cache controller"
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
