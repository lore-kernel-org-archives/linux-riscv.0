Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C54FC5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 12:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZTZXhUmWcQAp6xLS5LGAMbetMC+/9Dc+CtkMwEfK79s=; b=Ag4Qu3xm9qCrOy
	xa3N4YeNjg8bzfEozaZ7piw4mpuTBNZm0JFpiR4chXhKBZYbFTheQBKqaxgqA1t1WZQJtJY3RKNSv
	3yvwMnBirtsGpa8dbIz+3zA8X2obOmOg/osnzM9nCt7mzyfSfxHUK6CXLOJJRgtFp7nKqeNxz6AG+
	8FQaEUk8mfzK8HeX6kOmblEh5BgtPgUm3eGV1QAq43nim52/FfysV+eO6+T06UV6qV5YbU2fKFP4J
	jVdRCPmmrAc4zvIKAtBKerq3inZgu/ANFvMwg37JWltLBaL7oUR9Bi4rlLd7G1yJWol7m2ehYm2iB
	KHv199OD1GglITLeHxOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMR45-0000000AxCN-42d1;
	Tue, 03 Jun 2025 12:48:25 +0000
Received: from xry111.site ([89.208.246.23])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMR43-0000000AxBP-2IBD
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 12:48:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xry111.site;
	s=default; t=1748954899;
	bh=be0lML8aTZW4E4Ing1VFrv8AHF+jgbhUUfX0JPhKOXM=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YNndBMrG6qOvSbDqbcdZXRiRtkqmMq4ebR6guSj1GLDHCHcU4hCF+rVkD+dPQRM27
	 ACqHA7lI0HUDPgXI007V4fDUlIEvOgxvn+eSzij8KaRzCsFq2tUPXD8a2JBtyoMBxx
	 x407JtrMTJnJIbSJLisUQPCoF9QZR8a6FvBA9KI4=
Received: from [127.0.0.1] (unknown [IPv6:2001:470:683e::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (secp384r1) server-digest SHA384)
	(Client did not present a certificate)
	(Authenticated sender: xry111@xry111.site)
	by xry111.site (Postfix) with ESMTPSA id A07E565F62;
	Tue,  3 Jun 2025 08:48:16 -0400 (EDT)
Message-ID: <0f0eb024d7ed062141a8aa048017e6f7ef7c1fd4.camel@xry111.site>
Subject: Re: [PATCH v2] RISC-V: vDSO: Wire up getrandom() vDSO implementation
From: Xi Ruoyao <xry111@xry111.site>
To: Alexandre Ghiti <alex@ghiti.fr>, Thomas =?ISO-8859-1?Q?Wei=DFschuh?=
	 <thomas.weissschuh@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Cc: "Jason A. Donenfeld" <Jason@zx2c4.com>, Paul Walmsley
	 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Guo Ren
	 <guoren@kernel.org>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Tue, 03 Jun 2025 20:48:15 +0800
In-Reply-To: <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
References: <20250411024600.16045-1-xry111@xry111.site>
	 <20250411095103-2aad099a-e4a1-4efb-8374-dd27bf05b668@linutronix.de>
	 <a2477829-f3a5-4763-89f3-8c2c1f4716b8@ghiti.fr>
	 <7f840a23ab8865d7f205caec56817c660e237d64.camel@xry111.site>
	 <71f093d5-4823-4bc6-b9ee-23433bd8c60c@ghiti.fr>
User-Agent: Evolution 3.56.2 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_054823_606675_7D317E5E 
X-CRM114-Status: GOOD (  23.08  )
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

T24gRnJpLCAyMDI1LTA1LTIzIGF0IDEyOjA2ICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6
Cj4gT24gNS8yMy8yNSAxMDowMiwgWGkgUnVveWFvIHdyb3RlOgo+ID4gT24gRnJpLCAyMDI1LTA1
LTIzIGF0IDEwOjAxICswMjAwLCBBbGV4YW5kcmUgR2hpdGkgd3JvdGU6Cj4gPiA+IEhpIFhpLAo+
ID4gPiAKPiA+ID4gT24gNC8xMS8yNSAxMDowNCwgVGhvbWFzIFdlacOfc2NodWggd3JvdGU6Cj4g
PiA+ID4gT24gRnJpLCBBcHIgMTEsIDIwMjUgYXQgMTA6NDY6MDBBTSArMDgwMCwgWGkgUnVveWFv
IHdyb3RlOgo+ID4gPiA+ID4gSG9vayB1cCB0aGUgZ2VuZXJpYyB2RFNPIGltcGxlbWVudGF0aW9u
IHRvIHRoZSBnZW5lcmljIHZEU08KPiA+ID4gPiA+IGdldHJhbmRvbQo+ID4gPiA+ID4gaW1wbGVt
ZW50YXRpb24gYnkgcHJvdmlkaW5nIHRoZSByZXF1aXJlZAo+ID4gPiA+ID4gX19hcmNoX2NoYWNo
YTIwX2Jsb2Nrc19ub3N0YWNrCj4gPiA+ID4gPiBhbmQgZ2V0cmFuZG9tX3N5c2NhbGwgaW1wbGVt
ZW50YXRpb25zLiBBbHNvIHdpcmUgdXAgdGhlIHNlbGZ0ZXN0cy4KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gVGhlIGJlbmNobWFyayByZXN1bHQ6Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IAl2ZHNvOiAyNTAw
MDAwMCB0aW1lcyBpbiAyLjQ2NjM0MTMzMyBzZWNvbmRzCj4gPiA+ID4gPiAJbGliYzogMjUwMDAw
MDAgdGltZXMgaW4gNDEuNDQ3NzIwMDA1IHNlY29uZHMKPiA+ID4gPiA+IAlzeXNjYWxsOiAyNTAw
MDAwMCB0aW1lcyBpbiA0MS4wNDM5MjY2NzIgc2Vjb25kcwo+ID4gPiA+ID4gCj4gPiA+ID4gPiAJ
dmRzbzogMjUwMDAwMDAgeCAyNTYgdGltZXMgaW4gMTYyLjI4NjIxOTM1MyBzZWNvbmRzCj4gPiA+
ID4gPiAJbGliYzogMjUwMDAwMDAgeCAyNTYgdGltZXMgaW4gMjk1My44NTUwMTg2ODUgc2Vjb25k
cwo+ID4gPiA+ID4gCXN5c2NhbGw6IDI1MDAwMDAwIHggMjU2IHRpbWVzIGluIDI3OTYuMjY4NTQ2
MDAwIHNlY29uZHMKPiA+ID4gPiA+IAo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogWGkgUnVveWFv
IDx4cnkxMTFAeHJ5MTExLnNpdGU+Cj4gPiA+ID4gPiAtLS0KPiA+ID4gPiA+IAo+ID4gPiA+ID4g
W3YxXS0+djI6Cj4gPiA+ID4gPiAtIEZpeCB0aGUgY29tbWl0IG1lc3NhZ2UuCj4gPiA+ID4gPiAt
IE9ubHkgYnVpbGQgdGhlIHZEU08gZ2V0cmFuZG9tIGNvZGUgaWYgQ09ORklHX1ZEU09fR0VUUkFO
RE9NLCB0bwo+ID4gPiA+ID4gwqDCoMKgIHVuYnJlYWsgUlYzMiBidWlsZC4KPiA+ID4gPiA+IC0g
TGlrZXdpc2UsIG9ubHkgZW5hYmxlIHRoZSBzZWxmdGVzdCBpZiBfX3Jpc2N2X3hsZW4gPT0gNjQu
Cj4gPiA+ID4gPiAKPiA+ID4gPiA+IFt2MV06Cj4gPiA+ID4gPiBodHRwczovL2xvcmUua2VybmVs
Lm9yZy9hbGwvMjAyNTAyMjQxMjI1NDEuNjUwNDUtMS14cnkxMTFAeHJ5MTExLnNpdGUvCj4gPiA+
ID4gPiAKPiA+ID4gPiA+IMKgwqAgYXJjaC9yaXNjdi9LY29uZmlnwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHzCoMKgIDEgKwo+ID4gPiA+ID4g
wqDCoCBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Zkc28vZ2V0cmFuZG9tLmjCoMKgwqDCoMKgwqAg
fMKgIDMwICsrKwo+ID4gPiA+ID4gwqDCoCBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL01ha2VmaWxl
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAgMTIgKwo+ID4gPiA+ID4gwqDCoCBhcmNo
L3Jpc2N2L2tlcm5lbC92ZHNvL2dldHJhbmRvbS5jwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCB8wqAg
MTAgKwo+ID4gPiA+ID4gwqDCoCBhcmNoL3Jpc2N2L2tlcm5lbC92ZHNvL3Zkc28ubGRzLlPCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgfMKgwqAgMSArCj4gPiA+ID4gPiDCoMKgIGFyY2gvcmlzY3Yv
a2VybmVsL3Zkc28vdmdldHJhbmRvbS1jaGFjaGEuU8KgwqDCoCB8IDI0NAo+ID4gPiA+ID4gKysr
KysrKysrKysrKysrKysrCj4gPiA+ID4gPiDCoMKgIC4uLi9zZWxmdGVzdHMvdkRTTy92Z2V0cmFu
ZG9tLWNoYWNoYS5TwqDCoMKgwqDCoMKgwqAgfMKgwqAgMiArCj4gPiA+ID4gPiDCoMKgIDcgZmls
ZXMgY2hhbmdlZCwgMzAwIGluc2VydGlvbnMoKykKPiA+ID4gPiA+IMKgwqAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGFyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmRzby9nZXRyYW5kb20uaAo+ID4gPiA+ID4g
wqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvdmRzby9nZXRyYW5kb20u
Ywo+ID4gPiA+ID4gwqDCoCBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9yaXNjdi9rZXJuZWwvdmRz
by92Z2V0cmFuZG9tLWNoYWNoYS5TCj4gPiA+ID4gPHNuaXA+Cj4gPiA+ID4gCj4gPiA+ID4gPiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvdmRzby92ZHNvLmxkcy5TCj4gPiA+ID4gPiBi
L2FyY2gvcmlzY3Yva2VybmVsL3Zkc28vdmRzby5sZHMuUwo+ID4gPiA+ID4gaW5kZXggOGU4Njk2
NWE4YWFlLi5hYmM2OWNkYTA0NDUgMTAwNjQ0Cj4gPiA+ID4gPiAtLS0gYS9hcmNoL3Jpc2N2L2tl
cm5lbC92ZHNvL3Zkc28ubGRzLlMKPiA+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yva2VybmVsL3Zk
c28vdmRzby5sZHMuUwo+ID4gPiA+ID4gQEAgLTgwLDYgKzgwLDcgQEAgVkVSU0lPTgo+ID4gPiA+
ID4gwqDCoCAjaWZuZGVmIENPTVBBVF9WRFNPCj4gPiA+ID4gPiDCoMKgwqAJCV9fdmRzb19yaXNj
dl9od3Byb2JlOwo+ID4gPiA+ID4gwqDCoCAjZW5kaWYKPiA+ID4gPiA+ICsJCV9fdmRzb19nZXRy
YW5kb207Cj4gPiA+ID4gRm9yIGNvbnNpc3RlbmN5IHRoaXMgY291bGQgYmUgZ2F0ZWQgYmVoaW5k
IENPTkZJR19WRFNPX0dFVFJBTkRPTS4KPiA+ID4gCj4gPiA+IE5hdGhhbiBzZW50IGEgZml4IGZv
ciB0aGlzIGhlcmU6Cj4gPiA+IAo+ID4gPiBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAy
NTA0MjMtcmlzY3YtZml4LWNvbXBhdF92ZHNvLWxsZC12Mi0xLWI3YmJiYzI0NDUwMUBrZXJuZWwu
b3JnLwo+ID4gSSd2ZSBnaXZlbiBpdCBhbiBSLWIuwqAgRG8geW91IHByZWZlciBtZSB0byBzcXVh
c2ggdGhlIHBhdGNoZXMgYW5kIGtlZXAKPiA+IHRoZSBTb0Igb2YgYm90aCBJIGFuZCBOYXRoYW4/
Cj4gCj4gSG1tIEkgd2FzIGFib3V0IHRvIHNlbmQgYSBuZXcgUFIgdG9kYXkgYWZ0ZXIgdGhlIENJ
IHBhc3NlcywgSSBtZW50aW9uZWQgCj4gTmF0aGFuJ3MgcGF0Y2ggaW4gdGhlIHNxdWFzaCBzbyBo
ZSBrZWVwcyBjcmVkaXQgZm9yIHRoZSBmaXguIFVubGVzcyB5b3UgCj4gY2FuIHNlbmQgc29tZXRo
aW5nIHRvZGF5LCBJJ2xsIGtlZXAgbXkgc3F1YXNoZWQgcGF0Y2guCgpQYWxtZXIgaGFzIHJldmVy
dGVkIHRoaXMgaW4gZm9yLW5leHQgYW5kIFRob21hcyBqdXN0IGluZm9ybWVkIG1lIGFub3RoZXIK
bWlzdGFrZSBpbiB0aGUgY29kZSBhdCBodHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNTA2
MDMtbG9vbmdhcmNoLQp2ZHNvLXN5c2NhbGwtdjEtMS02ZDEyZDZkZmJkZDBAbGludXRyb25peC5k
ZS8uCgpJJ2xsIHRyeSB0byBzb3J0IHRoaW5ncyB1cCBhbmQgc2VuZCB2MyBpbiB0aGUgd2Vlay4K
Ci0tIApYaSBSdW95YW8gPHhyeTExMUB4cnkxMTEuc2l0ZT4KU2Nob29sIG9mIEFlcm9zcGFjZSBT
Y2llbmNlIGFuZCBUZWNobm9sb2d5LCBYaWRpYW4gVW5pdmVyc2l0eQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
