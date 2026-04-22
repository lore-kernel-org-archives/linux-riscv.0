Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B418F9EDF8
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 15:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nt2SZHAy0XvflzsPUnYQrWFGcm7s1wgsFB9TAo8p97o=; b=DUQlnNzPm9y3cq
	dhyFCV/skF34xo6EmKkZ+4Tnfll2R9zMYlyliG71T+GkM+xLeZkNuDPQEmDr457dJsdRJCrRW84jO
	Ggzj0bIwelIPJGxEj4Z5m1n6k5BmX26zdL67/Z/G+HjCN3WxeWvUG7FaLP2qIsZMCJYp3tgdJFIeU
	9VDOA3HNpn6JCpj4gEsDmbCxOF/2mRfNtPLuxio7BMkwzw7hh5b4V7eP/EAw3TsCstagLs3he0paC
	8I/1cWKcL9sr2PEDQecaWvAMxNkU6nDb913ykN1MQBlHq86UP0IxplABfX1wxUQDvs3kkjCpSRoLJ
	6fEv6mKj0zEgQ4cFngmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZJq-0000000AQ4s-3NRE;
	Wed, 22 Apr 2026 15:16:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZJp-0000000AQ4e-1Jxq
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 15:16:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 815E26132D;
	Wed, 22 Apr 2026 15:16:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FAC7C19425;
	Wed, 22 Apr 2026 15:16:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776871008;
	bh=YWUFzjrC+YZ66IO1Pw9MWP7gquEpbKTqaDGwadm3x2Y=;
	h=From:To:Cc:Subject:Date:From;
	b=N5CCLfg9eqBi0XE3sGqZ6fcyJ7N54s8J4E9us9foizGdYsvSKqCS4NyfwrEaM299L
	 E2K0qmrC4/UWnVStGXfscxBi6Iuyh8To8jpi1QEjZlDBzRy7C0dFRCGJSG4xUrgkqy
	 gBj2otzlvC0m4ajgXqyshkCu/Rm1/PSrJbM3UtJILusqrLADr/JmIwstZ0XPmEzLXL
	 i8i9b8potcYGQvnOCO1o9c+pziytGmJsA4sby46he0gEJ2Dl0Cy32HZ93dycIn8fVQ
	 QHVOPF/jSkxYkwPiYQg3W4+fgkfRM5pDyZbtlDtqUO69Y47+Ofd/QHn38gNsuTHNyY
	 gDd/DVVxjir6A==
From: Conor Dooley <conor@kernel.org>
To: broonie@kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril Jean <cyril.jean@microchip.com>,
	Valentina.FernandezAlanis@microchip.com,
	linux-riscv@lists.infradead.org,
	linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/5] microchip core-qspi gpio-cs fixes + cleanup
Date: Wed, 22 Apr 2026 16:15:41 +0100
Message-ID: <20260422-foe-strength-a5d8ad650ef4@spud>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1529; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=MMCTxTqrtSeHxapOKaJd96986V263BVofgVYjUJVYg4=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkvnsmpVnTMXXnTudJBIUVXoigjf1bNfq1s28yaq83uS no+zMYdpSwMYlwMsmKKLIm3+1qk1v9x2eHc8xZmDisTyBAGLk4BmMjZN4wM846eERWIt7uyprY6 968bzyPBDb5fn3ccvLr8R6iqxrXtkxn+e05Z2yFw+9KMvR5zeJbtCqhUDjmWab26QU7wbcnPu15 beQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

Hey Mark,

Got a couple of patches here, the first two deal with an issue that a
customer reported where using a mixed configuration of the built-in chip
select and a gpio lead to data corruption. Turned out, the built-in chip
select always gets activated at the moment even if a gpio-cs is being
used. With that fixed, I noticed that any read with multiple data lines
was not working properly, so patch two changes how the driver deals with
emulating mem-ops. The remaining patches are things I consider fixes but
not meaningful enough to get a Fixes tag. LMK if you want em split out
to be put on for-next rather than for-current.

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Mark Brown <broonie@kernel.org>
CC: Cyril Jean <cyril.jean@microchip.com>
CC: Valentina.FernandezAlanis@microchip.com
CC: linux-riscv@lists.infradead.org
CC: linux-spi@vger.kernel.org
CC: linux-kernel@vger.kernel.org

Conor Dooley (5):
  spi: microchip-core-qspi: control built-in cs manually
  spi: microchip-core-qspi: don't attempt to transmit during emulated
    read-only dual/quad operations
  spi: microchip-core-qspi: report device on which timeout occured
    instead of which controller
  spi: microchip-core-qspi: remove an unused define
  spi: microchip-core-qspi: remove some inline markings

 drivers/spi/spi-microchip-core-qspi.c | 105 ++++++++++++++++++++------
 1 file changed, 83 insertions(+), 22 deletions(-)

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
