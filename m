Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5C3C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 18:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Er9bUc9FG6m4IvYa0g88k/YaMBi95Ui9zvmS0REVlPc=; b=lJf1L9CaK2i+zn
	cq4JDJ3mFhJwb+IA1hBtkp4Ad5TOUFKFKmShAIgSG3Hjx6tfAUooUJK6LmYYdeLqj0gyqpbCjEoE1
	Mk+bYVQUuwfhxzrY6xZD8T+1TNR9u2ZHhFnUxKmwcOw7ekp5wJM3tgS6LrgU/OgPWu48/oQCKtCLb
	+qS2558kSa4uYmE72TEd3aWuIVjFNbuluG1Yc/6n2sNX7ZW2TBt3IT7RdB9qCfGT17mEd235Ti2NR
	K2E66++DTLIQ1ZjYJAohnNXL82U3ker/F5p9CWcQTumoWltlWondb+XKtLme1OhBqbZSFgE07BUPb
	nL0ciR62Xwdu0fX+ZnsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nctIo-000tuk-H6; Fri, 08 Apr 2022 18:25:46 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nctGL-000s1v-T8; Fri, 08 Apr 2022 18:23:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 8413EB82CDE;
 Fri,  8 Apr 2022 18:23:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96180C385A3;
 Fri,  8 Apr 2022 18:23:07 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="bHvsH7he"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649442186;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=78dSRR6cg4Cb6xE6wzqZl0y3T/C5RqbL9OTQfhaSus0=;
 b=bHvsH7heTJ22wd9kOVkjQRjB8qxqDYb0Neo0BG7ETnElqZmWD+KvzZiWfTFZwr1zQmUbC5
 XXdPLoX/hfqwadSYoHEgXfmb2MBW+rOO7AO7VyqUuq9QbfjjauYGlTUsreemS7BXRmsC9S
 aoLAL9JjFgYgrOUBP32exCl+fVMfezY=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2a1ba7e8
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 8 Apr 2022 18:23:06 +0000 (UTC)
From: "Jason A. Donenfeld" <Jason@zx2c4.com>
To: linux-kernel@vger.kernel.org, linux-crypto@vger.kernel.org, arnd@arndb.de
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
 Johannes Berg <johannes@sipsolutions.net>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H . Peter Anvin" <hpa@zytor.com>, Chris Zankel <chris@zankel.net>,
 Max Filippov <jcmvbkbc@gmail.com>, John Stultz <john.stultz@linaro.org>,
 Stephen Boyd <sboyd@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org,
 linux-um@lists.infradead.org, x86@kernel.org, linux-xtensa@linux-xtensa.org
Subject: [PATCH RFC v1 07/10] arm64: use sched_clock() for
 random_get_entropy() instead of zero
Date: Fri,  8 Apr 2022 20:21:42 +0200
Message-Id: <20220408182145.142506-8-Jason@zx2c4.com>
In-Reply-To: <20220408182145.142506-1-Jason@zx2c4.com>
References: <20220408182145.142506-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_112314_271522_5493F781 
X-CRM114-Status: GOOD (  15.27  )
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

In the event that random_get_entropy() can't access a cycle counter or
similar, falling back to returning 0 is really not the best we can do.
Instead, at least calling sched_clock() would be preferable, because
that always needs to return _something_, even falling back to jiffies
eventually. It's not as though sched_clock() is super high precision or
guaranteed to be entropic, but basically anything that's not zero all
the time is better than returning zero all the time.

If CONFIG_ARM_ARCH_TIMER=n, then get_cycles() will return 0, so we only
need the fallback code for that case.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/arm64/include/asm/timex.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/include/asm/timex.h b/arch/arm64/include/asm/timex.h
index cf59ce91b22d..bfebd2e1ce45 100644
--- a/arch/arm64/include/asm/timex.h
+++ b/arch/arm64/include/asm/timex.h
@@ -13,6 +13,15 @@
  */
 #define get_cycles()	arch_timer_read_counter()
 
+#ifndef CONFIG_ARM_ARCH_TIMER
+/*
+ * The default implementation of random_get_entropy() calls get_cycles(),
+ * which will return 0 if CONFIG_ARM_ARCH_TIMER=n, so we fall back to
+ * sched_clock() here. Not a great situation, but better than nothing.
+ */
+#define random_get_entropy() ((unsigned long)sched_clock())
+#endif
+
 #include <asm-generic/timex.h>
 
 #endif
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
