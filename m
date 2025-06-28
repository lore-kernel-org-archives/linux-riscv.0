Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63BA1C7EE32
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Jun 2025 12:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7bvDumYeZiBx9gzyBqG0Go9pItjgwb2pHoamlq9tNDE=; b=C9W6ybWhGDlFGU
	szs226fKYdI6sYXGt+F2828OXbt9R8RfQLnhQgtV41N80I3b3CmpCRsZTE35x+wnEP9+jxmlcQMF3
	CaAlMAwOtHPP48Ycs37Na/QUhq1rK7FUVqgvqNIj07eiZKts5qj50H+OaEO3x4HNlAiXYL4xpE5BG
	67r6xDtB5yQm3spoucSo2P9LML2BaoxCzuBAFxu8wMj9kPM3ejRP2h4DzMU+6u9y5ZQeOxzuVIWFS
	uaNFTIWxTl9/f5Dmr3PNnBAx6DXOMOTM5mNduNv27fvpj29+b8lEGNu96bVLLqbMs9YMDl1bF67Sz
	R017aBqtaWHM+o9kBHvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUOQ-0000000Gljf-0D7x;
	Sat, 28 Jun 2025 12:10:50 +0000
Received: from out30-132.freemail.mail.aliyun.com ([115.124.30.132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uVUMv-0000000GldF-3jog
	for linux-riscv@lists.infradead.org;
	Sat, 28 Jun 2025 12:09:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751112553; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=jG2LawCA1NNYtazKDVvJGkVVtdv0FBm8VQn9Q5cw1nQ=;
	b=tEG3GOA/rkJY9liHx9njZwV/SnG12Vuf2il5zblZy0IOdbmKWPF1XljjEyi06whDp8YG0f7fmhffd6R3Zkyen+QookIRljz8ZJwl+e2Ag4rj3aKRpxzGIck6WacDX1ZLARIAQxXyp3JQSC/hz1f44nbHxj90JoJokBy+OV6Ca84=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WfjZU4-_1751112496 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sat, 28 Jun 2025 20:09:09 +0800
From: cp0613@linux.alibaba.com
To: david.laight.linux@gmail.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	cp0613@linux.alibaba.com,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@rasmusvillemoes.dk,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	yury.norov@gmail.com
Subject: Re: [PATCH 2/2] bitops: rotate: Add riscv implementation using Zbb extension
Date: Sat, 28 Jun 2025 20:08:16 +0800
Message-ID: <20250628120816.1679-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250625170234.29605eed@pumpkin>
References: <20250625170234.29605eed@pumpkin>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250628_050918_167521_1494C26D 
X-CRM114-Status: UNSURE (   8.66  )
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

On Wed, 25 Jun 2025 17:02:34 +0100, david.laight.linux@gmail.com wrote:

> Is it even a gain in the zbb case?
> The "rorw" is only ever going to help full word rotates.
> Here you might as well do ((word << 8 | word) >> shift).
> 
> For "rol8" you'd need ((word << 24 | word) 'rol' shift).
> I still bet the generic code is faster (but see below).
> 
> Same for 16bit rotates.
> 
> Actually the generic version is (probably) horrid for everything except x86.
> See https://www.godbolt.org/z/xTxYj57To

Thanks for your suggestion, this website is very inspiring. According to the
results, the generic version is indeed the most friendly to x86. I think this
is also a reason why other architectures should be optimized. Take the riscv64
ror32 implementation as an example, compare the number of assembly instructions
of the following two functions:
```
u32 zbb_opt_ror32(u32 word, unsigned int shift)
{
	asm volatile(
		".option push\n"
		".option arch,+zbb\n"
		"rorw %0, %1, %2\n"
		".option pop\n"
		: "=r" (word) : "r" (word), "r" (shift) :);

	return word;
}

u16 generic_ror32(u16 word, unsigned int shift)
{
	return (word >> (shift & 31)) | (word << ((-shift) & 31));
}
```
Their disassembly is:
```
zbb_opt_ror32:
<+0>:     addi    sp,sp,-16
<+2>:     sd      s0,0(sp)
<+4>:     sd      ra,8(sp)
<+6>:     addi    s0,sp,16
<+8>:     .insn   4, 0x60b5553b
<+12>:    ld      ra,8(sp)
<+14>:    ld      s0,0(sp)
<+16>:    sext.w  a0,a0
<+18>:    addi    sp,sp,16
<+20>:    ret

generic_ror32:
<+0>:     addi    sp,sp,-16
<+2>:     andi    a1,a1,31
<+4>:     sd      s0,0(sp)
<+6>:     sd      ra,8(sp)
<+8>:     addi    s0,sp,16
<+10>:    negw    a5,a1
<+14>:    sllw    a5,a0,a5
<+18>:    ld      ra,8(sp)
<+20>:    ld      s0,0(sp)
<+22>:    srlw    a0,a0,a1
<+26>:    or      a0,a0,a5
<+28>:    slli    a0,a0,0x30
<+30>:    srli    a0,a0,0x30
<+32>:    addi    sp,sp,16
<+34>:    ret
```
It can be found that the zbb optimized implementation uses fewer instructions,
even for 16-bit and 8-bit data.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
