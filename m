Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F45BC6FD1F
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Mar 2024 19:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jmhlZQWJi9MwV7MfOjqw3rLNPLk+HgMkzZXKcQ1KoFo=; b=OyVL4zfIk/qcR4
	nys9I+nf4OYACu2yri0WCL17miyANu7Yi9T5L2STiB1qUocS+hAAuy+o4AR9jT0CneuLSwkzAYzts
	DlYnm0yNMAc9raAwDqUH/x7LntYX/myUKYGQgRBODZ9mnZsIWKtZ2v5WK8foerAkNP0ETTSowABbF
	6lk/nlGFiicV25w4O4wZlSx5ViI8322I9/fmwQDPluZLabUJ95N2O1bzQB90nRIMmiBo3nSYcudlA
	R/Cgcs7ZnmN+u3834t6+0Sawch7dk/idtaHPmnzjz9ZwIO7FxzlLEfL2V/aEK9h6jSuj6Hc12tVSp
	pFTPKbE83J56xrIzFyTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roTjy-0000000DKD2-193V;
	Sun, 24 Mar 2024 19:42:46 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roTjt-0000000DKC5-3jWj
	for linux-riscv@lists.infradead.org;
	Sun, 24 Mar 2024 19:42:44 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-167-cBerPzxMMvq7r4HSCZcRYg-1; Sun, 24 Mar 2024 19:42:32 +0000
X-MC-Unique: cBerPzxMMvq7r4HSCZcRYg-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Sun, 24 Mar
 2024 19:42:01 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Sun, 24 Mar 2024 19:42:01 +0000
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
Thread-Index: AQHaeh3F9DUQSIkEB0u5Xt52XMTyX7FHT0cA
Date: Sun, 24 Mar 2024 19:42:01 +0000
Message-ID: <f786e02245424e02b38f55ae6b29d14a@AcuMS.aculab.com>
References: <20240313180010.295747-1-samuel.holland@sifive.com>
 <CAHVXubjLWZkjSapnsWJzimWg_2swEy7tQ-DQ6ri8yMk8-Qsc-A@mail.gmail.com>
 <88de4a1a-047e-4be9-b5b0-3e53434dc022@sifive.com>
 <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
In-Reply-To: <b5624bba-9917-421b-8ef0-4515d442f80b@ghiti.fr>
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
X-CRM114-CacheID: sfid-20240324_124242_262661_BB487615 
X-CRM114-Status: GOOD (  10.92  )
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
> The use of alternatives allows to return right away if the buffer is
> beyond the usable user address space, and it's not just "slightly
> faster" for some cases (a very large buffer with only a few bytes being
> beyond the limit or someone could fault-in all the user pages and fail
> very late...etc). access_ok() is here to guarantee that such situations
> don't happen, so actually it makes more sense to use an alternative to
> avoid that.

Is it really worth doing ANY optimisations for the -EFAULT path?
They really don't happen.

The only fault path that matters is the one that has to page in
data from somewhere.

Provided there is a gap between the highest valid user address and the
lowest valid kernel address (may not be true on some 32bit systems)
and copy_to/from_user() do 'increasing address' copies then the
access_ok() check they do can almost certainly ignore the length.

This may be true for pretty much all access_ok() tests?
It would certainly simplify the test.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
