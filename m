Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DB87606A31E
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Oct 2026 02:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EbME6xT8;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=Q+4ivRAN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sF2ziXgCm4YV8eGgnvOysgbkNXQGZyQu32sK75xWaGU=; b=EbME6xT8ICjpKT
	XwCj5qmrDA4Ixeom5/FB5XShGEFJEQKhWSw2/RkjY4lcPqa912tF8FqMPX/7Nr5t/9XNNrY/JKQqI
	tLCQuDDWQr3FMlRNlr2h8bsi44OepQMZKCoRljEefAmdv4KUHAz0KVysI5zbhXIY4gGCTPDG9Pvbq
	cnZbsx6k3XD9JVn74ffdhObGebmtpEXmci067yQJtuLuK3mIzKJ94XtdiY6mgSgH2/DyXmnxVZRUs
	ARrFe9kPm1nm+QsX0Qxvgnct9Qp3OWrEDrkvWmseA2rOrrEfqznbrIsIRisv6TQgeIAgP6Z6VgUNc
	EkUzzlyguO6oL6k43tpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJi7M-0000000DAe5-49rT;
	Thu, 22 Oct 2026 02:01:20 +0000
Received: from [113.46.200.225] (helo=canpmsgout10.his.huawei.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJi7J-0000000DAdA-02YA;
	Thu, 22 Oct 2026 02:01:19 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=loBgwUbLOnAAak0q9uGjIQKEwQ4a4j4TVh8P+20MXEg=;
	b=Q+4ivRANcgbbFZT+RuqnOmzfQRgx/LVfmZmJnBznw3aijzTfLqiAXmQFPpHZ4wQr5N/a+UnSk
	9QkwZygXGFsy6k2d0kw287r6cGCOPL2MK5xfPM3ACXVTWwq6O1+K0stbkZqxhIDb9q0MkhN+DRw
	UTGHL86gM/CDOpMtrrbG38U=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4j98WL5Vhfz1K972;
	Thu, 22 Oct 2026 10:00:46 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 2FEAB40563;
	Thu, 22 Oct 2026 10:00:51 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 22 Oct
 2026 10:00:49 +0800
Message-ID: <31d63208-3ef2-420f-a0c2-d9d6d49c5e21@huawei.com>
Date: Thu, 22 Oct 2026 10:00:49 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 3/8] crash_core: serialize crash header preparation
 against hotplug
To: Wandun <chenwandun1@gmail.com>, <robh@kernel.org>, <baoquan.he@linux.dev>,
	<rppt@kernel.org>, <m.szyprowski@samsung.com>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<chenhuacai@kernel.org>, <kernel@xen0n.name>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<tglx@kernel.org>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<saravanak@kernel.org>, <akpm@linux-foundation.org>,
	<pasha.tatashin@soleen.com>, <pratyush@kernel.org>, <ruirui.yang@linux.dev>,
	<robin.murphy@arm.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <loongarch@lists.linux.dev>,
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<kexec@lists.infradead.org>, <linux-mm@kvack.org>, <iommu@lists.linux.dev>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
 <20261021083011.2170525-4-chenwandun1@gmail.com>
 <12e4e687-1ff0-41b2-bdf8-7f48b29e1f2f@huawei.com>
 <a1665f9e-3116-47bc-974e-98dce408fa37@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <a1665f9e-3116-47bc-974e-98dce408fa37@gmail.com>
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_190117_372670_85AA50F8 
X-CRM114-Status: GOOD (  21.58  )
X-Spam-Score: -1.2 (-)
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

CgrlnKggMjAyNi8xMC8yMSAxNzo0OCwgV2FuZHVuIOWGmemBkzoKPiAKPiAKPiBPbiAxMC8yMS8y
NiAxNzoxMywgSmluamllIFJ1YW4gd3JvdGU6Cj4+Cj4+Cj4+IOWcqCAyMDI2LzEwLzIxIDE2OjMw
LCBXYW5kdW4gQ2hlbiDlhpnpgZM6Cj4+PiBGcm9tOiBXYW5kdW4gQ2hlbiA8Y2hlbndhbmR1bkBs
aXhpYW5nLmNvbT4KPj4+Cj4+PiBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoKSBjb3VudHMgbWVtb3J5
IHJhbmdlcyBiZWZvcmUgcG9wdWxhdGluZyB0aGUKPj4+IGFsbG9jYXRlZCBjcmFzaF9tZW0gYXJy
YXkuIFRoZSB3ZWFrIGltcGxlbWVudGF0aW9uIHVzZWQgYnkgQVJNNjQsCj4+PiBSSVNDLVYgYW5k
IExvb25nQXJjaCB3YWxrcyBtZW1ibG9jay5tZW1vcnksIHdoaWxlIHg4NiBwZXJmb3JtcyB0aGUg
c2FtZQo+Pj4gdHdvLXBhc3Mgb3BlcmF0aW9uIG92ZXIgc3lzdGVtIFJBTSByZXNvdXJjZXMuIENv
bmN1cnJlbnQgbWVtb3J5IGhvdHBsdWcKPj4+IGNhbiBjaGFuZ2UgcmFuZ2Ugc291cmNlIGJldHdl
ZW4gdGhlIHR3byB3YWxrcyBhbmQgbWFrZSB0aGUgcG9wdWxhdGUKPj4+IHBhc3Mgb3ZlcmZsb3cg
Y21lbS0+cmFuZ2VzLgo+Pj4KPj4+IFRha2UgZGV2aWNlX2hvdHBsdWdfbG9jayB3aGVuIHByZXBh
cmluZyBjcmFzaCBoZWFkZXJzIGR1cmluZwo+Pj4ga2V4ZWNfZmlsZV9sb2FkKCkuIFRoZSB4ODYv
cmlzY3YgbWVtb3J5IGhvdHBsdWcgcGF0aCBhbHJlYWR5IHRha2VzCj4+PiBkZXZpY2VfaG90cGx1
Z19sb2NrLCBzbyBjYWxsIF9fY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKCkgZGlyZWN0bHkKPj4+IHRv
IGF2b2lkIHJlY3Vyc2l2ZSBsb2NraW5nLgo+Pj4KPj4+IFNhc2hpa28gcmVwb3J0ZWQgdGhpcyBp
c3N1ZSBpbiBbMV0uCj4+Pgo+Pj4gRml4ZXM6IDM3NTFlNzI4Y2VmMiAoImFybTY0OiBrZXhlY19m
aWxlOiBhZGQgY3Jhc2ggZHVtcCBzdXBwb3J0IikKPj4+IEZpeGVzOiAxYmNjYTg2MjBhOTEgKCJM
b29uZ0FyY2g6IEFkZCBjcmFzaCBkdW1wIHN1cHBvcnQgZm9yIGtleGVjX2ZpbGUiKQo+Pj4gRml4
ZXM6IDhhY2VhNDU1ZmFmYSAoIlJJU0MtVjogU3VwcG9ydCBmb3Iga2V4ZWNfZmlsZSBvbiBwYW5p
YyIpCj4+PiBGaXhlczogZGQ1ZjcyNjA3NmNjICgia2V4ZWM6IHN1cHBvcnQgZm9yIGtleGVjIG9u
IHBhbmljIHVzaW5nIG5ldyBzeXN0ZW0gY2FsbCIpCj4+PiBTaWduZWQtb2ZmLWJ5OiBXYW5kdW4g
Q2hlbiA8Y2hlbndhbmR1bkBsaXhpYW5nLmNvbT4KPj4+IExpbms6IGh0dHBzOi8vc2FzaGlrby5k
ZXYvIy9tZXNzYWdlLzIwMjYwODA2MTAxMDAyLjFGODRFMUYwMDBFOUBzbXRwLmtlcm5lbC5vcmcg
WzFdCj4+PiBBY2tlZC1ieTogQmFvcXVhbiBIZSA8YmFvcXVhbi5oZUBsaW51eC5kZXY+Cj4+PiAt
LS0KPj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaC5jICB8ICAyICstCj4+PiAgYXJjaC94ODYv
a2VybmVsL2NyYXNoLmMgICAgfCAgMiArLQo+Pj4gIGluY2x1ZGUvbGludXgvY3Jhc2hfY29yZS5o
IHwgIDIgKysKPj4+ICBrZXJuZWwvY3Jhc2hfY29yZS5jICAgICAgICB8IDE3ICsrKysrKysrKysr
KysrKy0tCj4+PiAgNCBmaWxlcyBjaGFuZ2VkLCAxOSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaC5jIGIvYXJj
aC9yaXNjdi9rZXJuZWwvY3Jhc2guYwo+Pj4gaW5kZXggZmU1YTRiMzA2YWFlLi5hYzhkZjJlZGYy
YTcgMTAwNjQ0Cj4+PiAtLS0gYS9hcmNoL3Jpc2N2L2tlcm5lbC9jcmFzaC5jCj4+PiArKysgYi9h
cmNoL3Jpc2N2L2tlcm5lbC9jcmFzaC5jCj4+PiBAQCAtNzAsNyArNzAsNyBAQCB2b2lkIGFyY2hf
Y3Jhc2hfaGFuZGxlX2hvdHBsdWdfZXZlbnQoc3RydWN0IGtpbWFnZSAqaW1hZ2UsIHZvaWQgKmFy
ZykKPj4+ICAJICogQ3JlYXRlIHRoZSBuZXcgZWxmY29yZWhkciByZWZsZWN0aW5nIHRoZSBjaGFu
Z2VzIHRvIENQVSBhbmQvb3IKPj4+ICAJICogbWVtb3J5IHJlc291cmNlcy4KPj4+ICAJICovCj4+
PiAtCWlmIChjcmFzaF9wcmVwYXJlX2hlYWRlcnModHJ1ZSwgJmVsZmJ1ZiwgJmVsZnN6LCBOVUxM
KSkgewo+Pj4gKwlpZiAoX19jcmFzaF9wcmVwYXJlX2hlYWRlcnModHJ1ZSwgJmVsZmJ1ZiwgJmVs
ZnN6LCBOVUxMKSkgewo+Pj4gIAkJcHJfZXJyKCJ1bmFibGUgdG8gY3JlYXRlIG5ldyBlbGZjb3Jl
aGRyIik7Cj4+PiAgCQlnb3RvIG91dDsKPj4+ICAJfQo+Pj4gZGlmZiAtLWdpdCBhL2FyY2gveDg2
L2tlcm5lbC9jcmFzaC5jIGIvYXJjaC94ODYva2VybmVsL2NyYXNoLmMKPj4+IGluZGV4IGU2ZjIz
OTMzYTZkZi4uYmVmMDA4YTBjYjIyIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC94ODYva2VybmVsL2Ny
YXNoLmMKPj4+ICsrKyBiL2FyY2gveDg2L2tlcm5lbC9jcmFzaC5jCj4+PiBAQCAtNDY1LDcgKzQ2
NSw3IEBAIHZvaWQgYXJjaF9jcmFzaF9oYW5kbGVfaG90cGx1Z19ldmVudChzdHJ1Y3Qga2ltYWdl
ICppbWFnZSwgdm9pZCAqYXJnKQo+Pj4gIAkgKiBDcmVhdGUgdGhlIG5ldyBlbGZjb3JlaGRyIHJl
ZmxlY3RpbmcgdGhlIGNoYW5nZXMgdG8gQ1BVIGFuZC9vcgo+Pj4gIAkgKiBtZW1vcnkgcmVzb3Vy
Y2VzLgo+Pj4gIAkgKi8KPj4+IC0JaWYgKGNyYXNoX3ByZXBhcmVfaGVhZGVycyhJU19FTkFCTEVE
KENPTkZJR19YODZfNjQpLCAmZWxmYnVmLCAmZWxmc3osIE5VTEwpKSB7Cj4+PiArCWlmIChfX2Ny
YXNoX3ByZXBhcmVfaGVhZGVycyhJU19FTkFCTEVEKENPTkZJR19YODZfNjQpLCAmZWxmYnVmLCAm
ZWxmc3osIE5VTEwpKSB7Cj4+PiAgCQlwcl9lcnIoInVuYWJsZSB0byBjcmVhdGUgbmV3IGVsZmNv
cmVoZHIiKTsKPj4+ICAJCWdvdG8gb3V0Owo+Pj4gIAl9Cj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVk
ZS9saW51eC9jcmFzaF9jb3JlLmggYi9pbmNsdWRlL2xpbnV4L2NyYXNoX2NvcmUuaAo+Pj4gaW5k
ZXggYmMwODcxMjRjZDc4Li4yOGU3YTgxY2YyNjMgMTAwNjQ0Cj4+PiAtLS0gYS9pbmNsdWRlL2xp
bnV4L2NyYXNoX2NvcmUuaAo+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9jcmFzaF9jb3JlLmgKPj4+
IEBAIC02MSw2ICs2MSw4IEBAIGV4dGVybiBpbnQgY3Jhc2hfcHJlcGFyZV9lbGY2NF9oZWFkZXJz
KHN0cnVjdCBjcmFzaF9tZW0gKm1lbSwgaW50IG5lZWRfa2VybmVsX21hCj4+PiAgCQkJCSAgICAg
ICB2b2lkICoqYWRkciwgdW5zaWduZWQgbG9uZyAqc3opOwo+Pj4gIGV4dGVybiBpbnQgY3Jhc2hf
cHJlcGFyZV9oZWFkZXJzKGludCBuZWVkX2tlcm5lbF9tYXAsIHZvaWQgKiphZGRyLAo+Pj4gIAkJ
CQkgdW5zaWduZWQgbG9uZyAqc3osIHVuc2lnbmVkIGxvbmcgKm5yX21lbV9yYW5nZXMpOwo+Pj4g
K2ludCBfX2NyYXNoX3ByZXBhcmVfaGVhZGVycyhpbnQgbmVlZF9rZXJuZWxfbWFwLCB2b2lkICoq
YWRkciwgdW5zaWduZWQgbG9uZyAqc3osCj4+PiArCQkJICAgIHVuc2lnbmVkIGxvbmcgKm5yX21l
bV9yYW5nZXMpOwo+Pj4gIGV4dGVybiBpbnQgY3Jhc2hfZXhjbHVkZV9jb3JlX3JhbmdlcyhzdHJ1
Y3QgY3Jhc2hfbWVtICoqY21lbSk7Cj4+PiAgCj4+PiAgc3RydWN0IGtpbWFnZTsKPj4+IGRpZmYg
LS1naXQgYS9rZXJuZWwvY3Jhc2hfY29yZS5jIGIva2VybmVsL2NyYXNoX2NvcmUuYwo+Pj4gaW5k
ZXggZmFhMGYyMmRiYjQxLi44YTg2MWE5NDZlMjYgMTAwNjQ0Cj4+PiAtLS0gYS9rZXJuZWwvY3Jh
c2hfY29yZS5jCj4+PiArKysgYi9rZXJuZWwvY3Jhc2hfY29yZS5jCj4+PiBAQCAtMTYsNiArMTYs
NyBAQAo+Pj4gICNpbmNsdWRlIDxsaW51eC9tbS5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9jcHVo
b3RwbHVnLmg+Cj4+PiAgI2luY2x1ZGUgPGxpbnV4L21lbWJsb2NrLmg+Cj4+PiArI2luY2x1ZGUg
PGxpbnV4L2RldmljZS5oPgo+Pj4gICNpbmNsdWRlIDxsaW51eC9rbWVtbGVhay5oPgo+Pj4gICNp
bmNsdWRlIDxsaW51eC9jcmFzaF9jb3JlLmg+Cj4+PiAgI2luY2x1ZGUgPGxpbnV4L3JlYm9vdC5o
Pgo+Pj4gQEAgLTM0NCw4ICszNDUsOCBAQCBpbnQgY3Jhc2hfZXhjbHVkZV9jb3JlX3Jhbmdlcyhz
dHJ1Y3QgY3Jhc2hfbWVtICoqY21lbSkKPj4+ICAJcmV0dXJuIDA7Cj4+PiAgfQo+Pj4gIAo+Pj4g
LWludCBjcmFzaF9wcmVwYXJlX2hlYWRlcnMoaW50IG5lZWRfa2VybmVsX21hcCwgdm9pZCAqKmFk
ZHIsIHVuc2lnbmVkIGxvbmcgKnN6LAo+Pj4gLQkJCSAgdW5zaWduZWQgbG9uZyAqbnJfbWVtX3Jh
bmdlcykKPj4+ICtpbnQgX19jcmFzaF9wcmVwYXJlX2hlYWRlcnMoaW50IG5lZWRfa2VybmVsX21h
cCwgdm9pZCAqKmFkZHIsIHVuc2lnbmVkIGxvbmcgKnN6LAo+Pj4gKwkJCSAgICB1bnNpZ25lZCBs
b25nICpucl9tZW1fcmFuZ2VzKQo+Pj4gIHsKPj4+ICAJdW5zaWduZWQgaW50IG1heF9ucl9yYW5n
ZXM7Cj4+PiAgCXN0cnVjdCBjcmFzaF9tZW0gKmNtZW07Cj4+PiBAQCAtMzgyLDYgKzM4MywxOCBA
QCBpbnQgY3Jhc2hfcHJlcGFyZV9oZWFkZXJzKGludCBuZWVkX2tlcm5lbF9tYXAsIHZvaWQgKiph
ZGRyLCB1bnNpZ25lZCBsb25nICpzeiwKPj4+ICAJcmV0dXJuIHJldDsKPj4+ICB9Cj4+PiAgCj4+
PiAraW50IGNyYXNoX3ByZXBhcmVfaGVhZGVycyhpbnQgbmVlZF9rZXJuZWxfbWFwLCB2b2lkICoq
YWRkciwgdW5zaWduZWQgbG9uZyAqc3osCj4+PiArCQkJICB1bnNpZ25lZCBsb25nICpucl9tZW1f
cmFuZ2VzKQo+Pj4gK3sKPj4+ICsJaW50IHJldDsKPj4+ICsKPj4+ICsJbG9ja19kZXZpY2VfaG90
cGx1ZygpOwo+Pj4gKwlyZXQgPSBfX2NyYXNoX3ByZXBhcmVfaGVhZGVycyhuZWVkX2tlcm5lbF9t
YXAsIGFkZHIsIHN6LCBucl9tZW1fcmFuZ2VzKTsKPj4+ICsJdW5sb2NrX2RldmljZV9ob3RwbHVn
KCk7Cj4+Cj4+IEkgdGhpbmsgdGhpcyBwYXRjaCBjb25mbGljdHMgd2l0aCBteSBjaGFuZ2VzIGFu
ZCB3b3VsZCBhbHNvIGNvbmZsaWN0Cj4+IHdpdGggdGhlIGltcGxlbWVudGF0aW9uIG9mIGFybTY0
IGNyYXNoIGhvdHBsdWcuCj4+Cj4+IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDky
MTA5MDQ1MC44MDc1NzUtMTUtcnVhbmppbmppZUBodWF3ZWkuY29tLwo+Pgo+IEhhdmUgdGhlc2Ug
cGF0Y2hlcyBhbHJlYWR5IGJlZW4gbWVyZ2VkPyBNeSBjdXJyZW50IHdvcmsgaXMgYmFzZWQgb24g
dGhlIGxhdGVzdAo+IGxpbnV4LW5leHQuIElmIHRoZXkgaGF2ZSBhbHJlYWR5IGJlZW4gbWVyZ2Vk
IGludG8gdGhlIG1haW50YWluZXIncyBicmFuY2gsCj4gcGxlYXNlIGxldCBtZSBrbm93LCBJIHdp
bGwgdXBkYXRlIG15IHRyZWUgYW5kIHJlYmFzZS9yZS1hZGFwdCBteSBjaGFuZ2VzIGFjY29yZGlu
Z2x5Lgo+IAo+IAo+IEFsc28sIHJlZ2FyZGluZyB0aGUgY2hhbmdlcyBpbiBrZXJuZWwvY3Jhc2hf
Y29yZS5jOiBpdCBsb29rcyBsaWtlIHdlIG1vZGlmaWVkCj4gdGhlIHNhbWUgc3BvdCwgdGhlIGNo
YW5nZSBpcyBub3Qgd3JvbmcsIGlzIHRoYXQgcmlnaHQ/CgpIaSBXYW5kdW4sCgpIb3dldmVyLCBJ
IHRoaW5rIHNvbWVvbmUgc2hvdWxkIGhhdmUgaW5mb3JtZWQgbWUgaW4gYWR2YW5jZTsgb3RoZXJ3
aXNlLApkb2luZyBkdXBsaWNhdGUgZml4IHdvcmsgaXMgcG9pbnRsZXNzLgoKSSBzZWUgdGhhdCBw
YXJ0IG9mIHlvdXIgcGF0Y2ggc2VyaWVzIG1vZGlmaWVzIGNvZGUgSSBwcmV2aW91c2x5IGNoYW5n
ZWQsCmJ1dCBJIHdhcyBub3QgQ0MnZC4KCj4gCj4+IGFybTY0IGNyYXNoIGhvdHBsdWc6Cj4+IGh0
dHBzOi8vbG9yZS5rZXJuZWwub3JnL2FsbC8yMDI2MDkxODEwMDQ0Mi4zODQxMTM1LTE4LXJ1YW5q
aW5qaWVAaHVhd2VpLmNvbS8KPiAKPiBJbiBhZGRpdGlvbiwgaWYgYXJtNjQgZ2FpbnMgY3Jhc2gg
aG90cGx1ZyBzdXBwb3J0LCB0aGUgY29kZSB0aGVyZSB3b3VsZCBpbmRlZWQKPiBuZWVkIHRvIGJl
IG1vZGlmaWVkICh0byBhdm9pZCBhIGRlYWRsb2NrKS4gQXMgb2Ygbm93LCBhcm02NCBjcmFzaCBo
b3RwbHVnCj4gc3VwcG9ydCBoYXMgbm90IGJlZW4gbWVyZ2VkIHlldCBlaXRoZXIsIGhhcyBpdD8g
SSBqdXN0IHdhbnQgdG8gbWFrZSBzdXJlIEkKPiBoYXZlbid0IG1pc3NlZCBhbnl0aGluZy4KClll
cywgeW91IGFyZSByaWdodC4gSWYgeW91ciBwYXRjaCBzZXJpZXMgd2lsbCBiZSBtZXJnZWQgc29v
biwgSSB3aWxsCmRldmVsb3AgYmFzZWQgb24gaXQuCgo+IAo+Pgo+Pj4gKwo+Pj4gKwlyZXR1cm4g
cmV0Owo+Pj4gK30KPj4+ICsKPj4+ICAvKioKPj4+ICAgKiBjcmFzaF9leGNsdWRlX21lbV9yYW5n
ZSAtIGV4Y2x1ZGUgYSBtZW0gcmFuZ2UgZm9yIGV4aXN0aW5nIHJhbmdlcwo+Pj4gICAqIEBtZW06
IG1lbS0+cmFuZ2UgY29udGFpbnMgYW4gYXJyYXkgb2YgcmFuZ2VzIHNvcnRlZCBpbiBhc2NlbmRp
bmcgb3JkZXIKPj4KPiAKCi0tIApCZXN0IHJlZ2FyZHMsCkppbmppZQoKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlz
dApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQu
b3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
