Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F7DC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 09:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cRntnzP23qm78nT/rswOP9L48GlSQGyqgTQ0CQLFCh0=; b=jeOJ7aRZGrx7iN
	A9YFOlc+k2pZnuKulUl+RxuupctQRATPHiPVq+htTVXQDpiDYPCu0Cs3CA20ltJDDYGuITbG0kB4Y
	cESGcra6dYWtcue00vnCn2AufMVhxS8s5LZyyqtUOIGh/F+7PNJ8OQ6euz2d0JyEyk+EGq0hoXwcD
	advxdMcFimMevPkQWg/qn64ysYUA5WVqwHvVRGo+3TzBc8DC37AvyefweZWIgBnxIoxK9eTWmR4CC
	bN7fIQ2QJNi7N6WFIeIhKVcBMaZYrVNfpUq2CpYiGy0OfbsGioJU6oaheyPvLj6LlpdiRd0E8p62Q
	li8LmX7eIvx97/tMORog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBvXW-002lxA-7o; Mon, 24 Jan 2022 09:21:30 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBvXT-002lwD-Uo
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 09:21:29 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-252-Qk4L0YCwNj64dPMhnPks7Q-1; Mon, 24 Jan 2022 09:21:24 +0000
X-MC-Unique: Qk4L0YCwNj64dPMhnPks7Q-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 24 Jan 2022 09:21:21 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 24 Jan 2022 09:21:21 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: "'michael@michaelkloos.com'" <michael@michaelkloos.com>,
 "paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
 <palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH v2] Fixed: Misaligned memory access.  Fixed pointer
 comparison.
Thread-Topic: [PATCH v2] Fixed: Misaligned memory access.  Fixed pointer
 comparison.
Thread-Index: AQHYEAxftwhRlaAJzU+hPBmorjaluqxx5R9A
Date: Mon, 24 Jan 2022 09:21:21 +0000
Message-ID: <4fa1c4bbf27242cf9835dde0abdc89d5@AcuMS.aculab.com>
References: <20220123034518.3717116-1-michael@michaelkloos.com>
In-Reply-To: <20220123034518.3717116-1-michael@michaelkloos.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.202.205.107]
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=C51A453 smtp.mailfrom=david.laight@aculab.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: aculab.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_012128_291556_00AE2EAE 
X-CRM114-Status: GOOD (  14.64  )
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

From: michael@michaelkloos.com
> Sent: 23 January 2022 03:45
> 
> Rewrote the riscv memmove() assembly implementation.  The
> previous implementation did not check memory alignment and it
> compared 2 pointers with a signed comparison.  The misaligned
> memory access would cause the kernel to crash on systems that
> did not emulate it in firmware and did not support it in hardware.
> Firmware emulation is slow and may not exist.  Additionally,
> hardware support may not exist and would likely still run slower
> than aligned accesses even if it did.

That may not be true.
On x86 the cost of misaligned accesses only just measurable.
It isn't even one clock per cache line for reads (eg ipcsum).

> The RISC-V spec does not
> guarantee that support for misaligned memory accesses will exist.
> It should not be depended on.
> 
> This patch now checks for the maximum granularity of co-alignment
> between the pointers and copies them with that, using single-byte
> copy for any unaligned data at their terminations.  It also now uses
> unsigned comparison for the pointers.

If the performance of misaligned copies ever matters it is probably
better to use:
	*dst++ = src[0] >> n | src[1] << (64 - n);
for the body of the misaligned loop.
You can always read the aligned src[] even if outside the buffer.
So the only difficult part is writing the odd bytes
and getting 'n' and the direction of the shifts right!

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
