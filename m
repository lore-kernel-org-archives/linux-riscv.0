Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AA0BC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 15:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OKXs6luwYwS+Z2gtp3AaWNc2hESgbiwu/0EP1i9YhAg=; b=1+sKiue3hpFolE
	PheloCvPtwCfY6DSvAuHo4Q+7NrsvPgzUVmilUk0JQneEhcbO8Esu3BVPoxFMCLGeeo+qR5i5bieF
	dZ6AU90ogVKHGvBY01Nyu2GHpu9ABOmSwk0LgTIszLOzAU5PIrqhb7qBBSebbb9bohOaC6o6V3zOl
	c1KmpVqpwtSH2kJ+wE+GXeqxbeLkcaUx+rne8ENNaZitCkeldnj5laIcQJqb2sd0MtNtGEXt/dx3+
	qh5vMY9vlvgi1IAF/yj3/oJaUBfJoXoFa2hMyWI98ZruMgbVfXUbAj0fY+XRs2WUxwEcYncvUPEYy
	JyvSC4VPwi7mvkpclJ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nAZds-00CDqp-Rg; Thu, 20 Jan 2022 15:46:28 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nAZdq-00CDny-3E
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 15:46:27 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-193-7WTwajXxOa6GXzO1g1m_hA-1; Thu, 20 Jan 2022 15:46:20 +0000
X-MC-Unique: 7WTwajXxOa6GXzO1g1m_hA-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Thu, 20 Jan 2022 15:46:18 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Thu, 20 Jan 2022 15:46:18 +0000
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
Thread-Index: AQHYDePReMzknTU7UkCjQWPLhaJn7Kxr3G8ggAAj9ueAAAuaMA==
Date: Thu, 20 Jan 2022 15:46:18 +0000
Message-ID: <01a8da9e5a374373a922e569a1e10ee8@AcuMS.aculab.com>
References: <20220120073911.99857-8-guoren@kernel.org>
 <CAK8P3a1UvqsS-D7cVXBkp4KCRWDfquQ6QTkvrQ=FqLxhsAi7Rw@mail.gmail.com>
 <f16cf10425a14c2e8183d5c90667ce72@AcuMS.aculab.com>
 <CAJF2gTRwh40xDBkoRJWZEUketKFDAy7_z=-WW7E=T46yH4zPvw@mail.gmail.com>
 <CAK8P3a3FLnqibdXCGR8c+mm92HSiuvocZDeW8MyoTO_L1sYT=w@mail.gmail.com>
In-Reply-To: <CAK8P3a3FLnqibdXCGR8c+mm92HSiuvocZDeW8MyoTO_L1sYT=w@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20220120_074626_452886_183FD8B8 
X-CRM114-Status: UNSURE (   9.74  )
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
> One example of software that runs into virtual memory size limitations is
> the gnu linker when building large applications, but it's unlikely that you'll
> actually need to run applications that run into this, while also needing to
> build them natively.

There are also database programs that want to mmap() large sparse files.
To some extent that is where the pressure for 64bit addresses comes from.

While (I think) most of the current riscv systems are 'toy' ones
there are definitely press reports of some quite high power systems.

I suspect they are less 'toy' than the Altera (Intel) Nios processors
we use on out fpga - you can run linux on the Nios cpu, but you probably
don't really want to do so.
Better to find an fpga with a 'proper' ARM core in the corner.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
