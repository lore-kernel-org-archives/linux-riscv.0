Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA02E7B61B
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:10:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzEBWVp35Nrk0B+UxuRaoqWy1aBJoPGfwsF+85pBvbk=; b=udzHYfzw7f60nt
	OBZWR6m+WqPtAPrlvRfqpTzbvO3ytV7x9EgIa4OvifeCrh1mYW/K5GiZa5Tro2sQFUWIBqWL5cWrb
	Tnv+LMPa0go3ZLpw9kmBfk24gJFeBZeeItHqyKLHuq/RzJW7hPXl7EJZG5TKANYZyu9RlCGpOt2on
	u4WxIrTTCYd/7I4WHtCf7zc1periBBvPto3c9sglOOkTyhkKQH7rpN3IpTzWN+Ahz8R4dsBn0vdO7
	D41CkNn8ijBqCOSfvzobxoqKRAgWr6OrnPOxkej7V+EAgfboIP999y0C3OtGTkesZYfPADxx3lcP1
	Ju8we3mHHskCbWtsLNRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2aR-000BzB-1R;
	Wed, 04 Oct 2023 14:10:51 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2aO-000By7-1a
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:10:50 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-28-RLpeZCXkMPmTliQac3Fpww-1; Wed, 04 Oct 2023 15:10:42 +0100
X-MC-Unique: RLpeZCXkMPmTliQac3Fpww-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 4 Oct
 2023 15:10:41 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 4 Oct 2023 15:10:40 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0Nsw6ltZW50IEzDqWdlcic=?= <cleger@rivosinc.com>, Conor Dooley
	<conor@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
	<atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Evan Green
	<evan@rivosinc.com>, =?utf-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ron Minnich
	<rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>
Subject: RE: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
Thread-Topic: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
Thread-Index: AQHZ9QOtGOYrq2j5KUyBiWVh/MP2XrA5TUKAgAAMDACAAFTfgA==
Date: Wed, 4 Oct 2023 14:10:40 +0000
Message-ID: <caa22904d2d7469595dcc5cb1f11be89@AcuMS.aculab.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <20230930-patchy-curdle-ef5ee6e1a17c@spud>
 <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com>
 <eb9dcaaf313642b096d68df4b92e7466@AcuMS.aculab.com>
 <6ac16274-3816-4b46-9068-e97af66c815a@rivosinc.com>
In-Reply-To: <6ac16274-3816-4b46-9068-e97af66c815a@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231004_071048_794834_C7C2DFEC 
X-CRM114-Status: GOOD (  10.99  )
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

...
> Saying that you support misaligned access does not mean that they are
> going to be efficient, just that they are supported (in fact, the uABI
> state that they may perform poorly). The compiler is actually not so
> stupid and will try to do as much aligned access as possible in what it
> generates (unless forced by some assembly, cast or whatever that can
> screw up alignment accesses). This is already the case and it will most
> probably not change.

I did a quick check.

https://godbolt.org/z/j3e9drv4e

The code generated by both clang and gcc for misaligned reads is horrid.
Gcc does a better job if the alignment is known but generates much
the same as the clang code when it isn't.

The C code is much shorter.
Even though both gcc and clang add a (different) instruction to it

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
