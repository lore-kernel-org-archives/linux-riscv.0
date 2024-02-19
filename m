Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A59DC48BC3
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Feb 2024 09:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Uj4OSNBEkMUlmhcMeGUhUOI/dGEiem6R4H2eAF4fSA=; b=KAd/cwipD/CrNx
	eFiF9njSmiHWm0iMoZ5YCXiw9UQRvRFLlzzV37DrYySl4D1AN757DHdduXS2x94rtQTQRSsJLy9ks
	7xAZ2u3AHvSZdyl/BcVznrLD5i3gDJDRuz1QLiLSRnLOAOryJLjxSJ7j367WC0AzGpIdg9cGqxVJM
	GTV3Ty9v2IlKk+rxg5lYEubDFaOXpf/sLtAbvxzEHVV2hdxZXOIeTwYtx0UrXo2bXDzhd1JffAva6
	ovZ64UNhPQEufMjOqlth97y1wtYGKJGepN5wk8pPaRbp3KAfzvehyjLcqze4X3MC/zR4kaNC8seMR
	U27Phx2JoqSM0iSixDWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbza4-00000009ill-3alM;
	Mon, 19 Feb 2024 09:04:56 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbza1-00000009ikD-1iwX
	for linux-riscv@lists.infradead.org;
	Mon, 19 Feb 2024 09:04:54 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-512bb2ed1f7so302907e87.3
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 01:04:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1708333492; x=1708938292; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=csW9r/4gQ0jxKhE2Wzu5kKeCgTzvE7WcFlLyXAHYs/4=;
        b=pj09HkONH5jPakrfigMnQi2e/qrY0pP5/SBKQ+m//uWG5eMtOVlCMe5ma+eSrPM+KJ
         Mr9mR6bD+b4Ho0iGPV2cKZIcTfBXzsz3y/WS2VaMBGnzxnS7dx8gFTlw1rFFzjNSiC1r
         /83nZFdAcoHlM+wcX8gRA7Xr/+gK12l2W7fAaFCxRFsJcbrBupfgu4lZLK6z2H6bHhOB
         uR9m9vqMB/fqHEukIyvE9hp0h3AVSkwwsVwTa5FHLelphpgaZGozFN+oh9Kbu2HtWeWD
         czBqIL5N7hnujpHCI9ywL1lpKQ5ZwH59Ihd3n7uPWUij80RF43Xh5EYVFhgLgOQ+S7B6
         5btw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708333492; x=1708938292;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=csW9r/4gQ0jxKhE2Wzu5kKeCgTzvE7WcFlLyXAHYs/4=;
        b=NTv3MsWlM06PhtzkUQjj6nlP3lguYD/BpN8PQ7se9J5DahPPXHkfPSYyW2bMg5BDee
         KkfICENMYnzQ1006OawST3avvjXSIfpaZvBcX5GYqcU9ywjm9wCsffdUKOem03nsZ8hP
         HofpWV7bXMj+110F2I2FNVDFgwZk8F65waXlqTmVSyNGnJuoLGVnoiWW28YeiYmAyEEW
         JV0/ujTO3IB3hVxohq2vJSdpXMINyWbUvaeFukyW3+aGDAl0eL1adG7sE0Jp2WdfRfuA
         HXp8i8fs4OXUKE6LxrgW/v5MAMmR7b9qY1V4BRr/SYep+ZcvmE07vRay79MF3S+hiIrw
         FRbA==
X-Forwarded-Encrypted: i=1; AJvYcCVvZjCxepPEpQ78jAYc/nJoKPSh+iRumEjHIMfqS+a6/Gykp4OeEsbP+3OQlhnC22FuIy3nJLo3SloV7vhoogv1BtEWSpSPUBRjz95i+NLt
X-Gm-Message-State: AOJu0Yy9Nz70kgbmQxCguf1s0+DKU6hyxFGtl0huJMq0lGTBxiVcCQow
	+/JPhkdsxsILzBaq/abS38FnbZLpYtInLQ1s1juFP2qpx57bZAlX0nClAUyT3Yn3pJx4TsafVB2
	0
X-Google-Smtp-Source: AGHT+IHIIH1nQpDud5Np09DnfjqzOylTojdUO6ifSKPECbfou2QFnUkVFQbppPGzAhWd9AzX/DIxTg==
X-Received: by 2002:a19:2d43:0:b0:511:7b37:1d26 with SMTP id t3-20020a192d43000000b005117b371d26mr7692205lft.13.1708333479889;
        Mon, 19 Feb 2024 01:04:39 -0800 (PST)
Received: from [192.168.50.4] ([82.78.167.20])
        by smtp.gmail.com with ESMTPSA id f7-20020a5d5687000000b0033ce727e728sm9611101wrv.94.2024.02.19.01.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Feb 2024 01:04:39 -0800 (PST)
Message-ID: <ba089899-3625-43b2-9ba4-f2fb0e8ac03e@tuxon.dev>
Date: Mon, 19 Feb 2024 11:04:36 +0200
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
 <4098873b-a7e7-4c88-9af2-01f3c76424ab@tuxon.dev>
 <CAMuHMdX0HDK2w1N-k_R9ud_CVotRgAd2CjOoHTsWkSE_Rb7zyQ@mail.gmail.com>
From: claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <CAMuHMdX0HDK2w1N-k_R9ud_CVotRgAd2CjOoHTsWkSE_Rb7zyQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_010453_558433_594DECDD 
X-CRM114-Status: GOOD (  19.75  )
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

SGksIEdlZXJ0LAoKT24gMTkuMDIuMjAyNCAxMDo0OCwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3Rl
Ogo+IEhpIENsYXVkaXUsCj4gCj4gT24gTW9uLCBGZWIgMTksIDIwMjQgYXQgOToyNOKAr0FNIGNs
YXVkaXUgYmV6bmVhIDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+IHdyb3RlOgo+PiBPbiAxNi4w
Mi4yMDI0IDE2OjA4LCBHZWVydCBVeXR0ZXJob2V2ZW4gd3JvdGU6Cj4+PiBPbiBUaHUsIEZlYiA4
LCAyMDI0IGF0IDE6NDTigK9QTSBDbGF1ZGl1IDxjbGF1ZGl1LmJlem5lYUB0dXhvbi5kZXY+IHdy
b3RlOgo+Pj4+IEZyb206IENsYXVkaXUgQmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5l
c2FzLmNvbT4KPj4+Pgo+Pj4+IFJaL3tHMkwsIFYyTCwgRzNTfS1iYXNlZCBDUEcgdmVyc2lvbnMg
aGF2ZSBzdXBwb3J0IGZvciBzYXZpbmcgZXh0cmEKPj4+PiBwb3dlciB3aGVuIGNsb2NrcyBhcmUg
ZGlzYWJsZWQgYnkgYWN0aXZhdGluZyBtb2R1bGUgc3RhbmRieS4gVGhpcyBpcyBkb25lCj4+Pj4g
dGhyb3VnaCBNU1RPUC1zcGVjaWZpYyByZWdpc3RlcnMgdGhhdCBhcmUgcGFydCBvZiBDUEcuIEVh
Y2ggaW5kaXZpZHVhbAo+Pj4+IG1vZHVsZSBoYXMgb25lIG9yIG1vcmUgYml0cyBhc3NvY2lhdGVk
IHdpdGggb25lIE1TVE9QIHJlZ2lzdGVyIChzZWUgdGFibGUKPj4+PiAiUmVnaXN0ZXJzIGZvciBN
b2R1bGUgU3RhbmRieSBNb2RlIiBmcm9tIEhXIG1hbnVhbHMpLiBIYXJkd2FyZSBtYW51YWwKPj4+
PiBhc3NvY2lhdGVzIG1vZHVsZXMnIGNsb2NrcyB3aXRoIG9uZSBvciBtb3JlIE1TVE9QIGJpdHMu
IFRoZXJlIGFyZSAzIG1hcHBpbmdzCj4+Pj4gYXZhaWxhYmxlIChpZGVudGlmaWVkIGJ5IHJlc2Vh
cmNoaW5nIFJaL0cyTCwgUlovRzNTLCBSWi9WMkwgSFcgbWFudWFscyk6Cj4+Pj4KPj4+PiBjYXNl
IDE6IE4gY2xvY2tzIG1hcHBlZCB0byBOIE1TVE9QIGJpdHMgKHdpdGggTj17MCwgLi4uLCBYfSkK
Pj4+PiBjYXNlIDI6IE4gY2xvY2tzIG1hcHBlZCB0byAxIE1TVE9QIGJpdCAgKHdpdGggTj17MCwg
Li4uLCBYfSkKPj4+PiBjYXNlIDM6IE4gY2xvY2tzIG1hcHBlZCB0byBNIE1TVE9QIGJpdHMgKHdp
dGggTj17MCwgLi4uLCBYfSwgTT17MCwgLi4uLCBZfSkKPj4+Pgo+Pj4+IENhc2UgMyBoYXMgYmVl
biBjdXJyZW50bHkgaWRlbnRpZmllZCBvbiBSWi9WMkwgZm9yIHRoZSBWQ1BMNCBtb2R1bGUuCj4+
Pj4KPj4+PiBUbyBjb3ZlciBhbGwgdGhyZWUgY2FzZXMsIHRoZSBpbmRpdmlkdWFsIHBsYXRmb3Jt
IGRyaXZlcnMgd2lsbCBwcm92aWRlIHRvCj4+Pj4gY2xvY2sgZHJpdmVyIE1TVE9QIHJlZ2lzdGVy
IG9mZnNldCBhbmQgYXNzb2NpYXRlZCBiaXRzIGluIHRoaXMgcmVnaXN0ZXIKPj4+PiBhcyBhIGJp
dG1hc2sgYW5kIHRoZSBjbG9jayBkcml2ZXIgd2lsbCBhcHBseSB0aGlzIGJpdG1hc2sgdG8gcHJv
cGVyCj4+Pj4gTVNUT1AgcmVnaXN0ZXIuCj4+Pj4KPj4+PiBBcGFydCBmcm9tIE1TVE9QIHN1cHBv
cnQsIFJaL0czUyBjYW4gc2F2ZSBtb3JlIHBvd2VyIGJ5IHBvd2VyaW5nIGRvd24gdGhlCj4+Pj4g
aW5kaXZpZHVhbCBJUHMgKGFmdGVyIE1TVE9QIGhhcyBiZWVuIHNldCkgaWYgcHJvcGVyIGJpdHMg
aW4KPj4+PiBDUEdfUFdSRE5fSVB7MSwyfSByZWdpc3RlcnMgYXJlIHNldC4KPj4+Pgo+Pj4+IFRo
ZSBNU1RPUCBhbmQgSVAgcG93ZXIgZG93biBzdXBwb3J0IHdlcmUgaW1wbGVtZW50ZWQgdGhyb3Vn
aCBwb3dlcgo+Pj4+IGRvbWFpbnMuIFBsYXRmb3JtLXNwZWNpZmljIGNsb2NrIGRyaXZlcnMgd2ls
bCByZWdpc3RlciBhbiBhcnJheSBvZgo+Pj4+IHR5cGUgc3RydWN0IHJ6ZzJsX2NwZ19wbV9kb21h
aW5faW5pdF9kYXRhLCB3aGljaCB3aWxsIGJlIHVzZWQgdG8KPj4+PiBpbnN0YW50aWF0ZSBwcm9w
ZXJseSB0aGUgcG93ZXIgZG9tYWlucy4KPj4+Pgo+Pj4+IFNpZ25lZC1vZmYtYnk6IENsYXVkaXUg
QmV6bmVhIDxjbGF1ZGl1LmJlem5lYS51akBicC5yZW5lc2FzLmNvbT4KPj4+Cj4+PiBUaGFua3Mg
Zm9yIHlvdXIgcGF0Y2ghCj4+Pgo+Pj4+IC0tLSBhL2RyaXZlcnMvY2xrL3JlbmVzYXMvcnpnMmwt
Y3BnLmMKPj4+PiArKysgYi9kcml2ZXJzL2Nsay9yZW5lc2FzL3J6ZzJsLWNwZy5jCj4+Pj4gQEAg
LTE1NTksOSArMTU1NiwzNCBAQCBzdGF0aWMgYm9vbCByemcybF9jcGdfaXNfcG1fY2xrKHN0cnVj
dCByemcybF9jcGdfcHJpdiAqcHJpdiwKPj4+PiAgICAgICAgIHJldHVybiB0cnVlOwo+Pj4+ICB9
Cj4+IFsgLi4uIF0KPj4KPj4+Cj4+Pj4gQEAgLTIzNCw2ICsyNDYsNTQgQEAgc3RydWN0IHJ6ZzJs
X3Jlc2V0IHsKPj4+PiAgI2RlZmluZSBERUZfUlNUKF9pZCwgX29mZiwgX2JpdCkgICAgICAgXAo+
Pj4+ICAgICAgICAgREVGX1JTVF9NT04oX2lkLCBfb2ZmLCBfYml0LCAtMSkKPj4+Pgo+Pj4+ICsv
KioKPj4+PiArICogc3RydWN0IHJ6ZzJsX2NwZ19wbV9kb21haW5fY29uZiAtIFBNIGRvbWFpbiBj
b25maWd1cmF0aW9uIGRhdGEgc3RydWN0dXJlCj4+Pj4gKyAqIEBtc3RvcDogTVNUT1AgY29uZmln
dXJhdGlvbiAoTVNCID0gcmVnaXN0ZXIgb2Zmc2V0LCBMU0IgPSBiaXRtYXNrKQo+Pj4+ICsgKiBA
cHdyZG46IFBXUkROIGNvbmZpZ3VyYXRpb24gKE1TQiA9IHJlZ2lzdGVyIG9mZnNldCwgTFNCID0g
cmVnaXN0ZXIgYml0KQo+Pj4+ICsgKi8KPj4+PiArc3RydWN0IHJ6ZzJsX2NwZ19wbV9kb21haW5f
Y29uZiB7Cj4+Pj4gKyAgICAgICB1MzIgbXN0b3A7Cj4+Pj4gKyAgICAgICB1MzIgcHdyZG47Cj4+
Pgo+Pj4gV2h5IG5vdAo+Pj4KPj4+ICAgICB1MTYgbXN0b3Bfb2ZmOwo+Pj4gICAgIHUxNiBtc3Rv
cF9tYXNrOwo+Pj4gICAgIHUxNiBwd3Jkbl9vZmY7Cj4+PiAgICAgdTE2IHB3cmRuX21hc2s7Cj4+
Pgo+Pj4gc28geW91IGNhbiBkcm9wIHRoZSBNU1RPUCooKSBhbmQgUFdSRE4qKCkgbWFjcm9zIGJl
bG93Pwo+Pgo+PiBJIGRpZCBpdCBsaWtlIHRoaXMgdG8gYWxpZ24gd2l0aCB0aGUgYWxyZWFkeSBl
eGlzdGluZyBhcHByb2FjaCBmb3IgdGhpcwo+PiBraW5kIG9mIHRoaW5ncyBhdmFpbGFibGUgaW4g
dGhpcyBkcml2ZXIuIEkgY2FuIGRvIGl0IGFzIHlvdSBwcm9wb3NlZC4KPiAKPiBUaGUgb3RoZXIg
ZmllbGRzIGRvIG5vdCBhbGlnbiBuaWNlbHkgd2l0aCBieXRlIG9yIHdvcmQgYm91bmRhcmllcy4K
PiAKPiBJIGNhbiBzZWUgdGhlIHZhbHVlIG9mIHRoZSBNU1RPUChuYW1lLCBiaXRtYXNrKSBhbmQK
PiBQV1JETihuYW1lLCBiaXRtYXNrKSBtYWNyb3MsIGJ1dCBJJ2QgcmF0aGVyIGdldCByaWQgb2Yg
dGhlICpfTUFTSygpCj4gYW5kICpfT0ZGKCkgdmFyaWFudHMuCgpTdXJlLCBJJ2xsIGRvIHByb3Bl
ciBhZGp1c3RtZW50cyBpbiB0aGUgbmV4dCB2ZXJzaW9uLgoKVGhhbmsgeW91LApDbGF1ZGl1IEJl
em5lYQoKPiAKPj4gRm9yIHRoZSByZXN0IG9mIHlvdXIgY29tbWVudHMgb24gdGhpcyBwYXRjaDog
SSBhZ3JlZSBhbmQgd2lsbCBhZGp1c3QgdGhlCj4+IHBhdGNoIGluIHRoZSBuZXh0IHZlcnNpb24u
Cj4gCj4gVGhhbmtzIQo+IAo+IEdye29ldGplLGVldGluZ31zLAo+IAo+ICAgICAgICAgICAgICAg
ICAgICAgICAgIEdlZXJ0Cj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
