Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87E8BEF06E3
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Feb 2026 01:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Aqh/h11x3o9YUqHVOHluzbH+Qm7+4D7bGgWR3eWOg5g=; b=R9f+leC6Z/Ot/C
	QnEPvzWwvGM/x9BKxSj81Mw9K+GrYEYgMdWbpCZRh2/Pqa5oZ8r7rIs/Yasuu07R2cnWGIscba0fP
	K1uzDXQvAaY7u8k3xGpByACpzrZ6qMygw2fPeJ7hoAdmsSJeZJ+TwjCN9G4m88EBBVLGML6HYCxF+
	hvG/IZRHQaoz2rbtq4IPB7f3kURoTH633GDZomDzb98vDQpQlms2772UlpzmgfnqUl/n/16gX08wv
	xCGENooTUfSAVvGduzZyHzyBmn6Wm9M84yk+oYLVHacSo1Hv11mbbbnFfDZJiF3TCu5IO5Y8ljiv5
	66PYQIcCY3Ry0V+g1YCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vou4A-0000000Cv9C-3MUO;
	Sun, 08 Feb 2026 01:58:26 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vou47-0000000Cv8X-0pxe
	for linux-riscv@lists.infradead.org;
	Sun, 08 Feb 2026 01:58:25 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MBOss2GpWxHm5miiGmCeZ6bwZD6apFR4Ee6BnVFBvw8=;
	b=wdA48Tgv8faG4RMJ6I65jVfSFpjhROFKT2e3e2dQJ2uYSMo2wXWxP3jR/4M9AxjBUUeHWzNYy
	2yt4+0NafEWNk0DWA2Cjt0ZUjd8059+xjdRzERfQ10AFLIMJuna16pRjeIdMR0/voYaI9kj8nly
	OwyYg/e70ss8zziDJG9vcEc=
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4f7rTB4Cr4zRhQn;
	Sun,  8 Feb 2026 09:53:34 +0800 (CST)
Received: from kwepemf100007.china.huawei.com (unknown [7.202.181.221])
	by mail.maildlp.com (Postfix) with ESMTPS id 6A2984056B;
	Sun,  8 Feb 2026 09:58:10 +0800 (CST)
Received: from [10.67.110.198] (10.67.110.198) by
 kwepemf100007.china.huawei.com (7.202.181.221) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Sun, 8 Feb 2026 09:58:09 +0800
Message-ID: <9830ef1c-d9cc-46ce-b292-07c8222d72ac@huawei.com>
Date: Sun, 8 Feb 2026 09:58:03 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/3] bpf, riscv: introduce
 emit_store_stack_imm64() for trampoline
Content-Language: en-US
To: Menglong Dong <menglong.dong@linux.dev>, Menglong Dong
	<menglong8.dong@gmail.com>
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
 <d6281121-b39b-41ac-a166-69dbfa1f4f79@huawei.com> <3042323.e9J7NaK4W3@7950hx>
From: Pu Lehui <pulehui@huawei.com>
In-Reply-To: <3042323.e9J7NaK4W3@7950hx>
X-Originating-IP: [10.67.110.198]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemf100007.china.huawei.com (7.202.181.221)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_175823_932364_EDC6FB24 
X-CRM114-Status: GOOD (  14.24  )
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

CgpPbiAyMDI2LzIvNyAxODo1MywgTWVuZ2xvbmcgRG9uZyB3cm90ZToKPiBPbiAyMDI2LzIvNyAw
OToxMywgUHUgTGVodWkgd3JvdGU6Cj4+Cj4+IE9uIDIwMjYvMi82IDIwOjIwLCBNZW5nbG9uZyBE
b25nIHdyb3RlOgo+Pj4gSW50cm9kdWNlIGEgaGVscGVyIHRvIHN0b3JlIDY0LWJpdCBpbW1lZGlh
dGUgb24gdGhlIHRyYW1wb2xpbmUgc3RhY2sgd2l0aAo+Pj4gYSBoZWxwIG9mIGEgcmVnaXN0ZXIu
Cj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWVuZ2xvbmcgRG9uZyA8ZG9uZ21sMkBjaGluYXRlbGVj
b20uY24+Cj4+PiBUZXN0ZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+Cj4+
PiBBY2tlZC1ieTogQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4KPj4+IC0tLQo+Pj4g
ICAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDI1ICsrKysrKysrKysrKysrLS0t
LS0tLS0tLS0KPj4+ICAgIDEgZmlsZSBjaGFuZ2VkLCAxNCBpbnNlcnRpb25zKCspLCAxMSBkZWxl
dGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21w
NjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPj4+IGluZGV4IDM3ODg4YWJl
ZTcwYy4uZTRmNDVlMmU3ZTJmIDEwMDY0NAo+Pj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2pp
dF9jb21wNjQuYwo+Pj4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+Pj4g
QEAgLTkyNiw2ICs5MjYsMTQgQEAgc3RhdGljIHZvaWQgcmVzdG9yZV9zdGFja19hcmdzKGludCBu
cl9zdGFja19hcmdzLCBpbnQgYXJnc19vZmYsIGludCBzdGtfYXJnX29mZiwKPj4+ICAgIAl9Cj4+
PiAgICB9Cj4+PiAgICAKPj4+ICtzdGF0aWMgdm9pZCBlbWl0X3N0b3JlX3N0YWNrX2ltbTY0KHU4
IHJlZywgaW50IHN0YWNrX29mZiwgdTY0IGltbTY0LAo+Pj4gKwkJCQkgICBzdHJ1Y3QgcnZfaml0
X2NvbnRleHQgKmN0eCkKPj4KPj4gU29tZSBuaXQuIFRoZSBmaXJzdCBwYXJhbWV0ZXIgY2FuIGJl
IHJlbW92ZWQgYnkgdXNpbmcgYSBmaXhlZCBSVl9SRUdfVDEuCj4+IEFsc28sIHBsYWNpbmcgaW1t
NjQgYmVmb3JlIHN0YWNrX29mZiBtaWdodCBsb29rcyBiZXR0ZXIuCj4gCj4gSGksIExlaHVpLiBX
aGVuIEkgaW1wbGVtZW50IHRoZSBlbWl0X3N0b3JlX3N0YWNrX2ltbTY0KCkgaW4geDg2LAo+IEFu
ZHJpaSBzdWdnZXN0ZWQgdGhhdCB3ZSdkIGJldHRlciB1c2UgdGhlIHJlZ2lzdGVyIGV4cGxpY2l0
bHkgdG8gaW5kaWNhdGUKPiB0aGUgcmVnaXN0ZXIgaXMgdXNlZC4gU28gbWF5YmUgaXQncyBiZXR0
ZXIgdG8ga2VlcCB0aGlzIHBhcnQgc3RpbGw/CgpObyBwcm9ibGVtLCB0aGUgaW1wYWN0IGlzIG1p
bmltYWwuIEFuZCBpbiB0aGF0IGNhc2UsIGp1c3QgbGVhdmUgaW1tNjQgCmFuZCBzdGFja19vZmYg
YXMgdGhleSBhcmUuIDopCgo+IAo+IEkgY2FuIHBsYWNlIHRoZSBpbW02NCBiZWZvcmUgc3RhY2tf
b2ZmLgo+IAo+IFRoYW5rcyEKPiBNZW5nbG9uZyBEb25nCj4gCj4+Cj4+PiArewo+Pj4gKwkvKiBM
b2FkIGltbTY0IGludG8gcmVnIGFuZCBzdG9yZSBpdCBhdCBbRlAgKyBzdGFja19vZmZdLiAqLwo+
Pj4gKwllbWl0X2ltbShyZWcsIChzNjQpaW1tNjQsIGN0eCk7Cj4+PiArCWVtaXRfc2QoUlZfUkVH
X0ZQLCBzdGFja19vZmYsIHJlZywgY3R4KTsKPj4+ICt9Cj4+PiArCj4+PiAgICBzdGF0aWMgaW50
IGludm9rZV9icGZfcHJvZyhzdHJ1Y3QgYnBmX3RyYW1wX2xpbmsgKmwsIGludCBhcmdzX29mZiwg
aW50IHJldHZhbF9vZmYsCj4+PiAgICAJCQkgICBpbnQgcnVuX2N0eF9vZmYsIGJvb2wgc2F2ZV9y
ZXQsIHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+Pj4gICAgewo+Pj4gQEAgLTkzMywxMiAr
OTQxLDEwIEBAIHN0YXRpYyBpbnQgaW52b2tlX2JwZl9wcm9nKHN0cnVjdCBicGZfdHJhbXBfbGlu
ayAqbCwgaW50IGFyZ3Nfb2ZmLCBpbnQgcmV0dmFsX29mCj4+PiAgICAJc3RydWN0IGJwZl9wcm9n
ICpwID0gbC0+bGluay5wcm9nOwo+Pj4gICAgCWludCBjb29raWVfb2ZmID0gb2Zmc2V0b2Yoc3Ry
dWN0IGJwZl90cmFtcF9ydW5fY3R4LCBicGZfY29va2llKTsKPj4+ICAgIAo+Pj4gLQlpZiAobC0+
Y29va2llKSB7Cj4+PiAtCQllbWl0X2ltbShSVl9SRUdfVDEsIGwtPmNvb2tpZSwgY3R4KTsKPj4+
IC0JCWVtaXRfc2QoUlZfUkVHX0ZQLCAtcnVuX2N0eF9vZmYgKyBjb29raWVfb2ZmLCBSVl9SRUdf
VDEsIGN0eCk7Cj4+PiAtCX0gZWxzZSB7Cj4+PiArCWlmIChsLT5jb29raWUpCj4+PiArCQllbWl0
X3N0b3JlX3N0YWNrX2ltbTY0KFJWX1JFR19UMSwgLXJ1bl9jdHhfb2ZmICsgY29va2llX29mZiwg
bC0+Y29va2llLCBjdHgpOwo+Pj4gKwllbHNlCj4+PiAgICAJCWVtaXRfc2QoUlZfUkVHX0ZQLCAt
cnVuX2N0eF9vZmYgKyBjb29raWVfb2ZmLCBSVl9SRUdfWkVSTywgY3R4KTsKPj4+IC0JfQo+Pj4g
ICAgCj4+PiAgICAJLyogYXJnMTogcHJvZyAqLwo+Pj4gICAgCWVtaXRfaW1tKFJWX1JFR19BMCwg
KGNvbnN0IHM2NClwLCBjdHgpOwo+Pj4gQEAgLTExMjMsMTMgKzExMjksMTAgQEAgc3RhdGljIGlu
dCBfX2FyY2hfcHJlcGFyZV9icGZfdHJhbXBvbGluZShzdHJ1Y3QgYnBmX3RyYW1wX2ltYWdlICpp
bSwKPj4+ICAgIAllbWl0X3NkKFJWX1JFR19GUCwgLXNyZWdfb2ZmLCBSVl9SRUdfUzEsIGN0eCk7
Cj4+PiAgICAKPj4+ICAgIAkvKiBzdG9yZSBpcCBhZGRyZXNzIG9mIHRoZSB0cmFjZWQgZnVuY3Rp
b24gKi8KPj4+IC0JaWYgKGZsYWdzICYgQlBGX1RSQU1QX0ZfSVBfQVJHKSB7Cj4+PiAtCQllbWl0
X2ltbShSVl9SRUdfVDEsIChjb25zdCBzNjQpZnVuY19hZGRyLCBjdHgpOwo+Pj4gLQkJZW1pdF9z
ZChSVl9SRUdfRlAsIC1pcF9vZmYsIFJWX1JFR19UMSwgY3R4KTsKPj4+IC0JfQo+Pj4gKwlpZiAo
ZmxhZ3MgJiBCUEZfVFJBTVBfRl9JUF9BUkcpCj4+PiArCQllbWl0X3N0b3JlX3N0YWNrX2ltbTY0
KFJWX1JFR19UMSwgLWlwX29mZiwgKHU2NClmdW5jX2FkZHIsIGN0eCk7ID4KPj4+IC0JZW1pdF9s
aShSVl9SRUdfVDEsIG5yX2FyZ19zbG90cywgY3R4KTsKPj4+IC0JZW1pdF9zZChSVl9SRUdfRlAs
IC1ucmVnc19vZmYsIFJWX1JFR19UMSwgY3R4KTsKPj4+ICsJZW1pdF9zdG9yZV9zdGFja19pbW02
NChSVl9SRUdfVDEsIC1ucmVnc19vZmYsIG5yX2FyZ19zbG90cywgY3R4KTsKPj4+ICAgIAo+Pj4g
ICAgCXN0b3JlX2FyZ3MobnJfYXJnX3Nsb3RzLCBhcmdzX29mZiwgY3R4KTsKPj4+ICAgIAo+Pgo+
Pgo+IAo+IAo+IAo+IAo+IAo+IAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
