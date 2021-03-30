Return-Path: <SRS0=oB3y=I4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75D5EC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 08:32:32 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F024B6157F
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Mar 2021 08:32:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F024B6157F
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ACULAB.COM
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=vAVWiqGJiM59ZeBGnF9RsHdWKNnwgNePRa5p6TGNnjg=; b=IWn+IzHbu40sUgxALsAf4tqJ9
	KhVdRZj4ZZMBAmXwNQqHl7PY4uWSwlPkEchh9+zFeKnaGbch72GZEKGozwIXHa8iLjD7ulzYJSdpF
	p7Oe2YG9HdN0oRJeX3zUuqKdqNWbflwS6cKqX6juGDU3BHv9xi02/ZW/ta8mdJZKoSazXBjma1xKC
	cJdI+xpuvNqJY86sVenlL7ZwS9NmR8eKPQZBkySB39Gxd9XDknOS+1dIUVSqEM+jlFL4lZpwvLE/Q
	Q3J5KXyvWlMMC6RJWq1bIMlVFYY9rf5IMJess26EC6Ly2EMRKL4ebyoWB2f2mhrX5lr2UrgHA06ni
	PDnOFYkSw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lR9nK-0031ep-8U; Tue, 30 Mar 2021 08:32:14 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lR9nE-0031eQ-SR
 for linux-riscv@lists.infradead.org; Tue, 30 Mar 2021 08:32:11 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) (Using
 TLS) by relay.mimecast.com with ESMTP id
 uk-mta-228-1J3o_GQdNMSaHrENW9vpNw-1; Tue, 30 Mar 2021 09:32:01 +0100
X-MC-Unique: 1J3o_GQdNMSaHrENW9vpNw-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.2; Tue, 30 Mar 2021 09:31:59 +0100
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.012; Tue, 30 Mar 2021 09:31:59 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>, Peter Zijlstra <peterz@infradead.org>
CC: linux-riscv <linux-riscv@lists.infradead.org>, Linux Kernel Mailing List
 <linux-kernel@vger.kernel.org>, "linux-csky@vger.kernel.org"
 <linux-csky@vger.kernel.org>, linux-arch <linux-arch@vger.kernel.org>, "Guo
 Ren" <guoren@linux.alibaba.com>, Will Deacon <will@kernel.org>, Ingo Molnar
 <mingo@redhat.com>, Waiman Long <longman@redhat.com>, Arnd Bergmann
 <arnd@arndb.de>, Anup Patel <anup@brainfault.org>
Subject: RE: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Thread-Topic: [PATCH v4 3/4] locking/qspinlock: Add
 ARCH_USE_QUEUED_SPINLOCKS_XCHG32
Thread-Index: AQHXJRLqafLiHQrxhUmfjrWfh9X/MKqcMq2w
Date: Tue, 30 Mar 2021 08:31:59 +0000
Message-ID: <d21f5915f9e54a20b39a4fbc2941b0b6@AcuMS.aculab.com>
References: <1616868399-82848-1-git-send-email-guoren@kernel.org>
 <1616868399-82848-4-git-send-email-guoren@kernel.org>
 <YGGGqftfr872/4CU@hirez.programming.kicks-ass.net>
 <CAJF2gTQNV+_txMHJw0cmtS-xcnuaCja-F7XBuOL_J0yN39c+uQ@mail.gmail.com>
 <YGG5c4QGq6q+lKZI@hirez.programming.kicks-ass.net>
 <CAJF2gTQUe237NY-kh+4_Yk4DTFJmA5_xgNQ5+BMpFZpUDUEYdw@mail.gmail.com>
 <YGHM2/s4FpWZiEQ6@hirez.programming.kicks-ass.net>
 <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
In-Reply-To: <CAJF2gTRncV1+GT7nBpYkvfpyaG57o9ecaHBjoR6gEQAkG2ELrg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20210330_093209_336814_D0C0603B 
X-CRM114-Status: GOOD (  13.04  )
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

From: Guo Ren
> Sent: 30 March 2021 04:14
...
> > Step 1 would be to get your architecute fixed such that it can provide
> > fwd progress guarantees for LL/SC. Otherwise there's absolutely no point
> > in building complex systems with it.
> 
> Quote Waiman's comment [1] on xchg16 optimization:
> 
> "This optimization is needed to make the qspinlock achieve performance
> parity with ticket spinlock at light load."
> 
> [1] https://lore.kernel.org/kvm/1429901803-29771-6-git-send-email-Waiman.Long@hp.com/
> 
> So for a non-xhg16 machine:
>  - ticket-lock for small numbers of CPUs
>  - qspinlock for large numbers of CPUs
> 
> Okay, I'll put all of them into the next patch :P

Doesn't that also imply that you need ticket-locks for
lightly contended locks even with a lot of CPUs?

If you actually get a lot of CPUs waiting on the same spinlock
you probably ought to change the code to reduce lock contention.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
