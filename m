Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D114C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 12:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hpBQWfnA8xTr8GVkNmnVasnWfiCIs09AS7wKxoGuKe8=; b=VRidzpM3ncXFcw
	1PJUjDGiuTflO3+G0exyxJ1LYRkv7YY5ocxZCNWyF80EXOAVZL0A1HCCt0zOrEIXCAlBwqmWCklnP
	Y4NJ8O7mC+CozhNTmWKuLjYekLlUnbGSM6jYqSNJaagAYW3G34xe3xH4maAhVBE+0CN2ioOl6T66M
	yd7AtensY3nVdU9kxKGWmuTJxDNCVmCTh6oeIv6gw+AjSHHtVsrcjGiCuXgGH9KrGYFi39XH5wgmU
	hqSIL5F5tOgFHt0SRrdDl2tsEo4jnI2/aEdqMYqsf8y78+0cmPBUvZ6Bd1FEg+aqkPo5rO/Hi58mS
	R9HQ2iH5dnZLQ0uZWDBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiLY-002DvR-BB; Thu, 02 Mar 2023 12:47:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXiLR-002DsR-RO; Thu, 02 Mar 2023 12:47:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 55C2461569;
	Thu,  2 Mar 2023 12:47:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 148D2C433D2;
	Thu,  2 Mar 2023 12:47:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677761256;
	bh=qxXTnDSLnDzW9XAyEfZfFJ17v1GiXAfCisIZtfQIIPo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=OYcpprr9dhQKjHmcVs7d8egim+jJLpW13T/wP/TIGqikCONYhmOcc8NlPT9/lGrqO
	 x+oq1UUOUVKsrd3KgH7aUCR/hQNjkJ0+GIs6mZsn046YcJ/5+GGah2vhBD3oIauTop
	 XghD8GAhousLG9vCqz+d5wP3ly7DlN1IX1ivUUQXMyV7Au1kQ1hiXaU6J865LDzLqt
	 /8gz1ldt8wIOU5899UKyjt9lWyfxdkqNtbctf25DFViwrEM2lb/vuQaXh+infWZIDM
	 VAQvFd9Gf25AQS5yYJ21j+askqMYM4JizbOHYwkWad5dxjUe1nqAtVC/zGLBvt6VWd
	 QXBfZZJE9ly8g==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com, Kees
 Cook <keescook@chromium.org>, Nick Knight <nick.knight@sifive.com>, Andrew
 Bresticker <abrestic@rivosinc.com>, vineetg@rivosinc.com, Al Viro
 <viro@zeniv.linux.org.uk>, Vincent Chen <vincent.chen@sifive.com>, Conor
 Dooley <conor.dooley@microchip.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Guo Ren <guoren@kernel.org>, Eric Biederman <ebiederm@xmission.com>, Andy
 Chiu <andy.chiu@sifive.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 greentime.hu@sifive.com, Zong Li <zong.li@sifive.com>, Heiko Stuebner
 <heiko@sntech.de>
Subject: Re: [PATCH -next v14 14/19] riscv: signal: Report signal frame size
 to userspace via auxv
In-Reply-To: <20230224170118.16766-15-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-15-andy.chiu@sifive.com>
Date: Thu, 02 Mar 2023 13:47:33 +0100
Message-ID: <877cvz48wq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_044738_047864_3076BDB2 
X-CRM114-Status: GOOD (  23.97  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBGcm9tOiBWaW5jZW50
IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+Cj4gVGhlIHZlY3RvciByZWdpc3RlciBi
ZWxvbmdzIHRvIHRoZSBzaWduYWwgY29udGV4dC4gVGhleSBuZWVkIHRvIGJlIHN0b3JlZAo+IGFu
ZCByZXN0b3JlZCBhcyBlbnRlcmluZyBhbmQgbGVhdmluZyB0aGUgc2lnbmFsIGhhbmRsZXIuIEFj
Y29yZGluZyB0byB0aGUKPiBWLWV4dGVuc2lvbiBzcGVjaWZpY2F0aW9uLCB0aGUgbWF4aW11bSBs
ZW5ndGggb2YgdGhlIHZlY3RvciByZWdpc3RlcnMgY2FuCj4gYmUgMl4oWExFTi0xKS4gSGVuY2Us
IGlmIHVzZXJzcGFjZSByZWZlcnMgdG8gdGhlIE1JTlNJR1NUS1NaIHRvIGNyZWF0ZSBhCj4gc2ln
ZnJhbWUsIGl0IG1heSBub3QgYmUgZW5vdWdoLiBUbyByZXNvbHZlIHRoaXMgcHJvYmxlbSwgdGhp
cyBwYXRjaCByZWZlcnMKPiB0byB0aGUgY29tbWl0IDk0YjA3YzFmOGMzOWMKPiAoImFybTY0OiBz
aWduYWw6IFJlcG9ydCBzaWduYWwgZnJhbWUgc2l6ZSB0byB1c2Vyc3BhY2UgdmlhIGF1eHYiKSB0
byBlbmFibGUKPiB1c2Vyc3BhY2UgdG8ga25vdyB0aGUgbWluaW11bSByZXF1aXJlZCBzaWdmcmFt
ZSBzaXplIHRocm91Z2ggdGhlIGF1eGlsaWFyeQo+IHZlY3RvciBhbmQgdXNlIGl0IHRvIGFsbG9j
YXRlIGVub3VnaCBtZW1vcnkgZm9yIHNpZ25hbCBjb250ZXh0Lgo+Cj4gTm90ZSB0aGF0IGF1eHYg
YWx3YXlzIHJlcG9ydHMgc2l6ZSBvZiB0aGUgc2lnZnJhbWUgYXMgaWYgViBleGlzdHMgZm9yCj4g
YWxsIHN0YXJ0aW5nIHByb2Nlc3Nlcywgd2hlbmV2ZXIgdGhlIGtlcm5lbCBoYXMgQ09ORklHX1JJ
U0NWX0lTQV9WLiBUaGUKPiByZWFzb24gaXMgdGhhdCB1c2VycyB1c3VhbGx5IHJlZmVyZW5jZSB0
aGlzIHZhbHVlIHRvIGFsbG9jYXRlIGFuCj4gYWx0ZXJuYXRpdmUgc2lnbmFsIHN0YWNrLCBhbmQg
dGhlIHVzZXIgbWF5IHVzZSBWIGFueXRpbWUuIFNvIHRoZSB1c2VyCj4gbXVzdCByZXNlcnZlIGEg
c3BhY2UgZm9yIFYtY29udGV4dCBpbiBzaWdmcmFtZSBpbiBjYXNlIHRoYXQgdGhlIHNpZ25hbAo+
IGhhbmRsZXIgaW52b2tlcyBhZnRlciB0aGUga2VybmVsIGFsbG9jYXRpbmcgVi4KPgo+IFNpZ25l
ZC1vZmYtYnk6IEdyZWVudGltZSBIdSA8Z3JlZW50aW1lLmh1QHNpZml2ZS5jb20+Cj4gU2lnbmVk
LW9mZi1ieTogVmluY2VudCBDaGVuIDx2aW5jZW50LmNoZW5Ac2lmaXZlLmNvbT4KPiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+IC0tLQo+ICBhcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL2VsZi5oICAgICAgICAgfCAgOSArKysrKysrKysKPiAgYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaCAgIHwgIDIgKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRl
L3VhcGkvYXNtL2F1eHZlYy5oIHwgIDEgKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYyAg
ICAgICAgICAgfCAyMCArKysrKysrKysrKysrKystLS0tLQo+ICA0IGZpbGVzIGNoYW5nZWQsIDI3
IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNj
di9pbmNsdWRlL2FzbS9lbGYuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vZWxmLmgKPiBpbmRl
eCAzMGU3ZDI0NTU5NjAuLmNhMjNjNGY2YzQ0MCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL2VsZi5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9lbGYuaAo+IEBA
IC0xMDUsNiArMTA1LDE1IEBAIGRvIHsJCQkJCQkJCVwKPiAgCQlnZXRfY2FjaGVfc2l6ZSgzLCBD
QUNIRV9UWVBFX1VOSUZJRUQpKTsJCVwKPiAgCU5FV19BVVhfRU5UKEFUX0wzX0NBQ0hFR0VPTUVU
UlksCQkJXAo+ICAJCWdldF9jYWNoZV9nZW9tZXRyeSgzLCBDQUNIRV9UWVBFX1VOSUZJRUQpKTsJ
XAo+ICsJLyoJCQkJCQkJIFwKPiArCSAqIFNob3VsZCBhbHdheXMgYmUgbm9uemVybyB1bmxlc3Mg
dGhlcmUncyBhIGtlcm5lbCBidWcuIFwKPiArCSAqIElmIHdlIGhhdmVuJ3QgZGV0ZXJtaW5lZCBh
IHNlbnNpYmxlIHZhbHVlIHRvIGdpdmUgdG8JIFwKPiArCSAqIHVzZXJzcGFjZSwgb21pdCB0aGUg
ZW50cnk6CQkJCSBcCj4gKwkgKi8JCQkJCQkJIFwKPiArCWlmIChsaWtlbHkoc2lnbmFsX21pbnNp
Z3N0a3N6KSkJCQkJIFwKPiArCQlORVdfQVVYX0VOVChBVF9NSU5TSUdTVEtTWiwgc2lnbmFsX21p
bnNpZ3N0a3N6KTsgXAo+ICsJZWxzZQkJCQkJCQkgXAo+ICsJCU5FV19BVVhfRU5UKEFUX0lHTk9S
RSwgMCk7CQkJIFwKPiAgfSB3aGlsZSAoMCkKPiAgI2RlZmluZSBBUkNIX0hBU19TRVRVUF9BRERJ
VElPTkFMX1BBR0VTCj4gIHN0cnVjdCBsaW51eF9iaW5wcm07Cj4gZGlmZiAtLWdpdCBhL2FyY2gv
cmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3By
b2Nlc3Nvci5oCj4gaW5kZXggZjBkZGY2OTFhYzVlLi4zOGRlZDhjNWYyMDcgMTAwNjQ0Cj4gLS0t
IGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS9wcm9jZXNzb3IuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiBAQCAtNyw2ICs3LDcgQEAKPiAgI2RlZmluZSBfQVNN
X1JJU0NWX1BST0NFU1NPUl9ICj4gIAo+ICAjaW5jbHVkZSA8bGludXgvY29uc3QuaD4KPiArI2lu
Y2x1ZGUgPGxpbnV4L2NhY2hlLmg+Cj4gIAo+ICAjaW5jbHVkZSA8dmRzby9wcm9jZXNzb3IuaD4K
PiAgCj4gQEAgLTgxLDYgKzgyLDcgQEAgaW50IHJpc2N2X29mX3BhcmVudF9oYXJ0aWQoc3RydWN0
IGRldmljZV9ub2RlICpub2RlLCB1bnNpZ25lZCBsb25nICpoYXJ0aWQpOwo+ICBleHRlcm4gdm9p
ZCByaXNjdl9maWxsX2h3Y2FwKHZvaWQpOwo+ICBleHRlcm4gaW50IGFyY2hfZHVwX3Rhc2tfc3Ry
dWN0KHN0cnVjdCB0YXNrX3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYyk7Cj4g
IAo+ICtleHRlcm4gdW5zaWduZWQgbG9uZyBzaWduYWxfbWluc2lnc3Rrc3ogX19yb19hZnRlcl9p
bml0Owo+ICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICovCj4gIAo+ICAjZW5kaWYgLyogX0FTTV9S
SVNDVl9QUk9DRVNTT1JfSCAqLwo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vYXV4dmVjLmggYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKPiBp
bmRleCBmYjE4N2EzM2NlNTguLjJjNTBkOWNhMzBlMCAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2
L2luY2x1ZGUvdWFwaS9hc20vYXV4dmVjLmgKPiArKysgYi9hcmNoL3Jpc2N2L2luY2x1ZGUvdWFw
aS9hc20vYXV4dmVjLmgKPiBAQCAtMzUsNSArMzUsNiBAQAo+ICAKPiAgLyogZW50cmllcyBpbiBB
UkNIX0RMSU5GTyAqLwo+ICAjZGVmaW5lIEFUX1ZFQ1RPUl9TSVpFX0FSQ0gJOQo+ICsjZGVmaW5l
IEFUX01JTlNJR1NUS1NaIDUxCgpQcm9wZXIgdGFiIGFsaWdubWVudCBtaXNzaW5nLgoKPiAgCj4g
ICNlbmRpZiAvKiBfVUFQSV9BU01fUklTQ1ZfQVVYVkVDX0ggKi8KPiBkaWZmIC0tZ2l0IGEvYXJj
aC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMgYi9hcmNoL3Jpc2N2L2tlcm5lbC9zaWduYWwuYwo+IGlu
ZGV4IDc2YzA0ODBlZTRjZC4uYWE4ZWU5NWRlZTJkIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
a2VybmVsL3NpZ25hbC5jCj4gKysrIGIvYXJjaC9yaXNjdi9rZXJuZWwvc2lnbmFsLmMKPiBAQCAt
MjEsNiArMjEsOCBAQAo+ICAjaW5jbHVkZSA8YXNtL3ZlY3Rvci5oPgo+ICAjaW5jbHVkZSA8YXNt
L2Nzci5oPgo+ICAKPiArdW5zaWduZWQgbG9uZyBfX3JvX2FmdGVyX2luaXQgc2lnbmFsX21pbnNp
Z3N0a3N6OwoKTml0OiBfX3JvX2FmdGVyX2luaXQgcGxhY2VtZW50IGluc2lzdGVudCB3aXRoIHRo
ZSBkZWNsYXJhdGlvbiBhYm92ZS4KCgpCasO2cm4KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
