Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5696FD5F61
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Apr 2026 06:15:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gSg2bn0ODUXBA/N+WiT7C0lPW9suTsp81Hm4ECMXHCo=; b=pZpGbluGRuE3TA
	+6m49uSC7TACx3Fm6QuLop5sodgdYfsBI1o2j20pPcY3wQ/eMD5cs9fr63Ow5+Q0eHtY/Ef644FXs
	aKYjfZGWtMa0lUWrxtTGZ1h48L5HLqxKAuZlhlCc5dyYK2qXszKryuqWRIBg/jiyEFR7g+ctgDb0P
	ayqLej0/VrI3K6Y0PEAdWcU1xi68bko0/4VU9krbTWWkGTnfekFEdLDb9zMCfFQPWvZUFpg4BJ4SL
	ClDA5tDIW8639wOa7h03TQo7NxykpXCx/YfZTKE+3N3vwmheZejvmPhMRq+3gH+5lyA53b8iASB0M
	fPy4HHXubwxnm+6nBgig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMCP-00000008Kko-2gpW;
	Wed, 08 Apr 2026 06:15:37 +0000
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAMCM-00000008KkT-48az
	for linux-riscv@lists.infradead.org;
	Wed, 08 Apr 2026 06:15:36 +0000
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-79853c0f5b9so93533737b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 23:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775628933; cv=none;
        d=google.com; s=arc-20240605;
        b=UXx+mjbTAACWcmPFFbU3c5KQaEi3OW9hOr0N1vMurmFf2IR+KlGittsBz3mE9P/Yo5
         6ZUsxoAyFDc2DTAuq7tCstUc/RT2K9xxm5k3zAILNRzkTcXYlsbDyRLQhVW7+tZqGmD2
         5M86HzupG47MkYzckbYS0TIHEcRTvF8l1IsLJia/0fOdc4A2UkGYjhFO+MGkN8V4uhVm
         j35TZNUq9FOMLEcGWoNAvkCXjQ0HXiMIzjmQmx0MOMUKWI9gVkwMJBUvxn/8STPuA7iw
         0N8RnfGHxbhWLbBiAKXBzkZbj0iiET/un9quKz1XtPTqpwDKdvj6gQ2uLE+FFau6ZBQr
         Ox9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qBbsUuQfJADTXtwaYtDrI/eiB3XSYduasp97QwWvDxk=;
        fh=uTmaxlxVcPSKez7tUIXk0HjX0bly5mTEW6MUtZHraT0=;
        b=RkEXlUMk/ovBmygRMZ045Bp0uP0G/Ci3SE3EAiqDx2CMT50QDRJjB/Jk/cQk3vAoky
         /+3vZoUzRPmbqNiJFbSiGWqrf0scDhTKF0uO0eyWHBXa85kkqonZ5xSBDo92X9Cc5nVE
         Ke9CD8jWUsCIGmbWMqmOXy9MUewaC1Or9AzuJh+Qnpw2ivIDvnx7DFeBt2krpY/OJFZi
         vDJNn8A/hEIhFFaAKIPJTwGIXfOIES70kXjrhr2b5l7FoXOgdqj9FU4Eo/kRcclmJrBE
         MOETzt8VPQKdKc11BDnCNtJUWHUdwIUT/iSEF/csl2okBPzmWJ9Cjtbk1ST2RYwNC5Qy
         PEuw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1775628933; x=1776233733; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qBbsUuQfJADTXtwaYtDrI/eiB3XSYduasp97QwWvDxk=;
        b=Uy6mbliqGY+5QchqUVu7LAkTUBXNYFvLu5LMEhKxTKS27wkc66BulQ8okwIMLxtbRu
         eSn5DtBx9e/rkg6VpRW1PAOXdik8I5AZj1ZY2/60gZbTR16+ne/q+ydAjcIQ31zDDwI9
         iHe3BmHcgxIAsk20Z5zCJ5mLGt2BeLmcFpkrzf9V1k+CfqrkPl/tWGQcCjy56NRf7gNG
         xa4beDKqyFLZ6vEeMDwW+5I7E1GDkCnZparlvnrzK/H/VSnWbHDGAbLBPOia+P+uOCz4
         BUct4ppSlUO/3d1y9Q0s+wnkE11zFXUDg7N2GuLzrPUbWKgD/cjdC3zp9lPpGDVoLj0g
         F/Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628933; x=1776233733;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qBbsUuQfJADTXtwaYtDrI/eiB3XSYduasp97QwWvDxk=;
        b=myC65WlJzsPf0W/AkhQjb/LGO31YiyS9fVoqFSSuHQLVhC8jcXdcv1rnOZNWf5VoNr
         cLbcy7KpNMBQ5X8WhaBfRcyFm87Nj8pjKdPrQI6t44tR8Sj08pEKsGahmYQq5/GZpsfv
         epBfrjnYUQxlHIS00t3A7XUmUIHVFifT+W/cr91+Y4TmeL8uSW+ZRc0+CUHCNhXAhJQg
         oWSbNbp1I76MQQKdKNGqMsg2pjQU2sAUUqATKFIKnV2R2YwmW87T/3cSFm/NXVv2PZZO
         pJBBYSOfZHLilbrrvRWgHas7J8c1xJFuJh7Jr4Bk+RhLB/AShWbdn4phKmNEDmcWzE9c
         wHoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3nKdMfysKenqlRF+76kYOvPkC8jDyuqGhWj4rGtwucY6raq1KJ7irEIKESZNUXs/qmKz52Qb1g6NaTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzVtzkCzPocjSHHjcj0lFATiFPcwC1sCW+IIz+/UJjQ6DdM1PIe
	Gnzy/vKc7LmA3xYz17X+Hy+x4b2ylPx0NDSh2mzbexK/81QZeVNLAUh80MkYe4WcxjpaWn33s6a
	Nd4T7HBP+nthRAMKFV3tq+NpzUkj9DAljwZTgpuKn8w==
X-Gm-Gg: AeBDietgS4ejQqVjB3bG3QsS3wR/T1zc57U12LxteNMV86UjS6crVzRyA+GoMB1GtMm
	6FS/lzMk2eYu6vO1VTtCVKFVYijCwNBsUkhjMXgUf5jWedFzIsbsrPgpBPhmwjEx1K9d9T0nC54
	4PMhD1FM7LWvip8MjhzuEyjIXLeCZ9YIV9yfDAWamBGbXaDMpGZhNY13gd12uF1oa+6+TsNe2Gr
	M0ygKc/WU+0clDsTF94mTvPOt/Cmk6X/i97xPusQieZ+rphprfCL9uPLaMOxzjR7b0ZWT+7FwF6
	gByA2gYM/Q==
X-Received: by 2002:a05:690c:101:b0:7a2:1f26:3d6a with SMTP id
 00721157ae682-7a4d5d5458emr204440797b3.45.1775628933009; Tue, 07 Apr 2026
 23:15:33 -0700 (PDT)
MIME-Version: 1.0
References: <20250321083507.25298-1-nick.hu@sifive.com> <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
In-Reply-To: <acWdSsAtmyTTFVHb@bby-cbu-swbuild03.eng.microchip.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 8 Apr 2026 14:15:19 +0800
X-Gm-Features: AQROBzA3BpQWWAwec4LzRXJ-4DjjfOnzhbxgY2fyjfkEITq9O1rAj7G_-h6M_Hw
Message-ID: <CAKddAkCZXmw95XN6ypd_i=JqkMUooD=riTisHUMrY8Kqkebbqw@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: timer: Add SiFive CLINT2
To: Charles Perry <charles.perry@microchip.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_231535_068647_92507E4E 
X-CRM114-Status: GOOD (  23.58  )
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

T24gRnJpLCBNYXIgMjcsIDIwMjYgYXQgNDo1NuKAr0FNIENoYXJsZXMgUGVycnkKPGNoYXJsZXMu
cGVycnlAbWljcm9jaGlwLmNvbT4gd3JvdGU6Cj4KPiBPbiBGcmksIE1hciAyMSwgMjAyNSBhdCAw
NDozNTowNlBNICswODAwLCBOaWNrIEh1IHdyb3RlOgo+ID4gQWRkIGNvbXBhdGlibGUgc3RyaW5n
IGFuZCBwcm9wZXJ0eSBmb3IgdGhlIFNpRml2ZSBDTElOVCB2Mi4gVGhlIFNpRml2ZQo+ID4gQ0xJ
TlQgdjIgaXMgaW5jb21wYXRpYmxlIHdpdGggdGhlIFNpRml2ZSBDTElOVCB2MCBkdWUgdG8gZGlm
ZmVyZW5jZXMKPiA+IGluIHRoZWlyIGNvbnRyb2wgbWV0aG9kcy4KPgo+IEhlbGxvIE5pY2ssCj4K
PiBDYW4geW91IGhlbHAgbWUgdW5kZXJzdGFuZCB3aGF0IGlzIHRoaXMgZGlmZmVyZW50IGNvbnRy
b2wgbWV0aG9kPyBJJ3ZlCj4gZm91bmQgdGhhdCBib3RoIE9wZW5TQkkgWzFdIGFuZCBVLUJvb3Qg
WzJdIHVzZSB0aGUgc2FtZSBtYXRjaCBkYXRhIGluIHRoZWlyCj4gY2xpbnQgZHJpdmVyIHdoaWNo
IHdvdWxkIGluZGljYXRlIHRoYXQgdGhleSBhcmUgY29tcGF0aWJsZS4KPgpTb3JyeSBmb3IgdGhl
IGxhdGUgcmVwbHkuClVubGlrZSB2MCwgdjIgcmVxdWlyZXMgYSB3cml0ZSB0byB0aGUgbXRpbWUg
cmVnaXN0ZXIgdG8ga2ljayB0aGUgdGltZXIuCgo+IEFsc28sIGRvIHlvdSBrbm93IGlmIHRoZXJl
J3MgYW4gZWFzeSB3YXkgdG8gdGVsbCBpZiBhIHNpZml2ZSBjbGludCBpcyBhIHYwCj4gb3IgdjI/
Cj4Kc2lmaXZlLGNsaW50MiBpbnRyb2R1Y2VzIGFkZGl0aW9uYWwgTU1JTyByZWdpc3RlcnMKCj4g
VGhhbmtzLAo+IENoYXJsZXMKPgo+IFsxXTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vb3Bl
bnNiaS92MS44LjEvc291cmNlL2xpYi91dGlscy90aW1lci9mZHRfdGltZXJfbXRpbWVyLmMjTDE2
Mwo+IFsyXTogaHR0cHM6Ly9lbGl4aXIuYm9vdGxpbi5jb20vdS1ib290L3YyMDI2LjAxL3NvdXJj
ZS9kcml2ZXJzL3RpbWVyL3Jpc2N2X2FjbGludF90aW1lci5jI0w4Ngo+Cj4gPgo+ID4gU2lnbmVk
LW9mZi1ieTogTmljayBIdSA8bmljay5odUBzaWZpdmUuY29tPgo+ID4gUmV2aWV3ZWQtYnk6IFNh
bXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29tPgo+ID4gLS0tCj4gPiAtIHYz
IGNoYW5nZXM6Cj4gPiAgIC0gQWRkIHRoZSByZWFzb24gZm9yIHRoZSBpbmNvbXBhdGliaWxpdHkg
YmV0d2VlbiBzaWZpdmUsY2xpbnQyIGFuZAo+ID4gICAgIHNpZml2ZSxjbGludDAuCj4gPiAtIHYy
IGNoYW5nZXM6Cj4gPiAgIC0gRG9uJ3QgYWxsb3cgc2lmaXZlLGNsaW50MiBieSBpdHNlbGYuIEFk
ZCAnLXt9JyB0byB0aGUgZmlyc3QgZW50cnkKPiA+ICAgLSBNYXJrIHRoZSBzaWZpdmUsZmluZS1j
dHItYml0cyBhcyB0aGUgcmVxdWlyZWQgcHJvcGVydHkgd2hlbgo+ID4gICAgIHRoZSBjb21wYXRp
YmxlIGluY2x1ZGVzIHRoZSBzaWZpdmUsY2xpbnQyCj4gPgo+ID4gIC4uLi9iaW5kaW5ncy90aW1l
ci9zaWZpdmUsY2xpbnQueWFtbCAgICAgICAgICB8IDIyICsrKysrKysrKysrKysrKysrKysKPiA+
ICAxIGZpbGUgY2hhbmdlZCwgMjIgaW5zZXJ0aW9ucygrKQo+ID4KPiA+IGRpZmYgLS1naXQgYS9E
b2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50LnlhbWwg
Yi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZlLGNsaW50Lnlh
bWwKPiA+IGluZGV4IDc2ZDgzYWVhNGUyYi4uMzQ2ODRjZGE4YjE1IDEwMDY0NAo+ID4gLS0tIGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1s
Cj4gPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvdGltZXIvc2lmaXZl
LGNsaW50LnlhbWwKPiA+IEBAIC0zNiw2ICszNiwxMiBAQCBwcm9wZXJ0aWVzOgo+ID4gICAgICAg
ICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtY2xpbnQgICAjIFN0YXJGaXZlIEpINzExMAo+ID4g
ICAgICAgICAgICAgICAgLSBzdGFyZml2ZSxqaDgxMDAtY2xpbnQgICAjIFN0YXJGaXZlIEpIODEw
MAo+ID4gICAgICAgICAgICAtIGNvbnN0OiBzaWZpdmUsY2xpbnQwICAgICAgICAjIFNpRml2ZSBD
TElOVCB2MCBJUCBibG9jawo+ID4gKyAgICAgIC0gaXRlbXM6Cj4gPiArICAgICAgICAgIC0ge30K
PiA+ICsgICAgICAgICAgLSBjb25zdDogc2lmaXZlLGNsaW50MiAgICAgICAgIyBTaUZpdmUgQ0xJ
TlQgdjIgSVAgYmxvY2sKPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOgo+ID4gKyAgICAgICAgICBT
aUZpdmUgQ0xJTlQgdjIgaXMgdGhlIEhSVCB0aGF0IHN1cHBvcnRzIHRoZSBaaWNudHIuIFRoZSBj
b250cm9sIG9mIHNpZml2ZSxjbGludDIKPiA+ICsgICAgICAgICAgZGlmZmVycyBmcm9tIHRoYXQg
b2Ygc2lmaXZlLGNsaW50MCwgbWFraW5nIHRoZW0gaW5jb21wYXRpYmxlLgo+ID4gICAgICAgIC0g
aXRlbXM6Cj4gPiAgICAgICAgICAgIC0gZW51bToKPiA+ICAgICAgICAgICAgICAgIC0gYWxsd2lu
bmVyLHN1bjIwaS1kMS1jbGludAo+ID4gQEAgLTYyLDYgKzY4LDIyIEBAIHByb3BlcnRpZXM6Cj4g
PiAgICAgIG1pbkl0ZW1zOiAxCj4gPiAgICAgIG1heEl0ZW1zOiA0MDk1Cj4gPgo+ID4gKyAgc2lm
aXZlLGZpbmUtY3RyLWJpdHM6Cj4gPiArICAgIG1heGltdW06IDE1Cj4gPiArICAgIGRlc2NyaXB0
aW9uOiBUaGUgd2lkdGggaW4gYml0cyBvZiB0aGUgZmluZSBjb3VudGVyLgo+ID4gKwo+ID4gK2lm
Ogo+ID4gKyAgcHJvcGVydGllczoKPiA+ICsgICAgY29tcGF0aWJsZToKPiA+ICsgICAgICBjb250
YWluczoKPiA+ICsgICAgICAgIGNvbnN0OiBzaWZpdmUsY2xpbnQyCj4gPiArdGhlbjoKPiA+ICsg
IHJlcXVpcmVkOgo+ID4gKyAgICAtIHNpZml2ZSxmaW5lLWN0ci1iaXRzCj4gPiArZWxzZToKPiA+
ICsgIHByb3BlcnRpZXM6Cj4gPiArICAgIHNpZml2ZSxmaW5lLWN0ci1iaXRzOiBmYWxzZQo+ID4g
Kwo+ID4gIGFkZGl0aW9uYWxQcm9wZXJ0aWVzOiBmYWxzZQo+ID4KPiA+ICByZXF1aXJlZDoKPiA+
IC0tCj4gPiAyLjE3LjEKPiA+Cj4gPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3Rz
LmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5m
by9saW51eC1yaXNjdgo=
