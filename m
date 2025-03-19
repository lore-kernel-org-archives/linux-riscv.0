Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D458FC282EC
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 01:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNyb7a6T2lmnH5GDe82qPtf1PtPw7Orw6wqxcm52qL8=; b=k51Do8eUM6k64R
	ufyj+JUCrNULhpwNS1GxOsRAoBsfChDhjSbqxr519oaPRL7UA0w5sGd0dBoXXLvFJ+yT5No5ase7M
	40wtOgF3B2XCOx/fUZhavoR1jPmiClw+ZieiulQIDac149rHxspHu5DZzaUvbGvfs9GwJAi/vxwSk
	w9Z6CYfUVOCxRQhgpKFryTCGbvt6lMhuxlDcSkpefotr6ESGnbs0jK7Vf/ttkQGGwX0+am+ImU4bd
	nLL6BB5eNG0aF7j3ZlVrVRnzUAQIXzHemda6wVLeP0WR9QEI8UXovknQGk6u6IjP78CHks5PcTEA+
	hRxT6IkYCjlQUt2Njq6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuiY4-00000007kg1-3Tny;
	Wed, 19 Mar 2025 01:48:48 +0000
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuiX5-00000007kb8-22h0
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 01:47:48 +0000
Received: by mail-yw1-x112f.google.com with SMTP id 00721157ae682-6f666c94285so61926427b3.3
        for <linux-riscv@lists.infradead.org>; Tue, 18 Mar 2025 18:47:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1742348866; x=1742953666; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xjBYrnzMT6u2Shqp71knl91rwXl6kp9pjl+GG5872ro=;
        b=K3s+8i7LC1GgGvx3OgrsxEwgL3LdRkab24NfFyoZ7FQvJagiOP+oajGR5F+6b/uI4m
         OwwVFEsssdwB7WiiThvkSOiCMPVG9dB+8FAUa9M4+z23fJBG6czYH/2c7X+txP+GEdUj
         oElrx76M3OiDE221t2Bs1T9no5jNLCWwULFcEzPrbePiJWcktNX0xWEPHmgg3JzS+Dxf
         4MEv3W3iBe/w6w+MSKQE2+xEOi9HFVQoyQj99l5d01oJXpLgtOC5bq8PAOZcsDmzVN1G
         eS6uZHs7AvgdWc6A0XJGwPCuwvuOf1u1KZtDrQ5v9DH4dD4Of1ocv+scUBVhFgTM2jmW
         OOIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742348866; x=1742953666;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xjBYrnzMT6u2Shqp71knl91rwXl6kp9pjl+GG5872ro=;
        b=eubyP1+WY8kQUClyuFQ8f7XIe/oHOiyW/OUmPykETNlS153VR7uspgvQMJ1eNtt5lL
         EYV2SN6ELQra1gL3/EiYISQmbIoklB+ARTE5K690loIorW9H7Sh8k9aHiCla4961dpjp
         nFu+3yz5PfzdyDYBuAatyzpRLuWIcpYZDWx9I3J28k8J+mFGl6h2WnO2Fc/ybu77LMAv
         8HhX4099nP7RrKmVzivcxlornXKZz6m6YZ3EYaoYdk26oExNKdUA1Csa/vsBnPn0V7P7
         v/GpT31eB+G1lEEVe/KnXJYnplcXp6qq9d+2+aqkuoFS3VaTJjHQLnnfPKBWxKuUP2QJ
         vOYQ==
X-Forwarded-Encrypted: i=1; AJvYcCUOdJ4tDmGLg+5bgn1NzGt+dpEJkdV80MW4PdbqEdrDz/xhPhj5rrMvfwD/pVRhhe07AYZln4ZPA8yhfA==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywgcdl0zFsHdBrZcVs4Q4bVVl+7wQkCZcBDtCfTXhjgrPsos/v8
	moUhnNt39DKcMZdiUYoWsUUovhm1XNdad27RQ4wjp+NMCmnMzc5+lZm1ze2Ys4CVG24n6+pLPCP
	8WmVgTNMhw0PqQ93TQ8dvlKr04ciNvySi3Gxb/Q==
X-Gm-Gg: ASbGncurXHUm3FKo0vZVzeqAs/e3fAv5HZ2r7jpPJbv0osG8zEpP20izkfM7TtyPyJ5
	jaI6qa8/M7GXTfV7fuTwNfF3xnMlb83B2wBpgsgWUi8NI1QIwi/pelRMzTZ7rw+0i4pgLfX9Pzs
	ln/6yGHtuhKfx3Y2x/HaLtCFwVZPZH
X-Google-Smtp-Source: AGHT+IGWCF+BsZ/+6UsxgbdDBRqGM9NmNJkWxhIQT78tDFkDEbwMVdUVCLBkMmylRkFJTEYP3KmBqGj7FQKPzC1N3+E=
X-Received: by 2002:a05:690c:7303:b0:6fe:bf9d:e6d6 with SMTP id
 00721157ae682-7009bda7656mr17510587b3.0.1742348865811; Tue, 18 Mar 2025
 18:47:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250314081255.3718-1-nick.hu@sifive.com> <20250314232518.GA2513550-robh@kernel.org>
 <CAKddAkCL1qKG7dRaVDAO0HCdsEiRR3NxOEka8aFONvkXnZ5j5A@mail.gmail.com> <CAL_JsqKQDQKq-WubM5VOBQh8BJ3ts1dNjKPoZofFu5W3zahgaA@mail.gmail.com>
In-Reply-To: <CAL_JsqKQDQKq-WubM5VOBQh8BJ3ts1dNjKPoZofFu5W3zahgaA@mail.gmail.com>
From: Nick Hu <nick.hu@sifive.com>
Date: Wed, 19 Mar 2025 09:47:34 +0800
X-Gm-Features: AQ5f1JqBVgw8oJHlIFIPO-sjkYoilbm7qLAYb80UUHciFdiVSpR2AH1QSYRf5ak
Message-ID: <CAKddAkAZwn6KJ24Ge3RmmWCp2xTX0HMQ7TGvMH262aQN9VQy8A@mail.gmail.com>
Subject: Re: [PATCH v2] dt-bindings: timer: Add SiFive CLINT2
To: Rob Herring <robh@kernel.org>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Anup Patel <anup@brainfault.org>, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_184747_538368_7BAAD435 
X-CRM114-Status: GOOD (  27.18  )
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

SGkgUm9iCgpPbiBXZWQsIE1hciAxOSwgMjAyNSBhdCAxMjowN+KAr0FNIFJvYiBIZXJyaW5nIDxy
b2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+Cj4gT24gU3VuLCBNYXIgMTYsIDIwMjUgYXQgOTozNuKA
r1BNIE5pY2sgSHUgPG5pY2suaHVAc2lmaXZlLmNvbT4gd3JvdGU6Cj4gPgo+ID4gSGkgUm9iCj4K
PiBQbGVhc2UgZG9uJ3QgdG9wIHBvc3QuCj4KPiA+IFNvcnJ5LCBJIHRob3VnaHQgSSBoYWQgcmVw
bGllZCB0byB0aGUgbWFpbGluZyBsaXN0LCBidXQgaXQgbG9va3MgbGlrZQo+ID4gSSBvbmx5IHNl
bnQgaXQgdG8gQ29ub3IuCj4gPgo+ID4gVGhlIGNvbnRyb2wgb2Ygc2lmaXZlLGNsaW50MiBkaWZm
ZXJzIGZyb20gdGhhdCBvZiBzaWZpdmUsY2xpbnQwLAo+ID4gbWFraW5nIHRoZW0gaW5jb21wYXRp
YmxlLgo+Cj4gVGhlIGFuc3dlciBiZWxvbmdzIGluIHRoZSBwYXRjaCwgbm90IGp1c3QgaW4gYSBy
ZXBseS4gQXNzdW1lIHdlJ3ZlCj4gZm9yZ290dGVuIGV2ZXJ5dGhpbmcgc2FpZCBpbiB0aGUgcHJp
b3IgdmVyc2lvbiBiZWNhdXNlIHdlIGxpa2VseSBoYXZlLAo+IHNvIHlvdSBkb24ndCB3YW50IHRv
IGdldCB0aGUgc2FtZSBxdWVzdGlvbnMgYWdhaW4uCj4KU3VyZSwgSSBjYW4gaW5jbHVkZSBhIGRl
c2NyaXB0aW9uIGluIHRoZSBwYXRjaC4gSSdsbCBtYWtlIHRoZSB1cGRhdGUKaW4gdGhlIG5leHQg
dmVyc2lvbi4KCj4gPgo+ID4gT24gU2F0LCBNYXIgMTUsIDIwMjUgYXQgNzoyNeKAr0FNIFJvYiBI
ZXJyaW5nIDxyb2JoQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBGcmksIE1hciAx
NCwgMjAyNSBhdCAwNDoxMjo1NFBNICswODAwLCBOaWNrIEh1IHdyb3RlOgo+ID4gPiA+IEFkZCBj
b21wYXRpYmxlIHN0cmluZyBhbmQgcHJvcGVydHkgZm9yIHRoZSBTaUZpdmUgQ0xJTlQgdjIuCj4g
PiA+Cj4gPiA+IENvbm9yIGFza2VkIGFib3V0IGJlaW5nIGJhY2t3YXJkcyBjb21wYXRpYmxlIHdp
dGggdjEuIFBsZWFzZSBzYXkgd2h5IGl0Cj4gPiA+IGlzbid0IGhlcmUuCj4gPiA+Cj4gPiA+ID4K
PiA+ID4gPiBTaWduZWQtb2ZmLWJ5OiBOaWNrIEh1IDxuaWNrLmh1QHNpZml2ZS5jb20+Cj4gPiA+
ID4gUmV2aWV3ZWQtYnk6IFNhbXVlbCBIb2xsYW5kIDxzYW11ZWwuaG9sbGFuZEBzaWZpdmUuY29t
Pgo+ID4gPiA+IC0tLQo+ID4gPiA+IC0gdjIgY2hhbmdlczoKPiA+ID4gPiAgIC0gRG9uJ3QgYWxs
b3cgc2lmaXZlLGNsaW50MiBieSBpdHNlbGYuIEFkZCAnLXt9JyB0byB0aGUgZmlyc3QgZW50cnkK
PiA+ID4gPiAgIC0gTWFyayB0aGUgc2lmaXZlLGZpbmUtY3RyLWJpdHMgYXMgdGhlIHJlcXVpcmVk
IHByb3BlcnR5IHdoZW4KPiA+ID4gPiAgICAgdGhlIGNvbXBhdGlibGUgaW5jbHVkZXMgdGhlIHNp
Zml2ZSxjbGludDIKPiA+ID4gPgo+ID4gPiA+ICAuLi4vYmluZGluZ3MvdGltZXIvc2lmaXZlLGNs
aW50LnlhbWwgICAgICAgICAgfCAyMCArKysrKysrKysrKysrKysrKysrCj4gPiA+ID4gIDEgZmls
ZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspCj4gPiA+ID4KPiA+ID4gPiBkaWZmIC0tZ2l0IGEv
RG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55YW1s
IGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxjbGludC55
YW1sCj4gPiA+ID4gaW5kZXggNzZkODNhZWE0ZTJiLi40YjlkYWQxMWMxZTkgMTAwNjQ0Cj4gPiA+
ID4gLS0tIGEvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3RpbWVyL3NpZml2ZSxj
bGludC55YW1sCj4gPiA+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdz
L3RpbWVyL3NpZml2ZSxjbGludC55YW1sCj4gPiA+ID4gQEAgLTM2LDYgKzM2LDEwIEBAIHByb3Bl
cnRpZXM6Cj4gPiA+ID4gICAgICAgICAgICAgICAgLSBzdGFyZml2ZSxqaDcxMTAtY2xpbnQgICAj
IFN0YXJGaXZlIEpINzExMAo+ID4gPiA+ICAgICAgICAgICAgICAgIC0gc3RhcmZpdmUsamg4MTAw
LWNsaW50ICAgIyBTdGFyRml2ZSBKSDgxMDAKPiA+ID4gPiAgICAgICAgICAgIC0gY29uc3Q6IHNp
Zml2ZSxjbGludDAgICAgICAgICMgU2lGaXZlIENMSU5UIHYwIElQIGJsb2NrCj4gPiA+ID4gKyAg
ICAgIC0gaXRlbXM6Cj4gPiA+ID4gKyAgICAgICAgICAtIHt9Cj4gPiA+ID4gKyAgICAgICAgICAt
IGNvbnN0OiBzaWZpdmUsY2xpbnQyICAgICAgICAjIFNpRml2ZSBDTElOVCB2MiBJUCBibG9jawo+
ID4gPiA+ICsgICAgICAgIGRlc2NyaXB0aW9uOiBTaUZpdmUgQ0xJTlQgdjIgaXMgdGhlIEhSVCB0
aGF0IHN1cHBvcnRzIHRoZSBaaWNudHIKPiA+ID4gPiAgICAgICAgLSBpdGVtczoKPiA+ID4gPiAg
ICAgICAgICAgIC0gZW51bToKPiA+ID4gPiAgICAgICAgICAgICAgICAtIGFsbHdpbm5lcixzdW4y
MGktZDEtY2xpbnQKPiA+ID4gPiBAQCAtNjIsNiArNjYsMjIgQEAgcHJvcGVydGllczoKPiA+ID4g
PiAgICAgIG1pbkl0ZW1zOiAxCj4gPiA+ID4gICAgICBtYXhJdGVtczogNDA5NQo+ID4gPiA+Cj4g
PiA+ID4gKyAgc2lmaXZlLGZpbmUtY3RyLWJpdHM6Cj4gPiA+ID4gKyAgICBtYXhpbXVtOiAxNQo+
ID4gPiA+ICsgICAgZGVzY3JpcHRpb246IFRoZSB3aWR0aCBpbiBiaXRzIG9mIHRoZSBmaW5lIGNv
dW50ZXIuCj4gPiA+ID4gKwo+ID4gPiA+ICtpZjoKPiA+ID4gPiArICBwcm9wZXJ0aWVzOgo+ID4g
PiA+ICsgICAgY29tcGF0aWJsZToKPiA+ID4gPiArICAgICAgY29udGFpbnM6Cj4gPiA+ID4gKyAg
ICAgICAgY29uc3Q6IHNpZml2ZSxjbGludDIKPiA+ID4gPiArdGhlbjoKPiA+ID4gPiArICByZXF1
aXJlZDoKPiA+ID4gPiArICAgIC0gc2lmaXZlLGZpbmUtY3RyLWJpdHMKPiA+ID4gPiArZWxzZToK
PiA+ID4gPiArICBwcm9wZXJ0aWVzOgo+ID4gPiA+ICsgICAgc2lmaXZlLGZpbmUtY3RyLWJpdHM6
IGZhbHNlCj4gPiA+ID4gKwo+ID4gPiA+ICBhZGRpdGlvbmFsUHJvcGVydGllczogZmFsc2UKPiA+
ID4gPgo+ID4gPiA+ICByZXF1aXJlZDoKPiA+ID4gPiAtLQo+ID4gPiA+IDIuMTcuMQo+ID4gPiA+
Cj4gPgo+ID4gQmVzdCBSZWdhcmRzLAo+ID4gTmljawo+ID4KCkJlc3QgUmVnYXJkcywKTmljawoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
