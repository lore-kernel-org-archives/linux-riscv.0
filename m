Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75750C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 14:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JaXeDp5XI/GmXZZR0CdeEiacQu8/918LE1JS+Z+ANCo=; b=jau+Cgq+Vj6hchtVDFpcjEfN+r
	6CYCR5DIKII+vyXnD0BmWiiBxGAxCmgDAWABU0TOsAbR4a+quio/yneKO68F8W2KXPor6lCrFRWSI
	VSEp/hAl+mqduSGzyHY4056DtOe63bKAuYUT3gWX7n3RTq94XKno5Zey5NssfBQKvOUGZes/VzLnw
	6oGhMplfISPrLQ6CBB9H9KwF2416d4UzzXgf1DeRJgRndPc7+Try4VNbhWREXqg5/MXzeJBG5AeFq
	ftBiwpxEaNiSQBZd5J0H6Vr1q9sXDc755KmSczntVrMEsuP/4NsLKj7QEdSXkU6HxLaixfhFk2jxt
	0fZh+4yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWbls-00000005f3H-36Vk;
	Tue, 01 Jul 2025 14:15:40 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWaPf-00000005NPz-1omw
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 12:48:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751374113; h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	bh=706zC49+Igq6mqNbtxLpqbNqmtMO8IuSdJt/Xy7JrDE=;
	b=EPShFF95IMNuq0bjBnmvUCPUVsg9M+4SK7c1KLh2d2kJZmuquoPfpn//UQLYRkXydtVCokZ3dv1vlWfLPv3BhgdU5PUaHusQUUdXrUIobpPlwqcKR/9epeSo/wWZ776ZR+6jBoCjsjrMFfru3Z2vT6smeR8tZX4ByM1Uk/FH8IA=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WgPihqn_1751374067 cluster:ay36)
          by smtp.aliyun-inc.com;
          Tue, 01 Jul 2025 20:48:29 +0800
From: cp0613@linux.alibaba.com
To: yury.norov@gmail.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	cp0613@linux.alibaba.com,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb extension
Date: Tue,  1 Jul 2025 20:47:01 +0800
Message-ID: <20250701124737.687-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <aGLA78usaJOnpols@yury>
References: <aGLA78usaJOnpols@yury>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_054840_120611_35167F6A 
X-CRM114-Status: GOOD (  27.57  )
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
Content-Type: multipart/mixed; boundary="===============6680386629783735314=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6680386629783735314==
Content-Type: text/plain; charset=y
Content-Transfer-Encoding: 8bit

On Mon, 30 Jun 2025 12:53:03 -0400, yury.norov@gmail.com wrote:

> > This data preparation process does introduce additional operations. Compared with
> > genneric's implementation, I use the web tool provided by David to illustrate.
> > 
> > The two functions that need to be compared are briefly summarized as follows:
> > ```
> > unsigned char generic_ror8(unsigned char word, unsigned int shift)
> > {
> > 	return (word >> (shift & 7)) | (word << ((-shift) & 7));
> > }
> > 
> > unsigned char zbb_opt_ror8(unsigned char word, unsigned int shift)
> > {
> > 	unsigned int word32 = ((unsigned int)word << 24) | \
> > 	    ((unsigned int)word << 16) | ((unsigned int)word << 8) | word;
> > #ifdef __riscv
> > 	__asm__ volatile("nop"); // ALTERNATIVE(nop)
> > 
> > 	__asm__ volatile(
> > 		".option push\n"
> > 		".option arch,+zbb\n"
> > 		"rorw %0, %1, %2\n"
> > 		".option pop\n"
> > 		: "=r" (word32) : "r" (word32), "r" (shift) :);
> > #endif
> > 	return (unsigned char)word32;
> > }
> > ```
> > The disassembly obtained is:
> > ```
> > generic_ror8:
> >     andi    a1,a1,7
> >     negw    a5,a1
> >     andi    a5,a5,7
> >     sllw    a5,a0,a5
> >     srlw    a0,a0,a1
> >     or      a0,a0,a5
> >     andi    a0,a0,0xff
> >     ret
> > 
> > zbb_opt_ror8:
> >     slli    a5,a0,8
> >     add     a0,a5,a0
> >     slliw   a5,a0,16
> >     addw    a5,a5,a0
> >     nop
> >     rorw a5, a5, a1
> >     andi    a0,a5,0xff
> >     ret
> > ```
> > From the perspective of the total number of instructions, although zbb_opt_ror8 has
> > one more instruction, one of them is a nop, so the difference with generic_ror8 should
> > be very small, or using the solution provided by David would be better for non-x86.
> 
> And what about performance?

Please allow me to include performance information later in this answer, as the
implementation has changed.

> > > Sorry, I'm lost here about what you've considered and what not. I'm OK
> > > about accelerating ror/rol, but I want to make sure that;
> > > 
> > > 1. The most trivial compile-case is actually evaluated at compile time; and
> > > 2. Any arch-specific code is well explained; and
> > > 3. legacy case optimized just as well as non-legacy.
> > 
> > 1. As in the above reply, use the generic implementation when compile-time evaluation
> >    is possible。
> > 2. I will improve the comments later.
> 
> I'm particularly interested in ror8/rol8 case:
> 
>         u32 word32 = ((u32)word << 24) | ((u32)word << 16) | ((u32)word << 8) | word;
> 
> When you expand it to 32-bit word, and want to rotate, you obviously
> need to copy lower quarterword to the higher one:
> 
>         0xab >> 0xab0000ab
> 
> That way generic (u8)ror32(0xab, shift) would work. But I don't understand
> why you copy the lower 8 bits to inner quarterwords. Is that a hardware
> requirement? Can you point to any arch documentation 
> 
> > 3. As mentioned before, only 8-bit rotation should have no optimization effect, and
> >    16-bit and above will have significant optimization.
> 
> I asked you about the asm goto ("legacy") thing: you calculate that
> complex word32 _before_ evaluating the goto. So this word32 may get
> unused, and you waste cycles. I want to make sure this isn't the case.

Thank you for your suggestion and reminder. This is not a hardware requirement, but it
is somewhat related because the zbb instruction only supports word-sized rotate [1].
Considering the case where the shift is greater than 8, if the modulus of the shift is
not taken, it is required to continuously concatenate 8-bit data into 32 bits.

So, I considered the case of taking the remainder of shift and found that this
implementation would have one less instruction, so the final implementation is as follows:
```
static inline u8 variable_rol8(u8 word, unsigned int shift)
{
	u32 word32;

	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
				      RISCV_ISA_EXT_ZBB, 1)
			  : : : : legacy);

	word32 = ((u32)word << 24) | word;
	shift = shift % 8;

	asm volatile(
		".option push\n"
		".option arch,+zbb\n"
		"rolw %0, %1, %2\n"
		".option pop\n"
		: "=r" (word32) : "r" (word32), "r" (shift) :);

	return (u8)word32;

legacy:
	return generic_rol8(word, shift);
}

static inline u8 variable_ror8(u8 word, unsigned int shift)
{
	u32 word32;

	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
				      RISCV_ISA_EXT_ZBB, 1)
			  : : : : legacy);

	word32 = ((u32)word << 8) | word;
	shift = shift % 8;

	asm volatile(
		".option push\n"
		".option arch,+zbb\n"
		"rorw %0, %1, %2\n"
		".option pop\n"
		: "=r" (word32) : "r" (word32), "r" (shift) :);

	return (u8)word32;

legacy:
	return generic_ror8(word, shift);
}
```

I compared the performance of ror8 (zbb optimized) and generic_ror8 on the XUANTIE C908
by looping them. ror8 is better, and the advantage of ror8 becomes more obvious as the
number of iterations increases. The test code is as follows:
```
	u8 word = 0x5a;
	u32 shift = 9;
	u32 i, loop = 100;
	u8 ret1, ret2;

	u64 t1 = ktime_get_ns();
	for (i = 0; i < loop; i++) {
		ret2 = generic_ror8(word, shift);
	}
	u64 t2 = ktime_get_ns();
	for (i = 0; i < loop; i++) {
		ret1 = ror8(word, shift);
	}
	u64 t3 = ktime_get_ns();

	pr_info("t2-t1=%lld t3-t2=%lld\n", t2 - t1, t3 - t2);
```

> Please find attached a test for compile-time ror/rol evaluation.
> Please consider prepending your series with it.

Okay, I'll bring it to the next series.

[1] https://github.com/riscv/riscv-bitmanip


--===============6680386629783735314==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6680386629783735314==--
