Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B6A7D41D41
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Nov 2024 01:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QDniX892p9mRdSKEVq0Jp7nd3UQJ6m3GwBMcwg20Xew=; b=Rq3DuqCjhgKqBr
	OHyQyy+s8mchMtWJ5YIB995DJOKhX6hYW8KnyXGbVJtJLTlV2BmEGuq0Rh6/KdYXFlPVQqxX9+rK0
	/Q6Rd3JP18upMvvZmBlHPSZNTfMsAU3F1Xq/4zC+J+XXn8/zdYs0t1yFQm4GBZCmmAdik0jtnAfKE
	SjlTADvhOu7SW5IY1rkf1xV3rL/JoBLreu/+1POL/w35ZJvJFQ/2V/5oHfdn5RjwExtFAjxrXOB1u
	vu2b+Ksjy14KdMXxxWUh8beR6H9qTajM+cx0kR4ekBZh9gQN7zWF2wpuRm3UvHduz7+PBPieaK1vT
	Ev7sbnrmDzlCQl6oa9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAg28-00000001uAR-3Bch;
	Tue, 12 Nov 2024 01:49:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAg26-00000001uA3-265s
	for linux-riscv@lists.infradead.org;
	Tue, 12 Nov 2024 01:49:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0A0FD5C5E55
	for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 01:48:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 211C0C4CED5
	for <linux-riscv@lists.infradead.org>; Tue, 12 Nov 2024 01:49:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731376169;
	bh=ByKIsg+PetC3KQaRoDtbKrjNkQjVD4fuhk6Vg3U7JJg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=DDxDDeN4mEvU6Kc2yLJX8rrfify0h0aWcVNfF1CMLSZWHg34z2y+fxEbDGf/4bEXj
	 KqYjJV6P/Q+8CuscNdNFoZqtHu63aLwUhcC+gyseaOQxKZ+oKpi3dTAUK/eXZGbCdw
	 bKONFMn05p3OtcZQhf/5KQXvIKX2KJxygw73nT9qTqez2IpU4un7e13pTJwu98HZmI
	 1Vnq1RAqSljFewaHJJwCX0tvMEW7zJXSPvPVDxSgnQCiVmCBU7+lR5INEwNnV3GM6g
	 KAMG3LxRUTKWsiSD65eRqC911CJm/ESAZUtLSxzL3g6lw871/NKD65r+EAnuBUbqm4
	 VP0NTHOLnm4OA==
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-37d6ff1cbe1so3925274f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 11 Nov 2024 17:49:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW58ZYOYESHa2b7sSW117PND0lLhGC/SUWKvEazYwY5IwJm3looC07mLIzpflxUoy+s448ROL5c5NNwSA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzE0LByFy4O2rvDKg3fA5bpNtm+uCp/2OXSvzKgJybTWu2S67Hr
	YrJNVMaaCz5dNbrLEe6WVSZnKYCgp9YUD9lKoy3Y1OMnlD6Q4k0Sbj+uOFQQ5DXAoX9AVB7/Yn+
	ufRzvafXdALkFgN3bjuEKsvMT/Js=
X-Google-Smtp-Source: AGHT+IHkAppdGB9GR9FwSzrOwP4MyzWExRQCh4+xsHRQeI1xYcQFKz01kJl5kYDubLhJev1P+/wAGQeEYzYwz9A8wSk=
X-Received: by 2002:a5d:6d0c:0:b0:37d:4657:ea7d with SMTP id
 ffacd0b85a97d-381f1835301mr12111736f8f.49.1731376167620; Mon, 11 Nov 2024
 17:49:27 -0800 (PST)
MIME-Version: 1.0
References: <20241103145153.105097-1-alexghiti@rivosinc.com>
 <20241103145153.105097-14-alexghiti@rivosinc.com> <20241111164259.GA20042@willie-the-truck>
In-Reply-To: <20241111164259.GA20042@willie-the-truck>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 12 Nov 2024 09:49:15 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTuvmtmKVFMZCTMxEWHrpSpqPE8QO4MC5njPAskGEmpig@mail.gmail.com>
Message-ID: <CAJF2gTTuvmtmKVFMZCTMxEWHrpSpqPE8QO4MC5njPAskGEmpig@mail.gmail.com>
Subject: Re: [PATCH v6 13/13] riscv: Add qspinlock support
To: Will Deacon <will@kernel.org>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_174930_648845_770CF8BB 
X-CRM114-Status: GOOD (  22.51  )
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

T24gVHVlLCBOb3YgMTIsIDIwMjQgYXQgMTI6NDPigK9BTSBXaWxsIERlYWNvbiA8d2lsbEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIFN1biwgTm92IDAzLCAyMDI0IGF0IDAzOjUxOjUzUE0gKzAx
MDAsIEFsZXhhbmRyZSBHaGl0aSB3cm90ZToKPiA+IEluIG9yZGVyIHRvIHByb2R1Y2UgYSBnZW5l
cmljIGtlcm5lbCwgYSB1c2VyIGNhbiBzZWxlY3QKPiA+IENPTkZJR19DT01CT19TUElOTE9DS1Mg
d2hpY2ggd2lsbCBmYWxsYmFjayBhdCBydW50aW1lIHRvIHRoZSB0aWNrZXQKPiA+IHNwaW5sb2Nr
IGltcGxlbWVudGF0aW9uIGlmIFphYmhhIG9yIFppY2Nyc2UgYXJlIG5vdCBwcmVzZW50Lgo+ID4K
PiA+IE5vdGUgdGhhdCB3ZSBjYW4ndCB1c2UgYWx0ZXJuYXRpdmVzIGhlcmUgYmVjYXVzZSB0aGUg
ZGlzY292ZXJ5IG9mCj4gPiBleHRlbnNpb25zIGlzIGRvbmUgdG9vIGxhdGUgYW5kIHdlIG5lZWQg
dG8gc3RhcnQgd2l0aCB0aGUgcXNwaW5sb2NrCj4gPiBpbXBsZW1lbnRhdGlvbiBiZWNhdXNlIHRo
ZSB0aWNrZXQgc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gd291bGQgcG9sbHV0ZQo+ID4gdGhlIHNw
aW5sb2NrIHZhbHVlLCBzbyBsZXQncyB1c2Ugc3RhdGljIGtleXMuCj4KPiBJIHRoaW5rIHRoZSBz
dGF0aWMga2V5IHRvZ2dsaW5nIHRha2VzIGEgbXV0ZXggKGp1bXBfbGFiZWxfbG9jaygpKSB3aGlj
aAo+IGNhbiB0YWtlIGEgc3BpbmxvY2sgKGxvY2stPndhaXRfbG9jaykgaW50ZXJuYWxseSwgc28g
SSBkb24ndCBncm9rIGhvdwo+IHRoaXMgd29ya3M6Cj4KPiA+ICtzdGF0aWMgdm9pZCBfX2luaXQg
cmlzY3Zfc3BpbmxvY2tfaW5pdCh2b2lkKQo+ID4gK3sKPiA+ICsgICAgIGNoYXIgKnVzaW5nX2V4
dCA9IE5VTEw7Cj4gPiArCj4gPiArICAgICBpZiAoSVNfRU5BQkxFRChDT05GSUdfUklTQ1ZfVElD
S0VUX1NQSU5MT0NLUykpIHsKPiA+ICsgICAgICAgICAgICAgcHJfaW5mbygiVGlja2V0IHNwaW5s
b2NrOiBlbmFibGVkXG4iKTsKPiA+ICsgICAgICAgICAgICAgcmV0dXJuOwo+ID4gKyAgICAgfQo+
ID4gKwo+ID4gKyAgICAgaWYgKElTX0VOQUJMRUQoQ09ORklHX1JJU0NWX0lTQV9aQUJIQSkgJiYK
PiA+ICsgICAgICAgICBJU19FTkFCTEVEKENPTkZJR19SSVNDVl9JU0FfWkFDQVMpICYmCj4gPiAr
ICAgICAgICAgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgWkFCSEEpICYmCj4g
PiArICAgICAgICAgcmlzY3ZfaXNhX2V4dGVuc2lvbl9hdmFpbGFibGUoTlVMTCwgWkFDQVMpKSB7
Cj4gPiArICAgICAgICAgICAgIHVzaW5nX2V4dCA9ICJ1c2luZyBaYWJoYSI7Cj4gPiArICAgICB9
IGVsc2UgaWYgKHJpc2N2X2lzYV9leHRlbnNpb25fYXZhaWxhYmxlKE5VTEwsIFpJQ0NSU0UpKSB7
Cj4gPiArICAgICAgICAgICAgIHVzaW5nX2V4dCA9ICJ1c2luZyBaaWNjcnNlIjsKPiA+ICsgICAg
IH0KPiA+ICsjaWYgZGVmaW5lZChDT05GSUdfUklTQ1ZfQ09NQk9fU1BJTkxPQ0tTKQo+ID4gKyAg
ICAgZWxzZSB7Cj4gPiArICAgICAgICAgICAgIHN0YXRpY19icmFuY2hfZGlzYWJsZSgmcXNwaW5s
b2NrX2tleSk7Cj4gPiArICAgICAgICAgICAgIHByX2luZm8oIlRpY2tldCBzcGlubG9jazogZW5h
YmxlZFxuIik7Cj4gPiArICAgICAgICAgICAgIHJldHVybjsKPiA+ICsgICAgIH0KPiA+ICsjZW5k
aWYKPgo+IGkuZS4gd2UndmUgcG90ZW50aWFsbHkgYWxyZWFkeSB1c2VkIHRoZSBxc3BpbmxvY2sg
YXQgdGhpcyBwb2ludC4KWWVzLCBJJ3ZlIHVzZWQgcXNwaW5sb2NrIGhlcmUuIEJ1dCByaXNjdl9z
cGlubG9ja19pbml0IGlzIGNhbGxlZCB3aXRoCmlycV9kaXNhYmxlZCBhbmQgc21wX29mZi4gVGhh
dCBtZWFucyB0aGlzIHFzcGlubG9jayBvbmx5IHBlcmZvcm1zIGEKdGVzdC1zZXQgbG9jayBiZWhh
dmlvciBieSBxc3BpbmxvY2sgZmFzdC1wYXRoLgoKVGhlIHFzcGlubG9jayBpcyBhIGNsZWFuIGlt
cGxlbWVudGF0aW9uLiBBZnRlciBxc3Bpbl91bmxvY2ssIHRoZSBsb2NrCnZhbHVlIHJlbWFpbnMg
YXQgemVybywgYnV0IHRoZSB0aWNrZXQgbG9jayBtYWtlcyB0aGUgdmFsdWUgZGlydHkuIFNvCndl
IHVzZSBRc3BpbmxvY2sgYXQgZmlyc3Qgb3IgY2hhbmdlIGl0IHRvIHRpY2tldC1sb2NrIGJlZm9y
ZSBpcnEgJiBzbXAKdXAuCgo+Cj4gV2lsbAoKCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
