Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3C1AC7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 17:16:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=RD+KE1UpP+0cKYHAE6hhVy4K/XHzzLbd8BMnllMMWUI=; b=dnUq70tGUi2a6r
	8DjS5WcXqJbq6Omb1XAoBoe7Z9SBRgYNZVe9xAllfTT/UENzIshShQZ2jq8HW/gfLFxZfnzjRYUKc
	bGTs1z4a7etnBIlc+ICdjZB1UWO8z76gfdEtVMIoEUtZ11BZ8OxDS/qrq0G6i1LW5t4jsELQ/5s33
	UAzg0/w1AGd2Db8GEkof8M7HR+quNwMCAzWgbCgh2a94BqBsXeRU7pa0M7ZFRieFn0PozYzExvGFg
	lMeth3yeVdrSwcNVrEouBwXQTH3J0HU/fYYKBBqUwG41+uEk10/RA/nBDxhDaCtXuko5TorwEHabt
	Ha50UHRzoNNfAe8Hn9XA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIsS-0000000Dm5P-2H1b;
	Thu, 19 Jun 2025 17:16:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHfU-0000000DacZ-12g7
	for linux-riscv@bombadil.infradead.org;
	Thu, 19 Jun 2025 15:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=YJRIKqq5GC/lr+opxe5M1YFNp8xB8Hupy6OYrK1o2zw=; b=IWY2/StK7Rp0Ij+hQDW8qcq+OB
	K40KcLhddCwW3BfvyIeaqWuLFnH0UvSFmqF9QTE39de028vtDmtCeTMv+aPJ6TiBpiAa7Enby3aqq
	JZpXWKT1vCyynboKz+Q2rgURl81/5MxDMrpiXK0DNoIrBiow6mzwnUUqgSPD4BM6pRCvnDyXedcm3
	TwuFzG+W/XXm/EOCOn/qAbQgQL0BUwqobqTd8C/nWDQuhl6stxmcsVkEMBXszBKGZN1cQMQxaxwW5
	IhGvlJPB9STMvgWbb6tpizvjUerL9sS6Ajo/KR8L/aX5xH/MNOanUdK0naz18Sd9kZZg3ZLxlfI0V
	AiA/GsIw==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHfR-00000004TDn-2IWt
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 15:59:11 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1750348745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YJRIKqq5GC/lr+opxe5M1YFNp8xB8Hupy6OYrK1o2zw=;
	b=zWgFbHt6aweg/7iDtk6+ko0Z8F5Co4l3dhUabpL6EQHm1wBxMwsF1umOC7dyLWhBkOf9pe
	rNv3Tq69H7PKgM+Mo3sxxPP6KOU5dfxdrlmDLWrET7UQLIcE8pMeBLMfKYOlCJ6IobgoaG
	C3oR4sG1Qyeybf/9FvuO4uxGQKO4bYLSzy3HtX21YKLzj2w1VnNLpJuKHUd3Id1KrRk+cS
	hkNaHdnTfc5ARJJCmYd1oV6eswoqSybukTxr1gx2OL8GcNAtBpwMVZQ3oZX4tQn4BwSU2e
	7tHraqirWytWtIpHPMr2os/7+QF7vZYrs0AkRYeXS2XJ9fGnE0HzRqOiyEXHBA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1750348745;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YJRIKqq5GC/lr+opxe5M1YFNp8xB8Hupy6OYrK1o2zw=;
	b=t7gTRwGLsSMLFoGSgxG9WxTGmlTlrcUy0QLyomzN3PfdAcTmX1a5uMp1yvcX5V51qu14pI
	ogUbCQDvwayDZaDQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	rtm@csail.mit.edu,
	stable@vger.kernel.org
Subject: [PATCH] Revert "riscv: Define TASK_SIZE_MAX for __access_ok()"
Date: Thu, 19 Jun 2025 17:58:58 +0200
Message-Id: <20250619155858.1249789-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_165909_774472_4BD7E8AA 
X-CRM114-Status: UNSURE (   7.74  )
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

This reverts commit ad5643cf2f69 ("riscv: Define TASK_SIZE_MAX for
__access_ok()").

This commit changes TASK_SIZE_MAX to be LONG_MAX to optimize access_ok(),
because the previous TASK_SIZE_MAX (default to TASK_SIZE) requires some
computation.

The reasoning was that all user addresses are less than LONG_MAX, and all
kernel addresses are greater than LONG_MAX. Therefore access_ok() can
filter kernel addresses.

Addresses between TASK_SIZE and LONG_MAX are not valid user addresses, but
access_ok() let them pass. That was thought to be okay, because they are
not valid addresses at hardware level.

Unfortunately, one case is missed: get_user_pages_fast() happily accepts
addresses between TASK_SIZE and LONG_MAX. futex(), for instance, uses
get_user_pages_fast(). This causes the problem reported by Robert [1].

Therefore, revert this commit. TASK_SIZE_MAX is changed to the default:
TASK_SIZE.

This unfortunately reduces performance, because TASK_SIZE is more expensive
to compute compared to LONG_MAX. But correctness first, we can think about
optimization later, if required.

Reported-by: <rtm@csail.mit.edu>
Closes: https://lore.kernel.org/linux-riscv/77605.1750245028@localhost/
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: stable@vger.kernel.org
---
 arch/riscv/include/asm/pgtable.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 438ce7df24c39..5bd5aae60d536 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -1075,7 +1075,6 @@ static inline pte_t pte_swp_clear_exclusive(pte_t pte)
  */
 #ifdef CONFIG_64BIT
 #define TASK_SIZE_64	(PGDIR_SIZE * PTRS_PER_PGD / 2)
-#define TASK_SIZE_MAX	LONG_MAX
 
 #ifdef CONFIG_COMPAT
 #define TASK_SIZE_32	(_AC(0x80000000, UL) - PAGE_SIZE)
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
