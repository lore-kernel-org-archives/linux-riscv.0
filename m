Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DDEACDB465
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Oct 2023 07:51:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=We9e0BCBFmadRAoK+uQytj0cLPekuYL0w2d+H4gQqx4=; b=0FfJR3HdJa/wuo
	1rM4ZYkiGx7CXTJwwtNykZ4yo5LpF8XAlXnrAlsrUIx9eIBS/z8LfIEeQ9n87Sh8UiidHzZdQGOzn
	WHqqZedQUK+CNqA9a6wuXscs7A56oSAfDktGICEqLArtmvWl3/6g3HPp7kAT0Je4WJMJJqnR86pIo
	BwWtWySfByLzMcNtrIHEtKzq4clSssCU3vZNt8abgsCgB0tKMvB2ks4agOLPwtRYCota3IgsqodrW
	XHT77JMCWaAnUByTDxUKxsABcmUmD943ki2NfyriGAr1JsXxkYY2+whNzJxbQrOQZ9epgPHvEFXrt
	028aCGgu9tfbeJwbIJIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNod-00GdtW-0x;
	Thu, 19 Oct 2023 07:51:35 +0000
Received: from mail-vk1-xa2b.google.com ([2607:f8b0:4864:20::a2b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qtNoa-00Gdsl-2s
	for linux-riscv@lists.infradead.org;
	Thu, 19 Oct 2023 07:51:34 +0000
Received: by mail-vk1-xa2b.google.com with SMTP id 71dfb90a1353d-49abb53648aso2467875e0c.0
        for <linux-riscv@lists.infradead.org>; Thu, 19 Oct 2023 00:51:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697701891; x=1698306691; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsOX/L/sb6A3fqcr0em26oFWSZmsQHoEXu6LXbRfSC8=;
        b=nTSaN5AWMa3wvN1kPGVToJKZLQZE8pcklDNMSEK1UxOApMtnnzNqJQVP+G3H/TMPQe
         fJzRtFSpAdYd0NfbV9aEjUi5kvw+zLZT7t7jR9ufOhckRbtyzafnQPsaSnIN+GjOReIa
         P/PtlngPiUO44fiySkykNb1gBt07GZuNSAIGEEstZuUaorZWUgsWiIziGUyngT/QjLwH
         o6DAv++CXPFqpKI6gAHTuG9oEAdfAPl97/lb2hIStz5Hfn+PYrouNzqh4tv25Q8wg1oI
         7+FLGLWJF28pCRRRThnauE2jzzL+3M2SzE54yhn/7oQ+C01UvvaCZU1QbeYYCTP0z0GI
         47gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697701891; x=1698306691;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JsOX/L/sb6A3fqcr0em26oFWSZmsQHoEXu6LXbRfSC8=;
        b=GPBKWmq8kHNft2NUaBbaCaek//tXcw/G6SCt/6EqVBt+gQkDPZUObPJjb+3M2k0FSq
         6pHEUBA2t0dam09eDYXfJ37yilRpM/pYihx/SH7N8FBqczG/BcDgR7S68YO1EtBSp1bz
         AJkvkzDhtyzpUev70Q/YSp4JxTyZodG0hrDdYzi2rwwffUrQ3aNFwmEUtbapMzhe3sHJ
         3LyLlvu6d6H1Oy3uuLUsIt3aA9QZvQ5/Og5fTv+8pBCE/eAAPD9IcyPZYo4UTRq1CfZy
         FoCkDARGrHxg6FlcK0q1L8bKiClwzO8dlBC0SBGpulD+pY+6K5NxwLMk6EDJLpvZwQsy
         IEtQ==
X-Gm-Message-State: AOJu0YxnmvryChPK05jEmMZ4bdGK9wuKotPn+Qwzva8ugJ/e2zaLeOcl
	v1VyUGKNPwIAcTDth/dBJQZJP6Ub2zp3co/ycwY=
X-Google-Smtp-Source: AGHT+IHB4NyCllRmnnE0g8nDkzQDqJscngySlBPZfL3R5IyzuwPE3KSvUMmz59rOXaoueNP5HZI4gQyCy9+6kTrdxZo=
X-Received: by 2002:a1f:2982:0:b0:490:b58e:75a9 with SMTP id
 p124-20020a1f2982000000b00490b58e75a9mr1047152vkp.4.1697701890749; Thu, 19
 Oct 2023 00:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20230818194136.4084400-1-evan@rivosinc.com> <20230818194136.4084400-2-evan@rivosinc.com>
 <CAMuHMdVtXGjP8VFMiv-7OMFz1XvfU1cz=Fw4jL3fcp4wO1etzQ@mail.gmail.com>
 <CALs-Hsvu7BsK8P0+xeuLmKEqg-q=kQANbf8FkiPGPhwhnSXpmA@mail.gmail.com>
 <CAMuHMdV594xA1UoTeVixpXm3i5LDFO5cT=dd_iRwWLwvxQctZg@mail.gmail.com> <CAMuHMdUG3SUVPJHSiNyQNzyqxiJpczUHhBxHN7YqEDcaWYwkFA@mail.gmail.com>
In-Reply-To: <CAMuHMdUG3SUVPJHSiNyQNzyqxiJpczUHhBxHN7YqEDcaWYwkFA@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 19 Oct 2023 08:51:04 +0100
Message-ID: <CA+V-a8v2h7+mNjx=7W4_K2Afr5VY1-C5pqQiNMX2bFZE_gT47A@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] RISC-V: Probe for unaligned access speed
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Palmer Dabbelt <palmer@rivosinc.com>, Heiko Stuebner <heiko@sntech.de>, linux-doc@vger.kernel.org, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org, 
	Jonathan Corbet <corbet@lwn.net>, Sia Jee Heng <jeeheng.sia@starfivetech.com>, 
	Marc Zyngier <maz@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, 
	Greentime Hu <greentime.hu@sifive.com>, Simon Hosie <shosie@rivosinc.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <apatel@ventanamicro.com>, 
	linux-kernel@vger.kernel.org, Xianting Tian <xianting.tian@linux.alibaba.com>, 
	David Laight <David.Laight@aculab.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Andy Chiu <andy.chiu@sifive.com>, Evan Green <evan@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231019_005132_927968_E57A42B7 
X-CRM114-Status: GOOD (  38.22  )
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

SGkgR2VlcnQsCgpPbiBUaHUsIE9jdCAxOSwgMjAyMyBhdCA3OjQw4oCvQU0gR2VlcnQgVXl0dGVy
aG9ldmVuIDxnZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4KPiBIaSBQcmFiYWhrYXIsCj4K
PiBPbiBUaHUsIFNlcCAxNCwgMjAyMyBhdCA5OjMy4oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxn
ZWVydEBsaW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiBPbiBXZWQsIFNlcCAxMywgMjAyMyBhdCA3
OjQ24oCvUE0gRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+IHdyb3RlOgo+ID4gPiBPbiBX
ZWQsIFNlcCAxMywgMjAyMyBhdCA1OjM24oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBs
aW51eC1tNjhrLm9yZz4gd3JvdGU6Cj4gPiA+ID4gT24gRnJpLCBBdWcgMTgsIDIwMjMgYXQgOTo0
NOKAr1BNIEV2YW4gR3JlZW4gPGV2YW5Acml2b3NpbmMuY29tPiB3cm90ZToKPiA+ID4gPiA+IFJh
dGhlciB0aGFuIGRlZmVycmluZyB1bmFsaWduZWQgYWNjZXNzIHNwZWVkIGRldGVybWluYXRpb25z
IHRvIGEgdmVuZG9yCj4gPiA+ID4gPiBmdW5jdGlvbiwgbGV0J3MgcHJvYmUgdGhlbSBhbmQgZmlu
ZCBvdXQgaG93IGZhc3QgdGhleSBhcmUuIElmIHdlCj4gPiA+ID4gPiBkZXRlcm1pbmUgdGhhdCBh
biB1bmFsaWduZWQgd29yZCBhY2Nlc3MgaXMgZmFzdGVyIHRoYW4gTiBieXRlIGFjY2Vzc2VzLAo+
ID4gPiA+ID4gbWFyayB0aGUgaGFyZHdhcmUncyB1bmFsaWduZWQgYWNjZXNzIGFzICJmYXN0Ii4g
T3RoZXJ3aXNlLCB3ZSBtYXJrCj4gPiA+ID4gPiBhY2Nlc3NlcyBhcyBzbG93Lgo+ID4gPiA+ID4K
PiA+ID4gPiA+IFRoZSBhbGdvcml0aG0gaXRzZWxmIHJ1bnMgZm9yIGEgZml4ZWQgYW1vdW50IG9m
IGppZmZpZXMuIFdpdGhpbiBlYWNoCj4gPiA+ID4gPiBpdGVyYXRpb24gaXQgYXR0ZW1wdHMgdG8g
dGltZSBhIHNpbmdsZSBsb29wLCBhbmQgdGhlbiBrZWVwcyBvbmx5IHRoZSBiZXN0Cj4gPiA+ID4g
PiAoZmFzdGVzdCkgbG9vcCBpdCBzYXcuIFRoaXMgYWxnb3JpdGhtIHdhcyBmb3VuZCB0byBoYXZl
IGxvd2VyIHZhcmlhbmNlIGZyb20KPiA+ID4gPiA+IHJ1biB0byBydW4gdGhhbiBteSBmaXJzdCBh
dHRlbXB0LCB3aGljaCBjb3VudGVkIHRoZSB0b3RhbCBudW1iZXIgb2YKPiA+ID4gPiA+IGl0ZXJh
dGlvbnMgdGhhdCBjb3VsZCBiZSBkb25lIGluIHRoYXQgZml4ZWQgYW1vdW50IG9mIGppZmZpZXMu
IEJ5IHRha2luZwo+ID4gPiA+ID4gb25seSB0aGUgYmVzdCBpdGVyYXRpb24gaW4gdGhlIGxvb3As
IGFzc3VtaW5nIGF0IGxlYXN0IG9uZSBsb29wIHdhc24ndAo+ID4gPiA+ID4gcGVydHVyYmVkIGJ5
IGFuIGludGVycnVwdCwgd2UgZWxpbWluYXRlIHRoZSBlZmZlY3RzIG9mIGludGVycnVwdHMgYW5k
Cj4gPiA+ID4gPiBvdGhlciAid2FybSB1cCIgZmFjdG9ycyBsaWtlIGJyYW5jaCBwcmVkaWN0aW9u
LiBUaGUgb25seSBkb3duc2lkZSBpcyBpdAo+ID4gPiA+ID4gZGVwZW5kcyBvbiBoYXZpbmcgYW4g
cmR0aW1lIGdyYW51bGFyIGFuZCBhY2N1cmF0ZSBlbm91Z2ggdG8gbWVhc3VyZSBhCj4gPiA+ID4g
PiBzaW5nbGUgY29weS4gSWYgd2UgZXZlciBtYW5hZ2UgdG8gY29tcGxldGUgYSBsb29wIGluIDAg
cmR0aW1lIHRpY2tzLCB3ZQo+ID4gPiA+ID4gbGVhdmUgdGhlIHVuYWxpZ25lZCBzZXR0aW5nIGF0
IFVOS05PV04uCj4gPiA+ID4gPgo+ID4gPiA+ID4gVGhlcmUgaXMgYSBzbGlnaHQgY2hhbmdlIGlu
IHVzZXItdmlzaWJsZSBiZWhhdmlvciBoZXJlLiBQcmV2aW91c2x5LCBhbGwKPiA+ID4gPiA+IGJv
YXJkcyBleGNlcHQgdGhlIFRIZWFkIEM5MDYgcmVwb3J0ZWQgbWlzYWxpZ25lZCBhY2Nlc3Mgc3Bl
ZWQgb2YKPiA+ID4gPiA+IFVOS05PV04uIEM5MDYgcmVwb3J0ZWQgRkFTVC4gV2l0aCB0aGlzIGNo
YW5nZSwgc2luY2Ugd2UncmUgbm93IG1lYXN1cmluZwo+ID4gPiA+ID4gbWlzYWxpZ25lZCBhY2Nl
c3Mgc3BlZWQgb24gZWFjaCBoYXJ0LCBhbGwgUklTQy1WIHN5c3RlbXMgd2lsbCBoYXZlIHRoaXMK
PiA+ID4gPiA+IGtleSBzZXQgYXMgZWl0aGVyIEZBU1Qgb3IgU0xPVy4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBDdXJyZW50bHksIHdlIGRvbid0IGhhdmUgYSB3YXkgdG8gY29uZmlkZW50bHkgbWVhc3Vy
ZSB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuCj4gPiA+ID4gPiBTTE9XIGFuZCBFTVVMQVRFRCwgc28g
d2UgbGFiZWwgYW55dGhpbmcgbm90IGZhc3QgYXMgU0xPVy4gVGhpcyB3aWxsCj4gPiA+ID4gPiBt
aXNsYWJlbCBzb21lIHN5c3RlbXMgdGhhdCBhcmUgYWN0dWFsbHkgRU1VTEFURUQgYXMgU0xPVy4g
V2hlbiB3ZSBnZXQKPiA+ID4gPiA+IHN1cHBvcnQgZm9yIGRlbGVnYXRpbmcgbWlzYWxpZ25lZCBh
Y2Nlc3MgdHJhcHMgdG8gdGhlIGtlcm5lbCAoYXMgb3Bwb3NlZAo+ID4gPiA+ID4gdG8gdGhlIGZp
cm13YXJlIHF1aWV0bHkgaGFuZGxpbmcgaXQpLCB3ZSBjYW4gZXhwbGljaXRseSB0ZXN0IGluIExp
bnV4IHRvCj4gPiA+ID4gPiBzZWUgaWYgdW5hbGlnbmVkIGFjY2Vzc2VzIHRyYXAuIFRob3NlIHN5
c3RlbXMgd2lsbCBzdGFydCB0byByZXBvcnQKPiA+ID4gPiA+IEVNVUxBVEVELCB0aG91Z2ggb2xk
ZXIgKHRvZGF5J3MpIHN5c3RlbXMgd2l0aG91dCB0aGF0IG5ldyBTQkkgbWVjaGFuaXNtCj4gPiA+
ID4gPiB3aWxsIGNvbnRpbnVlIHRvIHJlcG9ydCBTTE9XLgo+ID4gPiA+ID4KPiA+ID4gPiA+IEkn
dmUgdXBkYXRlZCB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgdGhvc2UgaHdwcm9iZSB2YWx1ZXMgdG8g
cmVmbGVjdAo+ID4gPiA+ID4gdGhpcywgc3BlY2lmaWNhbGx5OiBTTE9XIG1heSBvciBtYXkgbm90
IGJlIGVtdWxhdGVkIGJ5IHNvZnR3YXJlLCBhbmQgRkFTVAo+ID4gPiA+ID4gcmVwcmVzZW50cyBt
ZWFucyBiZWluZyBmYXN0ZXIgdGhhbiBlcXVpdmFsZW50IGJ5dGUgYWNjZXNzZXMuIFRoZSBjaGFu
Z2UKPiA+ID4gPiA+IGluIGRvY3VtZW50YXRpb24gaXMgYWNjdXJhdGUgd2l0aCByZXNwZWN0IHRv
IGJvdGggdGhlIGZvcm1lciBhbmQgY3VycmVudAo+ID4gPiA+ID4gYmVoYXZpb3IuCj4gPiA+ID4g
Pgo+ID4gPiA+ID4gU2lnbmVkLW9mZi1ieTogRXZhbiBHcmVlbiA8ZXZhbkByaXZvc2luYy5jb20+
Cj4gPiA+ID4gPiBBY2tlZC1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlw
LmNvbT4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCwgd2hpY2ggaXMgbm93
IGNvbW1pdCA1ODRlYTY1NjRiY2FlYWQyICgiUklTQy1WOgo+ID4gPiA+IFByb2JlIGZvciB1bmFs
aWduZWQgYWNjZXNzIHNwZWVkIikgaW4gdjYuNi1yYzEuCj4gPiA+ID4KPiA+ID4gPiBPbiB0aGUg
Ym9hcmRzIEkgaGF2ZSwgSSBnZXQ6Cj4gPiA+ID4KPiA+ID4gPiAgICAgcnpmaXZlOgo+ID4gPiA+
ICAgICAgICAgY3B1MDogUmF0aW8gb2YgYnl0ZSBhY2Nlc3MgdGltZSB0byB1bmFsaWduZWQgd29y
ZCBhY2Nlc3MgaXMKPiA+ID4gPiAxLjA1LCB1bmFsaWduZWQgYWNjZXNzZXMgYXJlIGZhc3QKPiA+
ID4KPiA+ID4gSHJtLCBJJ20gYSBsaXR0bGUgc3VycHJpc2VkIHRvIGJlIHNlZWluZyB0aGlzIG51
bWJlciBjb21lIG91dCBzbyBjbG9zZQo+ID4gPiB0byAxLiBJZiB5b3UgcmVib290IGEgZmV3IHRp
bWVzLCB3aGF0IGtpbmQgb2YgdmFyaWFuY2UgZG8geW91IGdldCBvbgo+ID4gPiB0aGlzPwo+ID4K
PiA+IFJvY2stc29saWQgYXQgMS4wNSAoZXZlbiB3aXRoIGluY3JlYXNlZCByZXNvbHV0aW9uOiAx
LjA1ODUzIG9uIDMgdHJpZXMpCj4KPiBBZnRlciB1cGdyYWRpbmcgdGhlIGZpcm13YXJlIGZyb20g
WzFdIHRvIFsyXSwgdGhpcyBjaGFuZ2VkIHRvCj4gIjAuMDAsIHVuYWxpZ25lZCBhY2Nlc3NlcyBh
cmUgc2xvdyIuCj4KPiBbMV0gUlotRml2ZS1FVEgKPiAgICAgVS1Cb290IDIwMjAuMTAtZzYxMWM2
NTdlNDMgKEF1ZyAyNiAyMDIyIC0gMTE6Mjk6MDYgKzAxMDApCj4KPiBbMl0gT3BlblNCSSB2MS4z
LTc1LWczY2YwZWE0Cj4gICAgIFUtQm9vdCAyMDIzLjAxLTAwMjA5LWcxODA0YzhhYjE3IChPY3Qg
MDQgMjAyMyAtIDEzOjE4OjAxICswMTAwKQo+ClRoYW5rcywgbGV0IG1lIGdvIHRocm91Z2ggdGhl
IGNoYW5nZXMuCgpDaGVlcnMsClByYWJoYWthcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
