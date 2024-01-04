Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A9F8C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 13:02:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QWMJmVx04wVbPjaAXz34C0mwbRsj3BRNkQtwjqAtYQk=; b=EoCmdN2zeR6F5W
	ErwCwG+7IA6Ae9Y7TLctfZiz/OOHRXwCk1aCjZ5dWPXV0aOyEdPgfABvLBZOMuzNL8juNWGCgkPny
	wDtw3eP3NunFWVzQaOSmSPFbV+TJewRHFClVJH8CGpsWZf+cDbrTb6TottWsvfA09H+q7cWZD45hz
	5hDVxKO9PVOfHWnsCbz/CAyQ2wmrfxWL2loiDequNNyAuGYaeIJkc5jdCkzm7KqcscNC8oByzgY3d
	4ys35aGstcmDrvud+xF7Uv0Prg9jwnvuvG2u+Vrfc7Hpub3KYvYNJrN8UCQc0cYFlNCWaRqL3u9Ly
	C0HRNg8i3tB7wAawsbCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLNMC-00E2jE-0O;
	Thu, 04 Jan 2024 13:01:56 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLNM9-00E2hV-0D
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 13:01:54 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a27cd5850d6so53353566b.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 05:01:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1704373311; x=1704978111; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/9OiB6Zr2X3JWx8/EcNzOysEraumuG0RSKA4yvIy1vs=;
        b=auGDbERWYJu65KNmO8vLRIxBrlzRaC1NjHARWdNdNP9VPkCkbWorUboaW1i99vYPSd
         +LxmO2NnBuHGpQIAyWx6ELHvYBoJ0Tzn8nUeDMZWmzsRMDJQ7RBzlcMMOAhJya7Dmcba
         CyClevZd7hyvYntlLeEnAbHJS2JN2rEfglqILy15Rbie47lN0HXGsf7Xu2NFuYK/kCjI
         33bfPM3HE5FOmgHyFyvTLhuOtrrAE4demazrNh4aWB5mtFsxjurevuNDQhq6bq7owgcj
         SU3/rHPZqof/cJmaljFqZL139v4G3QUX6jTrJwbnoYlQH8yJrLT1XhxvGe/VxTZKzzG1
         F25A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704373311; x=1704978111;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/9OiB6Zr2X3JWx8/EcNzOysEraumuG0RSKA4yvIy1vs=;
        b=lVEB3BHO5S2lcTm98Xf8biXlWu0FjGzO/j7FOZkQCKOmihbhDzq7IMflDnyj9EhZHS
         UlpcHF5KXqZOD1fWcn2mH92JS1ZZ3lMCigYD4etqsZoDy2GCPP0BOSRSM9EnPm7cw1g1
         eghxdJZxGGeH7t93w0s6vwSywNFxaoLMJqIjfqnD4VqWPLpA6oDVNuHjZsLDzzvNy1uq
         VSHAnNGiyzWDa+dDCw4zkeC20rOpKOyGwMGljC0stL8R1uT1gwJ7lBzpCeDvzwo4IJpQ
         jH20dW5yUiYfyjBITUSErOnqAy5WJhrniCa1nMj2UOZNd/eeCKUgeecVB6CRamIb14QT
         i81w==
X-Gm-Message-State: AOJu0Yy9qvgBNHgBQ6ecT9LQwVg4su29QSqXLBntfiZLAKGfN72R+pZP
	Z4NSlixWammWjkUUAjS9E7NjJAZNTEdhvIwOlQJFmgBz9SUAzg==
X-Google-Smtp-Source: AGHT+IGv4Nd1O7QiBVZ3icJngtwYGoUCGkSaR0BhUpZqYDOqHIhgeGA1hyWSfztxKwIkK4DFZEIwm3bDuFwwIzHa8xc=
X-Received: by 2002:a17:907:76ac:b0:a28:b9b8:2f8c with SMTP id
 jw12-20020a17090776ac00b00a28b9b82f8cmr268278ejc.152.1704373311541; Thu, 04
 Jan 2024 05:01:51 -0800 (PST)
MIME-Version: 1.0
References: <20240102220134.3229156-1-samuel.holland@sifive.com> <20240102220134.3229156-13-samuel.holland@sifive.com>
In-Reply-To: <20240102220134.3229156-13-samuel.holland@sifive.com>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Thu, 4 Jan 2024 14:01:40 +0100
Message-ID: <CAHVXubit8obRHkW9Uw+Ah=1y7cg-_y_8Ho=kzonjLFmeGYZwqQ@mail.gmail.com>
Subject: Re: [PATCH v4 12/12] riscv: mm: Always use an ASID to flush mm contexts
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_050153_326789_2ED415CB 
X-CRM114-Status: GOOD (  19.68  )
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

T24gVHVlLCBKYW4gMiwgMjAyNCBhdCAxMTowMeKAr1BNIFNhbXVlbCBIb2xsYW5kCjxzYW11ZWwu
aG9sbGFuZEBzaWZpdmUuY29tPiB3cm90ZToKPgo+IEV2ZW4gaWYgbXVsdGlwbGUgQVNJRHMgYXJl
IG5vdCBzdXBwb3J0ZWQsIHVzaW5nIHRoZSBzaW5nbGUtQVNJRCB2YXJpYW50Cj4gb2YgdGhlIHNm
ZW5jZS52bWEgaW5zdHJ1Y3Rpb24gcHJlc2VydmVzIFRMQiBlbnRyaWVzIGZvciBnbG9iYWwgKGtl
cm5lbCkKPiBwYWdlcy4gU28gaXQgaXMgYWx3YXlzIG1vcmUgZWZmaWNpZW50IHRvIHVzZSB0aGUg
c2luZ2xlLUFTSUQgY29kZSBwYXRoLgo+Cj4gU2lnbmVkLW9mZi1ieTogU2FtdWVsIEhvbGxhbmQg
PHNhbXVlbC5ob2xsYW5kQHNpZml2ZS5jb20+Cj4gLS0tCj4KPiBDaGFuZ2VzIGluIHY0Ogo+ICAt
IFRoZXJlIGlzIG5vdyBvbmx5IG9uZSBjb3B5IG9mIF9fZmx1c2hfdGxiX3JhbmdlKCkKPgo+IENo
YW5nZXMgaW4gdjI6Cj4gIC0gVXBkYXRlIGJvdGggY29waWVzIG9mIF9fZmx1c2hfdGxiX3Jhbmdl
KCkKPgo+ICBhcmNoL3Jpc2N2L2luY2x1ZGUvYXNtL21tdV9jb250ZXh0LmggfCAyIC0tCj4gIGFy
Y2gvcmlzY3YvbW0vY29udGV4dC5jICAgICAgICAgICAgICB8IDMgKy0tCj4gIGFyY2gvcmlzY3Yv
bW0vdGxiZmx1c2guYyAgICAgICAgICAgICB8IDMgKy0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMiBp
bnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vbW11X2NvbnRleHQuaCBiL2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vbW11X2Nv
bnRleHQuaAo+IGluZGV4IDcwMzA4MzdhZGMxYS4uYjA2NTk0MTNhMDgwIDEwMDY0NAo+IC0tLSBh
L2FyY2gvcmlzY3YvaW5jbHVkZS9hc20vbW11X2NvbnRleHQuaAo+ICsrKyBiL2FyY2gvcmlzY3Yv
aW5jbHVkZS9hc20vbW11X2NvbnRleHQuaAo+IEBAIC0zMyw4ICszMyw2IEBAIHN0YXRpYyBpbmxp
bmUgaW50IGluaXRfbmV3X2NvbnRleHQoc3RydWN0IHRhc2tfc3RydWN0ICp0c2ssCj4gICAgICAg
ICByZXR1cm4gMDsKPiAgfQo+Cj4gLURFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRSh1c2VfYXNpZF9h
bGxvY2F0b3IpOwo+IC0KPiAgI2luY2x1ZGUgPGFzbS1nZW5lcmljL21tdV9jb250ZXh0Lmg+Cj4K
PiAgI2VuZGlmIC8qIF9BU01fUklTQ1ZfTU1VX0NPTlRFWFRfSCAqLwo+IGRpZmYgLS1naXQgYS9h
cmNoL3Jpc2N2L21tL2NvbnRleHQuYyBiL2FyY2gvcmlzY3YvbW0vY29udGV4dC5jCj4gaW5kZXgg
M2NhOWI2NTNkZjdkLi4yMDA1NzA4NWFiOGEgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9yaXNjdi9tbS9j
b250ZXh0LmMKPiArKysgYi9hcmNoL3Jpc2N2L21tL2NvbnRleHQuYwo+IEBAIC0xOCw4ICsxOCw3
IEBACj4KPiAgI2lmZGVmIENPTkZJR19NTVUKPgo+IC1ERUZJTkVfU1RBVElDX0tFWV9GQUxTRSh1
c2VfYXNpZF9hbGxvY2F0b3IpOwo+IC0KPiArc3RhdGljIERFRklORV9TVEFUSUNfS0VZX0ZBTFNF
KHVzZV9hc2lkX2FsbG9jYXRvcik7Cj4gIHN0YXRpYyB1bnNpZ25lZCBsb25nIG51bV9hc2lkczsK
Pgo+ICBzdGF0aWMgYXRvbWljX2xvbmdfdCBjdXJyZW50X3ZlcnNpb247Cj4gZGlmZiAtLWdpdCBh
L2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IGlu
ZGV4IDVlYzYyMTU0NWM2OS4uMzlkODBmNTZkMjkyIDEwMDY0NAo+IC0tLSBhL2FyY2gvcmlzY3Yv
bW0vdGxiZmx1c2guYwo+ICsrKyBiL2FyY2gvcmlzY3YvbW0vdGxiZmx1c2guYwo+IEBAIC04NCw4
ICs4NCw3IEBAIHN0YXRpYyB2b2lkIF9fZmx1c2hfdGxiX3JhbmdlKHN0cnVjdCBtbV9zdHJ1Y3Qg
Km1tLCB1bnNpZ25lZCBsb25nIHN0YXJ0LAo+ICAgICAgICAgICAgICAgICBpZiAoY3B1bWFza19l
bXB0eShjbWFzaykpCj4gICAgICAgICAgICAgICAgICAgICAgICAgcmV0dXJuOwo+Cj4gLSAgICAg
ICAgICAgICAgIGlmIChzdGF0aWNfYnJhbmNoX3VubGlrZWx5KCZ1c2VfYXNpZF9hbGxvY2F0b3Ip
KQo+IC0gICAgICAgICAgICAgICAgICAgICAgIGFzaWQgPSBjbnR4MmFzaWQoYXRvbWljX2xvbmdf
cmVhZCgmbW0tPmNvbnRleHQuaWQpKTsKPiArICAgICAgICAgICAgICAgYXNpZCA9IGNudHgyYXNp
ZChhdG9taWNfbG9uZ19yZWFkKCZtbS0+Y29udGV4dC5pZCkpOwo+ICAgICAgICAgfSBlbHNlIHsK
PiAgICAgICAgICAgICAgICAgY21hc2sgPSBjcHVfb25saW5lX21hc2s7Cj4gICAgICAgICB9Cj4g
LS0KPiAyLjQyLjAKPgoKWW91IGNhbiBhZGQ6CgpSZXZpZXdlZC1ieTogQWxleGFuZHJlIEdoaXRp
IDxhbGV4Z2hpdGlAcml2b3NpbmMuY29tPgoKVGhhbmtzIQoKQWxleAoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0
CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5v
cmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
