Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7018C3064D
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Jun 2024 15:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rMI0aYBF0P+Nik6mNz/0AToVcF5CyKzPQGXvQJetSRQ=; b=fs5gRZpK2fZqvI
	6QqRxEARnLcd+qXC3hoJT1hVvHwXjb6GFIImKinNBz5HgNoFXQjR8ESWED54IM23ST1C/1W5Xjo9p
	Tbo/tJLwD/szDNCuD1hUuOXIo4rALN2VciWnFMLgJZCWeWONJ6xzw/0w3TTxzhkfebHZ+uYgt7z8z
	VOMVo55skrDvh3g3id5kCTACsGoBYRhYOZIuyrPm7azGX7lRbxTON/Oo0rn0SOvy0wYr0JAYhlXSH
	DW84MmGIPdA5h6V/a7dDjLVRgFFPZtXEInOTdvgYciF0v/IwA04n138H0nXySAVGaC+4F2QOgbXUK
	d2/7SmLUNAGrA8SfMzuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDf2-0000000EEQM-0qyx;
	Fri, 28 Jun 2024 15:37:16 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sNDey-0000000EELw-1MTZ
	for linux-riscv@lists.infradead.org;
	Fri, 28 Jun 2024 15:37:14 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-310-OFRDPytDPtSGaHTmtLLdBQ-1; Fri, 28 Jun 2024 16:36:54 +0100
X-MC-Unique: OFRDPytDPtSGaHTmtLLdBQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Fri, 28 Jun
 2024 16:36:18 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Fri, 28 Jun 2024 16:36:17 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: 'Arnd Bergmann' <arnd@arndb.de>, Jisheng Zhang <jszhang@kernel.org>,
	Andreas Schwab <schwab@suse.de>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Thread-Topic: [PATCH 2/4] riscv: uaccess: use input constraints for ptr of
 __put_user
Thread-Index: AQHax9S0vgwFN0Wui0OMQ/evgIcCmrHdT9IA
Date: Fri, 28 Jun 2024 15:36:17 +0000
Message-ID: <b4d15c17ed684f5ab3cf89fda9f73618@AcuMS.aculab.com>
References: <20240625040500.1788-1-jszhang@kernel.org>
 <20240625040500.1788-3-jszhang@kernel.org> <mvmikxvonjh.fsf@suse.de>
 <ZnwTwnSsnZ8Td9GZ@xhacker>
 <dcf9574a-0f1b-4131-befd-39f47d4f9002@app.fastmail.com>
In-Reply-To: <dcf9574a-0f1b-4131-befd-39f47d4f9002@app.fastmail.com>
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
X-CRM114-CacheID: sfid-20240628_083712_634909_03E8EDEC 
X-CRM114-Status: UNSURE (   8.55  )
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

From: Arnd Bergmann
> Sent: 26 June 2024 15:25
...
> If you just copy from the arm64 version that uses an
> "r"(address) constraint instead of the "m"(*address)
> version, it should be fine for any user space access.

Arm certainly has 'reg+offset' addressing and I'd have thought
the RISC-V would have it as well.

I'd guess that the compiler also knows when the offset is too big.

Probably noticeable when code is accessing structures in user memory.

OTOH I can't remember if "m" implies a memory clobber?
For user copies the memory clobber isn't needed and not having it
may well allow better instruction scheduling.

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
