Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D38AC77B7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 16:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EeENO9SwCx0lO/l8UdjDVCaUqG7YtWrSsmBRbYrhxQY=; b=YKyLgIWneMdpNb
	xzPUWOZBpbVIRAodZTow6Q0WOGkLXplr+l+WEgX9KDP3Ie30Km8y2HSmDItqma3NxTAOr/XX89aIZ
	LfL/z9RdAvHPJbbLczyWnXXc1vvGjuidw9ESi2i1eEZFqbJ2QIAstDXx37K9jBeozuiwy7jGDOi+Q
	14+OPKPbBvSzQ8XHG77b0nhuHCc/FeLwR3EKee4sHbWIBlJUcda8mtctTUxJUyx7X78KuY4orUxTr
	bOuws+kWt3hhGj0o/e7i1DI6tvbnf2MNkeWnx6DpieXbJYldqMNYy2AqQj7PRaT0uAW4JQ2mnQcSM
	1hWSwSvzCOlVNNMhYzTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Sn-00000008yUX-3TLq;
	Wed, 02 Jul 2025 16:37:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWzLt-00000008mic-3NrO
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 15:26:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6310646157;
	Wed,  2 Jul 2025 15:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82A9DC4CEEF;
	Wed,  2 Jul 2025 15:26:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751469985;
	bh=6FGi4IEXFYBzu4fdh1wRceFY2PzvofwOUBBMZuvdo+4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TYysf/XGP8UP3XV27Ye7UxMKpGa22OsNG0vhuMOHR+dmAdWzz8r8/bMs2rnjEPKEL
	 KNdpNUnqcLO5Httn8Wrxu0ecJLIh9lmnMFGQYkQI76pdQMifuh4gvim68NUaLuixCd
	 l0OOgAi2/bwbB2Twb8/PoEGzMrKbDUtyiGj3HqVz91Wh6uNhZpWQJyxB8lvubQgHuj
	 XP4TAwPXoemmEHWQoT25cZ5U2kyaFSpAUZrjmOXO59bcK/GCV+OPl76ILeyZ1CcyPU
	 hCIA4FcIgJoKiG/PMAj+ppZyzkoHFOm5T0hnhNAJre4YgX2Jxmgl6WGK8E16p6BuI0
	 tmghfMamJW+GA==
Date: Wed, 2 Jul 2025 16:26:18 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250702152618.GU10134@google.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
 <20250627142309.1444135-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250627142309.1444135-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_082625_887846_666F8778 
X-CRM114-Status: GOOD (  25.33  )
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

T24gRnJpLCAyNyBKdW4gMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gQWxsIGRldmljZXMgc3Vw
cG9ydGVkIGJ5IHNpbXBsZSBNRkQgdXNlIHRoZSBzYW1lIDgtYml0IHJlZ2lzdGVyCj4gOC1iaXQg
dmFsdWUgcmVnbWFwIGNvbmZpZ3VyYXRpb24uICBUaGVyZSBpcyBhbiBvcHRpb24gYXZhaWxhYmxl
Cj4gZm9yIGEgZGV2aWNlIHRvIHNwZWNpZnkgYSBjdXN0b21lIGNvbmZpZ3VyYXRpb24sIGJ1dCBu
byBleGlzdGluZwo+IGRldmljZSB1c2VzIGl0Lgo+IAo+IExlZSBKb25lcyBzdWdnZXN0ZWQgbW9k
aWZ5aW5nIHRoZSBzaW1wbGUgTUZEIGltcGxlbWVudGF0aW9uIHRvCj4gcmVtb3ZlIHRoZSBnZW5l
cmFsaXR5IG9mIHRoZSBmdWxsIHJlZ21hcCBjb25maWd1cmF0aW9uIGFuZCBhZGQgYQo+IG1heF9y
ZWdpc3RlciB2YWx1ZSB0byB0aGUgc2ltcGxlX21mZF9kYXRhIHN0cnVjdHVyZS4gIFRoaXMgY2Fu
Cj4gYmUgdXNlZCBpbiB0aGUgcmVnbWFwIGNvbmZpZ3VyYXRpb24gdG8gbGltaXQgdGhlIHZhbGlk
IHJlZ2lzdGVyCj4gYWRkcmVzc2VzIGlmIGRlc2lyZWQuICBJdCdzIHNpbXBsZXIsIGFuZCBjb3Zl
cnMgYWxsIGV4aXN0aW5nIGFuZAo+IGFudGljaXBhdGVkIGRldmljZSB0eXBlcy4KCldvYWgsIG5v
dCBsaWtlIHRoaXMuICBJIHdhbnRlZCB0byBtYWtlIHRoZSBmcmFtZXdvcmsgX21vcmVfIGZsZXhp
YmxlLgoKSnVzdCB0aGlzIHNob3VsZCBkbyB3aGF0IHlvdSB3YW50OgoKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMgYi9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5j
CmluZGV4IDIyMTU5OTEzYmVhMC4uZjQzYmUxMGMwZTYwIDEwMDY0NAotLS0gYS9kcml2ZXJzL21m
ZC9zaW1wbGUtbWZkLWkyYy5jCisrKyBiL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmMKQEAg
LTQ0LDYgKzQ0LDkgQEAgc3RhdGljIGludCBzaW1wbGVfbWZkX2kyY19wcm9iZShzdHJ1Y3QgaTJj
X2NsaWVudCAqaTJjKQogICAgICAgIGVsc2UKICAgICAgICAgICAgICAgIHJlZ21hcF9jb25maWcg
PSBzaW1wbGVfbWZkX2RhdGEtPnJlZ21hcF9jb25maWc7CiAKKyAgICAgICBpZiAoc2ltcGxlX21m
ZF9kYXRhLT5tYXhfcmVnaXN0ZXIpCisgICAgICAgICAgICAgICByZWdtYXBfY29uZmlnLT5tYXhf
cmVnaXN0ZXIgPSBzaW1wbGVfbWZkX2RhdGEtPm1heF9yZWdpc3RlcjsKKwogICAgICAgIHJlZ21h
cCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGkyYywgcmVnbWFwX2NvbmZpZyk7CiAgICAgICAgaWYg
KElTX0VSUihyZWdtYXApKQogICAgICAgICAgICAgICAgcmV0dXJuIFBUUl9FUlIocmVnbWFwKTsK
ClBsdXMgdGhlIG9uZSBsaW5lIGNoYW5nZSBpbiBkcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5o
LgoKPiBTaWduZWQtb2ZmLWJ5OiBBbGV4IEVsZGVyIDxlbGRlckByaXNjc3Rhci5jb20+Cj4gU3Vn
Z2VzdGVkLWJ5OiBMZWUgSm9uZXMgPGxlZUBrZXJuZWwub3JnPgo+IC0tLQo+IHY2OiAtIE5ldyBw
YXRjaCwgY2hhbmdpbmcgdGhlIHNpbXBsZSBNRkQgZnVuY3Rpb25hbGl0eQo+IAo+ICBkcml2ZXJz
L21mZC9zaW1wbGUtbWZkLWkyYy5jIHwgMTggKysrKysrLS0tLS0tLS0tLS0tCj4gIGRyaXZlcnMv
bWZkL3NpbXBsZS1tZmQtaTJjLmggfCAgMiArLQo+ICAyIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0
aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWZkL3Np
bXBsZS1tZmQtaTJjLmMgYi9kcml2ZXJzL21mZC9zaW1wbGUtbWZkLWkyYy5jCj4gaW5kZXggMjIx
NTk5MTNiZWEwMy4uYzFkYzMxNWQ0NGRjZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL21mZC9zaW1w
bGUtbWZkLWkyYy5jCj4gKysrIGIvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuYwo+IEBAIC0y
NCwyNyArMjQsMjEgQEAKPiAgCj4gICNpbmNsdWRlICJzaW1wbGUtbWZkLWkyYy5oIgo+ICAKPiAt
c3RhdGljIGNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnIHJlZ21hcF9jb25maWdfOHJfOHYgPSB7
Cj4gLQkucmVnX2JpdHMgPSA4LAo+IC0JLnZhbF9iaXRzID0gOCwKPiAtfTsKPiAtCj4gIHN0YXRp
YyBpbnQgc2ltcGxlX21mZF9pMmNfcHJvYmUoc3RydWN0IGkyY19jbGllbnQgKmkyYykKPiAgewo+
ICAJY29uc3Qgc3RydWN0IHNpbXBsZV9tZmRfZGF0YSAqc2ltcGxlX21mZF9kYXRhOwo+IC0JY29u
c3Qgc3RydWN0IHJlZ21hcF9jb25maWcgKnJlZ21hcF9jb25maWc7Cj4gKwlzdHJ1Y3QgcmVnbWFw
X2NvbmZpZyByZWdtYXBfY29uZmlnID0geyB9Owo+ICAJc3RydWN0IHJlZ21hcCAqcmVnbWFwOwo+
ICAJaW50IHJldDsKPiAgCj4gIAlzaW1wbGVfbWZkX2RhdGEgPSBkZXZpY2VfZ2V0X21hdGNoX2Rh
dGEoJmkyYy0+ZGV2KTsKPiAgCj4gLQkvKiBJZiBubyByZWdtYXBfY29uZmlnIGlzIHNwZWNpZmll
ZCwgdXNlIHRoZSBkZWZhdWx0IDhyZWcgYW5kIDh2YWwgYml0cyAqLwo+IC0JaWYgKCFzaW1wbGVf
bWZkX2RhdGEgfHwgIXNpbXBsZV9tZmRfZGF0YS0+cmVnbWFwX2NvbmZpZykKPiAtCQlyZWdtYXBf
Y29uZmlnID0gJnJlZ21hcF9jb25maWdfOHJfOHY7Cj4gLQllbHNlCj4gLQkJcmVnbWFwX2NvbmZp
ZyA9IHNpbXBsZV9tZmRfZGF0YS0+cmVnbWFwX2NvbmZpZzsKPiArCXJlZ21hcF9jb25maWcucmVn
X2JpdHMgPSA4Owo+ICsJcmVnbWFwX2NvbmZpZy52YWxfYml0cyA9IDg7Cj4gKwlpZiAoc2ltcGxl
X21mZF9kYXRhKQo+ICsJCXJlZ21hcF9jb25maWcubWF4X3JlZ2lzdGVyID0gc2ltcGxlX21mZF9k
YXRhLT5tYXhfcmVnaXN0ZXI7Cj4gIAo+IC0JcmVnbWFwID0gZGV2bV9yZWdtYXBfaW5pdF9pMmMo
aTJjLCByZWdtYXBfY29uZmlnKTsKPiArCXJlZ21hcCA9IGRldm1fcmVnbWFwX2luaXRfaTJjKGky
YywgJnJlZ21hcF9jb25maWcpOwo+ICAJaWYgKElTX0VSUihyZWdtYXApKQo+ICAJCXJldHVybiBQ
VFJfRVJSKHJlZ21hcCk7Cj4gIAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL21mZC9zaW1wbGUtbWZk
LWkyYy5oIGIvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1pMmMuaAo+IGluZGV4IDdjYjJiZGQzNDdk
OTcuLjQxMjFmZTFiYzFkNzAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9tZmQvc2ltcGxlLW1mZC1p
MmMuaAo+ICsrKyBiL2RyaXZlcnMvbWZkL3NpbXBsZS1tZmQtaTJjLmgKPiBAQCAtMjQsOSArMjQs
OSBAQAo+ICAjaW5jbHVkZSA8bGludXgvcmVnbWFwLmg+Cj4gIAo+ICBzdHJ1Y3Qgc2ltcGxlX21m
ZF9kYXRhIHsKPiAtCWNvbnN0IHN0cnVjdCByZWdtYXBfY29uZmlnICpyZWdtYXBfY29uZmlnOwo+
ICAJY29uc3Qgc3RydWN0IG1mZF9jZWxsICptZmRfY2VsbDsKPiAgCXNpemVfdCBtZmRfY2VsbF9z
aXplOwo+ICsJdW5zaWduZWQgaW50IG1heF9yZWdpc3RlcjsKPiAgfTsKPiAgCj4gICNlbmRpZiAv
KiBfX01GRF9TSU1QTEVfTUZEX0kyQ19IICovCj4gLS0gCj4gMi40NS4yCj4gCgotLSAKTGVlIEpv
bmVzIFvmnY7nkLzmlq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
