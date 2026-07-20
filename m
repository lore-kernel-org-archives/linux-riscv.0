Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7189C44520
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Jul 2026 17:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cBPSEuqSX//BFKIQlZhEL2bvgMBdo8yHSlUIZ2aP4JI=; b=XrQjotgNejXZpQ
	zqTsy23mSZwwnQLCZyq0/1GZyVmeKa0AKRVDUK0t9xIDKKBG3J8RZSAtxqTGexCNNvg+GqYB/vD6R
	Pu/WYexEHuE3i4mvUnIRabUFqdH9xT+RoCWOMFqzIwqY/k6La7Jt1GlBwyq8CHAT8wJ502OzEwdkv
	sMxSZhhCpkdrM7c1ekxTije0g59J/8NnLUAq2TYL2hksAbUvYua5Z4lDspiJ01tJ+g6dgda58E93t
	dKeYicRB0Rip52jFji56QnEHXBkUPhR02CO6CBnVhMzCj+I0mKzJ22mYzKbrMM0Ib3koO5nAiJrNZ
	G8S6awtoWmeYkosrIBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrnq-00000007XQO-0B1t;
	Mon, 20 Jul 2026 17:29:18 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlrnn-00000007XPa-0CW6
	for linux-riscv@lists.infradead.org;
	Mon, 20 Jul 2026 17:29:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1784568546; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dcgkDqZzH02+3rhs8JhlEu+dt9qN+QvrOnTuPkj0evGWoyk9rKJ1nWpmYLIFbyx75bKsYJZ5FLh473qLxbAn2J63KZuAG1a7Lc4/C8EAkaLi6Rlo8ibUh6z/tKqKuPHofeUbk5K0l5QfmzRS94cvHIci55a5BPncvgB56LWpNS4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1784568546; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=U30vcVgNDbL6Q7ialsGqcvS1rDzUWs+db9ulvIMrdnk=; 
	b=LdFulXqgU/HJBxf8Z9uHkJf69EzM692RBeThzO6kHYg2bdI/ALtHirAxmbrAtR69vQsNVk1KGEqP0lutcmMiPzzM/3ZvQJeGTjwgjikXs/9Prpv3DV8jQw+aY0dTTVVFNNNyiyeZ3gTHdzd6DPV5HkZ8RjkLV3HWCYQuqFEJ/WI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1784568545;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=U30vcVgNDbL6Q7ialsGqcvS1rDzUWs+db9ulvIMrdnk=;
	b=Dykojnr+V8QoR0i6IONblIbtqKkiHIVnyMz7hEFux/YVZX1RDnTB6qxP6xvZKvWc
	klE6Z0uz7vubwnOiiZCwjbsr2U7q7OL6nyCAcQ0uOJ+Ph9O1vBfCwAKAzeQBjkRwYhu
	SPnXAj4GwKSIzmOCG5+z5hwhsPLzAJyHPERGG/tv9KtKkeuWMekxldG4v7oM9mVeiUt
	7JHnxGaW3Sg/CMEhvsdnymYUtGlm6RweStkPW9lzscjW647eDr2B2TPdWEni63d1vk/
	lAugkMF9o6Hhb7xwy1IrxMAMSy1rnoTPJRuGnmrp8nCgfu+qA7SSbqkwOfM36wZYF0h
	VcCwYTwSjg==
Received: by mx.zohomail.com with SMTPS id 1784568543822170.23306213464105;
	Mon, 20 Jul 2026 10:29:03 -0700 (PDT)
Message-ID: <cb14e077de1722d1c36cd0bd877952289dc90abb.camel@icenowy.me>
Subject: Re: [PATCH v2 4/5] riscv: dts: thead: Add IO labels for the IO
 expansion on I2C1
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, Rob Herring	
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, MoeLeak <i@leak.moe>, Paul Walmsley
 <pjw@kernel.org>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Emil Renner
 Berthing	 <emil.renner.berthing@canonical.com>
Date: Tue, 21 Jul 2026 01:28:58 +0800
In-Reply-To: <al5TWhx7pLIZguAc@gen8>
References: <20260714074515.1959352-1-zhengxingda@iscas.ac.cn>
	 <20260714074515.1959352-5-zhengxingda@iscas.ac.cn> <allEg/A+Gt/em0Hs@x1>
	 <1E3154C2-B5BE-46FD-BBFC-87E56FAE3AFE@icenowy.me> <al5TWhx7pLIZguAc@gen8>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_102915_160296_10113401 
X-CRM114-Status: GOOD (  22.63  )
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

5ZyoIDIwMjYtMDctMjDkuIDnmoQgMDk6NTYgLTA3MDDvvIxEcmV3IEZ1c3RpbmnlhpnpgZPvvJoK
PiBPbiBGcmksIEp1bCAxNywgMjAyNiBhdCAxMjoxMToyM1BNICswODAwLCBJY2Vub3d5IFpoZW5n
IHdyb3RlOgo+ID4gCj4gPiAKPiA+IOS6jiAyMDI25bm0N+aciDE35pelIEdNVCswODowMCAwNDo1
MjoxOe+8jERyZXcgRnVzdGluaSA8ZnVzdGluaUBrZXJuZWwub3JnPgo+ID4g5YaZ6YGT77yaCj4g
PiA+IE9uIFR1ZSwgSnVsIDE0LCAyMDI2IGF0IDAzOjQ1OjE0UE0gKzA4MDAsIEljZW5vd3kgWmhl
bmcgd3JvdGU6Cj4gPiA+ID4gRnJvbTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVy
LmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+Cj4gPiA+ID4gCj4gPiA+ID4gQWRkIGxhYmVscyBmb3Ig
R1BJT3Mgb24gdGhlIElPIGV4cGFuc2lvbiBjaGlwIG9uIHRoZSBJMkMxIGJ1cy4KPiA+ID4gPiAK
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBFbWlsIFJlbm5lciBCZXJ0aGluZwo+ID4gPiA+IDxlbWls
LnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29tPgo+ID4gPiA+IFtJY2Vub3d5OiBTcGxpdHRl
ZCBvZmYgdGhlIHBhdGNoIGFkZGluZyBhbGwgMyBJTyBleHBhbnNpb25zXQo+ID4gPiA+IFNpZ25l
ZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHpoZW5neGluZ2RhQGlzY2FzLmFjLmNuPgo+ID4gPiA+
IC0tLQo+ID4gPiA+IMKgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBp
LTRhLmR0cyB8IDggKysrKysrKysKPiA+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA4IGluc2VydGlv
bnMoKykKPiA+ID4gPiAKPiA+ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90
aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gPiA+IGIvYXJjaC9yaXNjdi9ib290L2R0
cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gPiA+IGluZGV4IDc0YjEyMGM2YjA2
M2EuLjc4ZjU5NzlhNTZjMTQgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0
cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiA+ID4gPiBAQCAtMTI4LDYg
KzEyOCwxNCBAQCBpb2V4cDI6IGdwaW9AMTggewo+ID4gPiA+IMKgCQlyZWcgPSA8MHgxOD47Cj4g
PiA+ID4gwqAJCWdwaW8tY29udHJvbGxlcjsKPiA+ID4gPiDCoAkJI2dwaW8tY2VsbHMgPSA8Mj47
Cj4gPiA+ID4gKwkJZ3Bpby1saW5lLW5hbWVzID0gIiIsCj4gPiA+ID4gKwkJCQnCoCAiY2FtMF9y
ZXNldCIsCj4gPiA+ID4gKwkJCQnCoCAiY2FtMV9yZXNldCIsCj4gPiA+ID4gKwkJCQnCoCAiY2Ft
Ml9yZXNldCIsCj4gPiA+ID4gKwkJCQnCoCAid2xfaG9zdF93YWtlIiwKPiA+ID4gCj4gPiA+IEkg
YW0gbm90IHN1cmUgdGhlIGxpbmUgbmFtZSByZWFsbHkgbWF0dGVycyBhbGwgdGhhdCwgYnV0IGl0
IHNlZW1zCj4gPiA+IHRoYXQKPiA+ID4gcGluIDQgaXMgYWxzbyB1c2VkIGFzIGEgcmVzZXQgZ3Bp
bzoKPiA+IAo+ID4gVGhlICJob3N0IiBoZXJlIGlzIHN1YmplY3QsIHdoaWNoIG1lYW5zICJ0aGlz
IHBpbnMgaXMgdXNlZCBieSB0aGUKPiA+IGhvc3QgdG8gd2FrZSB0aGUgd2wiLgo+ID4gCj4gPiBN
YXliZSBJIHNob3VsZCB0YWtlIHRoZSBzY2hlbWF0aWNzIG5hbWUsICJ3bF9ob3N0X3dha2VfZGV2
Ij8gT3IgdXNlCj4gPiBhbm90aGVyIG5hbWUgb24gdGhlIHBhZ2UgZm9yIFdpLUZpLCAid2xfcmVn
X29uIj8KPiAKPiBJIHRobmsgIndsX2hvc3Rfd2FrZV9kZXYiIGlzIHNsaWdodGx5IGJldHRlciBp
biB0ZXJtcyBvZiBzZWFyY2hpbmcKPiB0aGUKPiBQREYgWzFdIGFuZCBmaW5kaW5nIHRoZSAiSU8g
RXhwYW5zaW9uIDIiIHNlY3Rpb24uIFRoaXMgaXMgbWlub3IKPiBjaGFuZ2UKPiBzbyBJIGNhbiBq
dXN0IGZpeCB1cCB3aGVuIGFwcGx5aW5nIGlmIHlvdSBhcmUgb2theSB3aXRoIHRoYXQuCgpPZiBj
b3Vyc2UgSSBhbSBva2F5IHdpdGggdGhpcy4KClRoYW5rcywKSWNlbm93eQoKPiAKPiBUaGFua3Ms
Cj4gRHJldwo+IAo+IFsxXSBodHRwczovL2RsLnNpcGVlZC5jb20vc2hhcmVVUkwvTElDSEVFL2xp
Y2hlZXBpNGEvMDJfU2NoZW1hdGljCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
