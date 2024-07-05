Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2237C3271E
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Jul 2024 17:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cmqL28I8dH7t1U6bj8q0dShLKt9OsQM/yG+AAkz7i8Y=; b=FYORyyOqOrdy2j
	SioParMgAd9ji0Kn9XiTdQ2IIU/jhFziYa9KX0chOZ5BlY4wysZrlogA4J1gt+UCTfiz2GFZ9rnP3
	UDSebkLzij+Yf5mer3pHgo6/Pq65RKXzV/jUsfuxIsBYPcKkS9cujbbNqJAqsOme3+DrN4hgXyKd8
	GcZLyIV8m0YEQ1BaS8Z2C/pNIlW9YdKQdC/Bh6QEdtoQP4YtXltyHqL3aAwdAFmI1bK4kad8cWi09
	ULPWX6S30pf6hSAUcabPHD4OfU8OrSOiBKy6jCBZBQk04Y0YtkQweiA2jcd6/hDBGZIORtlWTvNkd
	dQJclDghDe13+MOd3gEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmSM-0000000GVtz-2byL;
	Fri, 05 Jul 2024 17:10:46 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPmSJ-0000000GVt8-0pi9
	for linux-riscv@lists.infradead.org;
	Fri, 05 Jul 2024 17:10:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 898FECE1A8A;
	Fri,  5 Jul 2024 17:10:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B6DEC116B1;
	Fri,  5 Jul 2024 17:10:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720199439;
	bh=rt35NjUgW/C91Lz67ZKBNDSx0DfEz1EQsLfxcW/ZjQk=;
	h=From:To:Cc:Subject:Date:From;
	b=Sarjax3uiZjlafHM4fgMvJ9iCO3kpJVODA3vdFT2ITpdaBX4x9i2CcihQMDyOCPJ0
	 oU4mQvvqrRmidMRnoeKDkHjYDCH7xjZWjMH6i86oRiOjaDSwfhCsetdP0LwBbyQskV
	 zDPq3tyhBR1O7NvL943OeGrjXFG8I/5YDTYBjMnaiALxNVRVN7IsuKewy5YKrHqtFT
	 bsv9vHtPLDJ6GaFA+DyA9ZayRpEFX/AnvjjoMqCw+ZZKsC4eJOs1Sn7MrCNbvIL+lk
	 ct4z0PZM+/U7917VDEFWLb9cgWAhjrb3e27/E24mwIGMQc3wDhGx9amsZzk2+zci9e
	 FqwTohwX4Rgxg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: define ILLEGAL_POINTER_VALUE for 64bit
Date: Sat,  6 Jul 2024 00:56:32 +0800
Message-ID: <20240705165632.3216-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240705_101043_440520_7C8946C4 
X-CRM114-Status: UNSURE (   6.86  )
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

This is used in poison.h for poison pointer offset. Based on current
SV39, SV48 and SV59 vm layout, 0xdead000000000000 is a proper value
that is not mappable, this can avoid potentially turning an oops to
an expolit.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/Kconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index c51b32a8ddff..c992eabbd002 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -313,6 +313,11 @@ config GENERIC_HWEIGHT
 config FIX_EARLYCON_MEM
 	def_bool MMU
 
+config ILLEGAL_POINTER_VALUE
+	hex
+	default 0 if 32BIT
+	default 0xdead000000000000 if 64BIT
+
 config PGTABLE_LEVELS
 	int
 	default 5 if 64BIT
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
