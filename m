Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C950CC433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jul 2022 09:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2YfFDVhPstHaCS/Arb7TD6AVoDuKPEbaFntHHpsMtqQ=; b=KoYlqq1U2fWOAH
	m24mbn4dF4/zqp7985lQNxPH6xQ8WOiJ7Bj7ygXHmIZ8YiSZPokZIGNkTjtxf6NjIBtQBW3kJfnc7
	o8S+pceW3ES05cQLe1ruC05uHGE3q9TRaL+wazyAyqlyKRBfFaHA0yytfmE5LTvxcQSLOkz6+pPwh
	qYiTG+LTE4KlPbAh3SWmUqYs4P58vWj5Hj+gjUpXAYaF9AsyDrWM0e/o+0MDUO596OmoktERT2pPe
	D6NlETD4zt9U841akJsACbgLgQsbhF3KdRrrxXDxnxWiYPJz2xb944X6xCH5aGVdj6TEHRsU1aK9O
	N6WJgkGyorK/HNsFULXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6Es-003Rxw-CX; Wed, 20 Jul 2022 09:43:30 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oE6Ep-003RwT-Lw
	for linux-riscv@lists.infradead.org; Wed, 20 Jul 2022 09:43:29 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4LnrL66Mn6zkXB5;
	Wed, 20 Jul 2022 17:41:02 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Jul 2022 17:43:25 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Jul 2022 17:43:25 +0800
Message-ID: <598816a9-0a20-29fd-6983-ceb04233b643@huawei.com>
Date: Wed, 20 Jul 2022 17:43:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH -next] riscv:uprobe remove set/clear SR_SPIE in
 arch_uprobe_pre/post/abort_xol
To: Guo Ren <guoren@kernel.org>
CC: linux-riscv <linux-riscv@lists.infradead.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>
References: <20220711024350.49611-1-zouyipeng@huawei.com>
 <CAJF2gTTBQrSVeF0aC5TKaH=CFo5QDuCE8noF7e2N5=4MK5bpmA@mail.gmail.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <CAJF2gTTBQrSVeF0aC5TKaH=CFo5QDuCE8noF7e2N5=4MK5bpmA@mail.gmail.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220720_024328_117872_F5869F92 
X-CRM114-Status: GOOD (  10.35  )
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

CuWcqCAyMDIyLzcvMjAgMTE6NDMsIEd1byBSZW4g5YaZ6YGTOgo+IE9uIE1vbiwgSnVsIDExLCAy
MDIyIGF0IDEwOjQ2IEFNIFlpcGVuZyBab3UgPHpvdXlpcGVuZ0BodWF3ZWkuY29tPiB3cm90ZToK
Pj4gSW4gcmlzY3YgdGhlIHByb2Nlc3Mgb2YgdXByb2JlIGdvaW5nIHRvIGNsZWFyIHNwaWUgYmVm
b3JlIGV4ZWMKPj4gdGhlIG9yaWdpbiBpbnNuLGFuZCBzZXQgc3BpZSBhZnRlciB0aGF0LkJ1dCBX
aGVuIGFjY2VzcyB0aGUgcGFnZQo+PiB3aGljaCBvcmlnaW4gaW5zbiBoYXMgYmVlbiBwbGFjZWQg
YSBwYWdlIGZhdWx0IG1heSBoYXBwZW4gYW5kCj4+IGlycSB3YXMgZGlzYWJsZWQgaW4gYXJjaF91
cHJvYmVfcHJlX3hvbCBmdW5jdGlvbixJdCBjYXVzZSBhIFdBUk4KPj4gYXMgZm9sbG93cy4KPj4g
VGhlcmUgaXMgbm8gbmVlZCB0byBjbGVhci9zZXQgc3BpZSBpbiBhcmNoX3Vwcm9iZV9wcmUvcG9z
dC9hYm9ydF94b2wuCj4+IFdlIGNhbiBqdXN0IHJlbW92ZSBpdC4KPiBTZWVtcyB0aGVyZSBpcyBu
byBzaWRlIGVmZmVjdCBvbiBhbiBpbnRlcnJ1cHQgaW4geG9sLiBJIGFsc28gY2hlY2tlZAo+IGFy
bTY0LCB4ODYsIE1JUFMsIGFuZCBjc2t5IChhbHNvIHdyaXR0ZW4gYnkgbWUpLCB3aGljaCBhcmUg
dGhlIHNhbWUgYXMKPiB5b3VycyAoTm8gaXJxIG1hc2spLiBJIGZvcmdvdCB3aHkgSSBtYXNrIGly
cSBmb3IgdXNlcnNwYWNlIHhvbC4KPgo+PiBbICAgMzEuNjg0MTU3XSBCVUc6IHNsZWVwaW5nIGZ1
bmN0aW9uIGNhbGxlZCBmcm9tIGludmFsaWQgY29udGV4dCBhdCBrZXJuZWwvbG9ja2luZy9yd3Nl
bS5jOjE0ODgKPj4gWyAgIDMxLjY4NDY3N10gaW5fYXRvbWljKCk6IDAsIGlycXNfZGlzYWJsZWQo
KTogMSwgbm9uX2Jsb2NrOiAwLCBwaWQ6IDc2LCBuYW1lOiB3b3JrCj4+IFsgICAzMS42ODQ5Mjld
IHByZWVtcHRfY291bnQ6IDAsIGV4cGVjdGVkOiAwCj4+IFsgICAzMS42ODU5NjldIENQVTogMiBQ
SUQ6IDc2IENvbW06IHdvcmsgVGFpbnRlZDogRwo+PiBbICAgMzEuNjg2NTQyXSBIYXJkd2FyZSBu
YW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+IFsgICAzMS42ODY3OTddIENhbGwgVHJhY2U6
Cj4+IFsgICAzMS42ODcwNTNdIFs8ZmZmZmZmZmY4MDAwNjQ0Mj5dIGR1bXBfYmFja3RyYWNlKzB4
MzAvMHgzOAo+PiBbICAgMzEuNjg3Njk5XSBbPGZmZmZmZmZmODA4MTIxMTg+XSBzaG93X3N0YWNr
KzB4NDAvMHg0Ywo+PiBbICAgMzEuNjg4MTQxXSBbPGZmZmZmZmZmODA4MTgxN2E+XSBkdW1wX3N0
YWNrX2x2bCsweDQ0LzB4NWMKPj4gWyAgIDMxLjY4ODM5Nl0gWzxmZmZmZmZmZjgwODE4MWFhPl0g
ZHVtcF9zdGFjaysweDE4LzB4MjAKPj4gWyAgIDMxLjY4ODY1M10gWzxmZmZmZmZmZjgwMDNlNDU0
Pl0gX19taWdodF9yZXNjaGVkKzB4MTE0LzB4MTIyCj4+IFsgICAzMS42ODg5NDhdIFs8ZmZmZmZm
ZmY4MDAzZTRiMj5dIF9fbWlnaHRfc2xlZXArMHg1MC8weDdhCj4+IFsgICAzMS42ODk0MzVdIFs8
ZmZmZmZmZmY4MDgyMjY3Nj5dIGRvd25fcmVhZCsweDMwLzB4MTMwCj4+IFsgICAzMS42ODk3Mjhd
IFs8ZmZmZmZmZmY4MDAwYjY1MD5dIGRvX3BhZ2VfZmF1bHQrMHgxNjYveDQ0Ngo+PiBbICAgMzEu
Njg5OTk3XSBbPGZmZmZmZmZmODAwMDNjMGM+XSByZXRfZnJvbV9leGNlcHRpb24rMHgwLzB4Ywo+
Pgo+PiBTaWduZWQtb2ZmLWJ5OiBZaXBlbmcgWm91IDx6b3V5aXBlbmdAaHVhd2VpLmNvbT4KPiBQ
bGVhc2UgYWRkIHRoZSBGaXhlcyB0YWcuCj4KPiBUaGVuOgo+Cj4gUmV2aWV3ZWQtYnk6IEd1byBS
ZW4gPGd1b3JlbkBrZXJuZWwub3JnPgpBbGxyZWFkeSBzZW5kIHYyIHBhdGNoKGFkZCBGaXhlcyB0
YWcpIGFuZCB0aGFua3MgZm9yIHJldmlldy4KPj4gLS0tCj4+ICAgYXJjaC9yaXNjdi9rZXJuZWwv
cHJvYmVzL3Vwcm9iZXMuYyB8IDYgLS0tLS0tCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDYgZGVsZXRp
b25zKC0pCj4+Cj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jl
cy5jIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL3Vwcm9iZXMuYwo+PiBpbmRleCA3YTA1N2I1
ZjBhZGMuLmM5NzZhMjFjZDRiZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJv
YmVzL3Vwcm9iZXMuYwo+PiArKysgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMvdXByb2Jlcy5j
Cj4+IEBAIC01OSw4ICs1OSw2IEBAIGludCBhcmNoX3Vwcm9iZV9wcmVfeG9sKHN0cnVjdCBhcmNo
X3Vwcm9iZSAqYXVwcm9iZSwgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4+Cj4+ICAgICAgICAgIGlu
c3RydWN0aW9uX3BvaW50ZXJfc2V0KHJlZ3MsIHV0YXNrLT54b2xfdmFkZHIpOwo+Pgo+PiAtICAg
ICAgIHJlZ3MtPnN0YXR1cyAmPSB+U1JfU1BJRTsKPj4gLQo+PiAgICAgICAgICByZXR1cm4gMDsK
Pj4gICB9Cj4+Cj4+IEBAIC03Miw4ICs3MCw2IEBAIGludCBhcmNoX3Vwcm9iZV9wb3N0X3hvbChz
dHJ1Y3QgYXJjaF91cHJvYmUgKmF1cHJvYmUsIHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+Pgo+PiAg
ICAgICAgICBpbnN0cnVjdGlvbl9wb2ludGVyX3NldChyZWdzLCB1dGFzay0+dmFkZHIgKyBhdXBy
b2JlLT5pbnNuX3NpemUpOwo+Pgo+PiAtICAgICAgIHJlZ3MtPnN0YXR1cyB8PSBTUl9TUElFOwo+
PiAtCj4+ICAgICAgICAgIHJldHVybiAwOwo+PiAgIH0KPj4KPj4gQEAgLTExMSw4ICsxMDcsNiBA
QCB2b2lkIGFyY2hfdXByb2JlX2Fib3J0X3hvbChzdHJ1Y3QgYXJjaF91cHJvYmUgKmF1cHJvYmUs
IHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+PiAgICAgICAgICAgKiBhZGRyZXNzLgo+PiAgICAgICAg
ICAgKi8KPj4gICAgICAgICAgaW5zdHJ1Y3Rpb25fcG9pbnRlcl9zZXQocmVncywgdXRhc2stPnZh
ZGRyKTsKPj4gLQo+PiAtICAgICAgIHJlZ3MtPnN0YXR1cyAmPSB+U1JfU1BJRTsKPj4gICB9Cj4+
Cj4+ICAgYm9vbCBhcmNoX3VyZXRwcm9iZV9pc19hbGl2ZShzdHJ1Y3QgcmV0dXJuX2luc3RhbmNl
ICpyZXQsIGVudW0gcnBfY2hlY2sgY3R4LAo+PiAtLQo+PiAyLjE3LjEKPj4KPgotLSAKUmVnYXJk
cywKWWlwZW5nIFpvdQoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
