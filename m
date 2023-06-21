Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF061EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Jun 2023 19:01:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wEUjy7PlducRr2geYIEe246T4mW7wlNTj3Ns+E08+Hc=; b=Kc9Ybdtcnp9Giv
	t3V3+GWZ22TPDriGfrvvVqCV7yyzGoq7bVdogdx9ahFpvC2AORSgOsO244i1AC7CycZmNSQMdILeF
	RY2u7hfnFocR3Pgczmwi/k61y7fJ7HP1dkeuTiESvKPRtMY8OvBVQ8f6rOFPmVyvluVAEebIw1Lb0
	scjyhYtLyvfMH8nUHFLSfiM+2fIuY+PncBoEdfiPwdXLvLVlmRkdhetMFpTxf/C3DuCOXtyUXboD1
	Z1NXbyIDnR/qd0fB/4PSa2v6eEAga41pe2gfb3pUCDwWvSRriqsOdN59t1WUyLWItY0iTc3mvqhmH
	0w3KRtCqcGHFdpAQesxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qC34a-00FUMY-32;
	Wed, 21 Jun 2023 19:00:56 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qC34Y-00FULj-2S
	for linux-riscv@lists.infradead.org;
	Wed, 21 Jun 2023 19:00:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 27955616A1;
	Wed, 21 Jun 2023 19:00:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B382C433C9;
	Wed, 21 Jun 2023 19:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687374053;
	bh=wCtBx+btmEgXd4oHrHrBecjQgIOZOa4Ob05hmny7ong=;
	h=From:To:Cc:Subject:Date:From;
	b=UD6zMebW8v4rlI15uda5rm5vBtPpQemAWU+RHv65YDQt5kS8uIvAdhIdZqXWeSm8a
	 RvZa57VSMtudntxVd5mpTTJQZy96QRxiQO8GyGlQ71NpaVjC3HERMHV3Mke/Brss1D
	 GF3CI/rbBQcc3dRiQ/LYX+Dwqz35FsqitIMNPm5h+2N8nl2a2nWxPBAx5PKH/IEZXq
	 s4HsH6tvowvJzzj2TsCRxvi3N7UOcl5ux6sEAWCX9jN67KFAGN7rPt0jLwSM0J0JQ+
	 S99CwpbpB69iEm510ZVFbOGuFn22dlQBGalESET3gvsAqWGQMih8KwTSusRlBbKHBw
	 T5AA8uIDjDUYw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] RISC-V: make ARCH_THEAD preclude XIP_KERNEL
Date: Wed, 21 Jun 2023 20:00:31 +0100
Message-Id: <20230621-panorama-stuffing-f24b26546972@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1448; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=DKC0lvBVjPZAhDU4YTCtHGJdKRYVtZU6wqvi6iUcYRc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmTPc78tOsQ3d+/6qTti7LOoA1PpzP7rrzHtIj3ZVPt/ 8Ozd1+O6ihlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEtFoZGa5YvXy+b8adD3G2 /ntunuGLW8ay6d52hVV7FTbZHz5+w8CPkeFB4rPzaXOFF10MW83VwJ7geDK0sk7MV+GUsvGKf+e 8p/EDAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230621_120054_854624_92EF9F00 
X-CRM114-Status: UNSURE (   9.54  )
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

Randy reported build errors in linux-next where XIP_KERNEL was enabled.
ARCH_THEAD requires alternatives to support the non-standard ISA
extensions used by the THEAD cores, which are mutually exclusive with
XIP kernels. Clone the dependency list from the Allwinner entry, since
Allwinner's D1 uses T-Head cores with the same non-standard extensions.

Reported-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Link: https://lore.kernel.org/all/ab38f6af-cb68-a918-1a63-2e7c927a8ffc@infradead.org/
Fixes: da47ce003963 ("riscv: Add the T-HEAD SoC family Kconfig option")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Albert Ou <aou@eecs.berkeley.edu>
CC: Jisheng Zhang <jszhang@kernel.org>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/Kconfig.socs | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
index ce10a38dff37..6833d01e2e70 100644
--- a/arch/riscv/Kconfig.socs
+++ b/arch/riscv/Kconfig.socs
@@ -43,6 +43,7 @@ config ARCH_SUNXI
 
 config ARCH_THEAD
 	bool "T-HEAD RISC-V SoCs"
+	depends on MMU && !XIP_KERNEL
 	select ERRATA_THEAD
 	help
 	  This enables support for the RISC-V based T-HEAD SoCs.
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
