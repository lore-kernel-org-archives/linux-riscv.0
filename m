Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E8BBC433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 10 Apr 2022 21:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82lh7LSb+/Jl+dZXhw9lMa1wRLflqcpD6SgLAzhV0Yo=; b=q51WZ+dQWXkX7l
	o1L2Dwphl9PR1mi1WQvqpHJu+QqNDt5aLTnT5jIR1HnyLRIYnHwDMonx4GqJcbALnlQyzRoSAQMtu
	T4AESjV+JP0FcWjOV/WPcGtPCnUxgx80UHIEkM1ROi+z88NB0GoFCoH3AjKSTv+bOvEnlIyO58/GQ
	5/GmLDH79i3ZxDj7CNn4E9EWNlK/33uX48LEZ+sKqaCo6UAaNCDb+D/+1t2mr2ciQHZXEG5qUKaO7
	cWpjZfQLH/FW0lu5qYNtVpZlVZFK1vLgQALK6jmjdKKD4kVnVKa4BqUTgliH21SL0I8u8M7UT3VeI
	aV2TRtk5KgC9a8GjtPYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ndfSU-005ans-OW; Sun, 10 Apr 2022 21:50:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ndfRx-005aWU-Vr; Sun, 10 Apr 2022 21:50:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 94ED160C49;
 Sun, 10 Apr 2022 21:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA2B4C385A1;
 Sun, 10 Apr 2022 21:50:21 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="mljTD4lD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649627421;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JyQJDqG7G7qoM6gKahWfWcpxoWg/Hr8hXOQQlij0UbM=;
 b=mljTD4lDHrPCpdKRHHsPWTFR14XiiWdhvN87TPRANPmZWfc+MO66VyuX/rXcSG22A4eyEP
 dnVOLtFaU6Sq0fucK3TI1wZEKw8xT1SKDR6YeAoPoyixF1BUW3rFAxNA+gC8iEtzcWxwSM
 5HC0l2Iwg27gXOb6sTJlPKYcF+fyEVo=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 2f5fc337
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Sun, 10 Apr 2022 21:50:20 +0000 (UTC)
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
Subject: [PATCH v2 02/11] timekeeping: use ktime_read_raw_clock() for
 random_get_entropy() if no get_cycles()
Date: Sun, 10 Apr 2022 23:49:42 +0200
Message-Id: <20220410214951.55294-3-Jason@zx2c4.com>
In-Reply-To: <20220410214951.55294-1-Jason@zx2c4.com>
References: <20220410214951.55294-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220410_145026_137591_A742B898 
X-CRM114-Status: GOOD (  15.22  )
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

In the event that a given arch does not define get_cycles(), falling
back to the get_cycles() default implementation that returns 0 is really
not the best we can do. Instead, at least calling ktime_read_raw_clock()
would be preferable, because that always needs to return _something_,
even falling back to jiffies eventually. It's not as though
ktime_read_raw_clock() is super high precision or guaranteed to be
entropic, but basically anything that's not zero all the time is better
than returning zero all the time.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Theodore Ts'o <tytso@mit.edu>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 include/linux/timex.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/timex.h b/include/linux/timex.h
index 56502b338287..4050f68c34cb 100644
--- a/include/linux/timex.h
+++ b/include/linux/timex.h
@@ -76,8 +76,14 @@ extern u64 ktime_read_raw_clock(void);
  *
  * By default we use get_cycles() for this purpose, but individual
  * architectures may override this in their asm/timex.h header file.
+ * If a given arch does not have get_cycles(), then we fallback to
+ * using sched_clock().
  */
+#ifdef get_cycles
 #define random_get_entropy()	((unsigned long)get_cycles())
+#else
+#define random_get_entropy()	((unsigned long)ktime_read_raw_clock())
+#endif
 #endif
 
 /*
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
