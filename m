Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E46EECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 22:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fu9omxeuiJDP/6BDE3YSnSAVxOGjSvXlwEos8LR7z2w=; b=PD95gunwCcVVOd
	pxKLpsWjKUXioLbFQpWZmS3ui9pxSqPf3toJy06K/gkm1yVo/wDw1A1L+QbGAQNlH5T1O4997IIjB
	p25QzjkPzM6lqD7jsjs4dnB38Ar1mvz/0YcUEFgHglZinAQFHf00xDjGCP/4M+HIhy9nIgl1JhcK0
	AWU/cf8dnhHQcUTEqBGFGAWtEXCGkhPiWkdfjQ4SVtXMgaFhIja/KQ8g9RHS38DCIAVV/g0n/vcFl
	YbOekGPCTs9X/fZeCzaL/wzXDD96oRr1fhjzdv0P6H5CtgJ4u7WNeBlNpTgdCEBScbPB8H3JESeGk
	iLhZgQI/1ixm42qJl4XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTspj-00FRdt-QZ; Thu, 01 Sep 2022 22:38:47 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTsfh-00FLJR-G3
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 22:28:28 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oTsfW-0007wk-Gz; Fri, 02 Sep 2022 00:28:14 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: conor.dooley@microchip.com,
	guoren@kernel.org,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>
Subject: [PATCH 3/4] riscv: use BIT macros in t-head errata init
Date: Fri,  2 Sep 2022 00:27:43 +0200
Message-Id: <20220901222744.2210215-3-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901222744.2210215-1-heiko@sntech.de>
References: <20220901222744.2210215-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_152825_582442_E82F42D7 
X-CRM114-Status: GOOD (  11.24  )
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

Using the appropriate BIT macro makes the code better readable.

Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/riscv/errata/thead/errata.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index bffa711aaf64..a6f4bd8ccf3f 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -49,10 +49,10 @@ static u32 thead_errata_probe(unsigned int stage,
 	u32 cpu_req_errata = 0;
 
 	if (errata_probe_pbmt(stage, archid, impid))
-		cpu_req_errata |= (1U << ERRATA_THEAD_PBMT);
+		cpu_req_errata |= BIT(ERRATA_THEAD_PBMT);
 
 	if (errata_probe_cmo(stage, archid, impid))
-		cpu_req_errata |= (1U << ERRATA_THEAD_CMO);
+		cpu_req_errata |= BIT(ERRATA_THEAD_CMO);
 
 	return cpu_req_errata;
 }
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
