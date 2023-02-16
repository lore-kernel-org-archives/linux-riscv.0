Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1BDC61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 23:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWIzRH3zqN6k9my5RIsgJ/D0GKjNwNDfTm+1bJq5y9s=; b=nAORxCS+RbG8Mo
	otMUPf/CJoI8zwXxflLf02Uwh6rjvZA5HKOdL3PCCaIl2nRE5TykmctVvmRcRb6qgY2LGHWhCMUbs
	fW2dCvrt7ZacouvrwgAg8nXS81HO8jWpLicFdjrqyI4FEY/OtBmT8ITs70iw04yHKtLv0SXkSVSKY
	kM0jXb8VQL95ipn46vOUMU/BnAAiqKC6XwqZxkJ/nFOVqRHxD19XHZPvwLY9AOOHnoxDqnAJPuAiE
	74cRuyeneU8rhLEfcUdy7+h6q89zn2HR9qD58QqaRftsJF8wEWxrtarmx07r8ILmLA/5fDpibGHcm
	euSTUa17zIM13glm5baw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSnXJ-00C6cH-Kg; Thu, 16 Feb 2023 23:19:33 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pSnXG-00C6as-K7
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 23:19:32 +0000
Received: by mail-lf1-x12c.google.com with SMTP id w11so4707820lfu.11
        for <linux-riscv@lists.infradead.org>; Thu, 16 Feb 2023 15:19:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QuO7vwGoOqdehwY6pqxVzJ9kdVjxxXH/3O2BPwil+Ps=;
        b=zYVTTyh/hg97GwfGgLK3MjOi0ALc/LOCuuyuUxgdlGxBYM5iui3yw2y/DJ/yZbiMKn
         PpEZ8PuSpksvmy+jfy1rFSc9xfLF/4p1r80LMmvSj30bRggPoJsaVIZyDPdCrMn8bjno
         pixn8w08Zf8lPPHPFPgNm7ICQjbU+mzAnvDbO9ZE346uW897c6el7wTUAW011DK6pJBG
         MncC+8Id/WGOAIeleavJ1vrvX19IT9aNgYn8HKr74tlv4jqj9kMQ0XfdR9sGbmuPI2ij
         yfYjmTPC/ZKivABzI3T44Pfv2TrmHa/QF4gl2BxWvW6TyFySOAejiXJJzblE0+Y4rRW/
         f6CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuO7vwGoOqdehwY6pqxVzJ9kdVjxxXH/3O2BPwil+Ps=;
        b=HTGjnrE9su5S2the+mY6ZrhSGmz7IkRACIKXbXjs+EMG47vEe5r5Q2dBsncHAB+ey6
         r8qNbhIZJPWY30RTHCiumIDPQs+NKPRJX2mFjVsyttF30xYRYbq724fFUAaM+DJiVb5L
         7yIXCuH3im/cMG4M4kvAdNxXrVCAA77F5SWE5Tt76CxDgOwltTKWt5ah8PMEv+l7+8g2
         sBgLDI/7qTbxJaFzmFIXJFRNAJ4LOyKlZyVRXAZVNtOO7sE0hZOC6e6C4tG9RicAi22a
         iyaHJPtH4Fh6h2uCnjoVeilMGMlG0VnE7AJnfye9OKporylRfNfCZmgWed3BpwGQ8QNX
         dfng==
X-Gm-Message-State: AO0yUKXbuZM8vlyrU2B/5AHy2rerPuxPPuv6157njS20dxQPl7U/S0xS
	ZOrN7+44OL1JGoUqVazI6HFVe3Im623RMgUipSWXeg==
X-Google-Smtp-Source: AK7set/bHPEPiCF7ABIwAYwHhJ93j6aVjwc5DsJvP1JwGfHRwCixVRwQ4IYybqkOks8P+AzIzxXJUhvC/3k9tQ82wtE=
X-Received: by 2002:a05:6512:507:b0:4dc:807a:d14a with SMTP id
 o7-20020a056512050700b004dc807ad14amr413602lfb.9.1676589567141; Thu, 16 Feb
 2023 15:19:27 -0800 (PST)
MIME-Version: 1.0
References: <20230206201455.1790329-1-evan@rivosinc.com> <20230206201455.1790329-3-evan@rivosinc.com>
 <ded4018d-c90f-41c7-9e54-da954bdef49e@app.fastmail.com> <CALs-HsuwOqR+y-GriKOiRx068bgOv3qTOpsJTaA02htiiynWmw@mail.gmail.com>
 <6FA7F803-1B4A-418E-9368-E205F3A6CF27@jrtc27.com> <ed5133d1-5592-4367-8919-4416be506455@app.fastmail.com>
In-Reply-To: <ed5133d1-5592-4367-8919-4416be506455@app.fastmail.com>
From: Evan Green <evan@rivosinc.com>
Date: Thu, 16 Feb 2023 15:18:51 -0800
Message-ID: <CALs-HstoeoTWjTEZrLWouCgwq0t3tDB6uL=tB68RJDs1ub4Frw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] RISC-V: Add a syscall for HW probing
To: Arnd Bergmann <arnd@arndb.de>
Cc: Jessica Clarke <jrtc27@jrtc27.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
	linux-doc@vger.kernel.org, Andrew Bresticker <abrestic@rivosinc.com>, 
	Atish Patra <atishp@rivosinc.com>, Palmer Dabbelt <palmer@rivosinc.com>, 
	"Conor.Dooley" <conor.dooley@microchip.com>, Celeste Liu <coelacanthus@outlook.com>, 
	slewis@rivosinc.com, Bagas Sanjaya <bagasdotme@gmail.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, Jonathan Corbet <corbet@lwn.net>, 
	Tobias Klauser <tklauser@distanz.ch>, Andrew Jones <ajones@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Vineet Gupta <vineetg@rivosinc.com>, 
	Dao Lu <daolu@rivosinc.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Ruizhe Pan <c141028@gmail.com>, Anup Patel <apatel@ventanamicro.com>, 
	Randy Dunlap <rdunlap@infradead.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, guoren <guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_151930_871479_AC0C11F8 
X-CRM114-Status: GOOD (  29.55  )
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

T24gVGh1LCBGZWIgMTYsIDIwMjMgYXQgNTozMCBBTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRi
LmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgRmViIDE1LCAyMDIzLCBhdCAyMzo0MywgSmVzc2ljYSBD
bGFya2Ugd3JvdGU6Cj4gPiBPbiAxNSBGZWIgMjAyMywgYXQgMjE6MTQsIEV2YW4gR3JlZW4gPGV2
YW5Acml2b3NpbmMuY29tPiB3cm90ZToKPiA+PiBPbiBXZWQsIEZlYiAxNSwgMjAyMyBhdCAxOjU3
IEFNIEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIuZGU+IHdyb3RlOgo+ID4+IFBhbG1lciBjYW4g
cHJvYmFibHkgc3BlYWsgdG8gdGhpcyB3aXRoIG1vcmUgYXV0aG9yaXR5LCBidXQgbXkKPiA+PiB1
bmRlcnN0YW5kaW5nIGFib3V0IHRoZSBtb3RpdmF0aW9uIGZvciBhbiBhcHByb2FjaCBsaWtlIHRo
aXMgZ29lcwo+ID4+IHNvbWV0aGluZyBsaWtlOgo+ID4+ICogV2l0aCB0aGUgbmF0dXJlIG9mIFJJ
U0MtViwgd2UgZXhwZWN0IGEgbG90IG9mIHRoZXNlIHR5cGVzIG9mIGJpdHMKPiA+PiBhbmQgYm9i
cywgbWFueSBtb3JlIHRoYW4gd2UndmUgc2VlbiB3aXRoIHRoZSBsaWtlcyBvZiB4ODYgYW5kIEFS
TS4KPiA+Cj4gPiBXZeKAmXJlIGFscmVhZHkgYXQgKEkgdGhpbmspIDUxIHN0YW5kYXJkIHVzZXIt
bGV2ZWwgZXh0ZW5zaW9ucyB0aGF0IExMVk0KPiA+IGtub3dzIGFib3V0Lgo+Cj4gRG8geW91IGhh
dmUgYW4gZXN0aW1hdGUgb2YgaG93IG1hbnkgb2YgdGhlc2UgcmVxdWlyZSBrZXJuZWwgc3VwcG9y
dAo+IGJleW9uZCBpZGVudGlmeWluZyB0aGUgZXh0ZW5zaW9ucz8KPgo+ID4+ICogV2UgYWxzbyBl
eHBlY3QgaW4gc29tZSBjYXNlcyB0aGVzZSB2YWx1ZXMgdG8gYmUgaW5jb25zaXN0ZW50IGFjcm9z
cyBDUFVzLgo+ID4KPiA+IFRoYXTigJlzIGFsc28gdHJ1ZSBvZiBzb21lIEFybSBTb0NzLgo+Cj4g
UmlnaHQsIGJ1dCBpdCdzIGFsc28gc29tZXRoaW5nIHRoYXQgd2Ugc2hvdWxkIG5vdCBlbmNvdXJh
Z2UsIG9yCj4gbmVlZCB0byBtYWtlIGVhc3kgdG8gdXNlLiBPbiBhcm02NCwgdGhlIGtlcm5lbCBz
dXBwb3J0IGZvciBoYXZpbmcKPiBhc3ltbWV0cmljIGFhcmNoMzIgbW9kZSB3YXMga2VwdCB0byBh
biBhYnNvbHV0ZSBtaW5pbXVtLCBhbmQgYW4KPiBhcHBsaWNhdGlvbiBpcyBleHBlY3RlZCB0byBn
ZXQgdGhlIGluZm9ybWF0aW9uIGZyb20gL3Byb2MvY3B1aW5mbwo+IGJlZm9yZSBwaW5uaW5nIGRv
d24gYSB0YXNrIHRvIHRoZSBjb3JyZWN0IHN1YnNldCBvZiBhbGwgQ1BVcy4KPgo+ID4+ICogU28s
IGEgc3lzY2FsbCB3aXRoIGEgdkRTTyBmdW5jdGlvbiBpbiBmcm9udCBvZiBpdCBzZWVtZWQgbGlr
ZSBhCj4gPj4gZ29vZCBjb21iaW5hdGlvbiBvZiBzcGVlZCBhbmQgZmxleGliaWxpdHkuCj4gPj4K
PiA+PiBZb3UncmUgY2VydGFpbmx5IHJpZ2h0IHRoYXQgSFdDQVBuIHdvdWxkIHdvcmsgZm9yIHdo
YXQgd2UncmUgZXhwb3NpbmcKPiA+PiB0b2RheSwgc28gdGhlIHF1ZXN0aW9uIHByb2JhYmx5IGNv
bWVzIGRvd24gdG8gb3VyIHJlbGF0aXZlIHByZWRpY3Rpb25zCj4gPj4gb2YgaG93IHRoaXMgZGF0
YSB3aWxsIGdyb3cuCj4gPgo+ID4gVGhlIG90aGVyIGJpZyBwcm9ibGVtIGlzIHZlbmRvciBleHRl
bnNpb25zLgoKU2luY2UgdGhlIGtleSByYW5nZSBjYW4gZ3JvdyB3aXRob3V0IGFjY3J1aW5nIGEg
cHJvY2VzcyBzdGFydHVwIHRpbWUKcGVuYWx0eSwgdGhpcyBwcm9wb3NhbCBoYW5kbGVzIHZlbmRv
ciBleHRlbnNpb25zIGZhaXJseSB3ZWxsLCBubz8KKENvbnRyYXN0aW5nIGF0IGxlYXN0IGFnYWlu
c3QgaHdjYXAgYml0cywgd2hpY2ggb25jZSBhbGxvY2F0ZWQgaGF2ZSB0bwpiZSBjb3BpZWQgaW50
byBldmVyeSBuZXcgcHJvY2VzcyBmb3JldmVyKS4KCj4KPiBNeSBiaWdnZXN0IGNvbmNlcm4gaXMg
aG93IHRoaXMgd291bGQgYmUgc3luY2hyb25pemVkIGJldHdlZW4gdGhlCj4gaW50ZXJmYWNlcyB0
aGF0IGFyZSBhdmFpbGFibGUgdG8gdXNlcnMuIFdoYXQgd2UgaGF2ZSBvbiBvdGhlciBhcmNoaXRl
Y3R1cmVzCj4gaXMgYSBzZXQgb2Ygc3RyaW5nIGlkZW50aWZpZXJzIGluIC9wcm9jL2NwdWluZm8g
YW5kIGEgYml0bWFzayBpbiBIV0NBUC4KPiBJZGVhbGx5IHRoZXNlIGFyZSBhZGRlZCBpbiBwYWly
cyBzbyB0aGUgaW5mb3JtYXRpb24gYXZhaWxhYmxlIHRvIHNoZWxsCj4gc2NyaXB0cyBpbiBodW1h
biByZWFkZXJzIGlzIHRoZSBzYW1lIHRoYXQgaXMgYXZhaWxhYmxlIGluIHRoZSBhdXh2ZWMKPiBk
YXRhLgo+Cj4gQWRkaW5nIGEgdGhpcmQgaW50ZXJmYWNlIHdpdGggdGhlIHNhbWUgaW5mb3JtYXRp
b24gb3IgYSBzdXBlcnNldAo+IHJlcXVpcmVzIG1vcmUgd29yayBpbiBlbnN1cmluZyB0aGF0IGVh
Y2ggZXh0ZW5zaW9uIGlzIGF2YWlsYWJsZQo+IGluIGV4YWN0bHkgdGhlIHJpZ2h0IHBsYWNlcy4g
SWRlYWxseSBJIHRoaW5rIHRoZXJlIHNob3VsZCBiZSBvbmx5Cj4gb25lIHRhYmxlIG9mIHBvc3Np
YmxlIENQVSBmZWF0dXJlcyBzbyBub2JvZHkgaGFzIHRvIG1ha2UgdGhlCj4gZGVjaXNpb24gYWJv
dXQgd2hpY2ggb25lcyBhcmUgaW1wb3J0YW50IGVub3VnaCB0byBhZGQgdG8gb25lCj4gaW50ZXJm
YWNlIG9yIGFub3RoZXIuCgpUaGF0IG1ha2VzIHNlbnNlLiBJbiB0aGlzIGNhc2UsIHRoZSBwcm9w
b3NhbCBpcyB0aGF0IFJJU0MtViB3b3VsZCB1c2UKdGhpcyBtZWNoYW5pc20gYW5kIGdlbmVyYWxs
eSBhYmFuZG9uIGh3Y2FwLiBTbyBteSBob3BlIGlzIHRoZXJlIHNob3VsZApzdGlsbCBvbmx5IGJl
IGFib3V0IDIgc3BvdHMgdG8gbWFpbnRhaW4uCi1FdmFuCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
