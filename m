Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABC9DF44850
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Apr 2026 12:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Subject:Cc:To:
	From:Message-ID:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
	List-Owner; bh=kX5bUhLBVsgyJXnlMsdSCO4iPRLwgKXPi6D5OiaFlo8=; b=2exH7+SDLaaNG5
	RR0KXaMvHnG826kKsDWCULnoDH+bqqTpUgW88KkvDAZQgKJTWhzicSfE+qnNmeGMZ4BGKn7PrnpmX
	NV7OjbDTkxUsjfaL/kv8phraFsWJVT7LxJG0ogGvAG08GuUuginIjXFAaI6kuzthog3jCQebCaKSa
	zdahKi758EpsNQhAU1VQehBuTdUZ2z5abVQ38zxyF0iw0iHw81Zrc9ffbFgSSPDMTGV5Y0E9LHNTE
	xE/Pz0fHYE5K5PTUX7R1XcMC9hyD/PuLWI4zXr3gEXmBz+i2W5IGftm6RHwZ70r62OTYNcydnuOf9
	ugJSM+mDWH/BTCiIEXLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAq7-0000000CAdv-3Rg4;
	Fri, 10 Apr 2026 12:19:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBAq4-0000000CAXn-0X45;
	Fri, 10 Apr 2026 12:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3B39F41A7C;
	Fri, 10 Apr 2026 12:19:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B407C2BC87;
	Fri, 10 Apr 2026 12:19:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775823595;
	bh=QF8xu2w1ekYQn9h8hXu1i+73iAYxDniq8hK08qkXVok=;
	h=Date:From:To:Cc:Subject:References:From;
	b=jdPhw8GNcCbidbYQHfvNnynlBMQ6C8yak4JEVkjtLiGZL97Y3Kg6hDMEq3+pAZn9l
	 eebAKa8zdYjNIUhQRVD9BnFcdpgh+r9+oY8nCOOBP3TXDWg59J0yEe49bjDh/j5GY1
	 J/+Mrsj5Z9JlM/AmirqGD8HvbUDB7O2+WSvwYb2Dt2w8mdLS3mlRSvEUCA//cm+I50
	 T3lnhTwlF7Ll8vkIeV4joWfasbaLJDpe8kQqwYnenbDJtbX6i3a/y8coaGgKPKMk+y
	 /Al4CmKTrbd6SuhGXm70yx904ODj2E0CWQ5/8mFozaTW1DKtHUVqiCNDO1sI7Gfirg
	 PX6BMdDjfEFyw==
Date: Fri, 10 Apr 2026 14:19:52 +0200
Message-ID: <20260410120318.727211419@kernel.org>
User-Agent: quilt/0.68
From: Thomas Gleixner <tglx@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: "Theodore Tso" <tytso@mit.edu>,
 linux-ext4@vger.kernel.org,
 Arnd Bergmann <arnd@arndb.de>,
 x86@kernel.org,
 Lu Baolu <baolu.lu@linux.intel.com>,
 iommu@lists.linux.dev,
 Michael Grzeschik <m.grzeschik@pengutronix.de>,
 netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org,
 Herbert Xu <herbert@gondor.apana.org.au>,
 linux-crypto@vger.kernel.org,
 Vlastimil Babka <vbabka@kernel.org>,
 linux-mm@kvack.org,
 David Woodhouse <dwmw2@infradead.org>,
 Bernie Thompson <bernie@plugable.com>,
 linux-fbdev@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 Uladzislau Rezki <urezki@gmail.com>,
 Marco Elver <elver@google.com>,
 Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev@googlegroups.com,
 Andrey Ryabinin <ryabinin.a.a@gmail.com>,
 Thomas Sailer <t.sailer@alumni.ethz.ch>,
 linux-hams@vger.kernel.org,
 "Jason A. Donenfeld" <Jason@zx2c4.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-alpha@vger.kernel.org,
 Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Huacai Chen <chenhuacai@kernel.org>,
 loongarch@lists.linux.dev,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-m68k@lists.linux-m68k.org,
 Dinh Nguyen <dinguyen@kernel.org>,
 Jonas Bonn <jonas@southpole.se>,
 linux-openrisc@vger.kernel.org,
 Helge Deller <deller@gmx.de>,
 linux-parisc@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>,
 linuxppc-dev@lists.ozlabs.org,
 Paul Walmsley <pjw@kernel.org>,
 linux-riscv@lists.infradead.org,
 Heiko Carstens <hca@linux.ibm.com>,
 linux-s390@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>,
 sparclinux@vger.kernel.org
Subject: [patch 17/38] ext4: Replace get_cycles() usage with ktime_get()
References: <20260410120044.031381086@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_051956_294424_CD66E412 
X-CRM114-Status: GOOD (  10.51  )
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

get_cycles() is not guaranteed to be functional on all systems/platforms
and the values returned are unitless and not easy to map to something
useful.

Use ktime_get() instead, which provides nanosecond timestamps and is
functional everywhere.

This is part of a larger effort to limit get_cycles() usage to low level
architecture code.

Signed-off-by: Thomas Gleixner <tglx@kernel.org>
Cc: "Theodore Ts'o" <tytso@mit.edu>
Cc: linux-ext4@vger.kernel.org
---
 fs/ext4/mballoc.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

--- a/fs/ext4/mballoc.c
+++ b/fs/ext4/mballoc.c
@@ -1289,7 +1289,7 @@ void ext4_mb_generate_buddy(struct super
 	ext4_grpblk_t len;
 	unsigned free = 0;
 	unsigned fragments = 0;
-	unsigned long long period = get_cycles();
+	ktime_t period = ktime_get();
 
 	/* initialize buddy from bitmap which is aggregation
 	 * of on-disk bitmap and preallocations */
@@ -1328,7 +1328,7 @@ void ext4_mb_generate_buddy(struct super
 
 	clear_bit(EXT4_GROUP_INFO_NEED_INIT_BIT, &(grp->bb_state));
 
-	period = get_cycles() - period;
+	period = ktime_get() - period;
 	atomic_inc(&sbi->s_mb_buddies_generated);
 	atomic64_add(period, &sbi->s_mb_generation_time);
 }


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
