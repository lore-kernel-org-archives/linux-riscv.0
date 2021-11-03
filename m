Return-Path: <SRS0=1+LQ=PW=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A2ACC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 13:16:30 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A5474610EA
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Nov 2021 13:16:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A5474610EA
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=iogearbox.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rs5GAWYoqIhmm7WnM8iD55SN755opdJ2yI3uzq+eJu8=; b=GptjsGIyegTBUXN0J6apYX4Bqn
	XqIKAY8I4iUmR9QLSABFqFSKeLv7UOueaCDB4sdeC2ueCsT80Na57wyDoi9KquccSzHEOS/WbRCzo
	YiOJL3pDIeydJUVh3qCcf1/GRqU86LXkF1QlUVtIZqKdNxSGRYTYVtDjRv6TksV2XId5xZWhMXWPF
	DXtLWlAmrupDkz7tA0EINg/dxQDcjSTHQb79oIGUMoC3DU38B2k2mJMeFN3gUAk7fKXDNUYBgSaac
	ThOHMuZ9HgFtHfvJeCOeqChCviq0mPMxYrmO9xkc9Qj0phCjoaZRP0LohcsIjzUhBDJjZrRfmPdqz
	CNGRNzxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1miG7g-005GzC-UD; Wed, 03 Nov 2021 13:16:12 +0000
Received: from www62.your-server.de ([213.133.104.62])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1miG7e-005Gxh-1v
 for linux-riscv@lists.infradead.org; Wed, 03 Nov 2021 13:16:12 +0000
Received: from sslproxy05.your-server.de ([78.46.172.2])
 by www62.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92.3) (envelope-from <daniel@iogearbox.net>)
 id 1miG7O-0001o4-J0; Wed, 03 Nov 2021 14:15:54 +0100
Received: from [85.1.206.226] (helo=linux.home)
 by sslproxy05.your-server.de with esmtpsa (TLSv1.3:TLS_AES_256_GCM_SHA384:256)
 (Exim 4.92) (envelope-from <daniel@iogearbox.net>)
 id 1miG7O-000CEp-CU; Wed, 03 Nov 2021 14:15:54 +0100
Subject: Re: [PATCH bpf-next] riscv, bpf: Fix RV32 broken build, and silence
 RV64 warning
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, ast@kernel.org,
 netdev@vger.kernel.org, bpf@vger.kernel.org, tongtiangen@huawei.com
Cc: luke.r.nels@gmail.com, xi.wang@gmail.com, linux-riscv@lists.infradead.org
References: <20211103115453.397209-1-bjorn@kernel.org>
From: Daniel Borkmann <daniel@iogearbox.net>
Message-ID: <f98b15c9-bd06-267e-e404-ae4f607d8740@iogearbox.net>
Date: Wed, 3 Nov 2021 14:15:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20211103115453.397209-1-bjorn@kernel.org>
Content-Language: en-US
X-Authenticated-Sender: daniel@iogearbox.net
X-Virus-Scanned: Clear (ClamAV 0.103.3/26342/Wed Nov  3 09:22:37 2021)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211103_061610_118901_66C7DE13 
X-CRM114-Status: GOOD (  20.02  )
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

T24gMTEvMy8yMSAxMjo1NCBQTSwgQmrDtnJuIFTDtnBlbCB3cm90ZToKPiBDb21taXQgMjUyYzc2
NWJkNzY0ICgicmlzY3YsIGJwZjogQWRkIEJQRiBleGNlcHRpb24gdGFibGVzIikgb25seQo+IGFk
ZHJlc3NlZCBSVjY0LCBhbmQgYnJva2UgdGhlIFJWMzIgYnVpbGQgWzFdLiBGaXggYnkgZ2F0aW5n
IHRoZSBleGNlcHRpb24KPiB0YWJsZXMgY29kZSB3aXRoIENPTkZJR19BUkNIX1JWNjRJLgo+IAo+
IEZ1cnRoZXIsIHNpbGVuY2UgYSAiLVdtaXNzaW5nLXByb3RvdHlwZXMiIHdhcm5pbmcgWzJdIGlu
IHRoZSBSVjY0IEJQRgo+IEpJVC4KPiAKPiBbMV0gaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGx2
bS8yMDIxMTEwMjA2MTAuOW95OVJyMEctbGtwQGludGVsLmNvbS8KPiBbMl0gaHR0cHM6Ly9sb3Jl
Lmtlcm5lbC5vcmcvbGx2bS8yMDIxMTAyOTAzMzQuMnpkTXlScTQtbGtwQGludGVsLmNvbS8KPiAK
PiBGaXhlczogMjUyYzc2NWJkNzY0ICgicmlzY3YsIGJwZjogQWRkIEJQRiBleGNlcHRpb24gdGFi
bGVzIikKPiBTaWduZWQtb2ZmLWJ5OiBCasO2cm4gVMO2cGVsIDxiam9ybkBrZXJuZWwub3JnPgo+
IC0tLQo+IFRvbmcvRGFuaWVsOiBUaGUgUlYzMiBidWlsZCBoYXMgYmVlbiBicm9rZW4gc2luY2Ug
VGh1cnNkYXkuIEknbGwgdHJ5Cj4gdG8gZmFzdC10cmFjayBhIGJpdCwgYW5kIGNvbW1pdCBhIHF1
aWNrLWZpeCBmb3IgaXQuIEhvcGUgdGhhdCdzIE9LCj4gd2l0aCB5b3UsIFRvbmchCj4gCj4gSSd2
ZSB2ZXJpZmllZCB0aGUgYnVpbGQgb24gbXkgbWFjaGluZSB1c2luZyByaXNjdjMyIEdDQyA5LjMu
MCBhbmQKPiByaXNjdjY0IEdDQyAxMS4yLjAuCgpUaGFua3MgZm9yIHRoZSBmaXggQmpvcm4hCgo+
IGFyY2gvcmlzY3YvbW0vZXh0YWJsZS5jICAgICAgICAgfCA0ICsrLS0KPiAgIGFyY2gvcmlzY3Yv
bmV0L2JwZl9qaXRfY29tcDY0LmMgfCAyICsrCj4gICAyIGZpbGVzIGNoYW5nZWQsIDQgaW5zZXJ0
aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9l
eHRhYmxlLmMgYi9hcmNoL3Jpc2N2L21tL2V4dGFibGUuYwo+IGluZGV4IDE4YmYzMzgzMDNiNi4u
ZGRiN2QzYjk5ZTg5IDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3YvbW0vZXh0YWJsZS5jCj4gKysr
IGIvYXJjaC9yaXNjdi9tbS9leHRhYmxlLmMKPiBAQCAtMTEsNyArMTEsNyBAQAo+ICAgI2luY2x1
ZGUgPGxpbnV4L21vZHVsZS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3VhY2Nlc3MuaD4KPiAgIAo+
IC0jaWZkZWYgQ09ORklHX0JQRl9KSVQKPiArI2lmIGRlZmluZWQoQ09ORklHX0JQRl9KSVQpICYm
IGRlZmluZWQoQ09ORklHX0FSQ0hfUlY2NEkpCj4gICBpbnQgcnZfYnBmX2ZpeHVwX2V4Y2VwdGlv
bihjb25zdCBzdHJ1Y3QgZXhjZXB0aW9uX3RhYmxlX2VudHJ5ICpleCwgc3RydWN0IHB0X3JlZ3Mg
KnJlZ3MpOwo+ICAgI2VuZGlmCj4gICAKPiBAQCAtMjMsNyArMjMsNyBAQCBpbnQgZml4dXBfZXhj
ZXB0aW9uKHN0cnVjdCBwdF9yZWdzICpyZWdzKQo+ICAgCWlmICghZml4dXApCj4gICAJCXJldHVy
biAwOwo+ICAgCj4gLSNpZmRlZiBDT05GSUdfQlBGX0pJVAo+ICsjaWYgZGVmaW5lZChDT05GSUdf
QlBGX0pJVCkgJiYgZGVmaW5lZChDT05GSUdfQVJDSF9SVjY0SSkKPiAgIAlpZiAocmVncy0+ZXBj
ID49IEJQRl9KSVRfUkVHSU9OX1NUQVJUICYmIHJlZ3MtPmVwYyA8IEJQRl9KSVRfUkVHSU9OX0VO
RCkKPiAgIAkJcmV0dXJuIHJ2X2JwZl9maXh1cF9leGNlcHRpb24oZml4dXAsIHJlZ3MpOwo+ICAg
I2VuZGlmCj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMgYi9h
cmNoL3Jpc2N2L25ldC9icGZfaml0X2NvbXA2NC5jCj4gaW5kZXggMmNhMzQ1YzdiMGJmLi5mMmE3
NzljN2UyMjUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9uZXQvYnBmX2ppdF9jb21wNjQuYwo+
ICsrKyBiL2FyY2gvcmlzY3YvbmV0L2JwZl9qaXRfY29tcDY0LmMKPiBAQCAtNDU5LDYgKzQ1OSw4
IEBAIHN0YXRpYyBpbnQgZW1pdF9jYWxsKGJvb2wgZml4ZWQsIHU2NCBhZGRyLCBzdHJ1Y3QgcnZf
aml0X2NvbnRleHQgKmN0eCkKPiAgICNkZWZpbmUgQlBGX0ZJWFVQX09GRlNFVF9NQVNLICAgR0VO
TUFTSygyNiwgMCkKPiAgICNkZWZpbmUgQlBGX0ZJWFVQX1JFR19NQVNLICAgICAgR0VOTUFTSygz
MSwgMjcpCj4gICAKPiAraW50IHJ2X2JwZl9maXh1cF9leGNlcHRpb24oY29uc3Qgc3RydWN0IGV4
Y2VwdGlvbl90YWJsZV9lbnRyeSAqZXgsCj4gKwkJCQlzdHJ1Y3QgcHRfcmVncyAqcmVncyk7CgpJ
J20gb2theSB0byB0YWtlIHRoaXMgYXMgYSBxdWljayBmaXgsIGJ1dCBpZiBpdHMgbm90IHRvbyBt
dWNoIGhhc3NsZSwgY291bGQgd2UgYWRkIGEKYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9leHRhYmxl
LmggaW4gc2ltaWxhciBmYXNoaW9uIGxpa2UgYXJtNjQgb3IgeDg2IHdoZXJlIHdlIG1vdmUKdGhl
IGV4X2hhbmRsZXJfYnBmKCkgc2lnbmF0dXJlIHRoZXJlLCBkaWQgeW91IGhhdmUgYSBjaGFuY2Ug
dG8gY2hlY2s/Cgo+ICAgaW50IHJ2X2JwZl9maXh1cF9leGNlcHRpb24oY29uc3Qgc3RydWN0IGV4
Y2VwdGlvbl90YWJsZV9lbnRyeSAqZXgsCj4gICAJCQkJc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
ICB7Cj4gCj4gYmFzZS1jb21taXQ6IGNjMDM1NmQ2YTAyZTA2NDM4N2MxNmE4M2NiOTZmZTQzZWYz
MzE4MWUKPiAKClRoYW5rcywKRGFuaWVsCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlz
dHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL2xpbnV4LXJpc2N2Cg==
