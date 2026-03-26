Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9B28106F2FC
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 08:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=45vabVe3Clc5OcUQgxTviyr7hBOM8wuyaLwBlgv5UP8=; b=PF6RoM1mYyy0gr
	yA2MHH19Qy2j+9esxgagMam99gR7l+9lDolFUhQlJK5NUo199uA2cheywHODBiwzLLLojTPfSBBW9
	fSKJQVDNap6pxJfQw7TbOq2Of5Z+Qz10GSaeq9ziADSUw1dftiBlI0Z2L3cgwJjq/UzZK3cYqv8fG
	INm5oeN+NLgpKB4dMhSrhiTAj6R0nkzTzvjRObUAJCHhYuZCicna4zKxhpOxwQmVVZbOlVbFKVxDT
	21MqyL479z4v7Mjyi/MLXLw3clFU5/K6OyYBhbPF/qv1dAirlsEYlr+EnJFKZyg5zNCVMUklygqmY
	lD865Fn88tmMAwWlz3aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gGK-000000052hi-1ut8;
	Thu, 26 Mar 2026 08:40:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gGK-000000052hA-089C
	for linux-riscv@bombadil.infradead.org;
	Thu, 26 Mar 2026 08:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:MIME-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RZIuiXRVUEe8C+bPC4WsRGZm1BjkEqR+1WT0JlENtHs=; b=gKzGNwZAIS9x4Nhb3R3EywFYas
	4sSbQgwp8D1bQCcOcp7ck5/z8olQ6pkllJQ5vCwryqQ+zIwKvQZ62FQn/TF04KXxiacIPkACVh1Mf
	b27IrJNbhfcVRrmuqtwT4ed/jvES5zYcwjiVPSfCePPFoo3s+4blHG/5cbhyMM/KSlZ7OSSWrjRM0
	kXhrlwpHSnhAo3ONaEzfBd61XYQ0z9s6IbtLaY+w2zZsi3cCA1Q4sKPVn6curQhmG5PBfjmHnfnG+
	WrttSPpm7Kj3hp5+A+UP8Cc6nP40hMZz+XbKoM0vjT3ABNrxYp8hnC8T3u/weZsDsYPfP8GQAzjId
	iS/9kCWA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gGF-00000007low-1EXv
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 08:40:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D94DC441EE
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 08:40:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA650C4AF0B
	for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 08:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774514411;
	bh=QfOa7OzRwwd4XlZR0+3Hhy9wDi0PAtKq+HHQAKzIr2Q=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ftVRdaDOnFGANoIrp9OBhja30/JqJdcf3WqhVM2IUvVXw1JgNZtfzpu2r9NuVwChu
	 joOjJsjzXJUWLt+dRFKmTpkTngVjS8DFiBoJ1ku8K6YdkYhh15H9U+Yj2GDrKUaEPa
	 Sw9pzt32LwMPHlNSpKHdfyI5x+h/+fpuWZY3hm3mQQQsUMdJKtH/Wy3RPLx5CSksGw
	 zJVQOUPBX2D/joxJX1uJJ01gj+2Q/gRrNklw3vit3m6/D4jR/LSLPCV+ciIuMS1O0K
	 0Tqg46eygQg5MxDMp9zjKRDyxww15tORBncfdovtYuhN55HeyXHK/qz7TQnyMLjRty
	 I2Wy4KJzpWdCg==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5a1307438ddso827955e87.1
        for <linux-riscv@lists.infradead.org>; Thu, 26 Mar 2026 01:40:11 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWk2WtQFWbIxl/jBjBCoeltk4EedYDJxpdRDyfbns9ptgWwaKVoByzKr3ZxLJBItxF7POdVBnX4Ze1KQw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7ZoEe1BpdZp/AzkP+H9d4GnwdF/7ayWWzWZxmaLkbxF0P3Y6o
	XLOMVCHim4AlJc4aYgrXfv64pdwQ1xibzEOtXm/Y6vHC/suC7vReCtN8nlke5KmQJz9PC2wxRe7
	hWWGSmWE783+tJN32rBn/vBjUty9sOL7YLnOFxW6SPQ==
X-Received: by 2002:a05:6512:a8f:b0:5a1:3da4:e92f with SMTP id
 2adb3069b0e04-5a29b9ab6d8mr2497661e87.43.1774514410393; Thu, 26 Mar 2026
 01:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20260325100144.1696731-1-arnd@kernel.org> <CAMRc=Mdwu85gghDjQEu4eP2HZxHjBFpph07q9SOfAifSDMtpVw@mail.gmail.com>
 <1789ce66-5a18-4b54-bbad-3b2049f2c26d@app.fastmail.com>
In-Reply-To: <1789ce66-5a18-4b54-bbad-3b2049f2c26d@app.fastmail.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 26 Mar 2026 09:39:57 +0100
X-Gmail-Original-Message-ID: <CAMRc=MfwR9POm3OvuJTRcg8sO1y=LRdBMrbVLQ=eZD177r49qw@mail.gmail.com>
X-Gm-Features: AQROBzDadLtwyr2raaFqkwGzyCOh9M5RUz_Gm02mFq1aGi1CGm9iwle9RVHpGLA
Message-ID: <CAMRc=MfwR9POm3OvuJTRcg8sO1y=LRdBMrbVLQ=eZD177r49qw@mail.gmail.com>
Subject: Re: [PATCH] gpio: fix up CONFIG_OF dependencies
To: Arnd Bergmann <arnd@arndb.de>
Cc: Arnd Bergmann <arnd@kernel.org>, Yixun Lan <dlan@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	"open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Linus Walleij <linusw@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_084015_653248_C6A3984E 
X-CRM114-Status: GOOD (  19.72  )
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

T24gV2VkLCBNYXIgMjUsIDIwMjYgYXQgMTE6NDHigK9BTSBBcm5kIEJlcmdtYW5uIDxhcm5kQGFy
bmRiLmRlPiB3cm90ZToKPgo+IE9uIFdlZCwgTWFyIDI1LCAyMDI2LCBhdCAxMTozMiwgQmFydG9z
eiBHb2xhc3pld3NraSB3cm90ZToKPiA+IE9uIFdlZCwgMjUgTWFyIDIwMjYgMTE6MDE6MTQgKzAx
MDAsIEFybmQgQmVyZ21hbm4gPGFybmRAa2VybmVsLm9yZz4gc2FpZDoKPiA+Pgo+ID4+IFdBUk5J
Tkc6IHVubWV0IGRpcmVjdCBkZXBlbmRlbmNpZXMgZGV0ZWN0ZWQgZm9yIEdQSU9fU1lTQ09OCj4g
Pj4gICBEZXBlbmRzIG9uIFtuXTogR1BJT0xJQiBbPXldICYmIEhBU19JT01FTSBbPXldICYmIE1G
RF9TWVNDT04gWz15XSAmJiBPRiBbPW5dCj4gPj4gICBTZWxlY3RlZCBieSBbeV06Cj4gPj4gICAt
IEdQSU9fU0FNQTVEMl9QSU9CVSBbPXldICYmIEdQSU9MSUIgWz15XSAmJiBIQVNfSU9NRU0gWz15
XSAmJiBNRkRfU1lTQ09OIFs9eV0gJiYgKEFSQ0hfQVQ5MSB8fCBDT01QSUxFX1RFU1QgWz15XSkK
PiA+Pgo+ID4KPiA+IFRoYW5rcyBhbmQgc29ycnkgZm9yIHRoZSBicmVha2FnZS4gSG93ZXZlciwg
SSdtIHdvbmRlcmluZyBpZiBpdCB3b3VsZG4ndCBtYWtlCj4gPiBzZW5zZSB0byBkbyB0aGUgZm9s
bG93aW5nOgo+ID4KPiA+Cj4gPiAtI2lmIGRlZmluZWQoQ09ORklHX09GX0dQSU8pCj4gPiAgICAg
ICAvKgo+ID4gICAgICAgICogSWYgQ09ORklHX09GX0dQSU8gaXMgZW5hYmxlZCwgdGhlbiBhbGwg
R1BJTyBjb250cm9sbGVycyBkZXNjcmliZWQgaW4KPiA+ICAgICAgICAqIHRoZSBkZXZpY2UgdHJl
ZSBhdXRvbWF0aWNhbGx5IG1heSBoYXZlIGFuIE9GIHRyYW5zbGF0aW9uCj4gLi4uCj4gPiBTeW1i
b2xzIGZyb20gbGludXgvb2YuaCBhcmUgc3R1YmJlZCBvdXQgYW5kIHRoZXNlIGRyaXZlcnMgY2Fu
IGJ1aWxkIGp1c3QgZmluZQo+ID4gd2l0aCAhQ09ORklHX09GLiBUaGlzIHdvdWxkIG5hdHVyYWxs
eSBpbmNyZWFzZSB0aGUgYnVpbGQgY292ZXJhZ2UuCj4KPiBJIGRvbid0IHRoaW5rIHdlIG5lZWQg
dG8gd29ycnkgYWJvdXQgdGhlIGJ1aWxkIGNvdmVyYWdlIGhlcmUsIENPTkZJR19PRgo+IGlzIHN0
aWxsIGluY2x1ZGVkIGluIHg4NiBhbGxtb2Rjb25maWcgYW5kIGhhbGYgdGhlIHJhbmRjb25maWcg
YnVpbGRzLAo+IHNvIHRoZSBkcml2ZXJzIGdldCBlbm91Z2ggZXhwb3N1cmUgZWl0aGVyIHdheS4K
Pgo+IE9uIHRoZSBvdGhlciBoYW5kLCBkcm9wcGluZyB0aGUgYnVpbGQgdGltZSBjaGVjayBtYXkg
aGVscCBhdm9pZAo+IGZ1dHVyZSBLY29uZmlnIGRlcGVuZGVuY3kgaXNzdWVzLCBzbyB0aGF0IHN0
aWxsIHNvdW5kcyBsaWtlIGEKPiByZWFzb25hYmxlIHN1Z2dlc3Rpb24uIEF0IGxlYXN0IENPTkZJ
R19HUElPX1NBTUE1RDJfUElPQlUKPiBpcyBnb2luZyB0byBuZWVkIHRoZSAnZGVwZW5kcyBvbiBP
RicgcmVnYXJkbGVzcyB0aG91Z2ggdG8gd29yawo+IGFyb3VuZCB0aGUgb3RoZXIgYnVpbGQgZXJy
b3IgSSBjaXRlZCBhYm92ZS4KPgo+ICAgICAgQXJuZAoKRmFpciBlbm91Z2gsIEknbGwgcXVldWUg
dGhpcyBwYXRjaC4KCkJhcnQKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
