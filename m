Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B31E6CFA46B
	for <linux-riscv@archiver.kernel.org>; Sun, 23 Nov 2025 18:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vehlj8RnKBzxcAbbreQw2YlcLa4yC+J2lVtb5bXDK6E=; b=gt3TPNWyiVQCJ8
	KijLugxy/ExnP2IBTY9d+HMXmaAiMvKtPScXdQbrp6afvDQV5gwYunOC72ryQTqGNxVWYVqYoFhKO
	H6OhzF66oDMnon+9VIw4qvDyDfIKl+z+thf09KFrtwwY41tRx1JvoJiq/0pvqkvmoGvkSgYzjaV2j
	fMgmAbq+B5D8Zm7E05H4jeuGWVThOAokzcClqRaT0o6bG8viV6jZDSWCwm7/IE2FWq/7tmVoPY4hy
	ax5OXVr6wH6UWeK0wJyGH0UgTlC/OCS//ksjPsg8XCrb8VZi1qmuYkd3tSJcKjCwBrSmeDNLak/AH
	mUnRDbvAnA4y68Ojloag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFDj-0000000AckP-1Nox;
	Sun, 23 Nov 2025 18:53:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNFDi-0000000AckF-1Pvs
	for linux-riscv@lists.infradead.org;
	Sun, 23 Nov 2025 18:53:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 78D5560051;
	Sun, 23 Nov 2025 18:53:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2220AC113D0;
	Sun, 23 Nov 2025 18:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763924035;
	bh=yvfIFkSNs3ybUYGQuCNnXP8WGROL0KV3aClc5Kte83A=;
	h=From:To:Cc:Subject:Date:From;
	b=pTIOu/cdnsA4ewhCRvDsanfUq6Wz9qMxXeIh1c0ZY0UV/+r8xLaJFIxzmGp88pwTC
	 mOLjusWqpGq3QW5RuYfVQ1O04FZAeJmGOFMD293wKzUZnNoQEYZPyuMPySToOVThrx
	 eSWVKOFujjpO/FVnkXWxxsXLxNVdEuivKK96lJyr1pjS39qFFbEZQRMk0rVpQCdtOu
	 iXlui1qF9rsueAp22TZeneWHoruKuM1nD+I1104N37WUks+DRBZ59cl32Np8mznBp2
	 TZnaTEVBGFxUXoK9FgU8gJG5rXqxXsnM/5yJFAiifS3mzejdl4I2td2hFkw2qhaGtY
	 /uKbjIsQSQcbA==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <kernel@esmil.dk>
Subject: [PATCH v1 1/4] MAINTAINERS: add Conor to StarFive entry
Date: Sun, 23 Nov 2025 18:53:40 +0000
Message-ID: <20251123-shopper-stunner-c3c5ff00b0ee@spud>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=UDqXviiyDO2rvEhsW8EMk+fYotEhO0q1Mh7aZXGvkyM=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDJnKEaZmWj3iG5Ta01MYXjYu1jj8ZrNfUpbgDwP2VZ4/F nT6vGHqKGVhEONikBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwESK9jD8Mw1yPlwdLbr5j+yP Rb+Nmh9/1o4zVLnR2HSgMrRl0+6MJIb/2Ubqngara+cEpl+dmuTwWM/0fOzs+T9tSi8F5UjY8SY yAgA=
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

I apply the patches for StarFive devicetrees, add me to the entry along
with my tree location etc. This is not a functional change, as this info
was in the "RISC-V MISC" entry but I'd rather not have the duplication
of entries covering the StarFive directory.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 24efae3df425..a0e092d2d88a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22122,7 +22122,6 @@ T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	arch/riscv/boot/dts/canaan/
 F:	arch/riscv/boot/dts/microchip/
 F:	arch/riscv/boot/dts/sifive/
-F:	arch/riscv/boot/dts/starfive/
 
 RISC-V PMU DRIVERS
 M:	Atish Patra <atish.patra@linux.dev>
@@ -24447,7 +24446,10 @@ F:	drivers/crypto/starfive/
 
 STARFIVE DEVICETREES
 M:	Emil Renner Berthing <kernel@esmil.dk>
+M:	Conor Dooley <conor@kernel.org>
+L:	linux-riscv@lists.infradead.org
 S:	Maintained
+T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
 F:	arch/riscv/boot/dts/starfive/
 
 STARFIVE DWMAC GLUE LAYER
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
