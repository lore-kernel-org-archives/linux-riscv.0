Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C43BC52D71
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Aug 2024 17:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MHhvf0+6/qan9L3ewcB67G9nm3C5Q0PozAcnWadyN8c=; b=sxXrwrQ1Wq+7xI
	6b/Gt/j/IFoa1SLalu8Lt/kKSeq2vswPvXv1auEu7gz9mBlr8VHB9yLLHYr0KnmtrefwAzCh4VTGk
	vaYw1RK0NIaTMJM1+1VfoTq/LelnnSnskkIh6Ahn8LtXDUCg8rgk0Glz7nbEtLdYT2PwgsxIvMeEl
	nBT0Z/6ipLxmuaHuv6POMalR/mAEvJUE93lyilwj6Wkcij4XRtTNfJKH7PfqZy9OBscs0HOmCYIya
	1xEYfrWQI+1/+tFVOrPIV3yH0ttA9xrM7njWn8tK6TC9/XNc5sfPljq43LnYNQJo3AbotktebzbGh
	5Fqi4lnMJZtJfIlsDzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbO6t-00000002Wpz-0zBh;
	Tue, 06 Aug 2024 17:36:35 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sbO6p-00000002WpL-2ezG
	for linux-riscv@lists.infradead.org;
	Tue, 06 Aug 2024 17:36:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B75B9CE0EA2;
	Tue,  6 Aug 2024 17:36:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBD2CC4AF0C;
	Tue,  6 Aug 2024 17:36:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722965788;
	bh=n6+U/DQyGAL/QZ6E/IaN06du1xMJdyM5lQ+QPXGhV18=;
	h=From:To:Cc:Subject:Date:From;
	b=YAzU9ff3QWjq18Li3dqcDVNwcBnTcA6TNNZeP2VpVFUMaArXUZCMaEYYCgTAsdLCF
	 YKEhjydTmNHnTbTG4JogMAxYASAEgYkPmsCBxcBy6v/fOmntYX64V6XqcAY06SOl1k
	 Axm44Jx8cUBIQtZTfBoCWwJCV1oL91WgvbPSgmZyhi036X+932azNRW1T/lzLi43O0
	 2UptTJxtGevWIvDuYlXnqTAf4gFXh9XcxWCu7GE5WGIF/45471BxkTHc6c03vcUsPC
	 UmjzhYJKOPM4SkYYzDdxm4Hn8C75GpdCDDrsjBx5zXu63VnzE0TPGWrAzrwdtucH6H
	 ftaCuXOZYwgdg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH] MAINTAINERS: invert Misc RISC-V SoC Support's pattern
Date: Tue,  6 Aug 2024 18:36:21 +0100
Message-ID: <20240806-riding-spinach-8cae90d6e05f@spud>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1230; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=C+bmD2R5BgiIY4mfVTuKuoiG8oPSWvVU1sE77v2mV6k=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmb4kUD1wh6/r89pz/TWOZw/vsry0s/TGbb8Wb6xOmsV 3w3skku6ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEFm1i+Gd5+TxH0h/RvHdt z/dH+80KX3lgvR7r2aC8J3sWL/p5t3Y3I0OzXZJY4q7SAjvRwCCTBwqikqoc+i0vZiptUzT477a gmQMA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240806_103631_885699_731AFDAF 
X-CRM114-Status: UNSURE (   9.34  )
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

There are now more directories that someone else maintains than ones I
do, so invert the pattern to cover included, rather than included
directories. Ditto for the bindings directory - there's more files there
that are the responsibility of others than mine (and I get CCed on all
bindings anyway). Remove it from the entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 42decde38320..6ed3c8ec9005 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19653,12 +19653,10 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 Q:	https://patchwork.kernel.org/project/linux-riscv/list/
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
-F:	Documentation/devicetree/bindings/riscv/
-F:	arch/riscv/boot/dts/
-X:	arch/riscv/boot/dts/allwinner/
-X:	arch/riscv/boot/dts/renesas/
-X:	arch/riscv/boot/dts/sophgo/
-X:	arch/riscv/boot/dts/thead/
+F:	arch/riscv/boot/dts/canaan/
+F:	arch/riscv/boot/dts/microchip/
+F:	arch/riscv/boot/dts/sifive/
+F:	arch/riscv/boot/dts/starfive/
 
 RISC-V PMU DRIVERS
 M:	Atish Patra <atishp@atishpatra.org>
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
