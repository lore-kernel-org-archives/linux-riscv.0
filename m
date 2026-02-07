Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F33BEEE0AC4
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 10:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8xEwsyA8lm0rfChfkKJwre2DLm8Et4fet2G1AeiDJLA=; b=yZtQ+VflYhqwed
	8MBZ1CbqzGrnb+EvwQQZEq1VWbDfBmsj1rEKLTXZgPfu2tLmfjf6kU/fD8tjn/QOE9RTNLQ/4Dimv
	ZPrIQ3ML5HqnzyjF/rspIsknJEaj578qPMIvShZbwEh2OHGrPP+ztiqCgQy0NiHz6vtgaIhvmzj9K
	gYbAZxzDmKCfPsppLJGx5hqBtop8k6mBvEYn+39Kw5REHV0/fCijB724eGVPpjx0oA4yvF5mPbh1G
	DP4LwqLZLDT0xGuRuwzA2Efrx0WuAvCJPRslyuNqu9bS8Uv1mUG3ANhoM5NyD1qrteQa5Llioh9n9
	3ZWmriXwilpPMTfZtgYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofwu-0000000CMig-2l9u;
	Sat, 07 Feb 2026 10:54:00 +0000
Received: from out-172.mta0.migadu.com ([91.218.175.172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vofwr-0000000CMiK-1B92
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 10:53:59 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1770461633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QZh0R8vWCBol722cPbD/0P1LqMJ0zb7aYvYr9xYxFi4=;
	b=bzUM415ICosLe1IDqKekKvGuBGnaE93Ls22T+cW13EdVzFOfz/SdTc8KnhnLARVUR1PmRn
	bk3OIUrVs0K20T4YUWHwF7nOVuAcVHmIStsoeZksoKIL61VDngtDsuQlXA5RChztsDWeFP
	JwpzHVJKArWlK7xAOKnGwcbgcQVe9i0=
From: Menglong Dong <menglong.dong@linux.dev>
To: Menglong Dong <menglong8.dong@gmail.com>, Pu Lehui <pulehui@huawei.com>
Cc: bjorn@kernel.org, ast@kernel.org, daniel@iogearbox.net, andrii@kernel.org,
 martin.lau@linux.dev, eddyz87@gmail.com, song@kernel.org,
 yonghong.song@linux.dev, john.fastabend@gmail.com, kpsingh@kernel.org,
 sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org, puranjay@kernel.org,
 pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
 bpf@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, jiang.biao@linux.dev
Subject: Re: [PATCH bpf-next v3 1/3] bpf,
 riscv: introduce emit_store_stack_imm64() for trampoline
Date: Sat, 07 Feb 2026 18:53:17 +0800
Message-ID: <3042323.e9J7NaK4W3@7950hx>
In-Reply-To: <d6281121-b39b-41ac-a166-69dbfa1f4f79@huawei.com>
References: <20260206122002.1494125-1-dongml2@chinatelecom.cn>
 <20260206122002.1494125-2-dongml2@chinatelecom.cn>
 <d6281121-b39b-41ac-a166-69dbfa1f4f79@huawei.com>
MIME-Version: 1.0
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_025357_478859_E248DDF0 
X-CRM114-Status: GOOD (  18.35  )
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

T24gMjAyNi8yLzcgMDk6MTMsIFB1IExlaHVpIHdyb3RlOgo+IAo+IE9uIDIwMjYvMi82IDIwOjIw
LCBNZW5nbG9uZyBEb25nIHdyb3RlOgo+ID4gSW50cm9kdWNlIGEgaGVscGVyIHRvIHN0b3JlIDY0
LWJpdCBpbW1lZGlhdGUgb24gdGhlIHRyYW1wb2xpbmUgc3RhY2sgd2l0aAo+ID4gYSBoZWxwIG9m
IGEgcmVnaXN0ZXIuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IE1lbmdsb25nIERvbmcgPGRvbmdt
bDJAY2hpbmF0ZWxlY29tLmNuPgo+ID4gVGVzdGVkLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBr
ZXJuZWwub3JnPgo+ID4gQWNrZWQtYnk6IEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtlcm5lbC5vcmc+
Cj4gPiAtLS0KPiA+ICAgYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYyB8IDI1ICsrKysr
KysrKysrKysrLS0tLS0tLS0tLS0KPiA+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMo
KyksIDExIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9uZXQv
YnBmX2ppdF9jb21wNjQuYyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiA+IGlu
ZGV4IDM3ODg4YWJlZTcwYy4uZTRmNDVlMmU3ZTJmIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNj
di9uZXQvYnBmX2ppdF9jb21wNjQuYwo+ID4gKysrIGIvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9j
b21wNjQuYwo+ID4gQEAgLTkyNiw2ICs5MjYsMTQgQEAgc3RhdGljIHZvaWQgcmVzdG9yZV9zdGFj
a19hcmdzKGludCBucl9zdGFja19hcmdzLCBpbnQgYXJnc19vZmYsIGludCBzdGtfYXJnX29mZiwK
PiA+ICAgCX0KPiA+ICAgfQo+ID4gICAKPiA+ICtzdGF0aWMgdm9pZCBlbWl0X3N0b3JlX3N0YWNr
X2ltbTY0KHU4IHJlZywgaW50IHN0YWNrX29mZiwgdTY0IGltbTY0LAo+ID4gKwkJCQkgICBzdHJ1
Y3QgcnZfaml0X2NvbnRleHQgKmN0eCkKPiAKPiBTb21lIG5pdC4gVGhlIGZpcnN0IHBhcmFtZXRl
ciBjYW4gYmUgcmVtb3ZlZCBieSB1c2luZyBhIGZpeGVkIFJWX1JFR19UMS4gCj4gQWxzbywgcGxh
Y2luZyBpbW02NCBiZWZvcmUgc3RhY2tfb2ZmIG1pZ2h0IGxvb2tzIGJldHRlci4KCkhpLCBMZWh1
aS4gV2hlbiBJIGltcGxlbWVudCB0aGUgZW1pdF9zdG9yZV9zdGFja19pbW02NCgpIGluIHg4NiwK
QW5kcmlpIHN1Z2dlc3RlZCB0aGF0IHdlJ2QgYmV0dGVyIHVzZSB0aGUgcmVnaXN0ZXIgZXhwbGlj
aXRseSB0byBpbmRpY2F0ZQp0aGUgcmVnaXN0ZXIgaXMgdXNlZC4gU28gbWF5YmUgaXQncyBiZXR0
ZXIgdG8ga2VlcCB0aGlzIHBhcnQgc3RpbGw/CgpJIGNhbiBwbGFjZSB0aGUgaW1tNjQgYmVmb3Jl
IHN0YWNrX29mZi4KClRoYW5rcyEKTWVuZ2xvbmcgRG9uZwoKPiAKPiA+ICt7Cj4gPiArCS8qIExv
YWQgaW1tNjQgaW50byByZWcgYW5kIHN0b3JlIGl0IGF0IFtGUCArIHN0YWNrX29mZl0uICovCj4g
PiArCWVtaXRfaW1tKHJlZywgKHM2NClpbW02NCwgY3R4KTsKPiA+ICsJZW1pdF9zZChSVl9SRUdf
RlAsIHN0YWNrX29mZiwgcmVnLCBjdHgpOwo+ID4gK30KPiA+ICsKPiA+ICAgc3RhdGljIGludCBp
bnZva2VfYnBmX3Byb2coc3RydWN0IGJwZl90cmFtcF9saW5rICpsLCBpbnQgYXJnc19vZmYsIGlu
dCByZXR2YWxfb2ZmLAo+ID4gICAJCQkgICBpbnQgcnVuX2N0eF9vZmYsIGJvb2wgc2F2ZV9yZXQs
IHN0cnVjdCBydl9qaXRfY29udGV4dCAqY3R4KQo+ID4gICB7Cj4gPiBAQCAtOTMzLDEyICs5NDEs
MTAgQEAgc3RhdGljIGludCBpbnZva2VfYnBmX3Byb2coc3RydWN0IGJwZl90cmFtcF9saW5rICps
LCBpbnQgYXJnc19vZmYsIGludCByZXR2YWxfb2YKPiA+ICAgCXN0cnVjdCBicGZfcHJvZyAqcCA9
IGwtPmxpbmsucHJvZzsKPiA+ICAgCWludCBjb29raWVfb2ZmID0gb2Zmc2V0b2Yoc3RydWN0IGJw
Zl90cmFtcF9ydW5fY3R4LCBicGZfY29va2llKTsKPiA+ICAgCj4gPiAtCWlmIChsLT5jb29raWUp
IHsKPiA+IC0JCWVtaXRfaW1tKFJWX1JFR19UMSwgbC0+Y29va2llLCBjdHgpOwo+ID4gLQkJZW1p
dF9zZChSVl9SRUdfRlAsIC1ydW5fY3R4X29mZiArIGNvb2tpZV9vZmYsIFJWX1JFR19UMSwgY3R4
KTsKPiA+IC0JfSBlbHNlIHsKPiA+ICsJaWYgKGwtPmNvb2tpZSkKPiA+ICsJCWVtaXRfc3RvcmVf
c3RhY2tfaW1tNjQoUlZfUkVHX1QxLCAtcnVuX2N0eF9vZmYgKyBjb29raWVfb2ZmLCBsLT5jb29r
aWUsIGN0eCk7Cj4gPiArCWVsc2UKPiA+ICAgCQllbWl0X3NkKFJWX1JFR19GUCwgLXJ1bl9jdHhf
b2ZmICsgY29va2llX29mZiwgUlZfUkVHX1pFUk8sIGN0eCk7Cj4gPiAtCX0KPiA+ICAgCj4gPiAg
IAkvKiBhcmcxOiBwcm9nICovCj4gPiAgIAllbWl0X2ltbShSVl9SRUdfQTAsIChjb25zdCBzNjQp
cCwgY3R4KTsKPiA+IEBAIC0xMTIzLDEzICsxMTI5LDEwIEBAIHN0YXRpYyBpbnQgX19hcmNoX3By
ZXBhcmVfYnBmX3RyYW1wb2xpbmUoc3RydWN0IGJwZl90cmFtcF9pbWFnZSAqaW0sCj4gPiAgIAll
bWl0X3NkKFJWX1JFR19GUCwgLXNyZWdfb2ZmLCBSVl9SRUdfUzEsIGN0eCk7Cj4gPiAgIAo+ID4g
ICAJLyogc3RvcmUgaXAgYWRkcmVzcyBvZiB0aGUgdHJhY2VkIGZ1bmN0aW9uICovCj4gPiAtCWlm
IChmbGFncyAmIEJQRl9UUkFNUF9GX0lQX0FSRykgewo+ID4gLQkJZW1pdF9pbW0oUlZfUkVHX1Qx
LCAoY29uc3QgczY0KWZ1bmNfYWRkciwgY3R4KTsKPiA+IC0JCWVtaXRfc2QoUlZfUkVHX0ZQLCAt
aXBfb2ZmLCBSVl9SRUdfVDEsIGN0eCk7Cj4gPiAtCX0KPiA+ICsJaWYgKGZsYWdzICYgQlBGX1RS
QU1QX0ZfSVBfQVJHKQo+ID4gKwkJZW1pdF9zdG9yZV9zdGFja19pbW02NChSVl9SRUdfVDEsIC1p
cF9vZmYsICh1NjQpZnVuY19hZGRyLCBjdHgpOyA+Cj4gPiAtCWVtaXRfbGkoUlZfUkVHX1QxLCBu
cl9hcmdfc2xvdHMsIGN0eCk7Cj4gPiAtCWVtaXRfc2QoUlZfUkVHX0ZQLCAtbnJlZ3Nfb2ZmLCBS
Vl9SRUdfVDEsIGN0eCk7Cj4gPiArCWVtaXRfc3RvcmVfc3RhY2tfaW1tNjQoUlZfUkVHX1QxLCAt
bnJlZ3Nfb2ZmLCBucl9hcmdfc2xvdHMsIGN0eCk7Cj4gPiAgIAo+ID4gICAJc3RvcmVfYXJncyhu
cl9hcmdfc2xvdHMsIGFyZ3Nfb2ZmLCBjdHgpOwo+ID4gICAKPiAKPiAKCgoKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
