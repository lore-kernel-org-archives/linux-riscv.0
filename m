Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 668F3CD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 15:54:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=o2nx8JdzA2jZuJXvTWquVIUVlTnUASOo4bS4TBso6AE=; b=dbKahF7JHgF8SV
	gW707Ese278mxKaI5giY1qJQMDtbJPv51tb2G+YEzp0Xwt2jMCkBtC2tR2SRIUymc/Wd2ObdJ38b5
	yfE6LxRhTq25F2xX/7usZ6erwBl+9kBKErdZXexlF8jhkbP5lEwG1pENQKxEHchayGmCVZY8uY7oS
	lMYU4OZcKyILx8afhTv5Aubqdq53B9CQn+lgFcaEJvnChrAeKA0IPpvZ5eA/HNk0py3kRmejtZvVF
	4AcR7P9ZafXCR0knY99MSwUZBVw9V4bFviqZT0NC+JGXhX0mHt88TIYxfHS7u+YuTsPTs3/7Vb2jo
	8sS8QGmGZ+5PWTBX/TGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaGx-00000007sNF-1pWT;
	Wed, 10 Apr 2024 15:54:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruaGp-00000007sLh-0q1a
	for linux-riscv@lists.infradead.org;
	Wed, 10 Apr 2024 15:53:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 99A7FCE29B4;
	Wed, 10 Apr 2024 15:53:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C0E0C433C7;
	Wed, 10 Apr 2024 15:53:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712764429;
	bh=SqPe3DfzT/ltHcfMna2d1NH1tRD4LDibXZWmRZyVL5M=;
	h=From:To:Cc:Subject:Date:From;
	b=AYIsoepcYFkCZZq3EohWBeJd6LXBDaGTUpupVmhLuy1ajqgKPH7whwY/7a01lO2lq
	 HnmQwa2/vD5YObh9yDPklhFHaVk3b/1C7+CQUkHueHcA79O2M95sB6oKzc63CjLpby
	 uUmyvpe1VdyKfiD9MjMDiwN5qxRKb7leyUysWMtvDxlmvBUILreKwYxMtwuL7oeIli
	 Hu4vTmGHZqfg3IR5NL2ZHQ0OaSVO9JxpnCoGoRrIzvuOaxQTncI2eOZaUVLWueqmU5
	 KGEjyaaSZ9CdIuYvM0Rz3Gu+AB0Jr0bonCHbmEXkLawTc0rLJS95/aUTI39/GjV8ry
	 pBRCsUdlIaazw==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk@kernel.org>
Subject: [PATCH] clk: sifive: prci: fix module autoloading
Date: Wed, 10 Apr 2024 17:53:42 +0200
Message-Id: <20240410155342.224061-1-krzk@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_085355_445097_1329E88F 
X-CRM114-Status: UNSURE (   8.23  )
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

Add MODULE_DEVICE_TABLE(), so modules could be properly autoloaded
based on the alias from of_device_id table.  Clocks are considered core
components, so usually they are built-in, however these can be built and
used as modules on some generic kernel.

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 drivers/clk/sifive/sifive-prci.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index 25b8e1a80ddc..700a1be9ec47 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -611,6 +611,7 @@ static const struct of_device_id sifive_prci_of_match[] = {
 	{.compatible = "sifive,fu740-c000-prci", .data = &prci_clk_fu740},
 	{}
 };
+MODULE_DEVICE_TABLE(of, sifive_prci_of_match);
 
 static struct platform_driver sifive_prci_driver = {
 	.driver = {
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
