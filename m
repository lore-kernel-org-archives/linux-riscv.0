Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 345B9E8FDD1
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 08:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKjlE2w4a2n7zEI7yyhGD+Sw7VkiIl37ceQ5CqqkWso=; b=r9ZWbGvV0GOp2j
	6RSxXsE8Vk4/nNylwExc6chUYLWBk7Qq7WCNLjp6PvPjRtXRDhslnXe/Fs/2R/0fmvcikcUlkvlUb
	srqBpPFaAxFd3pdko0PhykmL8GbU2Cm/83uzxLC5j1auR6L9wWBhJDk4f3ZYkwXJ+2fGjYH/zMe5J
	60lLSvTLgy/A6mv/dbDiaqNhkRKtezQaTtqX7T4k3YUcztjNO/MFYHvXyQK2OLS54v0HoC6ZGNMsc
	y8OItofFhMDqz8EXy3xj4iJQjtov4J9SI+uvv4xTGuwgi+DBGJIxtaF1L2EaqdgUfwyNulwbYqD23
	xK1xWFYtyJ7mUKCyUd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxDh-00GoRP-0u;
	Wed, 04 Oct 2023 08:27:01 +0000
Received: from eu-smtp-delivery-151.mimecast.com ([185.58.86.151])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnxDe-00GoOc-0L
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 08:26:59 +0000
Received: from AcuMS.aculab.com (156.67.243.121 [156.67.243.121]) by
 relay.mimecast.com with ESMTP with both STARTTLS and AUTH (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 uk-mta-113-q5QtC5zAO-CR-mafjpfTEQ-1; Wed, 04 Oct 2023 09:26:50 +0100
X-MC-Unique: q5QtC5zAO-CR-mafjpfTEQ-1
Received: from AcuMS.Aculab.com (10.202.163.4) by AcuMS.aculab.com
 (10.202.163.4) with Microsoft SMTP Server (TLS) id 15.0.1497.48; Wed, 4 Oct
 2023 09:26:49 +0100
Received: from AcuMS.Aculab.com ([::1]) by AcuMS.aculab.com ([::1]) with mapi
 id 15.00.1497.048; Wed, 4 Oct 2023 09:26:49 +0100
From: David Laight <David.Laight@ACULAB.COM>
To: =?utf-8?B?J0Nsw6ltZW50IEzDqWdlcic=?= <cleger@rivosinc.com>, Conor Dooley
	<conor@kernel.org>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Atish Patra
	<atishp@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, Evan Green
	<evan@rivosinc.com>, =?utf-8?B?QmrDtnJuIFRvcGVs?= <bjorn@rivosinc.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Ron Minnich
	<rminnich@gmail.com>, Daniel Maslowski <cyrevolt@googlemail.com>
Subject: RE: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
Thread-Topic: [PATCH 0/7] Add support to handle misaligned accesses in S-mode
Thread-Index: AQHZ9QOtGOYrq2j5KUyBiWVh/MP2XrA5TUKA
Date: Wed, 4 Oct 2023 08:26:49 +0000
Message-ID: <eb9dcaaf313642b096d68df4b92e7466@AcuMS.aculab.com>
References: <20230926150316.1129648-1-cleger@rivosinc.com>
 <20230930-patchy-curdle-ef5ee6e1a17c@spud>
 <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com>
In-Reply-To: <8ce6cd97-6d63-4174-a290-40690c81e205@rivosinc.com>
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
X-CRM114-CacheID: sfid-20231004_012658_451522_A7B35A7F 
X-CRM114-Status: GOOD (  10.36  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

RnJvbTogQ2zDqW1lbnQgTMOpZ2VyDQo+IFNlbnQ6IDAyIE9jdG9iZXIgMjAyMyAwODo0MA0KPiAN
Cj4gT24gMzAvMDkvMjAyMyAxMToyMywgQ29ub3IgRG9vbGV5IHdyb3RlOg0KPiA+IE9uIFR1ZSwg
U2VwIDI2LCAyMDIzIGF0IDA1OjAzOjA5UE0gKzAyMDAsIENsw6ltZW50IEzDqWdlciB3cm90ZToN
Cj4gPj4gU2luY2UgY29tbWl0IDYxY2FkYjkgKCJQcm92aWRlIG5ldyBkZXNjcmlwdGlvbiBvZiBt
aXNhbGlnbmVkIGxvYWQvc3RvcmUNCj4gPj4gYmVoYXZpb3IgY29tcGF0aWJsZSB3aXRoIHByaXZp
bGVnZWQgYXJjaGl0ZWN0dXJlLiIpIGluIHRoZSBSSVNDLVYgSVNBDQo+ID4+IG1hbnVhbCwgaXQg
aXMgc3RhdGVkIHRoYXQgbWlzYWxpZ25lZCBsb2FkL3N0b3JlIG1pZ2h0IG5vdCBiZSBzdXBwb3J0
ZWQuDQo+ID4+IEhvd2V2ZXIsIHRoZSBSSVNDLVYga2VybmVsIHVBQkkgZGVzY3JpYmVzIHRoYXQg
bWlzYWxpZ25lZCBhY2Nlc3NlcyBhcmUNCj4gPj4gc3VwcG9ydGVkLg0KLi4uDQoNClRoYXQgaXQg
anVzdCByZWFsbHkgaG9ycmlkLg0KSWYgdGhlIGNwdSBpcyBnb2luZyB0byB0cmFwIG1pc2FsaWdu
ZWQgYWNjZXNzZXMgdGhlbiB5b3Ugd2FudA0KVGhlIGNvbXBpbGVyIGdlbmVyYXRlZCBjb2RlIChp
ZSBwYWNrZWQgZGF0YSkgbm90IHRvIGdlbmVyYXRlDQptaXNhbGlnbmVkIGFjY2Vzc2VzLg0KU28g
eW91IGhhdmUgdG8gY2hhbmdlIHRoZSBrZXJuZWwgdUFCSS4NCg0KT1RPSCBpZiB5b3Uga25vd24g
dGhhdCBzdWNoIGFjY2Vzc2VzIHdvbid0IGZhdWx0IGFuZCB3aWxsIGJlDQpub3QgcmVhbGx5IHNs
b3dlciB0aGFuIGFsaWduZWQgYWNjZXNzZXMgdGhlbiBvcHRpbWlzZWQgdmVyc2lvbnMNCm9mIHNv
bWUgZnVuY3Rpb25zIChsaWtlIG1lbWNweSBhbmQgY2hlY2tzdW1zKSBjYW4gdXNlIG1pc2FsaWdu
ZWQNCmFjY2Vzc2VzLg0KDQoJRGF2aWQNCg0KLQ0KUmVnaXN0ZXJlZCBBZGRyZXNzIExha2VzaWRl
LCBCcmFtbGV5IFJvYWQsIE1vdW50IEZhcm0sIE1pbHRvbiBLZXluZXMsIE1LMSAxUFQsIFVLDQpS
ZWdpc3RyYXRpb24gTm86IDEzOTczODYgKFdhbGVzKQ0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
