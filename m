Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E318DCDB47F
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2026 07:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RmXjUVRCuofH6L4hp05B6Ll/wxXQqFu1yq+mvKVf4Lk=; b=QaSQZ6G4JSHMjg
	ixG0uCFnMD9ElhciWsFOG6U5tx2w0PTlRn3ua2ZlWEHsdd7zYbl7RTvJF4GUO/jrKnVszMfCgJsN6
	SByMiUKvG7OpYOvTRQBRQrevS7t+H1QL/5sbwuHJ7xeOL/X2NK9GEJcSchdaguTb/tOEjbhf196E0
	CIO3HyD6NyQ4QhlErHLkKJv8htFK4/SPwNT6WYCau+cPIdxrNFtHgh/dgAes6b36xRWDFq0YEEreF
	d4XT3oR+tDj0XNHhGv4hWLiwltYU9oXi3WWYlsC2cqUBRnWhqOVin4WplRaxII30GiRByX6OZT22k
	VYQum3TLg0APEdANeHsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcI9y-00000007KJl-1QMb;
	Wed, 24 Jun 2026 07:36:34 +0000
Received: from out-186.mta0.migadu.com ([91.218.175.186])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcI9v-00000007KJK-05nE
	for linux-riscv@lists.infradead.org;
	Wed, 24 Jun 2026 07:36:32 +0000
Message-ID: <85b09fd7-f849-46e5-a04d-1e76524943b8@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782286587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9T0Fze3KpG06xnYvjmlUmzBODU53xtqtwO9Goa0J3Rc=;
	b=Mn96eHResPBSCyPsmN5dNm1kiNQkCTSsU33kbZpT8C88/niYY9SZETrVoJxvV+a+zTZQIC
	+YvG/pf77lfyNVlF2y2HVKLafVkhr5dbK5jEpC043M26er9EcAK98KijzhbYZyI+bDoG/p
	KKKDAelxFmIFAoDN70FKLxT6PT9CdjE=
Date: Wed, 24 Jun 2026 00:36:17 -0700
MIME-Version: 1.0
Subject: Re: [PATCH v6 07/21] RISC-V: Add Sscfg extension CSR definition
To: Charlie Jenkins <thecharlesjenkins@gmail.com>
Cc: James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Anup Patel <anup@brainfault.org>, Namhyung Kim <namhyung@kernel.org>,
 Paul Walmsley <pjw@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Ian Rogers <irogers@google.com>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20260608-counter_delegation-v6-0-285b72ed65a9@meta.com>
 <20260608-counter_delegation-v6-7-285b72ed65a9@meta.com>
 <ajjZkRxoh2F3vUAS@blinky>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Atish Patra <atish.patra@linux.dev>
In-Reply-To: <ajjZkRxoh2F3vUAS@blinky>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_003631_329083_D80392E4 
X-CRM114-Status: GOOD (  14.87  )
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

Ck9uIDYvMjEvMjYgMTE6NDMgUE0sIENoYXJsaWUgSmVua2lucyB3cm90ZToKPiBPbiBNb24sIEp1
biAwOCwgMjAyNiBhdCAxMTowMToyMVBNIC0wNzAwLCBBdGlzaCBQYXRyYSB3cm90ZToKPj4gRnJv
bTogS2Fpd2VuIFh1ZSA8a2Fpd2VueEByaXZvc2luYy5jb20+Cj4+Cj4+IFRoaXMgYWRkcyB0aGUg
c2NvdW50aW5oaWJpdCBDU1IgZGVmaW5pdGlvbiBhbmQgUy1tb2RlIGFjY2Vzc2libGUgaHBtZXZl
bnQKPj4gYml0cyBkZWZpbmVkIGJ5IHNtY2RlbGVnL3NzY2NmZy4gc2NvdW50aW5oaWJpdCBhbGxv
d3MgUy1tb2RlIHRvIHN0YXJ0L3N0b3AKPj4gY291bnRlcnMgZGlyZWN0bHkgZnJvbSBTLW1vZGUg
d2l0aG91dCBpbnZva2luZyBTQkkgY2FsbHMgdG8gTS1tb2RlLiBJdCBpcwo+PiBhbHNvIHVzZWQg
dG8gZmlndXJlIG91dCB0aGUgY291bnRlcnMgZGVsZWdhdGVkIHRvIFMtbW9kZSBieSB0aGUgTS1t
b2RlIGFzCj4+IHdlbGwuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEthaXdlbiBYdWUgPGthaXdlbnhA
cml2b3NpbmMuY29tPgo+PiBSZXZpZXdlZC1ieTogQ2zDqW1lbnQgTMOpZ2VyIDxjbGVnZXJAcml2
b3NpbmMuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL2Nzci5oIHwgMjYg
KysrKysrKysrKysrKysrKysrKysrKysrKysKPj4gICAxIGZpbGUgY2hhbmdlZCwgMjYgaW5zZXJ0
aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaCBi
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPj4gaW5kZXggYjQ1NTFhNmNmN2NiLi4yNmNi
NzhkZWUyZmQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vY3NyLmgKPj4g
KysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9jc3IuaAo+PiBAQCAtMjQxLDYgKzI0MSwzMSBA
QAo+PiAgICNkZWZpbmUgU01TVEFURUVOMF9IU0VOVkNGRwkJKF9VTEwoMSkgPDwgU01TVEFURUVO
MF9IU0VOVkNGR19TSElGVCkKPj4gICAjZGVmaW5lIFNNU1RBVEVFTjBfU1NUQVRFRU4wX1NISUZU
CTYzCj4+ICAgI2RlZmluZSBTTVNUQVRFRU4wX1NTVEFURUVOMAkJKF9VTEwoMSkgPDwgU01TVEFU
RUVOMF9TU1RBVEVFTjBfU0hJRlQpCj4+ICsvKiBIUE1FVkVOVCBiaXRzLiBUaGVzZSBhcmUgYWNj
ZXNzaWJsZSBpbiBTLW1vZGUgdmlhIFNtY2RlbGVnL1NzY2NmZyAqLwo+PiArI2lmZGVmIENPTkZJ
R182NEJJVAo+PiArI2RlZmluZSBIUE1FVkVOVF9PRgkJCShCSVRfVUxMKDYzKSkKPj4gKyNkZWZp
bmUgSFBNRVZFTlRfTUlOSAkJCShCSVRfVUxMKDYyKSkKPj4gKyNkZWZpbmUgSFBNRVZFTlRfU0lO
SAkJCShCSVRfVUxMKDYxKSkKPj4gKyNkZWZpbmUgSFBNRVZFTlRfVUlOSAkJCShCSVRfVUxMKDYw
KSkKPj4gKyNkZWZpbmUgSFBNRVZFTlRfVlNJTkgJCQkoQklUX1VMTCg1OSkpCj4+ICsjZGVmaW5l
IEhQTUVWRU5UX1ZVSU5ICQkJKEJJVF9VTEwoNTgpKQo+PiArI2Vsc2UKPj4gKyNkZWZpbmUgSFBN
RVZFTlRIX09GCQkJKEJJVF9VTEwoMzEpKQo+PiArI2RlZmluZSBIUE1FVkVOVEhfTUlOSAkJCShC
SVRfVUxMKDMwKSkKPj4gKyNkZWZpbmUgSFBNRVZFTlRIX1NJTkgJCQkoQklUX1VMTCgyOSkpCj4+
ICsjZGVmaW5lIEhQTUVWRU5USF9VSU5ICQkJKEJJVF9VTEwoMjgpKQo+PiArI2RlZmluZSBIUE1F
VkVOVEhfVlNJTkgJCQkoQklUX1VMTCgyNykpCj4+ICsjZGVmaW5lIEhQTUVWRU5USF9WVUlOSAkJ
CShCSVRfVUxMKDI2KSkKPiBTaW5jZSB0aGVzZSBhcmUgcnYzMiBiaXRzIGZvciBhIDMyLWJpdCBy
ZWdpc3RlciwgSSB0aGluayB0aGVzZSBzaG91bGQgYmUKPiBCSVQoKSBpbnN0ZWFkIG9mIEJJVF9V
TEwoKQo+Cj4+ICsKPj4gKyNkZWZpbmUgSFBNRVZFTlRfT0YJCQkoSFBNRVZFTlRIX09GIDw8IDMy
KQo+PiArI2RlZmluZSBIUE1FVkVOVF9NSU5ICQkJKEhQTUVWRU5USF9NSU5IIDw8IDMyKQo+PiAr
I2RlZmluZSBIUE1FVkVOVF9TSU5ICQkJKEhQTUVWRU5USF9TSU5IIDw8IDMyKQo+PiArI2RlZmlu
ZSBIUE1FVkVOVF9VSU5ICQkJKEhQTUVWRU5USF9VSU5IIDw8IDMyKQo+PiArI2RlZmluZSBIUE1F
VkVOVF9WU0lOSAkJCShIUE1FVkVOVEhfVlNJTkggPDwgMzIpCj4+ICsjZGVmaW5lIEhQTUVWRU5U
X1ZVSU5ICQkJKEhQTUVWRU5USF9WVUlOSCA8PCAzMikKPiBUaGVzZSBkZWZpbml0aW9ucyBhcmUg
aWRlbnRpY2FsIHRvIHRoZSBydjY0IG9uZXMsIGNhbiB0aGVzZSBiZSByZW1vdmVkCj4gYW5kIGNh
biB5b3UgbW92ZSB0aGUgcnY2NCBkZWZpbml0aW9ucyB0byBiZSBnbG9iYWw/CgpHb29kIGNhdGNo
LiBXaWxsIGZpeCB0aGlzIGFuZCB0aGUgYWJvdmUgaW4gdjguCgo+IC0gQ2hhcmxpZQo+Cj4+ICsj
ZW5kaWYKPj4gKwo+PiArI2RlZmluZSBTSVNFTEVDVF9TU0NDRkdfQkFTRQkJMHg0MAo+PiAgIAo+
PiAgIC8qIG1zZWNjZmcgYml0cyAqLwo+PiAgICNkZWZpbmUgTVNFQ0NGR19QTU0JCQlFTlZDRkdf
UE1NCj4+IEBAIC0zMjIsNiArMzQ3LDcgQEAKPj4gICAjZGVmaW5lIENTUl9TQ09VTlRFUkVOCQkw
eDEwNgo+PiAgICNkZWZpbmUgQ1NSX1NFTlZDRkcJCTB4MTBhCj4+ICAgI2RlZmluZSBDU1JfU1NU
QVRFRU4wCQkweDEwYwo+PiArI2RlZmluZSBDU1JfU0NPVU5USU5ISUJJVAkweDEyMAo+PiAgICNk
ZWZpbmUgQ1NSX1NTQ1JBVENICQkweDE0MAo+PiAgICNkZWZpbmUgQ1NSX1NFUEMJCTB4MTQxCj4+
ICAgI2RlZmluZSBDU1JfU0NBVVNFCQkweDE0Mgo+Pgo+PiAtLSAKPj4gMi41My4wLU1ldGEKPj4K
Pj4KPj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPj4g
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cj4+IGxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKPj4gaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1y
aXNjdgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
