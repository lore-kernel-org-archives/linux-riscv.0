Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7BF9606A31E
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 02:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=HgRCGlj6;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=5dAoixTz
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=j5rD819edLneDoLvwHTTkB/otK9g1vzcIoSQSRSBKKk=; b=HgRCGlj6aiIELs9R+JPkUVk8ou
	a/ZW/qxafKsrQi758LzIyAX7J1LuB66mOu418/X5U9XBTkMSvSBDCi/b5x8WTtDrZNBtWg8i00tT+
	OBcgd1xy5jJi8ijqISFpErtFRPysl9QTZwwa4YhFjeGo+qGiLdWPQBnxb1Qpru6BzfLuBQj6OjHd5
	+Zvz+Jsnu4kjph3Hg4rcv64KjPPoUw0olF9/iaMjqbQ4U7fgq377UDdtRBpV3+lxOYM/j3TtWbY+Q
	KzQYX8QsacsZW3MbvnA39CKNjRpJMzbU2zHa+Odd5lChCPqDYDCkEKOzbKUGUCBpRD6jygPdt8ZmW
	fwLGywqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX7mw-00000000HiK-3V6F;
	Sat, 28 Nov 2026 02:03:42 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX7mr-00000000HhE-25i0;
	Sat, 28 Nov 2026 02:03:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Bb02QMbPzYGMZl2XBsuZPs04tkTOlgjVE/NIsauxzp4=;
	b=5dAoixTzdi5Pva3FlAw+4G4gvuRSbcuNIp9u6jt4z68aplPRUSy8CmEDY1bii9n7+mU75QUxP
	s5A0vr9IzCzDScYnVJHNow//t6iWbrZ46GCsHh9kMtlyDcQkW7OdSxett+AHYn6ZaJFvgQk+BOj
	M3+5IMQ/nsRWxs/EB7JtCUI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4jbtpt197czKm6c;
	Sat, 28 Nov 2026 10:03:02 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 8271540563;
	Sat, 28 Nov 2026 10:03:22 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 28 Nov
 2026 10:03:21 +0800
Message-ID: <6448a512-9c1a-441b-a8b8-7bf654e8b2a5@huawei.com>
Date: Sat, 28 Nov 2026 10:03:20 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 3/8] crash_core: serialize crash header preparation
 against hotplug
To: Wandun Chen <chenwandun1@gmail.com>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<robh@kernel.org>, <baoquan.he@linux.dev>, <rppt@kernel.org>,
	<m.szyprowski@samsung.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <tglx@kernel.org>,
	<mingo@redhat.com>, <bp@alien8.de>, <dave.hansen@linux.intel.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <saravanak@kernel.org>,
	<akpm@linux-foundation.org>, <pasha.tatashin@soleen.com>,
	<pratyush@kernel.org>, <ruirui.yang@linux.dev>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<loongarch@lists.linux.dev>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <kexec@lists.infradead.org>,
	<linux-mm@kvack.org>, <iommu@lists.linux.dev>
References: <20261127090723.741253-1-chenwandun1@gmail.com>
 <20261127090723.741253-4-chenwandun1@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261127090723.741253-4-chenwandun1@gmail.com>
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_180338_263925_9F592BFA 
X-CRM114-Status: GOOD (  18.14  )
X-Spam-Score: -2.7 (--)
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
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

CgrlnKggMjAyNi8xMS8yNyAxNzowNywgV2FuZHVuIENoZW4g5YaZ6YGTOgo+IEZyb206IFdhbmR1
biBDaGVuIDxjaGVud2FuZHVuQGxpeGlhbmcuY29tPgo+IAo+IGNyYXNoX3ByZXBhcmVfaGVhZGVy
cygpIGNvdW50cyBtZW1vcnkgcmFuZ2VzIGJlZm9yZSBwb3B1bGF0aW5nIHRoZQo+IGFsbG9jYXRl
ZCBjcmFzaF9tZW0gYXJyYXkuIFRoZSB3ZWFrIGltcGxlbWVudGF0aW9uIHVzZWQgYnkgQVJNNjQs
Cj4gUklTQy1WIGFuZCBMb29uZ0FyY2ggd2Fsa3MgbWVtYmxvY2subWVtb3J5LCB3aGlsZSB4ODYg
cGVyZm9ybXMgdGhlCj4gc2FtZSB0d28tcGFzcyBvcGVyYXRpb24gb3ZlciBzeXN0ZW0gUkFNIHJl
c291cmNlcy4gQ29uY3VycmVudCBtZW1vcnkKPiBob3RwbHVnIGNhbiBjaGFuZ2UgcmFuZ2Ugc291
cmNlIGJldHdlZW4gdGhlIHR3byB3YWxrcyBhbmQgbWFrZSB0aGUKPiBwb3B1bGF0ZSBwYXNzIG92
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
X2NvcmUuaD4KPiAgI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5oPgoKVGhlIG9yZGVyIG9mIHRoZSBo
ZWFkZXIgZmlsZXMgaXMgY29tcGxldGVseSBtZXNzZWQgdXAgbm93LgoKPiBAQCAtMzQ0LDggKzM0
NSw4IEBAIGludCBjcmFzaF9leGNsdWRlX2NvcmVfcmFuZ2VzKHN0cnVjdCBjcmFzaF9tZW0gKipj
bWVtKQo+ICAJcmV0dXJuIDA7Cj4gIH0KPiAgCj4gLWludCBjcmFzaF9wcmVwYXJlX2hlYWRlcnMo
aW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6LAo+IC0J
CQkgIHVuc2lnbmVkIGxvbmcgKm5yX21lbV9yYW5nZXMpCj4gK2ludCBfX2NyYXNoX3ByZXBhcmVf
aGVhZGVycyhpbnQgbmVlZF9rZXJuZWxfbWFwLCB2b2lkICoqYWRkciwgdW5zaWduZWQgbG9uZyAq
c3osCj4gKwkJCSAgICB1bnNpZ25lZCBsb25nICpucl9tZW1fcmFuZ2VzKQo+ICB7Cj4gIAl1bnNp
Z25lZCBpbnQgbWF4X25yX3JhbmdlczsKPiAgCXN0cnVjdCBjcmFzaF9tZW0gKmNtZW07Cj4gQEAg
LTM4Miw2ICszODMsMTggQEAgaW50IGNyYXNoX3ByZXBhcmVfaGVhZGVycyhpbnQgbmVlZF9rZXJu
ZWxfbWFwLCB2b2lkICoqYWRkciwgdW5zaWduZWQgbG9uZyAqc3osCj4gIAlyZXR1cm4gcmV0Owo+
ICB9Cj4gIAo+ICtpbnQgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKGludCBuZWVkX2tlcm5lbF9tYXAs
IHZvaWQgKiphZGRyLCB1bnNpZ25lZCBsb25nICpzeiwKPiArCQkJICB1bnNpZ25lZCBsb25nICpu
cl9tZW1fcmFuZ2VzKQo+ICt7Cj4gKwlpbnQgcmV0Owo+ICsKPiArCWxvY2tfZGV2aWNlX2hvdHBs
dWcoKTsKPiArCXJldCA9IF9fY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKG5lZWRfa2VybmVsX21hcCwg
YWRkciwgc3osIG5yX21lbV9yYW5nZXMpOwo+ICsJdW5sb2NrX2RldmljZV9ob3RwbHVnKCk7Cj4g
Kwo+ICsJcmV0dXJuIHJldDsKCm90aGVyd2lzZSwgTEdUTQpSZXZpZXdlZC1ieTogSmluamllIFJ1
YW4gPHJ1YW5qaW5qaWVAaHVhd2VpLmNvbT4KCj4gK30KPiArCj4gIC8qKgo+ICAgKiBjcmFzaF9l
eGNsdWRlX21lbV9yYW5nZSAtIGV4Y2x1ZGUgYSBtZW0gcmFuZ2UgZm9yIGV4aXN0aW5nIHJhbmdl
cwo+ICAgKiBAbWVtOiBtZW0tPnJhbmdlIGNvbnRhaW5zIGFuIGFycmF5IG9mIHJhbmdlcyBzb3J0
ZWQgaW4gYXNjZW5kaW5nIG9yZGVyCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
