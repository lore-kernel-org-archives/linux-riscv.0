Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63796C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Apr 2022 17:36:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjXqQleSMa5CCB6WPb7I5m5SsnQm4pRHl2chOfcMMgs=; b=vLbwNeLtKbzRUj
	SEhhlUHnRfneuBB3zfcgcYFhnx/rkLdnrLzYNNu33r+7pSsd38Qmp477zMxc1nhu0DClJeK7K1lvn
	EuJJ4o7/lFwgY/UxXtMOHyrAR1YeahIHQm778X9JDFXvmShGnvO6MjAeHO8zTo29kQQ/jYu/O21B+
	jSHq5Pg8HlAwQ9AJhJbnAqsOSrWTrH4nGRceqGlYDuVEz9zk//uJFjWx7r4B9r5xy97gGyD15wadx
	4iaaZwumECnt2v/fa3/2dJ9cPUyU19aZTWPT/cOUwmrjdCYk5vNQ9P+dBZvewiwmz+A4sfS9i6wPi
	0BICiiKrbznNBSeQN4Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1neKQy-00FHCj-Iv; Tue, 12 Apr 2022 17:36:08 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1neKKt-00FDu7-8S; Tue, 12 Apr 2022 17:29:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DEF8AB81F5F;
 Tue, 12 Apr 2022 17:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 469EBC385AA;
 Tue, 12 Apr 2022 17:29:45 +0000 (UTC)
Authentication-Results: smtp.kernel.org;
 dkim=pass (1024-bit key) header.d=zx2c4.com header.i=@zx2c4.com
 header.b="Vof7oTMJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=zx2c4.com; s=20210105; 
 t=1649784584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IHzRJmPvA7OgZjJx+ZTbqcYHIM/uCZIijqXsNo6FZ2U=;
 b=Vof7oTMJysi9826NZ4wlTUzj07MRSpSZZLRNThVcodnHpNfVYD9AbgGScQ4b9YIr68xe13
 pllwAUZ1aN8ajP631O+A2iZ/DS5Ii+7ZBpv+IhUqlhiWGaqgjObm2n7g7XVrH8Qvn+P1S5
 K9LhwsoVl2jT/V71ZNOjmtwbBy150So=
Received: by mail.zx2c4.com (ZX2C4 Mail Server) with ESMTPSA id 8bae4d27
 (TLSv1.3:AEAD-AES256-GCM-SHA384:256:NO); 
 Tue, 12 Apr 2022 17:29:43 +0000 (UTC)
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
Subject: [PATCH v3 04/10] mips: use fallback for random_get_entropy() instead
 of zero
Date: Tue, 12 Apr 2022 19:27:48 +0200
Message-Id: <20220412172754.149498-5-Jason@zx2c4.com>
In-Reply-To: <20220412172754.149498-1-Jason@zx2c4.com>
References: <20220412172754.149498-1-Jason@zx2c4.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220412_102951_592638_24B6DF7E 
X-CRM114-Status: GOOD (  17.29  )
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
Instead, at least calling random_get_entropy_fallback() would be
preferable, because that always needs to return _something_, even
falling back to jiffies eventually. It's not as though
random_get_entropy_fallback() is super high precision or guaranteed to
be entropic, but basically anything that's not zero all the time is
better than returning zero all the time.

Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Signed-off-by: Jason A. Donenfeld <Jason@zx2c4.com>
---
 arch/mips/include/asm/timex.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/mips/include/asm/timex.h b/arch/mips/include/asm/timex.h
index b05bb70a2e46..abc60a6395e3 100644
--- a/arch/mips/include/asm/timex.h
+++ b/arch/mips/include/asm/timex.h
@@ -94,7 +94,7 @@ static inline unsigned long random_get_entropy(void)
 	else if (likely(imp != PRID_IMP_R6000 && imp != PRID_IMP_R6000A))
 		return read_c0_random();
 	else
-		return 0;	/* no usable register */
+		return random_get_entropy_fallback();	/* no usable register */
 }
 #define random_get_entropy random_get_entropy
 
-- 
2.35.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
