Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C4EFC369C2
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 15:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jjGvzkCVQBTW+1EvkBknYAjfMc4NQ8hbov4XHmbo1M=; b=pXGy7TAr4Ks8Ae
	mTCnfD1AOmnWidYrDS8oUNat+ekVZSUYbSoSeC3hYwiu2/nT26ZLqS99btu/ikPCNdGESpgZLAwcY
	RmFOHSV+ABKfRq4uSMOmlIphUbtxLhbvkoZgEH63BoF2ILaLy7ZMA8ZkEa77/1iN8fQfbmQL26mwu
	hCKDLGQJKRe9rECQdDXVvHKT2xQMS2iArZVC68wiHP4gi51kXc6BPF/UewUVKab9ERkZDODLF+Av0
	7vZ7iDkWZucsNeEQKfmkujigmZ0F6TBsgZ1ewT6wsBGmWlHr6YN9v02GS5Ha9YKTrCTR2VEl/Y7Nr
	YFLZ9b0vcZ0zxIuVLe8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54Os-0000000A0us-0Se3;
	Wed, 16 Apr 2025 15:10:06 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53E5-00000009kQ5-2aJL
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 13:54:55 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id E68DB12FB450;
	Wed, 16 Apr 2025 06:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744811693; bh=cDKUc2qr4xy2aliQgEkwRBtZ1Kb2bgQimbu1j0KwCEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=1f2FbHyedv1LxNbEscPXYOKxmEUzp+P9fVOn1ar4X3F8Vyf2j30/9K1ucuccF0rzh
	 blS89fA0tVl+gDb0gAhF3G/C64FD9SkpMabIKpV8vOt/zXgP7Xm+64nAHMXm37l5Ss
	 qBnGX7LQgyZNMNAUb+KzV5V5Z2vimmGRdiYOYcBhmlNRhY6QT9sCZPi2QUJbBBQbvh
	 zxmg3eHbU3m79dlF4DPTLZMNklaI6DmAoQhQLqaXnv7qbWOSAOCUp84pNM9jKO93fo
	 sfaU6hhIFtQIL7P8cEoMHzcSaKcF3tGh8iipXtAsmbgEMJ54jeFj6XpsgWnxFSOf/3
	 G9c4E6Eqa5W7Q==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9Gr--WM_oGMm; Wed, 16 Apr 2025 06:54:51 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.80.190])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 5EB7F12FB435;
	Wed, 16 Apr 2025 06:54:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744811691; bh=cDKUc2qr4xy2aliQgEkwRBtZ1Kb2bgQimbu1j0KwCEU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GA4W0h1cMddHFj1ML5LOIBXpOSH4kWwboRpf/NvRm0BTWH77v8OmUSvg30W9tMt0Z
	 kZbNOPgxCw6VNWCvP4U+Kq/RNuCzu35uvUo256V1iDpspnfupP84t8Bp5VmQ9gXa4v
	 oplbZPNk5rjzchwDmR3CKZmysdccg5L8qvWd1GtU4qfQq+/H6qpHMT/VFHiu/Lhi93
	 kAYiStQpizJT1YZuk6vu7yP/ERfFv0Qov7VciIRGZGrMO07bZ96BPwvz3IrqogrM5Q
	 R7XM8RmW4nPsqeS3TGElT3kXiCWEs2IINu4BSltK8fJXMHhwDu+wGWbRXsowaY+gQS
	 ITUF2bOI8ajhA==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v8 6/6] riscv: defconfig: spacemit: enable clock controller driver for SpacemiT K1
Date: Wed, 16 Apr 2025 13:54:06 +0000
Message-ID: <20250416135406.16284-7-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250416135406.16284-1-heylenay@4d2.org>
References: <20250416135406.16284-1-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_065453_674074_B9DCCC68 
X-CRM114-Status: UNSURE (   8.41  )
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

Clock controller unit, or CCU, generates various clocks frequency for
peripherals integrated in SpacemiT K1 SoC and is essential for normal
operation. Let's enable it as built-in driver in defconfig.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Alex Elder <elder@riscstar.com>
Reviewed-by: Yixun Lan <dlan@gentoo.org>
---
 arch/riscv/configs/defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 3c8e16d71e17..4888529df1d8 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -250,6 +250,8 @@ CONFIG_CLK_SOPHGO_CV1800=y
 CONFIG_CLK_SOPHGO_SG2042_PLL=y
 CONFIG_CLK_SOPHGO_SG2042_CLKGEN=y
 CONFIG_CLK_SOPHGO_SG2042_RPGATE=y
+CONFIG_SPACEMIT_CCU=y
+CONFIG_SPACEMIT_K1_CCU=y
 CONFIG_SUN8I_DE2_CCU=m
 CONFIG_SUN50I_IOMMU=y
 CONFIG_RPMSG_CHAR=y
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
