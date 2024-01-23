Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7297DC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 10:16:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hAFSeO51XSwy7mLVUtxl5JOtKbJrCta+A/A4rtsYbOc=; b=NSuD+3ZFdnyWho
	TG2KJ+AsbZt2bAmjSwvfoGdOG/mtdv4qsrZ4yCOP6xdqtdC/Z2Jy3/zw8VwzNwDZ3et1SdVpShN/Q
	gLaXU5yMOcfLJoF17ZnHmb5vS7pQGX1RBPZwoGG3MSxjfePS3g31lo6I5Ib9QBUq4gT/LrU8khyyf
	pFUdhgPwJFj7wVU+zI7hpWp1Ip51uud+Am+pNmgiA69ZUbkoIJvOrHl+72wDs+5sFMEHehHH4Wu1T
	VdB49+rDWlwzUC0DXBjLqXkVVeBA+F7ITfbbBwh68cYSzit79PukBtP16yHTI0aW6XfwBmWmyisgU
	j7AHtSUBbqrAI4ooxN9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSDpa-00FtLV-2q;
	Tue, 23 Jan 2024 10:16:34 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.85.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSDpX-00FtI4-0j
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jan 2024 10:16:34 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-76-TSOlSA3yNlmz_Bo-aU5ewQ-1; Tue, 23 Jan 2024 10:16:23 +0000
X-MC-Unique: TSOlSA3yNlmz_Bo-aU5ewQ-1
Received: from AcuMS.Aculab.com (10.202.163.6) by AcuMS.aculab.com
 (10.202.163.6) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Tue, 23 Jan
 2024 10:16:06 +0000
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Tue, 23 Jan 2024 10:16:06 +0000
From: David Laight <David.Laight@ACULAB.COM>
To: 'Guenter Roeck' <linux@roeck-us.net>, Charlie Jenkins
	<charlie@rivosinc.com>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor@kernel.org>, "samuel.holland@sifive.com"
	<samuel.holland@sifive.com>, "xiao.w.wang@intel.com" <xiao.w.wang@intel.com>,
	Evan Green <evan@rivosinc.com>, "guoren@kernel.org" <guoren@kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Subject: RE: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and
 ip_fast_csum
Thread-Topic: [PATCH v15 5/5] kunit: Add tests for csum_ipv6_magic and
 ip_fast_csum
Thread-Index: AQHaTVGn8AUolzpWZEe7KQadoytUPLDmCvsQgAAHpwCAAEjwsIAAOnOOgACYElA=
Date: Tue, 23 Jan 2024 10:16:06 +0000
Message-ID: <86411bbab15c42b8819aeb923fe42644@AcuMS.aculab.com>
References: <be959a4bb660466faba5ade7976485c8@AcuMS.aculab.com>
 <mhng-b5f26a34-7632-4423-9f07-3224170bae9f@palmer-ri-x1c9>
 <Za8AXnKCm4cPyVbp@ghost> <e548f697-650e-4333-9f39-19a472b7d90a@roeck-us.net>
In-Reply-To: <e548f697-650e-4333-9f39-19a472b7d90a@roeck-us.net>
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
X-CRM114-CacheID: sfid-20240123_021631_549539_6F94F2DC 
X-CRM114-Status: GOOD (  10.48  )
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

From: Guenter Roeck
> Sent: 23 January 2024 01:06
...
> >>     +#define SUPPORTED_ALIGNMENT (1 << NET_IP_ALIGN)
> >>      /* Values for a little endian CPU. Byte swap each half on big endian CPU. */
> >>      static const u32 random_init_sum = 0x2847aab;
> >>     @@ -486,7 +488,7 @@ static void test_csum_fixed_random_inputs(struct kunit *test)
> >>      	__sum16 result, expec;
> >>      	assert_setup_correct(test);
> >>     -	for (align = 0; align < TEST_BUFLEN; ++align) {
> >>     +	for (align = 0; align < TEST_BUFLEN; align += SUPPORTED_ALIGNMENT) {
...

That is all wrong.
NET_IP_ALIGN is the offset for the base of ethernet frames.
If zero the IP header will (usually) be misaligned.
If two the mac addresses are misaligned in order to align
the IP header (6+6+2 bytes in).
I don't think any other values are actually valid, but
there is always that possibility.

So the definition should really be:
#define SUPPORTED_ALIGNMENT (NET_IP_ALIGN ? 4 : 1)

(Which might happen to be the same values :-)

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
