Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4898C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Feb 2024 08:34:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aKz9RaB1nLD1A+j12A255qhDZviJS5rC7zMyUn5vBHM=; b=zKGRF9XTQfKnfJ
	+n04ZJKo/CXA7nZq6cuf8SoLwsMnGGO0EcDxIj0g0nlKm3AQ/5Ln/LnIFlqOByJkXGU3yNWTMp8IT
	hXvaIs9Qc/TB3m4H8l87EyOjc0VgE27VR2dwVls/rGQi2Q9oDamWeCOtLhNsZqRPd88SpsCxV16yF
	FUmNsefpJIdpeXTtHT9Fs2+MNS0xtMXWO/EGgbIY0RuDZJyJAcEqEJ3widpHIIutNm5rYDi+lOpKU
	0B8aFW/fqRaYhvEKKHS1Pipzu2wtaXl7tODpLZyt6fT7thwcBQosiiPI6VglfCKIqge9GmxuJKaGA
	3BeuN9cgnCamctbz4ksw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSWy-000000075zR-3uFl;
	Thu, 01 Feb 2024 08:34:44 +0000
Received: from mail-yb1-f173.google.com ([209.85.219.173])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVSWv-000000075uV-08S0
	for linux-riscv@lists.infradead.org;
	Thu, 01 Feb 2024 08:34:42 +0000
Received: by mail-yb1-f173.google.com with SMTP id 3f1490d57ef6-dc6c3902a98so488017276.1
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 00:34:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706776477; x=1707381277;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2HK1C91x+7wARyC9FcS8BRNfiXMoVY/LaEt3n42/zAE=;
        b=amL3JvG28jQw9kac8dmWjSNKsLxGnuAaMT7ru6gIfFdFagFFzc9dTRSshOfGdPn0iu
         V2KSs30ymr/Up88c4kFcz9yBcvinFGstwiHkqwqK9U8LBkW+2OXK08wSfsQUHQ76S/SK
         5M9s66aX56Ls9nSV+YP+wX98i8X3Oonf5j+eqyriu17bLELbcDrK3WeFNjRnY4rDPRTH
         PP76rsFH9WKqdm3NjjR7LA7dMh/m894RSNoCD8xeKLPYNglLmtmYoQrNrwfUyq3LEATF
         whzpbnCmGWPxf6P7Nc3kAQkT2HofMwZwCazlqKkITuOTZip0QZmeGE6rLSwYyPsQWqyy
         X1pg==
X-Gm-Message-State: AOJu0YyV6sCUh3DBCeXzhOMmtwL1WKUd8uujSZDKTYQR1RbrOeFBk+yl
	sBrqZsQNUPQxq+dYYYmmALoTBtpmrHhO2NQ0xTyFlPZr0wpXMiOEDRSCrU8smUI=
X-Google-Smtp-Source: AGHT+IHfSYHw+zMtRloyzGEFDIj+tK8Iv1QL+dlEyJCoUJQdR7z36xKhyqsGRYmmjloNaudLIR9ANQ==
X-Received: by 2002:a25:aaed:0:b0:dc6:a5e1:3a05 with SMTP id t100-20020a25aaed000000b00dc6a5e13a05mr1587032ybi.14.1706776476894;
        Thu, 01 Feb 2024 00:34:36 -0800 (PST)
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com. [209.85.219.179])
        by smtp.gmail.com with ESMTPSA id 64-20020a251543000000b00dbd15c3b753sm4078117ybv.46.2024.02.01.00.34.34
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Feb 2024 00:34:35 -0800 (PST)
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6d7e3b5bfso415904276.2
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 00:34:34 -0800 (PST)
X-Received: by 2002:a25:824a:0:b0:dc6:ad43:8cf4 with SMTP id
 d10-20020a25824a000000b00dc6ad438cf4mr1840360ybn.20.1706776474698; Thu, 01
 Feb 2024 00:34:34 -0800 (PST)
MIME-Version: 1.0
References: <20240129151618.90922-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20240129151618.90922-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdV7Q4kMv1pFVNBf5oYF=_W_snp=5GKLpr9+OxeqxywhBw@mail.gmail.com> <CA+V-a8spFYvOo2=9CwM-1EyMA3Xrc_rggUgxDZwZan2ou4SG1A@mail.gmail.com>
In-Reply-To: <CA+V-a8spFYvOo2=9CwM-1EyMA3Xrc_rggUgxDZwZan2ou4SG1A@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 1 Feb 2024 09:34:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUFZ6pRtZv4QLGhTz_gG575-8-LvaFprNuP2-1HGS8r+A@mail.gmail.com>
Message-ID: <CAMuHMdUFZ6pRtZv4QLGhTz_gG575-8-LvaFprNuP2-1HGS8r+A@mail.gmail.com>
Subject: Re: [PATCH 2/5] irqchip/renesas-rzg2l: Add support for RZ/Five SoC
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_003441_214296_66806D08 
X-CRM114-Status: GOOD (  38.74  )
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

SGkgUHJhYmhha2FyLAoKT24gV2VkLCBKYW4gMzEsIDIwMjQgYXQgNzozNuKAr1BNIExhZCwgUHJh
Ymhha2FyCjxwcmFiaGFrYXIuY3NlbmdnQGdtYWlsLmNvbT4gd3JvdGU6Cj4gT24gVHVlLCBKYW4g
MzAsIDIwMjQgYXQgMTE6MzjigK9BTSBHZWVydCBVeXR0ZXJob2V2ZW4KPiA8Z2VlcnRAbGludXgt
bTY4ay5vcmc+IHdyb3RlOgo+ID4gT24gTW9uLCBKYW4gMjksIDIwMjQgYXQgNDoxNuKAr1BNIFBy
YWJoYWthciA8cHJhYmhha2FyLmNzZW5nZ0BnbWFpbC5jb20+IHdyb3RlOgo+ID4gPiBGcm9tOiBM
YWQgUHJhYmhha2FyIDxwcmFiaGFrYXIubWFoYWRldi1sYWQucmpAYnAucmVuZXNhcy5jb20+Cj4g
PiA+Cj4gPiA+IFRoZSBJWDQ1IGJsb2NrIGhhcyBhZGRpdGlvbmFsIG1hc2sgcmVnaXN0ZXJzIChO
TVNLL0lNU0svVE1TSykgYXMgY29tcGFyZWQKPiA+ID4gdG8gdGhlIFJaL0cyTCAoZmFtaWx5KSBT
b0MuCj4gPiA+Cj4gPiA+IEludHJvZHVjZSBtYXNraW5nL3VubWFza2luZyBzdXBwb3J0IGZvciBJ
UlEgYW5kIFRJTlQgaW50ZXJydXB0cyBpbiBJUlFDCj4gPiA+IGNvbnRyb2xsZXIgZHJpdmVyLiBU
d28gbmV3IHJlZ2lzdGVycywgSU1TSyBhbmQgVE1TSywgYXJlIGRlZmluZWQgdG8KPiA+ID4gaGFu
ZGxlIG1hc2tpbmcgb24gUlovRml2ZSBTb0MuIFRoZSBpbXBsZW1lbnRhdGlvbiB1dGlsaXplcyBh
IG5ldyBkYXRhCj4gPiA+IHN0cnVjdHVyZSwgYHN0cnVjdCByemcybF9pcnFjX2RhdGFgLCB0byBk
ZXRlcm1pbmUgbWFzayBzdXBwb3J0IGZvciBhCj4gPiA+IHNwZWNpZmljIGNvbnRyb2xsZXIgaW5z
dGFuY2UuCj4gPiA+Cj4gPiA+IFNpZ25lZC1vZmYtYnk6IExhZCBQcmFiaGFrYXIgPHByYWJoYWth
ci5tYWhhZGV2LWxhZC5yakBicC5yZW5lc2FzLmNvbT4KPiA+Cj4gPiA+IC0tLSBhL2RyaXZlcnMv
aXJxY2hpcC9pcnEtcmVuZXNhcy1yemcybC5jCj4gPiA+ICsrKyBiL2RyaXZlcnMvaXJxY2hpcC9p
cnEtcmVuZXNhcy1yemcybC5jCj4gPiA+IEBAIC02NiwxNSArNjgsMjUgQEAgc3RydWN0IHJ6ZzJs
X2lycWNfcmVnX2NhY2hlIHsKPiA+ID4gICAgICAgICB1MzIgICAgIHRpdHNyWzJdOwo+ID4gPiAg
fTsKPiA+ID4KPiA+ID4gKy8qKgo+ID4gPiArICogc3RydWN0IHJ6ZzJsX2lycWNfZGF0YSAtIE9G
IGRhdGEgc3RydWN0dXJlCj4gPiA+ICsgKiBAbWFza19zdXBwb3J0ZWQ6IEluZGljYXRlcyBpZiBt
YXNrIHJlZ2lzdGVycyBhcmUgYXZhaWxhYmxlCj4gPiA+ICsgKi8KPiA+ID4gK3N0cnVjdCByemcy
bF9pcnFjX2RhdGEgewo+ID4KPiA+IFRoaXMgc3RydWN0dXJlIGhhcyB0aGUgc2FtZSBuYW1lIGFz
IHRoZSBzaW5nbGUgc3RhdGljIHN0cnVjdAo+ID4gcnpnMmxfaXJxY19wcml2IGluc3RhbmNlLCB3
aGljaCBpcyBjb25mdXNpbmcuCj4gPgo+IEFncmVlZCwgSSB3aWxsIHJlbmFtZSBpdCB0byByemcy
bF9pcnFjX29mX2RhdGEKPgo+ID4gPiArICAgICAgIGJvb2wgICAgbWFza19zdXBwb3J0ZWQ7Cj4g
PiA+ICt9Owo+ID4gPiArCj4gPiA+ICAvKioKPiA+ID4gICAqIHN0cnVjdCByemcybF9pcnFjX3By
aXYgLSBJUlEgY29udHJvbGxlciBwcml2YXRlIGRhdGEgc3RydWN0dXJlCj4gPiA+ICAgKiBAYmFz
ZTogICAgICBDb250cm9sbGVyJ3MgYmFzZSBhZGRyZXNzCj4gPiA+ICsgKiBAZGF0YTogICAgICBP
RiBkYXRhIHBvaW50ZXIKPiA+ID4gICAqIEBmd3NwZWM6ICAgIElSUSBmaXJtd2FyZSBzcGVjaWZp
YyBkYXRhCj4gPiA+ICAgKiBAbG9jazogICAgICBMb2NrIHRvIHNlcmlhbGl6ZSBhY2Nlc3MgdG8g
aGFyZHdhcmUgcmVnaXN0ZXJzCj4gPiA+ICAgKiBAY2FjaGU6ICAgICBSZWdpc3RlcnMgY2FjaGUg
Zm9yIHN1c3BlbmQvcmVzdW1lCj4gPiA+ICAgKi8KPiA+ID4gIHN0YXRpYyBzdHJ1Y3QgcnpnMmxf
aXJxY19wcml2IHsKPiA+ID4gICAgICAgICB2b2lkIF9faW9tZW0gICAgICAgICAgICAgICAgICAg
ICpiYXNlOwo+ID4gPiArICAgICAgIGNvbnN0IHN0cnVjdCByemcybF9pcnFjX2RhdGEgICAgKmRh
dGE7Cj4gPgo+ID4gUmVwbGFjaW5nIHRoaXMgYnkgYSBib29sIHdvdWxkIGF2b2lkIGEgcG9pbnRl
ciBkZXJlZmVyZW5jZSBpbiBlYWNoIHVzZXIsCj4gPiBhbmQgYWxsb3dzIHlvdSB0byBtYWtlIHJ6
ZzJsX2lycWNfZGF0YSBldGMuIF9faW5pdGNvbnN0Lgo+ID4KPiBEbyB5b3UgbWVhbiBqdXN0IGFk
ZCAiYm9vbCBtYXNrX3N1cHBvcnRlZCIgaGVyZSBhbmQgZ2V0IHJpZCBvZiBzdHJ1Y3QKPiByemcy
bF9pcnFjX2RhdGEgPyBDYW4geW91IHBsZWFzZSBlbGFib3JhdGUgaGVyZS4uCgpFaXRoZXIgYWRk
ICJib29sIG1hc2tfc3VwcG9ydGVkIiBoZXJlLCBvciBhZGQgYSBjb3B5IG9mIHRoZSBmdWxsCnN0
cnVjdCByemcybF9pcnFjX2RhdGEgKHNlZSBiZWxvdykuCgo+Cj4gPiA+ICAgICAgICAgc3RydWN0
IGlycV9md3NwZWMgICAgICAgICAgICAgICBmd3NwZWNbSVJRQ19OVU1fSVJRXTsKPiA+ID4gICAg
ICAgICByYXdfc3BpbmxvY2tfdCAgICAgICAgICAgICAgICAgIGxvY2s7Cj4gPiA+ICAgICAgICAg
c3RydWN0IHJ6ZzJsX2lycWNfcmVnX2NhY2hlICAgICBjYWNoZTsKPiA+Cj4gPiA+IEBAIC0zNzEs
OSArNDc1LDIzIEBAIHN0YXRpYyBpbnQgcnpnMmxfaXJxY19wYXJzZV9pbnRlcnJ1cHRzKHN0cnVj
dCByemcybF9pcnFjX3ByaXYgKnByaXYsCj4gPiA+ICAgICAgICAgcmV0dXJuIDA7Cj4gPiA+ICB9
Cj4gPiA+Cj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX2lycWNfZGF0YSByemZpdmVf
aXJxY19kYXRhID0gewo+ID4gPiArICAgICAgIC5tYXNrX3N1cHBvcnRlZCA9IHRydWUsCj4gPiA+
ICt9Owo+ID4gPiArCj4gPiA+ICtzdGF0aWMgY29uc3Qgc3RydWN0IHJ6ZzJsX2lycWNfZGF0YSBy
emcybF9pcnFjX2RlZmF1bHRfZGF0YSA9IHsKPiA+ID4gKyAgICAgICAubWFza19zdXBwb3J0ZWQg
PSBmYWxzZSwKPiA+ID4gK307Cj4gPiA+ICsKPiA+ID4gK3N0YXRpYyBjb25zdCBzdHJ1Y3Qgb2Zf
ZGV2aWNlX2lkIHJ6ZzJsX2lycWNfbWF0Y2hlc1tdID0gewo+ID4gPiArICAgICAgIHsgLmNvbXBh
dGlibGUgPSAicmVuZXNhcyxyOWEwN2cwNDNmLWlycWMiLCAuZGF0YSA9ICZyemZpdmVfaXJxY19k
YXRhIH0sCj4gPiA+ICsgICAgICAgeyB9Cj4gPiA+ICt9Owo+ID4gPiArCj4gPiA+ICBzdGF0aWMg
aW50IHJ6ZzJsX2lycWNfaW5pdChzdHJ1Y3QgZGV2aWNlX25vZGUgKm5vZGUsIHN0cnVjdCBkZXZp
Y2Vfbm9kZSAqcGFyZW50KQo+ID4gPiAgewo+ID4gPiAgICAgICAgIHN0cnVjdCBpcnFfZG9tYWlu
ICppcnFfZG9tYWluLCAqcGFyZW50X2RvbWFpbjsKPiA+ID4gKyAgICAgICBjb25zdCBzdHJ1Y3Qg
b2ZfZGV2aWNlX2lkICptYXRjaDsKPiA+ID4gICAgICAgICBzdHJ1Y3QgcGxhdGZvcm1fZGV2aWNl
ICpwZGV2Owo+ID4gPiAgICAgICAgIHN0cnVjdCByZXNldF9jb250cm9sICpyZXNldG47Cj4gPiA+
ICAgICAgICAgaW50IHJldDsKPiA+ID4gQEAgLTM5Miw2ICs1MTAsMTIgQEAgc3RhdGljIGludCBy
emcybF9pcnFjX2luaXQoc3RydWN0IGRldmljZV9ub2RlICpub2RlLCBzdHJ1Y3QgZGV2aWNlX25v
ZGUgKnBhcmVudCkKPiA+ID4gICAgICAgICBpZiAoIXJ6ZzJsX2lycWNfZGF0YSkKPiA+ID4gICAg
ICAgICAgICAgICAgIHJldHVybiAtRU5PTUVNOwo+ID4gPgo+ID4gPiArICAgICAgIG1hdGNoID0g
b2ZfbWF0Y2hfbm9kZShyemcybF9pcnFjX21hdGNoZXMsIG5vZGUpOwo+ID4gPiArICAgICAgIGlm
IChtYXRjaCkKPiA+ID4gKyAgICAgICAgICAgICAgIHJ6ZzJsX2lycWNfZGF0YS0+ZGF0YSA9IG1h
dGNoLT5kYXRhOwo+ID4gPiArICAgICAgIGVsc2UKPiA+ID4gKyAgICAgICAgICAgICAgIHJ6ZzJs
X2lycWNfZGF0YS0+ZGF0YSA9ICZyemcybF9pcnFjX2RlZmF1bHRfZGF0YTsKPiA+Cj4gPiBJbnN0
ZWFkIG9mIG1hdGNoaW5nIGEgc2Vjb25kIHRpbWUsIEknZCByYXRoZXIgYWRkIGEgc2Vjb25kCj4g
PiBJUlFDSElQX01BVENIKCkgZW50cnkgd2l0aCBhIGRpZmZlcmVudCBpbml0IGZ1bmN0aW9uLCBw
YXNzaW5nIHRoZQo+ID4gYWN0dWFsIHJ6ZzJsX2lycWNfZGF0YSBwb2ludGVyLgo+ID4KPiBPSywg
b3IgcmF0aGVyIGp1c3QgcGFzcyB0cnVlL2ZhbHNlIGluc3RlYWQgb2YgcnpnMmxfaXJxY19vZl9k
YXRhIHBvaW50ZXIuPwoKWWVzLCB0aGF0IHdvdWxkIGJlIGZpbmUgZm9yIG1lLCB0b28uCkl0IGFs
bCBkZXBlbmRzIG9uIHdoZXRoZXIgeW91IHBsYW4gdG8gYWRkLCBvciBzZWUgYSBuZWVkIGZvciBh
ZGRpbmcsCm1vcmUgZmxhZ3Mgb3Igb3RoZXIgZmllbGRzIGluIHRoZSBmdXR1cmUgKGFuZCBldmVu
IGZvciBmbGFncywgeW91IGNvdWxkCmNvbWJpbmUgdGhlbSBpbiBhbiB1bnNpZ25lZCBsb25nKS4K
Ckdye29ldGplLGVldGluZ31zLAoKICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKCi0tIApH
ZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBsb3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0t
IGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJzb25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVj
aG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBhIGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtp
bmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAicHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxp
a2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxk
cwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
