Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B921FC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 13:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=plE5yPe8Mdvh43ViBKdGkO8xAizmxnMq/9GnZVyJDow=; b=Zt3i7shI7zZFFo
	8xuJz8XXZc/GdXJKqDWvKAKRj7FcW6PRmGmugjfbuu4uOCzLBxf2YvcsKdZE4qL7Dm83/PAZxppdo
	85XtBOaWezk6lJWWvqH6N4U8XL50JJr7knMVdi7XzL19c7PXOVP58ndgIPpzDHDNZR2ELQ/Ghze2g
	2CtNE+nFgR2X35QqWjezS+UrSlSDQ7EMDfxqm/ubeePO6xcR4df0FFBJAAaIRl2Wq4y/3FwYKD7lD
	q4SZf2yJ98p7L7F3sXDq6xWLl9bLHnVf04nJ1vr4LBuDDT7B5MiQYmmorDzclb8MYZaQ2x0Y+g7Xm
	HF247rjhhi8hDMwFrSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAX5R-00BUEz-Tj; Thu, 20 Jan 2022 13:02:45 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAX5D-00BU9u-Rn
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 13:02:34 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-33-Vn3vaJQAO5ObVFev711Zzw-1; Thu, 20 Jan 2022 13:02:29 +0000
X-MC-Unique: Vn3vaJQAO5ObVFev711Zzw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 20 Jan 2022 13:02:27 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 20 Jan 2022 13:02:27 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Guo Ren <guoren@kernel.org>
CC: linux-s390 <linux-s390@vger.kernel.org>, Guo Ren
 <guoren@linux.alibaba.com>, gregkh <gregkh@linuxfoundation.org>, Drew Fustini
 <drew@beagleboard.org>, Anup Patel <anup@brainfault.org>, Wang Junqiang
 <wangjunqiang@iscas.ac.cn>, the arch/x86 maintainers <x86@kernel.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>,
 "linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>,
 "inux-parisc@vger.kernel.org" <inux-parisc@vger.kernel.org>, "Christoph
 Hellwig" <hch@infradead.org>, Palmer Dabbelt <palmer@dabbelt.com>, liush
 <liush@allwinnertech.com>, sparclinux <sparclinux@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, "open list:BROADCOM NVRAM
 DRIVER" <linux-mips@vger.kernel.org>, linuxppc-dev
 <linuxppc-dev@lists.ozlabs.org>, Christoph Hellwig <hch@lst.de>, Linux ARM
 <linux-arm-kernel@lists.infradead.org>, Wei Fu <wefu@redhat.com>
Subject: RE: [PATCH V3 03/17] asm-generic: compat: Cleanup duplicate
 definitions
Thread-Topic: [PATCH V3 03/17] asm-generic: compat: Cleanup duplicate
 definitions
Thread-Index: AQHYDfvLsUgI09Yi+EGR4Ve6KMrB5Kxr3nRg
Date: Thu, 20 Jan 2022 13:02:27 +0000
Message-ID: <f2c1a3a10bf643d693afed6d23b3baf9@AcuMS.aculab.com>
References: <20220120073911.99857-4-guoren@kernel.org>
 <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
In-Reply-To: <CAK8P3a1UmnjHk8B6hSULiKv3FKoY5BW9=4=ESerQzc+4=LR5Zw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220120_050232_244212_91B47136 
X-CRM114-Status: UNSURE (   8.93  )
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

From: Arnd Bergmann
> Sent: 20 January 2022 11:52
..
> As with compat_flock, the packed attribute has no impact on the layout
> here, but please drop it anyway for consistency.

Never mind the structure layout, because 'packed' allows the
structure to be aligned on any boundary it forces the compiler
to use byte memory accesses and shifts on some architectures.
This is a horrid performance penalty.

'packed' should only be specified for structures that can
occur on any address boundary.
ie basically never.

If you need to remove the implicit pad before a field (eg 64bit
fields on x64-32) then you can mark the field itself as 'packed'.
Although, in that case, putting the attribute on the type (compat_s64)
is generally cleaner.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
