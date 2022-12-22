Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E539BC4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 12:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SSWFxypKeG9S1QLd1mosRuaVV3M6iQObLp3wmQ1pjsY=; b=cA2YnRsGGNsViC
	UGUqEKOZcRVJPnQRgMk75Bw5nYi/wPrBg9tr0hSzxZY+9jL/yOc7i1zIKw1j71v07QXfjOp8Kwx8Y
	mZ+tT4KbMdS01qAUI+N0dZ9uZp7rNpmT9qykfqnWMW4w8s93mshP1M+6HNahkBVfhR63SNHme0Ig3
	iUiNDql3WcRoHGJ5qRV15YSN1mghKZnCL0r+isVuKH+4ms7bN6oACgPv0MjDAOzmc3EZcS8WcnvnF
	u7BfU9DENRE6JlNqrTK2C7S2jj3LwXjkUqM/Ey6lml0zmCaIezUdjn47b6EArPEXT3puZeTvO7+cy
	/Q70lUXZDaD/cztfdGMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KgH-00Br1Y-15; Thu, 22 Dec 2022 12:28:13 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K3T-00BWWm-1f; Thu, 22 Dec 2022 11:48:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709687; x=1703245687;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=HqehGh0ckEYfFGXBXebYCNsma95awkbnu5950FMjD0o=;
  b=hapVsBVpNxXESnwSl6R41uwfyC8I2TCoBQ8PbUCDjIkicJYqOUOrnxys
   +cU7XIetp+KjCqIuc7ZvR6UsXr2md/3/0vbpsxHvCFKWeA6R+Yzj4vF7F
   WB0/ycDj+whNIc2jmmbGCtX0njBArmZtjg0a6SovyfKdCcYYzCWT5qDuQ
   RZqld9t7wYlGlzNqToVZS/lVbmwvRrZGJJfr37I9BIhTdMKiWgx0LLKST
   bIGJy709zIYEe9AVl1cDo6F7lQ5xFtgjfIJmZyprZ2GAUbfLJU1eNVdth
   //+YfWiKZDesc/kHWuvgIsgACiUpToBKudrumsDSthNQNAD3KBc0pCSND
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804627"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804627"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504660"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504660"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:00 -0800
From: Andrzej Hajda <andrzej.hajda@intel.com>
To: linux-alpha@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-snps-arc@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-hexagon@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	openrisc@lists.librecores.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 07/19] arch/loongarch: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:23 +0100
Message-Id: <20221222114635.1251934-8-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034807_183191_54CFB785 
X-CRM114-Status: GOOD (  10.35  )
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

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/loongarch/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/loongarch/include/asm/cmpxchg.h b/arch/loongarch/include/asm/cmpxchg.h
index ecfa6cf79806e6..979fde61bba8a4 100644
--- a/arch/loongarch/include/asm/cmpxchg.h
+++ b/arch/loongarch/include/asm/cmpxchg.h
@@ -62,7 +62,7 @@ static inline unsigned int __xchg_small(volatile void *ptr, unsigned int val,
 }
 
 static __always_inline unsigned long
-__xchg(volatile void *ptr, unsigned long x, int size)
+__arch_xchg(volatile void *ptr, unsigned long x, int size)
 {
 	switch (size) {
 	case 1:
@@ -87,7 +87,7 @@ __xchg(volatile void *ptr, unsigned long x, int size)
 	__typeof__(*(ptr)) __res;					\
 									\
 	__res = (__typeof__(*(ptr)))					\
-		__xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
+		__arch_xchg((ptr), (unsigned long)(x), sizeof(*(ptr)));	\
 									\
 	__res;								\
 })
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
