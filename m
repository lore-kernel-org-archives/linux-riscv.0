Return-Path: <SRS0=SYmu=JK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4C5B0C433ED
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 10:55:08 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 023C361278
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Apr 2021 10:55:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 023C361278
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=gVBz2WxeYghaUHYMDjoN83qBuoTzwYARzdv+DT5YRyI=; b=GiliuGRC9piQdlTaXR4vChxHR
	P4ZGA9VytWYVLRkTJOSNLMw8l8Ztl++k9KKjE59qeR6wm4EFceFeUHgPszsvTYyBTrwe5sF9a4bxp
	bVJCG5n1uPdtnhRTPC3At79IxcOcrrK5LZ+5z6qdA1uf55mVgGGkbz1DeQjgBnmeecxnyynNWF/mK
	NQGdQZ9+omwLb3Bi8mjzLlMijAHBlXMy4kmAMBHF+V7bWxog5Y8NcpzpW6q7kWiXRgatuNGN4yYg4
	Q3rQfNSJDf2L0qDMXH1zlKfPKD0RzHl2CK0BH28jM1HJT7bMXKTHD2BzrKoDp5/Dhj1EFHPW+2JXA
	EVbWwesRQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lWGh5-008vUw-3c; Tue, 13 Apr 2021 10:54:55 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGgx-008vSp-RC
 for linux-riscv@desiato.infradead.org; Tue, 13 Apr 2021 10:54:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:In-Reply-To:References:Message-ID:Date:Subject:CC:
 To:From:Sender:Reply-To:Content-ID:Content-Description;
 bh=wVDfARufxu070r6Rw0/Kxsa7F7WmeOf6v2xb2vCRdbg=; b=OaVxC8gVDGHMsC2oippA01Xgeu
 CP0tcdO+MeKkQEdC2KlHxzTZTycNwiIktLqae0izdKDQCUHXrb2Gs+dSYON5vVCELdS/6XjpOyBMW
 ZnreXqM/kn+dVBv70yZJ1N+ZwIF0QbJNVOblYgdxXtha+dVJXbjf8Fvlf42yO7Olxh4/vQRdv1J3c
 yHG0GRQ674YRv0GNtKFvIlR44AZhz/fqzmQD6pDVYx6vzjrf4BKB4JUXjrPPinvjepdq/oALCVn4N
 oCHstDHkqpctYNVKxbOywcEWBIF8gN4UXxe0jM2FTJH+VctmO9ZqumWoMm+VS5e71It99vVyJJ2Ks
 E6DfTdag==;
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lWGgt-006wP3-Ve
 for linux-riscv@lists.infradead.org; Tue, 13 Apr 2021 10:54:46 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-196-tpOvhhP9PI6OZgNvLUAArQ-1; Tue, 13 Apr 2021 11:54:37 +0100
X-MC-Unique: tpOvhhP9PI6OZgNvLUAArQ-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 13 Apr 2021 11:54:36 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 13 Apr 2021 11:54:36 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Catalin Marinas' <catalin.marinas@arm.com>,
 =?iso-8859-1?Q?Christoph_M=FCllner?= <christophm30@gmail.com>
CC: Peter Zijlstra <peterz@infradead.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, Guo Ren
 <guoren@kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, "Linux
 Kernel Mailing List" <linux-kernel@vger.kernel.org>, Guo Ren
 <guoren@linux.alibaba.com>, "will.deacon@arm.com" <will.deacon@arm.com>,
 "Arnd Bergmann" <arnd@arndb.de>
Subject: RE: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Thread-Topic: [PATCH] riscv: locks: introduce ticket-based spinlock
 implementation
Thread-Index: AQHXMFIUXH3Voi0JlEKNZc90N7zZnaqyRXDQ
Date: Tue, 13 Apr 2021 10:54:36 +0000
Message-ID: <73cab48b63ea4ba3b1ef532f47d146f4@AcuMS.aculab.com>
References: <CAHB2gtS9J09VaY9ZxDJYVo2fTgS-u6p7e89aLCnwOHnYEOJR=g@mail.gmail.com>
 <mhng-03d1655e-090e-4afb-a4e3-12b4b8f0e6bf@palmerdabbelt-glaptop>
 <CAHB2gtS6x25Oquf6W4Hhh-diUuZk1GJHTD2DjrffHo93nWbUYw@mail.gmail.com>
 <YHVQNSfblP6G0Kgl@hirez.programming.kicks-ass.net>
 <CAHB2gtTmGt=V4cUgbt3zGgi+y5h0f5ON0n+MdRC8P=su670qhQ@mail.gmail.com>
 <YHVl8fFfdQDn+QYW@hirez.programming.kicks-ass.net>
 <CAHB2gtTzEuD7j-+5ztui0eV6UNiEisBTgoK+2Sr=Z0b4PPXRyA@mail.gmail.com>
 <20210413104503.GD15806@arm.com>
In-Reply-To: <20210413104503.GD15806@arm.com>
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
X-CRM114-CacheID: sfid-20210413_035444_317075_5196F8A6 
X-CRM114-Status: UNSURE (   5.44  )
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

From: Catalin Marinas
> Sent: 13 April 2021 11:45
...
> This indeed needs some care. IIUC RISC-V has similar restrictions as arm
> here, no load/store instructions are allowed between LR and SC. You
> can't guarantee that the compiler won't spill some variable onto the
> stack.

You can probably never guarantee the compiler won't spill to stack.
Especially if someone compiles with -O0.

Which probably means that anything using LR/SC must be written in
asm and the C wrappers disabled.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
