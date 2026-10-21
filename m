Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9DAE60A2606
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Oct 2026 09:11:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nR5itMHz;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=casper.20170209 header.b=GpBWyGwc;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=qy05oNmy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=acoIjnqjUQJDOxl0FXe6Zk69V2Ddw+UIlgCQqN5qYKU=; b=nR5itMHz8FGTbZ
	a6vD81n+0NGHkEkEp5PVzd/ZPoVdhPymdbWxelb4R0q/wL2x08cAXVEVinImtlqBepQpz7VbeVoUS
	36NQIRJWXLg6EFvd6/IOi+aR0bjoTu/XmeHk+bIHXgI7kSy3Wpco9qPBXgTaeGL8Lgt/F6ECOytZ/
	mRjum+SeD74E0aHiWppPayvrZiU88RpjMxz82CZDtsXbpUaVmykraK5YGgCyn23i4i9/sgGsP7Eyj
	wSrPtcOkRhtf3sD0GcEVavixaV3ikFYtnKy2AV5v+eKbutRy2ojW9i/vsZhoxC5UPf1CRcmwVaSGy
	/kVZmHKrSFCRpUI1kSEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSLq-0000000BSGz-255w;
	Wed, 21 Oct 2026 09:11:14 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSLo-0000000BSGa-0ccm
	for linux-riscv@bombadil.infradead.org;
	Wed, 21 Oct 2026 09:11:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=nzADmYKv4GpvdMxYyHHtqrTYHk3osWUIWqWnEfBwJ1o=; b=GpBWyGwcHVJ5PMeySuR2d3z7Xx
	IKua7w9m/PhuPnswBU+F/FMoCO4Al965Zmgg6Vt57ybDdrMWG8sqPDs3PAMqaRdO9qm/zelsnWRp4
	EhseDNfZJeehwKuA72F2DQzHCuwccgJwb0TI/DjRh5wOc18jQoVjPxitZRrHxKb7M5kQkHJS/xmD1
	ypM89aGZw5ammqVaq7mbp+xrcRUzHZIhK28aYYXdlqHMursrNrn91rUwWDxWp5UsLJFbjL85JlPE8
	k6S8gTm2noBWhegrbf/QJi2jK1GL9IfiEtu+ShGFICs+hsXN/scxtEMvVbCqeOLrzCmnDMBgvw45c
	ymrZa5Qg==;
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJSLk-000000081fs-0e9p
	for linux-riscv@lists.infradead.org;
	Wed, 21 Oct 2026 09:11:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=nzADmYKv4GpvdMxYyHHtqrTYHk3osWUIWqWnEfBwJ1o=;
	b=qy05oNmy3wvcAipAQKL4DCStOriRWTyczBtLbfPzPytLSmCWdRpIYENADIsJu88KlAJj0hmjc
	e1p5428X8KTeWUYB9Vrw2GOPKCj13drNhfpLlgpoC2Z/ybSXrCDzqgJdySA25ihc7Us9rMXLO2x
	ua/h/PISSyjS5+zO8Dkln2g=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4j8jrv5s6Yz1cyPG
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 16:59:27 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 82C7940563
	for <linux-riscv@lists.infradead.org>; Wed, 21 Oct 2026 17:10:47 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 21 Oct
 2026 17:10:47 +0800
Message-ID: <3bee3b6c-9bc1-4b10-85ed-01e935972818@huawei.com>
Date: Wed, 21 Oct 2026 17:10:46 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] crash_core: serialize crash header preparation
 against hotplug
To: <linux-riscv@lists.infradead.org>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-4-chenwandun1@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261021083011.2170525-4-chenwandun1@gmail.com>
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_101108_813644_4EF71673 
X-CRM114-Status: GOOD (  18.87  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgrlnKggMjAyNi8xMC8yMSAxNjozMCwgV2FuZHVuIENoZW4g5YaZ6YGTOgo+IEZyb206IFdhbmR1
biBDaGVuIDxjaGVud2FuZHVuQGxpeGlhbmcuY29tPgo+IAo+IGNyYXNoX3ByZXBhcmVfaGVhZGVy
cygpIGNvdW50cyBtZW1vcnkgcmFuZ2VzIGJlZm9yZSBwb3B1bGF0aW5nIHRoZQo+IGFsbG9jYXRl
ZCBjcmFzaF9tZW0gYXJyYXkuIFRoZSB3ZWFrIGltcGxlbWVudGF0aW9uIHVzZWQgYnkgQVJNNjQs
Cj4gUklTQy1WIGFuZCBMb29uZ0FyY2ggd2Fsa3MgbWVtYmxvY2subWVtb3J5LCB3aGlsZSB4ODYg
cGVyZm9ybXMgdGhlIHNhbWUKPiB0d28tcGFzcyBvcGVyYXRpb24gb3ZlciBzeXN0ZW0gUkFNIHJl
c291cmNlcy4gQ29uY3VycmVudCBtZW1vcnkgaG90cGx1Zwo+IGNhbiBjaGFuZ2UgcmFuZ2Ugc291
cmNlIGJldHdlZW4gdGhlIHR3byB3YWxrcyBhbmQgbWFrZSB0aGUgcG9wdWxhdGUKPiBwYXNzIG92
ZXJmbG93IGNtZW0tPnJhbmdlcy4KPiAKPiBUYWtlIGRldmljZV9ob3RwbHVnX2xvY2sgd2hlbiBw
cmVwYXJpbmcgY3Jhc2ggaGVhZGVycyBkdXJpbmcKPiBrZXhlY19maWxlX2xvYWQoKS4gVGhlIHg4
Ni9yaXNjdiBtZW1vcnkgaG90cGx1ZyBwYXRoIGFscmVhZHkgdGFrZXMKPiBkZXZpY2VfaG90cGx1
Z19sb2NrLCBzbyBjYWxsIF9fY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKCkgZGlyZWN0bHkKPiB0byBh
dm9pZCByZWN1cnNpdmUgbG9ja2luZy4KPiAKPiBTYXNoaWtvIHJlcG9ydGVkIHRoaXMgaXNzdWUg
aW4gWzFdLgo+IAo+IEZpeGVzOiAzNzUxZTcyOGNlZjIgKCJhcm02NDoga2V4ZWNfZmlsZTogYWRk
IGNyYXNoIGR1bXAgc3VwcG9ydCIpCj4gRml4ZXM6IDFiY2NhODYyMGE5MSAoIkxvb25nQXJjaDog
QWRkIGNyYXNoIGR1bXAgc3VwcG9ydCBmb3Iga2V4ZWNfZmlsZSIpCj4gRml4ZXM6IDhhY2VhNDU1
ZmFmYSAoIlJJU0MtVjogU3VwcG9ydCBmb3Iga2V4ZWNfZmlsZSBvbiBwYW5pYyIpCj4gRml4ZXM6
IGRkNWY3MjYwNzZjYyAoImtleGVjOiBzdXBwb3J0IGZvciBrZXhlYyBvbiBwYW5pYyB1c2luZyBu
ZXcgc3lzdGVtIGNhbGwiKQo+IFNpZ25lZC1vZmYtYnk6IFdhbmR1biBDaGVuIDxjaGVud2FuZHVu
QGxpeGlhbmcuY29tPgo+IExpbms6IGh0dHBzOi8vc2FzaGlrby5kZXYvIy9tZXNzYWdlLzIwMjYw
ODA2MTAxMDAyLjFGODRFMUYwMDBFOUBzbXRwLmtlcm5lbC5vcmcgWzFdCj4gQWNrZWQtYnk6IEJh
b3F1YW4gSGUgPGJhb3F1YW4uaGVAbGludXguZGV2Pgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2tlcm5l
bC9jcmFzaC5jICB8ICAyICstCj4gIGFyY2gveDg2L2tlcm5lbC9jcmFzaC5jICAgIHwgIDIgKy0K
PiAgaW5jbHVkZS9saW51eC9jcmFzaF9jb3JlLmggfCAgMiArKwo+ICBrZXJuZWwvY3Jhc2hfY29y
ZS5jICAgICAgICB8IDE3ICsrKysrKysrKysrKysrKy0tCj4gIDQgZmlsZXMgY2hhbmdlZCwgMTkg
aW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9rZXJuZWwvY3Jhc2guYyBiL2FyY2gvcmlzY3Yva2VybmVsL2NyYXNoLmMKPiBpbmRleCBmZTVh
NGIzMDZhYWUuLmFjOGRmMmVkZjJhNyAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9j
cmFzaC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvY3Jhc2guYwo+IEBAIC03MCw3ICs3MCw3
IEBAIHZvaWQgYXJjaF9jcmFzaF9oYW5kbGVfaG90cGx1Z19ldmVudChzdHJ1Y3Qga2ltYWdlICpp
bWFnZSwgdm9pZCAqYXJnKQo+ICAJICogQ3JlYXRlIHRoZSBuZXcgZWxmY29yZWhkciByZWZsZWN0
aW5nIHRoZSBjaGFuZ2VzIHRvIENQVSBhbmQvb3IKPiAgCSAqIG1lbW9yeSByZXNvdXJjZXMuCj4g
IAkgKi8KPiAtCWlmIChjcmFzaF9wcmVwYXJlX2hlYWRlcnModHJ1ZSwgJmVsZmJ1ZiwgJmVsZnN6
LCBOVUxMKSkgewo+ICsJaWYgKF9fY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKHRydWUsICZlbGZidWYs
ICZlbGZzeiwgTlVMTCkpIHsKPiAgCQlwcl9lcnIoInVuYWJsZSB0byBjcmVhdGUgbmV3IGVsZmNv
cmVoZHIiKTsKPiAgCQlnb3RvIG91dDsKPiAgCX0KPiBkaWZmIC0tZ2l0IGEvYXJjaC94ODYva2Vy
bmVsL2NyYXNoLmMgYi9hcmNoL3g4Ni9rZXJuZWwvY3Jhc2guYwo+IGluZGV4IGU2ZjIzOTMzYTZk
Zi4uYmVmMDA4YTBjYjIyIDEwMDY0NAo+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9jcmFzaC5jCj4g
KysrIGIvYXJjaC94ODYva2VybmVsL2NyYXNoLmMKPiBAQCAtNDY1LDcgKzQ2NSw3IEBAIHZvaWQg
YXJjaF9jcmFzaF9oYW5kbGVfaG90cGx1Z19ldmVudChzdHJ1Y3Qga2ltYWdlICppbWFnZSwgdm9p
ZCAqYXJnKQo+ICAJICogQ3JlYXRlIHRoZSBuZXcgZWxmY29yZWhkciByZWZsZWN0aW5nIHRoZSBj
aGFuZ2VzIHRvIENQVSBhbmQvb3IKPiAgCSAqIG1lbW9yeSByZXNvdXJjZXMuCj4gIAkgKi8KPiAt
CWlmIChjcmFzaF9wcmVwYXJlX2hlYWRlcnMoSVNfRU5BQkxFRChDT05GSUdfWDg2XzY0KSwgJmVs
ZmJ1ZiwgJmVsZnN6LCBOVUxMKSkgewo+ICsJaWYgKF9fY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKElT
X0VOQUJMRUQoQ09ORklHX1g4Nl82NCksICZlbGZidWYsICZlbGZzeiwgTlVMTCkpIHsKPiAgCQlw
cl9lcnIoInVuYWJsZSB0byBjcmVhdGUgbmV3IGVsZmNvcmVoZHIiKTsKPiAgCQlnb3RvIG91dDsK
PiAgCX0KPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9jcmFzaF9jb3JlLmggYi9pbmNsdWRl
L2xpbnV4L2NyYXNoX2NvcmUuaAo+IGluZGV4IGJjMDg3MTI0Y2Q3OC4uMjhlN2E4MWNmMjYzIDEw
MDY0NAo+IC0tLSBhL2luY2x1ZGUvbGludXgvY3Jhc2hfY29yZS5oCj4gKysrIGIvaW5jbHVkZS9s
aW51eC9jcmFzaF9jb3JlLmgKPiBAQCAtNjEsNiArNjEsOCBAQCBleHRlcm4gaW50IGNyYXNoX3By
ZXBhcmVfZWxmNjRfaGVhZGVycyhzdHJ1Y3QgY3Jhc2hfbWVtICptZW0sIGludCBuZWVkX2tlcm5l
bF9tYQo+ICAJCQkJICAgICAgIHZvaWQgKiphZGRyLCB1bnNpZ25lZCBsb25nICpzeik7Cj4gIGV4
dGVybiBpbnQgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKGludCBuZWVkX2tlcm5lbF9tYXAsIHZvaWQg
KiphZGRyLAo+ICAJCQkJIHVuc2lnbmVkIGxvbmcgKnN6LCB1bnNpZ25lZCBsb25nICpucl9tZW1f
cmFuZ2VzKTsKPiAraW50IF9fY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKGludCBuZWVkX2tlcm5lbF9t
YXAsIHZvaWQgKiphZGRyLCB1bnNpZ25lZCBsb25nICpzeiwKPiArCQkJICAgIHVuc2lnbmVkIGxv
bmcgKm5yX21lbV9yYW5nZXMpOwo+ICBleHRlcm4gaW50IGNyYXNoX2V4Y2x1ZGVfY29yZV9yYW5n
ZXMoc3RydWN0IGNyYXNoX21lbSAqKmNtZW0pOwo+ICAKPiAgc3RydWN0IGtpbWFnZTsKPiBkaWZm
IC0tZ2l0IGEva2VybmVsL2NyYXNoX2NvcmUuYyBiL2tlcm5lbC9jcmFzaF9jb3JlLmMKPiBpbmRl
eCBmYWEwZjIyZGJiNDEuLjhhODYxYTk0NmUyNiAxMDA2NDQKPiAtLS0gYS9rZXJuZWwvY3Jhc2hf
Y29yZS5jCj4gKysrIGIva2VybmVsL2NyYXNoX2NvcmUuYwo+IEBAIC0xNiw2ICsxNiw3IEBACj4g
ICNpbmNsdWRlIDxsaW51eC9tbS5oPgo+ICAjaW5jbHVkZSA8bGludXgvY3B1aG90cGx1Zy5oPgo+
ICAjaW5jbHVkZSA8bGludXgvbWVtYmxvY2suaD4KPiArI2luY2x1ZGUgPGxpbnV4L2RldmljZS5o
Pgo+ICAjaW5jbHVkZSA8bGludXgva21lbWxlYWsuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L2NyYXNo
X2NvcmUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5oPgo+IEBAIC0zNDQsOCArMzQ1LDgg
QEAgaW50IGNyYXNoX2V4Y2x1ZGVfY29yZV9yYW5nZXMoc3RydWN0IGNyYXNoX21lbSAqKmNtZW0p
Cj4gIAlyZXR1cm4gMDsKPiAgfQo+ICAKPiAtaW50IGNyYXNoX3ByZXBhcmVfaGVhZGVycyhpbnQg
bmVlZF9rZXJuZWxfbWFwLCB2b2lkICoqYWRkciwgdW5zaWduZWQgbG9uZyAqc3osCj4gLQkJCSAg
dW5zaWduZWQgbG9uZyAqbnJfbWVtX3JhbmdlcykKPiAraW50IF9fY3Jhc2hfcHJlcGFyZV9oZWFk
ZXJzKGludCBuZWVkX2tlcm5lbF9tYXAsIHZvaWQgKiphZGRyLCB1bnNpZ25lZCBsb25nICpzeiwK
PiArCQkJICAgIHVuc2lnbmVkIGxvbmcgKm5yX21lbV9yYW5nZXMpCj4gIHsKPiAgCXVuc2lnbmVk
IGludCBtYXhfbnJfcmFuZ2VzOwo+ICAJc3RydWN0IGNyYXNoX21lbSAqY21lbTsKPiBAQCAtMzgy
LDYgKzM4MywxOCBAQCBpbnQgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKGludCBuZWVkX2tlcm5lbF9t
YXAsIHZvaWQgKiphZGRyLCB1bnNpZ25lZCBsb25nICpzeiwKPiAgCXJldHVybiByZXQ7Cj4gIH0K
PiAgCj4gK2ludCBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoaW50IG5lZWRfa2VybmVsX21hcCwgdm9p
ZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6LAo+ICsJCQkgIHVuc2lnbmVkIGxvbmcgKm5yX21l
bV9yYW5nZXMpCj4gK3sKPiArCWludCByZXQ7Cj4gKwo+ICsJbG9ja19kZXZpY2VfaG90cGx1Zygp
Owo+ICsJcmV0ID0gX19jcmFzaF9wcmVwYXJlX2hlYWRlcnMobmVlZF9rZXJuZWxfbWFwLCBhZGRy
LCBzeiwgbnJfbWVtX3Jhbmdlcyk7Cj4gKwl1bmxvY2tfZGV2aWNlX2hvdHBsdWcoKTsKCkkgdGhp
bmsgdGhpcyBwYXRjaCBjb25mbGljdHMgd2l0aCBteSBjaGFuZ2VzIGFuZCB3b3VsZCBhbHNvIGNv
bmZsaWN0CndpdGggdGhlIGltcGxlbWVudGF0aW9uIG9mIGFybTY0IGNyYXNoIGhvdHBsdWcuCgpo
dHRwczovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjA5MjEwOTA0NTAuODA3NTc1LTE1LXJ1YW5q
aW5qaWVAaHVhd2VpLmNvbS8KCmFybTY0IGNyYXNoIGhvdHBsdWc6Cmh0dHBzOi8vbG9yZS5rZXJu
ZWwub3JnL2FsbC8yMDI2MDkxODEwMDQ0Mi4zODQxMTM1LTE4LXJ1YW5qaW5qaWVAaHVhd2VpLmNv
bS8KCj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICsKPiAgLyoqCj4gICAqIGNyYXNoX2V4Y2x1
ZGVfbWVtX3JhbmdlIC0gZXhjbHVkZSBhIG1lbSByYW5nZSBmb3IgZXhpc3RpbmcgcmFuZ2VzCj4g
ICAqIEBtZW06IG1lbS0+cmFuZ2UgY29udGFpbnMgYW4gYXJyYXkgb2YgcmFuZ2VzIHNvcnRlZCBp
biBhc2NlbmRpbmcgb3JkZXIKCi0tIApCZXN0IHJlZ2FyZHMsCkppbmppZQoKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
