Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CE4EC369D5
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 02:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cyFWpyV9Q9PQ7Lvpc/pmxJ7UmUnMBFftzhc1+4pMOec=; b=PAPtSwikZezofc
	OPaPucaszYYoM0Eze0Gcs2sFZ96MNie/l/Gb+PRhmfwoBu5qlFxJKICBgrSIeXwQRIKfUT/9CAI6e
	uVKreZCdJNVlgtdjmzGhiPZL/29PFkITweai2Pa+e2AZ6LYK7upDGVcTgZCOGFNjD51xB3wa2FP/L
	3mh3JyHxypnM/OK3nUKc3rO1cZPK/xPLq6640M4yde/8ok60pG3uMyp1PtFcpU9MB7ygx+1uKFT8c
	vdqrBNNn6hDogNnc5dKbCjkxwgP1JaoM2ga+ovmvLluLeXu4kCuF1FdSyUQjT5ZMQO1AVFVR2bRQa
	+w3unrFfUGG0R6q7L0hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73J9-00000005b7b-3PJS;
	Tue, 22 Apr 2025 02:24:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73BL-00000005Z3u-1FVE
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 02:16:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2210461166;
	Tue, 22 Apr 2025 02:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298E7C4CEE4;
	Tue, 22 Apr 2025 02:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288178;
	bh=k0CvyBXD/JneYEp1nm10fppRGqN6XZUKVHkWxBtVi+4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Euri6nnRWUntrxw18EYulB8bHD2cg/uaDk71PztKxr2K7eiP1o5iOhuS5Jm+ICupM
	 t4HRf6bvbenRge0mRh4CYDR0KyPnBwJjEBfmbKgIC6lQCkBfkHzEnfi2ERfTZ+ny2g
	 Mu9CJutbX41L5VtJv5S/x6BMbRv3wdKKrsHcc1lvraJh3vRPDJ/9z2PLK+B5EwUKQ9
	 YZ4VxQzpwkd8PCjs+5VAZC5rnra+cIPpSiGZDSuQKraLAlAs6AoZRNSw2AiwzIA2j4
	 E9V+1MILNQzx+exSRBJJcjcIaZKlFPeqr43wh1YZhGJ8P4JK2vT51PJfXFY3J9yrM+
	 fNZDQXHGcWk+w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Andrew Jones <ajones@ventanamicro.com>,
	kernel test robot <lkp@intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 14/30] riscv: Provide all alternative macros all the time
Date: Mon, 21 Apr 2025 22:15:34 -0400
Message-Id: <20250422021550.1940809-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021550.1940809-1-sashal@kernel.org>
References: <20250422021550.1940809-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.3
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

From: Andrew Jones <ajones@ventanamicro.com>

[ Upstream commit fb53a9aa5f5b8bf302f3260a7f1f5a24345ce62a ]

We need to provide all six forms of the alternative macros
(ALTERNATIVE, ALTERNATIVE_2, _ALTERNATIVE_CFG, _ALTERNATIVE_CFG_2,
__ALTERNATIVE_CFG, __ALTERNATIVE_CFG_2) for all four cases derived
from the two ifdefs (RISCV_ALTERNATIVE, __ASSEMBLY__) in order to
ensure all configs can compile. Define this missing ones and ensure
all are defined to consume all parameters passed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504130710.3IKz6Ibs-lkp@intel.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Link: https://lore.kernel.org/r/20250414120947.135173-2-ajones@ventanamicro.com
Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/alternative-macros.h | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 721ec275ce57e..231d777d936c2 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -115,24 +115,19 @@
 	\old_c
 .endm
 
-#define _ALTERNATIVE_CFG(old_c, ...)	\
-	ALTERNATIVE_CFG old_c
-
-#define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	ALTERNATIVE_CFG old_c
+#define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
+#define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
 
 #else /* !__ASSEMBLY__ */
 
-#define __ALTERNATIVE_CFG(old_c)	\
-	old_c "\n"
+#define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
+#define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
 
-#define _ALTERNATIVE_CFG(old_c, ...)	\
-	__ALTERNATIVE_CFG(old_c)
+#endif /* __ASSEMBLY__ */
 
-#define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	__ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG_2(old_c, ...)		__ALTERNATIVE_CFG_2(old_c)
 
-#endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
 /*
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
