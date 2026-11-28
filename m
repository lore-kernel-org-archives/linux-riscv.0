Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F2BD606A31C
	for <linux-riscv@archiver.kernel.org>; Sat, 28 Nov 2026 02:58:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=k4OvxhyT;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SfKvHHDA
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=0T1/hyRzU+hFP7QHZJWPN0cRWt2ChPpNgkr/NJG4Wsw=; b=k4OvxhyTZnwCo1+uapDGcECxj/
	XEFO+cye0Z3Qg0dGspmMw86RHTu6VXP8AkFAKj6Zzpi245Y/KCMBTV87Q1xqg7SxRldDyi6owAqD8
	jlcn/70nxKUwI2Rgpk4bfcf/io3HrLpAoIvMUXymnGvh3mw3wT+7Q5FI2869slF7M1W/Gc6GjhzWU
	Rcxw3+sLB5Wn4Q8xiKbt7IczRDiO/HhTHV1GXnXEQXb6rktcldhUw1pGXnYh69/WO6jpC1ibmBv9H
	gvZB+rgI/+DsU+5gONR0KcdZSny7xgYunG8tc6qYSUp7yeG5Du0mdLolBIh3/GDim5cvZS5x5gU0o
	urwoTW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX8eC-00000000KLN-039Y;
	Sat, 28 Nov 2026 02:58:44 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xX8e5-00000000KK6-1GVV;
	Sat, 28 Nov 2026 02:58:41 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=iXm9bjNklHkCJkXC6cXS/6l9msjPSXzfutfiuU6LTJE=;
	b=SfKvHHDA5DZy5PHVuUfUp7ZJIYPFO/O1wYHgqxN6U4/eJpLR+3Ela1UpPw9XS8p/TtJJrEZrr
	gDPn1UZB2A8lTM0A3I9jkCqzQxTZVWI0Nmo8f3SKrZ6KPSFo+ihxjnn+PVobzzgk/65BELmIsiR
	LEeIYm+6onwT1S/RxJyVyGY=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4jbw1Y64lPzpStH;
	Sat, 28 Nov 2026 10:57:21 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 102B5202E6;
	Sat, 28 Nov 2026 10:58:29 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Sat, 28 Nov
 2026 10:58:28 +0800
Message-ID: <ad0126a1-0d5d-47eb-87fd-1df6ccfece02@huawei.com>
Date: Sat, 28 Nov 2026 10:58:27 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 4/8] crash_core: replace for_each_mem_range() with
 for_each_mem_region()
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
 <20261127090723.741253-5-chenwandun1@gmail.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261127090723.741253-5-chenwandun1@gmail.com>
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261127_185839_205697_3381E040 
X-CRM114-Status: GOOD (  13.02  )
X-Spam-Score: -2.8 (--)
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
biBDaGVuIDxjaGVud2FuZHVuQGxpeGlhbmcuY29tPgo+IAo+IGZvcl9lYWNoX21lbV9yYW5nZSgp
IHNraXBzIE1FTUJMT0NLX05PTUFQIHJlZ2lvbnMgaW1wbGljaXRseS4gU3dpdGNoIHRoZQo+IHdl
YWsgZGVmYXVsdHMgdG8gZm9yX2VhY2hfbWVtX3JlZ2lvbigpLCB3aGljaCBleHBvc2VzIHN0cnVj
dAo+IG1lbWJsb2NrX3JlZ2lvbiBhbmQgcGVyLXJlZ2lvbiBmbGFncywgYW5kIGZpbHRlciBOT01B
UCByZWdpb25zIGV4cGxpY2l0bHkKPiB2aWEgdGhlIG5ldyBjcmFzaF9zaG91bGRfc2tpcF9yZWdp
b24oKSBoZWxwZXIuIFRoaXMgcHJlcGFyZXMgZm9yIGEKPiBzdWJzZXF1ZW50IHBhdGNoIHRvIGV4
dGVuZCB0aGUgc2tpcCBmaWx0ZXIuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2UuCj4gCj4gU2ln
bmVkLW9mZi1ieTogV2FuZHVuIENoZW4gPGNoZW53YW5kdW5AbGl4aWFuZy5jb20+Cj4gVGVzdGVk
LWJ5OiBNZWlqaW5nIFpoYW8gPHpoYW9tZWlqaW5nQGxpeGlhbmcuY29tPgo+IEFja2VkLWJ5OiBC
YW9xdWFuIEhlIDxiYW9xdWFuLmhlQGxpbnV4LmRldj4KPiAtLS0KPiAga2VybmVsL2NyYXNoX2Nv
cmUuYyB8IDI1ICsrKysrKysrKysrKysrKysrLS0tLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDE3
IGluc2VydGlvbnMoKyksIDggZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2tlcm5lbC9j
cmFzaF9jb3JlLmMgYi9rZXJuZWwvY3Jhc2hfY29yZS5jCj4gaW5kZXggOGE4NjFhOTQ2ZTI2Li5l
MTYxYzhiNjVlMDAgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL2NyYXNoX2NvcmUuYwo+ICsrKyBiL2tl
cm5lbC9jcmFzaF9jb3JlLmMKPiBAQCAtMjgzLDI1ICsyODMsMzQgQEAgc3RhdGljIHN0cnVjdCBj
cmFzaF9tZW0gKmFsbG9jX2NtZW0odW5zaWduZWQgaW50IG5yX3JhbmdlcykKPiAgfQo+ICAKPiAg
I2lmZGVmIENPTkZJR19BUkNIX0tFRVBfTUVNQkxPQ0sKPiArLyogRXhjbHVkZSBOT01BUCByZWdp
b25zIGZyb20gdGhlIHZtY29yZS4gKi8KPiArc3RhdGljIGJvb2wgY3Jhc2hfc2hvdWxkX3NraXBf
cmVnaW9uKHN0cnVjdCBtZW1ibG9ja19yZWdpb24gKnJlZykKPiArewo+ICsJcmV0dXJuIG1lbWJs
b2NrX2lzX25vbWFwKHJlZyk7CgoKTEdUTQpSZXZpZXdlZC1ieTogSmluamllIFJ1YW4gPHJ1YW5q
aW5qaWVAaHVhd2VpLmNvbT4KCj4gK30KPiArCj4gIHVuc2lnbmVkIGludCBfX3dlYWsgYXJjaF9n
ZXRfc3lzdGVtX25yX3Jhbmdlcyh2b2lkKQo+ICB7Cj4gIAl1bnNpZ25lZCBpbnQgbnJfcmFuZ2Vz
ID0gMiArIGNyYXNoa19jbWFfY250OyAvKiBjcmFzaGtfcmVzICsgY3Jhc2hrX2xvd19yZXMsICtD
TUEgc3BsaXRzICovCj4gLQlwaHlzX2FkZHJfdCBzdGFydCwgZW5kOwo+IC0JdTY0IGk7Cj4gKwlz
dHJ1Y3QgbWVtYmxvY2tfcmVnaW9uICpyZWc7Cj4gIAo+IC0JZm9yX2VhY2hfbWVtX3JhbmdlKGks
ICZzdGFydCwgJmVuZCkKPiArCWZvcl9lYWNoX21lbV9yZWdpb24ocmVnKSB7Cj4gKwkJaWYgKGNy
YXNoX3Nob3VsZF9za2lwX3JlZ2lvbihyZWcpKQo+ICsJCQljb250aW51ZTsKPiAgCQlucl9yYW5n
ZXMrKzsKPiArCX0KPiAgCXJldHVybiBucl9yYW5nZXM7Cj4gIH0KPiAgCj4gIGludCBfX3dlYWsg
YXJjaF9jcmFzaF9wb3B1bGF0ZV9jbWVtKHN0cnVjdCBjcmFzaF9tZW0gKmNtZW0pCj4gIHsKPiAt
CXBoeXNfYWRkcl90IHN0YXJ0LCBlbmQ7Cj4gLQl1NjQgaTsKPiArCXN0cnVjdCBtZW1ibG9ja19y
ZWdpb24gKnJlZzsKPiAgCj4gLQlmb3JfZWFjaF9tZW1fcmFuZ2UoaSwgJnN0YXJ0LCAmZW5kKSB7
Cj4gLQkJY21lbS0+cmFuZ2VzW2NtZW0tPm5yX3Jhbmdlc10uc3RhcnQgPSBzdGFydDsKPiAtCQlj
bWVtLT5yYW5nZXNbY21lbS0+bnJfcmFuZ2VzXS5lbmQgPSBlbmQgLSAxOwo+ICsJZm9yX2VhY2hf
bWVtX3JlZ2lvbihyZWcpIHsKPiArCQlpZiAoY3Jhc2hfc2hvdWxkX3NraXBfcmVnaW9uKHJlZykp
Cj4gKwkJCWNvbnRpbnVlOwo+ICsJCWNtZW0tPnJhbmdlc1tjbWVtLT5ucl9yYW5nZXNdLnN0YXJ0
ID0gcmVnLT5iYXNlOwo+ICsJCWNtZW0tPnJhbmdlc1tjbWVtLT5ucl9yYW5nZXNdLmVuZCA9IHJl
Zy0+YmFzZSArIHJlZy0+c2l6ZSAtIDE7Cj4gIAkJY21lbS0+bnJfcmFuZ2VzKys7Cj4gIAl9Cj4g
IAlyZXR1cm4gMDsKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
