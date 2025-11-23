Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87157CFD316
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 18:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gmeKvcmIo2DBdx6ivivFU8aeYCVN7kDeks8DWu4wv/w=; b=OK/Zoq0wT79rYF
	cR/VwTEF/wURvKE4ojlMY3NayObm2A8hev6L8a6i6OLdCCZTofaLWHBzzWMhxEEDvtdaGN7bRuLfh
	vX1103+XgzF/m8G+jVjKRRooPBcQJZiUkB42LaLewajlKEszP/YFVC+casmSKNpJ8mU670f2lpGTi
	xAzIONNNxLkRgU/TDTe0Njs+WARE1rT+r3ZOQotgPuW+h2Qu0yqkSOPYH3AS7bYEc24VAcz04xJiY
	aiJJTbNDkWR1fm+oIkwyMDoMjHCmAY3XLOnZCldvdMcA/0W2LopFH9tBbQsMwQosMpiRZslyHeUh7
	0Z8nojwFOH97UnOJG+Nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFDp-0000000Acln-3oXw;
	Sun, 23 Nov 2025 18:54:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFDo-0000000Acl8-1Dcw
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 18:54:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 79FC960051;
	Sun, 23 Nov 2025 18:54:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF54C113D0;
	Sun, 23 Nov 2025 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763924043;
	bh=qifmiqz81fgn9r7OYdKnCaDTVY1lJqaLBjYb4P648j0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sckILp9SKa8ygVj0S/MfQKVX6WakgolrcEeoIo5pUgym+qDOzfNCvHG16/8hbY93k
	 B7GxFw7rbXcXXikvKeQyaNaVAhS6kX84Lrvsh+QncZiHXQIy0kifF1HoamKcOSgcxP
	 yKnmWYJFemxHkc0s/Lu4iee75DWjPcTaQtyN/M+oMHLQA7ukn9H+ZwL3/Jg+DkE5zW
	 3URagn9IkD2eWQM2se7srL4uN91Hy8Wdnz1rVv5u28Aus2iVSyxOjZI7zdVqqVmPzg
	 aue4a4n54o5pQzr9CELfxSke6D+qXuwHXaUE+hIdLGN68pLhheVsX6cHDKPgWP/qk6
	 1OPita5F1gBOA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 3/4] MAINTAINERS: add tree to RISC-V Microchip entry
Date: Sun, 23 Nov 2025 18:53:42 +0000
Message-ID: <20251123-wager-elephant-e46b0e184bce@spud>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
References: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1246; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=HR9Rrf/gArbCHxNthBQwclR4g1/oBBJ4T9CJONi6s9I=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnKEZYGTL8WWswwr2n+NF901RJLNoGHOwt2Xhddan2l/ eG5rtMzO0pZGMS4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjARhecM/xO9bSs6Jx9fNVVR 3lBb4ste7+7rb/zNP835cY3D6lKedjnD/7RrViWdlcWZnLfKCj7JxwpMufjpR1jQnGl7Ch6F92r ncgMA
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

In fairness to my own employer, lumping it in as "misc" is not quite
accurate when they do pay me to look after the platform. Move the tree
link for it to its entry, rather than having the RISC-V MISC SOC SUPPORT
entry cover it.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0836b5422826..e5e4bcf7a408 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22084,6 +22084,7 @@ M:	Conor Dooley <conor.dooley@microchip.com>
 M:	Daire McNamara <daire.mcnamara@microchip.com>
 L:	linux-riscv@lists.infradead.org
 S:	Supported
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/ (dts, soc, firmware)
 F:	Documentation/devicetree/bindings/clock/microchip,mpfs*.yaml
 F:	Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/microchip,corei2c.yaml
@@ -22119,7 +22120,6 @@ L:	linux-riscv@lists.infradead.org
 S:	Maintained
 T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	arch/riscv/boot/dts/canaan/
-F:	arch/riscv/boot/dts/microchip/
 F:	arch/riscv/boot/dts/sifive/
 
 RISC-V PMU DRIVERS
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
