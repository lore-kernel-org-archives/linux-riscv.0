Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C8F1C4707C
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 16:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/NWk/DypDMi4RYfIgEo9UmrOx8pUAKadUVJUXLjH4A0=; b=ZkEzPpd7XezJ7Q
	S/rZXBVVyJJ0JP7bU+oKAz4DJS4Teq9Qzfg3IP+CgOOcn1CCusiwFiZfwC9iOzXOAmvS5+usYuhLY
	E8pALfC4EXOkVeghXUfmzFAyNktk3iohMOM1e65P+lzR4jl7nAMuJU+vjrpuNIiSzHaVH0BqB9avu
	eTVQ41rKieNjMoNsN2qhAEmCDUoV6fuYAtIhG6vAHiAaBnS3zH/GH4rUrWvG8mP2lHovg4tPyFIuz
	Opo5LB7Pnvx3GJ4/zUAd2hOVFAYsaG1aTArRvcLF50EEovicLuYbBzV0ftrRIcBenWYNUCtECkwhH
	rQIxzU11HMqF+bz1i9Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQWw-00EeZb-1K;
	Thu, 04 Jan 2024 16:25:14 +0000
Received: from mail-yb1-f170.google.com ([209.85.219.170])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLQWt-00EeZ5-0S
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 16:25:12 +0000
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-dbdacafe012so630444276.1
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 08:25:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704385509; x=1704990309;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MBdLCUmjrZ1+GTPDcEU99j/uV9mS9a4gKvyVmqcT1n4=;
        b=IULJX/ezWUXMaaZIaPBvavvU/M8UQxlvuRZvMhyhs+c/jaW8sh2kDXDpyGYjiDL7D8
         tJH85SsRbX6LhyUUhSBXLBgdDPpo0joM8yQ364nnFBtYTua7C5+p7y2wa6/ZSzx9uqr+
         d+R47QP3NBx0f2X+htSX10+CM3CvaH7TW2TiU86KgWv/D46eBmRRVcbYI/zsZ0M2r7+7
         8AeIC116HPyq5sNVyauLphMt7K8MX2nnBV7t2MxK7kVhKT48l01RpzS2JT/5oc2A0beS
         o+9qfEbfh0asXf29IkW7D5FSsTvvZULJGmmjApNzIYy+lhro0uKbxKdcBzuIvC7E+tVJ
         O2ug==
X-Gm-Message-State: AOJu0YyTRijLH8YdzkCm6wGOC5aBMXbn6+sfpvlC8l4ZT7cXcTc1sXFV
	b+vhHKRWYcrhoT7E1OZjsepXz/ZtB/ZL+A==
X-Google-Smtp-Source: AGHT+IHxTI7FV39nYX1OCxFi8794dZAbh6BYyKIHWot6ZKoHD97mO7QtA4zwo5TfrLrgzuQVxJfpLA==
X-Received: by 2002:a05:6902:4ee:b0:dbd:c423:ec6c with SMTP id w14-20020a05690204ee00b00dbdc423ec6cmr814523ybs.69.1704385509131;
        Thu, 04 Jan 2024 08:25:09 -0800 (PST)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com. [209.85.128.172])
        by smtp.gmail.com with ESMTPSA id x6-20020a5b0f06000000b00da02a2ef6afsm8945931ybr.30.2024.01.04.08.25.08
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Jan 2024 08:25:08 -0800 (PST)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-5f254d1a6daso6652317b3.2
        for <linux-riscv@lists.infradead.org>; Thu, 04 Jan 2024 08:25:08 -0800 (PST)
X-Received: by 2002:a81:5307:0:b0:5e7:7526:62b5 with SMTP id
 h7-20020a815307000000b005e7752662b5mr924671ywb.44.1704385508356; Thu, 04 Jan
 2024 08:25:08 -0800 (PST)
MIME-Version: 1.0
References: <20231201131551.201503-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20231201131551.201503-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdUiaL__+CDaFxRbUFgrz69SYBNfZm4JvY_qQRKLMTCY0w@mail.gmail.com>
 <CA+V-a8tTWf8Kx-Ex=DPsSR2ZWHC29N_pAoEZN1sR5Nqobf139A@mail.gmail.com>
 <CAMuHMdXosvV=EuRtL69r6=UT0SO8Aq-XjWwJMJQpWAhT2z+ffA@mail.gmail.com> <CA+V-a8tNeiyvK90urPF9s3JZOav77TRO8xdAEiCmYurrf3-4RA@mail.gmail.com>
In-Reply-To: <CA+V-a8tNeiyvK90urPF9s3JZOav77TRO8xdAEiCmYurrf3-4RA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 4 Jan 2024 17:24:55 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXYEBg7MMJG7tqDib8eaKdvd4Fxo+ZR8K8Vq82DzjSaqg@mail.gmail.com>
Message-ID: <CAMuHMdXYEBg7MMJG7tqDib8eaKdvd4Fxo+ZR8K8Vq82DzjSaqg@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] pinctrl: renesas: rzg2l: Include pinmap in
 RZG2L_GPIO_PORT_PACK() macro
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Magnus Damm <magnus.damm@gmail.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-gpio@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_082511_179174_E41D88B5 
X-CRM114-Status: GOOD (  38.79  )
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

SGkgUHJhYmhha2FyLAoKT24gVGh1LCBKYW4gNCwgMjAyNCBhdCA0OjU14oCvUE0gTGFkLCBQcmFi
aGFrYXIKPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiBPbiBUdWUsIEphbiAy
LCAyMDI0IGF0IDEwOjE44oCvQU0gR2VlcnQgVXl0dGVyaG9ldmVuIDxnZWVydEBsaW51eC1tNjhr
Lm9yZz4gd3JvdGU6Cj4gPiBPbiBUaHUsIERlYyAyMSwgMjAyMyBhdCAxMDowNOKAr1BNIExhZCwg
UHJhYmhha2FyCj4gPiA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBP
biBXZWQsIERlYyA2LCAyMDIzIGF0IDE6MTPigK9QTSBHZWVydCBVeXR0ZXJob2V2ZW4gPGdlZXJ0
QGxpbnV4LW02OGsub3JnPiB3cm90ZToKPiA+ID4gPiBPbiBGcmksIERlYyAxLCAyMDIzIGF0IDI6
MTbigK9QTSBQcmFiaGFrYXIgPHByYWJoYWthci5jc2VuZ2dAZ21haWwuY29tPiB3cm90ZToKPiA+
ID4gPiA+IEZyb206IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5y
ZW5lc2FzLmNvbT4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBDdXJyZW50bHkgd2UgYXNzdW1lIGFsbCB0
aGUgcG9ydCBwaW5zIGFyZSBzZXF1ZW50aWFsIGllIGFsd2F5cyBQWF8wIHRvCj4gPiA+ID4gPiBQ
WF9uIChuPTEuLjcpIGV4aXN0LCBidXQgb24gUlovRml2ZSBTb0Mgd2UgaGF2ZSBhZGRpdGlvbmFs
IHBpbnMgUDE5XzEgdG8KPiA+ID4gPiA+IFAyOF81IHdoaWNoIGhhdmUgaG9sZXMgaW4gdGhlbSwg
Zm9yIGV4YW1wbGUgb25seSBvbmUgcGluIG9uIHBvcnQxOSBpcwo+ID4gPiA+ID4gYXZhaWxhYmxl
IGFuZCB0aGF0IGlzIFAxOV8xIGFuZCBub3QgUDE5XzAuIFNvIHRvIGhhbmRsZSBzdWNoIGNhc2Vz
Cj4gPiA+ID4gPiBpbmNsdWRlIHBpbm1hcCBmb3IgZWFjaCBwb3J0IHdoaWNoIHdvdWxkIGluZGlj
YXRlIHRoZSBwaW4gYXZhaWxhYmlsaXR5Cj4gPiA+ID4gPiBvbiBlYWNoIHBvcnQuIEFzIHRoZSBw
aW5jb3VudCBjYW4gYmUgY2FsY3VsYXRlZCBiYXNlZCBvbiBwaW5tYXAgZHJvcCB0aGlzCj4gPiA+
ID4gPiBmcm9tIFJaRzJMX0dQSU9fUE9SVF9QQUNLKCkgbWFjcm8gYW5kIHVwZGF0ZSBSWkcyTF9H
UElPX1BPUlRfR0VUX1BJTkNOVCgpCj4gPiA+ID4gPiBtYWNyby4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBQcmV2aW91c2x5IHdlIGhhZCBhIG1heCBvZiA3IHBpbnMgb24gZWFjaCBwb3J0IGJ1dCBvbiBS
Wi9GaXZlIFBvcnQtMjAKPiA+ID4gPiA+IGhhcyA4IHBpbnMsIHNvIG1vdmUgdGhlIHNpbmdsZSBw
aW4gY29uZmlndXJhdGlvbiB0byBCSVQoNjMpLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFNpZ25lZC1v
ZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWthci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2Fz
LmNvbT4KPiA+ID4gPgo+ID4gPiA+IFRoYW5rcyBmb3IgeW91ciBwYXRjaCEKPiA+ID4gPgo+ID4g
PiA+ID4gLS0tIGEvZHJpdmVycy9waW5jdHJsL3JlbmVzYXMvcGluY3RybC1yemcybC5jCj4gPiA+
ID4gPiArKysgYi9kcml2ZXJzL3BpbmN0cmwvcmVuZXNhcy9waW5jdHJsLXJ6ZzJsLmMKPiA+ID4g
PiA+IEBAIC04MCwxNSArODAsMTcgQEAKPiA+ID4gPiA+ICAgKiBuIGluZGljYXRlcyBudW1iZXIg
b2YgcGlucyBpbiB0aGUgcG9ydCwgYSBpcyB0aGUgcmVnaXN0ZXIgaW5kZXgKPiA+ID4gPiA+ICAg
KiBhbmQgZiBpcyBwaW4gY29uZmlndXJhdGlvbiBjYXBhYmlsaXRpZXMgc3VwcG9ydGVkLgo+ID4g
PiA+ID4gICAqLwo+ID4gPiA+ID4gLSNkZWZpbmUgUlpHMkxfR1BJT19QT1JUX1BBQ0sobiwgYSwg
ZikgICgoKG4pIDw8IDI4KSB8ICgoYSkgPDwgMjApIHwgKGYpKQo+ID4gPiA+ID4gLSNkZWZpbmUg
UlpHMkxfR1BJT19QT1JUX0dFVF9QSU5DTlQoeCkgICgoKHgpICYgR0VOTUFTSygzMCwgMjgpKSA+
PiAyOCkKPiA+ID4gPiA+ICsjZGVmaW5lIFJaRzJMX0dQSU9fUE9SVF9QQUNLKG4sIGEsIGYpICAo
KChuKSA+IDAgPyAoKHU2NCkoR0VOTUFTS19VTEwoKChuKSAtIDEgKyAyOCksIDI4KSkpIDogMCkg
fCBcCj4gPiA+ID4KPiA+ID4gPiBUaGUgbWFzayBjcmVhdGlvbiBjYW4gYmUgc2ltcGxpZmllZCB0
bwo+ID4gPiA+Cj4gPiA+ID4gICAgICgoMVVMTCA8PCAobikpIC0gMSkgPDwgMjgKPiA+ID4gPgo+
ID4gPiBPSy4KPiA+ID4KPiA+ID4gPiBidXQgc2VlIGJlbG93Li4uCj4gPiA+ID4KPiA+ID4gPiA+
ICsgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgKChhKSA8PCAyMCkgfCAo
ZikpCj4gPiA+ID4gPiArI2RlZmluZSBSWkcyTF9HUElPX1BPUlRfR0VUX1BJTk1BUCh4KSAgKCgo
eCkgJiBHRU5NQVNLX1VMTCgzNSwgMjgpKSA+PiAyOCkKPiA+ID4gPiA+ICsjZGVmaW5lIFJaRzJM
X0dQSU9fUE9SVF9HRVRfUElOQ05UKHgpICAoaHdlaWdodDgoUlpHMkxfR1BJT19QT1JUX0dFVF9Q
SU5NQVAoKHgpKSkpCj4gPiA+ID4KPiA+ID4gPiBJIHRoaW5rIHdlJ3ZlIHJlYWNoZWQgdGhlIHBv
aW50IHdoZXJlIGl0IHdvdWxkIGJlIGVhc2llciBmb3IgdGhlCj4gPiA+ID4gY2FzdWFsIHJldmll
d2VyIHRvICNkZWZpbmUgUElOX0NGR18qX01BU0sgZm9yIGFsbCBmaWVsZHMsIGFuZCB1c2UKPiA+
ID4gPiBGSUVMRF97UFJFUCxHRVR9KCkgdG8gcGFjayByZXNwLiBleHRyYWN0IHZhbHVlcy4gIFRo
YXQgd291bGQgYWxzbwo+ID4gPiA+IG1ha2UgaXQgbW9yZSBvYnZpb3VzIHdoaWNoIGJpdHMgYXJl
IGluIHVzZSwgYW5kIGhvdyBtYW55IGJpdHMgYXJlCj4gPiA+ID4gc3RpbGwgYXZhaWxhYmxlIGZv
ciBmdXR1cmUgdXNlLgoKPiBUbyBjbGFyaWZ5LCB5b3UgbWVhbiB0byBkZWZpbmUgUElOX0NGR18q
X01BU0sgZm9yIGFsbAo+IFBJTl9DRkdfSU9MSF9BLi5QSU5fQ0ZHX09FTiBtYWNyb3M/IEkgYXNr
IGJlY2F1c2Ugd2UgZG9udCBleHRyYWN0IHRoZQo+IHJlc3BlY3RpdmUgQ0ZHIGZsYWdzIGluIHRo
ZSBjb2RlLgoKVGhlIFBJTl9DRkdfSU9MSF9BLi5QSU5fQ0ZHX09FTiBtYWNyb3MgYXJlIHNpbmds
ZS1iaXQgZGVmaW5pdGlvbnMuCkkgbWVhbiB0byAjZGVmaW5lIFBJTl9DRkdfKl9NQVNLIG1hY3Jv
cyBmb3IgYWxsIG11bHRpLWJpdCBmaWVsZHMsIGN1cnJlbnRseQphY2Nlc3NlZCB1c2luZyBvcGVu
LWNvZGVkIEdFTk1BU0soKS4KCllvdSBhbHJlYWR5IHRyaWVkOgoKICAgICNkZWZpbmUgUlpHMkxf
R1BJT19QT1JUX1BJTl9DTlRfTUFTSyAgICBHRU5NQVNLKDMxLCAyOCkKICAgICNkZWZpbmUgUlpH
MkxfR1BJT19QT1JUX1BJTl9SRUdfTUFTSyAgICBHRU5NQVNLKDI3LCAyMCkKICAgICNkZWZpbmUg
UlpHMkxfR1BJT19QT1JUX1BJTl9DRkdfTUFTSyAgICBHRU5NQVNLKDE5LCAwKQoKQXMgdGhleSBh
Y3R1YWxseSBzaGFyZSB0aGUgUElOX0NGR18qIGJpdCBzcGFjZSwgSSdkIGNhbGwgdGhlbToKCiAg
ICAjZGVmaW5lIFBJTl9DRkdfUElOX0NOVF9NQVNLICAgIEdFTk1BU0soMzEsIDI4KQogICAgI2Rl
ZmluZSBQSU5fQ0ZHX1BJTl9SRUdfTUFTSyAgICBHRU5NQVNLKDI3LCAyMCkKICAgICNkZWZpbmUg
UElOX0NGR19NQVNLICAgIEdFTk1BU0soMTksIDApCgpBbHNvLCB5b3UgYWxyZWFkeSBoYXZlOgoK
ICAgICNkZWZpbmUgTVVYX1BJTl9JRF9NQVNLICAgICAgICAgR0VOTUFTSygxNSwgMCkKICAgICNk
ZWZpbmUgTVVYX0ZVTkNfTUFTSyAgICAgICAgICAgR0VOTUFTSygzMSwgMTYpCiAgICAjZGVmaW5l
IE1VWF9GVU5DX09GRlMgICAgICAgICAgIDE2CgpCdXQgYWxsIG9mCgogICAgI2RlZmluZSBNVVhf
RlVOQyhwaW5jb25mKSAgICAgICAoKChwaW5jb25mKSAmIE1VWF9GVU5DX01BU0spID4+Ck1VWF9G
VU5DX09GRlMpCgogICAgcGluc1tpXSA9IHZhbHVlICYgTVVYX1BJTl9JRF9NQVNLOwoKY2FuIHVz
ZSBGSUVMRF9HRVQoKSwgcmVtb3ZpbmcgdGhlIG5lZWQgZm9yIE1VWF9GVU5DX09GRlMuCgpBbHNv
OgoKICAgIHU4IHBpbmNvdW50ID0gUlpHMkxfR1BJT19QT1JUX0dFVF9QSU5DTlQoY2ZnKTsKCmNh
biBiZWNvbWUKCiAgICB1OCBwaW5jb3VudCA9IEZJRUxEX0dFVChQSU5fQ0ZHX1BJTl9DTlRfTUFT
SywgY2ZnKTsKClNhbWUgZm9yIGFsbCB0aGUgb3RoZXIgbWFjcm9zIHVzaW5nIEdFTk1BU0soKS4K
CkkgaG9wZSB0aGlzIG1ha2VzIGl0IG1vcmUgY2xlYXIgd2hhdCBJIGhhZCBpbiBtaW5kPwpUaGFu
a3MhCgpHcntvZXRqZSxlZXRpbmd9cywKCiAgICAgICAgICAgICAgICAgICAgICAgIEdlZXJ0Cgot
LSAKR2VlcnQgVXl0dGVyaG9ldmVuIC0tIFRoZXJlJ3MgbG90cyBvZiBMaW51eCBiZXlvbmQgaWEz
MiAtLSBnZWVydEBsaW51eC1tNjhrLm9yZwoKSW4gcGVyc29uYWwgY29udmVyc2F0aW9ucyB3aXRo
IHRlY2huaWNhbCBwZW9wbGUsIEkgY2FsbCBteXNlbGYgYSBoYWNrZXIuIEJ1dAp3aGVuIEknbSB0
YWxraW5nIHRvIGpvdXJuYWxpc3RzIEkganVzdCBzYXkgInByb2dyYW1tZXIiIG9yIHNvbWV0aGlu
ZyBsaWtlIHRoYXQuCiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgLS0gTGludXMgVG9y
dmFsZHMKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxp
bnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0
dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
