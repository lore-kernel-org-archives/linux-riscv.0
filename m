Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B043BC48260
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ngw5bTLYnkwinxyvhM1qZZOfKRxy9KTSU6T+28rC4w4=; b=eGd3kKuhp2QQC+
	+4sir2Z9bPBzpunHceaQ0zHBY7F/dDoJK87ccRD6rcb2sAkIlXJ9O6MmBlgqjMCwiu2heLO2Z8HUs
	z9J59fNpLLioRrhVS4BdpQdgOOHReRP9zuQ/id7xR2KRUatHgFX4YiL2QNka+PB2Ie/mmIXbjTIFv
	Zqs0qRdv2hOTFl2UO7+4KgC+KBBREwT7f724FZi5tLrrIqJvQmNcLPNfo5ID/LbJDRVMInnAqteuM
	cAq65K6yj0/mFz+loMzyg1edwfXQoiP4beEBwf8HVPlu/OKH2i7hUsMe9v54ExR4sEeBGYOpI+ogj
	tOVMldaQaL/uypvd+K1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyxP-00000009Ysa-2GQo;
	Mon, 19 Feb 2024 08:24:59 +0000
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbyxN-00000009YrW-30uH
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 08:24:59 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-2d241ff062cso2084431fa.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 00:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708331095; x=1708935895; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mw9W65gwqi39i5bv0F25pCikrMp5P7KP+8M6mh4FXG8=;
        b=T3IseWMhFHnI+mj0+WuGoe+zkMSFLf45Q6FSRLzFImi42687UvhUTXESh757K8WJE4
         85BUuPeKX/gRZbqpM8wkvRm5MG5oVJHmkbW5qHGrtWGGfP5y4FNpRQsmrvf0JpwELOIr
         O8ZBh5IQEbtUeIMnl1IawTS04FLtZ2aW/H21lZUgJPSG0auTLdrY+Gy5XX36Mq/F7Z6Q
         YA35scna7joxV7fJFaow32doKCIylVqLq0q/b796NMBFfUKePI04ACKqCihb2Ig2ksjq
         24Sy8x9G8BNtoIn101u317pIF9s+IzbVi6//q0sItvqhvjwdMd29keGtF1hNLeLRy8dA
         ZCLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708331095; x=1708935895;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mw9W65gwqi39i5bv0F25pCikrMp5P7KP+8M6mh4FXG8=;
        b=vvJVI7pTlFZHEHvRo762/f5q9K1/Q6qYEcF+glXm8BPkLO7rq5QOkCsUttUPK1AQGG
         /5eZZiKILSTZYTcO8RZckziKGG3QgD/EFXd/9pYY+Bp1R6fjh6VSRnkSOFSswus/6kQl
         triOYcMjS/+izMZvOJa/QIgM4YvJn6dNOCrIijkTMzf26dJ4uecNXX3tK5ZbIxv95sa4
         G2DLzBqUxxE6HoKinEGEBn0e1twuiXHBJge2BWH0Grkx/RoYIONS4Y5nyMFKZspM89Le
         nEZgjnS8796cj/JxRhSRsktfJsSsY0uH4nSph9Xz3CIAhzgkP7IRjvBEwwKVguZua8Ec
         t58Q==
X-Forwarded-Encrypted: i=1; AJvYcCV1xEXuoq9szC1EKbO9FT1frFmifMqLnBPI6B+ggWGJnaI/SMb1aqnDUsB7p9ZaoyUc6vgjcz9EkLatrWosWeNL6+Ua69QdbOzt4QSWDcR6
X-Gm-Message-State: AOJu0YzxBPoe8Qy0PBxeabMu9L2MYg6WH3Y5CFCDfOwKRzXGPCyEBnL+
	nf9Ogj43AGGCoH/z/6CjPNE1f8Qh+cZwSB/0zdBFhUgJ/ZKdu+r0mp7Rd9mYj4k=
X-Google-Smtp-Source: AGHT+IHp83tWIjNK5FNi6CEck1d35qT0TYDsGv+tNEtQ7sbMzMhE3TNULS0H1XJs/RZ++sX4dieCUA==
X-Received: by 2002:a05:651c:220c:b0:2d2:3451:52de with SMTP id y12-20020a05651c220c00b002d2345152demr2509803ljq.12.1708331095172;
        Mon, 19 Feb 2024 00:24:55 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id l14-20020a7bc44e000000b00411d1ce4f9dsm10468796wmi.34.2024.02.19.00.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 00:24:54 -0800 (PST)
Message-ID: <4098873b-a7e7-4c88-9af2-01f3c76424ab@tuxon.dev>
Date: Mon, 19 Feb 2024 10:24:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/17] clk: renesas: rzg2l: Extend power domain support
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 magnus.damm@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>
References: <20240208124300.2740313-1-claudiu.beznea.uj@bp.renesas.com>
 <20240208124300.2740313-8-claudiu.beznea.uj@bp.renesas.com>
 <CAMuHMdWdJ9jN9-cko2zSoqSS0acbwYB77aBWvenJHMrFTXhdWg@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdWdJ9jN9-cko2zSoqSS0acbwYB77aBWvenJHMrFTXhdWg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_002457_787294_4C64BE31 
X-CRM114-Status: GOOD (  18.72  )
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

CgpPbiAxNi4wMi4yMDI0IDE2OjA4LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4gSGkgQ2xh
dWRpdSwKPiAKPiBPbiBUaHUsIEZlYiA4LCAyMDI0IGF0IDE6NDTigK9QTSBDbGF1ZGl1IDxjbGF1
ZGl1LmJlem5lYUB0dXhvbi5kZXY+IHdyb3RlOgo+PiBGcm9tOiBDbGF1ZGl1IEJlem5lYSA8Y2xh
dWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5jb20+Cj4+Cj4+IFJaL3tHMkwsIFYyTCwgRzNTfS1i
YXNlZCBDUEcgdmVyc2lvbnMgaGF2ZSBzdXBwb3J0IGZvciBzYXZpbmcgZXh0cmEKPj4gcG93ZXIg
d2hlbiBjbG9ja3MgYXJlIGRpc2FibGVkIGJ5IGFjdGl2YXRpbmcgbW9kdWxlIHN0YW5kYnkuIFRo
aXMgaXMgZG9uZQo+PiB0aHJvdWdoIE1TVE9QLXNwZWNpZmljIHJlZ2lzdGVycyB0aGF0IGFyZSBw
YXJ0IG9mIENQRy4gRWFjaCBpbmRpdmlkdWFsCj4+IG1vZHVsZSBoYXMgb25lIG9yIG1vcmUgYml0
cyBhc3NvY2lhdGVkIHdpdGggb25lIE1TVE9QIHJlZ2lzdGVyIChzZWUgdGFibGUKPj4gIlJlZ2lz
dGVycyBmb3IgTW9kdWxlIFN0YW5kYnkgTW9kZSIgZnJvbSBIVyBtYW51YWxzKS4gSGFyZHdhcmUg
bWFudWFsCj4+IGFzc29jaWF0ZXMgbW9kdWxlcycgY2xvY2tzIHdpdGggb25lIG9yIG1vcmUgTVNU
T1AgYml0cy4gVGhlcmUgYXJlIDMgbWFwcGluZ3MKPj4gYXZhaWxhYmxlIChpZGVudGlmaWVkIGJ5
IHJlc2VhcmNoaW5nIFJaL0cyTCwgUlovRzNTLCBSWi9WMkwgSFcgbWFudWFscyk6Cj4+Cj4+IGNh
c2UgMTogTiBjbG9ja3MgbWFwcGVkIHRvIE4gTVNUT1AgYml0cyAod2l0aCBOPXswLCAuLi4sIFh9
KQo+PiBjYXNlIDI6IE4gY2xvY2tzIG1hcHBlZCB0byAxIE1TVE9QIGJpdCAgKHdpdGggTj17MCwg
Li4uLCBYfSkKPj4gY2FzZSAzOiBOIGNsb2NrcyBtYXBwZWQgdG8gTSBNU1RPUCBiaXRzICh3aXRo
IE49ezAsIC4uLiwgWH0sIE09ezAsIC4uLiwgWX0pCj4+Cj4+IENhc2UgMyBoYXMgYmVlbiBjdXJy
ZW50bHkgaWRlbnRpZmllZCBvbiBSWi9WMkwgZm9yIHRoZSBWQ1BMNCBtb2R1bGUuCj4+Cj4+IFRv
IGNvdmVyIGFsbCB0aHJlZSBjYXNlcywgdGhlIGluZGl2aWR1YWwgcGxhdGZvcm0gZHJpdmVycyB3
aWxsIHByb3ZpZGUgdG8KPj4gY2xvY2sgZHJpdmVyIE1TVE9QIHJlZ2lzdGVyIG9mZnNldCBhbmQg
YXNzb2NpYXRlZCBiaXRzIGluIHRoaXMgcmVnaXN0ZXIKPj4gYXMgYSBiaXRtYXNrIGFuZCB0aGUg
Y2xvY2sgZHJpdmVyIHdpbGwgYXBwbHkgdGhpcyBiaXRtYXNrIHRvIHByb3Blcgo+PiBNU1RPUCBy
ZWdpc3Rlci4KPj4KPj4gQXBhcnQgZnJvbSBNU1RPUCBzdXBwb3J0LCBSWi9HM1MgY2FuIHNhdmUg
bW9yZSBwb3dlciBieSBwb3dlcmluZyBkb3duIHRoZQo+PiBpbmRpdmlkdWFsIElQcyAoYWZ0ZXIg
TVNUT1AgaGFzIGJlZW4gc2V0KSBpZiBwcm9wZXIgYml0cyBpbgo+PiBDUEdfUFdSRE5fSVB7MSwy
fSByZWdpc3RlcnMgYXJlIHNldC4KPj4KPj4gVGhlIE1TVE9QIGFuZCBJUCBwb3dlciBkb3duIHN1
cHBvcnQgd2VyZSBpbXBsZW1lbnRlZCB0aHJvdWdoIHBvd2VyCj4+IGRvbWFpbnMuIFBsYXRmb3Jt
LXNwZWNpZmljIGNsb2NrIGRyaXZlcnMgd2lsbCByZWdpc3RlciBhbiBhcnJheSBvZgo+PiB0eXBl
IHN0cnVjdCByemcybF9jcGdfcG1fZG9tYWluX2luaXRfZGF0YSwgd2hpY2ggd2lsbCBiZSB1c2Vk
IHRvCj4+IGluc3RhbnRpYXRlIHByb3Blcmx5IHRoZSBwb3dlciBkb21haW5zLgo+Pgo+PiBTaWdu
ZWQtb2ZmLWJ5OiBDbGF1ZGl1IEJlem5lYSA8Y2xhdWRpdS5iZXpuZWEudWpAYnAucmVuZXNhcy5j
b20+Cj4gCj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+PiAtLS0gYS9kcml2ZXJzL2Nsay9y
ZW5lc2FzL3J6ZzJsLWNwZy5jCj4+ICsrKyBiL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwtY3Bn
LmMKPj4gQEAgLTE1NTksOSArMTU1NiwzNCBAQCBzdGF0aWMgYm9vbCByemcybF9jcGdfaXNfcG1f
Y2xrKHN0cnVjdCByemcybF9jcGdfcHJpdiAqcHJpdiwKPj4gICAgICAgICByZXR1cm4gdHJ1ZTsK
Pj4gIH0KWyAuLi4gXQoKPiAKPj4gQEAgLTIzNCw2ICsyNDYsNTQgQEAgc3RydWN0IHJ6ZzJsX3Jl
c2V0IHsKPj4gICNkZWZpbmUgREVGX1JTVChfaWQsIF9vZmYsIF9iaXQpICAgICAgIFwKPj4gICAg
ICAgICBERUZfUlNUX01PTihfaWQsIF9vZmYsIF9iaXQsIC0xKQo+Pgo+PiArLyoqCj4+ICsgKiBz
dHJ1Y3QgcnpnMmxfY3BnX3BtX2RvbWFpbl9jb25mIC0gUE0gZG9tYWluIGNvbmZpZ3VyYXRpb24g
ZGF0YSBzdHJ1Y3R1cmUKPj4gKyAqIEBtc3RvcDogTVNUT1AgY29uZmlndXJhdGlvbiAoTVNCID0g
cmVnaXN0ZXIgb2Zmc2V0LCBMU0IgPSBiaXRtYXNrKQo+PiArICogQHB3cmRuOiBQV1JETiBjb25m
aWd1cmF0aW9uIChNU0IgPSByZWdpc3RlciBvZmZzZXQsIExTQiA9IHJlZ2lzdGVyIGJpdCkKPj4g
KyAqLwo+PiArc3RydWN0IHJ6ZzJsX2NwZ19wbV9kb21haW5fY29uZiB7Cj4+ICsgICAgICAgdTMy
IG1zdG9wOwo+PiArICAgICAgIHUzMiBwd3JkbjsKPiAKPiBXaHkgbm90Cj4gCj4gICAgIHUxNiBt
c3RvcF9vZmY7Cj4gICAgIHUxNiBtc3RvcF9tYXNrOwo+ICAgICB1MTYgcHdyZG5fb2ZmOwo+ICAg
ICB1MTYgcHdyZG5fbWFzazsKPiAKPiBzbyB5b3UgY2FuIGRyb3AgdGhlIE1TVE9QKigpIGFuZCBQ
V1JETiooKSBtYWNyb3MgYmVsb3c/CgpJIGRpZCBpdCBsaWtlIHRoaXMgdG8gYWxpZ24gd2l0aCB0
aGUgYWxyZWFkeSBleGlzdGluZyBhcHByb2FjaCBmb3IgdGhpcwpraW5kIG9mIHRoaW5ncyBhdmFp
bGFibGUgaW4gdGhpcyBkcml2ZXIuIEkgY2FuIGRvIGl0IGFzIHlvdSBwcm9wb3NlZC4KCkZvciB0
aGUgcmVzdCBvZiB5b3VyIGNvbW1lbnRzIG9uIHRoaXMgcGF0Y2g6IEkgYWdyZWUgYW5kIHdpbGwg
YWRqdXN0IHRoZQpwYXRjaCBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmsgeW91LApDbGF1ZGl1
IEJlem5lYQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
