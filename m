Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230C8C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 21:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ht7ls/ZSvkjpBPCNnzgLbJs258YUILZxzQKwlkpARE0=; b=Y6jOsXJ5uMoCxI
	z0FHAGjzxszKkulEbiH3GatqBWPmhltMITanxAvjGh90NoYxZt0Ur/weUBLwchOlOTySFXn2eFuEk
	xmvEFXav7kJU7RzpyYG2XW/kRvWeGB8eTBCt2LbWJKst8ri0bvbG779obtDXazAT8ixzz5Wcc9pi9
	bScLvl7uts+8aN7yxxo8jN7z3nL1sRakJVCXQsuO6AeO5i+lY2NcYD+ydIkozjdHPyje2hFsAphLE
	lgT5sWRZeK99jUM3ClFk6VK1meilF5680WnArLvlvOQA3mlfDMyKC2PHsk/2P1pdColRy579kI95R
	FXyMoFr1SzlLvbzNYl5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndfS4-005aYg-4Y; Sun, 10 Apr 2022 21:50:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndfRt-005aUS-6Q; Sun, 10 Apr 2022 21:50:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 11B7560C88;
 Sun, 10 Apr 2022 21:50:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31778C385AD;
 Sun, 10 Apr 2022 21:50:16 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="N/kh/3mi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649627415;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eCzcuPEAsFfV3KQBApenUVcgAqREPhA7I39P+jrbFEE=;
 b=N/kh/3milYkWfElQYLj5pol3Zh+yt3dFFaR1x4WN1G+GoRTaYgzUaCgs450uGUV/NmfpD7
 fkbxjgPP/06fQeOc7+8NwwwXXk5PmfxvA+cloaTCbOIZrghQ2mom6zXVxWpLwE7PtdE9mv
 znqG4O0+VAQldUpD/4+kP4jcicb1oPk=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id e822035e
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 10 Apr 2022 21:50:15 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org,
 tglx@linutronix.de, arnd@arndb.de
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Theodore Ts'o <tytso@mit.edu>,
 Dominik Brodowski <linux@dominikbrodowski.net>,
 Russell King <linux@armlinux.org.uk>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 "David S . Miller" <davem@davemloft.net>,
 Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>,
 Johannes Berg <johannes@sipsolutions.net>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, Dinh Nguyen <dinguyen@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-m68k@lists.linux-m68k.org,
 linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
 sparclinux@vger.kernel.org, linux-um@lists.infradead.org, x86@kernel.org,
 linux-xtensa@linux-xtensa.org
Subject: [PATCH v2 01/11] timekeeping: add accessor for raw clock
Date: Sun, 10 Apr 2022 23:49:41 +0200
Message-Id: <20220410214951.55294-2-Jason@zx2c4.com>
In-Reply-To: <20220410214951.55294-1-Jason@zx2c4.com>
References: <20220410214951.55294-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_145021_363178_32BA3D5B 
X-CRM114-Status: GOOD (  15.56  )
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

This provides access to whichever time source has the highest frequency,
which is useful for gathering entropy on platforms without available
cycle counters. It's not necessarily as good as being able to quickly
access a cycle counter that the CPU has, but it's still something, even
when it falls back to being jiffies-based.

It's defined in linux/timex.h rather than linux/timekeeping.h, because
the latter cannot be included easily from asm/ headers, and generally
shouldn't be used outside of this rather narrow purpose. It's a ktime
function, but it's not the usual ktime API.

Suggested-by: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 include/linux/timex.h     | 2 ++
 kernel/time/timekeeping.c | 8 ++++++++
 2 files changed, 10 insertions(+)

diff --git a/include/linux/timex.h b/include/linux/timex.h
index 5745c90c8800..56502b338287 100644
--- a/include/linux/timex.h
+++ b/include/linux/timex.h
@@ -62,6 +62,8 @@
 #include <linux/types.h>
 #include <linux/param.h>
 
+extern u64 ktime_read_raw_clock(void);
+
 #include <asm/timex.h>
 
 #ifndef random_get_entropy
diff --git a/kernel/time/timekeeping.c b/kernel/time/timekeeping.c
index dcdcb85121e4..0d04d2e8b94b 100644
--- a/kernel/time/timekeeping.c
+++ b/kernel/time/timekeeping.c
@@ -939,6 +939,14 @@ ktime_t ktime_get_raw(void)
 }
 EXPORT_SYMBOL_GPL(ktime_get_raw);
 
+/**
+ * ktime_read_raw_clock - Returns the raw clock source value
+ */
+u64 ktime_read_raw_clock(void)
+{
+	return tk_clock_read(&tk_core.timekeeper.tkr_mono);
+}
+
 /**
  * ktime_get_ts64 - get the monotonic clock in timespec64 format
  * @ts:		pointer to timespec variable
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
