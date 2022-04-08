Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560A1C433EF
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Apr 2022 18:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XOdfMSrzG8KyJf7XiZOlZH3OUy6mK5PymJfXxqD+gr4=; b=D4glc3ZFSwxV3R
	f8/TA1O23sY036o38nMdSsBBvPTW2E6nrFdtLQQuiV50r8xUiycFS5RCVfCwzOQdHI64qkFf7DYes
	wujE/2ppaZssFn5MvLLANNxe33MoZodL9+uDodwylsrcc7c06piEHG57TZs2l1V0z6OJ6E9km+DVN
	PrK6euBWm6hp1JMSyxMs02LTmWcfIAEWr9IgNWSp7ecrYgveh8nXVRIXqWyzP9ujF5eZCmYrOdN65
	6p0tphQzpztmDeixr1NrzKURFucG48sIWsdD8v7QnCfTNP0NsKdR4yhPur1aJfids8Tkl46CCbrdK
	GLs+PSWrOHhfWNc/Nuiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nctIA-000tUE-KR; Fri, 08 Apr 2022 18:25:06 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nctGE-000rwP-2M; Fri, 08 Apr 2022 18:23:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 875A8B82CD7;
 Fri,  8 Apr 2022 18:23:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99E13C385A3;
 Fri,  8 Apr 2022 18:22:59 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="CLPULdzg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649442178;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=QhQ1HwDDQ0VBViTeG0LB+139Jo2Xk5438IuvpR3RiNg=;
 b=CLPULdzgGXJrwK4uCCHM7+j7CQPO/TnUdFHV8jGVPXt2oRPuFGfQuIGVwrwhQmuAXIEyIK
 +pMFaA2OsSQLAz2u75tmYrg486K8df6y/V/MHRdhzu90z8Dl9A4EKbCnoFVpvWCWqoNp4p
 IgJX3Y50X9yQA9wOGJqYKrd+/9+6GG8=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2adbe4d1
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Fri, 8 Apr 2022 18:22:58 +0000 (UTC)
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
Subject: [PATCH RFC v1 06/10] x86: use sched_clock() for random_get_entropy()
 instead of zero
Date: Fri,  8 Apr 2022 20:21:41 +0200
Message-Id: <20220408182145.142506-7-Jason@zx2c4.com>
In-Reply-To: <20220408182145.142506-1-Jason@zx2c4.com>
References: <20220408182145.142506-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220408_112306_446753_08FE1C99 
X-CRM114-Status: GOOD (  15.98  )
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

If CONFIG_X86_TSC=n, then it's possible that we're running on a 486 with
no RDTSC, so we only need the fallback code for that case.

Cc: Arnd Bergmann <arnd@arndb.de>
Cc: x86@kernel.org
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/x86/include/asm/tsc.h | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/x86/include/asm/tsc.h b/arch/x86/include/asm/tsc.h
index 01a300a9700b..b0c0b2b9e0f7 100644
--- a/arch/x86/include/asm/tsc.h
+++ b/arch/x86/include/asm/tsc.h
@@ -5,6 +5,7 @@
 #ifndef _ASM_X86_TSC_H
 #define _ASM_X86_TSC_H
 
+#include <linux/sched/clock.h>
 #include <asm/processor.h>
 #include <asm/cpufeature.h>
 
@@ -28,6 +29,16 @@ static inline cycles_t get_cycles(void)
 	return rdtsc();
 }
 
+static inline unsigned long random_get_entropy(void)
+{
+#ifndef CONFIG_X86_TSC
+	if (!boot_cpu_has(X86_FEATURE_TSC))
+		return sched_clock();
+#endif
+	return rdtsc();
+}
+#define random_get_entropy random_get_entropy
+
 extern struct system_counterval_t convert_art_to_tsc(u64 art);
 extern struct system_counterval_t convert_art_ns_to_tsc(u64 art_ns);
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
