Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C791C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 12:14:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PUWhgAD1+D+IDIwXzyiBqeWzQ5Eu8hfKKThoNvbt5dY=; b=fhR1ZoLP6yvp36
	JzpIgcXKLBfPLGtQlbHgBZI1qJ+SYAehLeSwLgUEQsz4ro3XGyY+GZ54n7FkJmva23LqNISDRImDs
	s2pppVqJrrikbP/7VfxNkM/uhzEuYPpf/iPqPB6ktEFC5CoWzjkuQGicuBllsDAOjq0BOVk9SyRaI
	oen2q+81FTmzL87nZwcTa844bNa681/Gk+8IH0c4BKjjYlRU93rp/hZa4sGoGwfG9B/SL6SAimq5C
	vWPbWwTjLFb+KQFpplU1i+Rney5ER+ID0u05h0RbAzaUWoZwc5TB/yVXH1wCS2Fy+euHtjTjWO0x4
	SX/coDqwU2jcKDmAjekw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8KST-00Bjqo-A5; Thu, 22 Dec 2022 12:13:57 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K49-00BWWm-7c; Thu, 22 Dec 2022 11:48:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709729; x=1703245729;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=DkmV3GJS9Tl7SCqcbYCFpqWizdAnQdaBoGDZyzrrlMs=;
  b=U0BmhAephbtLYyf0Vjz6msALEi6SYPY8giKxBYL6+m2y9mr+vNYTSCZi
   Z/vj+JFBLOSdLI4nKJ+DhnZ7m6IqIpV929IjZNKfePm0h5s18LIfWbbjZ
   wo5ac6rAINNCd9T/rYl4/aU5l3JdkMsv8JhgSEkXC2fB2jvFAOClWIVGO
   umFVzsfNbPH71v42mISt0w98Qz3plkmLQUhmFjchytxQWDlAZUt2pf926
   jinEYfu2JL6CEZKqzvHRClk85PNyb+LFKzS5soIUk3okqabwRYR7fJmAr
   yRw/ikvLSwKrJ82hmZOk57ilEsNdFiPJCu6zyHpjVwt1RC+PiUqABlsWO
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804834"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804834"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504846"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504846"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:48:42 -0800
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
Subject: [PATCH 14/19] arch/s390: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:30 +0100
Message-Id: <20221222114635.1251934-15-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034855_298689_4D44A9F0 
X-CRM114-Status: UNSURE (   9.90  )
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

__xchg will be used for non-atomic xchg macro.

Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
---
 arch/s390/include/asm/cmpxchg.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/cmpxchg.h b/arch/s390/include/asm/cmpxchg.h
index 84c3f0d576c5b1..efc16f4aac8643 100644
--- a/arch/s390/include/asm/cmpxchg.h
+++ b/arch/s390/include/asm/cmpxchg.h
@@ -14,7 +14,7 @@
 
 void __xchg_called_with_bad_pointer(void);
 
-static __always_inline unsigned long __xchg(unsigned long x,
+static __always_inline unsigned long __arch_xchg(unsigned long x,
 					    unsigned long address, int size)
 {
 	unsigned long old;
@@ -77,7 +77,7 @@ static __always_inline unsigned long __xchg(unsigned long x,
 	__typeof__(*(ptr)) __ret;					\
 									\
 	__ret = (__typeof__(*(ptr)))					\
-		__xchg((unsigned long)(x), (unsigned long)(ptr),	\
+		__arch_xchg((unsigned long)(x), (unsigned long)(ptr),	\
 		       sizeof(*(ptr)));					\
 	__ret;								\
 })
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
