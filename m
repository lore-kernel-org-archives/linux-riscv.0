Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E12CAC5BB
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Sep 2025 14:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gdfyVTgUCgFSUoz5jcGXJCkXa2Uq9fnF33tmffFtnRY=; b=MKZwJmrUZxw+GW
	yJokyPpyIMtDW3m7MhGSqfmt0D0CcIQKch1X+gH70HaV7imXy6LV/4jSwDOZqrKZeCGnmpZIdzV1W
	EydNrSa59rVKYsfw1i6qQWEnV0xWbwMvi6l2Ghg67xpuqEWYBf0vNjjqw54VrfDmw7Y9lv04tnFVS
	KGCKDxUNIWwH9cXokwgXVYfiOReDr6DpiqyafmBJEbnvgHWnQ+kD0DuL/tN8iQrnx8Nz4A3bEm4M5
	8S949wgamcai+daCE1vIITboJJTRya8AGTI3G3PQbt/2ukA3GPcYDQcvkFf2ONjNhJqmJGwkn47v0
	dCAtMHaI3/LVKNT0kVLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2sae-0000000G4NR-2P1A;
	Sun, 28 Sep 2025 14:41:28 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v2sac-0000000G4N6-29oL
	for linux-riscv@lists.infradead.org;
	Sun, 28 Sep 2025 14:41:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id EE4CE62175
	for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 14:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9F463C116D0
	for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 14:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759070485;
	bh=zEl3HK9Huv3wAo8Gz3obptdVAl3BiTe7KlwyVun45hk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=KQHRjPwLC5G8brFRuLi7o+fpS7n5vnimwAp70vgaHEgFmGnQ+8/JXmEMwOpYluWwc
	 gPh8y3NdWf05BAJsL1h89OUxuFiv9K0M0HAyMqKJAYGCpmKa3ACFswAt33tdsAo0Uw
	 WdTCh+3Jn7TMW4j+oJj7r1EF6IJOs7ve0Px1LcHX9VnhjdE0r+UEpc5Xm6wBzwl3Yu
	 a8fnF/rbiGqU15Qg4uTENsF6mjnkIPDm1zebsaCCre5mcLnUqjqOoCMEqJWnK6oHig
	 l3Ae2UGbCke7CAP4d0CH4r2FibiszgEoGSh6Cq/uBnrxy4QLsw0AP9aujqJ9E7H1Ur
	 kFjd+rIM8OAoQ==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5818de29d15so5076462e87.2
        for <linux-riscv@lists.infradead.org>; Sun, 28 Sep 2025 07:41:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVaKUxMEsLN1VuNL+y4DQwfkefpeSc7/d0bAGiCQGl09MZ8VxNoRN2e5W4DPJhcuaWnfR+pSAneMnOXFQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzJEabqwuA4pqC715hk/QRxeDWioYl+chuj1BLFWhBiuqEyjN4V
	EfOWJAyXofHQv1skZXHjLwUfmrE6wdrtGYfvODLEw2S5sYxF8oPBTD5wQIaXT/yFlG5r51gp/pA
	7UcLM9Ik7NWtvTssJkmaxDy1RlbFs2yQ=
X-Google-Smtp-Source: AGHT+IFWQQN6QdQWgcfYnmBFENB0KuvC1Z/xcGcpQuzj5V+hESZTuEgEU7p0gTVxJK5oi7ZFD+wA09OxaRIm8jBNjGM=
X-Received: by 2002:ac2:4f07:0:b0:55b:8afb:e638 with SMTP id
 2adb3069b0e04-582d295ce23mr4091918e87.28.1759070484041; Sun, 28 Sep 2025
 07:41:24 -0700 (PDT)
MIME-Version: 1.0
References: <20250928085506.4471-1-yangtiezhu@loongson.cn> <CAMj1kXG8Wi+THa2SeLxiDT=+t_TKx0AL4H-azZO4DNJvyyv96g@mail.gmail.com>
 <CAAhV-H7xOf8DEwOrNh+GQGHktOT4Ljp+7SqutGvvDZp6GLXJrA@mail.gmail.com> <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
In-Reply-To: <CAMj1kXG=EFkRAMkvKMSjPixoGqU-tZXVoRkJJ6Wcnzs3x52X6Q@mail.gmail.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Sun, 28 Sep 2025 16:41:12 +0200
X-Gmail-Original-Message-ID: <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
X-Gm-Features: AS18NWDKeRljEYzTakhM3NRe_gYKBPPHlUPXn-bSPODAX07vV2YYljZFZWHKAg0
Message-ID: <CAMj1kXHWe2uGY3S1NJ6mckqD4n116rPmaOzw3_Qbvxyjh7ECMw@mail.gmail.com>
Subject: Re: [PATCH v2] efistub: Only link libstub to final vmlinux
To: Huacai Chen <chenhuacai@kernel.org>
Cc: Tiezhu Yang <yangtiezhu@loongson.cn>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-efi@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
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

T24gU3VuLCAyOCBTZXB0IDIwMjUgYXQgMTY6MzksIEFyZCBCaWVzaGV1dmVsIDxhcmRiQGtlcm5l
bC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCAyOCBTZXB0IDIwMjUgYXQgMTU6NTIsIEh1YWNhaSBD
aGVuIDxjaGVuaHVhY2FpQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+IEhpLCBBcmQsCj4gPgo+
ID4gT24gU3VuLCBTZXAgMjgsIDIwMjUgYXQgOTo0MuKAr1BNIEFyZCBCaWVzaGV1dmVsIDxhcmRi
QGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBTdW4sIDI4IFNlcHQgMjAyNSBhdCAx
MDo1NSwgVGllemh1IFlhbmcgPHlhbmd0aWV6aHVAbG9vbmdzb24uY24+IHdyb3RlOgo+ID4gPiA+
Cj4gPiA+ID4gV2hlbiBjb21waWxpbmcgd2l0aCBMTFZNIGFuZCBDT05GSUdfTFRPX0NMQU5HIGlz
IHNldCwgdGhlcmUgZXhpc3RzCj4gPiA+ID4gdGhlIGZvbGxvd2luZyBvYmp0b29sIHdhcm5pbmcg
b24gTG9vbmdBcmNoOgo+ID4gPiA+Cj4gPiA+ID4gICB2bWxpbnV4Lm86IHdhcm5pbmc6IG9ianRv
b2w6IF9fZWZpc3R1Yl9lZmlfYm9vdF9rZXJuZWwoKQo+ID4gPiA+ICAgZmFsbHMgdGhyb3VnaCB0
byBuZXh0IGZ1bmN0aW9uIF9fZWZpc3R1Yl9leGl0X2Jvb3RfZnVuYygpCj4gPiA+ID4KPiA+ID4g
PiBUaGlzIGlzIGJlY2F1c2UgZWZpX2Jvb3Rfa2VybmVsKCkgZG9lc24ndCBlbmQgd2l0aCBhIHJl
dHVybiBpbnN0cnVjdGlvbgo+ID4gPiA+IG9yIGFuIHVuY29uZGl0aW9uYWwganVtcCwgdGhlbiBv
Ymp0b29sIGhhcyBkZXRlcm1pbmVkIHRoYXQgdGhlIGZ1bmN0aW9uCj4gPiA+ID4gY2FuIGZhbGwg
dGhyb3VnaCBpbnRvIHRoZSBuZXh0IGZ1bmN0aW9uLgo+ID4gPiA+Cj4gPiA+ID4gQXQgdGhlIGJl
Z2lubmluZywgdHJ5IHRvIGRvIHNvbWV0aGluZyB0byBtYWtlIGVmaV9ib290X2tlcm5lbCgpIGVu
ZHMgd2l0aAo+ID4gPiA+IGFuIHVuY29uZGl0aW9uYWwganVtcCBpbnN0cnVjdGlvbiwgYnV0IHRo
aXMgbW9kaWZpY2F0aW9uIHNlZW1zIG5vdCBwcm9wZXIuCj4gPiA+ID4KPiA+ID4gPiBTaW5jZSB0
aGUgZWZpc3R1YiBmdW5jdGlvbnMgYXJlIHVzZWxlc3MgZm9yIHN0YWNrIHVud2luZGVyLCB0aGV5
IGNhbiBiZQo+ID4gPiA+IGlnbm9yZWQgYnkgb2JqdG9vbC4gQWZ0ZXIgbWFueSBkaXNjdXNzaW9u
cywgbm8gbmVlZCB0byBsaW5rIGxpYnN0dWIgdG8KPiA+ID4gPiB0aGUgdm1saW51eC5vLCBvbmx5
IGxpbmsgbGlic3R1YiB0byB0aGUgZmluYWwgdm1saW51eC4KPiA+ID4gPgo+ID4gPgo+ID4gPiBQ
bGVhc2UgdHJ5IGtlZXBpbmcgdGhlc2UgY2hhbmdlcyBjb25maW5lZCB0byBhcmNoL2xvb25nYXJj
aC4gVGhpcwo+ID4gPiBwcm9ibGVtIGRvZXMgbm90IGV4aXN0IG9uIG90aGVyIGFyY2hpdGVjdHVy
ZXMsIGFuZCBjaGFuZ2luZyB0aGUgd2F5Cj4gPiA+IHZtbGludXggaXMgY29uc3RydWN0ZWQgbWln
aHQgY3JlYXRlIG90aGVyIGlzc3VlcyBkb3duIHRoZSByb2FkLgo+ID4gQVJNLCBSSVNDLVYgYW5k
IExvb25nQXJjaCBkbyB0aGluZ3MgZXhhY3RseSBpbiB0aGUgc2FtZSB3YXkuIE5vdwo+ID4gTG9v
bmdBcmNoIGlzIHRoZSBmaXJzdCBvZiB0aGUgdGhyZWUgdG8gZW5hYmxlIG9ianRvb2wsIHNvIHdl
IG1lZXQgdGhlCj4gPiBwcm9ibGVtIGZpcnN0Lgo+ID4KPiA+IEJ1dCB5ZXMsIEkgYWxzbyBkb24n
dCB3YW50IHRvIGNoYW5nZSB0aGUgd2F5IG9mIGNvbnN0cnVjdGluZyB2bWxpbnV4Lgo+ID4gU28g
SSBwcmVmZXIgdGhlIGVhcmxpZXN0IHdheSB0byBmaXggdGhpcyBwcm9ibGVtLgo+ID4gaHR0cHM6
Ly9sb3JlLmtlcm5lbC5vcmcvbG9vbmdhcmNoL0NBQWhWLUg3ZlJIR0ZWS1Y4SGl0UmdtdW9EUHQ1
T0R0LS1pU3VWMEVtZWVVYjlkNUZOd0BtYWlsLmdtYWlsLmNvbS9ULyNtZWVmNzQxMWFiZDE0ZjRj
MjhjODVlNjg2NjE0YWE5MjExZmNjZGNhMAo+ID4KPgo+IENhbiB3ZSBqdXN0IGRyb3AgdGhlIF9f
bm9yZXR1cm4gYW5ub3RhdGlvbiBmcm9tIGtlcm5lbF9lbnRyeV90LCBhbmQKPiByZXR1cm4gRUZJ
X1NVQ0NFU1MgZnJvbSBlZmlfYm9vdF9rZXJuZWwoKT8KCi4uLiBvciBhZGQgZWZpX2Jvb3Rfa2Vy
bmVsKCkgdG8gLi90b29scy9vYmp0b29sL25vcmV0dXJucy5oPwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
