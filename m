Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D4EC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:39:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ceLKT21ZgoDV2ocq9NAEGcunC2Kz4+tIxDBBAAu+1U=; b=epL+Uud76NJxE6
	fl3QhRrQFGGct645VHW0cUGdFevx/YyMn6SDy6NQv7eIFFCtXuCyPHRtwp/q7H7LQjF89N9RD1SiL
	lSOmpAmp13LxIzd0FlbJPEkfFRH7Qa8TucZOPaVwBc6qShaTtnOvsNHyg9k0NlhYxyHoeVyf1Lq7V
	57iOgevOGeZv6KZ599NB+572douOz8q6PISmkwMtDEUb9dRTlcqPhUj6R1G9xwAdwJo/1qj9QvTN/
	2K+4P24a+gYGjMMpHECi3zXImctIY/Hxq9G6SVzEy1qHPLju74EWd131XHvGjEpYYnW0DPzUitOTG
	djc/L9tEJtuXcXoz9roA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmSn-0000000GV6g-0dsu;
	Tue, 30 Jan 2024 11:39:37 +0000
Received: from mailgate.ics.forth.gr ([139.91.1.2])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmSk-0000000GV0F-05H4
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:39:36 +0000
Received: from av3.ics.forth.gr (av3in.ics.forth.gr [139.91.1.77])
	by mailgate.ics.forth.gr (8.15.2/ICS-FORTH/V10-1.8-GATE) with ESMTP id 40UBdFrJ003642
	for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 13:39:20 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; d=ics.forth.gr; s=av; c=relaxed/simple;
	q=dns/txt; i=@ics.forth.gr; t=1706614760; x=1709206760;
	h=From:Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5S10mTZhZbQFsJIaNUVqS3Tw0Ln3OPHQISVKPpP1DH0=;
	b=bGzFyDI1hgZjW/BNzyYMSkN6f7dy/0ICzqVsXoXa39feXN+oKyTNU65lm9rUh9E3
	J8hcVp4VH9GZbUAonayFCSEG1wan8nT5WnsnYPPSqaWd5z342lTBpY5TQ/FAo0/o
	GH8olK3wGaB0VZ9wJrGWUuae46+ZAvgGbH7vxLaQ5OxAkhGUj9iwJ+PD1cbTxoU9
	qct0kmC3fSfgkya6UU8BopS+oXr78gFwBQgxkwGZ5mZeZCpXcXU0qkCtPQNT1L9i
	hE8qaOFtNeF/2zAkE/Dz1awjXvtvoGe0qeT+mNZkFx6ztsDex69GcbnuB+RvR2m/
	h9no2V6FOB21fo599aeV2A==;
X-AuditID: 8b5b014d-a23ec70000002178-80-65b8dfe81b6b
Received: from enigma.ics.forth.gr (webmail.ics.forth.gr [139.91.151.35])
	by av3.ics.forth.gr (Symantec Messaging Gateway) with SMTP id 71.91.08568.8EFD8B56; Tue, 30 Jan 2024 13:39:20 +0200 (EET)
X-ICS-AUTH-INFO: Authenticated user: mick at ics.forth.gr
Message-ID: <fa36b871-43d7-413c-82a2-0ecc0ebce9b4@ics.forth.gr>
Date: Tue, 30 Jan 2024 13:39:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] riscv: optimized memmove
To: Jisheng Zhang <jszhang@kernel.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt
 <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
        Matteo Croce <mcroce@microsoft.com>, kernel test robot <lkp@intel.com>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-3-jszhang@kernel.org>
Content-Language: el-GR
From: Nick Kossifidis <mick@ics.forth.gr>
In-Reply-To: <20240128111013.2450-3-jszhang@kernel.org>
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrCLMWRmVeSWpSXmKPExsXSHT1dWffF/R2pBru3KVps/T2L3aL52Ho2
	i8u75rBZbPvcwmbxqvkRm8XfX/9ZLV5e7mG2aJvF78Dh8eblSxaPwx1f2D0W73nJ5LFpVSeb
	x+Yl9R6tO/6ye1xqvs7u8XmTXABHFJdNSmpOZllqkb5dAlfGrO6ygjPCFb/fZTQwLufvYuTg
	kBAwkXi726eLkYtDSOAoo8TR3g72LkZOoLilxOZPL1lAbF4Be4mWg9PZQGwWAVWJOWtPMUPE
	BSVOznwCViMqIC9x/9YMdpCZwgKGErtvV4LMFBHYyiix9dVbdhCHWWASo8Tkr59YQYqEBJIl
	Hn+3BellFhCXOHL+N9hMNgFNifmXDoLN5BQwl+ia8YAVosZMomtrFyOELS+x/e0c5gmMArOQ
	nDELyahZSFpmIWlZwMiyilEgscxYLzO5WC8tv6gkQy+9aBMjOCIYfXcw3t78Vu8QIxMH4yFG
	CQ5mJRHen5pbU4V4UxIrq1KL8uOLSnNSiw8xSnOwKInznrBdkCwkkJ5YkpqdmlqQWgSTZeLg
	lGpgiv3TdzOY44tz/7NOfz9mpx7OT7wXiy0Df+YkaJ5TX3k0dNFhzUU9tT+bfrF1bJzuvmGL
	xZuFjIKdxe9XblAWrTqwdNqWubLGgkJ7N6XzTKl32hKlLKJ1qObp5bctbkEP3zOnXti6+f5K
	7ttLGtuetSUtUzzBEbbH6fZE3buHo+sffbRql9+TzVjSWZZ+e+HSj21rr7R6eWW6mP0OTFNy
	PpH14c/NdXHF99h+z46TaD+05JB1Pau4yPmbTndS2Qr+5fdd/8XF0NB+PJ13ym8JE5e6ojUP
	Vx73e3Bw4n6nb0ncvS/yXobPdrbqu+yhfM5znfrDbyH2l49cUlh5UP/JteOeVxmF1D78rDqi
	mP4zSYmlOCPRUIu5qDgRAOLlaxz3AgAA
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_033934_471305_72BD83B5 
X-CRM114-Status: GOOD (  14.66  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 1/28/24 13:10, Jisheng Zhang wrote:
> From: Matteo Croce <mcroce@microsoft.com>
> 
> When the destination buffer is before the source one, or when the
> buffers doesn't overlap, it's safe to use memcpy() instead, which is
> optimized to use a bigger data size possible.
> 
> Signed-off-by: Matteo Croce <mcroce@microsoft.com>
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>

I'd expect to have memmove handle both fw/bw copying and then memcpy 
being an alias to memmove, to also take care when regions overlap and 
avoid undefined behavior.


> --- a/arch/riscv/lib/string.c
> +++ b/arch/riscv/lib/string.c
> @@ -119,3 +119,28 @@ void *memcpy(void *dest, const void *src, size_t count) __weak __alias(__memcpy)
>   EXPORT_SYMBOL(memcpy);
>   void *__pi_memcpy(void *dest, const void *src, size_t count) __alias(__memcpy);
>   void *__pi___memcpy(void *dest, const void *src, size_t count) __alias(__memcpy);
> +
> +/*
> + * Simply check if the buffer overlaps an call memcpy() in case,
> + * otherwise do a simple one byte at time backward copy.
> + */
> +void *__memmove(void *dest, const void *src, size_t count)
> +{
> +	if (dest < src || src + count <= dest)
> +		return __memcpy(dest, src, count);
> +
> +	if (dest > src) {
> +		const char *s = src + count;
> +		char *tmp = dest + count;
> +
> +		while (count--)
> +			*--tmp = *--s;
> +	}
> +	return dest;
> +}
> +EXPORT_SYMBOL(__memmove);
> +

Here is an approach for the backwards case to get things started...

static void
copy_bw(void *dst_ptr, const void *src_ptr, size_t len)
{
	union const_data src = { .as_bytes = src_ptr + len };
	union data dst = { .as_bytes = dst_ptr + len };
	size_t remaining = len;
	size_t src_offt = 0;

	if (len < 2 * WORD_SIZE)
		goto trailing_bw;

	for(; dst.as_uptr & WORD_MASK; remaining--)
		*--dst.as_bytes = *--src.as_bytes;

	src_offt = src.as_uptr & WORD_MASK;
	if (!src_offt) {
		for (; remaining >= WORD_SIZE; remaining -= WORD_SIZE)
			*--dst.as_ulong = *--src.as_ulong;
	} else {
		unsigned long cur, prev;
		src.as_bytes -= src_offt;
		for (; remaining >= WORD_SIZE; remaining -= WORD_SIZE) {
			cur = *src.as_ulong;
			prev = *--src.as_ulong;
			*--dst.as_ulong = cur << ((WORD_SIZE - src_offt) * 8) |
					  prev >> (src_offt * 8);
		}
		src.as_bytes += src_offt;
	}

  trailing_bw:
	while (remaining-- > 0)
		*--dst.as_bytes = *--src.as_bytes;
}

Regards,
Nick

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
