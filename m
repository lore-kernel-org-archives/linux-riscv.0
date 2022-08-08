Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA846C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:14:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f1Blp/K0aZgUH3/p1VPeHo3iosdpnsWe7yt4p+DxQaY=; b=L4PK3iuJknepuI
	5CvXVvPb+5Th9PLTiMEXU5Bl6yd5htbW2eMPaOZnBJ6Mw5ct7ymM0QjIHgGa6u9xShuBOf2fnTc74
	RNVd9ZGOQ7iUtrwGogETRsFfqwCsDNQ9+hjDtENaQ8KQCvAazlQsAxuQ1S5qJlZzL5bzQbDGGYzya
	4g1cSyjqKr1UqmfDTjJ4wFk4n+pkRAAb3hlwbDxzutZcUS+FNRWSjLKlhDbB9mEPDhSnFlkbuIq8s
	lBfVHumWv2Wx5xhA6BnpyAfmiVgCSQSAfULM5VEKcw9D/vR6Z62K8WdK+7jp501mFmxgaL8cM2mpK
	rg/KZbSBTsyZl07HYNYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwy5-00C2Al-Ky; Mon, 08 Aug 2022 07:14:29 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwy2-00C27E-I1
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:14:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 2A17EB80E07;
	Mon,  8 Aug 2022 07:14:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC53EC433D7;
	Mon,  8 Aug 2022 07:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659942863;
	bh=CLonVkqPKNEwEB3qnFlqdH4Ppf6SvHvhKmodWZTZpYU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PuDuImkclhNbC6O6GNgnZxySgPcZGrdEUoOSbjm4ohK808vUD0GFt3aQfm7jIJZbL
	 U8IM3Rvxrm+dcREdZjLlVyAgVGgnVJwjtr7PXoX/20iKUWAREx5SR1D3NgL9h8x1CM
	 qXDQXiIfEiLMNDQRuIJ4DdRwB6Razsn2ZT0XsdJvXp+i1DpvkpvRAFibRiIw6mFgCY
	 GP7VDQzkM5UE9bOGsTT+Kootm5rBDslJ5POK7h/mGrhoEYQ+bU9EE9dZOzBmQ9tbqF
	 VgFRBnaGHKtgdr6lYtsnfv4y2hWxswjBIqZkZ6YxwVZEBm6wzNryjMvZsblUcOWllb
	 2MnQTsVjwL77w==
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
Subject: [PATCH V9 08/15] riscv: cmpxchg: Forbid arch_cmpxchg64 for 32-bit
Date: Mon,  8 Aug 2022 03:13:11 -0400
Message-Id: <20220808071318.3335746-9-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808071318.3335746-1-guoren@kernel.org>
References: <20220808071318.3335746-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_001426_747219_318C9768 
X-CRM114-Status: UNSURE (   9.10  )
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

RISC-V 32-bit couldn't support lr.d/sc.d instructions, so using
arch_cmpxchg64 would cause error. Add forbid code to prevent the
situation.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 567ed2e274c4..14c9280c7f7f 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -25,6 +25,7 @@
 			: "memory");					\
 		break;							\
 	case 8:								\
+		BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT));			\
 		__asm__ __volatile__ (					\
 			"	amoswap.d %0, %2, %1\n"			\
 			: "=r" (__ret), "+A" (*__ptr)			\
@@ -58,6 +59,7 @@
 			: "memory");					\
 		break;							\
 	case 8:								\
+		BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT));			\
 		__asm__ __volatile__ (					\
 			"	amoswap.d.aqrl %0, %2, %1\n"		\
 			: "=r" (__ret), "+A" (*__ptr)			\
@@ -101,6 +103,7 @@
 			: "memory");					\
 		break;							\
 	case 8:								\
+		BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT));			\
 		__asm__ __volatile__ (					\
 			"0:	lr.d %0, %2\n"				\
 			"	bne %0, %z3, 1f\n"			\
@@ -146,6 +149,7 @@
 			: "memory");					\
 		break;							\
 	case 8:								\
+		BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT));			\
 		__asm__ __volatile__ (					\
 			"0:	lr.d %0, %2\n"				\
 			"	bne %0, %z3, 1f\n"			\
@@ -192,6 +196,7 @@
 			: "memory");					\
 		break;							\
 	case 8:								\
+		BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT));			\
 		__asm__ __volatile__ (					\
 			"0:	lr.d %0, %2\n"				\
 			"	bne %0, %z3, 1f\n"			\
@@ -220,6 +225,7 @@
 #define arch_cmpxchg_local(ptr, o, n)					\
 	(__cmpxchg_relaxed((ptr), (o), (n), sizeof(*(ptr))))
 
+#ifdef CONFIG_64BIT
 #define arch_cmpxchg64(ptr, o, n)					\
 ({									\
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
@@ -231,5 +237,6 @@
 	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
 })
+#endif /* CONFIG_64BIT */
 
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
