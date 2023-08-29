Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FEFCC83F12
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Aug 2023 02:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:MIME-Version:
	Date:Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8iuJSBxB9teyUzZBD8WqLfRZCrno6ATMAu4EJ7Z3o3k=; b=O3Lh0uSIq6o30V4ti4xatDk9pU
	NpEns7+5veMxooy3bdAHeZwPEZ6+xNlrN68Sm895KPU0i4d8Y/bQtqCEGFFLoKFfOn55ODfJRIsxN
	sdadmJIE9cAQ75JKNKpPDio7+n0G0LuzoHh1FBA76i7lEwvO3vSZa8bdpkvvX3g9ITl5MLaT/WPdZ
	KaSouD6yTmjQrIPNQt0oqBstFqedYxPqKD8FDbUBKxdBI3LVB4O/CvUDC/GAqq41BOQZyX9etfKQ1
	2UsZYPzE+c2lGiYR73BB1jGyYMTsvOTUdFdDwbk3QHs/RXsBxvv4FwDzhNMCYdi70LvqkXo72KZgg
	G/83eVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qaonO-00Aejr-0c;
	Tue, 29 Aug 2023 02:49:34 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qaonI-00AeiF-36
	for linux-riscv@lists.infradead.org;
	Tue, 29 Aug 2023 02:49:32 +0000
Received: from kwepemi500020.china.huawei.com (unknown [172.30.72.57])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4RZWyN4LbgzLpHm;
	Tue, 29 Aug 2023 10:46:04 +0800 (CST)
Received: from [10.67.109.184] (10.67.109.184) by
 kwepemi500020.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.31; Tue, 29 Aug 2023 10:49:14 +0800
Message-ID: <c21fb045-5114-2f0a-b7d5-4ee40c97c14c@huawei.com>
Date: Tue, 29 Aug 2023 10:49:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH bpf-next v3 1/3] riscv: extend patch_text_nosync() for
 multiple pages
Content-Language: en-US
To: Puranjay Mohan <puranjay12@gmail.com>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <conor.dooley@microchip.com>,
	<ast@kernel.org>, <daniel@iogearbox.net>, <andrii@kernel.org>,
	<martin.lau@linux.dev>, <song@kernel.org>, <yhs@fb.com>,
	<kpsingh@kernel.org>, <bjorn@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20230828165958.1714079-1-puranjay12@gmail.com>
 <20230828165958.1714079-2-puranjay12@gmail.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20230828165958.1714079-2-puranjay12@gmail.com>
X-Originating-IP: [10.67.109.184]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemi500020.china.huawei.com (7.221.188.8)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_194929_363492_3CFA6D12 
X-CRM114-Status: GOOD (  17.68  )
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

CgpPbiAyMDIzLzgvMjkgMDo1OSwgUHVyYW5qYXkgTW9oYW4gd3JvdGU6Cj4gVGhlIHBhdGNoX2lu
c25fd3JpdGUoKSBmdW5jdGlvbiBjdXJyZW50bHkgZG9lc24ndCB3b3JrIGZvciBtdWx0aXBsZSBw
YWdlcwo+IG9mIGluc3RydWN0aW9ucywgdGhlcmVmb3JlIHBhdGNoX3RleHRfbm9zeW5jKCkgd2ls
bCBmYWlsIHdpdGggYSBwYWdlIGZhdWx0Cj4gaWYgY2FsbGVkIHdpdGggbGVuZ3RocyBzcGFubmlu
ZyBtdWx0aXBsZSBwYWdlcy4KPiAKPiBUaGlzIGNvbW1pdCBleHRlbmRzIHRoZSBwYXRjaF9pbnNu
X3dyaXRlKCkgZnVuY3Rpb24gdG8gc3VwcG9ydCBtdWx0aXBsZQo+IHBhZ2VzIGJ5IGNvcHlpbmcg
YXQgbWF4IDIgcGFnZXMgYXQgYSB0aW1lIGluIGEgbG9vcC4gVGhpcyBpbXBsZW1lbnRhdGlvbgo+
IGlzIHNpbWlsYXIgdG8gdGV4dF9wb2tlX2NvcHkoKSBmdW5jdGlvbiBvZiB4ODYuCj4gCj4gU2ln
bmVkLW9mZi1ieTogUHVyYW5qYXkgTW9oYW4gPHB1cmFuamF5MTJAZ21haWwuY29tPgo+IFJldmll
d2VkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkByaXZvc2luYy5jb20+Cj4gLS0tCj4gICBhcmNo
L3Jpc2N2L2tlcm5lbC9wYXRjaC5jIHwgMzcgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysr
KystLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDMyIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yva2VybmVsL3BhdGNoLmMgYi9hcmNoL3Jp
c2N2L2tlcm5lbC9wYXRjaC5jCj4gaW5kZXggNTc1ZTcxZDZjOGFlLi4yYzk3ZTI0NmY0ZGMgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcGF0Y2guYwo+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3BhdGNoLmMKPiBAQCAtNTMsMTIgKzUzLDE4IEBAIHN0YXRpYyB2b2lkIHBhdGNoX3Vu
bWFwKGludCBmaXhtYXApCj4gICB9Cj4gICBOT0tQUk9CRV9TWU1CT0wocGF0Y2hfdW5tYXApOwo+
ICAgCj4gLXN0YXRpYyBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2b2lkICphZGRyLCBjb25zdCB2b2lk
ICppbnNuLCBzaXplX3QgbGVuKQo+ICtzdGF0aWMgaW50IF9fcGF0Y2hfaW5zbl93cml0ZSh2b2lk
ICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQo+ICAgewo+ICAgCXZvaWQgKndh
ZGRyID0gYWRkcjsKPiAgIAlib29sIGFjcm9zc19wYWdlcyA9ICgoKHVpbnRwdHJfdCkgYWRkciAm
IH5QQUdFX01BU0spICsgbGVuKSA+IFBBR0VfU0laRTsKPiAgIAlpbnQgcmV0Owo+ICAgCj4gKwkv
Kgo+ICsJICogT25seSB0d28gcGFnZXMgY2FuIGJlIG1hcHBlZCBhdCBhIHRpbWUgZm9yIHdyaXRp
bmcuCj4gKwkgKi8KPiArCWlmIChsZW4gKyBvZmZzZXRfaW5fcGFnZShhZGRyKSA+IDIgKiBQQUdF
X1NJWkUpCj4gKwkJcmV0dXJuIC1FSU5WQUw7Cj4gKwo+ICAgCS8qCj4gICAJICogQmVmb3JlIHJl
YWNoaW5nIGhlcmUsIGl0IHdhcyBleHBlY3RlZCB0byBsb2NrIHRoZSB0ZXh0X211dGV4Cj4gICAJ
ICogYWxyZWFkeSwgc28gd2UgZG9uJ3QgbmVlZCB0byBnaXZlIGFub3RoZXIgbG9jayBoZXJlIGFu
ZCBjb3VsZAo+IEBAIC03NCw3ICs4MCw3IEBAIHN0YXRpYyBpbnQgcGF0Y2hfaW5zbl93cml0ZSh2
b2lkICphZGRyLCBjb25zdCB2b2lkICppbnNuLCBzaXplX3QgbGVuKQo+ICAgCQlsb2NrZGVwX2Fz
c2VydF9oZWxkKCZ0ZXh0X211dGV4KTsKPiAgIAo+ICAgCWlmIChhY3Jvc3NfcGFnZXMpCj4gLQkJ
cGF0Y2hfbWFwKGFkZHIgKyBsZW4sIEZJWF9URVhUX1BPS0UxKTsKPiArCQlwYXRjaF9tYXAoYWRk
ciArIFBBR0VfU0laRSwgRklYX1RFWFRfUE9LRTEpOwo+ICAgCj4gICAJd2FkZHIgPSBwYXRjaF9t
YXAoYWRkciwgRklYX1RFWFRfUE9LRTApOwo+ICAgCj4gQEAgLTg3LDE1ICs5MywzNiBAQCBzdGF0
aWMgaW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6
ZV90IGxlbikKPiAgIAo+ICAgCXJldHVybiByZXQ7Cj4gICB9Cj4gLU5PS1BST0JFX1NZTUJPTChw
YXRjaF9pbnNuX3dyaXRlKTsKPiArTk9LUFJPQkVfU1lNQk9MKF9fcGF0Y2hfaW5zbl93cml0ZSk7
Cj4gICAjZWxzZQo+IC1zdGF0aWMgaW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29u
c3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKPiArc3RhdGljIGludCBfX3BhdGNoX2luc25fd3Jp
dGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6ZV90IGxlbikKPiAgIHsKPiAgIAly
ZXR1cm4gY29weV90b19rZXJuZWxfbm9mYXVsdChhZGRyLCBpbnNuLCBsZW4pOwo+ICAgfQo+IC1O
T0tQUk9CRV9TWU1CT0wocGF0Y2hfaW5zbl93cml0ZSk7Cj4gK05PS1BST0JFX1NZTUJPTChfX3Bh
dGNoX2luc25fd3JpdGUpOwo+ICAgI2VuZGlmIC8qIENPTkZJR19NTVUgKi8KPiAgIAo+ICtzdGF0
aWMgaW50IHBhdGNoX2luc25fd3JpdGUodm9pZCAqYWRkciwgY29uc3Qgdm9pZCAqaW5zbiwgc2l6
ZV90IGxlbikKPiArewo+ICsJc2l6ZV90IHBhdGNoZWQgPSAwOwo+ICsJc2l6ZV90IHNpemU7Cj4g
KwlpbnQgcmV0ID0gMDsKPiArCj4gKwkvKgo+ICsJICogQ29weSB0aGUgaW5zdHJ1Y3Rpb25zIHRv
IHRoZSBkZXN0aW5hdGlvbiBhZGRyZXNzLCB0d28gcGFnZXMgYXQgYSB0aW1lCj4gKwkgKiBiZWNh
dXNlIF9fcGF0Y2hfaW5zbl93cml0ZSgpIGNhbiBvbmx5IGhhbmRsZSBsZW4gPD0gMiAqIFBBR0Vf
U0laRS4KPiArCSAqLwo+ICsJd2hpbGUgKHBhdGNoZWQgPCBsZW4gJiYgIXJldCkgewo+ICsJCXNp
emUgPSBtaW5fdChzaXplX3QsIFBBR0VfU0laRSAqIDIgLSBvZmZzZXRfaW5fcGFnZShhZGRyICsg
cGF0Y2hlZCksIGxlbiAtIHBhdGNoZWQpOwo+ICsJCXJldCA9IF9fcGF0Y2hfaW5zbl93cml0ZShh
ZGRyICsgcGF0Y2hlZCwgaW5zbiArIHBhdGNoZWQsIHNpemUpOwo+ICsKPiArCQlwYXRjaGVkICs9
IHNpemU7Cj4gKwl9Cj4gKwo+ICsJcmV0dXJuIHJldDsKPiArfQo+ICtOT0tQUk9CRV9TWU1CT0wo
cGF0Y2hfaW5zbl93cml0ZSk7Cj4gKwo+ICAgaW50IHBhdGNoX3RleHRfbm9zeW5jKHZvaWQgKmFk
ZHIsIGNvbnN0IHZvaWQgKmluc25zLCBzaXplX3QgbGVuKQo+ICAgewo+ICAgCXUzMiAqdHAgPSBh
ZGRyOwoKTG9va3MgZ29vZCB0byBtZSwKUmV2aWV3ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1
YXdlaS5jb20+CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
