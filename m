Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A777AC46CD2
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Dec 2023 14:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RMNo1K1waRJj1tvcRaRTtk4Hlo6igpJy1NF3gciMltg=; b=BG4yCXHaZM+YVd
	oiGVkYRsE2gnYARhGXYIteOFaHcQlIArKUeNJk0Y1XciH7n3a+gPKg1DO/Z+U5gkFTJKoAWH+lvph
	dUxRfFLuxZQCDFhEwhWKauUnp/ZqLBjZz4aAgJsWbKKIeXDqdglqnB9HjSvhQ0pmZnYHTIVKWZ8JZ
	yqrRDc1hoX/tNUa/TOhmEHrMZPQT+Viq20SYCzkyI6v6BC/f/IZctjbd4M3yxpw+QjXFCy+MwXj7w
	sJiNHHGOmZnetbywzmnjWyngDgnF9OvpOH9bY41Jx9bz4cspfcHh4l/HyuPjSa/sZW9RxMbE1JxHs
	b5kMmaC250lzKpSgvPyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rHPcW-009Us4-0n;
	Sun, 24 Dec 2023 14:38:24 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rHPcT-009UqZ-18
	for linux-riscv@lists.infradead.org;
	Sun, 24 Dec 2023 14:38:23 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-270-G_GBy4ibM22dzQOYQeJs3A-1; Sun, 24 Dec 2023 14:38:13 +0000
X-MC-Unique: G_GBy4ibM22dzQOYQeJs3A-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 24 Dec
 2023 14:37:54 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 24 Dec 2023 14:37:54 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guo Ren' <guoren@kernel.org>
CC: Leonardo Bras <leobras@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "paul.walmsley@sifive.com"
	<paul.walmsley@sifive.com>, "palmer@dabbelt.com" <palmer@dabbelt.com>,
	"alexghiti@rivosinc.com" <alexghiti@rivosinc.com>, "charlie@rivosinc.com"
	<charlie@rivosinc.com>, "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
	"david@redhat.com" <david@redhat.com>, "panqinglin2020@iscas.ac.cn"
	<panqinglin2020@iscas.ac.cn>, "rick.p.edgecombe@intel.com"
	<rick.p.edgecombe@intel.com>, "willy@infradead.org" <willy@infradead.org>,
	"bjorn@rivosinc.com" <bjorn@rivosinc.com>, "conor.dooley@microchip.com"
	<conor.dooley@microchip.com>, "cleger@rivosinc.com" <cleger@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, Guo Ren
	<guoren@linux.alibaba.com>
Subject: RE: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
Thread-Topic: [PATCH V2 4/4] riscv: mm: Optimize TASK_SIZE definition
Thread-Index: AQHaNMmXQnV6P1CryUOzF1IfQQ8rsbC1Lv+wgAD9mACAAH0Z4IAA/HsAgADbDKA=
Date: Sun, 24 Dec 2023 14:37:54 +0000
Message-ID: <794c14d6c979495e869d7ba03a935e3b@AcuMS.aculab.com>
References: <20231221154702.2267684-1-guoren@kernel.org>
 <20231221154702.2267684-5-guoren@kernel.org> <ZYUZ8QUJxCL93Fgv@LeoBras>
 <CAJF2gTTX7AjexoRUw=ZS34HEWno7H3zvnXA+Q7TYsztNU=k2cg@mail.gmail.com>
 <e3f1521a9f04463587d07d0c99534d5a@AcuMS.aculab.com>
 <CAJF2gTRD827Fbs_2FxBP=Z8yudfAAqG6dA+a9eq74RMOz2WDnw@mail.gmail.com>
 <9d4d15e8e3e944b8bd18e8bc1d54f59c@AcuMS.aculab.com>
 <CAJF2gTQjixePmc8qNJZB+kfyzjVb+NqFHR6GOow-aNhN883CQA@mail.gmail.com>
In-Reply-To: <CAJF2gTQjixePmc8qNJZB+kfyzjVb+NqFHR6GOow-aNhN883CQA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20231224_063821_677423_C8B0B8AA 
X-CRM114-Status: GOOD (  10.87  )
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
> Sent: 24 December 2023 01:24
...
> > One possibility would be to save the task's max user address
> > in the task structure itself - that would save all the conditionals
> > at a cost of an extra value in the task structure.

> It would still cause memory load operation, although it is $tp->xxx.

All the (mispredicted) branches are likely to cause more of a
problem than a load from the current task structure.

> If we want to gain observability benefits, "just check (ptr | (ptr +
> len)) < 0)" is better.

If you can guarantee a faulting page between user and kernel addresses
and assume (check) that the accesses are 'reasonably sequential'
then you only need to check the base address.
That is likely hard for 32bit but easier for 64bit (except arm64)
because A63 and A62 have to match.
Unless you have some hardware address masking which makes it much
more likely that 'random values' will be valid addresses.
(Someone remind me why that is a good idea unless the high bits
are validated by the hardware.)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
