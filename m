Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2518FE7716E
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Dec 2024 03:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dVmQbdFecSg8lWv9ohOw55qKPTqZzdpCZKKuMISGTkE=; b=OMJF9p/6xGXYy4
	jmJlt803DnGUul/cD9LHJm/qzYSqTyJZgonZT31aNugr7DqSHyHEMXiwGq7jhTayA8cWDdeaqKvxm
	C8krdZVr9qQO1zCyp86wGR6RFb595zpKOH/n5A+D061ERD3wSVnU9qg/eZiAh5D826wdR2Lqqe17s
	YsifHAFG4K7kYhUev99LZkBgXcZCgNL085rNbzl1Apb0EQtoiWVVbBNyNgFtOlBAvz8QjFroHZyLp
	Crp4qYByGwmfnQkp3xcIuzmCtv1oF4hLqboBpqUsUHqWxzToOg//iLYoDhwG/xDZq4dZqWI7oJQ2s
	fQHTpPo8zCGqTlrYoTtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOkh-00000000OZ0-21VC;
	Fri, 06 Dec 2024 03:11:35 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJOke-00000000OYa-0IBM
	for linux-riscv@lists.infradead.org;
	Fri, 06 Dec 2024 03:11:33 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-2ee397a82f6so1430789a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 05 Dec 2024 19:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1733454690; x=1734059490; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPtELaheiEZ50gSakyGhUgUYd2EpF+2rxS7HLuOc52o=;
        b=CsaOD2KuyM8QKOKlKtLDL7OJWPaxjpUdzzrN1MevYOt9I3PP34pBAjKEP//wXfLgg7
         m/T66cg01JVAcyMQnGwIEEzOADrNU2N7qLgyo7UgdAGeudHlMwtpYBdWcd60yQNjiPG7
         Yq7VnmgmCjvffajmWx7wF+N6e0N+WGdyFcIT9z/qUbkNmZS+v2tGgsB/n7Yva5c5RS/P
         Qm69PlFJEImY0ybyKVcurLXO2k3rNTVj3T60VvObzn9tPKqNUZYMINmz91+uvmd+twmX
         Vs+oejszjzqBUc7q0fVUszB6DUotYxbNzmsbazNvnnrqj1zkI6nmN19SPTVRBTM5IVSY
         8sdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733454690; x=1734059490;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPtELaheiEZ50gSakyGhUgUYd2EpF+2rxS7HLuOc52o=;
        b=RdIkHSKR0TmsQtMZ5onl65Zdmypw6X2GOE4VDvDTLialc3N5s5ALCv5lQzx5lZzLPT
         e6bmw8bmB6yjXRcbYXgb4x0mnlBZRLP6IwXT6aItdXzmyFij57TntFlE6IIaJ4eawtcu
         FeCTiLKbrxsAoC9UmssMkJ2zSeeudMWGUwz5rLjWFO+Ram4JFpnV6ITCZbD/39TU8OIY
         xfpQV8oQFNbYddeRpQWhWOSZsjO7VAYerbLbHsknXiWiHi5oVU2owtfQIbionugL7HEn
         XedQ8kxybAYnQRtYF7zTtGZrXCyU89ehgn8lt9ETyocCIjXnYuoQ3C6oPNuW/owJGrp+
         Bxtg==
X-Forwarded-Encrypted: i=1; AJvYcCXd9fUVttIpkQXBCancSGd2gmuY5lE7fBmgVAG4phXrsVw+EIXry0SJyl3VpcEnK9iauxbqJPVC5wiijg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTgbkrzaC5f/6FXTIkxm6F0VFGmz6G3lvihdU1phU3ryjfX2s3
	hppPlAwkFNCOSJk+curd5yL/Sr7xwmHp63yQvkBGMePTGq91z7l29+SaQH4RmvwNRuAix9/df9V
	FzFy94GtYZAjtENBG9nchX3jSd0ihckWDO7bF8w==
X-Gm-Gg: ASbGncv+8tZYUE8m0fVuMwH0kua3feyzDhAoB0xSzx9B0l0cOq2725GhdpATGRjtSSX
	qz/VQyufXLYVh3MdFCMPYh458BkQo9bv1MFj49G3+SRcw
X-Google-Smtp-Source: AGHT+IHV0/FTNpzXCB+SWhNxGQqOyiwBlyuuQ4ZUGS/dKk13G8i2+s+EFfOF0h8AXMfdA7fqW2w35m8OZih68Z2b3+Q=
X-Received: by 2002:a17:90b:524e:b0:2ee:f1e3:fd21 with SMTP id
 98e67ed59e1d1-2ef6aaeedffmr2341974a91.25.1733454690511; Thu, 05 Dec 2024
 19:11:30 -0800 (PST)
MIME-Version: 1.0
References: <20241203144954.91731-1-luxu.kernel@bytedance.com> <edba44ad-a4b6-473d-a175-142ea49add1c@ghiti.fr>
In-Reply-To: <edba44ad-a4b6-473d-a175-142ea49add1c@ghiti.fr>
From: Xu Lu <luxu.kernel@bytedance.com>
Date: Fri, 6 Dec 2024 11:11:19 +0800
Message-ID: <CAPYmKFtAAZkY-v7Oat4dXYnm6zCcReMnDdFo3qcqtqhj1wv8eg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2] riscv: mm: Fix alignment of phys_ram_base
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexghiti@rivosinc.com, bjorn@rivosinc.com, lihangjing@bytedance.com, 
	xieyongji@bytedance.com, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241205_191132_475285_C144B14B 
X-CRM114-Status: GOOD (  32.44  )
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

SGkgQWxleCwKCk9uIFRodSwgRGVjIDUsIDIwMjQgYXQgMTA6MzTigK9QTSBBbGV4YW5kcmUgR2hp
dGkgPGFsZXhAZ2hpdGkuZnI+IHdyb3RlOgo+Cj4gSGkgWHUsCj4KPiBPbiAwMy8xMi8yMDI0IDE1
OjQ5LCBYdSBMdSB3cm90ZToKPiA+IFRoaXMgY29tbWl0IGZpeGVzIHRoZSBhbGlnbm1lbnQgb2Yg
cGh5c19yYW1fYmFzZSBpbiBSSVNDLVYuCj4gPgo+ID4gSW4gc3BhcnNlIHZtZW1tYXAgbW9kZWws
IHRoZSB2aXJ0dWFsIGFkZHJlc3Mgb2Ygdm1lbW1hcCBpcyBjYWxjdWxhdGVkIGFzOgo+ID4gKChz
dHJ1Y3QgcGFnZSAqKVZNRU1NQVBfU1RBUlQgLSAocGh5c19yYW1fYmFzZSA+PiBQQUdFX1NISUZU
KSkuCj4gPiBBbmQgdGhlIHN0cnVjdCBwYWdlJ3MgdmEgY2FuIGJlIGNhbGN1bGF0ZWQgd2l0aCBh
biBvZmZzZXQ6Cj4gPiAodm1lbW1hcCArIChwZm4pKS4KPiA+Cj4gPiBIb3dldmVyLCB3aGVuIGlu
aXRpYWxpemluZyBzdHJ1Y3QgcGFnZXMsIGtlcm5lbCBhY3R1YWxseSBzdGFydHMgZnJvbSB0aGUK
PiA+IGZpcnN0IHBhZ2UgZnJvbSB0aGUgc2FtZSBzZWN0aW9uIHRoYXQgcGh5c19yYW1fYmFzZSBi
ZWxvbmdzIHRvLiBJZiB0aGUKPiA+IGZpcnN0IHBhZ2UncyBwaHlzaWNhbCBhZGRyZXNzIGlzIG5v
dCAocGh5c19yYW1fYmFzZSA+PiBQQUdFX1NISUZUKSwgdGhlbgo+ID4gd2UgZ2V0IGFuIHZhIGJl
bG93IFZNRU1NQVBfU1RBUlQgd2hlbiBjYWxjdWxhdGluZyB2YSBmb3IgaXQncyBzdHJ1Y3QgcGFn
ZS4KPiA+Cj4gPiBGb3IgZXhhbXBsZSwgaWYgcGh5c19yYW1fYmFzZSBzdGFydHMgZnJvbSAweDgy
MDAwMDAwIHdpdGggcGZuIDB4ODIwMDAsIHRoZQo+ID4gZmlyc3QgcGFnZSBpbiB0aGUgc2FtZSBz
ZWN0aW9uIGlzIGFjdHVhbGx5IHBmbiAweDgwMDAwLiBEdXJpbmcKPiA+IGluaXRfdW5hdmFpbGFi
bGVfcmFuZ2UoKSwgd2Ugd2lsbCBpbml0aWFsaXplIHN0cnVjdCBwYWdlIGZvciBwZm4gMHg4MDAw
MAo+ID4gd2l0aCB2aXJ0dWFsIGFkZHJlc3MgKChzdHJ1Y3QgcGFnZSAqKVZNRU1NQVBfU1RBUlQg
LSAweDIwMDApLCB3aGljaCBpcwo+ID4gYmVsb3cgVk1FTU1BUF9TVEFSVCBhcyB3ZWxsIGFzIFBD
SV9JT19FTkQuCj4gPgo+ID4gVGhpcyBjb21taXQgZml4ZXMgdGhpcyBidWcgYnkgYWxpZ25pbmcg
cGh5c19yYW1fYmFzZSB3aXRoIFNFQ1RJT05fU0laRS4KPiA+Cj4gPiBGaXhlczogYzNiY2M2NWQ0
ZDJlICgicmlzY3Y6IFN0YXJ0IG9mIERSQU0gc2hvdWxkIGF0IGxlYXN0IGJlIGFsaWduZWQgb24g
UE1EIHNpemUgZm9yIHRoZSBkaXJlY3QgbWFwcGluZyIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBYdSBM
dSA8bHV4dS5rZXJuZWxAYnl0ZWRhbmNlLmNvbT4KPiA+IC0tLQo+ID4gICBhcmNoL3Jpc2N2L21t
L2luaXQuYyB8IDE1ICsrKysrKysrKysrKysrLQo+ID4gICAxIGZpbGUgY2hhbmdlZCwgMTQgaW5z
ZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2
L21tL2luaXQuYyBiL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiBpbmRleCAwZThjMjBhZGNkOTgu
Ljk3NGNhZmE3Yzg1ZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvbW0vaW5pdC5jCj4gPiAr
KysgYi9hcmNoL3Jpc2N2L21tL2luaXQuYwo+ID4gQEAgLTMzLDYgKzMzLDkgQEAKPiA+ICAgI2lu
Y2x1ZGUgPGFzbS9wZ3RhYmxlLmg+Cj4gPiAgICNpbmNsdWRlIDxhc20vc2VjdGlvbnMuaD4KPiA+
ICAgI2luY2x1ZGUgPGFzbS9zb2MuaD4KPiA+ICsjaWZkZWYgQ09ORklHX1NQQVJTRU1FTQo+ID4g
KyNpbmNsdWRlIDxhc20vc3BhcnNlbWVtLmg+Cj4gPiArI2VuZGlmCj4gPiAgICNpbmNsdWRlIDxh
c20vdGxiZmx1c2guaD4KPiA+Cj4gPiAgICNpbmNsdWRlICIuLi9rZXJuZWwvaGVhZC5oIgo+ID4g
QEAgLTU5LDYgKzYyLDEyIEBAIEVYUE9SVF9TWU1CT0wocGd0YWJsZV9sNF9lbmFibGVkKTsKPiA+
ICAgRVhQT1JUX1NZTUJPTChwZ3RhYmxlX2w1X2VuYWJsZWQpOwo+ID4gICAjZW5kaWYKPiA+Cj4g
PiArI2lmZGVmIENPTkZJR19TUEFSU0VNRU0KPiA+ICsjZGVmaW5lIFJJU0NWX01FTVNUQVJUX0FM
SUdOICgxVUwgPDwgU0VDVElPTl9TSVpFX0JJVFMpCj4gPiArI2Vsc2UKPiA+ICsjZGVmaW5lIFJJ
U0NWX01FTVNUQVJUX0FMSUdOIFBNRF9TSVpFCj4gPiArI2VuZGlmCj4gPiArCj4gPiAgIHBoeXNf
YWRkcl90IHBoeXNfcmFtX2Jhc2UgX19yb19hZnRlcl9pbml0Owo+ID4gICBFWFBPUlRfU1lNQk9M
KHBoeXNfcmFtX2Jhc2UpOwo+ID4KPiA+IEBAIC0yMzksOSArMjQ4LDEzIEBAIHN0YXRpYyB2b2lk
IF9faW5pdCBzZXR1cF9ib290bWVtKHZvaWQpCj4gPiAgICAgICAvKgo+ID4gICAgICAgICogTWFr
ZSBzdXJlIHdlIGFsaWduIHRoZSBzdGFydCBvZiB0aGUgbWVtb3J5IG9uIGEgUE1EIGJvdW5kYXJ5
IHNvIHRoYXQKPiA+ICAgICAgICAqIGF0IHdvcnN0LCB3ZSBtYXAgdGhlIGxpbmVhciBtYXBwaW5n
IHdpdGggUE1EIG1hcHBpbmdzLgo+ID4gKyAgICAgICoKPiA+ICsgICAgICAqIEFsc28sIG1ha2Ug
c3VyZSB3ZSBhbGlnbiB0aGUgc3RhcnQgb2YgdGhlIG1lbW9yeSBvbiBhIFNFQ1RJT04gYm91bmRh
cnkKPiA+ICsgICAgICAqIHdoZW4gQ09ORklHX1NQQVJTRU1FTV9WTUVNTUFQIGlzIGVuYWJsZWQg
dG8gZW5zdXJlIHRoZSBjb3JyZWN0bmVzcyBvZgo+ID4gKyAgICAgICogcGZuX3RvX3BhZ2UoKS4K
PiA+ICAgICAgICAqLwo+ID4gICAgICAgaWYgKCFJU19FTkFCTEVEKENPTkZJR19YSVBfS0VSTkVM
KSkKPiA+IC0gICAgICAgICAgICAgcGh5c19yYW1fYmFzZSA9IG1lbWJsb2NrX3N0YXJ0X29mX0RS
QU0oKSAmIFBNRF9NQVNLOwo+ID4gKyAgICAgICAgICAgICBwaHlzX3JhbV9iYXNlID0gcm91bmRf
ZG93bihtZW1ibG9ja19zdGFydF9vZl9EUkFNKCksIFJJU0NWX01FTVNUQVJUX0FMSUdOKTsKPiA+
Cj4gPiAgICAgICAvKgo+ID4gICAgICAgICogSW4gNjQtYml0LCBhbnkgdXNlIG9mIF9fdmEvX19w
YSBiZWZvcmUgdGhpcyBwb2ludCBpcyB3cm9uZyBhcyB3ZQo+Cj4KPiBUaGF0J3MgYSBnb29kIGNh
dGNoIGluZGVlZC4gQnV0IEknbSB3b25kZXJpbmcgaWYgaXQgd291bGQgYmUgbW9yZQo+IGNvcnJl
Y3QgdG8gZml4IHRoZSBtYWNybyB2bWVtbWFwIGluc3RlYWQgb2YgcGh5c19yYW1fYmFzZSBzaW5j
ZQo+IHBoeXNfcmFtX2Jhc2UgaXMgc3VwcG9zZWQgdG8gaG9sZCB0aGUgcmVhbCBiYXNlIG9mIHRo
ZSBzeXN0ZW0gbWVtb3J5LAo+IHdoaWNoIHdvdWxkIGJlIHdyb25nIHdpdGggeW91ciBwYXRjaC4g
SSBtZWFuIHNvbWV0aGluZyBsaWtlIHRoYXQgaW5zdGVhZAo+IChvciBzaW1pbGFyLCBJIGhhdmVu
J3QgdGVzdGVkKToKPgo+ICNkZWZpbmUgdm1lbW1hcCAgICAgICAgICgoc3RydWN0IHBhZ2UgKilW
TUVNTUFQX1NUQVJUIC0KPiAocm91bmRfZG93bihtZW1ibG9ja19zdGFydF9vZl9EUkFNKCksIFJJ
U0NWX01FTVNUQVJUX0FMSUdOKSA+PiBQQUdFX1NISUZUKSkKClRoYW5rcyBmb3IgeW91ciBjb21t
ZW50LgoKR29vZCBpZGVhLiBJIGhhdmUgdGhvdWdodCBhYm91dCB0aGlzLiBCdXQgSSB3YXNuJ3Qg
c3VyZSBpZiBpdCdzIE9LIHRvCmludHJvZHVjZSBleHRyYSBjYWxjdWxhdGlvbiB3aGVuZXZlciBw
Zm5fdG9fcGFnZSgpIGFuZCBwYWdlX3RvX3BmbigpCmlzIGNhbGxlZC4gU28gSSByZWZlcnJlZCB0
byBBUk0gd2hpY2ggYWxpZ25zIG1lbXN0YXJ0X2FkZHIgd2l0aApTRUNUSU9OIHNpemUgdG9vIGFu
ZCB0aGVuIG1hZGUgYSBzaW1pbGFyIG1vZGlmaWNhdGlvbi4KCklmIGl0IGlzIG5vdCBhcHByb3By
aWF0ZSB0byBjaGFuZ2UgdGhlIHNlbWFudGljcyBvZiBwaHlzX3JhbV9iYXNlLCBob3cKYWJvdXQg
aW50cm9kdWNpbmcgYSBuZXcgdmFyaWFibGUgdm1lbW1hcF9zdGFydF9hZGRyIGFuZCB1c2UgaXQg
dG8KY2FsY3VsYXRlIHZtZW1tYXA6CgojZGVmaW5lIHZtZW1tYXAgICAgICAgICAoKHN0cnVjdCBw
YWdlICopVk1FTU1BUF9TVEFSVCAtCih2bWVtbWFwX3N0YXJ0X2FkZHIgPj4gUEFHRV9TSElGVCkp
CgpCZXN0IFJlZ2FyZHMsCgpYdSBMdQoKPgo+IEFuZCB0aGUgZml4ZXMgdGFnIHNob3VsZCBiZToK
Pgo+IEZpeGVzOiBhMTFkZDQ5ZGNiOTMgKCJyaXNjdjogU3BhcnNlLU1lbW9yeS92bWVtbWFwIG91
dC1vZi1ib3VuZHMgZml4IikKPgo+IFRoYW5rcywKPgo+IEFsZXgKPgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
