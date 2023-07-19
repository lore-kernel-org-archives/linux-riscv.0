Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0685DC001B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 13:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1yzW+mt86UtRwXcC8IVmlRjZnzcQJDJglcrWHTPMf2s=; b=DJvKvV7OGFE+Ed
	3Y/yCkKvTmST84Z0OpNPN4WNgahGRAWOHf53XYwcik+2IjSck+s3gy/OSJuLO8aLjOn8iLj7jxFCp
	GbwVksG1ETZjLxsLDdZxtJaUHU7QSyOuzj75xC5JqpKhY54xO6m9GGf7L20MgKfud1H9zOSWRVbyv
	yluOuttD2r0JmsiLsZjy+gDC41mCkmzFwC+Rbuv4MnW0VVJ4RHdqRI2wClPh2pSApc06+OaWVXC7V
	tLBCJn24shgWXKC+h1z/P8uTvy7IXm+d7c+oHxkyYOKyEazZimhKNcdBI6aIjcMRi/UXaSvX/wi9E
	to/qJnB16+5rcfTEdh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qM6zx-007WYC-0O;
	Wed, 19 Jul 2023 13:13:45 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qM6zt-007WWM-2C
	for linux-riscv@lists.infradead.org;
	Wed, 19 Jul 2023 13:13:43 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-63-YbMMcMCmO-OilHXUgOA2GA-1; Wed, 19 Jul 2023 14:13:35 +0100
X-MC-Unique: YbMMcMCmO-OilHXUgOA2GA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 19 Jul
 2023 14:13:33 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 19 Jul 2023 14:13:33 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>, Celeste Liu <coelacanthushex@gmail.com>,
	Huacai Chen <chenhuacai@kernel.org>
CC: Palmer Dabbelt <palmer@rivosinc.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, Conor Dooley
	<conor.dooley@microchip.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Felix Yan <felixonmars@archlinux.org>,
	"Ruizhe Pan" <c141028@gmail.com>, Shiqi Zhang <shiqi@isrc.iscas.ac.cn>
Subject: RE: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall != -1
Thread-Topic: [PATCH v3] riscv: entry: set a0 = -ENOSYS only when syscall !=
 -1
Thread-Index: AQHZudFVNmB6tR6EIkqOlOGDQpN9Z6/BEVRQ
Date: Wed, 19 Jul 2023 13:13:33 +0000
Message-ID: <0aab577b941e4c3483ad4a7af3b42c1f@AcuMS.aculab.com>
References: <20230718210037.250665-1-CoelacanthusHex@gmail.com>
 <CAJF2gTRf0UOYhqwUm6=1YMvZt8q_72WRUHqN=L+nOWaipL+H1Q@mail.gmail.com>
In-Reply-To: <CAJF2gTRf0UOYhqwUm6=1YMvZt8q_72WRUHqN=L+nOWaipL+H1Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230719_061341_982253_C5F6AFC2 
X-CRM114-Status: UNSURE (   7.71  )
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

...
> > +               /*
> > +                * Convert negative numbers to very high and thus out of range
> > +                * numbers for comparisons.
> > +                */
> >                 ulong syscall = regs->a7;
> >
> >                 regs->epc += 4;
> > @@ -308,7 +312,7 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
> >
> >                 if (syscall < NR_syscalls)

If you leave 'syscall' signed and write:
	if (syscall >= 0 && syscall < NR_syscalls)
the compiler will use a single unsigned compare.
There is no need to 'optimise' it yourself.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
