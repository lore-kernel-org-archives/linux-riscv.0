Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7950C77B7C
	for <linux-riscv@archiver.kernel.org>; Fri, 12 May 2023 11:04:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uiYbEnIOvEhPuePYSkfWEt5VSuuA6FvJYc00YOX5YNU=; b=EkSpZZ6btctz4L
	LI4p4njdcQ4fPsWr5wihEdDRS0jLt/Z1nAeLPFuSEq7ggSrnld3QDRUs7/qaPwQxVVzUdhs0ttumZ
	SpSLmznY4L4rUMlQ6XvDlf9woF1gyPBV2nu2gwZRZ++rli8Xah1Y7nAYUt1vF/6fciHd+nepYsRO7
	NJ84ogafFXaHhPj2Fpapvjmo1nwDkcJ5kuHHiHNaDsOYD3nHm/SeeQIgrEQUlYQs7Ul0VWA3/URDQ
	P7D3oSDJf1uZH869lpABxAc5sfW0hKovaR8Wm7a5caBWcQrYH6KuWVeStNOAkIzetN7bh+UWvwbtN
	CGqB2zW14dujgcmj/1Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQZi-00BjGc-2M;
	Fri, 12 May 2023 11:04:38 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pxQZf-00BjEq-1M
	for linux-riscv@lists.infradead.org;
	Fri, 12 May 2023 11:04:37 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-202-mviBPJlMNOCjVoE72WOORg-1; Fri, 12 May 2023 12:04:27 +0100
X-MC-Unique: mviBPJlMNOCjVoE72WOORg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 12 May
 2023 12:04:26 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 12 May 2023 12:04:26 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'zhangfei' <zhang_fei_0403@163.com>, "ajones@ventanamicro.com"
	<ajones@ventanamicro.com>
CC: "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"palmer@dabbelt.com" <palmer@dabbelt.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "zhangfei@nj.iscas.ac.cn"
	<zhangfei@nj.iscas.ac.cn>
Subject: RE: [PATCH v2 2/2] RISC-V: lib: Optimize memset performance
Thread-Topic: [PATCH v2 2/2] RISC-V: lib: Optimize memset performance
Thread-Index: AQHZhK8G+w9eb+3RiUuWNqEpHdcgA69WcTzQ
Date: Fri, 12 May 2023 11:04:26 +0000
Message-ID: <8e75a8de06124379a916e0169a895f82@AcuMS.aculab.com>
References: <20230511-0b91da227b91eee76f98c6b0@orel>
 <20230512085124.3204-1-zhang_fei_0403@163.com>
In-Reply-To: <20230512085124.3204-1-zhang_fei_0403@163.com>
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
X-CRM114-CacheID: sfid-20230512_040435_751799_699E4F01 
X-CRM114-Status: GOOD (  13.40  )
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

From: zhangfei
> Sent: 12 May 2023 09:51
...
> 2.Storing parallelism and reducing jumps will compensate for the cost of redundant
> stores. Based on the current multiple test results, regardless of which bytes I
> modify to check, its performance is better than byte by byte storage.
> 
> 3.From the above experiment, for the detection of 2, 6, 8, 11, and 14, its overall
> performance is the best.

I'm surprised the RISC-V cpu support parallel stores.
Typical x86 desktop cpu can only do single store (and two loads) every clock.
Clearly doing writes offset from both ends of the buffer does
reduce the number of control instructions relative to the stores.

Since memory writes can easily be queued I'd expect that your
'aim' would be one write every clock.
Achieving that requires knowledge of which instructions can execute in
parallel and the delays associated with correctly predicted branches.
That will very much depend on which RISV-V cpu you have.
Since any loop is at least two instructions (addi+blt) you almost
certainly need at least two writes per iteration.

I do think you are missing a trick though.
IIRC some RISC-V cpu properly support misaligned writes.
In that case, for long enough memset you can do something like:
	end = start + length;
	*(u64 *)start = 0
	start = (start + 24) & ~15;
	do {
		*(u64 *)(start - 16) = 0;
		*(u64 *)(start - 8) = 0;
		start += 16;
	} while (start < end);
	*(u64 *)(end - 16) = 0;
	*(u64 *)(end - 8) = 0;

> Because I am not a chip designer, I find it difficult to answer specific energy
> consumption costs. Do you have any suggestions and how to conduct testing in this
> regard? I think although storage has increased, there has been a corresponding
> reduction in jumps and the use of pipelines.

Energy use will pretty much depend on the number of clocks.
Anything else will be 2nd order noise.

What does make a difference is that increasing the code size
evicts other code from the I-cache.
This has a knock-on effect on overall system performance.
So while massively unrolling a loop will improve a benchmark
(especially if it is run 'hot-cache') there can be negative
effects on overall system performance.
The code size here probably won't have a measurable effect but
unroll to many kb and the effect can get pronounced.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
