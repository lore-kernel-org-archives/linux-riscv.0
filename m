Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10AE7E7716D
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Dec 2024 14:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z8ayDhr8mj8ZmP2TlF2mKtKJzzMZ/4U07po5tQJ/6/I=; b=Zl6oDblP32Pdk3
	kM4w2wxunG1+V09cWMgH4JlTxchJG2AqpOxV17DmHDqxTaRiUoXI+rrp438ZLL1H9Ap71h4tPbw6A
	mmJep4nY1Dl19hIwm5NX3No+dzWVKh0q53CnwQBBsjtKUmTBDyp4acfs/SCli7kK3RI4TvYHaJUJL
	Ej9BN+zaztM8ItiV9YvaYDEWc6Fcq2WidjWZT05jajP9J3z/r9c0r3A8wsGMOSleP0TiBNRw89GRV
	gt2kBAf9UVmoTUBODEyvEJP+vM0TBPdnLtka2p53G6LtnZsqwGBWWneR7cXXD5TnrQSpdfU1rL+lX
	bz4QZsbxGyTl7fHqIGXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCvr-0000000GNV0-07Fm;
	Thu, 05 Dec 2024 14:34:19 +0000
Received: from relay7-d.mail.gandi.net ([217.70.183.200])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJCvo-0000000GNTx-1EYO
	for linux-riscv@lists.infradead.org;
	Thu, 05 Dec 2024 14:34:17 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id CED8120005;
	Thu,  5 Dec 2024 14:34:07 +0000 (UTC)
Message-ID: <edba44ad-a4b6-473d-a175-142ea49add1c@ghiti.fr>
Date: Thu, 5 Dec 2024 15:34:07 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] riscv: mm: Fix alignment of phys_ram_base
Content-Language: en-US
To: Xu Lu <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
 bjorn@rivosinc.com
Cc: lihangjing@bytedance.com, xieyongji@bytedance.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20241203144954.91731-1-luxu.kernel@bytedance.com>
From: Alexandre Ghiti <alex@ghiti.fr>
In-Reply-To: <20241203144954.91731-1-luxu.kernel@bytedance.com>
X-GND-Sasl: alex@ghiti.fr
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_063416_590242_1596C620 
X-CRM114-Status: GOOD (  24.97  )
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

SGkgWHUsCgpPbiAwMy8xMi8yMDI0IDE1OjQ5LCBYdSBMdSB3cm90ZToKPiBUaGlzIGNvbW1pdCBm
aXhlcyB0aGUgYWxpZ25tZW50IG9mIHBoeXNfcmFtX2Jhc2UgaW4gUklTQy1WLgo+Cj4gSW4gc3Bh
cnNlIHZtZW1tYXAgbW9kZWwsIHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2Ygdm1lbW1hcCBpcyBjYWxj
dWxhdGVkIGFzOgo+ICgoc3RydWN0IHBhZ2UgKilWTUVNTUFQX1NUQVJUIC0gKHBoeXNfcmFtX2Jh
c2UgPj4gUEFHRV9TSElGVCkpLgo+IEFuZCB0aGUgc3RydWN0IHBhZ2UncyB2YSBjYW4gYmUgY2Fs
Y3VsYXRlZCB3aXRoIGFuIG9mZnNldDoKPiAodm1lbW1hcCArIChwZm4pKS4KPgo+IEhvd2V2ZXIs
IHdoZW4gaW5pdGlhbGl6aW5nIHN0cnVjdCBwYWdlcywga2VybmVsIGFjdHVhbGx5IHN0YXJ0cyBm
cm9tIHRoZQo+IGZpcnN0IHBhZ2UgZnJvbSB0aGUgc2FtZSBzZWN0aW9uIHRoYXQgcGh5c19yYW1f
YmFzZSBiZWxvbmdzIHRvLiBJZiB0aGUKPiBmaXJzdCBwYWdlJ3MgcGh5c2ljYWwgYWRkcmVzcyBp
cyBub3QgKHBoeXNfcmFtX2Jhc2UgPj4gUEFHRV9TSElGVCksIHRoZW4KPiB3ZSBnZXQgYW4gdmEg
YmVsb3cgVk1FTU1BUF9TVEFSVCB3aGVuIGNhbGN1bGF0aW5nIHZhIGZvciBpdCdzIHN0cnVjdCBw
YWdlLgo+Cj4gRm9yIGV4YW1wbGUsIGlmIHBoeXNfcmFtX2Jhc2Ugc3RhcnRzIGZyb20gMHg4MjAw
MDAwMCB3aXRoIHBmbiAweDgyMDAwLCB0aGUKPiBmaXJzdCBwYWdlIGluIHRoZSBzYW1lIHNlY3Rp
b24gaXMgYWN0dWFsbHkgcGZuIDB4ODAwMDAuIER1cmluZwo+IGluaXRfdW5hdmFpbGFibGVfcmFu
Z2UoKSwgd2Ugd2lsbCBpbml0aWFsaXplIHN0cnVjdCBwYWdlIGZvciBwZm4gMHg4MDAwMAo+IHdp
dGggdmlydHVhbCBhZGRyZXNzICgoc3RydWN0IHBhZ2UgKilWTUVNTUFQX1NUQVJUIC0gMHgyMDAw
KSwgd2hpY2ggaXMKPiBiZWxvdyBWTUVNTUFQX1NUQVJUIGFzIHdlbGwgYXMgUENJX0lPX0VORC4K
Pgo+IFRoaXMgY29tbWl0IGZpeGVzIHRoaXMgYnVnIGJ5IGFsaWduaW5nIHBoeXNfcmFtX2Jhc2Ug
d2l0aCBTRUNUSU9OX1NJWkUuCj4KPiBGaXhlczogYzNiY2M2NWQ0ZDJlICgicmlzY3Y6IFN0YXJ0
IG9mIERSQU0gc2hvdWxkIGF0IGxlYXN0IGJlIGFsaWduZWQgb24gUE1EIHNpemUgZm9yIHRoZSBk
aXJlY3QgbWFwcGluZyIpCj4gU2lnbmVkLW9mZi1ieTogWHUgTHUgPGx1eHUua2VybmVsQGJ5dGVk
YW5jZS5jb20+Cj4gLS0tCj4gICBhcmNoL3Jpc2N2L21tL2luaXQuYyB8IDE1ICsrKysrKysrKysr
KysrLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
Pgo+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5p
dC5jCj4gaW5kZXggMGU4YzIwYWRjZDk4Li45NzRjYWZhN2M4NWUgMTAwNjQ0Cj4gLS0tIGEvYXJj
aC9yaXNjdi9tbS9pbml0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+IEBAIC0zMyw2
ICszMyw5IEBACj4gICAjaW5jbHVkZSA8YXNtL3BndGFibGUuaD4KPiAgICNpbmNsdWRlIDxhc20v
c2VjdGlvbnMuaD4KPiAgICNpbmNsdWRlIDxhc20vc29jLmg+Cj4gKyNpZmRlZiBDT05GSUdfU1BB
UlNFTUVNCj4gKyNpbmNsdWRlIDxhc20vc3BhcnNlbWVtLmg+Cj4gKyNlbmRpZgo+ICAgI2luY2x1
ZGUgPGFzbS90bGJmbHVzaC5oPgo+ICAgCj4gICAjaW5jbHVkZSAiLi4va2VybmVsL2hlYWQuaCIK
PiBAQCAtNTksNiArNjIsMTIgQEAgRVhQT1JUX1NZTUJPTChwZ3RhYmxlX2w0X2VuYWJsZWQpOwo+
ICAgRVhQT1JUX1NZTUJPTChwZ3RhYmxlX2w1X2VuYWJsZWQpOwo+ICAgI2VuZGlmCj4gICAKPiAr
I2lmZGVmIENPTkZJR19TUEFSU0VNRU0KPiArI2RlZmluZSBSSVNDVl9NRU1TVEFSVF9BTElHTgko
MVVMIDw8IFNFQ1RJT05fU0laRV9CSVRTKQo+ICsjZWxzZQo+ICsjZGVmaW5lIFJJU0NWX01FTVNU
QVJUX0FMSUdOCVBNRF9TSVpFCj4gKyNlbmRpZgo+ICsKPiAgIHBoeXNfYWRkcl90IHBoeXNfcmFt
X2Jhc2UgX19yb19hZnRlcl9pbml0Owo+ICAgRVhQT1JUX1NZTUJPTChwaHlzX3JhbV9iYXNlKTsK
PiAgIAo+IEBAIC0yMzksOSArMjQ4LDEzIEBAIHN0YXRpYyB2b2lkIF9faW5pdCBzZXR1cF9ib290
bWVtKHZvaWQpCj4gICAJLyoKPiAgIAkgKiBNYWtlIHN1cmUgd2UgYWxpZ24gdGhlIHN0YXJ0IG9m
IHRoZSBtZW1vcnkgb24gYSBQTUQgYm91bmRhcnkgc28gdGhhdAo+ICAgCSAqIGF0IHdvcnN0LCB3
ZSBtYXAgdGhlIGxpbmVhciBtYXBwaW5nIHdpdGggUE1EIG1hcHBpbmdzLgo+ICsJICoKPiArCSAq
IEFsc28sIG1ha2Ugc3VyZSB3ZSBhbGlnbiB0aGUgc3RhcnQgb2YgdGhlIG1lbW9yeSBvbiBhIFNF
Q1RJT04gYm91bmRhcnkKPiArCSAqIHdoZW4gQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQIGlzIGVu
YWJsZWQgdG8gZW5zdXJlIHRoZSBjb3JyZWN0bmVzcyBvZgo+ICsJICogcGZuX3RvX3BhZ2UoKS4K
PiAgIAkgKi8KPiAgIAlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1hJUF9LRVJORUwpKQo+IC0JCXBo
eXNfcmFtX2Jhc2UgPSBtZW1ibG9ja19zdGFydF9vZl9EUkFNKCkgJiBQTURfTUFTSzsKPiArCQlw
aHlzX3JhbV9iYXNlID0gcm91bmRfZG93bihtZW1ibG9ja19zdGFydF9vZl9EUkFNKCksIFJJU0NW
X01FTVNUQVJUX0FMSUdOKTsKPiAgIAo+ICAgCS8qCj4gICAJICogSW4gNjQtYml0LCBhbnkgdXNl
IG9mIF9fdmEvX19wYSBiZWZvcmUgdGhpcyBwb2ludCBpcyB3cm9uZyBhcyB3ZQoKClRoYXQncyBh
IGdvb2QgY2F0Y2ggaW5kZWVkLiBCdXQgSSdtIHdvbmRlcmluZyBpZiBpdCB3b3VsZCBiZSBtb3Jl
IApjb3JyZWN0IHRvIGZpeCB0aGUgbWFjcm8gdm1lbW1hcCBpbnN0ZWFkIG9mIHBoeXNfcmFtX2Jh
c2Ugc2luY2UgCnBoeXNfcmFtX2Jhc2UgaXMgc3VwcG9zZWQgdG8gaG9sZCB0aGUgcmVhbCBiYXNl
IG9mIHRoZSBzeXN0ZW0gbWVtb3J5LCAKd2hpY2ggd291bGQgYmUgd3Jvbmcgd2l0aCB5b3VyIHBh
dGNoLiBJIG1lYW4gc29tZXRoaW5nIGxpa2UgdGhhdCBpbnN0ZWFkIAoob3Igc2ltaWxhciwgSSBo
YXZlbid0IHRlc3RlZCk6CgojZGVmaW5lIHZtZW1tYXDCoMKgwqDCoMKgwqDCoMKgICgoc3RydWN0
IHBhZ2UgKilWTUVNTUFQX1NUQVJUIC0gCihyb3VuZF9kb3duKG1lbWJsb2NrX3N0YXJ0X29mX0RS
QU0oKSwgUklTQ1ZfTUVNU1RBUlRfQUxJR04pID4+IFBBR0VfU0hJRlQpKQoKQW5kIHRoZSBmaXhl
cyB0YWcgc2hvdWxkIGJlOgoKRml4ZXM6IGExMWRkNDlkY2I5MyAoInJpc2N2OiBTcGFyc2UtTWVt
b3J5L3ZtZW1tYXAgb3V0LW9mLWJvdW5kcyBmaXgiKQoKVGhhbmtzLAoKQWxleAoKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxp
bmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZy
YWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
