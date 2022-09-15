Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9D2FECAAD8
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Sep 2022 02:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=F/IareSqFUwrUlKO7RYwWClnglOoQqbLU02v6/pMQcY=; b=VY1IeAIR4N7ZVP
	QDjkCk9JF/puSedOd5BEUaOiazXRJhKFzIbasSdFlLPHsCuyh+gqQ8BdO0AhOABddBw7hQ8sv+SWr
	8Tje8v3j1OkNLucyErxCTvf3o61jSKuJmyoZ6PQElEfH6NOvtWL1GXJ+QN1gVH5YolhCR+UZVUCSC
	QWAD09oS8eeljB4gNA5jNSaksmi0df5BGRuiTCfW/UPp81ny389tfY+q5waxdf99nwEZuo83ovxYA
	mgu0BSHN6Uzw2lVV1tY19UjVn7BUgsiAXk58ITw1UjmkSXCdy9q9+cwTNRy01jUNt/wkyK6DQ6V5o
	5PurHSksIuVVD3Kas84Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYeqV-00FrBM-TK; Thu, 15 Sep 2022 02:43:19 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oYeqS-00FqxA-9V
	for linux-riscv@lists.infradead.org; Thu, 15 Sep 2022 02:43:18 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.53])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MShGG0kJ3zNmHD;
	Thu, 15 Sep 2022 10:38:30 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 10:42:59 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 15 Sep 2022 10:42:59 +0800
Message-ID: <e1577788-b1a8-f5ef-d2f5-cab144a730c5@huawei.com>
Date: Thu, 15 Sep 2022 10:42:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH 2/2] riscv: tracing: Improve hardirq tracing message
To: Guo Ren <guoren@kernel.org>
CC: <linux-riscv@lists.infradead.org>, <rostedt@goodmis.org>,
	<mingo@redhat.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <liaochang1@huawei.com>, <chris.zjh@huawei.com>
References: <20220901104515.135162-1-zouyipeng@huawei.com>
 <20220901104515.135162-3-zouyipeng@huawei.com>
 <9d070742-8a82-3cb0-cea0-8ecce01c06b6@huawei.com>
 <ddcdc551-08f0-6b85-7985-5bca47b1989f@huawei.com>
 <CAJF2gTShdfHcjYsoGpZugSUaNepUJegNrTUE9um+eM3GY3gEjA@mail.gmail.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <CAJF2gTShdfHcjYsoGpZugSUaNepUJegNrTUE9um+eM3GY3gEjA@mail.gmail.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220914_194316_707265_65D39341 
X-CRM114-Status: UNSURE (   8.70  )
X-CRM114-Notice: Please train this message.
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

CuWcqCAyMDIyLzkvMTUgOTozNCwgR3VvIFJlbiDlhpnpgZM6Cj4gQWRkIEZpeGVzIHRhZywgYW5k
IHRoZSB1cHN0cmVhbSBzaG91bGQgZ28gdG8gZ2VuZXJpYyBlbnRyeS4KPgo+IEp1c3QgZm9yIHN0
YWJsZSBicmFuY2hlcyBmaXh1cDoKPiBBY2tlZC1ieTogR3VvIFJlbiA8Z3VvcmVuQGtlcm5lbC5v
cmc+Cm9rLHRoYW5rcyBmb3IgcmV2aWV3Lgo+IE9uIFdlZCwgU2VwIDE0LCAyMDIyIGF0IDM6Mjkg
UE0gWWlwZW5nIFpvdSA8em91eWlwZW5nQGh1YXdlaS5jb20+IHdyb3RlOgo+PiBMb29wIGluIGd1
b3JlbkBrZXJuZWwub3JnLAo+Pgo+PiBQbGVhc2UgaGVscCByZXZpZXcgb24gdGhpcyBwYXRjaCwg
dGhhbmtzIHZlcnkgbXVjaC4KPj4KPj4g5ZyoIDIwMjIvOS85IDE3OjQwLCBZaXBlbmcgWm91IOWG
memBkzoKPj4+IFBpbmcuCj4+Pgo+Pj4g5ZyoIDIwMjIvOS8xIDE4OjQ1LCBZaXBlbmcgWm91IOWG
memBkzoKPj4+PiBVc2UgdHJhY2VfaGFyZGlycXNfb25fY2FsbGVyIHRvIGltcHJvdmUgaXJxX3Ry
YWNpbmcgbWVzc2FnZS4KPj4+Pgo+Pj4+IGxvY2tkZXAgbG9nIGluIHJpc2N2IHNob3dpbmcgdGhl
IGxhc3Qge2VuYWJsZWQsZGlzYWJsZWR9IGF0Cj4+Pj4gX190cmFjZV9oYXJkaXJxc197b24sb2Zm
fSBhbGwgdGhlIHRpbWUoaWYgY2FsbGVkIGJ5KS4KPj4+PiBCdXQgdGhhdCdzIG5vdCB3aGF0IHdl
IHdhbnQgdG8gc2VlLCB0aGUgY2FsbGVyIGlzIHdoYXQgd2Ugd2FudC4KPj4+Pgo+Pj4+IEJlZm9y
ZSB0aGlzIGNvbW1pdDoKPj4+PiBbICAgNTcuODUzMTc1XSBoYXJkaXJxcyBsYXN0ICBlbmFibGVk
IGF0ICgyNTE5KToKPj4+PiBfX3RyYWNlX2hhcmRpcnFzX29uKzB4Yy8weDE0Cj4+Pj4gWyAgIDU3
Ljg1Mzg0OF0gaGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAoMjUyMCk6Cj4+Pj4gX190cmFjZV9o
YXJkaXJxc19vZmYrMHhjLzB4MTQKPj4+Pgo+Pj4+IEFmdGVyIHRoaXMgY29tbWl0Cj4+Pj4gWyAg
IDUzLjc4MTQyOF0gaGFyZGlycXMgbGFzdCAgZW5hYmxlZCBhdCAoMjU5NSk6IHJlc3RvcmVfYWxs
KzB4ZS8weDY2Cj4+Pj4gWyAgIDUzLjc4MjE4NV0gaGFyZGlycXMgbGFzdCBkaXNhYmxlZCBhdCAo
MjU5Nik6Cj4+Pj4gcmV0X2Zyb21fZXhjZXB0aW9uKzB4YS8weDEwCj4+Pj4KPj4+PiBTaWduZWQt
b2ZmLWJ5OiBZaXBlbmcgWm91IDx6b3V5aXBlbmdAaHVhd2VpLmNvbT4KPj4+PiAtLS0KPj4+PiAg
ICBhcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9pcnEuYyB8IDQgKystLQo+Pj4+ICAgIGluY2x1ZGUv
bGludXgvaXJxZmxhZ3MuaCAgICAgIHwgMiArKwo+Pj4+ICAgIDIgZmlsZXMgY2hhbmdlZCwgNCBp
bnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Pj4+Cj4+Pj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3Yva2VybmVsL3RyYWNlX2lycS5jCj4+Pj4gYi9hcmNoL3Jpc2N2L2tlcm5lbC90cmFjZV9p
cnEuYwo+Pj4+IGluZGV4IDA5NWFjOTc2ZDdkYS4uN2NhMjRiMjZlMTlmIDEwMDY0NAo+Pj4+IC0t
LSBhL2FyY2gvcmlzY3Yva2VybmVsL3RyYWNlX2lycS5jCj4+Pj4gKysrIGIvYXJjaC9yaXNjdi9r
ZXJuZWwvdHJhY2VfaXJxLmMKPj4+PiBAQCAtMTYsMTIgKzE2LDEyIEBACj4+Pj4gICAgICB2b2lk
IF9fdHJhY2VfaGFyZGlycXNfb24odm9pZCkKPj4+PiAgICB7Cj4+Pj4gLSAgICB0cmFjZV9oYXJk
aXJxc19vbigpOwo+Pj4+ICsgICAgdHJhY2VfaGFyZGlycXNfb25fY2FsbGVyKENBTExFUl9BRERS
MCk7Cj4+Pj4gICAgfQo+Pj4+ICAgIE5PS1BST0JFX1NZTUJPTChfX3RyYWNlX2hhcmRpcnFzX29u
KTsKPj4+PiAgICAgIHZvaWQgX190cmFjZV9oYXJkaXJxc19vZmYodm9pZCkKPj4+PiAgICB7Cj4+
Pj4gLSAgICB0cmFjZV9oYXJkaXJxc19vZmYoKTsKPj4+PiArICAgIHRyYWNlX2hhcmRpcnFzX29m
Zl9jYWxsZXIoQ0FMTEVSX0FERFIwKTsKPj4+PiAgICB9Cj4+Pj4gICAgTk9LUFJPQkVfU1lNQk9M
KF9fdHJhY2VfaGFyZGlycXNfb2ZmKTsKPj4+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9p
cnFmbGFncy5oIGIvaW5jbHVkZS9saW51eC9pcnFmbGFncy5oCj4+Pj4gaW5kZXggNWVjMGZhNzEz
OTllLi40Njc3NGZhODVjZGUgMTAwNjQ0Cj4+Pj4gLS0tIGEvaW5jbHVkZS9saW51eC9pcnFmbGFn
cy5oCj4+Pj4gKysrIGIvaW5jbHVkZS9saW51eC9pcnFmbGFncy5oCj4+Pj4gQEAgLTUzLDYgKzUz
LDggQEAgZXh0ZXJuIHZvaWQgdHJhY2VfaGFyZGlycXNfb25fcHJlcGFyZSh2b2lkKTsKPj4+PiAg
ICBleHRlcm4gdm9pZCB0cmFjZV9oYXJkaXJxc19vZmZfZmluaXNoKHZvaWQpOwo+Pj4+ICAgIGV4
dGVybiB2b2lkIHRyYWNlX2hhcmRpcnFzX29uKHZvaWQpOwo+Pj4+ICAgIGV4dGVybiB2b2lkIHRy
YWNlX2hhcmRpcnFzX29mZih2b2lkKTsKPj4+PiArZXh0ZXJuIHZvaWQgdHJhY2VfaGFyZGlycXNf
b25fY2FsbGVyKHVuc2lnbmVkIGxvbmcgY2FsbGVyX2FkZHIpOwo+Pj4+ICtleHRlcm4gdm9pZCB0
cmFjZV9oYXJkaXJxc19vZmZfY2FsbGVyKHVuc2lnbmVkIGxvbmcgY2FsbGVyX2FkZHIpOwo+Pj4+
ICAgICAgIyBkZWZpbmUgbG9ja2RlcF9oYXJkaXJxX2NvbnRleHQoKSAocmF3X2NwdV9yZWFkKGhh
cmRpcnFfY29udGV4dCkpCj4+Pj4gICAgIyBkZWZpbmUgbG9ja2RlcF9zb2Z0aXJxX2NvbnRleHQo
cCkgKChwKS0+c29mdGlycV9jb250ZXh0KQo+PiAtLQo+PiBSZWdhcmRzLAo+PiBZaXBlbmcgWm91
Cj4+Cj4KLS0gClJlZ2FyZHMsCllpcGVuZyBab3UKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
