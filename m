Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84DDAECAAD5
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Sep 2022 14:14:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aL8fAnWa6z0meA1ZFb9G3gWpEdwwX8rkmEFgXkDML3M=; b=y6KTgqGfTgb8Lx
	tZyi0+9j0bLIqHr0Gejf4vAVos+VyLFxONAgtnfmuNZrAW6MB0G3GK/M+Q43MGac/8k7I+Aa3gd+9
	6aiYaRYXVvrd4BK04y6R4Qd2rhnPwvkYrtkcJHfXYKvRk2JH639jsGhEMP1Gj73r/1qjlRgGJIpbo
	Arzy+hEQNVt6U6hUbjg2NHoJjiROrNy+55dBaZrJgvvBG19k8Zgi5SXBwfYGeFSuHEVLa2LmC1eFi
	DiktZpr+zqZDvaY46r8q9eJc6ctYqe+cldFMaLVSjlUMO73mHFitUYeCqlJD7RHsl0C0pSRlGqKiI
	FdHVDbpDRQizmvpvQRAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVCrw-004Fbv-RV; Mon, 05 Sep 2022 14:14:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA0A-000vM7-AY
	for linux-riscv@bombadil.infradead.org; Mon, 05 Sep 2022 11:10:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iTakt3lV7rDBfj6zMK7PDrQi9jdie4tNamf8xHspI2w=; b=eb81z6vSZUm6AJxgIylU5Q9DAv
	EMF3jR1GfxuDabswM7y4/OTq5xth1uWcFI5hEuarIP6xUJ2Qx12qmk5wq/Gvv7kl7DgGlOdsbtbOx
	hLOXXuATjk8bP1ATJlD1LQGlVe6H7qCy17QAeaJaAXy9W8/sYdWyf1xNwUL6ADBGc0wJSzix9HF8P
	MoG8RYoBFu4i2JbMcgvFkqfJI6N+6Mc6v/bQmDUn8lFp3NlwZ1TQUENpAEyU6ksbUS77R16O3sH4y
	vqFr8KVFx1XkHta+m1r44WOGmSPiTnONia493+4jl/n4F8Su+OgBiSyl+kjNO3ChfXiJPh/BK8zeF
	BBOtnzKA==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVA04-009YuB-7a
	for linux-riscv@lists.infradead.org; Mon, 05 Sep 2022 11:10:46 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=phil.lan)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1oV9zx-0005hc-Lt; Mon, 05 Sep 2022 13:10:37 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: guoren@kernel.org,
	apatel@ventanamicro.com,
	atishp@rivosinc.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH v2 3/5] riscv: use BIT() macros in t-head errata init
Date: Mon,  5 Sep 2022 13:10:25 +0200
Message-Id: <20220905111027.2463297-4-heiko@sntech.de>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220905111027.2463297-1-heiko@sntech.de>
References: <20220905111027.2463297-1-heiko@sntech.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_121044_410998_93E57D83 
X-CRM114-Status: GOOD (  10.40  )
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
Reviewed-by: Guo Ren <guoren@kernel.org>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
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
