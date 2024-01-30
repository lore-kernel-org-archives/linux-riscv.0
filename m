Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262B9C46CD2
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Jan 2024 10:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvbYj0u5U/i/hRZa2TC1hFloRMdyj21uYuvRrYVxdnk=; b=kxRc9cO7UP7bXa
	/gwerNmc1EesXd3VLEF02eBBM2EkNUtvG4pUjtTuuoMhKwE86mnGXZWaTDIRjeROSyzGFsdlMx+hA
	+ORFf2kJ2VP4iRgH0KrGlVsgmXJSSC8kdNtrtbbTPyeZ6uBfyAnnVvNljmC5sDRqpwrQemiKmhJ9u
	2VwXs53XqrZAW7Mt8f/1/FbWHOxakwPNHKeXElOzVC8uf29fp028Q/NOStjICX9RRTrLktHoqmdc3
	aayhm4jilmByG/MZR8bhJhbGJ7QNwYJ/ZxAMeWj8lW+c5B1tkVQoU22D5gYw41zYDyYacivZBY6un
	CQnpj9TwVXxfnsmaQ0hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkww-0000000G5cj-1nUm;
	Tue, 30 Jan 2024 10:02:38 +0000
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUkwu-0000000G5bg-0bRg
	for linux-riscv@lists.infradead.org;
	Tue, 30 Jan 2024 10:02:37 +0000
Received: by mail-lf1-x12b.google.com with SMTP id 2adb3069b0e04-510f37d673aso3032880e87.0
        for <linux-riscv@lists.infradead.org>; Tue, 30 Jan 2024 02:02:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1706608953; x=1707213753; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kClA8daQckTIvu1OZztRzd8EFBYH/WDKzJCQ35/y4Ao=;
        b=FiiXorlMPXVHq9/sTeOx3T24K4JK0FZkIpfw8f0zeTckkJX4CVITeKRUgLDgDkZec8
         jnJ13INan4Ye9vsV8F0rCT5KKfmcu4OcLGmtb3+k3YMgX8mXbo3yXymTQiFi6ngCpLRR
         MTU88dQxivSTLS/vXVWd/H99yq8flO9jGijAizjTLMyQcrzKj2L5knbHI9ky68PDGp/a
         wOra6T9VxjmJvdiePu3FljUSwbm+St8dk6zzrKa9x/3RLrYMhc36zOFzkhTmiB2G9obL
         f2fJC+XTNbbjX9C33ZrjAjkfD0N9N5oQxnEPKcorMveDo7Hu1d6RhWs0sWbmpjzUE/em
         RxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706608953; x=1707213753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kClA8daQckTIvu1OZztRzd8EFBYH/WDKzJCQ35/y4Ao=;
        b=CwrlyaZ2hU8KnjsYqoJf3nV/QsOf/h7UVKHAuhNL3dWBTZ0N9phLfC9en4OT4mvgzi
         awBRO8YI31eyWlTIEZV56WdkmpRRQPSpr4AvcLFZ+pi/bNQYfJadqz4QxYW04ElT2/nQ
         UPOeLDp/H0Jo1NAZKNoAHh8FcWGrRwphWwCUsTEQ0rL/4eC09ReznKujOkLUSFJrfVM6
         fFrOx1n9yjCDwjrm60IgqlNaJMdqhh8n9qEbYwiSGnGZM22BoqgnXKFqqfb29vEvgvPr
         0K1A0MCpY564G070NArzf5fSX4rRjaWsBgAQqA2FFqeRXLSre2j37wTiGH0U8qYw7X/t
         uBRw==
X-Gm-Message-State: AOJu0Yx0mgxzRxNr0ThGe2lSGNlCZfr5puvxgP+iILYfDvrtjurlxOdA
	3vc+eKBFGkiLNUwsqhG2TAJ5BdGNmRTz+JCNV3TPmHQP1i2oYMPGyif7ApIJrPQfDUUlMg3XINu
	J82+VB9U75/sZohf7YJPxfe0n4scy4vHxx1JpyA==
X-Google-Smtp-Source: AGHT+IEu4GUw7zdQUbV+R6CcIgnxnw9wAWoqOjcKDwjumwIFhh0v31H+fAq88YVX4N5QfeCdu72T3yofgT9yNyrYMQo=
X-Received: by 2002:a05:6512:61:b0:50e:8eff:3980 with SMTP id
 i1-20020a056512006100b0050e8eff3980mr6148028lfo.30.1706608953505; Tue, 30 Jan
 2024 02:02:33 -0800 (PST)
MIME-Version: 1.0
References: <20240127161753.114685-1-apatel@ventanamicro.com>
 <87r0hzuw87.fsf@all.your.base.are.belong.to.us> <87le87uulb.fsf@all.your.base.are.belong.to.us>
In-Reply-To: <87le87uulb.fsf@all.your.base.are.belong.to.us>
From: Anup Patel <apatel@ventanamicro.com>
Date: Tue, 30 Jan 2024 15:32:21 +0530
Message-ID: <CAK9=C2U2mGzTLaXDqyD86bEM4XRc3UmBxRtrd3=+QXXwMK3hjg@mail.gmail.com>
Subject: Re: [PATCH v12 00/25] Linux RISC-V AIA Support
To: =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Frank Rowand <frowand.list@gmail.com>, 
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Saravana Kannan <saravanak@google.com>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, 
	linux-kernel@vger.kernel.org, Atish Patra <atishp@atishpatra.org>, 
	linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	Andrew Jones <ajones@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240130_020236_212774_FC7326E5 
X-CRM114-Status: GOOD (  17.41  )
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

T24gVHVlLCBKYW4gMzAsIDIwMjQgYXQgMToyMuKAr1BNIEJqw7ZybiBUw7ZwZWwgPGJqb3JuQGtl
cm5lbC5vcmc+IHdyb3RlOgo+Cj4gQmrDtnJuIFTDtnBlbCA8Ympvcm5Aa2VybmVsLm9yZz4gd3Jp
dGVzOgo+Cj4gPiBBbnVwIFBhdGVsIDxhcGF0ZWxAdmVudGFuYW1pY3JvLmNvbT4gd3JpdGVzOgo+
ID4KPiA+PiBUaGUgUklTQy1WIEFJQSBzcGVjaWZpY2F0aW9uIGlzIHJhdGlmaWVkIGFzLXBlciB0
aGUgUklTQy1WIGludGVybmF0aW9uYWwKPiA+PiBwcm9jZXNzLiBUaGUgbGF0ZXN0IHJhdGlmaWVk
IEFJQSBzcGVjaWZjYXRpb24gY2FuIGJlIGZvdW5kIGF0Ogo+ID4+IGh0dHBzOi8vZ2l0aHViLmNv
bS9yaXNjdi9yaXNjdi1haWEvcmVsZWFzZXMvZG93bmxvYWQvMS4wL3Jpc2N2LWludGVycnVwdHMt
MS4wLnBkZgo+ID4+Cj4gPj4gQXQgYSBoaWdoLWxldmVsLCB0aGUgQUlBIHNwZWNpZmljYXRpb24g
YWRkcyB0aHJlZSB0aGluZ3M6Cj4gPj4gMSkgQUlBIENTUnMKPiA+PiAgICAtIEltcHJvdmVkIGxv
Y2FsIGludGVycnVwdCBzdXBwb3J0Cj4gPj4gMikgSW5jb21pbmcgTWVzc2FnZSBTaWduYWxlZCBJ
bnRlcnJ1cHQgQ29udHJvbGxlciAoSU1TSUMpCj4gPj4gICAgLSBQZXItSEFSVCBNU0kgY29udHJv
bGxlcgo+ID4+ICAgIC0gU3VwcG9ydCBNU0kgdmlydHVhbGl6YXRpb24KPiA+PiAgICAtIFN1cHBv
cnQgSVBJIGFsb25nIHdpdGggdmlydHVhbGl6YXRpb24KPiA+PiAzKSBBZHZhbmNlZCBQbGF0Zm9y
bS1MZXZlbCBJbnRlcnJ1cHQgQ29udHJvbGxlciAoQVBMSUMpCj4gPj4gICAgLSBXaXJlZCBpbnRl
cnJ1cHQgY29udHJvbGxlcgo+ID4+ICAgIC0gSW4gTVNJLW1vZGUsIGNvbnZlcnRzIHdpcmVkIGlu
dGVycnVwdCBpbnRvIE1TSXMgKGkuZS4gTVNJIGdlbmVyYXRvcikKPiA+PiAgICAtIEluIERpcmVj
dC1tb2RlLCBpbmplY3RzIGV4dGVybmFsIGludGVycnVwdHMgZGlyZWN0bHkgaW50byBIQVJUcwo+
ID4+Cj4gPj4gRm9yIGFuIG92ZXJ2aWV3IG9mIHRoZSBBSUEgc3BlY2lmaWNhdGlvbiwgcmVmZXIg
dGhlIEFJQSB2aXJ0dWFsaXphdGlvbgo+ID4+IHRhbGsgYXQgS1ZNIEZvcnVtIDIwMjI6Cj4gPj4g
aHR0cHM6Ly9zdGF0aWMuc2NoZWQuY29tL2hvc3RlZF9maWxlcy9rdm1mb3J1bTIwMjIvYTEvQUlB
X1ZpcnR1YWxpemF0aW9uX2luX0tWTV9SSVNDVl9maW5hbC5wZGYKPiA+PiBodHRwczovL3d3dy55
b3V0dWJlLmNvbS93YXRjaD92PXIwNzFkTDhaMHlvCj4gPj4KPiA+PiBUbyB0ZXN0IHRoaXMgc2Vy
aWVzLCB1c2UgUUVNVSB2Ny4yIChvciBoaWdoZXIpIGFuZCBPcGVuU0JJIHYxLjIgKG9yIGhpZ2hl
cikuCj4gPj4KPiA+PiBUaGVzZSBwYXRjaGVzIGNhbiBhbHNvIGJlIGZvdW5kIGluIHRoZSByaXNj
dl9haWFfdjEyIGJyYW5jaCBhdDoKPiA+PiBodHRwczovL2dpdGh1Yi5jb20vYXZwYXRlbC9saW51
eC5naXQKPiA+Pgo+ID4+IENoYW5nZXMgc2luY2UgdjExOgo+ID4+ICAtIFJlYmFzZWQgb24gTGlu
dXgtNi44LXJjMQo+ID4+ICAtIEluY2x1ZGVkIGtlcm5lbC9pcnEgcmVsYXRlZCBwYXRjaGVzIGZy
b20gImdlbmlycSwgaXJxY2hpcDogQ29udmVydCBBUk0KPiA+PiAgICBNU0kgaGFuZGxpbmcgdG8g
cGVyIGRldmljZSBNU0kgZG9tYWlucyIgc2VyaWVzIGJ5IFRob21hcy4KPiA+PiAgICAoUEFUQ0g3
LCBQQVRDSDgsIFBBVENIOSwgUEFUQ0gxNCwgUEFUQ0gxNiwgUEFUQ0gxNywgUEFUQ0gxOCwgUEFU
Q0gxOSwKPiA+PiAgICAgUEFUQ0gyMCwgUEFUQ0gyMSwgUEFUQ0gyMiwgUEFUQ0gyMywgYW5kIFBB
VENIMzIgb2YKPiA+PiAgICAgaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtYXJtLWtlcm5l
bC8yMDIyMTEyMTEzNTY1My4yMDg2MTEyMzNAbGludXRyb25peC5kZS8pCj4gPj4gIC0gVXBkYXRl
ZCBBUExJQyBNU0ktbW9kZSBkcml2ZXIgdG8gdXNlIHRoZSBuZXcgV0lSRURfVE9fTVNJIG1lY2hh
bmlzbS4KPiA+PiAgLSBVcGRhdGVkIElNU0lDIGRyaXZlciB0byBzdXBwb3J0IHBlci1kZXZpY2Ug
TVNJIGRvbWFpbnMgZm9yIFBDSSBhbmQKPiA+PiAgICBwbGF0Zm9ybSBkZXZpY2VzLgo+ID4KPiA+
IFRoYW5rcyBmb3Igd29ya2luZyBvbiB0aGlzLCBBbnVwISBJJ20gc3RpbGwgcmV2aWV3aW5nIHRo
ZSBwYXRjaGVzLgo+ID4KPiA+IEknbSBoaXR0aW5nIGEgYm9vdCBoYW5nIGluIHRleHQgcGF0Y2hp
bmcsIHdpdGggdGhpcyBzZXJpZXMgYXBwbGllZCBvbgo+ID4gNi44LXJjMi4gSVBJIGlzc3Vlcz8K
Pgo+IE5vdCB0ZXh0IHBhdGNoaW5nISBPbmUgY3B1IHNwaW5uaW5nIGluIHNtcF9jYWxsX2Z1bmN0
aW9uX21hbnlfY29uZCgpIGFuZAo+IHRoZSBvdGhlcnMgYXJlIGluIGNwdV9yZWxheCgpLiBTbWVs
bHMgbGlrZSBJUEkuLi4KCkNhbiB5b3Ugc2hhcmUgdGhlIGNvbXBsZXRlIGJvb3Rsb2cgPwoKUmVn
YXJkcywKQW51cAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
