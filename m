Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A004C77B75
	for <linux-riscv@archiver.kernel.org>; Mon, 15 May 2023 11:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wTigQhgjt408Yivsj/MElJJHuU+sGkYaR5MfKmo+3ts=; b=0hxqu7Rd2tBAgB
	LsfxY53l7/PJ36qX6LCEHRHnWzJIGM8SVzwdxBCJyoBCCwVWFKyeIMFZYl6MdhS63a6tIC41ormxa
	j7FVDBSCgK2dHl5nYFg/PXK8IaV++R6ziJkmfMl2T2DNI256wVWaiNuf0coW+QW9LCos1KuaWoSeF
	M+mIB1xXphH7qY6CmjwkGSisYbG9jU8FfXFUZdZxxJIrFdYxNVHb8dT4uaDJ7497VjhEqzG+Z3Ppb
	Do7UTZZOpVOYSeYcc3ZpVBKHLsEiEhzgk62gTwgvZPSV9nuBUkPgODkOYkmOb+EISRfWDGOPTNaG8
	j08j4qhXuWumEi1M8usg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWX7-00209V-0Y;
	Mon, 15 May 2023 11:38:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyWX4-00208O-0H;
	Mon, 15 May 2023 11:38:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BF5F8616A8;
	Mon, 15 May 2023 11:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E3E2C433D2;
	Mon, 15 May 2023 11:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684150703;
	bh=rhCS5Qn2IGpUsX4JG5+/Jb6H+hQDl5nEdt6l7azXZmw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=H3oB0dadc88ULmPZhuO2HVFub+DmDWMN+D7jv3mGveCV9nkqrq5eh1C1oN1pVO1m2
	 CDkkIq7lMa/pmXLGGGnLAxVeY9o+hZ5pg46WUMBz7LcDiyCzbT/NV8tkhhc1vOi4IF
	 2ZDXlKsUt3m4DyJsxfDdYeyBD8xgUPbzvQrJ2j6RQMBGIAf6q+f3ucH121vbW3SE+L
	 9t/+E3onbryz1C3NKlTUDttRcDS0fPYPeUlmi17b4tBI/rHdm6eDhwTx/OZG8j6+Yo
	 jNJYJ3zQjbfTvr8hDcc6n/niXuAftyyXSdmZpYyW32yrUAPm7oW/o0KFmOPigySWpy
	 JSjEq94cPcKoA==
From: =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
To: Andy Chiu <andy.chiu@sifive.com>, linux-riscv@lists.infradead.org,
 palmer@dabbelt.com, anup@brainfault.org, atishp@atishpatra.org,
 kvm-riscv@lists.infradead.org, kvm@vger.kernel.org
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>, guoren@linux.alibaba.com,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra
 <peterz@infradead.org>, Catalin Marinas <catalin.marinas@arm.com>, "Jason
 A. Donenfeld" <Jason@zx2c4.com>, Joey Gouly <joey.gouly@arm.com>, Conor
 Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Jisheng
 Zhang <jszhang@kernel.org>, greentime.hu@sifive.com, Albert Ou
 <aou@eecs.berkeley.edu>, Stefan Roesch <shr@devkernel.io>,
 vineetg@rivosinc.com, Josh Triplett <josh@joshtriplett.org>, Paul Walmsley
 <paul.walmsley@sifive.com>, Heiko Stuebner <heiko.stuebner@vrull.eu>,
 Jordy Zomer <jordyzomer@google.com>, Ondrej Mosnacek
 <omosnace@redhat.com>, Vincent Chen <vincent.chen@sifive.com>, "Eric W.
 Biederman" <ebiederm@xmission.com>, Andy Chiu <andy.chiu@sifive.com>,
 Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH -next v19 20/24] riscv: Add prctl controls for userspace
 vector management
In-Reply-To: <20230509103033.11285-21-andy.chiu@sifive.com>
References: <20230509103033.11285-1-andy.chiu@sifive.com>
 <20230509103033.11285-21-andy.chiu@sifive.com>
Date: Mon, 15 May 2023 13:38:20 +0200
Message-ID: <87ttwdhljn.fsf@all.your.base.are.belong.to.us>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230515_043826_198068_0D8332FC 
X-CRM114-Status: GOOD (  21.30  )
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

QW5keSBDaGl1IDxhbmR5LmNoaXVAc2lmaXZlLmNvbT4gd3JpdGVzOgoKPiBUaGlzIHBhdGNoIGFk
ZCB0d28gcmlzY3Ytc3BlY2lmaWMgcHJjdGxzLCB0byBhbGxvdyB1c2VzcGFjZSBjb250cm9sIHRo
ZQo+IHVzZSBvZiB2ZWN0b3IgdW5pdDoKCkEgbW9yZSBnZW5lcmFsIHF1ZXN0aW9uOyBJIGtub3cg
dGhhdCBpdCdzIG9ubHkgeDg2IHRoYXQgaW1wbGVtZW50cwphcmNoX3ByY3RsKCksIGFuZCB0aGF0
IGFybTY0IGFkZGVkIHRoZSBTVkUgcHJjdGwga2VybmVsL3N5cy5jIC0tIGJ1dCBpcwp0aGVyZSBh
IHJlYXNvbiBub3QgdG8gaGF2ZSBhbiBhcmNoLXNwZWNpZmljIHByY3RsIGZvciByaXNjdj8KCj4g
ICogUFJfUklTQ1ZfVl9TRVRfQ09OVFJPTDogY29udHJvbCB0aGUgcGVybWlzc2lvbiB0byB1c2Ug
VmVjdG9yIGF0IG5leHQsCj4gICAgb3IgYWxsIGZvbGxvd2luZyBleGVjdmUgZm9yIGEgdGhyZWFk
LiBUdXJuaW5nIG9mZiBhIHRocmVhZCdzIFZlY3Rvcgo+ICAgIGxpdmUgaXMgbm90IHBvc3NpYmxl
IHNpbmNlIGxpYnJhcmllcyBtYXkgaGF2ZSByZWdpc3RlcmVkIGlmdW5jIHRoYXQKPiAgICBtYXkg
ZXhlY3V0ZSBWZWN0b3IgaW5zdHJ1Y3Rpb25zLgo+ICAqIFBSX1JJU0NWX1ZfR0VUX0NPTlRST0w6
IGdldCB0aGUgc2FtZSBwZXJtaXNzaW9uIHNldHRpbmcgZm9yIHRoZQo+ICAgIGN1cnJlbnQgdGhy
ZWFkLCBhbmQgdGhlIHNldHRpbmcgZm9yIGZvbGxvd2luZyBleGVjdmUocykuCj4KPiBTaWduZWQt
b2ZmLWJ5OiBBbmR5IENoaXUgPGFuZHkuY2hpdUBzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBH
cmVlbnRpbWUgSHUgPGdyZWVudGltZS5odUBzaWZpdmUuY29tPgo+IFJldmlld2VkLWJ5OiBWaW5j
ZW50IENoZW4gPHZpbmNlbnQuY2hlbkBzaWZpdmUuY29tPgo+IC0tLQo+ICBhcmNoL3Jpc2N2L2lu
Y2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIHwgIDEzICsrKysKPiAgYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS92ZWN0b3IuaCAgICB8ICAgNCArKwo+ICBhcmNoL3Jpc2N2L2tlcm5lbC9wcm9jZXNzLmMgICAg
ICAgIHwgICAxICsKPiAgYXJjaC9yaXNjdi9rZXJuZWwvdmVjdG9yLmMgICAgICAgICB8IDEwOCAr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+ICBhcmNoL3Jpc2N2L2t2bS92Y3B1LmMgICAg
ICAgICAgICAgIHwgICAyICsKPiAgaW5jbHVkZS91YXBpL2xpbnV4L3ByY3RsLmggICAgICAgICB8
ICAxMSArKysKPiAga2VybmVsL3N5cy5jICAgICAgICAgICAgICAgICAgICAgICB8ICAxMiArKysr
Cj4gIDcgZmlsZXMgY2hhbmdlZCwgMTUxIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oIGIvYXJjaC9yaXNjdi9pbmNsdWRlL2Fz
bS9wcm9jZXNzb3IuaAo+IGluZGV4IDM4ZGVkOGM1ZjIwNy4uNzkyNjFkYTc0Y2ZkIDEwMDY0NAo+
IC0tLSBhL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vcHJvY2Vzc29yLmgKPiArKysgYi9hcmNoL3Jp
c2N2L2luY2x1ZGUvYXNtL3Byb2Nlc3Nvci5oCj4gQEAgLTQwLDYgKzQwLDcgQEAgc3RydWN0IHRo
cmVhZF9zdHJ1Y3Qgewo+ICAJdW5zaWduZWQgbG9uZyBzWzEyXTsJLyogc1swXTogZnJhbWUgcG9p
bnRlciAqLwo+ICAJc3RydWN0IF9fcmlzY3ZfZF9leHRfc3RhdGUgZnN0YXRlOwo+ICAJdW5zaWdu
ZWQgbG9uZyBiYWRfY2F1c2U7Cj4gKwl1bnNpZ25lZCBsb25nIHZzdGF0ZV9jdHJsOwo+ICAJc3Ry
dWN0IF9fcmlzY3Zfdl9leHRfc3RhdGUgdnN0YXRlOwo+ICB9Owo+ICAKPiBAQCAtODMsNiArODQs
MTggQEAgZXh0ZXJuIHZvaWQgcmlzY3ZfZmlsbF9od2NhcCh2b2lkKTsKPiAgZXh0ZXJuIGludCBh
cmNoX2R1cF90YXNrX3N0cnVjdChzdHJ1Y3QgdGFza19zdHJ1Y3QgKmRzdCwgc3RydWN0IHRhc2tf
c3RydWN0ICpzcmMpOwo+ICAKPiAgZXh0ZXJuIHVuc2lnbmVkIGxvbmcgc2lnbmFsX21pbnNpZ3N0
a3N6IF9fcm9fYWZ0ZXJfaW5pdDsKPiArCj4gKyNpZmRlZiBDT05GSUdfUklTQ1ZfSVNBX1YKPiAr
LyogVXNlcnNwYWNlIGludGVyZmFjZSBmb3IgUFJfUklTQ1ZfVl97U0VULEdFVH1fVlMgcHJjdGwo
KXM6ICovCj4gKyNkZWZpbmUgUklTQ1ZfVl9TRVRfQ09OVFJPTChhcmcpCXJpc2N2X3ZfdnN0YXRl
X2N0cmxfc2V0X2N1cnJlbnQoYXJnKQo+ICsjZGVmaW5lIFJJU0NWX1ZfR0VUX0NPTlRST0woKQkJ
cmlzY3Zfdl92c3RhdGVfY3RybF9nZXRfY3VycmVudCgpCj4gK2V4dGVybiB1bnNpZ25lZCBpbnQg
cmlzY3Zfdl92c3RhdGVfY3RybF9zZXRfY3VycmVudCh1bnNpZ25lZCBsb25nIGFyZyk7Cj4gK2V4
dGVybiB1bnNpZ25lZCBpbnQgcmlzY3Zfdl92c3RhdGVfY3RybF9nZXRfY3VycmVudCh2b2lkKTsK
PiArI2Vsc2UgLyogIUNPTkZJR19SSVNDVl9JU0FfViAqLwo+ICsjZGVmaW5lIFJJU0NWX1ZfU0VU
X0NPTlRST0woYXJnKQkoLUVJTlZBTCkKPiArI2RlZmluZSBSSVNDVl9WX0dFVF9DT05UUk9MKCkJ
CSgtRUlOVkFMKQoKVGhlIGVsc2UtY2xhdXNlIGlzIG5vdCBuZWVkZWQgKHNlZSBteSBjb21tZW50
IGJlbG93IGZvciBrZXJuZWwvc3lzLmMpLAphbmQgY2FuIGJlIHJlbW92ZWQuCgo+ICsjZW5kaWYg
LyogQ09ORklHX1JJU0NWX0lTQV9WICovCj4gKwo+ICAjZW5kaWYgLyogX19BU1NFTUJMWV9fICov
Cj4gIAo+ICAjZW5kaWYgLyogX0FTTV9SSVNDVl9QUk9DRVNTT1JfSCAqLwoKPiBkaWZmIC0tZ2l0
IGEva2VybmVsL3N5cy5jIGIva2VybmVsL3N5cy5jCj4gaW5kZXggMzM5ZmVlM2VmZjZhLi40MTJk
MmMxMjYwNjAgMTAwNjQ0Cj4gLS0tIGEva2VybmVsL3N5cy5jCj4gKysrIGIva2VybmVsL3N5cy5j
Cj4gQEAgLTE0MCw2ICsxNDAsMTIgQEAKPiAgI2lmbmRlZiBHRVRfVEFHR0VEX0FERFJfQ1RSTAo+
ICAjIGRlZmluZSBHRVRfVEFHR0VEX0FERFJfQ1RSTCgpCQkoLUVJTlZBTCkKPiAgI2VuZGlmCj4g
KyNpZm5kZWYgUFJfUklTQ1ZfVl9TRVRfQ09OVFJPTAo+ICsjIGRlZmluZSBQUl9SSVNDVl9WX1NF
VF9DT05UUk9MKGEpCSgtRUlOVkFMKQo+ICsjZW5kaWYKPiArI2lmbmRlZiBQUl9SSVNDVl9WX0dF
VF9DT05UUk9MCj4gKyMgZGVmaW5lIFBSX1JJU0NWX1ZfR0VUX0NPTlRST0woKQkoLUVJTlZBTCkK
CkJvdGggU0VUL0dFVCBhYm92ZSBzaG91bGQgYmUgUklTQ1ZfVl97U0VULEdFVH1fQ09OVFJPTCAo
d2l0aG91dCB0aGUKcHJlZml4ICJQUl8iKSwgYW5kIG5vdGhpbmcgZWxzZSwgb3RoZXJ3aXNlLi4u
Cgo+ICsjZW5kaWYKPiAgCj4gIC8qCj4gICAqIHRoaXMgaXMgd2hlcmUgdGhlIHN5c3RlbS13aWRl
IG92ZXJmbG93IFVJRCBhbmQgR0lEIGFyZSBkZWZpbmVkLCBmb3IKPiBAQCAtMjcwOCw2ICsyNzE0
LDEyIEBAIFNZU0NBTExfREVGSU5FNShwcmN0bCwgaW50LCBvcHRpb24sIHVuc2lnbmVkIGxvbmcs
IGFyZzIsIHVuc2lnbmVkIGxvbmcsIGFyZzMsCj4gIAkJZXJyb3IgPSAhIXRlc3RfYml0KE1NRl9W
TV9NRVJHRV9BTlksICZtZS0+bW0tPmZsYWdzKTsKPiAgCQlicmVhazsKPiAgI2VuZGlmCj4gKwlj
YXNlIFBSX1JJU0NWX1ZfU0VUX0NPTlRST0w6Cj4gKwkJZXJyb3IgPSBSSVNDVl9WX1NFVF9DT05U
Uk9MKGFyZzIpOwo+ICsJCWJyZWFrOwo+ICsJY2FzZSBQUl9SSVNDVl9WX0dFVF9DT05UUk9MOgo+
ICsJCWVycm9yID0gUklTQ1ZfVl9HRVRfQ09OVFJPTCgpOwo+ICsJCWJyZWFrOwoKCi4uLnRoZSBj
YXNlIGhlcmUgd2lsbCBiZSB3ZWlyZC4gOy0pCgoKQmrDtnJuCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
