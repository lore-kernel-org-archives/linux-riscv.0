Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99B43E70708
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 10:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vMC4jTvL4yq3Xg1O0Y7lrNtOmLIOI/g6BnCDQksHAzc=; b=sW2S/M7Pv+W8+U
	bk1GBo+H9iS/Y0Mm4Sf9HbYCOyI2z/6rB6MoDidx8iF+lOzlurm3XNJEN3fcZAsxIyrVTIkefIA1k
	MCQehNe/Q4wL9o138X3VnGD6Z7pb1Quzj79lQ4VRxYC1AjZTbgQw5gHO7F9sTPWb5rTRQ5eUEUBpd
	voP7PzqP3AinywfGvneUSkM/c7tlmzr+T+QMjFobEnn1JW59R2EiUkP/AgiNgtmAPnb4ZnKmk337E
	0LXDhoohplkmKzG8CfPPyS6YgNgiR02iRuhRyMmu6T9PRxYrkx4e7LgB30AhG0I33TRcmZyjKVREj
	AQ9kh0UDcm8wH6QzDwJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGpT-005hUG-1J;
	Thu, 21 Sep 2023 10:22:39 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjGpP-005hTF-1v
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 10:22:37 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-53-YmAYymjVOfWQG9HEzXufqA-1; Thu, 21 Sep 2023 11:22:23 +0100
X-MC-Unique: YmAYymjVOfWQG9HEzXufqA-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Thu, 21 Sep
 2023 11:22:21 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Thu, 21 Sep 2023 11:22:21 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Evan Green' <evan@rivosinc.com>, Atish Patra <atishp@atishpatra.org>
CC: Conor Dooley <conor@kernel.org>, Anup Patel <apatel@ventanamicro.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Heiko Stuebner <heiko@sntech.de>, "Marc
 Zyngier" <maz@kernel.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, Palmer Dabbelt <palmer@rivosinc.com>, "Conor
 Dooley" <conor.dooley@microchip.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Greentime Hu <greentime.hu@sifive.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Andrew Jones <ajones@ventanamicro.com>
Subject: RE: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
Thread-Topic: [PATCH v2] RISC-V: Probe misaligned access speed in parallel
Thread-Index: AQHZ7B3VgrzHOgdWvEySUjlSCGAzg7AlERSQ
Date: Thu, 21 Sep 2023 10:22:21 +0000
Message-ID: <a94490f6b1dd43d5985a8b14aa93bd27@AcuMS.aculab.com>
References: <20230920193801.3035093-1-evan@rivosinc.com>
 <20230920-98a392b40f88c69e852e2c88@fedora>
 <CAOnJCUK7KTO0n_8wDYDxh2ULtEvMWF-re2dEX6nng_tX1AGgPw@mail.gmail.com>
 <CALs-HsuurXBZ2p=jYKvPq6ZMScugm5rBchttD6Wv9Mtupfx3NQ@mail.gmail.com>
 <CAOnJCU+YNOzw39JMjWmJFHY5QjcRrKEwULo+d9WhPfv7TejpbQ@mail.gmail.com>
 <CALs-HsvvnMFErCtShB-30xO8LR4M03riYomZy3FnvEghRua_3g@mail.gmail.com>
In-Reply-To: <CALs-HsvvnMFErCtShB-30xO8LR4M03riYomZy3FnvEghRua_3g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230921_032235_916951_83A2513D 
X-CRM114-Status: GOOD (  15.64  )
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
> > For probing alignment speed, you just care about running it on that
> > cpu. Correct ?
> 
> For this we care both about not migrating to other CPUs, and also
> secondarily minimizing disturbances while the test is being run.
> Usually I equate pre-emption with migration, but in this case I think
> the worker threads are bound to that CPU. So I'll keep the
> preempt_disable/enable where it is, since it's harmless for CPUs other
> than 0, but useful for 0. I also like it for readability as it
> highlights the critical section (as a reader, "is preemption disabled"
> would be one of my first questions when studying this).

You need to disable pre-emption to get any kind of meaningful answer.

But why do you need to run the test on more than the boot cpu?
If you've a heterogenous mix of cpu any code that looks at the answer
is going to behave incorrectly unless it has also disabled pre-emption
or is bound to a cpu.

One obvious use of the result is to setup some static branches.
But that assumes all cpu are the same.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
