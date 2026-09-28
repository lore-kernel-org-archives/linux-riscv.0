Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2806AC98328
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Sep 2026 04:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/4jz3V8FMe5/fnWg/TcDyvupAq4t0AhWSAPE4IhdmQg=; b=cQeby/AL6sAVIZ
	wxr0Mc8fVkywlgwvJPSDbGz0kOPD0ZX5037aqvmM2qAs2wQ8oB7fUu5aOdjq5hKq5EDtemEE1vLqw
	KBK545neBd36j2Bi5QY05CRHEtzqaXO0Sd9HGfqaft7yptn80apwyDzjqCLpujtwkIfnnE2pPjVCa
	w6DPrrSz7VLUvZP1gPOZhIZrzygni5+FC1jyw2QHKYHqJFccqwTTwUFrMiV1qgGg7ld1VAqS8qkeh
	fBHyYZ6m5YVxPkGPlABZHNJ/O5RsKOFp24LVWB05vgY4NX49lEwzp4CP8hOVf/tCy54fESG3g6GzL
	Bwb6dxQiBDmr5BWKcZvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB2Zw-0000000HIUS-3Q8Y;
	Mon, 28 Sep 2026 04:03:00 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xB2Zt-0000000HITX-04Lh
	for linux-riscv@lists.infradead.org;
	Mon, 28 Sep 2026 04:02:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=yMzZ40MhXUsj3z/JaHRvax3vgrWefMoxo7kjo8blCQU=;
	b=iv8hKHooDlWFLLNnKXJ8wnracqfZKs3Hrl++aGpOUmX6mTgoOgg0iJgAa/Agey5caljAZSStV
	5Y2A+zU4kxt0dgVgXV3V/tvf5jgRcWmzie3A9GYZNKWT9ictu/8DIUVWO0JL7WNvZhoETsLjIwF
	xpKwlgrwZj1Xf1GwPW3Oe0k=
Received: from mail.maildlp.com (unknown [172.19.162.92])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4htS5D0FFmznTVv;
	Mon, 28 Sep 2026 11:50:40 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id AC63940565;
	Mon, 28 Sep 2026 12:02:41 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemf100007.china.huawei.com
 (7.202.181.221) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Mon, 28 Sep
 2026 12:02:40 +0800
Message-ID: <6a87a54e-2792-4c07-a48a-c9a4083bfd5c@huawei.com>
Date: Mon, 28 Sep 2026 12:02:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v2 1/2] bpf, riscv: Add support for indirect
 jumps
Content-Language: en-US
To: Chen Pei <cp0613@linux.alibaba.com>, <ast@kernel.org>,
	<daniel@iogearbox.net>, <andrii@kernel.org>, <memxor@gmail.com>,
	<bjorn@kernel.org>, <puranjay@kernel.org>
CC: <ihor.solodrai@linux.dev>, <eddyz87@gmail.com>, <martin.lau@linux.dev>,
	<song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
	<emil@etsalapatis.com>, <pjw@kernel.org>, <palmer@dabbelt.com>,
	<shuah@kernel.org>, <guoren@kernel.org>, <bpf@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20260928022109.1093-1-cp0613@linux.alibaba.com>
 <20260928022109.1093-2-cp0613@linux.alibaba.com>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260928022109.1093-2-cp0613@linux.alibaba.com>
X-Originating-IP: [10.67.110.68]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_210257_663407_C1E8A9EF 
X-CRM114-Status: GOOD (  21.61  )
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

CgpPbiAyMDI2LzkvMjggMTA6MjEsIENoZW4gUGVpIHdyb3RlOgo+IEltcGxlbWVudCBKSVQgc3Vw
cG9ydCBmb3IgdGhlIGluZGlyZWN0IGp1bXAgaW5zdHJ1Y3Rpb24gKEJQRl9KTVAgfAo+IEJQRl9K
QSB8IEJQRl9YKSwgYS5rLmEuIGdvdG94LCB3aGljaCBsZXRzIGEgQlBGIHByb2dyYW0ganVtcCB0
aHJvdWdoIGEKPiBCUEZfTUFQX1RZUEVfSU5TTl9BUlJBWSBqdW1wIHRhYmxlLgo+IAo+IEVtaXQg
ImphbHIgemVybywgcmQsIDAiIGFuZCBoYW5kIHRoZSB4bGF0ZWQgdG8gaml0dGVkIG9mZnNldHMg
dG8KPiBicGZfcHJvZ191cGRhdGVfaW5zbl9wdHJzKCksIHdoaWNoIGlzIHdoYXQgZmlsbHMgaW4g
dGhlIGp1bXAgdGFibGUKPiBlbnRyaWVzOyB3aXRob3V0IHRoYXQgY2FsbCB0aGUgbG9hZCBmYWls
cyB3aXRoIC1FRkFVTFQgaW4KPiBicGZfaW5zbl9hcnJheV9yZWFkeSgpLiBjdHgtPm9mZnNldFtd
IGhvbGRzIHRoZSBvZmZzZXQgb2YgdGhlIGluc24KPiAqZm9sbG93aW5nKiBpbnNuIGksIGFzIGJw
Zl9wcm9nX2ZpbGxfaml0ZWRfbGluZm8oKSBleHBlY3RzLCBzbyBpdCBpcwo+IHNoaWZ0ZWQgYnkg
b25lIGFuZCBvZmZzZXRbMF0gY29tZXMgZnJvbSB0aGUgcHJvbG9ndWUgbGVuZ3RoLiBidWlsZF9i
b2R5KCkKPiBub3cgcmVjb3JkcyBib3RoIGhhbHZlcyBvZiBhIG11bHRpLWluc24gcmVjb3JkLCBz
byBubyBzbG90IGtlZXBzIGEKPiBmYWJyaWNhdGVkIG9mZnNldC4KPiAKPiBPbmx5IHRoZSBSVjY0
IEpJVCBpcyBjb3ZlcmVkOyBSVjMyIGtlZXBzIGZhaWxpbmcgdG8gbG9hZCBhcyBiZWZvcmUuCj4g
Cj4gU2lnbmVkLW9mZi1ieTogQ2hlbiBQZWkgPGNwMDYxM0BsaW51eC5hbGliYWJhLmNvbT4KPiBS
ZXZpZXdlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPiBBY2tlZC1ieTog
QmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPiAtLS0KPiAKPiBDaGFuZ2VzIHNpbmNl
IHYxOgo+IC0gUmV3b3JkIHRoZSBjb2RlIGNvbW1lbnQgdG8gc2F5ICJzaGlmdCBjdHgtPm9mZnNl
dFtdIGJ5IG9uZSIuCj4gCj4gICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgIDUg
KysrKysKPiAgIGFyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jICAgfCAxNiArKysrKysrKysr
KysrKy0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDE5IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25z
KC0pCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9h
cmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gaW5kZXggZWQwYTZmODcxZGVhLi45ZGUz
NzQ5ZmIyNjggMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+
ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBAQCAtMTY5MSw2ICsxNjkx
LDExIEBAIGludCBicGZfaml0X2VtaXRfaW5zbihjb25zdCBzdHJ1Y3QgYnBmX2luc24gKmluc24s
IHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4LAo+ICAgCQkJZW1pdF96ZXh0dyhyZCwgcmQsIGN0
eCk7Cj4gICAJCWJyZWFrOwo+ICAgCj4gKwkvKiBKVU1QIHJlZyAqLwo+ICsJY2FzZSBCUEZfSk1Q
IHwgQlBGX0pBIHwgQlBGX1g6Cj4gKwkJZW1pdF9qYWxyKFJWX1JFR19aRVJPLCByZCwgMCwgY3R4
KTsKPiArCQlicmVhazsKPiArCj4gICAJLyogSlVNUCBvZmYgKi8KPiAgIAljYXNlIEJQRl9KTVAg
fCBCUEZfSkE6Cj4gICAJY2FzZSBCUEZfSk1QMzIgfCBCUEZfSkE6Cj4gZGlmZiAtLWdpdCBhL2Fy
Y2gvcmlzY3YvbmV0L2JwZl9qaXRfY29yZS5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb3Jl
LmMKPiBpbmRleCA0NzBhNmFjZTU2NjIuLjUyNjVkZDViZDM5ZSAxMDA2NDQKPiAtLS0gYS9hcmNo
L3Jpc2N2L25ldC9icGZfaml0X2NvcmUuYwo+ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRf
Y29yZS5jCj4gQEAgLTI2LDEwICsyNiwxMyBAQCBzdGF0aWMgaW50IGJ1aWxkX2JvZHkoc3RydWN0
IHJ2X2ppdF9jb250ZXh0ICpjdHgsIGJvb2wgZXh0cmFfcGFzcywgaW50ICpvZmZzZXQpCj4gICAJ
CWludCByZXQ7Cj4gICAKPiAgIAkJcmV0ID0gYnBmX2ppdF9lbWl0X2luc24oaW5zbiwgY3R4LCBl
eHRyYV9wYXNzKTsKPiAtCQlpZiAocmV0ID4gMCkKPiAtCQkJaSsrOyAvKiBza2lwIHRoZSBuZXh0
IGluc3RydWN0aW9uICovCj4gICAJCWlmIChvZmZzZXQpCj4gICAJCQlvZmZzZXRbaV0gPSBjdHgt
Pm5pbnNuczsKPiArCQlpZiAocmV0ID4gMCkgewo+ICsJCQlpKys7IC8qIHNraXAgdGhlIG5leHQg
aW5zdHJ1Y3Rpb24gKi8KPiArCQkJaWYgKG9mZnNldCkKPiArCQkJCW9mZnNldFtpXSA9IGN0eC0+
bmluc25zOwo+ICsJCX0KPiAgIAkJaWYgKHJldCA8IDApCj4gICAJCQlyZXR1cm4gcmV0Owo+ICAg
CX0KPiBAQCAtMTc2LDYgKzE3OSwxNSBAQCBzdHJ1Y3QgYnBmX3Byb2cgKmJwZl9pbnRfaml0X2Nv
bXBpbGUoc3RydWN0IGJwZl92ZXJpZmllcl9lbnYgKmVudiwgc3RydWN0IGJwZl9wcgo+ICAgCQlm
b3IgKGkgPSAwOyBpIDwgcHJvZy0+bGVuOyBpKyspCj4gICAJCQljdHgtPm9mZnNldFtpXSA9IG5p
bnNuc19ydm9mZihjdHgtPm9mZnNldFtpXSk7Cj4gICAJCWJwZl9wcm9nX2ZpbGxfaml0ZWRfbGlu
Zm8ocHJvZywgY3R4LT5vZmZzZXQpOwo+ICsKPiArCQkvKgo+ICsJCSAqIGJwZl9wcm9nX3VwZGF0
ZV9pbnNuX3B0cnMoKSB3YW50cyB0aGUgc3RhcnQgb2YgZWFjaCBpbnNuLCBzbwo+ICsJCSAqIHNo
aWZ0IGN0eC0+b2Zmc2V0W10gYnkgb25lIGFuZCBnZXQgaW5zbiAwIGZyb20gdGhlIHByb2xvZ3Vl
Lgo+ICsJCSAqLwo+ICsJCWZvciAoaSA9IHByb2ctPmxlbiAtIDE7IGkgPiAwOyBpLS0pCj4gKwkJ
CWN0eC0+b2Zmc2V0W2ldID0gY3R4LT5vZmZzZXRbaSAtIDFdOwo+ICsJCWN0eC0+b2Zmc2V0WzBd
ID0gbmluc25zX3J2b2ZmKGN0eC0+cHJvbG9ndWVfbGVuKTsKPiArCQlicGZfcHJvZ191cGRhdGVf
aW5zbl9wdHJzKHByb2csIGN0eC0+b2Zmc2V0LCBqaXRfZGF0YS0+cm9faW1hZ2UpOwo+ICAgb3V0
X29mZnNldDoKPiAgIAkJa3ZmcmVlKGN0eC0+b2Zmc2V0KTsKPiAgIAkJa2ZyZWUoaml0X2RhdGEp
OwoKUmV2aWV3ZWQtYnk6IFB1IExlaHVpIDxwdWxlaHVpQGh1YXdlaS5jb20+CgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
