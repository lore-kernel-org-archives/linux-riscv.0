Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 137F6C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 May 2023 22:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fRYxTUL2ZN3eGONXJQ8uHqHWyP1VR1Oi5wesZCdcELE=; b=OFDI291coDRGt+
	hHVclhJhSE8jBNg+/gJaNL3HwKGTo6Aw2eQ2yYBRrBn6xzvWaz6DTFY8ZE80YOyPDRYx1ykLPWJDJ
	D9uXM4Py8jlh6MKsHCEij87HTNIBVxhGeKrR8Lsqq3rn3DEu4glQVqQ2NLtqakEBeAEBK9veU362p
	hPblnbVW0oddonGq0tJLJ6PeP/cTVaZVZlupMCiiIlesJCvNnH8B2QhTuvLlJeK2oMDZT2QazlCou
	zVPm4hlo+bUIJYkuqXGN959G9H6Lxyklz2QrH5bBILSWOAQAoWnj5KCjosMOTB3KTniTgibRjMgEk
	9BnM3i6ovj14ZeQ0d00g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1puh5m-0099dV-0w;
	Thu, 04 May 2023 22:06:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1puh5j-0099d8-21
	for linux-riscv@lists.infradead.org;
	Thu, 04 May 2023 22:06:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3714B63A06;
	Thu,  4 May 2023 22:06:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C483DC433EF;
	Thu,  4 May 2023 22:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683237982;
	bh=p+nBMjhf085Txg4EIjzEDURrGaTcPs45mxDAjoOjmfY=;
	h=From:To:Cc:Subject:Date:From;
	b=I1MmCizx6JeqHhjU+RkRzV3jveZ6QCYYf8c+s8tavGuMjzi6EmBYjayFxU50ZNpN0
	 Dl8nlSDDEqhhMKbgwntsmFTmJwSORTgkT+U1/M0KmCLeRk7TOWziMIdiYvLrIc3SOS
	 9qAIitu9SGjY67wQjqKnHZgDrQ14/G7NomyiXHnrZE+b2nDkNP0hbbizPDmfl+zxv8
	 rBnidOCYoCtSDgzFj0rX2wx1khA8ele6AjSfOOQ1AiNYgQfi4/3eEJWcrRuHgYNaM0
	 egkCS8Oj3whNVZKJ5nrPdi44N4GUrGWcROdslD+Tnml0SPTnDNzgfBA8ZYORj2VbFB
	 zq34/BbnVOG4w==
From: Conor Dooley <conor@kernel.org>
To: conor@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v1] MAINTAINERS: exclude maintained subdirs in RISC-V misc DT entry
Date: Thu,  4 May 2023 23:06:06 +0100
Message-Id: <20230504-donor-unsorted-6f0c4067f506@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=773; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Pu+05Es9GiNE9bcH+6yobjPk63qm+2EuEbqG349BwWo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCkhOt6/Vpp/E97XuHiTQbbhn8kJeX+Lrss6Hl+zZXP1Y m7R9cb9HaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjI9N8M/9RKqxKbtPY+5Fz9 VvUKt3uezuE2A9W+fJWH8fZu7++d38rwh7c2Xtqnb4aotWrpt+UNP9Nu76/zzlZ4cvTcrf+Cq5f 08AAA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230504_150623_718071_41420304 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The Allwinner & Renesas stuff doesn't go through my tree, so it is a wee
bit misleading to have them match against the "misc" entry in
MAINTAINERS.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 687d7a3d2e85..a84676793ce4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18122,6 +18122,8 @@ Q:	https://patchwork.kernel.org/project/linux-riscv/list/
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	Documentation/devicetree/bindings/riscv/
 F:	arch/riscv/boot/dts/
+X:	arch/riscv/boot/dts/allwinner/
+X:	arch/riscv/boot/dts/renesas/
 
 RNBD BLOCK DRIVERS
 M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
