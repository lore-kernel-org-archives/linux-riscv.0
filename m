Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DB5AC47258
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Jan 2024 12:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sA8Ww/BGcwPG7Gym/eM88Bx7Gcj+nAL+CKh9yp8pnZo=; b=O8m1NePXUolh/y
	FDL6iu6kOcbTk427tN2kdTdboZnzEwYOcrn1FXrye2m6JqGSRjXYtImicRnL30p7S4fLch7EEmYBE
	Ma0r1yUNbJjPVKHjMU21JkRXXK9OgZ+bV+jPAlik3tRFjO6cWvFHLj65WXyEFOyjmQUlPv+BcDF7d
	7TdA2kF3p1nG+SLHTLQj14mJTYgpEUaY+QLNPtU+FOt4vQPMkSdQXShLSgvqjW7suuZGuuJ2O0fiC
	iBd6CPuPSUf7zbOC0kzSsEXw1b40W0PBN0PPYkWva43I8lej2q33I08uawTjyrYrCPAsbsFlXVebN
	ennl/VQuF+rc5tUMQKAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU4ZS-00000009T3A-1FpJ;
	Sun, 28 Jan 2024 12:47:34 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rU4ZP-00000009T2V-13Yx
	for linux-riscv@lists.infradead.org;
	Sun, 28 Jan 2024 12:47:33 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-192-sDnoWcOHNe-yKChU7lXVCg-1; Sun, 28 Jan 2024 12:47:23 +0000
X-MC-Unique: sDnoWcOHNe-yKChU7lXVCg-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 28 Jan
 2024 12:47:00 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 28 Jan 2024 12:47:00 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jisheng Zhang' <jszhang@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Matteo Croce
	<mcroce@microsoft.com>, kernel test robot <lkp@intel.com>
Subject: RE: [PATCH 2/3] riscv: optimized memmove
Thread-Topic: [PATCH 2/3] riscv: optimized memmove
Thread-Index: AQHaUdxjAvIJPrdYsUmtWfJZGIT/drDvKbzw
Date: Sun, 28 Jan 2024 12:47:00 +0000
Message-ID: <59bed43df37b4361a8a1cb31b8582e9b@AcuMS.aculab.com>
References: <20240128111013.2450-1-jszhang@kernel.org>
 <20240128111013.2450-3-jszhang@kernel.org>
In-Reply-To: <20240128111013.2450-3-jszhang@kernel.org>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240128_044731_626140_B26104DE 
X-CRM114-Status: UNSURE (   7.16  )
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

From: Jisheng Zhang
> Sent: 28 January 2024 11:10
> 
> When the destination buffer is before the source one, or when the
> buffers doesn't overlap, it's safe to use memcpy() instead, which is
> optimized to use a bigger data size possible.
> 
...
> + * Simply check if the buffer overlaps an call memcpy() in case,
> + * otherwise do a simple one byte at time backward copy.

I'd at least do a 64bit copy loop if the addresses are aligned.

Thinks a bit more....

Put the copy 64 bytes code (the body of the memcpy() loop)
into it an inline function and call it with increasing addresses
in memcpy() are decrementing addresses in memmove.

So memcpy() contains:
	src_lim = src_lim + count;
	... alignment copy
	for (; src + 64 <= src_lim; src += 64; dest += 64)
		copy_64_bytes(dest, src);
	... tail copy

Then you can do something very similar for backwards copies.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
