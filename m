Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11CDDCFD318
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 18:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=htZP9pO1VFyEkkLa05jlKyuMEWOObYUcuOAL9VQNNUU=; b=Ys1RClhJfJOjsA
	1veijzkIS7c2bGMVWJr7Ir9kM8Rk1r5wfbaPxLkKFgAIZac0EHIrBRzltTd+gJ6DJ/QWKi5pSe2hA
	BKnnkYhQi49SlLlQHzoML9ECfcV3Tmzcy6EuiX78RH090btPGmCkd0ufDrBixs9ePk+xvDx+rmA7k
	Sie97rvfFA7dStyRdBbQM4lqctpse4+4n1GlwN70xQj49dJNGsWouqRmhzrBO/anxSd6ZOR1vaTTF
	gaMshuwoU75JhkP9B3wJoj3f0l1hpYf63v0Sm4r16Zmsrctbjr2gd+VL2r6V2vxfQaDCnnZuBiK6U
	fMsMt84Nq9rqdOYdjpDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFDt-0000000AcmU-1BAe;
	Sun, 23 Nov 2025 18:54:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFDr-0000000Acm8-30Xq
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 18:54:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 25D0E60051;
	Sun, 23 Nov 2025 18:54:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0165C113D0;
	Sun, 23 Nov 2025 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763924046;
	bh=u34mg+SElCW1JolAuTaNj3iPWQE4/5ghbyagNP3qUeI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nUnAXbO/KGIf9zc4VGRjoSSNjlVgyhlaSAfdM6W19py2gaVmm+v5Xfz1+D/Ezvctn
	 5FHCsjo4DwNU5BPrx93A0rtAX2KfleZP+r6ZL+ethYNdBeYCsThcTjhzy2mCa6IZ1B
	 Sg2+ZzP0sXsAPLul8OH1xWn4xfyZooeQHAXx5z1fXGa6NuIRZmGO6d9qXWgiJn/S//
	 7U+VAhkGgEKx1YmTQZTb3ZApgsKYOUXJimaVEveK83oGV++g+fIDSVi1jjljJzFG+E
	 g10SkKpXJgCCN6f33XUNNhKYv85bcEDK5akNKKL0XKQq91E/ziZwjMXOohtnJ9XTYI
	 3SJjMoOSE5BBg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 4/4] MAINTAINERS: degrade RISC-V MISC SOC SUPPORT to Odd Fixes
Date: Sun, 23 Nov 2025 18:53:43 +0000
Message-ID: <20251123-reactor-jubilant-36551b0d8143@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
References: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1157; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Wpr3jm9gi057mRT9rSSGBJWTZM8Mxk1yspfxhwAOUUo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnKEZZfGT/tOnCxYmv+hKqF8+tadX33WyfJrPgRncL/b 3ZEJ3tfRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACbitoiR4VnlkoiFd3h9rppv 9eCPaHzC9qr5tHfv6z0nmCd19n1ztmP4K9deaRev3b5t2T3+uP0bw4/brPr6YsO7ij/nDdYo204 7ygwA
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

The SiFive and Canaan platforms are not being actively looked after at
this point, but fixes for them would be applied if/when the patches
appeared. Since they're now the only things in the RISC-V MISC SOC
SUPPORT, mark them as Odd Fixes. I don't believe this is a functional
change, it just represents what's actually happening - particularly
since the Canaan k230 never built up enough steam to get merged and the
new SiFive demo chips have been done in partnership with with other
companies, e.g. Eswin, and will reside in their directories instead.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index e5e4bcf7a408..735f5447c52d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22117,7 +22117,7 @@ F:	include/soc/microchip/mpfs.h
 RISC-V MISC SOC SUPPORT
 M:	Conor Dooley <conor@kernel.org>
 L:	linux-riscv@lists.infradead.org
-S:	Maintained
+S:	Odd Fixes
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	arch/riscv/boot/dts/canaan/
 F:	arch/riscv/boot/dts/sifive/
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
