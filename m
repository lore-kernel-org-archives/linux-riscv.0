Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6498C8302F
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 12:39:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KhSFT3sWwJSgK87fVhwPkCsn5ItNLcRmWIS5FKid6e4=; b=vl8sPq2DJve5r7
	BLWz77rQV8QrMSgHBs8RFrMBHaF9hwPK5zG8eGJJ1J+gTUL8JgDncW8niqYOuQl14VHl28FYtZ8m1
	ar63JhAkRuqfcjuWgONndckjWq5I6fL8+k5nEQEDguplap06xdrlYdOrO5SSuXFDGItI6BPW6HbDU
	72srsxHA1K7srf742FYZQ8wBaiokc9coDjsTGeMkQFLS0Y7Dk968XEmfupmNBoEtqH5DXu32jHfp1
	u982ySzbEnRh4sav8AgKkln21uXDOs5I7/wZWdgwR8UNs0u0LwOpDAQp5qWm0cKzEk7+oCOdkG4Yj
	IQLGOTqpchnA6PcrBSxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDmi-00000002D8h-3JqQ;
	Mon, 30 Jun 2025 12:38:56 +0000
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWDPC-000000029Vf-3hbo
	for linux-riscv@lists.infradead.org;
	Mon, 30 Jun 2025 12:14:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751285677; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=TEyW6enmLuv9dUWsoyuMlg4cv4ltLIiIq6AY8UJQMfQ=;
	b=vPLsrsdTxV96bP/iHPtZUZN4FiRvV9Y5gCkjFLz4orFKrAwVGAPWmsk357nn3JoFvwYo5Pj47lOkE3zyVg4oXRaABYwfj0lfYQ1KUqa2BqNvwKek63ZgjOmzQg+rwGIWHZmHkcF5WLOhJzxJJfs+n5g69Pkk6YIDevRg6SAfvN4=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WgCGCGw_1751285670 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 20:14:35 +0800
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
Date: Mon, 30 Jun 2025 20:14:30 +0800
Message-ID: <20250630121430.1989-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250629113840.2f319956@pumpkin>
References: <20250629113840.2f319956@pumpkin>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_051439_195512_2680FC1B 
X-CRM114-Status: UNSURE (   7.56  )
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

On Sun, 29 Jun 2025 11:38:40 +0100, david.laight.linux@gmail.com wrote:

> > It can be found that the zbb optimized implementation uses fewer instructions,
> > even for 16-bit and 8-bit data.
> 
> Far too many register spills to stack.
> I think you've forgotten to specify -O2

Yes, I extracted it from the vmlinux disassembly, without compiling with -O2, and
I used the web tool you provided as follows:
```
unsigned int generic_ror32(unsigned int word, unsigned int shift)
{
	return (word >> (shift & 31)) | (word << ((-shift) & 31));
}

unsigned int zbb_opt_ror32(unsigned int word, unsigned int shift)
{
#ifdef __riscv
	__asm__ volatile("nop"); // ALTERNATIVE(nop)

	__asm__ volatile(
		".option push\n"
		".option arch,+zbb\n"
		"rorw %0, %1, %2\n"
		".option pop\n"
		: "=r" (word) : "r" (word), "r" (shift) :);
#endif
	return word;
}

unsigned short generic_ror16(unsigned short word, unsigned int shift)
{
	return (word >> (shift & 15)) | (word << ((-shift) & 15));
}

unsigned short zbb_opt_ror16(unsigned short word, unsigned int shift)
{
	unsigned int word32 = ((unsigned int)word << 16) | word;
#ifdef __riscv
	__asm__ volatile("nop"); // ALTERNATIVE(nop)

	__asm__ volatile(
		".option push\n"
		".option arch,+zbb\n"
		"rorw %0, %1, %2\n"
		".option pop\n"
		: "=r" (word32) : "r" (word32), "r" (shift) :);
#endif
	return (unsigned short)word;
}
```
The disassembly obtained is:
```
generic_ror32:
    andi    a1,a1,31
    negw    a5,a1
    sllw    a5,a0,a5
    srlw    a0,a0,a1
    or      a0,a5,a0
    ret

zbb_opt_ror32:
    nop
    rorw a0, a0, a1
    sext.w  a0,a0
    ret

generic_ror16:
    andi    a1,a1,15
    negw    a5,a1
    andi    a5,a5,15
    sllw    a5,a0,a5
    srlw    a0,a0,a1
    or      a0,a0,a5
    slli    a0,a0,48
    srli    a0,a0,48
    ret

zbb_opt_ror16:
    slliw   a5,a0,16
    addw    a5,a5,a0
    nop
    rorw a5, a5, a1
    ret
```

Thanks,
Pei

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
