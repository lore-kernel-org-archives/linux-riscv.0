Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26C29F9EDFB
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 15:17:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vn/SD0+MVvPtvSl+pql/IURIK9YtugetYBa1TT+BGCA=; b=r9uucRLjJdJKU/
	HsuPl9LJGlhMLY3wCt+FZdpf3bcQSD1Bdyeo/USFrdONOvZ8tRaiR6AULJrHPIdyJyJvSpJfvtZmH
	OjxJC7WydggrMYpBA9KMotGcDdhgobkCraHW/z4s+Y6IATVnxCwdo2wUpCYKtUYLxQmN+CJapxtLj
	NhIccEVNlEercvG1/ad/0/hnjMAncYjUqIi9SzuFleEGiraJJbClby4bazpp0pMVCzV5IsPVWSaa3
	uEiud6cttcz/zhRnOfOwDHBd6FJTiDmHUXX29YDJgZi/P4tRutgZbx16YWBXxwco6+iem3s4+kBiO
	807sNl1tNhEw1nEldFAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZJz-0000000AQ79-2llf;
	Wed, 22 Apr 2026 15:16:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZJy-0000000AQ6c-0mDU
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 15:16:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A080A6132F;
	Wed, 22 Apr 2026 15:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8416BC2BCB2;
	Wed, 22 Apr 2026 15:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776871017;
	bh=7O7XwKYDSIZRgMFfhLYwFoKq7qcfU4DTABqxZTA2LvQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GjPOdUdwvCnIwij52v9gpXXY/g1jbWUp/bFS3g/eWT6+BqKG69ot8AIHul472r3g1
	 uXnaot9MGfx+6jFELAUjW/ijgQ8LwLOQEdIHlrLzGQH8nlf8QIVPOy3iJ0+Xgq8abT
	 Aiik7a6VTbVSdKFKEqhxTwGfb0I/Sn9M5OHZm5KqloiviFr65LVQGH+3AdQAdqoVFR
	 RqXtQ0isKey0IJkTMTbv5fETenkr7bc9zKT9m1StPfYbc6ptRXFokF6xCWlt7JchOs
	 H5LJ/6o2xSVpx2PclQtvXuA+FHwfYHNqzb/VbVzARSnBNWb+qj+EdMYK8R+yMconQP
	 046Oig843ImLA==
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
Subject: [PATCH v1 4/5] spi: microchip-core-qspi: remove an unused define
Date: Wed, 22 Apr 2026 16:15:45 +0100
Message-ID: <20260422-resilient-pantry-833f1d383a15@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422-foe-strength-a5d8ad650ef4@spud>
References: <20260422-foe-strength-a5d8ad650ef4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=772; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ZQeTCH4jxeGgUWZk1PzFturjJZpquzfnJzGD8RIaUkw=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkvnjkE/Drd+E5p8tU/l58nRk/mZ1x5Trd98hnlm37vd /ZVfuJd1FHKwiDGxSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJ6H9j+O/G7/Z+v89n/sem ovXNvgGZqY3HbDknxDZrX3lrInrGtZOR4fIHU/Nnz07/0vhrn/PI/fssiZzOs0E6z7c+nsBlUzj lPTsA
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

I noticed this define was incorrect, it should be UpperAddress, but in
renaming it it became clear there were actually no users. Just get rid
of it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index 629f785bd230b..ae1c7ce09b2ed 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -99,7 +99,6 @@
 #define REG_IEN			(0x0c)
 #define REG_STATUS		(0x10)
 #define REG_DIRECT_ACCESS	(0x14)
-#define REG_UPPER_ACCESS	(0x18)
 #define REG_RX_DATA		(0x40)
 #define REG_TX_DATA		(0x44)
 #define REG_X4_RX_DATA		(0x48)
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
