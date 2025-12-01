Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A794FD116F5
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Dec 2025 12:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FvccSV+3ndz4xWrPzL9V3XNlNDH8S1znbHgB+4VFddg=; b=cBzbdUenF4xfX8
	7XSi9AgXjMxanF840Xr75o1M3uIdielaZypQ6DPZYlpngoA80o5W7ICvu44+yC/yN3BVthP+JxNQZ
	+nXYGDhd8hBUbgm81VYkpv27+DFHjW5KnBAbzS+E0RWFr9+rJoeKyomvDs9IID8rQ+MU0hBL/uheV
	kIlCWFEq7Qv9pjMgMhwEzdBsSLkhuMf6z4AsT6+eVETf1aDqXXaU9JQC0HCxqliZE0kMO7mMgLVlb
	5+0xWBgL6AINQqYI7XjGB7bUZojj1inKCaPq7Ii4BTTHVieWLJ1ap0e8m8bIGzv6xsnFPX9JrDUI+
	sZd9fShNkjsP8LHW23Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3N5-00000003avY-0pxh;
	Mon, 01 Dec 2025 12:51:15 +0000
Received: from mail-vk1-f179.google.com ([209.85.221.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQ3N2-00000003au0-12vp
	for linux-riscv@lists.infradead.org;
	Mon, 01 Dec 2025 12:51:13 +0000
Received: by mail-vk1-f179.google.com with SMTP id 71dfb90a1353d-559748bcf99so3457187e0c.3
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 04:51:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764593470; x=1765198270;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=G1BGzDLN1R1JGgXQ6CQ3taCjUV+Gm29hEf+1YCf3TZQ=;
        b=ChjIkP2QSpYLxHQF61JbtY2uvc+K1G3yT8YNvLwMIrDULi3k6LQhh5yd5tjWjhvMwV
         IlcreNvMd7JOS77T0vqCu2Rnu2JKMgIMm/rBcAa7aDNw0KH2pWsgGCFZ507QmQ6s9Ohj
         +rWVfnl7sX/TupZwPsYARfXHEEXa2qtK3+OTiZ/vzLN8vqILyhSNHoiebgS0OjVkQ/sp
         8YSJ5WYOcxU35wj3tuNVcGm51YHl7hlJ5ovILk+o0NMuhQVrA5jKyuBAc4h0Uon11W1h
         Qu6DsTX94neHhqcsXJshpZmeVG73fPvZefbeXez9NJ2P4R1Hdcf+yimhfBMJLh/vuUNA
         ZGiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXUTb85iYBPVmZ3XrEcPFOMLfkRXz+W+8YySeh4hgl1gDklKKZyarQF+aOgLeYi0Gw9qPbKd4IqwY3wJg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzhpLRAdJpYvfXC8KabvGrkW19KiNwv8Z/GVp9vuCttVZqoxyV/
	kFbLLV3WleFy2FvciR+yJ6h1R3lkTquUE5mR0nOBcorOeY1ZG+M4YdOnbYyBcoGM
X-Gm-Gg: ASbGncs1uPE4O7v/oRC0knIcET0IbPhzS3vcmPYsHhQAQ2gct5z965kzXFly8BzO2qk
	828r85G0Lr4zX3JFR65PUT/2L0R00zjWMSehNRFRQvRP94d0GzT5Ox8YxbprF1i61VitOTkQaIm
	mkVTXy2IWvyCF6yo56qFz4QmIDeAB+pckkeHTtJjcmVJg0rrvV4+s80qz2a5D+QzAs1TvO9qpoH
	6Cslo8n8xAv6yLyIKVs0hNVfUOG4Mr7Kmr0X4yszFEWg7Fe4+VUaDgOwbZTQqQAH1OgCqPXgsbL
	PJv/nnWEhxzOHd/4el32w+FAsTuJz3PtDCvy2e8IcLiwQid9ejMzFik74n/Buvw9wY1ixH/FKRm
	fpdDj5AfSwp8xJpyQn42kYLUXj6fqt1SYnK6XNLIuJEdA2bb6oVRN0RUEUo6ggTvrdDof9VMGXa
	qNSTwv9bX9mNIWt/ZUVhUH4S+l5pj26TkSv5GnmCCPfxFFp4ooYRWg
X-Google-Smtp-Source: AGHT+IGYlDJMADT93Zqfu8G2Md7JDZJc5wltZ6/3C+APbgniKPQxuoW2LS9s/cZgWg/p28JiVPmbnA==
X-Received: by 2002:a05:6122:4d8c:b0:55b:9c1c:85d7 with SMTP id 71dfb90a1353d-55cd755daa6mr9167109e0c.3.1764593470419;
        Mon, 01 Dec 2025 04:51:10 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55cf5186d0csm5095879e0c.20.2025.12.01.04.51.09
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 01 Dec 2025 04:51:09 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b2f2ae1cbso2745932e0c.1
        for <linux-riscv@lists.infradead.org>; Mon, 01 Dec 2025 04:51:09 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXQrfJBI7Y9bvc86Q3LmMSS+Qej+3w3ibjN06yzHvBo2QkBslw3SYxv+4ikc95sIXkPQFJOcLD6JEmRGg==@lists.infradead.org
X-Received: by 2002:a05:6102:5088:b0:5db:d07c:21a9 with SMTP id
 ada2fe7eead31-5e224446a1cmr9883195137.35.1764593469159; Mon, 01 Dec 2025
 04:51:09 -0800 (PST)
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7> <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
In-Reply-To: <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 1 Dec 2025 13:50:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXsZwDaT8L5z9KzyX0FF4WVbvZhsGAtSK7pJ=nCr4hE4Q@mail.gmail.com>
X-Gm-Features: AWmQ_bn0levNvTNVS9RDSKOkcvi1UrTGQjZm0ie0oiFI0hrGaViWT9ykBE3XFb4
Message-ID: <CAMuHMdXsZwDaT8L5z9KzyX0FF4WVbvZhsGAtSK7pJ=nCr4hE4Q@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Rob Herring <robh@kernel.org>
Cc: Ioana Ciornei <ioana.ciornei@nxp.com>, Saravana Kannan <saravanak@google.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251201_045112_303392_048C53C7 
X-CRM114-Status: GOOD (  36.36  )
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

SGkgUm9iLAoKVGhhbmtzLCBJIHdhcyBqdXN0IGxvb2tpbmcgaW50byB0aGlzLi4uCgpPbiBNb24s
IDEgRGVjIDIwMjUgYXQgMTM6MDksIFJvYiBIZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3Rl
Ogo+IE9uIEZyaSwgTm92IDI4LCAyMDI1IGF0IDEwOjQz4oCvQU0gSW9hbmEgQ2lvcm5laSA8aW9h
bmEuY2lvcm5laUBueHAuY29tPiB3cm90ZToKPiA+IE9uIEZyaSwgTm92IDE0LCAyMDI1IGF0IDEx
OjQ3OjU0QU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZlbiB3cm90ZToKPiA+ID4gVGhlIERldmlj
ZXRyZWUgU3BlY2lmaWNhdGlvbiBzdGF0ZXM6Cj4gPiA+Cj4gPiA+ICAgICBUaGUgcm9vdCBvZiB0
aGUgaW50ZXJydXB0IHRyZWUgaXMgZGV0ZXJtaW5lZCB3aGVuIHRyYXZlcnNhbCBvZiB0aGUKPiA+
ID4gICAgIGludGVycnVwdCB0cmVlIHJlYWNoZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgbm9k
ZSB3aXRob3V0IGFuCj4gPiA+ICAgICBpbnRlcnJ1cHRzIHByb3BlcnR5IGFuZCB0aHVzIG5vIGV4
cGxpY2l0IGludGVycnVwdCBwYXJlbnQuCj4gPiA+Cj4gPiA+IEhvd2V2ZXIsIG9mX2lycV9pbml0
KCkgZ3JhdHVpdG91c2x5IGFzc3VtZXMgdGhhdCBhIG5vZGUgd2l0aG91dAo+ID4gPiBpbnRlcnJ1
cHRzIGhhcyBhbiBhY3R1YWwgaW50ZXJydXB0IHBhcmVudCBpZiBpdCBmaW5kcyBhbgo+ID4gPiBp
bnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGhpZ2hlciB1cCBpbiB0aGUgZGV2aWNlIHRyZWUuICBI
ZW5jZSB3aGVuIHN1Y2gKPiA+ID4gYSBwcm9wZXJ0eSBpcyBwcmVzZW50IChlLmcuIGluIHRoZSBy
b290IG5vZGUpLCB0aGUgcm9vdCBpbnRlcnJ1cHQKPiA+ID4gY29udHJvbGxlciBtYXkgbm90IGJl
IGRldGVjdGVkIGFzIHN1Y2gsIGNhdXNpbmcgYSBwYW5pYzoKPiA+ID4KPiA+ID4gICAgIE9GOiBv
Zl9pcnFfaW5pdDogY2hpbGRyZW4gcmVtYWluLCBidXQgbm8gcGFyZW50cwo+ID4gPiAgICAgS2Vy
bmVsIHBhbmljIC0gbm90IHN5bmNpbmc6IE5vIGludGVycnVwdCBjb250cm9sbGVyIGZvdW5kLgo+
ID4gPgo+ID4gPiBDb21taXQgZTkxMDMzNjIxZDU2ZTA1NSAoIm9mL2lycTogVXNlIGludGVycnVw
dHMtZXh0ZW5kZWQgdG8gZmluZAo+ID4gPiBwYXJlbnQiKSBhbHJlYWR5IGZpeGVkIGEgZmlyc3Qg
cGFydCwgYnkgY2hlY2tpbmcgZm9yIHRoZSBwcmVzZW5jZSBvZiBhbgo+ID4gPiBpbnRlcnJ1cHRz
LWV4dGVuZGVkIHByb3BlcnR5LiAgRml4IHRoZSBzZWNvbmQgcGFydCBieSBvbmx5IGNhbGxpbmcK
PiA+ID4gb2ZfaXJxX2ZpbmRfcGFyZW50KCkgd2hlbiBhbiBpbnRlcnJ1cHRzIHByb3BlcnR5IGlz
IHByZXNlbnQuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8
Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+Cgo+ID4gPiAtLS0gYS9kcml2ZXJzL29mL2lycS5jCj4g
PiA+ICsrKyBiL2RyaXZlcnMvb2YvaXJxLmMKPiA+ID4gQEAgLTYxMyw3ICs2MTMsNyBAQCB2b2lk
IF9faW5pdCBvZl9pcnFfaW5pdChjb25zdCBzdHJ1Y3Qgb2ZfZGV2aWNlX2lkICptYXRjaGVzKQo+
ID4gPiAgICAgICAgICAgICAgICAqIGFyZSB0aGUgc2FtZSBkaXN0YW5jZSBhd2F5IGZyb20gdGhl
IHJvb3QgaXJxIGNvbnRyb2xsZXIuCj4gPiA+ICAgICAgICAgICAgICAgICovCj4gPiA+ICAgICAg
ICAgICAgICAgZGVzYy0+aW50ZXJydXB0X3BhcmVudCA9IG9mX3BhcnNlX3BoYW5kbGUobnAsICJp
bnRlcnJ1cHRzLWV4dGVuZGVkIiwgMCk7Cj4gPiA+IC0gICAgICAgICAgICAgaWYgKCFkZXNjLT5p
bnRlcnJ1cHRfcGFyZW50KQo+ID4gPiArICAgICAgICAgICAgIGlmICghZGVzYy0+aW50ZXJydXB0
X3BhcmVudCAmJiBvZl9wcm9wZXJ0eV9wcmVzZW50KG5wLCAiaW50ZXJydXB0cyIpKQo+ID4gPiAg
ICAgICAgICAgICAgICAgICAgICAgZGVzYy0+aW50ZXJydXB0X3BhcmVudCA9IG9mX2lycV9maW5k
X3BhcmVudChucCk7Cj4gPiA+ICAgICAgICAgICAgICAgaWYgKGRlc2MtPmludGVycnVwdF9wYXJl
bnQgPT0gbnApIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGRlc2Mt
PmludGVycnVwdF9wYXJlbnQpOwoKPiA+IFRoaXMgY2hhbmdlIGlycS1scy1leHRpcnEgYW5kIGNv
bW1pdCA2YmE1MWI3YjM0Y2EgKCJvZi9pcnE6IEhhbmRsZQo+ID4gZXhwbGljaXQgaW50ZXJydXB0
IHBhcmVudCIpIGRvZXMgbm90IGhlbHAgd2l0aCB0aGUgaXNzdWUuCj4gPgo+ID4gVGhpcyBpcyBo
b3cgdGhlIERUIG5vZGUgaW4gbHgyMTYwYS5kdHNpIGxvb2tzIGxpa2U6Cj4KPiBscy1leHRpcnEg
c3RyaWtlcyBhZ2FpbiEKPgo+IEkgdGhpbmsgc29tZXRoaW5nIGxpa2UgdGhpcyBzaG91bGQgZml4
IGl0Ogo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvb2YvaXJxLmMgYi9kcml2ZXJzL29mL2lycS5j
Cj4gaW5kZXggMjI3MTExMGI1ZjdjLi5jMDZjNzRhZWY4MDEgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVy
cy9vZi9pcnEuYwo+ICsrKyBiL2RyaXZlcnMvb2YvaXJxLmMKPiBAQCAtNTkzLDcgKzU5Myw4IEBA
IHZvaWQgX19pbml0IG9mX2lycV9pbml0KGNvbnN0IHN0cnVjdCBvZl9kZXZpY2VfaWQgKm1hdGNo
ZXMpCj4gICAgICAgICAgICAgICAgICAqIGFyZSB0aGUgc2FtZSBkaXN0YW5jZSBhd2F5IGZyb20g
dGhlIHJvb3QgaXJxIGNvbnRyb2xsZXIuCj4gICAgICAgICAgICAgICAgICAqLwo+ICAgICAgICAg
ICAgICAgICBkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ID0gb2ZfcGFyc2VfcGhhbmRsZShucCwgImlu
dGVycnVwdHMtZXh0ZW5kZWQiLCAwKTsKPiAtICAgICAgICAgICAgICAgaWYgKCFkZXNjLT5pbnRl
cnJ1cHRfcGFyZW50ICYmIG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJpbnRlcnJ1cHRzIikpCj4g
KyAgICAgICAgICAgICAgIGlmICghZGVzYy0+aW50ZXJydXB0X3BhcmVudCAmJgo+ICsgICAgICAg
ICAgICAgICAgICAgKG9mX3Byb3BlcnR5X3ByZXNlbnQobnAsICJpbnRlcnJ1cHRzIikgfHwgb2Zf
cHJvcGVydHlfcHJlc2VudChucCwgImludGVycnVwdC1tYXAiKSkKClRoYXQgc2hvdWxkIGluZGVl
ZCByZXN0b3JlIHRoZSBwcmV2aW91cyBiZWhhdmlvciwgYW5kIGZpbmQgYWdhaW4KImludGVycnVw
dC1wYXJlbnQgPSAmZ2ljIiBpbiB0aGUgcm9vdCBub2RlLiAgSG93ZXZlciwgd291bGRuJ3QgaXQK
YmUgbW9yZSBjb3JyZWN0IHRvIGZvbGxvdyB0aGUgYXBwcm9hY2ggdXNlZCBmb3IgaW50ZXJydXB0
cy1leHRlbmRlZCwKYW5kIHVzZSB0aGUgZmlyc3QgaW50ZXJydXB0IHBhcmVudCBmcm9tIHRoZSBp
bnRlcnJ1cHQtbWFwICh3aGljaCBpcwpjb2luY2lkZW50YWxseSAmZ2ljLCB0b28pPwoKPiAgICAg
ICAgICAgICAgICAgICAgICAgICBkZXNjLT5pbnRlcnJ1cHRfcGFyZW50ID0gb2ZfaXJxX2ZpbmRf
cGFyZW50KG5wKTsKPiAgICAgICAgICAgICAgICAgZWxzZSBpZiAoIWRlc2MtPmludGVycnVwdF9w
YXJlbnQpCj4gICAgICAgICAgICAgICAgICAgICAgICAgZGVzYy0+aW50ZXJydXB0X3BhcmVudCA9
IG9mX3BhcnNlX3BoYW5kbGUobnAsICJpbnRlcnJ1cHQtcGFyZW50IiwgMCk7Cj4KPiBCdXQgcmVh
bGx5LCBhdCBzb21lIHBvaW50IGl0IHNob3VsZCBiZSBjb252ZXJ0ZWQgdG8gYSBwcm9wZXIgZHJp
dmVyIGFzCj4gdGhlcmUncyBubyByZWFzb24gZXh0aXJxIG5lZWRzIHRvIGJlIGluaXRpYWxpemVk
IGVhcmx5LgoKR3J7b2V0amUsZWV0aW5nfXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVy
dAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZlbiAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25k
IGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMg
d2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJIGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJ
J20gdGFsa2luZyB0byBqb3VybmFsaXN0cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21l
dGhpbmcgbGlrZSB0aGF0LgogICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVz
IFRvcnZhbGRzCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9y
ZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2
Cg==
