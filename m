Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69387C48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 22:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WhRwsVMmTNhJ8rOSgivqSIAFJ3w4WrODsTHC+1vktWQ=; b=uCrSGHbFmsf6i+
	5GrV7vkQ3y2whYsiYb608nAGlYNXCpFBhgfNpAzH5PpWo+E6c7c2DTP2NkJqFgODpe9uXJ29krgLF
	kGlF3S43khAGsTGru0jQQgvMvdBB/TTQtYVadnogTNF3EW5onowozqbeQ57FF2b+alXc3qvsRwp17
	4cNDgEo0BEk8TUwkl7oJxYWMtbVg3FxFhtiWrlGaBLJzBeVkF18SGEkuQmlJHf+KcPkpZdmTnAPZy
	HRu9jhF1fhts/29WvSKY5b7ePc7i+4euFtDtPbNIrY4v+OtUpUcUkEPwDsiBm38vsoITbzB6eJaMJ
	uXLkbKnZc5L778h+z4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcBtU-0000000CLdm-1ZSe;
	Mon, 19 Feb 2024 22:13:48 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcBtR-0000000CLdF-1XUP
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 22:13:46 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-265-m_PGMIMlN6iHaxBJ_AyIiw-1; Mon, 19 Feb 2024 22:13:41 +0000
X-MC-Unique: m_PGMIMlN6iHaxBJ_AyIiw-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Mon, 19 Feb
 2024 22:13:40 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Mon, 19 Feb 2024 22:13:40 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0Jqw7ZybiBUw7ZwZWwn?= <bjorn@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>
Subject: RE: [PATCH 4/7] riscv: Simplify text patching loops
Thread-Topic: [PATCH 4/7] riscv: Simplify text patching loops
Thread-Index: AQHaYzROWznNq41EbUSlVTL0RNzcK7ESOwDw
Date: Mon, 19 Feb 2024 22:13:40 +0000
Message-ID: <cb89b03b34d6403685297f95924524a7@AcuMS.aculab.com>
References: <20240212025529.1971876-1-samuel.holland@sifive.com>
 <20240212025529.1971876-5-samuel.holland@sifive.com>
 <874je4fvxl.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <874je4fvxl.fsf@all.your.base.are.belong.to.us>
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
X-CRM114-CacheID: sfid-20240219_141345_713760_F8DD4140 
X-CRM114-Status: UNSURE (   4.77  )
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
> > -	while (patched < len && !ret) {
> > -		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr + patched), len - patched);
> > -		ret = __patch_insn_set(addr + patched, c, size);
> > +	while (len && !ret) {
> > +		size = min_t(size_t, PAGE_SIZE * 2 - offset_in_page(addr), len);

Does that need to be min_t()?
Both arguments seem to be unsigned.
(Did it even ever need to be?)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
