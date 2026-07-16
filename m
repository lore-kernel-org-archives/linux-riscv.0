Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5B5EC44501
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 05:34:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PWsPrThdOHl5DHn7r9U/9XgBhTMQUt4uleqdTKeRXVk=; b=DKPpF2wJM9FRew
	VzCO1Ac2m7wCgcccO1qC9tMmJmtT2q/KK+Tpz5ZxsGXB8VTUwkgYY6JDPdxwPV48bL6i6GGlRS/XD
	kBFYGWwTiC7Nnkk+T6pIc9EbBeK4BJPrieLFrBoZegOohXky5lVILCMxz6M+4g4dgD4M+mOkXvMqn
	7dQu3DDz/Vx+HtMXLP/GR66wtIjaFGyKcKf9IwzIzaalK8jAZSnFdm/Os+1ib0lE/rWBnnCaQOTg/
	G8Bu2iLdbcWjIq8sN4DGv7Ju5xR4844emEiDKrIfEjQ+27d/3RXjfOW8BrkmYNqM9jHMRqi6RQQvl
	NWcu7OZYy1kvaLnrZjXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEjJ-0000000GTlF-2aHK;
	Thu, 16 Jul 2026 05:33:53 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkEjG-0000000GTid-2yG0
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 05:33:52 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1784180011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mg3nTgYwXyWhy++IW/BUraB5RyAXTd+3PP9tGBp6bEA=;
	b=khdTYKRCKNphPkwp+sMx9U0V79QhChBSwT36G+Lcs1+e/3KovqC55Zjef3YJ9XbSccXN36
	8xu1aNQGrcFZ1c0Zxzx5A4qkmpAKgHffF5UaTzG2oElYkC72J1ES0A+NxFTZc9QYgnYY5C
	v2GxRAqk9GTKkO/DCnGRh3WVzsPTbb4sYa+N/tR9m6WOw6O5VCxBRV8RjoICuFbopQryfa
	LDSsifemEd30TjF5owxXy7t0GXpR95uimeihg/ddP1Ydlhg4Ic+V9CrBpkvtUFu1WMoNlm
	IpDWQJSMV6ZodrULDl4DYj35eNTCo4477j/SEqBNr6cX7YTKdtC3j+dQDpoIsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1784180011;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Mg3nTgYwXyWhy++IW/BUraB5RyAXTd+3PP9tGBp6bEA=;
	b=ZOk0FZc7zaWr8jLGN/sZkX5J/zdfWVAlyTYvZjkJoRclBh8H0epJb8uGizSrBu0SEO7APz
	uliT2cZTD358irCA==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: time: Add missing __iomem in get_cycles() and get_cycles_hi()
Date: Thu, 16 Jul 2026 07:33:19 +0200
Message-ID: <20260716053319.2178937-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_223350_896551_0629930B 
X-CRM114-Status: UNSURE (   8.17  )
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

__iomem is missing while calling readl_relaxed() in get_cycles() and
get_cycles_hi() and sparse complains.

Add __iomem to silence the sparse warnings.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202607160619.14G8GHp5-lkp@intel.com/
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/include/asm/timex.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/timex.h b/arch/riscv/include/asm/timex.h
index a06697846e69..d41acfb3959d 100644
--- a/arch/riscv/include/asm/timex.h
+++ b/arch/riscv/include/asm/timex.h
@@ -22,13 +22,13 @@ static inline cycles_t get_cycles(void)
 #else /* !CONFIG_64BIT */
 static inline u32 get_cycles(void)
 {
-	return readl_relaxed(((u32 *)clint_time_val));
+	return readl_relaxed(((u32 __iomem *)clint_time_val));
 }
 #define get_cycles get_cycles
 
 static inline u32 get_cycles_hi(void)
 {
-	return readl_relaxed(((u32 *)clint_time_val) + 1);
+	return readl_relaxed(((u32 __iomem *)clint_time_val) + 1);
 }
 #define get_cycles_hi get_cycles_hi
 #endif /* CONFIG_64BIT */
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
