Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5228FC4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k47id3aTL/ObgLlhJ00yHGDWzySUHxK8ZzL7apH3D+o=; b=oJMXXwGAnksZzJ
	r2l0CUjL8lXpTlpiCtnAfT3RuIZPXHyrp/w5jZbsVD6xRbTOoBT5mE1PPqqDPBUbAHa2S//VoNPmj
	exwBCsrtz6r1xxeOSXzitRs+hfaAdFrsv5M4UuK4zByKud2Tz3o+6sKEe0UYwbR2/8gb5AO+4rZX3
	YuDcnq9c7f5CEdtCfYOBlxew8FIm+CL8/puUwQd4aPLrjPRS2vZbz7Y1WsmvkCKBuZHRsN1lM3mn7
	yvo+YgN8YxddcCKrBiCf1qdpcYswZvc6H+bO8R2NA2NNYdJIDvjc48La+uRBx2QkWn60pxPymZaDi
	9EgG+waqNG7MwTHY8dVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yh-00FNgr-1a; Wed, 05 Oct 2022 17:14:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7ye-00FNes-EB
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:14:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 0EA436156F;
	Wed,  5 Oct 2022 17:14:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719EFC4314D;
	Wed,  5 Oct 2022 17:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664990075;
	bh=C2ehtRTdCg39q9bItLZO3vn1F8+p+kdTKZzHvn9xQoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eHj9/vi3k9+ujlImWfuzvR5rivHk5YiEX2LRRnKzyUWhkjw2Vp83PAWPNp3i2mqp3
	 cHQ/hwv+Cfpt5N6XjC79y/HgcwRMp/QK9L++iu8pBH2aQa3OZtwF13siUAuVx3COvz
	 lCv3Mu+1oxFw3zPZ+2CCXbzeksH9JpaJZL8syYLmp/nXs5YdzbDEdbdtkbHBuzK49z
	 FN4gWnfCdRru7PpZv6/n+/a8I+WF6JDbjROn5uwWXzlnZF+L3KKC8LtsrLOYaMN7Km
	 w6UWJPtlqlFEaBnRtKJatFDQF59tsaUsztpSl1BBYdJDMX+jBH8DFKdYZk2j0bH9vj
	 DkbYCTRO8QHdg==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 5/6] riscv: stop selecting SiFive clock and serial drivers directly
Date: Wed,  5 Oct 2022 18:13:48 +0100
Message-Id: <20221005171348.167476-6-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221005171348.167476-1-conor@kernel.org>
References: <20221005171348.167476-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_101436_535182_B37012F8 
X-CRM114-Status: GOOD (  10.05  )
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
SOC_SIFIVE so there is no need to directly select their symbols
anymore.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig.socs | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 83f14afd4086..b6f4cfad159b 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -8,10 +8,6 @@ config SOC_MICROCHIP_POLARFIRE
 
 config SOC_SIFIVE
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
