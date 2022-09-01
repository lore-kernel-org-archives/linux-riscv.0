Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3003ECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Sep 2022 13:53:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uhWJ9HXZ46PhdIrQanwdp5JMoDbUrB4jKhSWwH6aP0w=; b=GxWCJxYR5tI5dX
	lyBk3ka0H1Grt9wo3qePBXmEosZlxjOfOYvUyQIDIQwDM9QejSK426oIWFnHo36J3nop8J5R6yGpW
	nIVn40U6XFBnkOXNPEVXFPXkKzEBhTcX+zseQNNO6nW3vMx4WRnZCT1QBuQbJ+8MYSrwDAMDuHhtK
	jm9hDf/lF8+ESgqgim8PBIk0IlGfcwQXUExdUlHci1Uh2zdWWqHmHzGIXIeYTvtiZEBzYMeBWUfeY
	QIOyLXW6Ohwx2QaPYcrNHpzlm3U9Z0helJGcSCoOGI/HShV+VbveyQ2g69l+JuRgTD4S+FBloMH6r
	W/9QU/L3PinhSvDcFKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkdJ-00CEWI-Bf; Thu, 01 Sep 2022 13:53:25 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oTkdG-00CESg-0l
	for linux-riscv@lists.infradead.org; Thu, 01 Sep 2022 13:53:24 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.56])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MJMqK4RfTzlWgC;
	Thu,  1 Sep 2022 21:49:49 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 1 Sep 2022 21:53:15 +0800
Received: from [10.67.111.115] (10.67.111.115) by
 dggpemm500016.china.huawei.com (7.185.36.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 1 Sep 2022 21:53:15 +0800
Message-ID: <eeb9bb24-15b1-3b8f-bc52-a2c6e4a39716@huawei.com>
Date: Thu, 1 Sep 2022 21:53:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.0.3
Subject: Re: [PATCH] riscv:lib: optimize memcmp with ld insn
To: <Conor.Dooley@microchip.com>, <linux-riscv@lists.infradead.org>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
CC: <liaochang1@huawei.com>, <chris.zjh@huawei.com>
References: <20220831130754.93422-1-zouyipeng@huawei.com>
 <594e8d95-c039-6c8f-4669-6c9a514cbc91@microchip.com>
From: Yipeng Zou <zouyipeng@huawei.com>
In-Reply-To: <594e8d95-c039-6c8f-4669-6c9a514cbc91@microchip.com>
X-Originating-IP: [10.67.111.115]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220901_065322_476854_9009BF4A 
X-CRM114-Status: GOOD (  12.25  )
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

CuWcqCAyMDIyLzgvMzEgMjE6MTYsIENvbm9yLkRvb2xleUBtaWNyb2NoaXAuY29tIOWGmemBkzoK
PiBPbiAzMS8wOC8yMDIyIDE0OjA3LCBZaXBlbmcgWm91IHdyb3RlOgo+PiByaXNjdjpsaWI6IG9w
dGltaXplIG1lbWNtcCB3aXRoIGxkIGluc24KPiBNaW5vciBuaXQ6ICJyaXNjdjogbGliOgpvawo+
PiBFWFRFUk5BTCBFTUFJTDogRG8gbm90IGNsaWNrIGxpbmtzIG9yIG9wZW4gYXR0YWNobWVudHMg
dW5sZXNzIHlvdSBrbm93IHRoZSBjb250ZW50IGlzIHNhZmUKPj4KPj4gQ3VycmVudGx5IG1lbWNt
cCB3YXMgaW1wbGVtZW50ZWQgaW4gYyBjb2RlKGxpYi9zdHJpbmcuYyksIHdoaWNoIGNvbXBhcmUK
Pj4gbWVtb3J5IHBlciBieXRlLgo+Pgo+PiBUaGlzIHBhdGNoIHVzZSBsZCBpbnNuIGNvbXBhcmUg
bWVtb3J5IHBlciB3b3JkIHRvIGltcHJvdmUuIEZyb20gdGhlIHRlc3QKPj4gUmVzdWx0cywgdGhp
cyB3aWxsIHRha2Ugc2V2ZXJhbCB0aW1lcyBvcHRpbWl6ZWQuCj4gSGV5IFlpcGVuZywKPiBDb3Vs
ZCB5b3Ugc2hhcmUgc29tZSBtb3JlIGluZm9ybWF0aW9uIGFib3V0IHRoZSB0ZXN0cyB5b3UgZGlk
Pwo+IFRoZSB0ZXN0IHJlc3VsdHMgc2hvd2luZyB0aGUgJSBpbXByb3ZlbWVudCB3b3VsZCBiZSBu
aWNlIDopCj4gVGhhbmtzLAo+IENvbm9yLgoKT2Zjb3Vyc2UsIEJ1dCBNeSBib2FyZCB3YXMgbm90
IHJlYWR5LCBTbyBpIGp1c3QgdGVzdCB0aGlzIHBhdGNoIG9uIHFlbXUgClJWNjQgJiBSVjMyIC4K
CkFsbG9jIDgsNCwxS0IgYnVmZmVyIHRvIGNvbXBhcmUsIGVhY2ggbG9vcCAxMGsgdGltZXMuCgpT
aXplKEIpCgoJCgo4awoKCQoKNGsKCgkKCjFrCgpNaW4obnMpCgoJCgo0MDgwMAoKCQoKMjY1MDAK
CgkKCjE1NjAwCgpNaW4obnMpCgoJCgoxNjEwMAoKCQoKMTQyMDAKCgkKCjEyNDAwCgpTaXplKEIp
CgoJCgo4awoKCQoKNGsKCgkKCjFrCgpBVkcobnMpCgoJCgo0NjMxNgoKCQoKMzIzMDIKCgkKCjE3
OTY1CgpBVkcobnMpCgoJCgoyMTI4MQoKCQoKMTY0NDYKCgkKCjE0MzE2Cgo+PiBTaWduZWQtb2Zm
LWJ5OiBZaXBlbmcgWm91IDx6b3V5aXBlbmdAaHVhd2VpLmNvbT4KPj4gLS0tCj4+ICAgIGFyY2gv
cmlzY3YvaW5jbHVkZS9hc20vc3RyaW5nLmggfCAgMyArKwo+PiAgICBhcmNoL3Jpc2N2L2xpYi9N
YWtlZmlsZSAgICAgICAgIHwgIDEgKwo+PiAgICBhcmNoL3Jpc2N2L2xpYi9tZW1jbXAuUyAgICAg
ICAgIHwgNTkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4+ICAgIDMgZmlsZXMg
Y2hhbmdlZCwgNjMgaW5zZXJ0aW9ucygrKQo+PiAgICBjcmVhdGUgbW9kZSAxMDA2NDQgYXJjaC9y
aXNjdi9saWIvbWVtY21wLlMKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvaW5jbHVkZS9h
c20vc3RyaW5nLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3N0cmluZy5oCj4+IGluZGV4IDkw
OTA0OTM2NjU1NS4uMzMzN2I0M2QzODAzIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2luY2x1
ZGUvYXNtL3N0cmluZy5oCj4+ICsrKyBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vc3RyaW5nLmgK
Pj4gQEAgLTE4LDYgKzE4LDkgQEAgZXh0ZXJuIGFzbWxpbmthZ2Ugdm9pZCAqX19tZW1jcHkodm9p
ZCAqLCBjb25zdCB2b2lkICosIHNpemVfdCk7Cj4+ICAgICNkZWZpbmUgX19IQVZFX0FSQ0hfTUVN
TU9WRQo+PiAgICBleHRlcm4gYXNtbGlua2FnZSB2b2lkICptZW1tb3ZlKHZvaWQgKiwgY29uc3Qg
dm9pZCAqLCBzaXplX3QpOwo+PiAgICBleHRlcm4gYXNtbGlua2FnZSB2b2lkICpfX21lbW1vdmUo
dm9pZCAqLCBjb25zdCB2b2lkICosIHNpemVfdCk7Cj4+ICsjZGVmaW5lIF9fSEFWRV9BUkNIX01F
TUNNUAo+PiArZXh0ZXJuIGludCBtZW1jbXAoY29uc3Qgdm9pZCAqLCBjb25zdCB2b2lkICosIHNp
emVfdCk7Cj4+ICsKPj4gICAgLyogRm9yIHRob3NlIGZpbGVzIHdoaWNoIGRvbid0IHdhbnQgdG8g
Y2hlY2sgYnkga2FzYW4uICovCj4+ICAgICNpZiBkZWZpbmVkKENPTkZJR19LQVNBTikgJiYgIWRl
ZmluZWQoX19TQU5JVElaRV9BRERSRVNTX18pCj4+ICAgICNkZWZpbmUgbWVtY3B5KGRzdCwgc3Jj
LCBsZW4pIF9fbWVtY3B5KGRzdCwgc3JjLCBsZW4pCj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L2xpYi9NYWtlZmlsZSBiL2FyY2gvcmlzY3YvbGliL01ha2VmaWxlCj4+IGluZGV4IDI1ZDVjOTY2
NGU1Ny4uNzA3NzNiZjBjNDcxIDEwMDY0NAo+PiAtLS0gYS9hcmNoL3Jpc2N2L2xpYi9NYWtlZmls
ZQo+PiArKysgYi9hcmNoL3Jpc2N2L2xpYi9NYWtlZmlsZQo+PiBAQCAtMyw2ICszLDcgQEAgbGli
LXkgICAgICAgICAgICAgICAgICAgKz0gZGVsYXkubwo+PiAgICBsaWIteSAgICAgICAgICAgICAg
ICAgICs9IG1lbWNweS5vCj4+ICAgIGxpYi15ICAgICAgICAgICAgICAgICAgKz0gbWVtc2V0Lm8K
Pj4gICAgbGliLXkgICAgICAgICAgICAgICAgICArPSBtZW1tb3ZlLm8KPj4gK2xpYi15ICAgICAg
ICAgICAgICAgICAgKz0gbWVtY21wLm8KPj4gICAgbGliLSQoQ09ORklHX01NVSkgICAgICArPSB1
YWNjZXNzLm8KPj4gICAgbGliLSQoQ09ORklHXzY0QklUKSAgICArPSB0aXNoaWZ0Lm8KPj4KPj4g
ZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbGliL21lbWNtcC5TIGIvYXJjaC9yaXNjdi9saWIvbWVt
Y21wLlMKPj4gbmV3IGZpbGUgbW9kZSAxMDA2NDQKPj4gaW5kZXggMDAwMDAwMDAwMDAwLi44M2Fm
MWM0MzNlNmYKPj4gLS0tIC9kZXYvbnVsbAo+PiArKysgYi9hcmNoL3Jpc2N2L2xpYi9tZW1jbXAu
Uwo+PiBAQCAtMCwwICsxLDU5IEBACj4+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BM
LTIuMC1vbmx5ICovCj4+ICsvKgo+PiArICogQ29weXJpZ2h0IChDKSAyMDIyIHpvdXlpcGVuZ0Bo
dWF3ZWkuY29tCj4+ICsgKi8KPj4gKyNpbmNsdWRlIDxsaW51eC9saW5rYWdlLmg+Cj4+ICsjaW5j
bHVkZSA8YXNtLWdlbmVyaWMvZXhwb3J0Lmg+Cj4+ICsjaW5jbHVkZSA8YXNtL2FzbS5oPgo+PiAr
Cj4+ICsvKiBhcmdybWVudHM6Cj4+ICsqIGEwOiBhZGRyMAo+PiArKiBhMTogYWRkcjEKPj4gKyog
YTI6IHNpemUKPj4gKyovCj4+ICsjZGVmaW5lIGFkZHIwICBhMAo+PiArI2RlZmluZSBhZGRyMSAg
YTEKPj4gKyNkZWZpbmUgbGltaXQgIGEyCj4+ICsKPj4gKyNkZWZpbmUgZGF0YTAgIGEzCj4+ICsj
ZGVmaW5lIGRhdGExICBhNAo+PiArI2RlZmluZSB0bXAgICAgdDMKPj4gKyNkZWZpbmUgYWFkZHIg
IHQ0Cj4+ICsjZGVmaW5lIHJldHVybiBhMAo+PiArCj4+ICsvKiBsb2FkIGFuZCBjb21wYXJlICov
Cj4+ICsubWFjcm8gTERfQ01QIG9wIGQwIGQxIGEwIGExIG9mZnNldAo+PiArICAgICAgIFxvcCBc
ZDAsIDAoXGEwKQo+PiArICAgICAgIFxvcCBcZDEsIDAoXGExKQo+PiArICAgICAgIGFkZGkgXGEw
LCBcYTAsIFxvZmZzZXQKPj4gKyAgICAgICBhZGRpIFxhMSwgXGExLCBcb2Zmc2V0Cj4+ICsgICAg
ICAgc3ViIHRtcCwgXGQwLCBcZDEKPj4gKy5lbmRtCj4+ICsKPj4gK0VOVFJZKG1lbWNtcCkKPj4g
KyAgICAgICAvKiB0ZXN0IGxpbWl0IGFsaWdlbmQgd2l0aCBTWlJFRyAqLwo+PiArICAgICAgIGFu
ZGkgdG1wLCBsaW1pdCwgU1pSRUcgLSAxCj4+ICsgICAgICAgLyogbG9hZCB0YWlsICovCj4+ICsg
ICAgICAgYWRkIGFhZGRyLCBhZGRyMCwgbGltaXQKPj4gKyAgICAgICBzdWIgYWFkZHIsIGFhZGRy
LCB0bXAKPj4gKyAgICAgICBhZGQgbGltaXQsIGFkZHIwLCBsaW1pdAo+PiArCj4+ICsuTGxvb3BX
b3JkOgo+PiArICAgICAgIHNsdHUgdG1wLCBhZGRyMCwgYWFkZHIKPj4gKyAgICAgICBiZXF6IHRt
cCwgLkxsb29wQnl0ZQo+PiArCj4+ICsgICAgICAgTERfQ01QIFJFR19MIGRhdGEwIGRhdGExIGFk
ZHIwIGFkZHIxIFNaUkVHCj4+ICsgICAgICAgYmVxeiB0bXAsIC5MbG9vcFdvcmQKPj4gKyAgICAg
ICBqIC5McmV0dXJuCj4+ICsKPj4gKy5MbG9vcEJ5dGU6Cj4+ICsgICAgICAgc2x0dSB0bXAsIGFk
ZHIwLCBsaW1pdAo+PiArICAgICAgIGJlcXogdG1wLCAuTHJldHVybgo+PiArCj4+ICsgICAgICAg
TERfQ01QIGxidSBkYXRhMCBkYXRhMSBhZGRyMCBhZGRyMSAxCj4+ICsgICAgICAgYmVxeiB0bXAs
IC5MbG9vcEJ5dGUKPj4gKy5McmV0dXJuOgo+PiArICAgICAgIG12IHJldHVybiwgdG1wCj4+ICsg
ICAgICAgcmV0Cj4+ICtFTkQobWVtY21wKQo+PiArRVhQT1JUX1NZTUJPTChtZW1jbXApOwo+PiAt
LQo+PiAyLjE3LjEKPj4KLS0gClJlZ2FyZHMsCllpcGVuZyBab3UKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
