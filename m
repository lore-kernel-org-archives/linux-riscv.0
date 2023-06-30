Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DC4FEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Jun 2023 08:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p1TA/whKJv9y1HDKijDkXdLYEb1MDntp8qhB+tE+A0w=; b=LvJSlkPPWW3XIC
	7EvyCyRLYhRNK2kk1FISwTtZO/dZLGOEGPaRudr3q99MEKzSW1Eccroe/sSwv1bAFYhjgHu592sOR
	2fmLsFGlu0dDSeALEcRpHCi3vAsmOAkBa+H/2S6wTbhV9O4IgosXX7VlRwKwvPxUiiKQtzNLhZMj/
	/FPWffkHcQe2p3itXxc5v/qbzkPFL3m/Pk6UGjg1i2gNirLZABXYjBkb5N/bQ0l+d+VMJNJyWw7lV
	yflINyJSsBxemAS0+teJhfGhxG4Ny6IkYw6bA/LEmUtqHsuGVze5GzLc2Un73mWd1lew7pi7eQKkB
	ub2HMvev+bfLle5t3PdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9Vn-003At3-0D;
	Fri, 30 Jun 2023 08:29:51 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qF9Vj-003AsZ-2b
	for linux-riscv@lists.infradead.org;
	Fri, 30 Jun 2023 08:29:49 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-272-sTh1UJeJMDO3OsTYjnjZSA-1; Fri, 30 Jun 2023 09:29:43 +0100
X-MC-Unique: sTh1UJeJMDO3OsTYjnjZSA-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 30 Jun
 2023 09:29:42 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 30 Jun 2023 09:29:42 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Evan Green' <evan@rivosinc.com>
CC: Jessica Clarke <jrtc27@jrtc27.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, Yangyu Chen
	<cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren
	<guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-riscv
	<linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>,
	"Xianting Tian" <xianting.tian@linux.alibaba.com>, Masahiro Yamada
	<masahiroy@kernel.org>, Greentime Hu <greentime.hu@sifive.com>, Simon Hosie
	<shosie@rivosinc.com>, Li Zhengyu <lizhengyu3@huawei.com>, Andrew Jones
	<ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Heiko Stuebner
	<heiko.stuebner@vrull.eu>, Anup Patel <apatel@ventanamicro.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Sia Jee Heng
	<jeeheng.sia@starfivetech.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Andy
 Chiu" <andy.chiu@sifive.com>
Subject: RE: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Thread-Topic: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Thread-Index: AQHZqSszK74IXZi1x0Sk5pxi8WFXO6+hr6jwgACq1QCAAKe+MA==
Date: Fri, 30 Jun 2023 08:29:42 +0000
Message-ID: <b9a23f8947014fdbb625d67134ed796d@AcuMS.aculab.com>
References: <20230623222016.3742145-1-evan@rivosinc.com>
 <20230623222016.3742145-2-evan@rivosinc.com>
 <64F2D853-61E5-49CF-BAB5-AAFB8697683E@jrtc27.com>
 <CALs-HssZG8daTJaRK8JPT0VRk=23CtO6B_5kq4Xa_DdLELjaZw@mail.gmail.com>
 <53dc6959cc8849d6b66676ad48c1376a@AcuMS.aculab.com>
 <CALs-HstgcnK=prSHm9D7bqWc05q52ObA5kozmxzr-euR=CFfKw@mail.gmail.com>
In-Reply-To: <CALs-HstgcnK=prSHm9D7bqWc05q52ObA5kozmxzr-euR=CFfKw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230630_012948_107041_BFD8863F 
X-CRM114-Status: GOOD (  11.52  )
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
> Yeah, one thing I could do is disable interrupts, measure the cycle
> count of doing an individual iteration, do this N times, and take the
> minimum value as the time to compare. In the end I'll then have two
> numbers to compare, like I do in this patch. In theory the variance on
> that should be really tight. N will have to depend on the overall
> amount of time I'm taking so as not to shut interrupts off for very
> long. Let me experiment with this and see how the results look.
> -Evan

I doubt you'll need many iterations or a long test.

You can do tests in userspace without disabling pre-emption
or interrupts - the large/silly values they generate are
easily ignored.

I suspect you'll get enough info from something like:
	unsigned long x[2];
	volatile unsigned long *p = (void *)((unsigned char *)x + 1);
	full_cpu_barrier()
	start = rdtsc();
	full_cpu_barrier();
	*p; *p; *p; *p; *p; *p; *p; *p;
	*p; *p; *p; *p; *p; *p; *p; *p;
	full_cpu_barrier()
	elapsed = rdtsc() - start;
Once the i-cache is loaded it should be pretty constant.
For aligned addresses I'd expect each extra '*p' to be
one more clock.
With hardware support for misaligned transfers at most
2 clocks (test on x86 and it will be 1 clock).
The emulated version will be 100s or 1000s.
	
I'm not sure how much of a cpu barrier you need.
Definitely needs to wait for all memory accesses
and the rdtsc().

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
