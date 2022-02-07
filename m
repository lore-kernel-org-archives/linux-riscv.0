Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BEE3C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Feb 2022 03:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2K678uHbt4E7A30zqILpVimydiB+GkEeb4CI9az2bI4=; b=QjWxT7Fe5SeunA
	HPVpmxEi0rae7pge8I5SHS6pZs/OEfRhPAEqKjBoOIIWW3PyJ3866M4ZR2zanfNYnkYlcirqXCLJN
	7s2ScKDnpdNjc0BOlSWij5bmTEZY5KuosDEj0I40XqI1MrxiheEgTpa3HQmbS+cPwYE1jZ1pZ0Kzw
	gk6jCY4Y/N5kIy9mXxP0vrEsJvgUlkt8150sBgIjEfu/GNHydeYbjqEGGldkFVjXnDjBO8O+Wo6nF
	R/6Pg9H9n8NfxoKKLBhSJ9YsRESFAOb4W2P+NlAIPDI5SWzTaD1lgdxMC+PsazMPzh8n0qvEL07p0
	Rpuha2EHiFfY+BBWJbsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGuoy-008xiD-SG; Mon, 07 Feb 2022 03:36:08 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGuov-008xhw-Ib
 for linux-riscv@lists.infradead.org; Mon, 07 Feb 2022 03:36:07 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-286-N5GTcCNKP6q1uY-4a4dHUg-1; Mon, 07 Feb 2022 03:35:57 +0000
X-MC-Unique: N5GTcCNKP6q1uY-4a4dHUg-1
Received: from AcuMS.Aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) by
 AcuMS.aculab.com (fd9f:af1c:a25b:0:994c:f5c2:35d6:9b65) with Microsoft SMTP
 Server (TLS) id 15.0.1497.28; Mon, 7 Feb 2022 03:35:55 +0000
Received: from AcuMS.Aculab.com ([fe80::994c:f5c2:35d6:9b65]) by
 AcuMS.aculab.com ([fe80::994c:f5c2:35d6:9b65%12]) with mapi id
 15.00.1497.028; Mon, 7 Feb 2022 03:35:55 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Jisheng Zhang' <jszhang@kernel.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [RFC PATCH] riscv: reduce THREAD_SIZE from 16KB to 8KB for RV64
Thread-Topic: [RFC PATCH] riscv: reduce THREAD_SIZE from 16KB to 8KB for RV64
Thread-Index: AQHYG4I1cWK2Agm31k+W40NUWVDrs6yHbd8Q
Date: Mon, 7 Feb 2022 03:35:55 +0000
Message-ID: <04326e1a50fa46eaa08df3a5df6f14f6@AcuMS.aculab.com>
References: <20220206174359.2986-1-jszhang@kernel.org>
In-Reply-To: <20220206174359.2986-1-jszhang@kernel.org>
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
X-CRM114-CacheID: sfid-20220206_193605_923274_8201AB0C 
X-CRM114-Status: UNSURE (   8.46  )
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

From: Jisheng Zhang
> Sent: 06 February 2022 17:44
> 
> After irq stack is supported, it's possible to use small THREAD_SIZE.
> In fact, I tested this patch on a Lichee RV board, looks good so far.

Is riscv using vmalloc with a guard page?

You won't find the deepest kernel stack use with trivial tests.
I'd hazard a guess that it is inside printk() in some error path.
Debugging stack overflow is horrid.

With no alloca() no recursion and limited indirect calls it is
technically possible to statically calculate maximum stack use.
But I don't think anyone has tried to do it for the linux kernel.
I did do it for an embedded system (that had almost no indirect calls)
and found we didn't have enough memory for the required stacks!

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
