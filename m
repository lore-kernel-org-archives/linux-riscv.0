Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C7C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 03:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9BkKyw31W5ElHkKMnPJIDklGMS9FO+iJwKpxdt8ImHw=; b=A8koKcCLkF38mD
	0nXp2bvkaY8HDTCyxXT87L++jmQ2k30zELc8ZNQYzHwz9WGHejrWZDaf6qlPLemSLQxFqDLlecMkZ
	Edg9IKXcEdC1/t56zCfcFZCm53HCECwd2RS8NGFml6A/MwoaoOQMK7LbefnDs0qvbMvvF++dzlTFO
	6p3RXMf6I0S3zPL3aRxbMgIpQbnSUKaGl6xiAp/u/QSIteKSXotcSXoPAeuvRZIy9EXJ2u9YfAneP
	d9ENGWaRRIwOj7BnZgy8NV5rJ+LT/WLKekS+zKyUUvd4/vO2KcjsTtNv6WdOi9ggmMH9ooYp0+kAX
	Fp/cVvwvQnCWhSk2AoUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN48T-00AAyG-1C; Wed, 01 Feb 2023 03:50:13 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN48P-00AAwi-3w
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 03:50:11 +0000
Received: from kwepemi500012.china.huawei.com (unknown [172.30.72.57])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4P67Dm3F3QzJsB6;
	Wed,  1 Feb 2023 11:48:24 +0800 (CST)
Received: from [10.67.110.108] (10.67.110.108) by
 kwepemi500012.china.huawei.com (7.221.188.12) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.34; Wed, 1 Feb 2023 11:49:59 +0800
Message-ID: <cc396e04-b462-caca-2360-ed3cd19b21fe@huawei.com>
Date: Wed, 1 Feb 2023 11:49:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH] riscv: kprobe: Fixup kernel panic when probing an illegal
 position
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, <guoren@kernel.org>,
	<palmer@dabbelt.com>, <paul.walmsley@sifive.com>, <mhiramat@kernel.org>,
	<conor.dooley@microchip.com>, <penberg@kernel.org>, <mark.rutland@arm.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Guo Ren
	<guoren@linux.alibaba.com>
References: <20230126130509.1418251-1-guoren@kernel.org>
 <878rhig9zj.fsf@all.your.base.are.belong.to.us>
From: "liaochang (A)" <liaochang1@huawei.com>
In-Reply-To: <878rhig9zj.fsf@all.your.base.are.belong.to.us>
X-Originating-IP: [10.67.110.108]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemi500012.china.huawei.com (7.221.188.12)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_195009_530524_4E6FC30D 
X-CRM114-Status: GOOD (  16.02  )
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

CgrlnKggMjAyMy8xLzMxIDIwOjMyLCBCasO2cm4gVMO2cGVsIOWGmemBkzoKPiBndW9yZW5Aa2Vy
bmVsLm9yZyB3cml0ZXM6Cj4gCj4+IEZyb206IEd1byBSZW4gPGd1b3JlbkBsaW51eC5hbGliYWJh
LmNvbT4KPj4KPj4gVGhlIGtlcm5lbCB3b3VsZCBwYW5pYyB3aGVuIHByb2JlZCBmb3IgYW4gaWxs
ZWdhbCBwb3NpdGlvbi4gZWc6Cj4+Cj4+IChDT05GSUdfUklTQ1ZfSVNBX0M9bikKPj4KPj4gZWNo
byAncDpoZWxsbyBrZXJuZWxfY2xvbmUrMHgxNiBhMD0lYTAnID4+IGtwcm9iZV9ldmVudHMKPj4g
ZWNobyAxID4gZXZlbnRzL2twcm9iZXMvaGVsbG8vZW5hYmxlCj4+IGNhdCB0cmFjZQo+Pgo+PiBL
ZXJuZWwgcGFuaWMgLSBub3Qgc3luY2luZzogc3RhY2stcHJvdGVjdG9yOiBLZXJuZWwgc3RhY2sK
Pj4gaXMgY29ycnVwdGVkIGluOiBfX2RvX3N5c19uZXdmc3RhdGF0KzB4YjgvMHhiOAo+PiBDUFU6
IDAgUElEOiAxMTEgQ29tbTogc2ggTm90IHRhaW50ZWQKPj4gNi4yLjAtcmMxLTAwMDI3LWcyZDM5
OGZlNDlhNGQgIzQ5MAo+PiBIYXJkd2FyZSBuYW1lOiByaXNjdi12aXJ0aW8scWVtdSAoRFQpCj4+
IENhbGwgVHJhY2U6Cj4+IFs8ZmZmZmZmZmY4MDAwNzI2OD5dIGR1bXBfYmFja3RyYWNlKzB4Mzgv
MHg0OAo+PiBbPGZmZmZmZmZmODBjNWU4M2M+XSBzaG93X3N0YWNrKzB4NTAvMHg2OAo+PiBbPGZm
ZmZmZmZmODBjNmRhMjg+XSBkdW1wX3N0YWNrX2x2bCsweDYwLzB4ODQKPj4gWzxmZmZmZmZmZjgw
YzZkYTZjPl0gZHVtcF9zdGFjaysweDIwLzB4MzAKPj4gWzxmZmZmZmZmZjgwYzVlY2Y0Pl0gcGFu
aWMrMHgxNjAvMHgzNzQKPj4gWzxmZmZmZmZmZjgwYzZkYjk0Pl0gZ2VuZXJpY19oYW5kbGVfYXJj
aF9pcnErMHgwLzB4YTgKPj4gWzxmZmZmZmZmZjgwMmRlZWIwPl0gc3lzX25ld3N0YXQrMHgwLzB4
MzAKPj4gWzxmZmZmZmZmZjgwMDE1OGMwPl0gc3lzX2Nsb25lKzB4MjAvMHgzMAo+PiBbPGZmZmZm
ZmZmODAwMDM5ZTg+XSByZXRfZnJvbV9zeXNjYWxsKzB4MC8weDQKPj4gLS0tWyBlbmQgS2VybmVs
IHBhbmljIC0gbm90IHN5bmNpbmc6IHN0YWNrLXByb3RlY3RvcjoKPj4gS2VybmVsIHN0YWNrIGlz
IGNvcnJ1cHRlZCBpbjogX19kb19zeXNfbmV3ZnN0YXRhdCsweGI4LzB4YjggXS0tLQo+Pgo+PiBU
aGF0IGlzIGJlY2F1c2UgdGhlIGtwcm9iZSdzIGVicmVhayBpbnN0cnVjdGlvbiBicm9rZSB0aGUg
a2VybmVsJ3MKPj4gb3JpZ2luYWwgY29kZS4gVGhlIHVzZXIgc2hvdWxkIGd1YXJhbnRlZSB0aGUg
Y29ycmVjdGlvbiBvZiB0aGUgcHJvYmUKPj4gcG9zaXRpb24sIGJ1dCBpdCBjb3VsZG4ndCBtYWtl
IHRoZSBrZXJuZWwgcGFuaWMuCj4+Cj4+IFRoaXMgcGF0Y2ggYWRkcyBhcmNoX2NoZWNrX2twcm9i
ZSBpbiBhcmNoX3ByZXBhcmVfa3Byb2JlIHRvIHByZXZlbnQgYW4KPj4gaWxsZWdhbCBwb3NpdGlv
biAoU3VjaCBhcyB0aGUgbWlkZGxlIG9mIGFuIGluc3RydWN0aW9uKS4KPiAKPiBOaWNlIQo+IAo+
IEBsaWFvY2hhbmcgV2lsbCB5b3UgcmVtb3ZlIHlvdXIgcGF0Y2ggZnJvbSB0aGUgT1BUUFJPQkUg
c2VyaWVzPwoKU3VyZSwgaSB3aWxsIHJlbW92ZSBpdC4KCj4gCj4+IEZpeGVzOiBjMjJiMGJjYjFk
ZDAgKCJyaXNjdjogQWRkIGtwcm9iZXMgc3VwcG9ydGVkIikKPj4gU2lnbmVkLW9mZi1ieTogR3Vv
IFJlbiA8Z3VvcmVuQGxpbnV4LmFsaWJhYmEuY29tPgo+PiBTaWduZWQtb2ZmLWJ5OiBHdW8gUmVu
IDxndW9yZW5Aa2VybmVsLm9yZz4KPj4gLS0tCj4+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9iZXMv
a3Byb2Jlcy5jIHwgMTggKysrKysrKysrKysrKysrKysrCj4+ICAxIGZpbGUgY2hhbmdlZCwgMTgg
aW5zZXJ0aW9ucygrKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVz
L2twcm9iZXMuYyBiL2FyY2gvcmlzY3Yva2VybmVsL3Byb2Jlcy9rcHJvYmVzLmMKPj4gaW5kZXgg
ZjIxNTkyZDIwMzA2Li40NzU5ODlmMDZkNmQgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3Yva2Vy
bmVsL3Byb2Jlcy9rcHJvYmVzLmMKPj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvcHJvYmVzL2tw
cm9iZXMuYwo+PiBAQCAtNDgsNiArNDgsMjEgQEAgc3RhdGljIHZvaWQgX19rcHJvYmVzIGFyY2hf
c2ltdWxhdGVfaW5zbihzdHJ1Y3Qga3Byb2JlICpwLCBzdHJ1Y3QgcHRfcmVncyAqcmVncykKPj4g
IAlwb3N0X2twcm9iZV9oYW5kbGVyKHAsIGtjYiwgcmVncyk7Cj4+ICB9Cj4+ICAKPj4gK3N0YXRp
YyBib29sIF9fa3Byb2JlcyBhcmNoX2NoZWNrX2twcm9iZShzdHJ1Y3Qga3Byb2JlICpwKQo+PiAr
ewo+PiArCXVuc2lnbmVkIGxvbmcgdG1wICA9ICh1bnNpZ25lZCBsb25nKXAtPmFkZHIgLSBwLT5v
ZmZzZXQ7Cj4+ICsJdW5zaWduZWQgbG9uZyBhZGRyID0gKHVuc2lnbmVkIGxvbmcpcC0+YWRkcjsK
Pj4gKwo+PiArCXdoaWxlICh0bXAgPD0gYWRkcikgewo+PiArCQlpZiAodG1wID09IGFkZHIpCj4+
ICsJCQlyZXR1cm4gdHJ1ZTsKPj4gKwo+PiArCQl0bXAgKz0gR0VUX0lOU05fTEVOR1RIKCooa3By
b2JlX29wY29kZV90ICopdG1wKTsKPiAKPiBrcHJvYmVfb3Bjb2RlX3QgaXMgdTMyOyBUaGlzIGNh
biB0cmlnZ2VyIGEgbWlzYWxpZ25lZCBsb2FkLCByaWdodD8KCkkgdGhpbmsgaXQgZGVwZW5kcyBv
biB0aGUgaGFyZHdhcmUgaW1wbGVtZW50YXRpb24sIGV2ZW50IGFuIEVFSSBtYXkgZ3VhcmFudGVl
IHRoYXQgbWlzYWxpZ25lZApsb2FkcyBhbmQgc3RvcmVzIGFyZSBmdWxseSBzdXBwb3J0ZWQsIGhh
cmR3YXJlIHdpbGwgcmVxdWlyZXMgYWRkaXRpb25hbCBzeWNocm9uaXphdGluIHRvIGVuc3VyZQph
dG9taWNpdHksIHNvIGl0IGlzIGJldHRlciB0byB1c2UgYSBsb2FkIGluc3RydWN0aW9uIHdob3Nl
IGVmZmVjdGl2ZSBhZGRyZXNzIGlzIG5hdHVyYWxseSBhbGlnbmVkLgoKRnJvbSAiVm9sdW0gSTog
UklTQy1WIFVucHJpdmlsZWdlZCBJU0EgMi42IjoKCiIuLi4sIExvYWRzIGFuZCBzdG9yZXMgd2hv
c2UgZWZmZWN0aXZlIGFkZHJlc3MgaXMgbm90IG5hdHVyYWxseSBhbGlnbmVkIHRvIHRoZSByZWZl
cmVuY2VkIGRhdGF0eXBlCihpLmUsIHRoZSBlZmZlY3RpdmUgYWRkcmVzcyBpcyBub3QgZGl2aXNp
YmxlIGJ5IHRoZSBzaXplIG9mIHRoZSBhY2Nlc3MgaW4gYnl0ZXMpIGhhdmUgYmVoYXZpb3IKZGVw
ZW5kZW5ldCBvbiB0aGUgRUVJLiIKCj4gCj4+ICsJfQo+PiArCj4+ICsJcmV0dXJuIGZhbHNlOwo+
PiArfQo+PiArCj4+ICBpbnQgX19rcHJvYmVzIGFyY2hfcHJlcGFyZV9rcHJvYmUoc3RydWN0IGtw
cm9iZSAqcCkKPj4gIHsKPj4gIAl1bnNpZ25lZCBsb25nIHByb2JlX2FkZHIgPSAodW5zaWduZWQg
bG9uZylwLT5hZGRyOwo+PiBAQCAtNTUsNiArNzAsOSBAQCBpbnQgX19rcHJvYmVzIGFyY2hfcHJl
cGFyZV9rcHJvYmUoc3RydWN0IGtwcm9iZSAqcCkKPj4gIAlpZiAocHJvYmVfYWRkciAmIDB4MSkK
Pj4gIAkJcmV0dXJuIC1FSUxTRVE7Cj4+ICAKPj4gKwlpZiAoIWFyY2hfY2hlY2tfa3Byb2JlKHAp
KQo+PiArCQlyZXR1cm4gLUVJTFNFUTsKPj4gKwo+PiAgCS8qIGNvcHkgaW5zdHJ1Y3Rpb24gKi8K
Pj4gIAlwLT5vcGNvZGUgPSAqcC0+YWRkcjsKPiAKPiBOb3QgcmVsYXRlZCB0byB5b3VyIHBhdGNo
LCBidXQgdGhpcyBjYW4gYWxzbyB0cmlnZ2VyIGEgbWlzYWxpZ25lZCBsb2FkLgo+IAo+IAo+IEJq
w7ZybgoKLS0gCkJSLApMaWFvLCBDaGFuZwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxp
c3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0
aW5mby9saW51eC1yaXNjdgo=
