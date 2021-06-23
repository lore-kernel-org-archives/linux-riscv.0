Return-Path: <SRS0=kiTD=LR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD9F6C48BC2
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 09:06:16 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5F7E61263
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Jun 2021 09:06:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A5F7E61263
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhARjtzu5vuet/oc9/9e03yiTmgjv4/b7oDHcgMUMnE=; b=ukVDXu8pp5l1pC
	BK5ma/HkqdhH8ST7zGFwSBuLHEEwZ++GQ8Ot6YL/JjeqNzu6txJ/5xh27ttzyVKHkxY6A4tobyM1H
	z7Oy1n27iso9Wz4H0+ZVW9JGSJBJPDDuIgZqvYcwOz67fi/t4hz+wfp/iQId+HJEAKHDmF5AC1XcC
	niQ1DFOUqDu7+9BfnpUP/FAFNnE845AXOGLfDr8wJ8GzmF0hKCxtkLYPV3ozTFBWEnTEZrypxjEbx
	7XbzQlJ0RC5rwt5N6xEZvspTqraElCh3PAalUcijsLBQUggEW8s8sxo8eXqPvNDMsGi14foxFhSHg
	ZljwcBYuru00/MfDyYLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lvypb-00A2M0-PJ; Wed, 23 Jun 2021 09:05:59 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lvypY-00A2KZ-1W
 for linux-riscv@lists.infradead.org; Wed, 23 Jun 2021 09:05:58 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-108-3xH7Sk6BPwS58IEzlMBB7Q-1; Wed, 23 Jun 2021 10:05:49 +0100
X-MC-Unique: 3xH7Sk6BPwS58IEzlMBB7Q-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Wed, 23 Jun
 2021 10:05:48 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Wed, 23 Jun 2021 10:05:48 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Matteo Croce' <mcroce@linux.microsoft.com>
CC: Nick Kossifidis <mick@ics.forth.gr>, "linux-riscv@lists.infradead.org"
 <linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "linux-arch@vger.kernel.org"
 <linux-arch@vger.kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Atish
 Patra <atish.patra@wdc.com>, Emil Renner Berthing <kernel@esmil.dk>, Akira
 Tsukamoto <akira.tsukamoto@gmail.com>, Drew Fustini <drew@beagleboard.org>,
 Bin Meng <bmeng.cn@gmail.com>, Guo Ren <guoren@kernel.org>
Subject: RE: [PATCH v3 3/3] riscv: optimized memset
Thread-Topic: [PATCH v3 3/3] riscv: optimized memset
Thread-Index: AQHXZwMJWYnk4yvoiESUZuZXhHkP6qsfsYlggAEJ8ACAAJGKIA==
Date: Wed, 23 Jun 2021 09:05:48 +0000
Message-ID: <fe6c2f646cf1468c89622cc1d848ae0c@AcuMS.aculab.com>
References: <20210617152754.17960-1-mcroce@linux.microsoft.com>
 <20210617152754.17960-4-mcroce@linux.microsoft.com>
 <17cd289430f08f2b75b7f04242c646f6@mailhost.ics.forth.gr>
 <d0f11655f21243ad983bd24381cdc245@AcuMS.aculab.com>
 <CAFnufp1XeKM-N1MdWsNpU6NnF-dYUgGXL1W9r_DDWazTMyRHVA@mail.gmail.com>
In-Reply-To: <CAFnufp1XeKM-N1MdWsNpU6NnF-dYUgGXL1W9r_DDWazTMyRHVA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210623_020556_397728_F2002E0E 
X-CRM114-Status: GOOD (  14.65  )
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

From: Matteo Croce
> Sent: 23 June 2021 02:15
> 
> On Tue, Jun 22, 2021 at 10:38 AM David Laight <David.Laight@aculab.com> wrote:
> >
> > From: Nick Kossifidis
...
> > You can just write:
> >         cu = (unsigned long)c * 0x0101010101010101ull;
> > and let the compiler sort out the best way to generate the constant.
> >
> 
> Interesting. I see that most compilers do an integer multiplication,
> is it faster than three shift and three or?
> 
> clang on riscv generates even more instructions to create the immediate:
> 
> unsigned long repeat_shift(int c)
> {
>   unsigned long cu = (unsigned long)c;
>   cu |= cu << 8;
>   cu |= cu << 16;
>   cu |= cu << 32;
> 
>   return cu;
> }
> 
> unsigned long repeat_mul(int c)
> {
>   return (unsigned long)c * 0x0101010101010101ull;
> }
> 
> repeat_shift:
>   slli a1, a0, 8
>   or a0, a0, a1
>   slli a1, a0, 16
>   or a0, a0, a1
>   slli a1, a0, 32
>   or a0, a0, a1
>   ret
> 
> repeat_mul:
>   lui a1, 4112
>   addiw a1, a1, 257
>   slli a1, a1, 16
>   addi a1, a1, 257
>   slli a1, a1, 16
>   addi a1, a1, 257
>   mul a0, a0, a1
>   ret

Hmmm... I expected the compiler to convert it to the first form.
It is also pretty crap at generating that constant.
Stupid compilers.

In any case, for the usual case of 'c' being a constant zero
you really don't want the latency of those instructions at all.

It is almost worth just pushing that expansion into the caller.

eg by having:
#define memset(p, v, l) memset_w(p, (v) * 0x0101010101010101, l)
(or some other byte replicator).

Really annoyingly you want to write the code that generates
the 64bit constant, and then have the compiler optimise away
the part that generates the high 32 bits on 32 bits systems.
But one of the compilers is going to 'bleat' about truncating
a constant value.
Stupid compilers (again).

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
