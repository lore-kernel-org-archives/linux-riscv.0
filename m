Return-Path: <SRS0=euR7=ZM=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68526C43215
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2019 13:37:11 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3A4EF22475
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 20 Nov 2019 13:37:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o8KD1p/M";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="fD9//T3l"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3A4EF22475
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	References:List-Owner; bh=7llyeILM50OW4kTHVS/Js661NtXLBGERjqcKTVGhGIE=; b=o8K
	D1p/M88H+ZjzPY1NbW/36dTsMxEPoi0JeJNg5qdxPkj/e6XFljr/Z+vItQYmse9vQsOdIfNxQT6e5
	GYgmYepMewayZKUO2LRpxdPR0QTGEslDhEuiLHIye9Ecc5kx1hDb794hmA6IPG5wVcC21e92c6Ucw
	8l9mMpn1M15QqkMrx+IE9V07Kevp5HYo2zw333lO1EwIoHeUsT4nBrmq/3nZhuVwHJdsrhm3VU+Nw
	WZE7R/NTQRQSQ0zqUFcQsOJ+/JTFvgvgSoowyFYTHunGqi2mGm+6eS68LtoNypmg68niaCatTLBbP
	a3jynT/m2yef9pzvI20yJ6AEP8nhZSw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iXQAP-0002Dc-TG; Wed, 20 Nov 2019 13:37:09 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iXQAN-0002BA-NK
 for linux-riscv@lists.infradead.org; Wed, 20 Nov 2019 13:37:08 +0000
Received: from localhost.localdomain (unknown [118.189.143.39])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E88E722475;
 Wed, 20 Nov 2019 13:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574257027;
 bh=duNY+VBU6lUzCzx1T0ATt0/eCL5uIdsG7lRXCgb9EJY=;
 h=From:To:Cc:Subject:Date:From;
 b=fD9//T3lKbdwOprACds3bx1yCQNM32gU0WvZDmw//qGS1y1MLTaj8FstpMft/eQTb
 lzpkDWLhFl7Rdx59hEWmoVR2JYhmr1/Y0Aq5CuaPtUp2etybCxtkfGZ7vu4NjIVHhD
 ScNBzjsu4+vuNgTKj2Btd8qqi0851nOwA10KZJnU=
From: Krzysztof Kozlowski <krzk@kernel.org>
To: linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Fix Kconfig indentation
Date: Wed, 20 Nov 2019 21:37:03 +0800
Message-Id: <20191120133703.11956-1-krzk@kernel.org>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20191120_053707_793119_EE1C05AB 
X-CRM114-Status: UNSURE (   9.59  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-riscv@lists.infradead.org, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzk@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Adjust indentation from spaces to tab (+optional two spaces) as in
coding style with command like:
	$ sed -e 's/^        /\t/' -i */Kconfig

Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
---
 arch/riscv/Kconfig.socs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index 536c0ef4aee8..85199004c6ef 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -8,6 +8,6 @@ config SOC_SIFIVE
        select CLK_SIFIVE_FU540_PRCI
        select SIFIVE_PLIC
        help
-         This enables support for SiFive SoC platform hardware.
+	 This enables support for SiFive SoC platform hardware.
 
 endmenu
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
