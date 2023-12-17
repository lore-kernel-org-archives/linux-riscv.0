Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF129C46CA2
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Dec 2023 18:11:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+sPN4LrCHj1DREnyLFyzNcEzlxQA9nYr0wCVP8Z739Y=; b=VUQpCG1H5F6a+P
	mbqJCcTcBhx9/RBp1LvVXkaSL8AkEg9oqUcJIW7dGNILYPh8xAgO5fpJMjQs6QQt7OEfpK7P0UIw9
	WxNdeP0uyKkd9N4NN73gMlzv0GnTak4zGgs657/Mj1GkhV5tO2qCXUsCJ0azRGw/043z1jxWf8JOT
	Q2/+Q+qFLEnNYm8t79/2lhliGi4u50VVIlc8uzfcK9v6KEV93E3gNYg9rI9OLuX1Z09dOcQ9US6Mj
	gz+F8xdZn7QrrasEW0HhsupZ8kTh80+cvy9/gLHtE3JUFTfyP+4o3cUlvwEUXSuOPcQ6LhYSg+kNl
	ki+7D0l9ep7AP1woxxxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rEvbm-008HgB-0p;
	Sun, 17 Dec 2023 18:11:22 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rEvbk-008Hfa-0A
	for linux-riscv@lists.infradead.org;
	Sun, 17 Dec 2023 18:11:21 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mtapsc-8-8i7rSkpZMKS305nSrnFEhQ-1; Sun, 17 Dec 2023 18:11:13 +0000
X-MC-Unique: 8i7rSkpZMKS305nSrnFEhQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 17 Dec
 2023 18:10:54 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 17 Dec 2023 18:10:54 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Ivan Orlov' <ivan.orlov0322@gmail.com>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>
CC: "conor.dooley@microchip.com" <conor.dooley@microchip.com>,
	"ajones@ventanamicro.com" <ajones@ventanamicro.com>, "samuel@sholland.org"
	<samuel@sholland.org>, "alexghiti@rivosinc.com" <alexghiti@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>
Subject: RE: [PATCH] riscv: lib: Optimize 'strlen' function
Thread-Topic: [PATCH] riscv: lib: Optimize 'strlen' function
Thread-Index: AQHaLduBo9lhsHug1EOTPi9OJpSM+LCtyBWA
Date: Sun, 17 Dec 2023 18:10:54 +0000
Message-ID: <a210197c479e48778672aa13287eef88@AcuMS.aculab.com>
References: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
In-Reply-To: <20231213154530.1970216-1-ivan.orlov0322@gmail.com>
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
X-CRM114-CacheID: sfid-20231217_101120_362371_A9CC5C8C 
X-CRM114-Status: UNSURE (   3.72  )
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

From: Ivan Orlov
> Sent: 13 December 2023 15:46

Looking at the old code...

>  1:
> -	lbu	t0, 0(t1)
> -	beqz	t0, 2f
> -	addi	t1, t1, 1
> -	j	1b

I suspect there is (at least) a two clock stall between
the 'ldu' and 'beqz'.
Allowing for one clock for the 'predicted taken' branch
that is 7 clocks/byte.

Try this one - especially on 32bit:

	mov	t0, a0
	and	t1, t0, 1
	sub	t0, t0, t1
	bnez	t1, 2f
1:
	ldb	t1, 0(t0)
2:	ldb	t2, 1(t0)
	add	t0, t0, 2
	beqz	t1, 3f
	bnez	t2, 1b
	add	t0, t0, 1
3:	sub	t0, t0, 2
	sub	a0, t0, a0
	ret

Might be 6 clocks for 2 bytes.
The much smaller cache footprint will also help.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
