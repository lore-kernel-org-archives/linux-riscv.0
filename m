Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B341C6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g9vXFFXJbWqzWL7Z9reFIV7PgyZLS3ssELMQ78OLF7E=; b=TL32KedFS8fmSS
	Le3QvsPCZtdvDAzBP960otcuvenEZTKIAvIAzj2cVjjjIZH7sc9zuxdPAmmBbEqubHAl0iIzF1EbH
	1a/tsFodPbEHOiuDLOl0/AodXYvMy/qt4c0U3OJZdMW7GAKeMKkFgAar9dSuDjeMt5NapVRNiBW2w
	djxt0yiQ45HTjmpPr3m4/0neNlY/dEdyY8O0rJj/wTHtBndDzSc7wl0PPefm0z9ZpIsd2zz9ZVtOr
	lUyTYwP2EUAB0T8Ow5TgCfo0nkEUAUZtlcFpBJJlvkPgbZ7jnhmobX9Vyy5y1aKbUzihvgWokN1l1
	vmfosW299V9gzf9SshRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgma-001pkO-Bq; Thu, 02 Mar 2023 11:07:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXgmV-001phP-Oj; Thu, 02 Mar 2023 11:07:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id DB8FEB811F3;
	Thu,  2 Mar 2023 11:07:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF579C4339C;
	Thu,  2 Mar 2023 11:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677755244;
	bh=GcaMLRcyjV/Llc8qunx3V1WotxdaFI1BmthFPmyxbuU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Yteq9SeP3biOM7woYe5b2LNAyPhrns/cPUflYq+xpTGTL38QxKPgQj2CFRbI4tapq
	 4lwycV6NGKsv9UXi8EI+Z77ppjie0keILEm4hv5mhtntBOLfd0QW1tprY2hEaBpQFa
	 wXrWeSW3gV0S3MjqHVM+tRokRw3yKluzen1p3+oHa5eVrrNA3axysCjFmgcl2hMBn2
	 lOl7w3HODVFFbCHHU8rghxACu7nj1CkY8Ln1vlJnAzMuJHTYlGoK4WxFUI9fGmeCFO
	 o64CGn9pGtE51u4RYP3zjBffm647VMPlV1QVhaxA/rLlZBiwF8O1PsoXKtOKITyP80
	 YDBECQKB5oSRA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com,
 Jisheng Zhang <jszhang@kernel.org>, Nick Knight <nick.knight@sifive.com>,
 vineetg@rivosinc.com, "Eric W. Biederman" <ebiederm@xmission.com>, Vincent
 Chen <vincent.chen@sifive.com>, Conor Dooley <conor.dooley@microchip.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, Ruinland
 Tsai <ruinland.tsai@sifive.com>, Andy Chiu <andy.chiu@sifive.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, greentime.hu@sifive.com, Dmitry
 Vyukov <dvyukov@google.com>, Heiko Stuebner <heiko@sntech.de>
Subject: Re: [PATCH -next v14 09/19] riscv: Add task switch support for vector
In-Reply-To: <20230224170118.16766-10-andy.chiu@sifive.com>
References: <20230224170118.16766-1-andy.chiu@sifive.com>
 <20230224170118.16766-10-andy.chiu@sifive.com>
Date: Thu, 02 Mar 2023 12:07:21 +0100
Message-ID: <87v8jj4djq.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_030728_140394_484ECC9E 
X-CRM114-Status: GOOD (  15.99  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBkaWZmIC0tZ2l0IGEv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oIGIvYXJjaC9yaXNjdi9pbmNsdWRl
L2FzbS90aHJlYWRfaW5mby5oCj4gaW5kZXggZjcwNGM4ZGQ1N2UwLi45ZTI4YzAxOTkwMzAgMTAw
NjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCj4gKysrIGIv
YXJjaC9yaXNjdi9pbmNsdWRlL2FzbS90aHJlYWRfaW5mby5oCj4gQEAgLTgwLDYgKzgwLDkgQEAg
c3RydWN0IHRocmVhZF9pbmZvIHsKPiAgCS5wcmVlbXB0X2NvdW50CT0gSU5JVF9QUkVFTVBUX0NP
VU5ULAlcCj4gIH0KPiAgCj4gK3ZvaWQgYXJjaF9yZWxlYXNlX3Rhc2tfc3RydWN0KHN0cnVjdCB0
YXNrX3N0cnVjdCAqdHNrKTsKPiAraW50IGFyY2hfZHVwX3Rhc2tfc3RydWN0KHN0cnVjdCB0YXNr
X3N0cnVjdCAqZHN0LCBzdHJ1Y3QgdGFza19zdHJ1Y3QgKnNyYyk7Cj4gKwo+ICAjZW5kaWYgLyog
IV9fQVNTRU1CTFlfXyAqLwo+ICAKPiAgLyoKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9pbmNs
dWRlL2FzbS92ZWN0b3IuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vdmVjdG9yLmgKPiBpbmRl
eCA5YzAyNWYyZWZkYzMuLjgzMGY5ZDNjMzU2YiAxMDA2NDQKPiAtLS0gYS9hcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3ZlY3Rvci5oCj4gKysrIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2FzbS92ZWN0b3Iu
aAo+IEBAIC0xMCw2ICsxMCw5IEBACj4gIAo+ICAjaWZkZWYgQ09ORklHX1JJU0NWX0lTQV9WCj4g
IAo+ICsjaW5jbHVkZSA8bGludXgvc2NoZWQuaD4KPiArI2luY2x1ZGUgPGxpbnV4L3NjaGVkL3Rh
c2tfc3RhY2suaD4KPiArI2luY2x1ZGUgPGFzbS9wdHJhY2UuaD4KPiAgI2luY2x1ZGUgPGFzbS9o
d2NhcC5oPgo+ICAjaW5jbHVkZSA8YXNtL2Nzci5oPgo+ICAjaW5jbHVkZSA8YXNtL2FzbS5oPgo+
IEBAIC03NSw3ICs3OCw4IEBAIHN0YXRpYyBfX2Fsd2F5c19pbmxpbmUgdm9pZCBfX3ZzdGF0ZV9j
c3JfcmVzdG9yZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqc3JjCj4gIAkJICAgICJyIiAo
c3JjLT52Y3NyKSA6KTsKPiAgfQo+ICAKPiAtc3RhdGljIGlubGluZSB2b2lkIF9fcmlzY3Zfdl92
c3RhdGVfc2F2ZShzdHJ1Y3QgX19yaXNjdl92X2V4dF9zdGF0ZSAqc2F2ZV90bywgdm9pZCAqZGF0
YXApCj4gK3N0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUoc3RydWN0IF9f
cmlzY3Zfdl9leHRfc3RhdGUgKnNhdmVfdG8sCj4gKwkJCQkJIHZvaWQgKmRhdGFwKQoKUGxlYXNl
IGF2b2lkIGNvZGUgY2h1cm4gbGlrZSB0aGlzLi4uIAoKPiAgewo+ICAJcmlzY3Zfdl9lbmFibGUo
KTsKPiAgCV9fdnN0YXRlX2Nzcl9zYXZlKHNhdmVfdG8pOwo+IEBAIC05Myw3ICs5Nyw3IEBAIHN0
YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0YXRlX3NhdmUoc3RydWN0IF9fcmlzY3Zfdl9l
eHRfc3RhdGUgKnNhdmVfdG8sIHZvCj4gIH0KPiAgCj4gIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jp
c2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnJlc3RvcmVf
ZnJvbSwKPiAtCQkJCSAgICB2b2lkICpkYXRhcCkKPiArCQkJCQkgICAgdm9pZCAqZGF0YXApCgou
Li5hbmQgdGhpcy4KCj4gIHsKPiAgCXJpc2N2X3ZfZW5hYmxlKCk7Cj4gIAlhc20gdm9sYXRpbGUg
KAo+IEBAIC0xMTAsNiArMTE0LDM4IEBAIHN0YXRpYyBpbmxpbmUgdm9pZCBfX3Jpc2N2X3ZfdnN0
YXRlX3Jlc3RvcmUoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgKnJlc3RvcmVfCj4gIAlyaXNj
dl92X2Rpc2FibGUoKTsKPiAgfQo+ICAKPiArc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0
YXRlX3NhdmUoc3RydWN0IHRhc2tfc3RydWN0ICp0YXNrLAo+ICsJCQkJICAgICAgIHN0cnVjdCBw
dF9yZWdzICpyZWdzKQo+ICt7Cj4gKwlpZiAoKHJlZ3MtPnN0YXR1cyAmIFNSX1ZTKSA9PSBTUl9W
U19ESVJUWSkgewo+ICsJCXN0cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUgPSAmdGFz
ay0+dGhyZWFkLnZzdGF0ZTsKPiArCj4gKwkJX19yaXNjdl92X3ZzdGF0ZV9zYXZlKHZzdGF0ZSwg
dnN0YXRlLT5kYXRhcCk7Cj4gKwkJX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKPiArCX0K
PiArfQo+ICsKPiArc3RhdGljIGlubGluZSB2b2lkIHJpc2N2X3ZfdnN0YXRlX3Jlc3RvcmUoc3Ry
dWN0IHRhc2tfc3RydWN0ICp0YXNrLAo+ICsJCQkJCSAgc3RydWN0IHB0X3JlZ3MgKnJlZ3MpCj4g
K3sKPiArCWlmICgocmVncy0+c3RhdHVzICYgU1JfVlMpICE9IFNSX1ZTX09GRikgewo+ICsJCXN0
cnVjdCBfX3Jpc2N2X3ZfZXh0X3N0YXRlICp2c3RhdGUgPSAmdGFzay0+dGhyZWFkLnZzdGF0ZTsK
PiArCj4gKwkJX19yaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHZzdGF0ZSwgdnN0YXRlLT5kYXRhcCk7
Cj4gKwkJX19yaXNjdl92X3ZzdGF0ZV9jbGVhbihyZWdzKTsKPiArCX0KPiArfQo+ICsKPiArc3Rh
dGljIGlubGluZSB2b2lkIF9fc3dpdGNoX3RvX3ZlY3RvcihzdHJ1Y3QgdGFza19zdHJ1Y3QgKnBy
ZXYsCj4gKwkJCQkgICAgICBzdHJ1Y3QgdGFza19zdHJ1Y3QgKm5leHQpCj4gK3sKPiArCXN0cnVj
dCBwdF9yZWdzICpyZWdzOwo+ICsKPiArCXJlZ3MgPSB0YXNrX3B0X3JlZ3MocHJldik7Cj4gKwly
aXNjdl92X3ZzdGF0ZV9zYXZlKHByZXYsIHJlZ3MpOwo+ICsJcmlzY3Zfdl92c3RhdGVfcmVzdG9y
ZShuZXh0LCB0YXNrX3B0X3JlZ3MobmV4dCkpOwo+ICt9Cj4gKwo+ICAjZWxzZSAvKiAhIENPTkZJ
R19SSVNDVl9JU0FfViAgKi8KPiAgCj4gIHN0cnVjdCBwdF9yZWdzOwo+IEBAIC0xMTgsNiArMTU0
LDkgQEAgc3RhdGljIF9fYWx3YXlzX2lubGluZSBib29sIGhhc192ZWN0b3Iodm9pZCkgeyByZXR1
cm4gZmFsc2U7IH0KPiAgc3RhdGljIGlubGluZSBib29sIHJpc2N2X3ZfdnN0YXRlX3F1ZXJ5KHN0
cnVjdCBwdF9yZWdzICpyZWdzKSB7IHJldHVybiBmYWxzZTsgfQo+ICAjZGVmaW5lIHJpc2N2X3Zf
dnNpemUgKDApCj4gICNkZWZpbmUgcmlzY3Zfdl9zZXR1cF92c2l6ZSgpCSBkbyB7fSB3aGlsZSAo
MCkKPiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9zYXZlKHRhc2ssIHJlZ3MpCQlkbyB7fSB3aGls
ZSAoMCkKPiArI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9yZXN0b3JlKHRhc2ssIHJlZ3MpCWRvIHt9
IHdoaWxlICgwKQo+ICsjZGVmaW5lIF9fc3dpdGNoX3RvX3ZlY3RvcihfX3ByZXYsIF9fbmV4dCkJ
ZG8ge30gd2hpbGUgKDApCj4gICNkZWZpbmUgcmlzY3Zfdl92c3RhdGVfb2ZmKHJlZ3MpCQlkbyB7
fSB3aGlsZSAoMCkKPiAgI2RlZmluZSByaXNjdl92X3ZzdGF0ZV9vbihyZWdzKQkJCWRvIHt9IHdo
aWxlICgwKQo+ICAKPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jIGIv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gaW5kZXggODk1NWYyNDMyYzJkLi41ZTk1MDZh
MzJmYmUgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gKysrIGIv
YXJjaC9yaXNjdi9rZXJuZWwvcHJvY2Vzcy5jCj4gQEAgLTI0LDYgKzI0LDcgQEAKPiAgI2luY2x1
ZGUgPGFzbS9zd2l0Y2hfdG8uaD4KPiAgI2luY2x1ZGUgPGFzbS90aHJlYWRfaW5mby5oPgo+ICAj
aW5jbHVkZSA8YXNtL2NwdWlkbGUuaD4KPiArI2luY2x1ZGUgPGFzbS92ZWN0b3IuaD4KPiAgCj4g
IHJlZ2lzdGVyIHVuc2lnbmVkIGxvbmcgZ3BfaW5fZ2xvYmFsIF9fYXNtX18oImdwIik7Cj4gIAo+
IEBAIC0xNDgsMTIgKzE0OSwyOCBAQCB2b2lkIGZsdXNoX3RocmVhZCh2b2lkKQo+ICAJZnN0YXRl
X29mZihjdXJyZW50LCB0YXNrX3B0X3JlZ3MoY3VycmVudCkpOwo+ICAJbWVtc2V0KCZjdXJyZW50
LT50aHJlYWQuZnN0YXRlLCAwLCBzaXplb2YoY3VycmVudC0+dGhyZWFkLmZzdGF0ZSkpOwo+ICAj
ZW5kaWYKPiArI2lmZGVmIENPTkZJR19SSVNDVl9JU0FfVgo+ICsJLyogUmVzZXQgdmVjdG9yIHN0
YXRlICovCj4gKwlyaXNjdl92X3ZzdGF0ZV9vZmYodGFza19wdF9yZWdzKGN1cnJlbnQpKTsKPiAr
CWtmcmVlKGN1cnJlbnQtPnRocmVhZC52c3RhdGUuZGF0YXApOwo+ICsJbWVtc2V0KCZjdXJyZW50
LT50aHJlYWQudnN0YXRlLCAwLCBzaXplb2Yoc3RydWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUpKTsK
PiArI2VuZGlmCj4gK30KPiArCj4gK3ZvaWQgYXJjaF9yZWxlYXNlX3Rhc2tfc3RydWN0KHN0cnVj
dCB0YXNrX3N0cnVjdCAqdHNrKQo+ICt7Cj4gKwkvKiBGcmVlIHRoZSB2ZWN0b3IgY29udGV4dCBv
ZiBkYXRhcC4gKi8KPiArCWlmIChoYXNfdmVjdG9yKCkgJiYgdHNrLT50aHJlYWQudnN0YXRlLmRh
dGFwKQogICAgICAgICAgICAgICAgICAgICAgICAgICAgXl5eXl5eXl5eXl5eXl5eXl5eXl5eXl5e
Ck5vIG5lZWQgdG8gY2hlY2sgZm9yICFOVUxMLgoKCkJqw7ZybgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
