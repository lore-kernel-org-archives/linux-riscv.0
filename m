Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA975C6FA82
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Sep 2022 07:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZMxEqEfVWqjNDVs/sIdfeM+IjLymcfgZYNwZYWWTV50=; b=fo6GCdnUTnQ21n
	AvA7EZk8w0zf1dIJVjxWuMdUpyGSgqanwEVNkw4yWV+iseOnFWox2zEWeARSy72U878ScM36gOsYT
	Q9j+WvYUrwGtDsJD66F61BZTo9XOn6Skt4LsEl8jzsXVdO64mFb9A8I5Ws1lkY7YrLkBGdqSRxdgX
	I4T/CTU2d66NpNTV6C1V0yzZD42jd4sWtTuU1hqUvm/1InEJ5kCgTE2IRizkahbhQ+e2OgjJ7N1t6
	N5dvv0F0PHzazVjNQH0IzRA0z20GLgvYHw6BTicqu4MAuTzC+nMcp08PRgXHA5Rr7R67ZYqQMpQJW
	HadOFxrJ8G/KSkQWFCsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGgr-00DrlO-HU; Thu, 22 Sep 2022 07:32:09 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obGgn-00DrgJ-Eu
	for linux-riscv@lists.infradead.org; Thu, 22 Sep 2022 07:32:07 +0000
Received: (Authenticated sender: alex@ghiti.fr)
	by mail.gandi.net (Postfix) with ESMTPSA id BD6071C0009;
	Thu, 22 Sep 2022 07:31:56 +0000 (UTC)
Message-ID: <b012edf5-60ae-a45a-4da9-823cd0fd1e93@ghiti.fr>
Date: Thu, 22 Sep 2022 09:31:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 1/2] riscv: Fix crash during early errata patching
Content-Language: en-US
To: Samuel Holland <samuel@sholland.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel@vger.kernel.org
References: <20220922054743.30159-1-samuel@sholland.org>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20220922054743.30159-1-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220922_003205_680500_FD338BFF 
X-CRM114-Status: GOOD (  18.90  )
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

SGkgU2FtdWVsLAoKT24gOS8yMi8yMiAwNzo0NywgU2FtdWVsIEhvbGxhbmQgd3JvdGU6Cj4gVGhl
IHBhdGNoIGZ1bmN0aW9uIGZvciB0aGUgVC1IZWFkIFBCTVQgZXJyYXRhIGNhbGxzIF9fcGFfc3lt
Ym9sKCkgYmVmb3JlCj4gcmVsb2NhdGlvbi4gVGhpcyBjcmFzaGVzIHdoZW4gQ09ORklHX0RFQlVH
X1ZJUlRVQUwgaXMgZW5hYmxlZCwgYmVjYXVzZQo+IF9fcGFfc3ltYm9sKCkgZm9yd2FyZHMgdG8g
X19waHlzX2FkZHJfc3ltYm9sKCksIGFuZCBfX3BoeXNfYWRkcl9zeW1ib2woKQo+IGNoZWNrcyBh
Z2FpbnN0IHRoZSBhYnNvbHV0ZSBrZXJuZWwgc3RhcnQvZW5kIGFkZHJlc3MuCj4KPiBGaXggdGhp
cyBieSBkaXJlY3RseSB1c2luZyB0aGUgdW5kZXJseWluZyBrZXJuZWxfbWFwcGluZ192YV90b19w
YSgpLgoKCkknZCByYXRoZXIgZml4IF9fcGh5c19hZGRyX3N5bWJvbCBzbyB0aGF0IHdlIGNhbiB1
c2UgX19wYV9zeW1ib2wgYW5kIAp0aGVuIHRha2UgYWR2YW50YWdlIG9mIHRoZSBhZGRyZXNzIHJh
bmdlIGNoZWNrLiBJbnN0ZWFkIG9mIHVzaW5nIF9lbmQgaW4gCnBoeXNfYWRkcl9zeW1ib2wsIHdl
IGhhdmUgYWNjZXNzIHRvIHRoZSBzaXplIG9mIHRoZSBrZXJuZWwgbWFwcGluZywgc28gCndlIGNv
dWxkIGRvIHNvbWV0aGluZyBsaWtlIHRoYXQ6CgpkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9tbS9w
aHlzYWRkci5jIGIvYXJjaC9yaXNjdi9tbS9waHlzYWRkci5jCmluZGV4IGY5ODFiMWY5NWZhMC4u
MTUwNjkxYWVmMDU4IDEwMDY0NAotLS0gYS9hcmNoL3Jpc2N2L21tL3BoeXNhZGRyLmMKKysrIGIv
YXJjaC9yaXNjdi9tbS9waHlzYWRkci5jCkBAIC0yMiw3ICsyMiw3IEBAIEVYUE9SVF9TWU1CT0wo
X192aXJ0X3RvX3BoeXMpOwogwqBwaHlzX2FkZHJfdCBfX3BoeXNfYWRkcl9zeW1ib2wodW5zaWdu
ZWQgbG9uZyB4KQogwqB7CiDCoMKgwqDCoMKgwqDCoCB1bnNpZ25lZCBsb25nIGtlcm5lbF9zdGFy
dCA9IGtlcm5lbF9tYXAudmlydF9hZGRyOwotwqDCoMKgwqDCoMKgIHVuc2lnbmVkIGxvbmcga2Vy
bmVsX2VuZCA9ICh1bnNpZ25lZCBsb25nKV9lbmQ7CivCoMKgwqDCoMKgwqAgdW5zaWduZWQgbG9u
ZyBrZXJuZWxfZW5kID0ga2VybmVsX21hcC52aXJ0X2FkZHIgKyBrZXJuZWxfbWFwLnNpemU7Cgog
wqDCoMKgwqDCoMKgwqAgLyoKIMKgwqDCoMKgwqDCoMKgwqAgKiBCb3VuZGFyeSBjaGVja2luZyBh
Z2luc3QgdGhlIGtlcm5lbCBpbWFnZSBtYXBwaW5nLgoKVGhhbmtzLAoKQWxleAoKPgo+IEZpeGVz
OiBhMzU3MDdjM2Q4NTAgKCJyaXNjdjogYWRkIG1lbW9yeS10eXBlIGVycmF0YSBmb3IgVC1IZWFk
IikKPiBTaWduZWQtb2ZmLWJ5OiBTYW11ZWwgSG9sbGFuZCA8c2FtdWVsQHNob2xsYW5kLm9yZz4K
PiAtLS0KPgo+ICAgYXJjaC9yaXNjdi9lcnJhdGEvdGhlYWQvZXJyYXRhLmMgfCA1ICsrKy0tCj4g
ICAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+Cj4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jIGIvYXJjaC9yaXNjdi9l
cnJhdGEvdGhlYWQvZXJyYXRhLmMKPiBpbmRleCAyMDJjODNmNjc3YjIuLjgzMTc0ZjEzNzgzZSAx
MDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2VycmF0YS90aGVhZC9lcnJhdGEuYwo+ICsrKyBiL2Fy
Y2gvcmlzY3YvZXJyYXRhL3RoZWFkL2VycmF0YS5jCj4gQEAgLTc2LDggKzc2LDkgQEAgdm9pZCBf
X2luaXRfb3JfbW9kdWxlIHRoZWFkX2VycmF0YV9wYXRjaF9mdW5jKHN0cnVjdCBhbHRfZW50cnkg
KmJlZ2luLCBzdHJ1Y3QgYWwKPiAgIAkJaWYgKGNwdV9yZXFfZXJyYXRhICYgdG1wKSB7Cj4gICAJ
CQkvKiBPbiB2bS1hbHRlcm5hdGl2ZXMsIHRoZSBtbXUgaXNuJ3QgcnVubmluZyB5ZXQgKi8KPiAg
IAkJCWlmIChzdGFnZSA9PSBSSVNDVl9BTFRFUk5BVElWRVNfRUFSTFlfQk9PVCkKPiAtCQkJCW1l
bWNweSgodm9pZCAqKV9fcGFfc3ltYm9sKGFsdC0+b2xkX3B0ciksCj4gLQkJCQkgICAgICAgKHZv
aWQgKilfX3BhX3N5bWJvbChhbHQtPmFsdF9wdHIpLCBhbHQtPmFsdF9sZW4pOwo+ICsJCQkJbWVt
Y3B5KCh2b2lkICopa2VybmVsX21hcHBpbmdfdmFfdG9fcGEoKHVuc2lnbmVkIGxvbmcpYWx0LT5v
bGRfcHRyKSwKPiArCQkJCSAgICAgICAodm9pZCAqKWtlcm5lbF9tYXBwaW5nX3ZhX3RvX3BhKCh1
bnNpZ25lZCBsb25nKWFsdC0+YWx0X3B0ciksCj4gKwkJCQkgICAgICAgYWx0LT5hbHRfbGVuKTsK
PiAgIAkJCWVsc2UKPiAgIAkJCQlwYXRjaF90ZXh0X25vc3luYyhhbHQtPm9sZF9wdHIsIGFsdC0+
YWx0X3B0ciwgYWx0LT5hbHRfbGVuKTsKPiAgIAkJfQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
