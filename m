Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17A0C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Nov 2021 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OnIVko7cj5Q/gevXA+v+lMPvQ0399R2BqMDHvQ59V88=; b=MrIdqFEaoN4mHI
	6Nn7wNbJCwLNBuoMFMyPnpdRugv4wEvw1KCjKD3qETGFFRRjVdPLO/2I0PMqCljS2iH6QfTLs8XAX
	NUlOEeJQ2+2k9HRNGIkZRsKN9191W6S5+8SBxKiHL5XoLbcrfa42W9zHqGQJnTKRGN/F9u3SqdMNY
	LpOXLbZ5TeUH6te37t6BqJkfKMF8bStnaZL12DIvP7Au801Qnr1TFq4KkEsPx2e0Y/azDj3OVgH2m
	07zv/w52EWVS6hOAAOR+zNAh5XRzoXHgtB/fo2S6oZNEyNlYLe2v6uRzns3SlTj2+7BMWBoZPg8gV
	Kqx/jtiyAGQk8/mR7uuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mrwqd-003pLc-Oc; Tue, 30 Nov 2021 06:42:39 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mrwqN-003pGt-Gh; Tue, 30 Nov 2021 06:42:25 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4J3CLt4BgzzcbkW;
 Tue, 30 Nov 2021 14:42:14 +0800 (CST)
Received: from dggpemm500001.china.huawei.com (7.185.36.107) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:42:20 +0800
Received: from [10.174.177.243] (10.174.177.243) by
 dggpemm500001.china.huawei.com (7.185.36.107) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2308.20; Tue, 30 Nov 2021 14:42:19 +0800
Message-ID: <b3253299-7381-b977-d19a-b76169d9c9a6@huawei.com>
Date: Tue, 30 Nov 2021 14:42:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH RFC 4/4] mm: percpu: Add generic pcpu_populate_pte()
 function
Content-Language: en-US
To: Dennis Zhou <dennis@kernel.org>
CC: <akpm@linux-foundation.org>, <linux-kernel@vger.kernel.org>,
 <linux-mm@kvack.org>, <tj@kernel.org>, <gregkh@linuxfoundation.org>,
 <cl@linux.com>, <catalin.marinas@arm.com>, <will@kernel.org>,
 <tsbogend@alpha.franken.de>, <mpe@ellerman.id.au>,
 <benh@kernel.crashing.org>, <paulus@samba.org>, <paul.walmsley@sifive.com>,
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <davem@davemloft.net>,
 <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
 <dave.hansen@linux.intel.com>, <hpa@zytor.com>,
 <linux-arm-kernel@lists.infradead.org>, <linux-ia64@vger.kernel.org>,
 <linux-mips@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <linux-riscv@lists.infradead.org>, <sparclinux@vger.kernel.org>,
 <x86@kernel.org>
References: <20211121093557.139034-1-wangkefeng.wang@huawei.com>
 <20211121093557.139034-5-wangkefeng.wang@huawei.com>
 <YaVZB/Lcis4iQ3RY@fedora>
From: Kefeng Wang <wangkefeng.wang@huawei.com>
In-Reply-To: <YaVZB/Lcis4iQ3RY@fedora>
X-Originating-IP: [10.174.177.243]
X-ClientProxiedBy: dggeme705-chm.china.huawei.com (10.1.199.101) To
 dggpemm500001.china.huawei.com (7.185.36.107)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211129_224223_920382_512E8BCE 
X-CRM114-Status: GOOD (  14.71  )
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

Ck9uIDIwMjEvMTEvMzAgNjo0OSwgRGVubmlzIFpob3Ugd3JvdGU6Cj4gT24gU3VuLCBOb3YgMjEs
IDIwMjEgYXQgMDU6MzU6NTdQTSArMDgwMCwgS2VmZW5nIFdhbmcgd3JvdGU6Cj4+IFdoZW4gTkVF
RF9QRVJfQ1BVX1BBR0VfRklSU1RfQ0hVTksgZW5hYmxlZCwgd2UgbmVlZCBhIGZ1bmN0aW9uIHRv
Cj4+IHBvcHVsYXRlIHB0ZSwgYWRkIGEgZ2VuZXJpYyBwY3B1IHBvcHVsYXRlIHB0ZSBmdW5jdGlv
biBhbmQgc3dpdGNoCj4+IHRvIHVzZSBpdC4KPj4KPj4gU2lnbmVkLW9mZi1ieTogS2VmZW5nIFdh
bmcgPHdhbmdrZWZlbmcud2FuZ0BodWF3ZWkuY29tPgo+PiAtLS0KPj4gICBhcmNoL3Bvd2VycGMv
a2VybmVsL3NldHVwXzY0LmMgfCA0NyArLS0tLS0tLS0tLS0tLS0tLS0tLS0KPj4gICBhcmNoL3Nw
YXJjL2tlcm5lbC9zbXBfNjQuYyAgICAgfCA1NyArLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCj4+
ICAgYXJjaC94ODYva2VybmVsL3NldHVwX3BlcmNwdS5jIHwgIDUgKy0tCj4+ICAgZHJpdmVycy9i
YXNlL2FyY2hfbnVtYS5jICAgICAgIHwgNTEgKy0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+PiAgIGlu
Y2x1ZGUvbGludXgvcGVyY3B1LmggICAgICAgICB8ICA1ICstLQo+PiAgIG1tL3BlcmNwdS5jICAg
ICAgICAgICAgICAgICAgICB8IDc3ICsrKysrKysrKysrKysrKysrKysrKysrKysrKysrKystLS0K
Pj4gICA2IGZpbGVzIGNoYW5nZWQsIDc5IGluc2VydGlvbnMoKyksIDE2MyBkZWxldGlvbnMoLSkK
Pj4KLi4uCj4+IGRpZmYgLS1naXQgYS9hcmNoL3g4Ni9rZXJuZWwvc2V0dXBfcGVyY3B1LmMgYi9h
cmNoL3g4Ni9rZXJuZWwvc2V0dXBfcGVyY3B1LmMKPj4gaW5kZXggY2Q2NzJiZDQ2MjQxLi40ZWFk
YmU0NTA3OGUgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gveDg2L2tlcm5lbC9zZXR1cF9wZXJjcHUuYwo+
PiArKysgYi9hcmNoL3g4Ni9rZXJuZWwvc2V0dXBfcGVyY3B1LmMKPj4gQEAgLTEwMSw3ICsxMDEs
NyBAQCBzdGF0aWMgaW50IF9faW5pdCBwY3B1X2NwdV90b19ub2RlKGludCBjcHUpCj4+ICAgCXJl
dHVybiBJU19FTkFCTEVEKENPTkZJR19OVU1BKSA/IGVhcmx5X2NwdV90b19ub2RlKGNwdSkgOiBO
VU1BX05PX05PREU7Cj4+ICAgfQo+PiAgIAo+PiAtc3RhdGljIHZvaWQgX19pbml0IHBjcHVwX3Bv
cHVsYXRlX3B0ZSh1bnNpZ25lZCBsb25nIGFkZHIpCj4+ICt2b2lkIF9faW5pdCBwY3B1X3BvcHVs
YXRlX3B0ZSh1bnNpZ25lZCBsb25nIGFkZHIpCj4+ICAgewo+PiAgIAlwb3B1bGF0ZV9leHRyYV9w
dGUoYWRkcik7Cj4+ICAgfQo+PiBAQCAtMTYzLDggKzE2Myw3IEBAIHZvaWQgX19pbml0IHNldHVw
X3Blcl9jcHVfYXJlYXModm9pZCkKPj4gICAJfQo+PiAgIAlpZiAocmMgPCAwKQo+PiAgIAkJcmMg
PSBwY3B1X3BhZ2VfZmlyc3RfY2h1bmsoUEVSQ1BVX0ZJUlNUX0NIVU5LX1JFU0VSVkUsCj4+IC0J
CQkJCSAgIHBjcHVfY3B1X3RvX25vZGUsCj4+IC0JCQkJCSAgIHBjcHVwX3BvcHVsYXRlX3B0ZSk7
Cj4+ICsJCQkJCSAgIHBjcHVfY3B1X3RvX25vZGUpOwo+IHg4NiBoYXMgaXQncyBvd24gaW1wbGVt
ZW50YXRpb24gdGhhdCBkaWZmZXJzIGZvciAzMiBiaXQuIEknbSBub3QKPiBjb25maWRlbnQgdGhp
cyBpcyBjb3JyZWN0IHRvIGRyb3AgaW4gYXMgYSByZXBsYWNlbWVudCBmb3IgeDg2LCBzbyBJJ2QK
PiBwcmVmZXIgdG8ga2VlcCBwb3B1bGF0ZV9wdGVfZm4oKSBhcm91bmQuCgoKVGhlIHg4NidzIHBj
cHVwX3BvcHVsYXRlX3B0ZSgpIHZlcnNpb24gaXMgbm90IGRyb3BwZWQuCgpXZSBkZWZpbmUgYSBf
X3dlYWsgcGNwdV9wb3B1bGF0ZV9wdGUgZnVuY3Rpb24gaW4gbW0vcGVyY3B1LmMsCgphbmQgdGhl
cmUgaXMgYSBvd24gdmVyc2lvbiBvbiB4ODYswqAgc28gbm8gZnVuY3Rpb24gY2hhbmdlIG9uIHg4
Ni4KCkkgd2lsbCBhZGQgdGhpcyBpbnRvIGNoYW5nZWxvZywKCmFyY2gveDg2L2tlcm5lbC9zZXR1
cF9wZXJjcHUuYzrCoCB2b2lkIF9faW5pdCBwY3B1X3BvcHVsYXRlX3B0ZSh1bnNpZ25lZCAKbG9u
ZyBhZGRyKQppbmNsdWRlL2xpbnV4L3BlcmNwdS5oOsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHZvaWQgX19pbml0IApwY3B1X3BvcHVsYXRlX3B0ZSh1bnNpZ25lZCBsb25nIGFkZHIp
OwptbS9wZXJjcHUuYzrCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCB2b2lkIF9faW5pdCBfX3dlYWsgCnBjcHVfcG9wdWxhdGVfcHRl
KHVuc2lnbmVkIGxvbmcgYWRkcikKbW0vcGVyY3B1LmM6IHBjcHVfcG9wdWxhdGVfcHRlKHVuaXRf
YWRkciArIChpIDw8IFBBR0VfU0hJRlQpKTsKCgo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51
eC9wZXJjcHUuaCBiL2luY2x1ZGUvbGludXgvcGVyY3B1LmgKPj4gaW5kZXggZDczYzk3ZWY0ZmY0
Li5mMWVjNWFkMTM1MWMgMTAwNjQ0Cj4+IC0tLSBhL2luY2x1ZGUvbGludXgvcGVyY3B1LmgKPj4g
KysrIGIvaW5jbHVkZS9saW51eC9wZXJjcHUuaAo+PiBAQCAtOTUsNyArOTUsNiBAQCBleHRlcm4g
Y29uc3QgY2hhciAqIGNvbnN0IHBjcHVfZmNfbmFtZXNbUENQVV9GQ19OUl07Cj4+ICAgZXh0ZXJu
IGVudW0gcGNwdV9mYyBwY3B1X2Nob3Nlbl9mYzsKPj4gICAKPj4gICB0eXBlZGVmIGludCAocGNw
dV9mY19jcHVfdG9fbm9kZV9mbl90KShpbnQgY3B1KTsKPj4gLXR5cGVkZWYgdm9pZCAoKnBjcHVf
ZmNfcG9wdWxhdGVfcHRlX2ZuX3QpKHVuc2lnbmVkIGxvbmcgYWRkcik7Cj4+ICAgdHlwZWRlZiBp
bnQgKHBjcHVfZmNfY3B1X2Rpc3RhbmNlX2ZuX3QpKHVuc2lnbmVkIGludCBmcm9tLCB1bnNpZ25l
ZCBpbnQgdG8pOwo+PiAgIAo+PiAgIGV4dGVybiBzdHJ1Y3QgcGNwdV9hbGxvY19pbmZvICogX19p
bml0IHBjcHVfYWxsb2NfYWxsb2NfaW5mbyhpbnQgbnJfZ3JvdXBzLAo+PiBAQCAtMTEzLDkgKzEx
Miw5IEBAIGV4dGVybiBpbnQgX19pbml0IHBjcHVfZW1iZWRfZmlyc3RfY2h1bmsoc2l6ZV90IHJl
c2VydmVkX3NpemUsIHNpemVfdCBkeW5fc2l6ZSwKPj4gICAjZW5kaWYKPj4gICAKPj4gICAjaWZk
ZWYgQ09ORklHX05FRURfUEVSX0NQVV9QQUdFX0ZJUlNUX0NIVU5LCj4+ICt2b2lkIF9faW5pdCBw
Y3B1X3BvcHVsYXRlX3B0ZSh1bnNpZ25lZCBsb25nIGFkZHIpOwo+PiAgIGV4dGVybiBpbnQgX19p
bml0IHBjcHVfcGFnZV9maXJzdF9jaHVuayhzaXplX3QgcmVzZXJ2ZWRfc2l6ZSwKPj4gLQkJCQlw
Y3B1X2ZjX2NwdV90b19ub2RlX2ZuX3QgY3B1X3RvX25kX2ZuLAo+PiAtCQkJCXBjcHVfZmNfcG9w
dWxhdGVfcHRlX2ZuX3QgcG9wdWxhdGVfcHRlX2ZuKTsKPj4gKwkJCQlwY3B1X2ZjX2NwdV90b19u
b2RlX2ZuX3QgY3B1X3RvX25kX2ZuKTsKPj4gICAjZW5kaWYKPj4gICAKPj4gICBleHRlcm4gdm9p
ZCBfX3BlcmNwdSAqX19hbGxvY19yZXNlcnZlZF9wZXJjcHUoc2l6ZV90IHNpemUsIHNpemVfdCBh
bGlnbikgX19hbGxvY19zaXplKDEpOwo+PiBkaWZmIC0tZ2l0IGEvbW0vcGVyY3B1LmMgYi9tbS9w
ZXJjcHUuYwo+PiBpbmRleCBlZmFhMWNiYWY3M2QuLmQ5MDdkYWVkMDRlYiAxMDA2NDQKPj4gLS0t
IGEvbW0vcGVyY3B1LmMKPj4gKysrIGIvbW0vcGVyY3B1LmMKPj4gQEAgLTMxNjIsMTEgKzMxNjIs
ODAgQEAgaW50IF9faW5pdCBwY3B1X2VtYmVkX2ZpcnN0X2NodW5rKHNpemVfdCByZXNlcnZlZF9z
aXplLCBzaXplX3QgZHluX3NpemUsCj4+ICAgI2VuZGlmIC8qIEJVSUxEX0VNQkVEX0ZJUlNUX0NI
VU5LICovCj4+ICAgCi4uLgo+PiArdm9pZCBfX2luaXQgX193ZWFrIHBjcHVfcG9wdWxhdGVfcHRl
KHVuc2lnbmVkIGxvbmcgYWRkcikKPj4gK3sKPj4gKwlwZ2RfdCAqcGdkID0gcGdkX29mZnNldF9r
KGFkZHIpOwo+PiArCXA0ZF90ICpwNGQ7Cj4+ICsJcHVkX3QgKnB1ZDsKPj4gKwlwbWRfdCAqcG1k
Owo+PiArCj4+ICsJaWYgKHBnZF9ub25lKCpwZ2QpKSB7Cj4+ICsJCXA0ZF90ICpuZXc7Cj4+ICsK
Pj4gKwkJbmV3ID0gbWVtYmxvY2tfYWxsb2NfZnJvbShQNERfVEFCTEVfU0laRSwgUDREX1RBQkxF
X1NJWkUsIFBBR0VfU0laRSk7Cj4gSXQncyB1bm5lY2Vzc2FyeSB0byBzcGVjaWZ5IGEgbWluX2Fk
ZHIgdG8gbWVtYmxvY2tfYWxsb2NfZnJvbSgpIGFzIGl0Cj4gd29uJ3QgYWxsb2NhdGUgMCBhbnl3
YXkuIFNvIHBsZWFzZSB1c2UgbWVtYmxvY2tfYWxsb2MoKSBpbnN0ZWFkLgoKb2ssIHdpbGwgdXNl
IG1lbWJsb2NrX2FsbG9jIGluIHRoaXMgZnVuY3Rpb24KCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
