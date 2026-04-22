Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F469F9EDF8
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Apr 2026 15:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lP8lnJu9y34ayeXyvlkej/0zJukT41LVWJ6jYrycTuU=; b=X/dknW+YVnCE70
	rYotXZxs01b/raFKzjpd5v6NXg356psScLExropWw0EGEcnIdSaR1wjSYu2oRKShXGPwKrr8RM5vz
	Pt40m+dqlH3dhBYnvzSCHZCJKOgfpafOK/dSXgg289SJagt4zLv3hJ6XJ0D34o7kzsJPGZJVGU6d/
	UFjZuP97obFtSlzN/RGYmb0hV8l8rAwX9F1EJOERCVlKKKFg4aLaroyq3ujXz8KdjMwoydWA/pjuy
	1i5O4wjaZNKjZLmxEqwF52VUFccuvOycE0thmVmAP6e9l/V3hEEyfCXfsqPsoh6VMwkaIE41ZQYdd
	hskb7tuH7LOfw1fWJQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZKV-0000000AQJi-0P8e;
	Wed, 22 Apr 2026 15:17:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFZKU-0000000AQJI-1xQ5
	for linux-riscv@lists.infradead.org;
	Wed, 22 Apr 2026 15:17:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D28DE61330;
	Wed, 22 Apr 2026 15:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEF38C2BCAF;
	Wed, 22 Apr 2026 15:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776871019;
	bh=6ET/frCteaTcrEw4caKHP3nJei7aVUDYuECfByOQKZA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pxHwzwf6JqgqyvJ1OZhj+VC34Cd0D6vupBQKWuZWOX8A05KspypYTPIhtKgsaxcr4
	 MxI+6c92kOvrVnb0eQvDn4ktGhaLL+1u5oKzj4Pgupi6NsqgOWGTTnmxIVwdNwu3AD
	 1XwXpXHRV1gcse9qesHmcQXcoT+4R7/hucBCcaoDI0glxQnauNBMf4qEDklnTvvE7o
	 Jz2phloDCSutGlSEEgTpO7pbMDz97FRKUHRW/SIAoWfwiLjbrVO9byQ3dPLgNVMvfJ
	 VBhgZcrw0lA+IBAyrbLk4D6SCziemmknGSV8c29FB3RGa3PMbJafgFfXiisUVg/7Zj
	 AXQJ8b/hkYYcA==
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
Subject: [PATCH v1 5/5] spi: microchip-core-qspi: remove some inline markings
Date: Wed, 22 Apr 2026 16:15:46 +0100
Message-ID: <20260422-cackle-guacamole-d51cc736a4b6@spud>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260422-foe-strength-a5d8ad650ef4@spud>
References: <20260422-foe-strength-a5d8ad650ef4@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1848; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=LZMEd4rd4apGWbweXgMgaeSQ0Rz6fCOGsgSVYyBq+ps=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJkvnjkEWxX4Narxpf043SUqWr9A/tMz1z+x09nOK78v/ rh3U8bFjlIWBjEuBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk0TmG//6VNy9+m2b/dmHu 5KTGlv2/3DZff/skZqZtYV3znC21dWWMDFetQwvKIuZrRq6sucBSWMr3/NX1dzJ5vCwH32WeWq2 4lhEA
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

Remove inline markings from a number of functions that are called as
part of mem ops callbacks. None of them are either particularly trivial
or sensitive to overhead of a function call. Just let the compiler
decide what to do with them.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core-qspi.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-microchip-core-qspi.c b/drivers/spi/spi-microchip-core-qspi.c
index ae1c7ce09b2ed..383d5eef7a2a2 100644
--- a/drivers/spi/spi-microchip-core-qspi.c
+++ b/drivers/spi/spi-microchip-core-qspi.c
@@ -199,7 +199,7 @@ static int mchp_coreqspi_setup(struct spi_device *spi)
 	return 0;
 }
 
-static inline void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -235,7 +235,7 @@ static inline void mchp_coreqspi_read_op(struct mchp_coreqspi *qspi)
 	}
 }
 
-static inline void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -263,7 +263,7 @@ static inline void mchp_coreqspi_write_op(struct mchp_coreqspi *qspi)
 	}
 }
 
-static inline void mchp_coreqspi_write_read_op(struct mchp_coreqspi *qspi)
+static void mchp_coreqspi_write_read_op(struct mchp_coreqspi *qspi)
 {
 	u32 control, data;
 
@@ -421,7 +421,7 @@ static int mchp_coreqspi_setup_clock(struct mchp_coreqspi *qspi, struct spi_devi
 	return 0;
 }
 
-static inline void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
+static void mchp_coreqspi_config_op(struct mchp_coreqspi *qspi, const struct spi_mem_op *op)
 {
 	u32 idle_cycles = 0;
 	int total_bytes, cmd_bytes, frames, ctrl;
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
