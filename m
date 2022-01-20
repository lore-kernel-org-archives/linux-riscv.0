Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D4CC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 12:53:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MQ6tApOc+8nGB6TIr3a3t7xCJjDMmuDKoy8Yl7x7dXI=; b=dgZCyYft4cpiMo
	CsfbE+POzDyfEIVNrxgMEvWwIEVhhEoC61DY8gEjSIXsUrZYgrs6sc/iYzJexH8ekfLG8vs64mG8+
	/jgkP4SmXXYFcNg5XJs7WER3hZmarCuSJXckKJw6gNrnANIO8v942h5sV/jqJAFeCezYpkAC0Sxnl
	GPMV9y1MIRD9ueqCuES3aT5+RadtCeXpR8HmfjeDAzOEzXexVNZAhGaFk4ko8ylTkvWbgfdoeFWLV
	Bkq1Oc3rUh4tdweZGoE2ZTLmvsezIfnJbZNXDo0tcLq/Gjbv0GxjpzpASMnrqhX+xoe/KBxfAcAsV
	P/DMjc3qrhMQWd/HIOgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAWwJ-00BRxO-Ox; Thu, 20 Jan 2022 12:53:19 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAWwH-00BRvM-6R
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 12:53:18 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-321-XSo6eQ28MlKlbqVx3cst0g-1; Thu, 20 Jan 2022 12:53:13 +0000
X-MC-Unique: XSo6eQ28MlKlbqVx3cst0g-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 20 Jan 2022 12:53:11 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 20 Jan 2022 12:53:11 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
CC: Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>,
 gregkh <gregkh@linuxfoundation.org>, liush <liush@allwinnertech.com>, Wei Fu
 <wefu@redhat.com>, Drew Fustini <drew@beagleboard.org>, Wang Junqiang
 <wangjunqiang@iscas.ac.cn>, Christoph Hellwig <hch@lst.de>, Christoph Hellwig
 <hch@infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, linux-riscv
 <linux-riscv@lists.infradead.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, linux-s390 <linux-s390@vger.kernel.org>,
 sparclinux <sparclinux@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, "inux-parisc@vger.kernel.org"
 <inux-parisc@vger.kernel.org>, "open list:BROADCOM NVRAM DRIVER"
 <linux-mips@vger.kernel.org>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, the arch/x86 maintainers
 <x86@kernel.org>, Guo Ren <guoren@linux.alibaba.com>
Subject: RE: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Thread-Topic: [PATCH V3 07/17] riscv: compat: Re-implement TASK_SIZE for
 COMPAT_32BIT
Thread-Index: AQHYDePReMzknTU7UkCjQWPLhaJn7Kxr3G8g
Date: Thu, 20 Jan 2022 12:53:11 +0000
Message-ID: <f16cf10425a14c2e8183d5c90667ce72@AcuMS.aculab.com>
References: <20220120073911.99857-8-guoren@kernel.org>
 <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
In-Reply-To: <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220120_045317_547889_3AC5B189 
X-CRM114-Status: UNSURE (   7.68  )
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

> > Limit 32-bit compatible process in 0-2GB virtual address range
> > (which is enough for real scenarios), because it could avoid
> > address sign extend problem when 32-bit enter 64-bit and ease
> > software design.

Eh?
I thought nearly all the other 32bit unix ports (of any flavour)
put the user-kernel boundary at 3GB.
(Apart from some very old sparc ones that use 3.5GB.)

2GB is used by Windows.

I think the x86-64 32bit compat code even puts the boundary at 4GB.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
