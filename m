Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89807C25B0C
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:14:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aAi9EK5Ow2zoD1Vvqk1x7rMd9aRj1zdHGKpPBGdYKdA=; b=PpcnmBaahTgCAp
	KqguStaOV+qmFD3QPxqUO5cNMg9Mt4S4FX34emuUjvfIVnmBDuspkLxO7SRlU9PEVdwbVC1zjfX3B
	S99TqmL/m4tjAgW7pMbRfQyTSHn/IyzQZKlmqi5L5MGSdsL8O02JSa6yohjKCl9jmjefUmfmJW/m+
	v58RdtV7RS1ljBbVPjBuzEYRVOylvLD3J43NgfB7P8TU/Nn2c/ci7ssRXMDmHZm+gDsD5069Z751c
	V1USGXuaMtf13zH4Eub8lMF+9VnvcF1j4jY7KNNEGgJrGe/ErKjn8lz3RvhHJmQokl7MqU2OLsuGo
	jaeqnfMtIbhO8tjnDf1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwxz-00C254-S3; Mon, 08 Aug 2022 07:14:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwxv-00C1zK-8d
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:14:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C705E60D14;
	Mon,  8 Aug 2022 07:14:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 313C0C433C1;
	Mon,  8 Aug 2022 07:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659942858;
	bh=z78WHIQdXHrVOrRs7faqs/81GPwGysyQnC0rF3Zrr/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnJyG8SYNNni4w3KsVr/N5l95731l2hqbGnCmvtDv+rdY4Ih6ohf4HFBW3ZVd9ZvX
	 U7hodPcFC9KZJlvX+xq53WpU6iwCDGhsgTycoP6spsHxox0CCdIYCGbOPau4yh7WVa
	 uyWdC5htV3UM+iwaxeAvfxzbMwvz9WA6xqPtrSeUw0iq/Ec+LaLpkNHwvqsOvzE0EP
	 YZUJtRpuUbazXHXDwRTRF0DnIVUwaynbK+U8JG9qlQ8wZenFAXkRX0UwP47c+qSTYf
	 QM8q2ocdVXxaOvfEvAjQH+rvxE3Tz9L7YIPfZuAj6BlU+mtkVoE23bISTTOkndL1L/
	 WRCTWZzlzyX2A==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	shorne@gmail.com,
	conor.dooley@microchip.com
Cc: linux-csky@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V9 07/15] riscv: cmpxchg: Remove xchg32 and xchg64
Date: Mon,  8 Aug 2022 03:13:10 -0400
Message-Id: <20220808071318.3335746-8-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808071318.3335746-1-guoren@kernel.org>
References: <20220808071318.3335746-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_001419_399190_1B8CE044 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The xchg32 and xchg64 are unused, so remove them.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 12 ------------
 1 file changed, 12 deletions(-)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 67ab6375b650..567ed2e274c4 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -76,18 +76,6 @@
 	(__typeof__(*(ptr))) __xchg((ptr), _x_, sizeof(*(ptr)));	\
 })
 
-#define xchg32(ptr, x)							\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 4);				\
-	arch_xchg((ptr), (x));						\
-})
-
-#define xchg64(ptr, x)							\
-({									\
-	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
-	arch_xchg((ptr), (x));						\
-})
-
 /*
  * Atomic compare and exchange.  Compare OLD with MEM, if identical,
  * store NEW in MEM.  Return the initial value in MEM.  Success is
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
