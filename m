Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44FF3C433F5
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 18:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VjH1TvRBx9R72K3r4g5r5cOQ1110fU2Hq3C0Az0kYRs=; b=U5cKJvhca2Py4u
	X11qz62s+mlwqUt+0eH8DTWAU2o/g8Tdb/Od9UHLveMtk+J9rrDnKYjphF7I784Z2mkySe+34ng7t
	P63Qa4mRvVl92xmEw0NnGMMRK5L4qGgSuJbeuGclQneu4rGd/i5J+TtZULGILK5tNthgaGiAkQ6wB
	sjPq2dba5MQ+dt0Mhll51XwvWVQ5Pg9OAJlRY5w2ljqqtPBCTRW8eAMXU+6pSmae6VMfaw96utIeS
	RPKUcMhpM8iV7OCvQTUAH3y2LLaz1bD1KN9ZBnwF+GifTJdyZVhXN4JaQlMyt1rLXl2/zyL2GUz0u
	Nnui1obbW29iFNXN0sCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nctHe-000t6x-Jm; Fri, 08 Apr 2022 18:24:34 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nctG6-000rqT-0t; Fri, 08 Apr 2022 18:22:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 99B97B82CDC;
 Fri,  8 Apr 2022 18:22:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3572C385A1;
 Fri,  8 Apr 2022 18:22:51 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="G6BU8Ywm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649442170;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jfm/+0nZe/a0gZ1BVOi1xoOTd0LXu2XtqvwNu5ICWks=;
 b=G6BU8YwmryDS1gmWE+VsSKq/CaivlVVRO+4FBmjCGpVgAiTEzz4rBGY2zrzrcC6JvcSxxJ
 QBlo+NeO6cN98+dyhw52GgoZFCETJXKA3Zs612fg5YoJ6Q03UdzN8+K83P/PaMf7MKK1nJ
 Bi7Y4m7JizYUQvonoKB619aaE5aOiKI=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id c108eea7
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 8 Apr 2022 18:22:50 +0000 (UTC)
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
Subject: [PATCH RFC v1 05/10] arm: use sched_clock() for random_get_entropy()
 instead of zero
Date: Fri,  8 Apr 2022 20:21:40 +0200
Message-Id: <20220408182145.142506-6-Jason@zx2c4.com>
In-Reply-To: <20220408182145.142506-1-Jason@zx2c4.com>
References: <20220408182145.142506-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_112258_368993_9CA85B9F 
X-CRM114-Status: GOOD (  14.62  )
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

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Russell King <linux@armlinux.org.uk>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/arm/include/asm/timex.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/include/asm/timex.h b/arch/arm/include/asm/timex.h
index 7c3b3671d6c2..1c51580ee55d 100644
--- a/arch/arm/include/asm/timex.h
+++ b/arch/arm/include/asm/timex.h
@@ -9,7 +9,18 @@
 #ifndef _ASMARM_TIMEX_H
 #define _ASMARM_TIMEX_H
 
+#include <linux/sched/clock.h>
+
 typedef unsigned long cycles_t;
 #define get_cycles()	({ cycles_t c; read_current_timer(&c) ? 0 : c; })
 
+static inline unsigned long random_get_entropy(void)
+{
+	unsigned long ret = get_cycles();
+	if (ret)
+		return ret;
+	return sched_clock();
+}
+#define random_get_entropy random_get_entropy
+
 #endif
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
