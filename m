Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3488BECAAD5
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 11:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sGW7Uji2/3DcU1yx0M8cC2DhLw8ZYcT0rMRU/tBIKGY=; b=HQtKFJy5R5dvHz
	Icxv0lSu7Ramjrj6opDKRV4UPMdTcyfmyVCAuTUn5vM8gPEaA0tgFrYZP9bY3fschMGE0mqE+moZA
	O8D7GyLlObvWtqV9xMk+guQ22I+SwdxuRGZmeDjQTPK6BPys9UXEN4/kRGmU/btMonJlHkSfAdk8t
	aV6zZKxhz16Q/2m0FNeTgAh9kyALp0/4MTpyertBKMYs/3U7axKdb44xXJeE8w/1W+mCoMYjicsdA
	D8gNdDCpR3oYftDvb/nt0JQ+TR4U8LmGsHFPWkalo9oPYqSZw5OVptyKmrYb1xBKmQ6xpJSqfVq1A
	rYqO7VYryQUwobGbL8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFUu-002cXk-Fg; Thu, 08 Sep 2022 11:15:04 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oWFUq-002cVl-Or
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 11:15:03 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.54])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MNbz72k7LzjWvs;
	Thu,  8 Sep 2022 19:11:15 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Thu, 8 Sep 2022 19:14:51 +0800
Message-ID: <c2fcb59f-85a5-fbb5-138f-d02962351a28@huawei.com>
Date: Thu, 8 Sep 2022 19:14:50 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH] riscv/kprobes: allocate detour buffer from module area
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, <aou@eecs.berkeley.edu>,
	<mhiramat@kernel.org>, <rostedt@goodmis.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <mhng-0e2f7f49-2680-4341-83dc-0e7cd042a3fa@palmer-mbp2014>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <mhng-0e2f7f49-2680-4341-83dc-0e7cd042a3fa@palmer-mbp2014>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220908_041501_193677_1F95FB3D 
X-CRM114-Status: GOOD (  12.10  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

CgrlnKggMjAyMi84LzEyIDE6MDksIFBhbG1lciBEYWJiZWx0IOWGmemBkzoKPiBPbiBUdWUsIDI4
IEp1biAyMDIyIDE4OjEzOjE3IFBEVCAoLTA3MDApLCBsaWFvY2hhbmcxQGh1YXdlaS5jb20gd3Jv
dGU6Cj4+IFRvIGFkZHJlc3MgdGhlIGxpbWl0YXRpb24gb2YgUEMtcmVsYXRpdmUgYnJhbmNoIGlu
c3RydWN0aW9uCj4+IG9uIHJpc2N2IGFyY2hpdGVjdHVyZSwgZGV0b3VyIGJ1ZmZlciBzbG90IGlz
IGFsbG9jYXRlZCBmcm9tCj4+IGEgYXJlYSwgdGhlIGRpc3RhbmNlIG9mIHdoaWNoIGZyb20ga2Vy
bmVsIHNob3VsZCBiZSBsZXNzIHRoYW4gNEdCLgo+Pgo+PiBGb3IgdGhlIHRpbWUgYmVpbmcsIE1v
ZHVsZXMgcmVnaW9uIGFsd2F5cyBsaXZlIGJlZm9yZSB0aGUga2VybmVsLgo+PiBCdXQgVm1hbGxv
YyByZWdpb24gcmVzaWRlIGZhciBhd2F5IGZyb20ga2VybmVsLCB0aGUgZGlzdGFuY2UgaXMKPj4g
aGFsZiBvZiB0aGUga2VybmVsIGFkZHJlc3Mgc3BhY2UuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IExp
YW8gQ2hhbmcgPGxpYW9jaGFuZzFAaHVhd2VpLmNvbT4KPj4gLS0tCj4+IMKgYXJjaC9yaXNjdi9r
ZXJuZWwvcHJvYmVzL2twcm9iZXMuYyB8IDIwICsrKysrKysrKysrKysrKysrKysrCj4+IMKgMSBm
aWxlIGNoYW5nZWQsIDIwIGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlz
Y3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3By
b2Jlcy5jCj4+IGluZGV4IGU2ZTk1MGI3Y2YzMi4uYmMwMjdhNjYzYjE3IDEwMDY0NAo+PiAtLS0g
YS9hcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMva3Byb2Jlcy5jCj4+ICsrKyBiL2FyY2gvcmlzY3Yv
a2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPj4gQEAgLTYsMTIgKzYsMTQgQEAKPj4gwqAjaW5jbHVk
ZSA8bGludXgvZXh0YWJsZS5oPgo+PiDCoCNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4+IMKgI2lu
Y2x1ZGUgPGxpbnV4L3N0b3BfbWFjaGluZS5oPgo+PiArI2luY2x1ZGUgPGxpbnV4L21vZHVsZWxv
YWRlci5oPgo+PiDCoCNpbmNsdWRlIDxhc20vcHRyYWNlLmg+Cj4+IMKgI2luY2x1ZGUgPGxpbnV4
L3VhY2Nlc3MuaD4KPj4gwqAjaW5jbHVkZSA8YXNtL3NlY3Rpb25zLmg+Cj4+IMKgI2luY2x1ZGUg
PGFzbS9jYWNoZWZsdXNoLmg+Cj4+IMKgI2luY2x1ZGUgPGFzbS9idWcuaD4KPj4gwqAjaW5jbHVk
ZSA8YXNtL3BhdGNoLmg+Cj4+ICsjaW5jbHVkZSA8YXNtL3NldF9tZW1vcnkuaD4KPj4KPj4gwqAj
aW5jbHVkZSAiZGVjb2RlLWluc24uaCIKPj4KPj4gQEAgLTg2LDEwICs4OCwyOCBAQCBpbnQgX19r
cHJvYmVzIGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPj4gwqAjaWZkZWYg
Q09ORklHX01NVQo+PiDCoHZvaWQgKmFsbG9jX2luc25fcGFnZSh2b2lkKQo+PiDCoHsKPj4gKyNp
ZiBkZWZpbmVkKENPTkZJR19NT0RVTEVTKSAmJiBkZWZpbmVkKENPTkZJR182NEJJVCkKPj4gK8Kg
wqDCoCB2b2lkICpwYWdlOwo+PiArCj4+ICvCoMKgwqAgcGFnZSA9IG1vZHVsZV9hbGxvYyhQQUdF
X1NJWkUpOwo+PiArwqDCoMKgIGlmICghcGFnZSkKPj4gK8KgwqDCoMKgwqDCoMKgIHJldHVybiBO
VUxMOwo+PiArCj4+ICvCoMKgwqAgc2V0X3ZtX2ZsdXNoX3Jlc2V0X3Blcm1zKHBhZ2UpOwo+PiAr
wqDCoMKgIC8qCj4+ICvCoMKgwqDCoCAqIEZpcnN0IG1ha2UgdGhlIHBhZ2UgcmVhZC1vbmx5LCBh
bmQgb25seSB0aGVuIG1ha2UgaXQgZXhlY3V0YWJsZSB0bwo+PiArwqDCoMKgwqAgKiBwcmV2ZW50
IGl0IGZyb20gYmVpbmcgVytYIGluIGJldHdlZW4uCj4+ICvCoMKgwqDCoCAqLwo+PiArwqDCoMKg
IHNldF9tZW1vcnlfcm8oKHVuc2lnbmVkIGxvbmcpcGFnZSwgMSk7Cj4+ICvCoMKgwqAgc2V0X21l
bW9yeV94KCh1bnNpZ25lZCBsb25nKXBhZ2UsIDEpOwo+PiArCj4+ICvCoMKgwqAgcmV0dXJuIHBh
Z2U7Cj4+ICsjZWxzZQo+PiDCoMKgwqDCoCByZXR1cm7CoCBfX3ZtYWxsb2Nfbm9kZV9yYW5nZShQ
QUdFX1NJWkUsIDEsIFZNQUxMT0NfU1RBUlQsIFZNQUxMT0NfRU5ELAo+PiDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgR0ZQX0tFUk5FTCwgUEFHRV9LRVJORUxfUkVB
RF9FWEVDLAo+PiDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgVk1f
RkxVU0hfUkVTRVRfUEVSTVMsIE5VTUFfTk9fTk9ERSwKPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgIF9fYnVpbHRpbl9yZXR1cm5fYWRkcmVzcygwKSk7Cj4+ICsj
ZW5kaWYKPj4gwqB9Cj4+IMKgI2VuZGlmCj4gCj4gVGhpcyBwcm9iYWJseSBzaG91bGRuJ3QgZGVw
ZW5kIG9uIENPTkZJR19NT0RVTEVTLCBpdCdzIGp1c3QgYXMgYnJva2VuIHRvIGFzc3VtZSB3ZSBj
YW4ganVtcCB0byB0aGUgdm1hbGxvYyByZWdpb24gcmVnYXJkbGVzcyBvZiB3aGV0aGVyIG1vZHVs
ZXMgYXJlIGVuYWJsZWQgb3IgZGlzYWJsZWQuwqAgV2Ugc2hvdWxkIGJlIGFibGUgdG8ganVzdCBh
bGxvY2F0ZSBmcm9tIHRoZSBqdW1wLXNhZmUgcmVnaW9uIGVpdGhlciB3YXkuCj4gLgoKWWVzLCB0
aGVyZSBpcyBubyBuZWVkIHRvIGludm9rZSBtb2R1bGVfYWxsb2MgdG8gYWxsb2NhdGUgYnVmZmVy
IGZyb20ganVtcC1zYWZlIHJlZ2lvbiwKanVzdCB1c2UgX192bWFsbG9jX25vZGVfcmFuZ2UgZGly
ZWN0bHksIHRoYW5rcyBmb3IgcmVtaW5kaW5nIG1lLgoKLS0gCkJSLApMaWFvLCBDaGFuZwoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
