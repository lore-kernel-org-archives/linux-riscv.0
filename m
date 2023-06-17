Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6F89EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 20:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kM0wsxFosECT7UvF9VrtZDSwrmlVCAL5XOVxWcqWinc=; b=5AZ5ddhEwdxUCJ
	LMAA2lSuZkom1cMjtN1lYLmB86pS3V8rQ5k5bi2k2SdFLxl7J1lIc+mtlUfYUx4zINS16Z0UMpQld
	nr4GfNZygQKRGRm4Q8psmpQH6TozBevlFkbSsNqm90N/3CCGNtcqdxDHpPeWxpfE24L9pOzth/Z1u
	LG0/XUDLhqAdXMPtYF+BqWc7vyUYTZItogZ0JURrLdumEu0ZozEwBdu7a9dChDxiODJj4Lh9XJhVX
	21K8Bs5DaVkIjug1SQCAjpRQEeLzhepMY29aQ1zBFGe39H8Q+o8SgFST2ZazOuU0lKeu2abom0JOv
	dG3qSFRcRqgCvqZ1qv8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAcWp-004Igi-16;
	Sat, 17 Jun 2023 20:28:11 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAcWn-004Ig9-0L
	for linux-riscv@lists.infradead.org;
	Sat, 17 Jun 2023 20:28:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8550060A73;
	Sat, 17 Jun 2023 20:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11352C433C8;
	Sat, 17 Jun 2023 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687033687;
	bh=68ECMllYQvqpqql/9+oMBFdWm7djbD9Oka4+bNj04NQ=;
	h=From:To:Cc:Subject:Date:From;
	b=fK+O7uqA0RBIJX5QBWaPZPlcSPcz8ZbXU7k8j3iXhBAz9GHuCaNh1/GcUVnh5Szxv
	 WnWrJhgyUx82wU1JPShDkuVj1vE1rJ6dVHcLR/cvQZYfuGk9PUGCi3QQShpZZZB4w4
	 Q2Djjzn+U5detsOsulmJqTnn5gefFQiF+1b1mIpNeQoLnWgEcdSkRp15GQk/C63tir
	 /r3UH2MgqL6T5VrhSW1ttItPTUMvcgsfQ9fEeVgIOMs0oK2j/ym/iQP0+qjy2vuqHv
	 E7I9B2dAH8XvJUDe3IB9FqFe19xjQXVPxfJmMy1I3nX446S2oU4Duq3H+3GvjYgEG8
	 DXGgvmtOIzw7Q==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1] riscv: dts: sort makefile entries by directory
Date: Sat, 17 Jun 2023 21:27:35 +0100
Message-Id: <20230617-stimulant-untainted-3fa1955d386f@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=824; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=XEtsEBU1FvnnvAuJrrnMxFDBpdQ1ulsGwWGlG2BKcIM=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCl94sYNwTGNB+4dTLcJ6dkSfjXH2v+fiu5Xj8bIpcvCL BQEjWw6SlgYxDgYZMUUWRJv97VIrf/jssO55y3MHFYmkCEMXJwCMJEYP0aGfVEfD+6oTHa417/j hV10//n9Os/Cnmjp3Hq/5KnhnP+fTjJ8j2Qxt/dQtV+wgPuX0vTbnC4alzgWS0/fc1f/k9c/1Un sAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_132809_212557_B7C38E23 
X-CRM114-Status: UNSURE (   8.01  )
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

New additions to the list have tried to respect alphanumeric ordering,
but the thing was out of order to start with. Sort it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/boot/dts/Makefile | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
index 1e884868ccba..f60a280abb15 100644
--- a/arch/riscv/boot/dts/Makefile
+++ b/arch/riscv/boot/dts/Makefile
@@ -1,10 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 subdir-y += allwinner
-subdir-y += sifive
-subdir-y += starfive
-subdir-y += thead
 subdir-y += canaan
 subdir-y += microchip
 subdir-y += renesas
+subdir-y += sifive
+subdir-y += starfive
+subdir-y += thead
 
 obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
