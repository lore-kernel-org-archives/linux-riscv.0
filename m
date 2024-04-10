Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 444AACD11C2
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Apr 2024 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FU4z2O/uvKUqSAc5HmeLXEFDjWiI0IR+uFXiScGEiYI=; b=owDgf5jzOoznr/
	vU1mF2e5/ZJrnioOA7BzTfjWyhvC4wSiu5Fukf/T+TKI15UPLXk2ZJnDOGBVVIiLaYZSlLW0FP0uB
	iIzaLRU3YXulvilhj3ab6yOnLeoT1y2yTuI7UzL6mPHh6LIG6XjgRga84uiGN7qH8VJT5p/9I50ec
	db1bQQkTLM+TKPmLLz2QMmByBUM8z5pvJK2RN8HJE4oHzd787Zxehd9gu7ivczizHM5EQuqCZWqiF
	SEu15t8nmS6ogfGYBMco9QuvLhWQ/mhAdIPYUJSG1xxJmqpr8wbUr1H9rB3qutC1up9bHHUqu2w8M
	2YlgpU2VsmWscXOsmBbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruY0O-00000007AA0-1MNB;
	Wed, 10 Apr 2024 13:28:48 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruY0J-00000007A6F-3f69;
	Wed, 10 Apr 2024 13:28:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 027EBCE28B2;
	Wed, 10 Apr 2024 13:28:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EB7FC433F1;
	Wed, 10 Apr 2024 13:28:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712755711;
	bh=vG/etX9uFWDRMQyM96dxgcCHcoWyYgwQIb4SGb4iHUc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=iubVYXfK6JPDhhN9TmRS0x6QzxNaToPZCeVJnHP93bzsfQkb7YaWzUGU5fvosdVlK
	 1iYtCJ+3WmeWgXErCaKKoO8GwwKCAVsPQSeaDEZwvjhLCuOC89oo5gQpo6M/afAEAy
	 4yeMyJV1phaU5H/syWUh2fS6hJ6AmMPbK9BuOo+0TU6FA/S11ekIIS3LR1gsLiMZaG
	 mJvEUbFS4EnjHWHw0mmkVeePQ3ozflixNW+Mf7PgkbFPaNxs5zDRXrhRsUvsJ6qIwh
	 nvaEhh/w7672EUsnJyENttVNo1/Exy/MsDqmdMXp6iyLxGelAPVwHWr0EhfXbeuCBH
	 DtboMbnFmvheg==
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-22ed9094168so394133fac.1;
        Wed, 10 Apr 2024 06:28:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXY9L6l3EwjxvcmZKMZL7aSlEFCDu1x1/ed1HX/R4RpMmhtNk5EEiGDfQkvUXWD0hOAicG40z5id2xGckVyfWrEnycEzTWPHXUnEBypG6di+XeX/vy0hjoY8mBnzkhP/jkiCsj0/HlAlB3SnVnje2eNATPisBk=
X-Gm-Message-State: AOJu0Ywfh8KtOs42wTKvo8arIRNhHFSRjYybRUw+Bp8ZTHwp1p9PYSqH
	1SZmFRLGTUE2VTtp7csxqJCaYYzhLn1KJXpFQu4u5x7MxQC1m2NjEGuLKC91dy4S3VbEkOpmgBz
	izwYh9zCWz/c+wT+ZoT4n3Ms3PO8=
X-Google-Smtp-Source: AGHT+IFL5SftybRh1r8JWNftMLn5Ll2W8+pkIYo7YlzdluWnaIUYaO6UpMp9mGVfMWaTjUBfbyWqBLpc+8TxlkLduX4=
X-Received: by 2002:a05:6871:a00a:b0:22d:fb4b:9d11 with SMTP id
 vp10-20020a056871a00a00b0022dfb4b9d11mr2534660oab.4.1712755710509; Wed, 10
 Apr 2024 06:28:30 -0700 (PDT)
MIME-Version: 1.0
References: <Zbp5xzmFhKDAgHws@shell.armlinux.org.uk> <E1rVDmU-0027YP-Jz@rmk-PC.armlinux.org.uk>
 <CAJZ5v0iiJpUWq5GMSnKFWQTzn_bdwoQz9m=hDaXNg4Lj_ePF4g@mail.gmail.com>
 <20240322185327.00002416@Huawei.com> <20240410134318.0000193c@huawei.com>
In-Reply-To: <20240410134318.0000193c@huawei.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 10 Apr 2024 15:28:18 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ggD042sfz3jDXQVDUxQZu_AWaF2ox-Me8CvFeRB8nczw@mail.gmail.com>
Message-ID: <CAJZ5v0ggD042sfz3jDXQVDUxQZu_AWaF2ox-Me8CvFeRB8nczw@mail.gmail.com>
Subject: Re: [PATCH RFC v4 02/15] ACPI: processor: Register all CPUs from acpi_processor_get_info()
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Russell King <rmk+kernel@armlinux.org.uk>, 
	linux-pm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-acpi@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev, x86@kernel.org, 
	acpica-devel@lists.linuxfoundation.org, linux-csky@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-ia64@vger.kernel.org, 
	linux-parisc@vger.kernel.org, Salil Mehta <salil.mehta@huawei.com>, 
	Jean-Philippe Brucker <jean-philippe@linaro.org>, jianyong.wu@arm.com, justin.he@arm.com, 
	James Morse <james.morse@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_062844_732519_56831DF3 
X-CRM114-Status: GOOD (  25.78  )
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

T24gV2VkLCBBcHIgMTAsIDIwMjQgYXQgMjo0M+KAr1BNIEpvbmF0aGFuIENhbWVyb24KPEpvbmF0
aGFuLkNhbWVyb25AaHVhd2VpLmNvbT4gd3JvdGU6Cj4KPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9iYXNlL2NwdS5jIGIvZHJpdmVycy9iYXNlL2NwdS5jCj4gPiA+ID4gaW5kZXgg
NDdkZTBmMTQwYmE2Li4xM2QwNTJiZjEzZjQgMTAwNjQ0Cj4gPiA+ID4gLS0tIGEvZHJpdmVycy9i
YXNlL2NwdS5jCj4gPiA+ID4gKysrIGIvZHJpdmVycy9iYXNlL2NwdS5jCj4gPiA+ID4gQEAgLTU1
Myw3ICs1NTMsMTEgQEAgc3RhdGljIHZvaWQgX19pbml0IGNwdV9kZXZfcmVnaXN0ZXJfZ2VuZXJp
Yyh2b2lkKQo+ID4gPiA+ICB7Cj4gPiA+ID4gICAgICAgICBpbnQgaSwgcmV0Owo+ID4gPiA+Cj4g
PiA+ID4gLSAgICAgICBpZiAoIUlTX0VOQUJMRUQoQ09ORklHX0dFTkVSSUNfQ1BVX0RFVklDRVMp
KQo+ID4gPiA+ICsgICAgICAgLyoKPiA+ID4gPiArICAgICAgICAqIFdoZW4gQUNQSSBpcyBlbmFi
bGVkLCBDUFVzIGFyZSByZWdpc3RlcmVkIHZpYQo+ID4gPiA+ICsgICAgICAgICogYWNwaV9wcm9j
ZXNzb3JfZ2V0X2luZm8oKS4KPiA+ID4gPiArICAgICAgICAqLwo+ID4gPiA+ICsgICAgICAgaWYg
KCFJU19FTkFCTEVEKENPTkZJR19HRU5FUklDX0NQVV9ERVZJQ0VTKSB8fCAhYWNwaV9kaXNhYmxl
ZCkKPiA+ID4gPiAgICAgICAgICAgICAgICAgcmV0dXJuOwo+ID4gPgo+ID4gPiBIb25lc3RseSwg
dGhpcyBsb29rcyBsaWtlIGEgcXVpY2sgaGFjayB0byBtZSBhbmQgaXQgYWJzb2x1dGVseQo+ID4g
PiByZXF1aXJlcyBhbiBBQ0sgZnJvbSB0aGUgeDg2IG1haW50YWluZXJzIHRvIGdvIGFueXdoZXJl
Lgo+ID4gV2lsbCBhZGRyZXNzIHRoaXMgc2VwYXJhdGVseS4KPiA+Cj4KPiBTbyBkbyBwZW9wbGUg
cHJlZmVyIHRoaXMgaGFjaywgb3Igc29tZXRoaW5nIGFsb25nIGxpbmVzIG9mIHRoZSBmb2xsb3dp
bmc/Cj4KPiBzdGF0aWMgaW50IF9faW5pdCBjcHVfZGV2X3JlZ2lzdGVyX2dlbmVyaWModm9pZCkK
PiB7Cj4gICAgICAgICBpbnQgaSwgcmV0ID0gMDsKPgo+ICAgICAgICAgZm9yX2VhY2hfb25saW5l
X2NwdShpKSB7Cj4gICAgICAgICAgICAgICAgIGlmICghZ2V0X2NwdV9kZXZpY2UoaSkpIHsKPiAg
ICAgICAgICAgICAgICAgICAgICAgICByZXQgPSBhcmNoX3JlZ2lzdGVyX2NwdShpKTsKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBpZiAocmV0KQo+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcHJfd2FybigicmVnaXN0ZXJfY3B1ICVkIGZhaWxlZCAoJWQpXG4iLCBpLCByZXQpOwo+
ICAgICAgICAgICAgICAgICB9Cj4gICAgICAgICB9Cj4gICAgICAgICAvL1Byb2JhYmx5IGp1c3Qg
ZWF0IHRoZSBlcnJvci4KPiAgICAgICAgIHJldHVybiAwOwo+IH0KPiBzdWJzeXNfaW5pdGNhbGxf
c3luYyhjcHVfZGV2X3JlZ2lzdGVyX2dlbmVyaWMpOwoKSSB3b3VsZCBwcmVmZXIgc29tZXRoaW5n
IGxpa2UgdGhlIGFib3ZlLgoKSSBhY3R1YWxseSB0aG91Z2h0IHRoYXQgYXJjaF9yZWdpc3Rlcl9j
cHUoKSBtaWdodCByZXR1cm4gc29tZXRoaW5nCmxpa2UgLUVQUk9CRV9ERUZFUiB3aGVuIGl0IGNh
bm5vdCBkZXRlcm1pbmUgd2hldGhlciBvciBub3QgdGhlIENQVSBpcwpyZWFsbHkgYXZhaWxhYmxl
LgoKVGhlbiwgdGhlIEFDUEkgcHJvY2Vzc29yIGVudW1lcmF0aW9uIHBhdGggbWF5IHRha2UgY2Fy
ZSBvZiByZWdpc3RlcmluZwpDUFUgdGhhdCBoYXZlIG5vdCBiZWVuIHJlZ2lzdGVyZWQgc28gZmFy
IGFuZCBpbiB0aGUgbW9yZS1vci1sZXNzIHRoZQpzYW1lIHdheSByZWdhcmRsZXNzIG9mIHRoZSBh
cmNoaXRlY3R1cmUgKG1vZHVsbyBzb21lIGFyY2gtc3BlY2lmaWMKc3R1ZmYpLgoKSW4gdGhlIGVu
ZCwgaXQgc2hvdWxkIGJlIHBvc3NpYmxlIHRvIGF2b2lkIGNoYW5naW5nIHRoZSBiZWhhdmlvciBv
Zgp4ODYgYW5kIGxvb25nYXJjaCBpbiB0aGlzIHNlcmllcy4KCj4gV2hpY2ggbWF5IGxvb2sgZmFt
aWxpYXIgYXQgaXQncyBlZmZlY3RpdmVseSBwYXRjaCAzIGZyb20gdjMgd2hpY2ggd2FzIGRlYWxp
bmcKPiB3aXRoIENQVXMgbWlzc2luZyBmcm9tIERTRFQgKHNvbWV0aGluZyB3ZSB0aGluayBkb2Vz
bid0IGhhcHBlbikuCj4KPiBJdCBtaWdodCBiZSBwb3NzaWJsZSB0byBlbGlkZSB0aGUgYXJjaF9y
ZWdpc3Rlcl9jcHUoKSBpbgo+IG1ha2VfcHJlc2VudCgpIGJ1dCB0aGF0IHdpbGwgbWVhbiB3ZSB1
c2UgZGlmZmVyZW50IGZsb3dzIGluIHRoaXMgcGF0Y2ggc2V0Cj4gZm9yIHRoZSBob3RwbHVnIGFu
ZCBpbml0aWFsbHkgcHJlc2VudCBjYXNlcyB3aGljaCBpcyBhIGJpdCBtZXNzeS4KPgo+IEkndmUg
dGVzdGVkIHRoaXMgbGlnaHRseSBvbiBhcm02NCBhbmQgeDg2IEFDUEkgKyBEVCBib290aW5nIGFu
ZCBpdCAic2VlbXMiIGZpbmUuCgpTb3VuZHMgcHJvbWlzaW5nLgoKVGhhbmtzIQoKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGlu
ZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJh
ZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
