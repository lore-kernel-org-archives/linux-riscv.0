Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D646DE7717D
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Dec 2024 09:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9MrNhmHfPRofH6AYDwdw6MsWVlBpYNs7o/EQqGmCbwk=; b=IFi50y2DUC3cdz
	bK1fHuxNw1tDxkSFTevUi1KdVKPdtII9I9XXQWOqS/Nm1rC+Z2/LOEUep2I2y9wAdAd36T+27VcEw
	TXo0I+qYjqp/1EiI1O/L4pxP7Tloz+dgKVEa18GFpu+6o4xt0FwDvM/arAKpZAkb+Ul3uyNPXmCt9
	bmkzAh92orENj6J3eJj7zWt8wGuhIZIRTYkiIRHmyHTG77kMwzSx1XC+O+CwayRPM0tUoVy4P6I0U
	R0UHKmWvVfDrS72bLLI6cxyWLVdmPhGWwM0kt3wu+QMFLG2TNdNLnz1sx/r6BtMIcE+X8pdw/kete
	dmHxFJ2Y7PejonBml48w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJLo-0000000EU15-2qsy;
	Wed, 11 Dec 2024 09:49:48 +0000
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLJKj-0000000ETm6-3jkr
	for linux-riscv@lists.infradead.org;
	Wed, 11 Dec 2024 09:48:43 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-3862f32a33eso2170778f8f.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Dec 2024 01:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733910519; x=1734515319; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OPkuDVmQ8I0bPStjeQByqCDXTekXQdwOcRMPaf2EPFY=;
        b=oeABfu+R0EBKiygvzkYYpgfxUMrge/hKtQasEOgpZkT/7uiiL8/MyKIOmDFX92Vfim
         PQxSaYFTUCms/gd8WcRW5NJ8fUz0M6jhN9Fu5rGWR7SbgFVrsWdMRLcI15cBlw5eEBNZ
         6+/Yr0tvHKLcv26QrIMWiKolxImBN1RAHN2YM+9Dn0iNC+IAiMSLn4IOXomCGfa1Db76
         hxYT7YJc8vb8iOKui42MOOKUoBJTKdnei21X0ws8E4G/FEqDQKFISvs6St5kbmXAs6HQ
         xgPGoqCS+TSRCU4EsfG/p+TfrEQxwrH+TKrXdeKVqH9MzHu6zfUj3tcByjJ4PS72cpzG
         RRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733910519; x=1734515319;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OPkuDVmQ8I0bPStjeQByqCDXTekXQdwOcRMPaf2EPFY=;
        b=G2OXhGJNDqosOnYSfhjFlih8awaH45X8NlB6BQbECZhHNXfFbqjjVMNJ65dtwZd/p/
         5VxtT25HWHzA54zcukFw8gdYGSc/dswobepfU5f4b4+K6XFOSW+L5F1TdnHQ/+r/fCM6
         VmfInxsvJ5nTdpOQ+xYPu5WMSmhTKYEpDAFq64QDB6YyJGmgcDU/uaV4IpLPuhnQI+Wv
         5lD+ZUrlCJUL7Qa+8tvWTBM2ZmjKFXXGxrGqt0pMwpvYW0Ulhk2m6GUHeY0zT3WZrJ4x
         kew5sBGtQtIRGSq5LaLzLuQCFU1aDq+1vA2tcDrAFSjr7BkQuFEEa11YcbFQUihQT9sE
         du0A==
X-Forwarded-Encrypted: i=1; AJvYcCW19LZNx83PKRs++on6uz0HwFc3OBfvMncbCL5s48AibF02py2qKAxCeluS8a8Zrqh2uSpDX1flyyj/UA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwI9YGqB43yELU+YSB11fQq4FMavhpsIF2rlphaAs4nzYsIcrJ/
	fejhF0+N4ck96vd3GaIlbC68ywvN95fhgIu3tH+LQwotfmGlM0Qia0fNKMvL8z2qx9nUhpjHEic
	fodWwgZuuXlOaSiI7mkuKi5tA7TuGU4KxDQk9
X-Gm-Gg: ASbGnctMta9T9SVu1wmgXNFBibXzpdgfPx1923K2R8y7tEBbfNDyNjYAHrdH0oXdMoF
	VwwiyVNNaLnKsQ3qHhb18tpY4HvuNlN0LhdotTWGPoMenbUEkR2RR//0rl5P6mbGlbA==
X-Google-Smtp-Source: AGHT+IGgLsoa3jV2scUrxGJs3M3c7OjkCrlHZsyu8jTWcAJIYLV9qXmSt5/Cg8qsliTSfr6/wIq7uJuo1wJlePE++No=
X-Received: by 2002:a05:6000:410f:b0:385:f2a2:50df with SMTP id
 ffacd0b85a97d-3864cea200amr1277675f8f.27.1733910519359; Wed, 11 Dec 2024
 01:48:39 -0800 (PST)
MIME-Version: 1.0
References: <20241210001802.228725-1-fujita.tomonori@gmail.com>
 <20241210001802.228725-6-fujita.tomonori@gmail.com> <CAH5fLgiShKMGo6AYWM-4S8JK+iDA+tUfz9uxkns82g0nLW--NQ@mail.gmail.com>
 <20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
In-Reply-To: <20241211.094054.1429837669366274024.fujita.tomonori@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 11 Dec 2024 10:48:27 +0100
Message-ID: <CAH5fLgj9rBOrcQa193RpuA708CFK1ojMqhmiNWF7dbyNFPJcJA@mail.gmail.com>
Subject: Re: [PATCH v1 5/5] rust: Add warn_on and warn_on_once
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	x86@kernel.org, linux-riscv@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, peterz@infradead.org, hpa@zytor.com, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	catalin.marinas@arm.com, will@kernel.org, chenhuacai@kernel.org, 
	kernel@xen0n.name, tangyouling@loongson.cn, hejinyang@loongson.cn, 
	yangtiezhu@loongson.cn, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_014841_931321_3FE3C53F 
X-CRM114-Status: GOOD (  30.88  )
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

T24gV2VkLCBEZWMgMTEsIDIwMjQgYXQgMTo0MeKAr0FNIEZVSklUQSBUb21vbm9yaQo8ZnVqaXRh
LnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiBPbiBUdWUsIDEwIERlYyAyMDI0IDEwOjA1
OjA3ICswMTAwCj4gQWxpY2UgUnlobCA8YWxpY2VyeWhsQGdvb2dsZS5jb20+IHdyb3RlOgo+Cj4g
PiBPbiBUdWUsIERlYyAxMCwgMjAyNCBhdCAxOjE54oCvQU0gRlVKSVRBIFRvbW9ub3JpCj4gPiA8
ZnVqaXRhLnRvbW9ub3JpQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPj4KPiA+PiBBZGQgd2Fybl9vbiBh
bmQgd2Fybl9vbl9vbmNlIG1hY3Jvcy4gV3JhcHBpbmcgdGhlIEMncyBXQVJOXyogYW5kIEJVR18q
Cj4gPj4gbWFjcm9zIGRvZXNuJ3Qgd29yayBzbyB0aGlzIHVzZXMgdGhlIGFzc2VtYmx5IGNvZGUg
ZXhwb3J0ZWQgYnkgdGhlIEMKPiA+PiBzaWRlIHZpYSBBUkNIX1dBUk5fQVNNIG1hY3JvLiBMaWtl
IHRoZSBzdGF0aWMgYnJhbmNoIGNvZGUsIHRoaXMKPiA+PiBnZW5lcmF0ZXMgdGhlIGFzc2VtYmx5
IGNvZGUgZm9yIHJ1c3QgZHluYW1pY2FsbHkgYnkgdXNpbmcgdGhlIEMKPiA+PiBwcmVwcm9jZXNz
b3IuCj4gPj4KPiA+PiBmaWxlKCkhIG1hY3JvIGRvZXNuJ3Qgd29yayBmb3IgdGhlIFJ1c3QgaW5s
aW5lIGFzc2VtYmx5IGluIHRoZSBzYW1lCj4gPj4gd2F5IGFzIF9fRklMRV9fIGZvciB0aGUgQyBp
bmxpbmUgYXNzZW1ibHkuIFNvIHRoZSBjb2RlIHRvIGhhbmRsZSBhCj4gPj4gZmlsZSBuYW1lIGlz
IGRpZmZlcmVudCBmcm9tIHRoZSBDIGFzc2VtYmx5IGNvZGUgKHNpbWlsYXIgdG8gdGhlCj4gPj4g
YXJtNjQvbG9vbmdhcmNoIGFzc2VtYmx5KS4KPiA+Pgo+ID4+IEFTTV9SRUFDSEFCTEUgZGVmaW5p
dGlvbiB3b3JrcyBpbiB0aGUgc2FtZSB3YXkgdG8gZ2V0IG9ianRvb2wncwo+ID4+IHJlYWNoYWJs
ZSBhc20gY29kZS4gVGhlIGFyY2hpdGVjdHVyZXMgd2hpY2ggdXNlIG9ianRvb2wgKHg4NiBhbmQK
PiA+PiBsb29uZ2FyY2gpIG5lZWRzIGl0Lgo+ID4+Cj4gPj4gU2lnbmVkLW9mZi1ieTogRlVKSVRB
IFRvbW9ub3JpIDxmdWppdGEudG9tb25vcmlAZ21haWwuY29tPgo+ID4KPiA+PiArI1ttYWNyb19l
eHBvcnRdCj4gPj4gKyNbZG9jKGhpZGRlbildCj4gPj4gKyNbY2ZnKGFsbChDT05GSUdfQlVHLCBu
b3QoQ09ORklHX1VNTCkpKV0KPiA+PiArI1tjZmcoYW55KHRhcmdldF9hcmNoID0gIng4Nl82NCIs
IHRhcmdldF9hcmNoID0gInJpc2N2NjQiKSldCj4gPgo+ID4+ICsjW21hY3JvX2V4cG9ydF0KPiA+
PiArI1tkb2MoaGlkZGVuKV0KPiA+PiArI1tjZmcoYWxsKENPTkZJR19CVUcsIG5vdChDT05GSUdf
VU1MKSkpXQo+ID4+ICsjW2NmZyhhbnkodGFyZ2V0X2FyY2ggPSAiYWFyY2g2NCIsIHRhcmdldF9h
cmNoID0gImxvb25nYXJjaDY0IikpXQo+ID4KPiA+IFdoYXQncyB0aGUgcmVhc29uIGZvciB0aGlz
IGFyY2gtc3BlY2lmaWMgY29kZT8gVGhlIGZpbGUhKCkvbGluZSEoKQo+ID4gaW52b2NhdGlvbnM/
IENvdWxkIHRoZXkgYmUgcGFzc2VkIGFzIGFuIGFyZ3VtZW50IHRvIHRoZSBhc20gaW5zdGVhZCBz
bwo+ID4gdGhhdCB3ZSBkb24ndCBuZWVkIHRhcmdldF9hcmNoIGNmZ3M/IEkgdW5kZXJzdGFuZCB0
aGF0IHRoZXkgZG9uJ3Qgd29yawo+ID4gZXhhY3RseSB0aGUgc2FtZSB3YXksIGJ1dCBtYXliZSBp
dCBjb3VsZCBzdGlsbCB3b3JrPwo+Cj4gQmVjYXVzZSBvZiAiZXJyb3I6IG5hbWVkIGFyZ3VtZW50
IG5ldmVyIHVzZWQiIGluIFJ1c3QgaW5saW5lIGFzc2VtYmx5Ogo+Cj4gQWxsIHRoZSBhcmNocyBk
ZWZpbmUgQVJDSF9XQVJOX0FTTSBtYWNybyBpbiB0aGUgc2FtZSB3YXk6Cj4KPiAjZGVmaW5lIEFS
Q0hfV0FSTl9BU00oZmlsZSwgbGluZSwgZmxhZ3MsIHNpemUpCj4KPiBIb3dldmVyLCBvbmx5IHg4
NiBhbmQgcmlzYy12IGFzbSBjb2RlIHVzZSB0aGUgc2l6ZSBhcmd1bWVudC4gV2l0aG91dAo+IHRo
ZSBjZmdzLCBJJ2xsIGdldCB0aGUgZm9sbG93aW5nIG9uIGFybTY0L2xvb25nYXJjaDoKPgo+IGVy
cm9yOiBuYW1lZCBhcmd1bWVudCBuZXZlciB1c2VkCj4gICAtLT4gL2hvbWUvZnVqaXRhL2dpdC9s
aW51eC1ydXN0L2RyaXZlcnMvYmxvY2svcm51bGwucnM6NTQ6OQo+ICAgIHwKPiA1NCB8ICAgICAg
ICAgd2Fybl9vbiEodHJ1ZSk7Cj4gICAgfCAgICAgICAgIF5eXl5eXl5eXl5eXl5eIG5hbWVkIGFy
Z3VtZW50IG5ldmVyIHVzZWQKPiAgICB8Cj4gICAgPSBoZWxwOiBpZiB0aGlzIGFyZ3VtZW50IGlz
IGludGVudGlvbmFsbHkgdW51c2VkLCBjb25zaWRlciB1c2luZyBpdCBpbiBhbiBhc20gY29tbWVu
dDogYCIvKiB7c2l6ZX0gKi8iYAo+ICAgID0gbm90ZTogdGhpcyBlcnJvciBvcmlnaW5hdGVzIGlu
IHRoZSBtYWNybyBgJGNyYXRlOjp3YXJuX2ZsYWdzYCB3aGljaCBjb21lcyBmcm9tIHRoZSBleHBh
bnNpb24gb2YgdGhlIG1hY3JvIGB3YXJuX29uYCAoaW4gTmlnaHRseSBidWlsZHMsIHJ1biB3aXRo
IC1aIG1hY3JvLWJhY2t0cmFjZSBmb3IgbW9yZSBpbmZvKQo+Cj4KPiBBbnkgd2F5IHRvIG1ha2Ug
dGhlIGNvbXBpbGVyIHRvIGlnbm9yZSB0aGlzPwoKVGhlIGVycm9yIG1lc3NhZ2Ugc3VnZ2VzdHMg
YWRkaW5nIGFuIGFzbSBjb21tZW50LiBEb2VzIHRoYXQgbm90IHdvcms/CgpZb3UgY291bGQgZXZl
biBhZGQgdGhlIGNvbW1lbnQgdW5jb25kaXRpb25hbGx5IG9uIHRoZSBSdXN0IHNpZGUuIEl0J3MK
bm90IGxpa2UgdGhlIGNvbW1lbnQgaHVydHMgb24gdGhlIHBsYXRmb3JtcyB0aGF0ICpkbyogdXNl
IHRoZSBzaXplCnBhcmFtZXRlci4KCj4gPj4gKyNbbWFjcm9fZXhwb3J0XQo+ID4+ICsjW2RvYyho
aWRkZW4pXQo+ID4+ICsjW2NmZyhhbGwoQ09ORklHX0JVRywgQ09ORklHX1VNTCkpXQo+ID4+ICtt
YWNyb19ydWxlcyEgd2Fybl9mbGFncyB7Cj4gPj4gKyAgICAoJGZsYWdzOmV4cHIpID0+IHsKPiA+
PiArICAgICAgICAvLyBTQUZFVFk6IEp1c3QgYW4gRkZJIGNhbGwuCj4gPj4gKyAgICAgICAgdW5z
YWZlIHsKPiA+PiArICAgICAgICAgICAgJGNyYXRlOjpiaW5kaW5nczo6d2Fybl9zbG93cGF0aF9m
bXQoCj4gPj4gKyAgICAgICAgICAgICAgICAkY3JhdGU6OmNfc3RyISg6OmNvcmU6OmZpbGUhKCkp
LmFzX3B0cigpIGFzICpjb25zdCA6OmNvcmU6OmZmaTo6Y19jaGFyLAo+ID4+ICsgICAgICAgICAg
ICAgICAgbGluZSEoKSBhcyBpMzIsCj4gPj4gKyAgICAgICAgICAgICAgICAkZmxhZ3MgYXMgdTMy
LAo+ID4+ICsgICAgICAgICAgICAgICAgOjpjb3JlOjpwdHI6Om51bGwoKSBhcyAqY29uc3QgOjpj
b3JlOjpmZmk6OmNfY2hhciwKPiA+Cj4gPiBJIHdvbmRlciBpZiB0aGlzIGNvdWxkIGJlIHdyaXR0
ZW4gdG8gdXRpbGl6ZSBMb2NhdGlvbjo6Y2FsbGVyKCkKPiA+IGluc3RlYWQgc28gdGhhdCBgI1t0
cmFja19jYWxsZXJdYCB3b3Jrcz8KPgo+IFlvdSBtZWFudCB0aGF0IHdlIGNvdWxkIG1ha2Ugd2Fy
bl9mbGFncygpIGZ1bmN0aW9uIGluc3RlYWQgb2YgbWFjcm8KPiB3aXRoIExvY2F0aW9uOjpjYWxs
ZXIoKT8KPgo+IElmIHNvLCB3ZSBuZWVkIHRvIGFkZCBjZmdzIHRvIHdhcm5fb24gYW5kIHdhcm5f
b25fb25jZSBiZWNhdXNlIGJvdGggbWFjcm8KPiBhbmQgZnVuY3Rpb24gb2Ygd2Fybl9mbGFncyBh
cmUgbmVjZXNzYXJ5PwoKV2VsbCwgSSdtIG5vdCBzdXJlISBJIGRvbid0IGtub3cgaWYgaXQncyBm
ZWFzaWJsZSBhdCBhbGwsIHNpbmNlIHVzaW5nCkxvY2F0aW9uOjpjYWxsZXIoKSB3b3VsZCBtZWFu
IHRoYXQgdGhlIGZpbGUvbGluZSBpcyBub3QgYSBjb21waWxlLXRpbWUKY29uc3RhbnQuIEJ1dCBp
ZiB3ZSBjYW4sIHRoZW4gSSB0aGluayAjW3RyYWNrX2NhbGxlcl0gc3VwcG9ydCB3b3VsZCBiZQpu
aWNlLgoKQWxpY2UKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
