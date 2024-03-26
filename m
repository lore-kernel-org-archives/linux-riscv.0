Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EE58C6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 10:20:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nAZeGUe7jVhGaWWDldlNTECEBaNNSU16iXcropKZruU=; b=IWnIowUgfLKLeg
	MIN/JRSEzG3kujnLfD8gQCxCc2G96XUR1pT0Jt2SdyCdeO3Eb3wNWMsSeyoyC5hzsE193Gb41+4Wp
	HhyTR8mh+1DyOjae8GPyTnphmhXTIuMFAUjQNiO0EOYHk7uPbtLqa427hWpQ9eyj01kWK67ij4Gdv
	hN2tUASu/g5T+zZQ91dVdmWS4hQxRbwfOIL/NZQL34G7qhumiXskaGKzvEnwjInInXlEHp4KGGCx7
	sKq1WhBWAMyzIMsI/+fcXLRmkQtrOFLv5xj1DQQQGDHbNBCrSIhy9fNvNRjSzses4E84Wn/RrDVuC
	qeU7t45lzl+QjrdV7V9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp3uW-000000041G0-1PBX;
	Tue, 26 Mar 2024 10:20:04 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp3uS-000000041Cp-2Wax
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 10:20:02 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-88-FBtS3KNePk6yGweZO_w26Q-1; Tue, 26 Mar 2024 10:19:53 +0000
X-MC-Unique: FBtS3KNePk6yGweZO_w26Q-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 26 Mar
 2024 10:19:28 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 26 Mar 2024 10:19:28 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>
CC: Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland
	<samuel.holland@sifive.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	"Palmer Dabbelt" <palmer@dabbelt.com>, "linux-riscv@lists.infradead.org"
	<linux-riscv@lists.infradead.org>, Albert Ou <aou@eecs.berkeley.edu>, "Andrew
 Morton" <akpm@linux-foundation.org>, Charlie Jenkins <charlie@rivosinc.com>,
	guoren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Kemeng Shi
	<shikemeng@huaweicloud.com>, Matthew Wilcox <willy@infradead.org>, "Mike
 Rapoport" <rppt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, "Xiao
 W Wang" <xiao.w.wang@intel.com>, Yangyu Chen <cyy@cyyself.name>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Thread-Topic: [PATCH] riscv: Define TASK_SIZE_MAX for __access_ok()
Thread-Index: AQHaeh3F9DUQSIkEB0u5Xt52XMTyX7FHT0cAgAGlN9CAAN1lkA==
Date: Tue, 26 Mar 2024 10:19:28 +0000
Message-ID: <882fc86da89f4adb81570cde3a653e6f@AcuMS.aculab.com>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
 <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
 <d323eb10-c79b-49cb-94db-9b135e6fd280@ghiti.fr>
 <ZgGosOiW6mTeSnTL@FVFF77S0Q05N>
 <eeccbc9f-7544-42c9-964f-2b4c924c2b2f@app.fastmail.com>
 <ZgHCpgHh1ypSyrtv@FVFF77S0Q05N>
 <95eb125d-dd54-42f1-b080-938faca6a8a1@app.fastmail.com>
In-Reply-To: <95eb125d-dd54-42f1-b080-938faca6a8a1@app.fastmail.com>
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
X-CRM114-CacheID: sfid-20240326_032000_938569_A2DCE906 
X-CRM114-Status: GOOD (  17.33  )
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
> Sent: 25 March 2024 20:38
> 
> On Mon, Mar 25, 2024, at 19:30, Mark Rutland wrote:
> > On Mon, Mar 25, 2024 at 07:02:13PM +0100, Arnd Bergmann wrote:
> >> On Mon, Mar 25, 2024, at 17:39, Mark Rutland wrote:
> >
> >> If an architecture ignores all the top bits of a virtual address,
> >> the largest TASK_SIZE would be higher than the smallest (positive,
> >> unsigned) PAGE_OFFSET, so you need TASK_SIZE_MAX to be dynamic.
> >
> > Agreed, but do we even support such architectures within Linux?
> 
> Apparently not.
> 
> On 32-bit architectures, you often have TASK_SIZE==PAGE_OFFSET,
> but not on 64-bit -- either the top few bits in PAGE_OFFSET are
> always ones, or the user and kernel page tables are completely
> separate.

ISTR that arm64 uses (something like) bit 56 to select kernel
with the annoying 'feature' that the high bits can be ignored
just to complicate things.

But I also recall the people that want 'address masking' for x86-64
have been persuaded that addresses with the top bit set are invalid.
I has to be said that I'm not sure that aliasing user addresses
like that is a good idea.
If the TLB/PTE verified the masked bits it might be more use.

If bit63 selects kernel addresses (as in x86-64) there is a massive
(non-canonical address) gap before the first valid kernel address
that is larger than the user address space (and hence buffer size).
I think that lets access_ok() check ((address | size) >> 60) != 0.
Although it probably means that you don't need to test 'size' at all
(unless some code probes the last byte of the buffer).

For 32bit the user/kernel boundary is usually 0x80000000 or 0xc0000000
and there may not even be an invalid page between the two.
This does require access_ok() check the length (even for get_user()).

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
