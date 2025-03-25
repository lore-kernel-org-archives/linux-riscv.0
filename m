Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB243C35FFC
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Mar 2025 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2ubktBPcDWyQHgu5/fqYdFGnkSAxe6235QL0qIzlrl0=; b=JYHzHHozGNHKab
	b3/aa1EfIRolJ/KFGEt6YfSlQdO8moAfXq+p3WqiuycZY4E4jZSJMamDJ0fOccYXaMXbVjRblt/+e
	BXUetB0JoShfrVip+enAOkledz3FnqemTWetAPwbWwu3bav3KPyds/dowucHqzCGlyfR7L7cwGMzm
	nlEvg6fUf6xRJUWTOgdx54aWINB5gFFUFZJ0R95+g+5Q6q/2je59VjxuFrJv9OuLiGQ5bIqlulF0v
	tJd2PmFIHq9za/PzLPVxKXJRhJQqAZ5Oqq1NYTSO2+z+6Rv1gynhSsL2CSRxI89UOM0DqGbUMXST/
	cU+0el5CEYcy9/hhvH+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx5tO-00000006HuX-2ORI;
	Tue, 25 Mar 2025 15:08:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx4dt-000000065Qi-31Wd
	for linux-riscv@bombadil.infradead.org;
	Tue, 25 Mar 2025 13:48:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=guFPpdbLok2+qz2hW3QpljIYuPKvg8+epEGDIa5G7Ng=; b=cqkKrz4l+5C5Q2FTqINEQmr0HW
	cOSvFhA/lkr8kA1tcbA5qKjlVX9P/w12/0JqGx2EeP9IMqzCXAiYOUjaIHzpfJEtQOSOg0SkBusPA
	Y9FJZqFoHx4YST2xM3qEbTJn8YLxJD7L+O9w5phML2KdCEI869ug6CGk3wql1ZYxqqlvQOJ3nhKNw
	zR0Sd8T/p+u2ABNOaJG/EmZ8+pCM6KQiFyJuIBLm5JG2zeNvsNhEEcaaE3qFqJ3HKR58hiBJLHjXp
	svSGfzPPOLr2aCDtyxBQ15CFH27+MJnyExlJbG91i/T20qkJHYsxBAiTeHJWs5lqMpZ6uVt46A9Tk
	uuVJMktw==;
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tx4dq-00000005Tpi-1Tmt
	for linux-riscv@lists.infradead.org;
	Tue, 25 Mar 2025 13:48:32 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id BF8B8442FE;
	Tue, 25 Mar 2025 13:48:21 +0000 (UTC)
Message-ID: <3e073897-9a58-40b7-8b45-80c73217742b@ghiti.fr>
Date: Tue, 25 Mar 2025 14:48:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/6] RISC-V: add f & d extension validation checks
Content-Language: en-US
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
 Eric Biggers <ebiggers@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?=
 <cleger@rivosinc.com>, Andy Chiu <andybnac@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
 <20250312-reptile-platinum-62ee0f444a32@spud>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20250312-reptile-platinum-62ee0f444a32@spud>
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduiedvkeduucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefkffggfgfuvfevfhfhjggtgfesthekredttddvjeenucfhrhhomheptehlvgigrghnughrvgcuifhhihhtihcuoegrlhgvgiesghhhihhtihdrfhhrqeenucggtffrrghtthgvrhhnpedtgeeuhffhveeujeetveevieekleekvdffudefleevgefgieekkefggefhtddtveenucfkphepfedurdefvddrkedurddukeejnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehinhgvthepfedurdefvddrkedurddukeejpdhhvghloheplgduledvrdduieekrddvuddrvdehngdpmhgrihhlfhhrohhmpegrlhgvgiesghhhihhtihdrfhhrpdhnsggprhgtphhtthhopeduvddprhgtphhtthhopegtohhnohhrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhrihhstghvsehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheptghonhhorhdrughoohhlvgihsehmihgtrhhotghhihhprdgtohhmpdhrtghpthhtohepvggsihhgghgvrhhssehkvghrnhgvlhdrohhrghdprhgtphhtthhopehrohgshheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepkhhriihkodgutheskhgvrhhnv
 ghlrdhorhhgpdhrtghpthhtohepphgruhhlrdifrghlmhhslhgvhiesshhifhhivhgvrdgtohhmpdhrtghpthhtohepphgrlhhmvghrsegurggssggvlhhtrdgtohhm
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_134830_456055_357B8DB6 
X-CRM114-Status: GOOD (  23.47  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMTIvMDMvMjAyNSAxNDoxMSwgQ29ub3IgRG9vbGV5IHdyb3RlOgo+IEZyb206IENvbm9yIERv
b2xleSA8Y29ub3IuZG9vbGV5QG1pY3JvY2hpcC5jb20+Cj4KPiBVc2luZyBDbGVtZW50J3MgbmV3
IHZhbGlkYXRpb24gY2FsbGJhY2tzLCBzdXBwb3J0IGNoZWNraW5nIHRoYXQKPiBkZXBlbmRlbmNp
ZXMgaGF2ZSBiZWVuIHNhdGlzZmllZCBmb3IgdGhlIGZsb2F0aW5nIHBvaW50IGV4dGVuc2lvbnMu
Cj4KPiBUaGUgY2hlY2sgZm9yICJkIiBtaWdodCBiZSBzbGlnaHRseSBjb25mdXNpbmdseSBzaG9y
dGVyIHRoYW4gdGhhdCBvZiAiZiIsCj4gZGVzcGl0ZSAiZCIgZGVwZW5kaW5nIG9uICJmIi4gVGhp
cyBpcyBiZWNhdXNlIHRoZSByZXF1aXJlbWVudCB0aGF0IGEKPiBoYXJ0IHN1cHBvcnRpbmcgZG91
YmxlIHByZWNpc2lvbiBtdXN0IGFsc28gc3VwcG9ydCBzaW5nbGUgcHJlY2lzaW9uLAo+IHNob3Vs
ZCBiZSB2YWxpZGF0ZWQgYnkgZHQtYmluZGluZ3MgZXRjLCBub3QgdGhlIGtlcm5lbCBidXQgbGFj
ayBvZgo+IHN1cHBvcnQgZm9yIHNpbmdsZSBwcmVjaXNpb24gb25seSBpcyBhIGxpbWl0YXRpb24g
b2YgdGhlIGtlcm5lbC4KPgo+IFNpbmNlIHZlY3RvciB3aWxsIG5vdyBiZSBkaXNhYmxlZCBwcm9h
Y3RpdmVseSwgdGhlcmUncyBubyBuZWVkIHRvIGNsZWFyCj4gdGhlIGJpdCBpbiBlbGZfaHdjYXAg
aW4gcmlzY3ZfZmlsbF9od2NhcCgpIGFueSBsb25nZXIuCgoKSSBndWVzcyB0aGlzIGlzIGEgbGVm
dG92ZXIgZnJvbSB0aGUgc3BsaXQgcmlnaHQ/IE5vIG5lZWQgdG8gcmVzcGluIGEgbmV3IAp2ZXJz
aW9uIG9ubHkgZm9yIHRoYXQsIEkgY2FuIHJlbW92ZSBpdCBpZiB5b3UgY29uZmlybS4KCgo+Cj4g
VGVzdGVkLWJ5OiBDbMOpbWVudCBMw6lnZXIgPGNsZWdlckByaXZvc2luYy5jb20+Cj4gUmV2aWV3
ZWQtYnk6IENsw6ltZW50IEzDqWdlciA8Y2xlZ2VyQHJpdm9zaW5jLmNvbT4KPiBTaWduZWQtb2Zm
LWJ5OiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPgo+IC0tLQo+ICAg
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIHwgMzEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrKystLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI5IGluc2VydGlvbnMoKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gaW5kZXggNGZhOTUxZTlmMWNmLi4yMWQz
Y2YzNjFlMGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4g
KysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3B1ZmVhdHVyZS5jCj4gQEAgLTEwOSw2ICsxMDksMzMg
QEAgc3RhdGljIGludCByaXNjdl9leHRfemljYm96X3ZhbGlkYXRlKGNvbnN0IHN0cnVjdCByaXNj
dl9pc2FfZXh0X2RhdGEgKmRhdGEsCj4gICAJcmV0dXJuIDA7Cj4gICB9Cj4gICAKPiArc3RhdGlj
IGludCByaXNjdl9leHRfZl92YWxpZGF0ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRh
ICpkYXRhLAo+ICsJCQkJY29uc3QgdW5zaWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKPiArewo+ICsJ
aWYgKCFJU19FTkFCTEVEKENPTkZJR19GUFUpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAr
CS8qCj4gKwkgKiBEdWUgdG8gZXh0ZW5zaW9uIG9yZGVyaW5nLCBkIGlzIGNoZWNrZWQgYmVmb3Jl
IGYsIHNvIG5vIGRlZmVycmFsCj4gKwkgKiBpcyByZXF1aXJlZC4KPiArCSAqLwo+ICsJaWYgKCFf
X3Jpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKGlzYV9iaXRtYXAsIFJJU0NWX0lTQV9FWFRf
ZCkpIHsKPiArCQlwcl93YXJuX29uY2UoIlRoaXMga2VybmVsIGRvZXMgbm90IHN1cHBvcnQgc3lz
dGVtcyB3aXRoIEYgYnV0IG5vdCBEXG4iKTsKPiArCQlyZXR1cm4gLUVJTlZBTDsKPiArCX0KPiAr
Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiArc3RhdGljIGludCByaXNjdl9leHRfZF92YWxpZGF0
ZShjb25zdCBzdHJ1Y3QgcmlzY3ZfaXNhX2V4dF9kYXRhICpkYXRhLAo+ICsJCQkJY29uc3QgdW5z
aWduZWQgbG9uZyAqaXNhX2JpdG1hcCkKPiArewo+ICsJaWYgKCFJU19FTkFCTEVEKENPTkZJR19G
UFUpKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiArCXJldHVybiAwOwo+ICt9Cj4gKwo+ICAg
c3RhdGljIGludCByaXNjdl9leHRfdmVjdG9yX3hfdmFsaWRhdGUoY29uc3Qgc3RydWN0IHJpc2N2
X2lzYV9leHRfZGF0YSAqZGF0YSwKPiAgIAkJCQkgICAgICAgY29uc3QgdW5zaWduZWQgbG9uZyAq
aXNhX2JpdG1hcCkKPiAgIHsKPiBAQCAtMzcxLDggKzM5OCw4IEBAIGNvbnN0IHN0cnVjdCByaXNj
dl9pc2FfZXh0X2RhdGEgcmlzY3ZfaXNhX2V4dFtdID0gewo+ICAgCV9fUklTQ1ZfSVNBX0VYVF9E
QVRBKGksIFJJU0NWX0lTQV9FWFRfaSksCj4gICAJX19SSVNDVl9JU0FfRVhUX0RBVEEobSwgUklT
Q1ZfSVNBX0VYVF9tKSwKPiAgIAlfX1JJU0NWX0lTQV9FWFRfREFUQShhLCBSSVNDVl9JU0FfRVhU
X2EpLAo+IC0JX19SSVNDVl9JU0FfRVhUX0RBVEEoZiwgUklTQ1ZfSVNBX0VYVF9mKSwKPiAtCV9f
UklTQ1ZfSVNBX0VYVF9EQVRBKGQsIFJJU0NWX0lTQV9FWFRfZCksCj4gKwlfX1JJU0NWX0lTQV9F
WFRfREFUQV9WQUxJREFURShmLCBSSVNDVl9JU0FfRVhUX2YsIHJpc2N2X2V4dF9mX3ZhbGlkYXRl
KSwKPiArCV9fUklTQ1ZfSVNBX0VYVF9EQVRBX1ZBTElEQVRFKGQsIFJJU0NWX0lTQV9FWFRfZCwg
cmlzY3ZfZXh0X2RfdmFsaWRhdGUpLAo+ICAgCV9fUklTQ1ZfSVNBX0VYVF9EQVRBKHEsIFJJU0NW
X0lTQV9FWFRfcSksCj4gICAJX19SSVNDVl9JU0FfRVhUX1NVUEVSU0VUKGMsIFJJU0NWX0lTQV9F
WFRfYywgcmlzY3ZfY19leHRzKSwKPiAgIAlfX1JJU0NWX0lTQV9FWFRfU1VQRVJTRVRfVkFMSURB
VEUodiwgUklTQ1ZfSVNBX0VYVF92LCByaXNjdl92X2V4dHMsIHJpc2N2X2V4dF92ZWN0b3JfZmxv
YXRfdmFsaWRhdGUpLAoKClJldmlld2VkLWJ5OiBBbGV4YW5kcmUgR2hpdGkgPGFsZXhnaGl0aUBy
aXZvc2luYy5jb20+CgpUaGFua3MsCgpBbGV4CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
