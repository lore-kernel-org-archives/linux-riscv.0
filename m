Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F07D7C4332F
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Dec 2022 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Btrz6CxdtHWfX+r4VUzlU7Vnk5/1RlmLltsgOCEp6l8=; b=T7OuZaqlBL/rzN
	A0A9LJO+oxm3/mgpfFVJ9pBvEo+EO882cuNWCh0JUkZpNIuaBunvoPOwc00/UN5orRCgR1vB2VtZn
	aayLn5/b7i9Jp+ty4lZxlLiLClTE5kvcfxVybFTcY1uBAmzZoD+30KmJMbO1EwYMSpxpTGD2kFZAl
	vuS00v545igN0KFja8IoDSItw6ftjjXSbzKmEHbrFhStroF7aCf+jeg2Cz3/vfyjbctv4d70OkOLK
	NY/Xo15bWCreL29SfPhCO8vqu95gJJWMnamFI9MTsuvSbLrZ+tUGUcXf9GaV17QFhbKhRDhjy6JwI
	UxC2gZjf8DCgc7GgRpXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8Kfd-00BqcB-Ck; Thu, 22 Dec 2022 12:27:33 +0000
Received: from mga04.intel.com ([192.55.52.120])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p8K3H-00BWTX-D7; Thu, 22 Dec 2022 11:47:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1671709675; x=1703245675;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Ny1bXKB2lDS7ORqsLpbz2Aii9/RWYD0L24Yi6PLk6aE=;
  b=mL5mmHGPzxXtiEbuGu4JfDwqQHiBT8sjfdAQbtFnrhOF5lSjD/uU4ntc
   njP/60KtF9G4YDcMileACtoFRFNN2S1MOdp7D7yCZCCIDyw6pyQ9nMQCl
   b44QojejGjDKtzpMHZcMiqa0Laat7WceBH+IReaFFEuLEp2cANV+PZs/d
   PrCUoRxDN9ZBNTnbn1Edq5lexr7dpt6isxJGBQ8z7FZCVTrJ1+/7AlRxG
   GISlQdmCiQ6KJqSA2qlQI1pbpL1rKlAO+M1tFS+prPALNLsiFoK7JnSG3
   8+zylmeS5+t4gv0N8sRNr4Jh3aAGCHN3URl5RI/K3jTPBl1fZi2oRiQ5B
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="318804579"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="318804579"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:54 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10568"; a="629504515"
X-IronPort-AV: E=Sophos;i="5.96,265,1665471600"; 
   d="scan'208";a="629504515"
Received: from lab-ah.igk.intel.com ([10.91.215.196])
  by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Dec 2022 03:47:48 -0800
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
Subject: [PATCH 05/19] arch/hexagon: rename internal name __xchg to __arch_xchg
Date: Thu, 22 Dec 2022 12:46:21 +0100
Message-Id: <20221222114635.1251934-6-andrzej.hajda@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221222114635.1251934-1-andrzej.hajda@intel.com>
References: <20221222114635.1251934-1-andrzej.hajda@intel.com>
MIME-Version: 1.0
Organization: Intel Technology Poland sp. z o.o. - ul. Slowackiego 173, 80-298 Gdansk - KRS 101882 - NIP 957-07-52-316
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221222_034755_743008_F512F0F5 
X-CRM114-Status: GOOD (  10.86  )
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
 arch/hexagon/include/asm/cmpxchg.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/hexagon/include/asm/cmpxchg.h b/arch/hexagon/include/asm/cmpxchg.h
index cdb705e1496af8..92dc5e5f836f3b 100644
--- a/arch/hexagon/include/asm/cmpxchg.h
+++ b/arch/hexagon/include/asm/cmpxchg.h
@@ -9,7 +9,7 @@
 #define _ASM_CMPXCHG_H
 
 /*
- * __xchg - atomically exchange a register and a memory location
+ * __arch_xchg - atomically exchange a register and a memory location
  * @x: value to swap
  * @ptr: pointer to memory
  * @size:  size of the value
@@ -19,7 +19,7 @@
  * Note:  there was an errata for V2 about .new's and memw_locked.
  *
  */
-static inline unsigned long __xchg(unsigned long x, volatile void *ptr,
+static inline unsigned long __arch_xchg(unsigned long x, volatile void *ptr,
 				   int size)
 {
 	unsigned long retval;
@@ -42,7 +42,7 @@ static inline unsigned long __xchg(unsigned long x, volatile void *ptr,
  * Atomically swap the contents of a register with memory.  Should be atomic
  * between multiple CPU's and within interrupts on the same CPU.
  */
-#define arch_xchg(ptr, v) ((__typeof__(*(ptr)))__xchg((unsigned long)(v), (ptr), \
+#define arch_xchg(ptr, v) ((__typeof__(*(ptr)))__arch_xchg((unsigned long)(v), (ptr), \
 	sizeof(*(ptr))))
 
 /*
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
