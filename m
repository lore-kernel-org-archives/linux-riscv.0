Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 958E8C30653
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jul 2024 05:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Eo0HBNNWa/e7RQONp/iZSWIBQWeekDvgiXOkpxb1w+Y=; b=kTGWVVxZFeKbdu
	6a3x8AGQfFsLEArQR3UCo80aYeJWtcnp20cIn6wRwS+G+Bfc8aYu/lEbz/K/f0ULXI7JoL7Kb/SR/
	GJOk7jDG8ZUuMfZUH12g7c5g3w2d4QdvtnGDbnGUL3wVBg3kU8pO04tM4fwl/mp5ZAnG2YNRpfOKe
	YaPiBXHtwQvFnGc/aNy6nt+efV10zSxuEmYjX3uDUHRuy6d7zu538x3HwgGlZoJytfSrEKIopwVZo
	NXC8qQHr1d9uHqVlJEQho03NI27PJwgiQA/v/ScUrlxLOi7ni5uM5A7wds8WpA8xjMK5wEG+Hmr5k
	nnfz6DWU2XTlsyu29pug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFFD-0000000CEpx-27X0;
	Thu, 04 Jul 2024 05:42:59 +0000
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sPFFA-0000000CEpX-3cDD
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jul 2024 05:42:58 +0000
Received: by mail-ed1-x52e.google.com with SMTP id 4fb4d7f45d1cf-58b447c5112so247475a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 03 Jul 2024 22:42:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720071775; x=1720676575; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2c/+Q9nS+xoM8+OHdZVaW7nYRO1GVfCIQiZ/xNi76w0=;
        b=Tr5y0DJsuwjRGydMcm9xejeD22wQGwo2BSPn644q/M8y4Kijty2mScXNGrXvIyJEGS
         JKDUoZdpaQRYNnpWYZvPAn6NZllTmud4El4ukBtfroYVUMC878zTAkEYIqDG2GIh3zL6
         ImXiVkaNDGJ94veD1BP0zgh71rF0lyI+aKGce56XhkD/wHrdK4jjRhSuLLCrIJWh8dAQ
         kvgJa/KXfctjPZG3t5Tfi2A1zJbUeBetV7d9ddh9Jq8Dwuvl3pAkjXTTcnWUO/EVXIi3
         D0SYrG17d5NYuFo1BMmWjyFyy7x0Iwqw5mlgHDb0IEs7gl9c7NGmQgwy3xNeork3XPIG
         R+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720071775; x=1720676575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2c/+Q9nS+xoM8+OHdZVaW7nYRO1GVfCIQiZ/xNi76w0=;
        b=DvX0z9/o7eDSDs8a8cEOMZWHzyvioIPDB1vKAbcCjyH3tlKw6VARLAdswcBAlZGMd1
         M/BHOszDLk4FHUrRcMUouYoqXTX0/AJGvORFw+Py80EYJ/SorPzAlctGKDeGDvNAfqZB
         Vq0bIqF/F5EuXUG9orn+9UbhuXOyduYnMqWLG5eUNVKSv8sql+unDlBvNvmGPIsnO7NN
         51oQSkfnhJ4rDcTrN7hT77BQIa3KCz4yfz3MZbod2bxy94XKN24seZXoJ0dUdyZcs1Vj
         7mCYyh17v/+XsFDDL/Ev7OO+mOoS06FWXa6GF1WheKKGyso0MTZbtxcTw2gi1Flnprf4
         lvKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMEi0xrGjqkXqhmAAB14rjc4+oNFL0O8JOUC+4UFeN15+zGfKDkXDGli9toHeM9PWCX9Ni2tN1sPHTeS2Yuc7D3+8iZfFcL/O4JWkN21A7
X-Gm-Message-State: AOJu0Yyk5ynCD8kQoldbR5bYAjN4X/jlFjihyFb5SZRmKP1PtKnRfNUh
	AD88TcYOtwUIhFZ6Qj9Unc+ibm/SlqwkzTBylbz/FmvBdljUW/rhMW7qDLvF5x2iyumjR1Wc8mm
	GhtDGtPQFjsltZYGS++v+0aM5T5A=
X-Google-Smtp-Source: AGHT+IH+oZ9eq9ibdelDbiyyU9I7yRc+N1gUCalQ7B8pON06oHDFUPonn5DyQdiYwH2BKwt/klYV/jcBFxzToz/Yp5Q=
X-Received: by 2002:a05:6402:3594:b0:57c:6740:f47c with SMTP id
 4fb4d7f45d1cf-58e5c6366a2mr332180a12.27.1720071774803; Wed, 03 Jul 2024
 22:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-5-kanakshilledar@gmail.com> <20240703-juice-refreeze-62c468a56ea5@spud>
In-Reply-To: <20240703-juice-refreeze-62c468a56ea5@spud>
From: Kanak Shilledar <kanakshilledar@gmail.com>
Date: Thu, 4 Jul 2024 11:12:43 +0530
Message-ID: <CAGLn_=tVZ3StW3uB+CkcHBpSJG8PfNGSM6zOVV6OSJeL2Pz56A@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: thead: add basic spi node
To: Conor Dooley <conor@kernel.org>
Cc: Serge Semin <fancer.lancer@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-spi@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_224256_945278_2B660B43 
X-CRM114-Status: GOOD (  26.81  )
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

SGkKCk9uIFdlZCwgSnVsIDMsIDIwMjQgYXQgODoxNeKAr1BNIENvbm9yIERvb2xleSA8Y29ub3JA
a2VybmVsLm9yZz4gd3JvdGU6Cj4KPiBLYW5haywgRHJldywKPgo+IE9uIE1vbiwgSnVsIDAxLCAy
MDI0IGF0IDA1OjQzOjU0UE0gKzA1MzAsIEthbmFrIFNoaWxsZWRhciB3cm90ZToKPiA+IGNyZWF0
ZWQgc3BpMCBub2RlIHdpdGggZml4ZWQgY2xvY2suIHRoZSBzcGkwIG5vZGUKPiA+IHVzZXMgc3lu
b3BzaXMgZGVzaWdud2FyZSBkcml2ZXIgYW5kIGhhcyB0aGUgZm9sbG93aW5nCj4gPiBjb21wYXRp
YmxlICJzbnBzLGR3LWFwYi1zc2kiLiB0aGUgc3BpMCBub2RlIGlzIGNvbm5lY3RlZAo+ID4gdG8g
YSBTUEkgTk9SIGZsYXNoIHBhZCB3aGljaCBpcyBsZWZ0IHVucG9wdWxhdGVkIG9uIHRoZSBiYWNr
Cj4gPiBzaWRlIG9mIHRoZSBib2FyZC4KPiA+Cj4gPiBTaWduZWQtb2ZmLWJ5OiBLYW5hayBTaGls
bGVkYXIgPGthbmFrc2hpbGxlZGFyQGdtYWlsLmNvbT4KPiA+IC0tLQo+ID4gQ2hhbmdlcyBpbiB2
MjoKPiA+IC0gU2VwYXJhdGVkIGZyb20gYSBzaW5nbGUgcGF0Y2ggZmlsZQo+ID4gLS0tCj4gPiAg
Li4uL2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1iZWFnbGV2LWFoZWFkLmR0cyAgICAgIHwgIDkgKysr
KysrKysrCj4gPiAgLi4uL2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0
c2kgIHwgIDQgKysrKwo+ID4gIC4uLi9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVl
LXBpLTRhLmR0cyB8ICA1ICsrKysrCj4KPiBEaWRuJ3QgeW91IHNheSB0aGVyZSB3YXMgYSBmbGFz
aCBvbiBvbmUgb2YgdGhlc2UgdHdvIGJvYXJkcz8KWWVzLCB0aGVyZSBpcyBhIFNQSSBub3IgZmxh
c2ggcGFkIGxlZnQgdW5wb3B1bGF0ZWQgb24gdGhlIGJvdHRvbSBzaWRlCm9mIHRoZSBMaWNoZWVQ
aSA0YQpjYXJyaWVyIGJvYXJkLiBodHRwczovL3dpa2kuc2lwZWVkLmNvbS9oYXJkd2FyZS9lbi9s
aWNoZWUvdGgxNTIwL2xwaTRhLzJfdW5ib3guaHRtbCNCb2FyZC1oYXJkd2FyZS1vdmVydmlldwpu
b3RpY2UgdGhlIHJlc2VydmVkIHBhZCBpbiB0aGUgYm90dG9tIHBhcnQgb2YgdGhlIGltYWdlLgoK
PiA+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpICAgICAgICAgICAgfCAx
NiArKysrKysrKysrKysrKysrCj4gPiAgNCBmaWxlcyBjaGFuZ2VkLCAzNCBpbnNlcnRpb25zKCsp
Cj4gPgo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWJl
YWdsZXYtYWhlYWQuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtYmVhZ2xl
di1haGVhZC5kdHMKPiA+IGluZGV4IGQ5YjRkZTllNDc1Ny4uMzEwM2I3NGUwMjg4IDEwMDY0NAo+
ID4gLS0tIGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtYmVhZ2xldi1haGVhZC5k
dHMKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWJlYWdsZXYtYWhl
YWQuZHRzCj4gPiBAQCAtMTcsNiArMTcsNyBAQCBhbGlhc2VzIHsKPiA+ICAgICAgICAgICAgICAg
Z3BpbzEgPSAmZ3BpbzE7Cj4gPiAgICAgICAgICAgICAgIGdwaW8yID0gJmdwaW8yOwo+ID4gICAg
ICAgICAgICAgICBncGlvMyA9ICZncGlvMzsKPiA+ICsgICAgICAgICAgICAgc3BpMCA9ICZzcGkw
Owo+Cj4gInNwaSIgd291bGQgc29ydCBhZnRlciAic2VyaWFsIi4KaSB3aWxsIGZpeCB0aGF0LgoK
PiA+ICAgICAgICAgICAgICAgc2VyaWFsMCA9ICZ1YXJ0MDsKPiA+ICAgICAgICAgICAgICAgc2Vy
aWFsMSA9ICZ1YXJ0MTsKPiA+ICAgICAgICAgICAgICAgc2VyaWFsMiA9ICZ1YXJ0MjsKPiA+IEBA
IC01Miw2ICs1MywxMCBAQCAmc2RoY2lfY2xrIHsKPiA+ICAgICAgIGNsb2NrLWZyZXF1ZW5jeSA9
IDwxOTgwMDAwMDA+Owo+ID4gIH07Cj4gPgo+ID4gKyZzcGlfY2xrIHsKPiA+ICsgICAgIGNsb2Nr
LWZyZXF1ZW5jeSA9IDwzOTYwMDAwMDA+Owo+ID4gK307Cj4KPiBJJ20gcHJldHR5IHNjZXB0aWNh
bCBhYm91dCBhZGRpbmcgbW9yZSBvZiB0aGVzZSBmaXhlZCBjbG9ja3MsIHJhdGhlcgo+IHRoYW4g
d2FpdGluZyBmb3IgdGhlIGNsb2NrIGRyaXZlci4gRHJldywgd2hhdCBkbyB5b3UgdGhpbms/IFNo
b3VsZCB3ZQo+IGp1c3QgYWRkIG9uZSBtb3JlIHRvIHlvdXIgZml4dXAgbGlzdCBvciB3b3VsZCB5
b3UgcmF0aGVyIGRlbGF5PyBHdWVzcyBpdAo+IGRlcGVuZHMgb24gaG93IGxvbmcgbW9yZSB5b3Ug
dGhpbmsgdGhhdCBjbG9jayBkcml2ZXIgaXMgbGlrZWx5IHRvIHRha2UuCj4KPiBUaGFua3MsCj4g
Q29ub3IuCj4KClRoYW5rcyBhbmQgUmVnYXJkcywKS2FuYWsgU2hpbGxlZGFyCgo+ID4gKwo+ID4g
ICZ1YXJ0X3NjbGsgewo+ID4gICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDEwMDAwMDAwMD47Cj4g
PiAgfTsKPiA+IEBAIC03OSwzICs4NCw3IEBAICZzZGlvMCB7Cj4gPiAgJnVhcnQwIHsKPiA+ICAg
ICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4gKwo+ID4gKyZzcGkwIHsKPiA+ICsgICAg
IHN0YXR1cyA9ICJva2F5IjsKPiA+ICt9Owo+ID4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9v
dC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRzaSBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRzaQo+ID4gaW5kZXggMTM2NWQz
YTUxMmEzLi42OTM5YmQzNjU2MGMgMTAwNjQ0Cj4gPiAtLS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3RoZWFkL3RoMTUyMC1saWNoZWUtbW9kdWxlLTRhLmR0c2kKPiA+ICsrKyBiL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1tb2R1bGUtNGEuZHRzaQo+ID4gQEAgLTMzLDYg
KzMzLDEwIEBAICZzZGhjaV9jbGsgewo+ID4gICAgICAgY2xvY2stZnJlcXVlbmN5ID0gPDE5ODAw
MDAwMD47Cj4gPiAgfTsKPiA+Cj4gPiArJnNwaV9jbGsgewo+ID4gKyAgICAgY2xvY2stZnJlcXVl
bmN5ID0gPDM5NjAwMDAwMD47Cj4gPiArfTsKPiA+ICsKPiA+ICAmdWFydF9zY2xrIHsKPiA+ICAg
ICAgIGNsb2NrLWZyZXF1ZW5jeSA9IDwxMDAwMDAwMDA+Owo+ID4gIH07Cj4gPiBkaWZmIC0tZ2l0
IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cyBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLWxpY2hlZS1waS00YS5kdHMKPiA+IGluZGV4
IDlhMzg4NGE3M2UxMy4uMTRiMDZkZDgxYTlhIDEwMDY0NAo+ID4gLS0tIGEvYXJjaC9yaXNjdi9i
b290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy90aGVhZC90aDE1MjAtbGljaGVlLXBpLTRhLmR0cwo+ID4gQEAgLTE0LDYgKzE0
LDcgQEAgYWxpYXNlcyB7Cj4gPiAgICAgICAgICAgICAgIGdwaW8xID0gJmdwaW8xOwo+ID4gICAg
ICAgICAgICAgICBncGlvMiA9ICZncGlvMjsKPiA+ICAgICAgICAgICAgICAgZ3BpbzMgPSAmZ3Bp
bzM7Cj4gPiArICAgICAgICAgICAgIHNwaTAgPSAmc3BpMDsKPiA+ICAgICAgICAgICAgICAgc2Vy
aWFsMCA9ICZ1YXJ0MDsKPiA+ICAgICAgICAgICAgICAgc2VyaWFsMSA9ICZ1YXJ0MTsKPiA+ICAg
ICAgICAgICAgICAgc2VyaWFsMiA9ICZ1YXJ0MjsKPiA+IEBAIC0zMCwzICszMSw3IEBAIGNob3Nl
biB7Cj4gPiAgJnVhcnQwIHsKPiA+ICAgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICB9Owo+ID4g
Kwo+ID4gKyZzcGkwIHsKPiA+ICsgICAgIHN0YXR1cyA9ICJva2F5IjsKPiA+ICt9Owo+ID4gZGlm
ZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3RoZWFkL3RoMTUyMC5kdHNpCj4gPiBpbmRleCBkMmZhMjU4MzkwMTIuLmY5
NjJkZTY2M2U3ZSAxMDA2NDQKPiA+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgx
NTIwLmR0c2kKPiA+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kK
PiA+IEBAIC0xNDAsNiArMTQwLDEyIEBAIGFwYl9jbGs6IGFwYi1jbGstY2xvY2sgewo+ID4gICAg
ICAgICAgICAgICAjY2xvY2stY2VsbHMgPSA8MD47Cj4gPiAgICAgICB9Owo+ID4KPiA+ICsgICAg
IHNwaV9jbGs6IHNwaS1jbG9jayB7Cj4gPiArICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAiZml4
ZWQtY2xvY2siOwo+ID4gKyAgICAgICAgICAgICBjbG9jay1vdXRwdXQtbmFtZXMgPSAic3BpX2Ns
ayI7Cj4gPiArICAgICAgICAgICAgICNjbG9jay1jZWxscyA9IDwwPjsKPiA+ICsgICAgIH07Cj4g
PiArCj4gPiAgICAgICB1YXJ0X3NjbGs6IHVhcnQtc2Nsay1jbG9jayB7Cj4gPiAgICAgICAgICAg
ICAgIGNvbXBhdGlibGUgPSAiZml4ZWQtY2xvY2siOwo+ID4gICAgICAgICAgICAgICBjbG9jay1v
dXRwdXQtbmFtZXMgPSAidWFydF9zY2xrIjsKPiA+IEBAIC0xODMsNiArMTg5LDE2IEBAIGNsaW50
OiB0aW1lckBmZmRjMDAwMDAwIHsKPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgPCZjcHUzX2ludGMgMz4sIDwmY3B1M19pbnRjIDc+Owo+ID4gICAgICAgICAg
ICAgICB9Owo+ID4KPiA+ICsgICAgICAgICAgICAgc3BpMDogc3BpQGZmZTcwMGMwMDAgewo+ID4g
KyAgICAgICAgICAgICAgICAgICAgIGNvbXBhdGlibGUgPSAidGhlYWQsdGgxNTIwLXNwaSIsICJz
bnBzLGR3LWFwYi1zc2kiOwo+ID4gKyAgICAgICAgICAgICAgICAgICAgIHJlZyA9IDwweGZmIDB4
ZTcwMGMwMDAgMHgwIDB4MTAwMD47Cj4gPiArICAgICAgICAgICAgICAgICAgICAgaW50ZXJydXB0
cyA9IDw1NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiA+ICsgICAgICAgICAgICAgICAgICAgICBj
bG9ja3MgPSA8JnNwaV9jbGs+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICNhZGRyZXNzLWNl
bGxzID0gPDE+Owo+ID4gKyAgICAgICAgICAgICAgICAgICAgICNzaXplLWNlbGxzID0gPDA+Owo+
ID4gKyAgICAgICAgICAgICAgICAgICAgIHN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gPiArICAgICAg
ICAgICAgIH07Cj4gPiArCj4gPiAgICAgICAgICAgICAgIHVhcnQwOiBzZXJpYWxAZmZlNzAxNDAw
MCB7Cj4gPiAgICAgICAgICAgICAgICAgICAgICAgY29tcGF0aWJsZSA9ICJzbnBzLGR3LWFwYi11
YXJ0IjsKPiA+ICAgICAgICAgICAgICAgICAgICAgICByZWcgPSA8MHhmZiAweGU3MDE0MDAwIDB4
MCAweDEwMD47Cj4gPiAtLQo+ID4gMi40NS4yCj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJp
c2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1h
bi9saXN0aW5mby9saW51eC1yaXNjdgo=
