Return-Path: <SRS0=YeFR=LC=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8AE7C47082
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 11:49:34 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A55EB6139A
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jun 2021 11:49:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A55EB6139A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HAa35qKxpCH9pgJPHoBjgbKe35BlKge8fam5nN8C+VY=; b=oaFnFSvHD8WB1l
	01z4KYC73VE7G9N80WoYueo5zcu0oakBfwANF4WE4+LXdQl88dZ/F756uNM0h6YrfgfNajTK00K34
	CAGvCy/OOVu4e1uuJQwj4JRRpK9TAoZbcmCVeqTUPsIh3udTureiCu3sfo/0V9hM9ysjRtSG80Ya7
	uTLukZyXt05aRmpeKvmLiti1JOC9nMhfC0I4q1QGQPCIqu4b16I2fTNMPn6ywGi9MDXR/R7Hwyv4Y
	40NAI6JH9OkE4qVGL7g40F0Vzi7bU/44qAMfDp6n6/5NDKgChRnEmFjpgfb6qQg0MQe+mQvQAJN27
	D62K6qAlu3qMPpSo1qIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqaEN-0087IX-4U; Tue, 08 Jun 2021 11:49:15 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqZxT-008375-7S
 for linux-riscv@lists.infradead.org; Tue, 08 Jun 2021 11:31:49 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-237-4PJJ-y6jPCSvRvqvFJVMeA-1; Tue, 08 Jun 2021 12:31:41 +0100
X-MC-Unique: 4PJJ-y6jPCSvRvqvFJVMeA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.18; Tue, 8 Jun 2021 12:31:40 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.018; Tue, 8 Jun 2021 12:31:40 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Akira Tsukamoto' <akira.tsukamoto@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Gary Guo <gary@garyguo.net>, Nick Hu
 <nickhu@andestech.com>, Nylon Chen <nylon7@andestech.com>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, "Linux
 kernel mailing list" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 1/1] riscv: prevent pipeline stall in
 __asm_to/copy_from_user
Thread-Topic: [PATCH 1/1] riscv: prevent pipeline stall in
 __asm_to/copy_from_user
Thread-Index: AQHXWSgp7oRD1A6yb0KBcJjcvPCgrasJ/Lbg
Date: Tue, 8 Jun 2021 11:31:40 +0000
Message-ID: <67dab8dc517f4add8b0c29074a6b3f06@AcuMS.aculab.com>
References: <CACuRN0NjftJDUAsF2pkXbx0jnJ=bba9+j-hJA8Mjj0r4RVicLA@mail.gmail.com>
 <CACuRN0Pd8VFTz55qzXvJeqOEt2ZGi--j1wDyqnAt=q_42ES++w@mail.gmail.com>
In-Reply-To: <CACuRN0Pd8VFTz55qzXvJeqOEt2ZGi--j1wDyqnAt=q_42ES++w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210608_043147_601224_0FDA915B 
X-CRM114-Status: GOOD (  11.55  )
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

From: Akira Tsukamoto
> Sent: 04 June 2021 10:57
> 
> Reducing pipeline stall of read after write (RAW).
> 
> These are the results from combination of the speedup with
> Gary's misalign fix. Speeds up from 680Mbps to 900Mbps.
> 
> Before applying these two patches.

I think the changes should be in separate patches.
Otherwise it is difficult to see what is relevant.
It also looks as if there is a register rename.
Maybe that should be a precursor patch?
...

I think this is the old main copy loop:
>  1:
> -    fixup REG_L, t2, (a1), 10f
> -    fixup REG_S, t2, (a0), 10f
> -    addi a1, a1, SZREG
> -    addi a0, a0, SZREG
> -    bltu a1, t1, 1b
and this is the new one:
>  3:
> +    fixup REG_L a4,       0(a1), 10f
> +    fixup REG_L a5,   SZREG(a1), 10f
> +    fixup REG_L a6, 2*SZREG(a1), 10f
> +    fixup REG_L a7, 3*SZREG(a1), 10f
> +    fixup REG_L t0, 4*SZREG(a1), 10f
> +    fixup REG_L t1, 5*SZREG(a1), 10f
> +    fixup REG_L t2, 6*SZREG(a1), 10f
> +    fixup REG_L t3, 7*SZREG(a1), 10f
> +    fixup REG_S a4,       0(t5), 10f
> +    fixup REG_S a5,   SZREG(t5), 10f
> +    fixup REG_S a6, 2*SZREG(t5), 10f
> +    fixup REG_S a7, 3*SZREG(t5), 10f
> +    fixup REG_S t0, 4*SZREG(t5), 10f
> +    fixup REG_S t1, 5*SZREG(t5), 10f
> +    fixup REG_S t2, 6*SZREG(t5), 10f
> +    fixup REG_S t3, 7*SZREG(t5), 10f
> +    addi a1, a1, 8*SZREG
> +    addi t5, t5, 8*SZREG
> +    bltu a1, a3, 3b

I don't know the architecture, but unless there is a stunning
pipeline delay for memory reads a simple interleaved copy
may be fast enough.
So something like:
	a = src[0];
	do {
		b = src[1];
		src += 2;
		dst[0] = a;
		dst += 2;
		a = src[0];
		dst[-1] = b;
	} while (src != src_end);
	dst[0] = a;

It is probably worth doing benchmarks of the copy loop
in userspace.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
