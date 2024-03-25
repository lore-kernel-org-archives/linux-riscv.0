Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B6CC54E64
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 09:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tdsFG2/b6vCGjzsfoZhneeVdjkIU//g9CWd5VIdgdw=; b=CkU1N7Yd3FSbJ8
	imEh0ZjFsQTMA9ylKt59nCPmNsrbPwZPh3WH1TVIjJamPHULBP91oR4QfEhm5IqnupHVxs8EjJorK
	eqevi0tsk6sZQdDN9ZfTMr6AGxNDjH4l8aBT/NjEY5aRlZRAkLMNOUSOWu7q5IdBT/3+d6ICKobm2
	tiv63GlxZgWaviPotWk3IRO4q/08Q6B8jUOGa3v3laMMqj+UHM/bpwJ6oPjUEwlMrriIm+bk9YL+f
	YRN6yfEdqGMbkgMUS9aBkA/aVeB5/NqDynEeVlCTMzy0ne7L5sI3f/a7PAu3zirj0wykmY6kMBl0V
	7zz51kduja07Fx9SjqlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rogfb-0000000GSwu-3m7K;
	Mon, 25 Mar 2024 09:31:07 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rogfV-0000000GSrt-0RVX
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 09:31:05 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-198-vdeQgxrwP92fV7WlkXqR2A-1; Mon, 25 Mar 2024 09:30:56 +0000
X-MC-Unique: vdeQgxrwP92fV7WlkXqR2A-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 25 Mar
 2024 09:30:23 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 25 Mar 2024 09:30:23 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Alexandre Ghiti' <alex@ghiti.fr>, Samuel Holland
	<samuel.holland@sifive.com>, Alexandre Ghiti <alexghiti@rivosinc.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Albert Ou <aou@eecs.berkeley.edu>, "Andrew
 Morton" <akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>,
	Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Kemeng Shi
	<shikemeng@huaweicloud.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Xiao Wang <xiao.w.wang@intel.com>, Yangyu Chen
	<cyy@cyyself.name>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Thread-Topic: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Thread-Index: AQHaeh3F9DUQSIkEB0u5Xt52XMTyX7FHT0cAgADJJoCAAB400A==
Date: Mon, 25 Mar 2024 09:30:23 +0000
Message-ID: <5c027cbf6b8741e4a8147963b07a8ac4@AcuMS.aculab.com>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
 <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
In-Reply-To: <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
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
X-CRM114-CacheID: sfid-20240325_023101_608493_B667423D 
X-CRM114-Status: GOOD (  19.85  )
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

From: Alexandre Ghiti
> Sent: 25 March 2024 07:31
> 
> Hi David,
> 
> On 24/03/2024 20:42, David Laight wrote:
> > ...
> >> The use of alternatives allows to return right away if the buffer is
> >> beyond the usable user address space, and it's not just "slightly
> >> faster" for some cases (a very large buffer with only a few bytes being
> >> beyond the limit or someone could fault-in all the user pages and fail
> >> very late...etc). access_ok() is here to guarantee that such situations
> >> don't happen, so actually it makes more sense to use an alternative to
> >> avoid that.
> >
> > Is it really worth doing ANY optimisations for the -EFAULT path?
> > They really don't happen.
> >
> > The only fault path that matters is the one that has to page in
> > data from somewhere.
> 
> 
> Which is completely avoided with a strict definition of access_ok(). I
> see access_ok() as an already existing optimization of fault paths by
> avoiding them entirely when they are bound to happen.

No, access_ok() exists because accesses to kernel addresses don't fault.
Possibly in linux 0.01 it tried to ensure that the access was valid
(by checking the process's page tables (etc) but that that hasn't been
true for a long time.

You don't want to add a single instruction (never mind a conditional)
to access_ok() to avoid a page fault on an address that will fault.

Basically real programs don't pass bad addresses into the kernel
or access them in userspace. EFAULT and SIGSEGV are pretty fatal.
(Nothing call sbrk() from its SIGSEGV handler any more!)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
