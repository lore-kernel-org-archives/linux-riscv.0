Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87790C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 11:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9+JmStjkJoDjcHjYrzk26gswPOa4IfToIE0GBnSAJ9M=; b=omzt5sxCejUe08
	tewTQElp+npGlQ2aZhw+iFxTX6sncXjY6ukkHrcBgydBLYkXpxrq9cm7D+Mt+BLPxiObSmToULFWk
	L3Yhmi6Xf2Ji6rrIhtC2p/boS6edyVyZEpvNmgqxkmmZW4+MmGluS99E5VJuqzYP+Mvsd84Q7LcF3
	pUix9e2NenPiqbck6wOQxF6MPohPc3w4wYjKPhKi/x1aol3C7RXrTQds8D/Pohol5+7vfd8xBMVev
	GjQ78WnU5F5RF/tAtcAbXxIadY6giIGcAc07d2BNlPDtQ4+IggWVKlrtHV1u/oKZuPf8kYtIX55K1
	BwEgL4PgKuNSjd6AoOOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmWf-0000000GWZ6-01Kz;
	Tue, 30 Jan 2024 11:43:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUmWc-0000000GWYN-3dvb
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 11:43:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4B90A601BD;
	Tue, 30 Jan 2024 11:43:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 808ECC433F1;
	Tue, 30 Jan 2024 11:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706615014;
	bh=1dvspfcJflTfBs11wiC68BBxE/i2yh/F5YLwP7Tw4mk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Jp8N5znLrchQW7iQQFTKbpb455YiKpVWmC2a96EWlFM2XehFfkc5+M2RDR2OcG0dy
	 ekgA/SJ68RF1kQSb8q2wpNOpWX/9ry/nzv4+NjK1fCgaEnbShPFVLMf+X86KBDNzxB
	 GPF+8bbGMHRhf0TLxcacVIfmcc3td0bU1Qtj5wJUku5E9qlg4E3nry9a6Nrm9Hzz9j
	 ByFXdex/dIT7RE4ozYSKyeMZll6aTcvvWs7YtAHTgwuCeffG9/bq/FXJvc1qb9iJ/7
	 wYKi0RiLZX0yY2Q2H+pxX8uDgNFxn1dZO2bn5KgB5CMTuxl4zxSHEmCGGHTwUhhy9Q
	 XiPWxhcLiPLfA==
Date: Tue, 30 Jan 2024 19:30:43 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: David Laight <David.Laight@aculab.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Matteo Croce <mcroce@microsoft.com>,
	kernel test robot <lkp@intel.com>
Subject: Re: [PATCH 2/3] riscv: optimized memmove
Message-ID: <Zbjd43y3s6PDfQE0@xhacker>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-3-jszhang@kernel.org>
 <59bed43df37b4361a8a1cb31b8582e9b@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <59bed43df37b4361a8a1cb31b8582e9b@AcuMS.aculab.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_034334_969629_50E814A1 
X-CRM114-Status: GOOD (  17.41  )
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

On Sun, Jan 28, 2024 at 12:47:00PM +0000, David Laight wrote:
> From: Jisheng Zhang
> > Sent: 28 January 2024 11:10
> > 
> > When the destination buffer is before the source one, or when the
> > buffers doesn't overlap, it's safe to use memcpy() instead, which is
> > optimized to use a bigger data size possible.
> > 
> ...
> > + * Simply check if the buffer overlaps an call memcpy() in case,
> > + * otherwise do a simple one byte at time backward copy.
> 
> I'd at least do a 64bit copy loop if the addresses are aligned.
> 
> Thinks a bit more....
> 
> Put the copy 64 bytes code (the body of the memcpy() loop)
> into it an inline function and call it with increasing addresses
> in memcpy() are decrementing addresses in memmove.

Hi David,

Besides the 64 bytes copy, there's another optimization in __memcpy:
word-by-word copy even if s and d are not aligned.
So if we make the two optimizd copy as inline functions and call them
in memmove(), we almost duplicate the __memcpy code, so I think
directly calling __memcpy is a bit better.

Thanks
> 
> So memcpy() contains:
> 	src_lim = src_lim + count;
> 	... alignment copy
> 	for (; src + 64 <= src_lim; src += 64; dest += 64)
> 		copy_64_bytes(dest, src);
> 	... tail copy
> 
> Then you can do something very similar for backwards copies.
> 
> 	David
> 
> -
> Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
> Registration No: 1397386 (Wales)
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
