Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21966C3DA4B
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 01:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBCjrb97bgNznqlIgXlumdRH/awMKgwpGY3jWqPLGPw=; b=NtoTfIwzDIyt/0
	fRQgqHSqUOGGSqg94z1VF3ob6pW6whPSdymyVQD4xloz0aVeZijCQsNhJ2D2TAws7t5XIUdNT4a3S
	4lBNYkvK4qDDp/M2X3LjoQvFbw4TSbOac1mmN91jhUUZ6jvTXS2ropIo8UQGbJYW/quI7Ao//TbDh
	si+WWTkEjUyCy5VooEwkYWeG6CCruTI39hvin07f1BLr285VUHmwUpy6hz6BaM23ecGZAMlt06UJ4
	7JVC4MiL8+57S8jHtC4fAvfR7dxh7AXOZi8r6JotAWlOc5FSoqlKA+2cWltQqYxOsKzncfN81AIAI
	IPLckNtsNdtegL9eAgJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTWcx-00000008uV9-0UVX;
	Tue, 16 Jul 2024 01:05:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTWcu-00000008uUD-20Dp
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 01:05:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 56459CE127B
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 01:05:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 65985C4AF0F
	for <linux-riscv@lists.infradead.org>; Tue, 16 Jul 2024 01:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721091905;
	bh=QG29vkIJ/KvY/97Bru3A84cybIUnamlVoJnN1kflOmU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ToyINu31o0mwiMTvB5jB7n0JqZmTDkbSgm3t3bwVwzYP75J65cEK6v6oyb8tYVOhv
	 v283nYUQlfOOu5dkmJkSXA7x3GfOcAgcUwSZ23oscxwuTlMrDQv9GuHJ9AuZDnkjU3
	 KGEZWRS6uz9S2DA8GajHIs6NU9sefPICsgdx2qDIbes6U6ElBomuJN3h+6C0pwpDmx
	 abIAgm1tiGWHam/Y9EjCnlpXRq5alYhZmF4YpzXbnIkpfqe18YXG0uxRhfKfoIz+qJ
	 Brbx0sk7a7jc2ovVW4SEzYnEvoOaLtrMtixOVW1ayPOwJnQ7UnVjRjO8mfbe4KjanQ
	 Ei/CYG98ITPjw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-52ea2b6a9f5so5106885e87.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jul 2024 18:05:05 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW6i+z0G+zMZcGokKR64ZpDwe4NZERUdk1OMvGzXDmoIAsAOsncuj6HNGZzWF+VkpoZIDOE9fBc20mBk6tfe8n+EBiFHPunX9lJhrXQdzvN
X-Gm-Message-State: AOJu0Yw5fHakioZCit21GZi5SUzY4RyEDTnfR0NQyPLX8PTiFPd2eyXK
	cI/kjJ0r7whH7dTIp0F0+uVWyu6Xft3THfGhcnodB5WJl2M0gk+lX4v2Tx/8tZl08ExWm4B+ttD
	OIK+Cb5W7CJaSZ6DJurmKmxx49Io=
X-Google-Smtp-Source: AGHT+IEN6H27w2IkU8okfWfdkHSr98KLu1OkcEMwEZm2647siY5rx5myWRTdnfrOyys1KrSYGu4NevvkqFvZHj/70C0=
X-Received: by 2002:a05:6512:138c:b0:52e:9b92:4990 with SMTP id
 2adb3069b0e04-52edf0192ffmr286040e87.32.1721091903625; Mon, 15 Jul 2024
 18:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-11-alexghiti@rivosinc.com> <CAJF2gTSG7HzV7mgZpkWLbSBNn2dRv_NaSmCimd+kRdU=EZrmmg@mail.gmail.com>
 <CAHVXubizLq=qZgVQ2vBFe5zVuLRP0DGw=UN4U_Wkx2P2xsP3Mw@mail.gmail.com> <a096151c-c349-455f-8939-3b739d73f016@redhat.com>
In-Reply-To: <a096151c-c349-455f-8939-3b739d73f016@redhat.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 16 Jul 2024 09:04:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRrZwVk2xyhF_PsJGKCfkvun-rifG8MjDBcGDt3YBuhPg@mail.gmail.com>
Message-ID: <CAJF2gTRrZwVk2xyhF_PsJGKCfkvun-rifG8MjDBcGDt3YBuhPg@mail.gmail.com>
Subject: Re: [PATCH v2 10/10] riscv: Add qspinlock support based on Zabha extension
To: Waiman Long <longman@redhat.com>
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andrea Parri <parri.andrea@gmail.com>, 
	Nathan Chancellor <nathan@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240715_180508_885863_C2815DD3 
X-CRM114-Status: GOOD (  22.44  )
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

T24gVHVlLCBKdWwgMTYsIDIwMjQgYXQgMzozMOKAr0FNIFdhaW1hbiBMb25nIDxsb25nbWFuQHJl
ZGhhdC5jb20+IHdyb3RlOgo+Cj4gT24gNy8xNS8yNCAwMzoyNywgQWxleGFuZHJlIEdoaXRpIHdy
b3RlOgo+ID4gSGkgR3VvLAo+ID4KPiA+IE9uIFN1biwgSnVsIDcsIDIwMjQgYXQgNDoyMOKAr0FN
IEd1byBSZW4gPGd1b3JlbkBrZXJuZWwub3JnPiB3cm90ZToKPiA+PiBPbiBXZWQsIEp1biAyNiwg
MjAyNCBhdCA5OjE04oCvUE0gQWxleGFuZHJlIEdoaXRpIDxhbGV4Z2hpdGlAcml2b3NpbmMuY29t
PiB3cm90ZToKPiA+Pj4gSW4gb3JkZXIgdG8gcHJvZHVjZSBhIGdlbmVyaWMga2VybmVsLCBhIHVz
ZXIgY2FuIHNlbGVjdAo+ID4+PiBDT05GSUdfQ09NQk9fU1BJTkxPQ0tTIHdoaWNoIHdpbGwgZmFs
bGJhY2sgYXQgcnVudGltZSB0byB0aGUgdGlja2V0Cj4gPj4+IHNwaW5sb2NrIGltcGxlbWVudGF0
aW9uIGlmIFphYmhhIGlzIG5vdCBwcmVzZW50Lgo+ID4+Pgo+ID4+PiBOb3RlIHRoYXQgd2UgY2Fu
J3QgdXNlIGFsdGVybmF0aXZlcyBoZXJlIGJlY2F1c2UgdGhlIGRpc2NvdmVyeSBvZgo+ID4+PiBl
eHRlbnNpb25zIGlzIGRvbmUgdG9vIGxhdGUgYW5kIHdlIG5lZWQgdG8gc3RhcnQgd2l0aCB0aGUg
cXNwaW5sb2NrCj4gPj4gVGhhdCdzIG5vdCB0cnVlOyB3ZSB0cmVhdCBzcGlubG9jayBhcyBxc3Bp
bmxvY2sgYXQgZmlyc3QuCj4gPiBUaGF0J3Mgd2hhdCBJIHNhaWQ6IHdlIGhhdmUgdG8gdXNlIHRo
ZSBxc3BpbmxvY2sgaW1wbGVtZW50YXRpb24gYXQKPiA+IGZpcnN0ICpiZWNhdXNlKiB3ZSBjYW4n
dCBkaXNjb3ZlciB0aGUgZXh0ZW5zaW9ucyBzb29uIGVub3VnaCB0byB1c2UKPiA+IHRoZSByaWdo
dCBzcGlubG9jayBpbXBsZW1lbnRhdGlvbiBiZWZvcmUgdGhlIGtlcm5lbCB1c2VzIGEgc3Bpbmxv
Y2suCj4gPiBBbmQgc2luY2UgdGhlIHNwaW5sb2NrcyBhcmUgdXNlZCAqYmVmb3JlKiB0aGUgZGlz
Y292ZXJ5IG9mIHRoZQo+ID4gZXh0ZW5zaW9ucywgd2UgY2Fubm90IHVzZSB0aGUgY3VycmVudCBh
bHRlcm5hdGl2ZSBtZWNoYW5pc20gb3Igd2UnZAo+ID4gbmVlZCB0byBleHRlbmQgaXQgdG8gYWRk
IGFuICJpbml0aWFsIiB2YWx1ZSB3aGljaCBkb2VzIG5vdCBkZXBlbmQgb24KPiA+IHRoZSBhdmFp
bGFibGUgZXh0ZW5zaW9ucy4KPgo+IFdpdGggcXNwaW5sb2NrLCB0aGUgbG9jayByZW1haW5zIHpl
cm8gYWZ0ZXIgYSBsb2NrL3VubG9jayBzZXF1ZW5jZS4gVGhhdAo+IGlzIG5vdCB0aGUgY2FzZSB3
aXRoIHRpY2tldCBsb2NrLiBBc3N1bWluZyB0aGF0IGFsbCB0aGUgZGlzY292ZXJ5IHdpbGwKPiBi
ZSBkb25lIGJlZm9yZSBTTVAgYm9vdCwgdGhlIHFzcGlubG9jayBzbG93cGF0aCB3b24ndCBiZSBh
Y3RpdmF0ZWQgYW5kCj4gc28gd2UgZG9uJ3QgbmVlZCB0aGUgcHJlc2VuY2Ugb2YgYW55IGV4dGVu
c2lvbi4gSSBiZWxpZXZlIHRoYXQgaXMgdGhlCj4gbWFpbiByZWFzb24gd2h5IHFzcGlubG9jayBp
cyB1c2VkIGFzIHRoZSBpbml0aWFsIGRlZmF1bHQgYW5kIG5vdCB0aWNrZXQKPiBsb2NrLgpUaHgg
V2FpbWFuLApZZXMsIHFzcGlubG9jayBpcyBhIGNsZWFuIGd1eSwgYnV0IHRpY2tldCBsb2NrIGlz
IGEgZGlydHkgb25lLgoKSGkgQWxleGFuZHJlLApUaGVyZWZvcmUsIHRoZSBzd2l0Y2ggcG9pbnQo
YmVmb3JlIHJlc2V0X2luaXQoKSkgaXMgbGF0ZSBlbm91Z2ggdG8KY2hhbmdlIHRoZSBsb2NrIG1l
Y2hhbmlzbSwgYW5kIHRoaXMgc2F0aXNmaWVzIHRoZSByZXF1aXJlbWVudHMgb2YKYXBwbHlfYm9v
dF9hbHRlcm5hdGl2ZXMoKSwgYXBwbHlfZWFybHlfYm9vdF9hbHRlcm5hdGl2ZXMoKSwgYW5kCmFw
cGx5X21vZHVsZV9hbHRlcm5hdGl2ZXMoKS4KCj4KPiBDaGVlcnMsCj4gTG9uZ21hbgo+CgoKLS0g
CkJlc3QgUmVnYXJkcwogR3VvIFJlbgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
