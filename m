Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F87AEE6B6F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 01:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WjG2Za0VGCZ0jTMmBgbtgpugbHlGdQqo8596UIJPDLM=; b=F7VUXH69KSmp62
	4JeF6EKQadBV42IL1wBkKAPc6CZEvzjytfSc/RvlhW1oE0h8qRhHZy69RBJaCHabM719DoNG+rzxx
	Gl01CatkonHdYNlMvHY0Bx1LEjOPl1v56z/Rcvc0drZEphAYyIJE/Xzr559CHGgxkvQjrSvFb2zUz
	sieyRAF9GX9CuTl5zCNMUDo3Wka+OYdnhVZbk02dPnaZ2imQdSuqLF0ifOjA0WDE14midXcVOE9ty
	8Zx5tKyxGvyoAaOiSSCVY5+YmRoKUmAIaTaNm3dn3mFMOAexcv7qQT63XCM8mhY3Rd7WqOJPULtzc
	tE1FHfnHDthkHFQrcFQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voWtf-0000000C0S4-46Pa;
	Sat, 07 Feb 2026 01:14:03 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voWtd-0000000C0Rc-0mU3
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 01:14:03 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=M0guQhZb/eTKYdMXoaEHNBdeGiZfYccqrpOeX2Q8uSM=;
	b=wkPllVei3+nAXiwy04ZbDsl5KMEqe4pRuJ92kvYOwQ5HJWipDyt9K8iI9CTEeKcuxUQ1lg6yk
	EdsbSxq1o5Qs4ltho1mUZMuu6/UlNFrDO36F10TLcDDjRwt8BiVZeFSVrhKAAN2YiaOUn2QvseK
	0wVdeRsuYjfyJzArhtibiEY=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4f7CXZ195Vz1T4FY;
	Sat,  7 Feb 2026 09:09:18 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 46A494036C;
	Sat,  7 Feb 2026 09:13:44 +0800 (CST)
Received: from [10.67.110.198] (10.67.110.198) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sat, 7 Feb 2026 09:13:43 +0800
Message-ID: <d6281121-b39b-41ac-a166-69dbfa1f4f79@huawei.com>
Date: Sat, 7 Feb 2026 09:13:42 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/3] bpf, riscv: introduce
 emit_store_stack_imm64() for trampoline
Content-Language: en-US
To: Menglong Dong <menglong8.dong@gmail.com>
CC: <bjorn@kernel.org>, <ast@kernel.org>, <daniel@iogearbox.net>,
	<andrii@kernel.org>, <martin.lau@linux.dev>, <eddyz87@gmail.com>,
	<song@kernel.org>, <yonghong.song@linux.dev>, <john.fastabend@gmail.com>,
	<kpsingh@kernel.org>, <sdf@fomichev.me>, <haoluo@google.com>,
	<jolsa@kernel.org>, <puranjay@kernel.org>, <pjw@kernel.org>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<bpf@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <jiang.biao@linux.dev>
References: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
 <20260206122002.1494125-2-dongml2@chinatelecom.cn>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <20260206122002.1494125-2-dongml2@chinatelecom.cn>
X-Originating-IP: [10.67.110.198]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_171401_852212_1D5E9D20 
X-CRM114-Status: GOOD (  14.43  )
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

Ck9uIDIwMjYvMi82IDIwOjIwLCBNZW5nbG9uZyBEb25nIHdyb3RlOgo+IEludHJvZHVjZSBhIGhl
bHBlciB0byBzdG9yZSA2NC1iaXQgaW1tZWRpYXRlIG9uIHRoZSB0cmFtcG9saW5lIHN0YWNrIHdp
dGgKPiBhIGhlbHAgb2YgYSByZWdpc3Rlci4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBNZW5nbG9uZyBE
b25nIDxkb25nbWwyQGNoaW5hdGVsZWNvbS5jbj4KPiBUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwg
PGJqb3JuQGtlcm5lbC5vcmc+Cj4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5l
bC5vcmc+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jIHwgMjUgKysr
KysrKysrKysrKystLS0tLS0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L25ldC9icGZf
aml0X2NvbXA2NC5jIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+IGluZGV4IDM3
ODg4YWJlZTcwYy4uZTRmNDVlMmU3ZTJmIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbmV0L2Jw
Zl9qaXRfY29tcDY0LmMKPiArKysgYi9hcmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4g
QEAgLTkyNiw2ICs5MjYsMTQgQEAgc3RhdGljIHZvaWQgcmVzdG9yZV9zdGFja19hcmdzKGludCBu
cl9zdGFja19hcmdzLCBpbnQgYXJnc19vZmYsIGludCBzdGtfYXJnX29mZiwKPiAgIAl9Cj4gICB9
Cj4gICAKPiArc3RhdGljIHZvaWQgZW1pdF9zdG9yZV9zdGFja19pbW02NCh1OCByZWcsIGludCBz
dGFja19vZmYsIHU2NCBpbW02NCwKPiArCQkJCSAgIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4
KQoKU29tZSBuaXQuIFRoZSBmaXJzdCBwYXJhbWV0ZXIgY2FuIGJlIHJlbW92ZWQgYnkgdXNpbmcg
YSBmaXhlZCBSVl9SRUdfVDEuIApBbHNvLCBwbGFjaW5nIGltbTY0IGJlZm9yZSBzdGFja19vZmYg
bWlnaHQgbG9va3MgYmV0dGVyLgoKPiArewo+ICsJLyogTG9hZCBpbW02NCBpbnRvIHJlZyBhbmQg
c3RvcmUgaXQgYXQgW0ZQICsgc3RhY2tfb2ZmXS4gKi8KPiArCWVtaXRfaW1tKHJlZywgKHM2NClp
bW02NCwgY3R4KTsKPiArCWVtaXRfc2QoUlZfUkVHX0ZQLCBzdGFja19vZmYsIHJlZywgY3R4KTsK
PiArfQo+ICsKPiAgIHN0YXRpYyBpbnQgaW52b2tlX2JwZl9wcm9nKHN0cnVjdCBicGZfdHJhbXBf
bGluayAqbCwgaW50IGFyZ3Nfb2ZmLCBpbnQgcmV0dmFsX29mZiwKPiAgIAkJCSAgIGludCBydW5f
Y3R4X29mZiwgYm9vbCBzYXZlX3JldCwgc3RydWN0IHJ2X2ppdF9jb250ZXh0ICpjdHgpCj4gICB7
Cj4gQEAgLTkzMywxMiArOTQxLDEwIEBAIHN0YXRpYyBpbnQgaW52b2tlX2JwZl9wcm9nKHN0cnVj
dCBicGZfdHJhbXBfbGluayAqbCwgaW50IGFyZ3Nfb2ZmLCBpbnQgcmV0dmFsX29mCj4gICAJc3Ry
dWN0IGJwZl9wcm9nICpwID0gbC0+bGluay5wcm9nOwo+ICAgCWludCBjb29raWVfb2ZmID0gb2Zm
c2V0b2Yoc3RydWN0IGJwZl90cmFtcF9ydW5fY3R4LCBicGZfY29va2llKTsKPiAgIAo+IC0JaWYg
KGwtPmNvb2tpZSkgewo+IC0JCWVtaXRfaW1tKFJWX1JFR19UMSwgbC0+Y29va2llLCBjdHgpOwo+
IC0JCWVtaXRfc2QoUlZfUkVHX0ZQLCAtcnVuX2N0eF9vZmYgKyBjb29raWVfb2ZmLCBSVl9SRUdf
VDEsIGN0eCk7Cj4gLQl9IGVsc2Ugewo+ICsJaWYgKGwtPmNvb2tpZSkKPiArCQllbWl0X3N0b3Jl
X3N0YWNrX2ltbTY0KFJWX1JFR19UMSwgLXJ1bl9jdHhfb2ZmICsgY29va2llX29mZiwgbC0+Y29v
a2llLCBjdHgpOwo+ICsJZWxzZQo+ICAgCQllbWl0X3NkKFJWX1JFR19GUCwgLXJ1bl9jdHhfb2Zm
ICsgY29va2llX29mZiwgUlZfUkVHX1pFUk8sIGN0eCk7Cj4gLQl9Cj4gICAKPiAgIAkvKiBhcmcx
OiBwcm9nICovCj4gICAJZW1pdF9pbW0oUlZfUkVHX0EwLCAoY29uc3QgczY0KXAsIGN0eCk7Cj4g
QEAgLTExMjMsMTMgKzExMjksMTAgQEAgc3RhdGljIGludCBfX2FyY2hfcHJlcGFyZV9icGZfdHJh
bXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICppbSwKPiAgIAllbWl0X3NkKFJWX1JFR19G
UCwgLXNyZWdfb2ZmLCBSVl9SRUdfUzEsIGN0eCk7Cj4gICAKPiAgIAkvKiBzdG9yZSBpcCBhZGRy
ZXNzIG9mIHRoZSB0cmFjZWQgZnVuY3Rpb24gKi8KPiAtCWlmIChmbGFncyAmIEJQRl9UUkFNUF9G
X0lQX0FSRykgewo+IC0JCWVtaXRfaW1tKFJWX1JFR19UMSwgKGNvbnN0IHM2NClmdW5jX2FkZHIs
IGN0eCk7Cj4gLQkJZW1pdF9zZChSVl9SRUdfRlAsIC1pcF9vZmYsIFJWX1JFR19UMSwgY3R4KTsK
PiAtCX0KPiArCWlmIChmbGFncyAmIEJQRl9UUkFNUF9GX0lQX0FSRykKPiArCQllbWl0X3N0b3Jl
X3N0YWNrX2ltbTY0KFJWX1JFR19UMSwgLWlwX29mZiwgKHU2NClmdW5jX2FkZHIsIGN0eCk7ID4K
PiAtCWVtaXRfbGkoUlZfUkVHX1QxLCBucl9hcmdfc2xvdHMsIGN0eCk7Cj4gLQllbWl0X3NkKFJW
X1JFR19GUCwgLW5yZWdzX29mZiwgUlZfUkVHX1QxLCBjdHgpOwo+ICsJZW1pdF9zdG9yZV9zdGFj
a19pbW02NChSVl9SRUdfVDEsIC1ucmVnc19vZmYsIG5yX2FyZ19zbG90cywgY3R4KTsKPiAgIAo+
ICAgCXN0b3JlX2FyZ3MobnJfYXJnX3Nsb3RzLCBhcmdzX29mZiwgY3R4KTsKPiAgIAoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFp
bGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmlu
ZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
