Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5D6DD65C69
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 15:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1vc+qUUu7L7p8Rbhei11sr80t/I4ZoTRcaE9zAzIx7I=; b=swwWNbt54UiloG
	JBKMvt+5drxk0iAr746osq8nKXWDfuZutvyKn8JCsy9wgOXymtqH6rC4m3L7qgfYXBEfa0AQRDtMc
	27ilLOMhpOMkymt0ZmWWaQ/cQB3cNg6xFOckW+beAZGv8kQGgrSnZHlUIX9/qY01CeszvlVenKrTn
	yv0Tg7Yx3XgCB46Vo3ogjkmJOY1K0qUgNRM/SykJb3NPhHxl33vvH1lYgr2b0JIqjWD+tRCD9xnsC
	SzbNVTAyTbVxp3GEaSZyLpuHMXt3/kSOcHjFbDMx9oDwtoPmY1g/jnYFsrZZW+Q2kND2QVd9Y9mmQ
	wCvJc8Nkggbuv7z3lSUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtQk-000000070KX-1hqz;
	Wed, 17 Dec 2025 15:27:10 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVtQg-000000070KA-3VhG
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 15:27:08 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-78c5adeb964so58335967b3.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Dec 2025 07:27:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765985225; x=1766590025; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RNKodKke7lh2l41JMs2fcoeFN1jkHTqvEjyt3XwZW5M=;
        b=Z1A6v5vF2rOv0JDHgH+JEv/LJsyOCbw/d42Up0GxmPhO7weSuEJ1RXckbbxgIj5Pjv
         jNDs9tkeQEZQIiwIF96z7sWlFOhNfWh+dvut92EgWrBe+kF/es9iEvRKQk4/l5vg3hOo
         17lHqsAg220E/Yk3cacFyOMT2HdUkG8yXarBMFhAx3f8Crj4Sj7a1BUXPl75WW375vX/
         RAtLQoO/JylN93HpceAL1wuHcYAWA6XghvS2kASWagAujkjGJtMnQ+UU/OLR8M/zM0fR
         IHryShaFtpp0qe8zpR7mwmGYJAOPElfPsdR/udOcsxlMWW6Q3j2S7xD29q2WuVaW4fgU
         KVow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765985225; x=1766590025;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RNKodKke7lh2l41JMs2fcoeFN1jkHTqvEjyt3XwZW5M=;
        b=jZAiGIpF1svBXqX25O4EsnIQ9+gDb0fgZTikXKTCnzKT3NR+2oqcGjCf4VX6jpYXQ2
         iYRzZDKi5In3bAujNJTEa6IPaOpUPCeaCXhhbMkQDdUV66HvYof/1JMhcJr/JJWlYtvK
         zV7hFx6SIyAHkWLGCTd8fFJjeNPTsQp3mXjZe2LgaX24XI1QylXYsIELwN03Uow/7zKm
         8IX/zsNfPWvhpcZLCiZhQ0n0KogBQ9wTUONjaiIJOaewqZSwHQ6pAlo+75CBaQIv6PE0
         RIylu+xoIDwzVBzBjLX1jmsrGebVAEy+dtzlWVez2Ml+9gth5nSVvVNo+bw1E4QA4sx4
         n6FA==
X-Forwarded-Encrypted: i=1; AJvYcCUhgCxqf6ZNuJBbDXIdJCLmH/dF2BvSMtReCmQE7XtjBLL/8WR8YRAN+sj+lUL0CeMuJoKeWEB0Dhf3LA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7vxKcQQ1KQi/QTQMtwZfoDXebCODHKe5QFpVikllEFBCahwrx
	DXsqjOOL37WpgnWWXk705/1hmv9W8pJLmKcDZRMc4WbOxzknQ7xlF3DrBa1jTth9f4avkEiaiQq
	4NBSdo7e15iCn0oo2q3aZP2xXzbKTy8Q=
X-Gm-Gg: AY/fxX6MkxYZaMA0XtsPxgZFcs+Hm1AETwCRc/08FLP+ISiO7MYUcFUvk2ODWhN+Yyu
	tclIFmf9YJ11eH0FX7UBZ7UG3bxOA4dqz7sTbevGji0mi06oNu0CgOIxq5R+Wi+dQpaQrsZz3h+
	vcgcaP3H0khP9U7KhUQ+N0uwMgqv/iiFJRMGlBkASeeiicdlRWOieQsWMLyLGe0pqT2mWc2qNEn
	j7tWxv1E6G7HNlUPjbp3BbFYnMAkXlPvuOkA0QKeiL/OHMz3vx2U+8SlFWEGszENXcdKNRi
X-Google-Smtp-Source: AGHT+IG1qLZDXm+BbPJwD/ot4K/atYhBwVHBxeCPgHs+R8IMbQWIZ38hfFkozr/72Efw3wsTzpB2276PHQEDBdN4bzw=
X-Received: by 2002:a05:690c:6703:b0:787:deea:1baf with SMTP id
 00721157ae682-78e66c4b68dmr140059147b3.52.1765985224734; Wed, 17 Dec 2025
 07:27:04 -0800 (PST)
MIME-Version: 1.0
References: <20251215-k1-boards-add-mmc-v1-0-d68dc87d4aab@rootcommit.com>
 <20251215-k1-boards-add-mmc-v1-1-d68dc87d4aab@rootcommit.com>
 <aUAF4iNjuP5AWJaf@pie> <4acfc5d8-d8d9-4c9b-99eb-09c7b82ddd04@rootcommit.com>
 <aUDwDkd8k_4gD1yc@pie> <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
In-Reply-To: <29600710-fc66-41d0-b399-1b635d0789d9@rootcommit.com>
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Wed, 17 Dec 2025 16:26:53 +0100
X-Gm-Features: AQt7F2oQky2L14pvEztOstAYmBbdHLfH6CJpRiGZdwfISfmvECAR9gGmu-12nk4
Message-ID: <CABdCQ=Orw0ULhPm43rAhS_iqqNYU4nChcPCqh8UdFhJUumVG5w@mail.gmail.com>
Subject: Re: [PATCH 1/2] riscv: dts: spacemit: Add i2c buses on OrangePi RV2
To: Michael Opdenacker <michael.opdenacker@rootcommit.com>
Cc: Yao Zi <me@ziyao.cc>, Yixun Lan <dlan@gentoo.org>, 
	Dan Carpenter <dan.carpenter@linaro.org>, Binbin Zhou <zhoubinbin@loongson.cn>, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_072706_910980_61662F50 
X-CRM114-Status: GOOD (  46.51  )
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

SGkgTWljaGFlbCwKCkJhc2VkIG9uIHRoZSBkaXNjdXNzaW9uIGFuZCBKYXZpZXIncyBmZWVkYmFj
aywgdG8gbWFrZSB0aGUgU0QgY2FyZAp3b3JrIHByb3Blcmx5LCB3ZSBuZWVkIHRvIHBhdGNoIHRo
ZSBkcml2ZXIgdG8gaW1wbGVtZW50IHRoZSBmb2xsb3dpbmc6CgpEZWZpbmUgYSBzZXBhcmF0ZSBj
b21wYXRpYmxlIHN0cmluZzogdGhlIGVNTUMgc2xvdCBoYXMgYSBQSFksIHdoaWxlClNEL1NESU8g
c2xvdHMgZG8gbm90LiBXZSBuZWVkIHRvIGRpZmZlcmVudGlhdGUgdGhlbSB0byBhcHBseSB0aGUK
Y29ycmVjdCByZXNldCBsb2dpYyAoc2tpcHBpbmcgUEhZIGluaXQgZm9yIFNEKS4KRXh0ZW5kIHRo
ZSBwaW5jdHJsIGRyaXZlcjogc3VwcG9ydCBpcyBuZWVkZWQgZm9yIHN3aXRjaGluZyB0aGUgU0QK
dm9sdGFnZSBwaW5zIGZyb20gMy4zViB0byAxLjhWLgpBZGQgdHVuaW5nIGxvZ2ljOiB0aGlzIGlz
IHJlcXVpcmVkIGF0IGxlYXN0IGZvciBTRFIgbW9kZXMuCgpJZiB5b3UgZG9uJ3QgbWluZCwgSSds
bCBzdGFydCB3b3JraW5nIG9uIHBvaW50ICMxLiBGZWVsIGZyZWUgdG8gY2hvb3NlCmFueSBvdGhl
ciB0YXNrLgoKSSdsbCBwb3N0IGEgcGF0Y2ggb25jZSBJIGhhdmUgaXQgd29ya2luZy4KCgpFbCBt
YXIsIDE2IGRpYyAyMDI1IGEgbGFzIDIyOjMwLCBNaWNoYWVsIE9wZGVuYWNrZXIKKDxtaWNoYWVs
Lm9wZGVuYWNrZXJAcm9vdGNvbW1pdC5jb20+KSBlc2NyaWJpw7M6Cj4KPiBIaSBZYW8KPgo+IFRo
YW5rcyBhIGxvdCBmb3IgeW91ciBoZWxwIGFuZCB0aXBzLCBtdWNoIGFwcHJlY2lhdGVkIQo+Cj4g
T24gMTIvMTYvMjUgMDY6MzcsIFlhbyBaaSB3cm90ZToKPiA+IE9uIE1vbiwgRGVjIDE1LCAyMDI1
IGF0IDAzOjAwOjUyUE0gKzAwMDAsIE1pY2hhZWwgT3BkZW5hY2tlciB3cm90ZToKPiA+PiBIaSBZ
YW8KPiA+Pgo+ID4+IFRoYW5rcyBmb3IgeW91ciBoZWxwZnVsIHF1ZXN0aW9ucyEKPiA+Pgo+ID4+
IE9uIDEyLzE1LzI1IDEzOjU4LCBZYW8gWmkgd3JvdGU6Cj4gPj4+IE9uIE1vbiwgRGVjIDE1LCAy
MDI1IGF0IDEwOjEwOjE0QU0gKzAwMDAsIE1pY2hhZWwgT3BkZW5hY2tlciB3cm90ZToKPiA+Pj4+
IFRoZSBPcmFuZ2VQaSBSVjIgYm9hcmQgZXhwb3NlcyBpMmMyIGFuZCBpMmM4IGJ1c2VzCj4gPj4+
PiBmcm9tIHRoZSBTcGFjZW1pdCBLMSBTb0MuCj4gPj4+Pgo+ID4+Pj4gVGhpcyBkZWNsYXJlcyBk
ZXZpY2VzIHByZXNlbnQgb24gc3VjaCBidXNlcywgaW4gcGFydGljdWxhcgo+ID4+Pj4gdGhlIGF0
MjQgZWVwcm9tIHRvIHN0b3JlIE1BQyBhZGRyZXNzZXMgYW5kIHRoZSByZWd1bGF0b3JzCj4gPj4+
PiBhdHRhY2hlZCB0byB0aGUgUE1JQyBvbiBpMmM4Lgo+ID4+PiBUaGlzIHNlcmllcyBpcyBuYW1l
ZCBhcyAiQXR0ZW1wdCB0byBlbmFibGUgTU1DIG9uIFNwYWNlbWlUIEsxIGJvYXJkcyIsCj4gPj4+
IHdoYXQncyB0aGUgcmVsYXRpb25zaGlwIGJldHdlZW4gTU1DIGFuZCBQTUlDL0kyQyBidXM/IFlv
dSBkaWRuJ3QgbWFrZQo+ID4+PiB1c2Ugb2YgYW55IHJlZ3VsYXRvcnMgaW4gdGhlIHNlY29uZCBw
YXRjaCwgZWl0aGVyICh3aGljaCBzZWVtcyB3cm9uZyB0bwo+ID4+PiBtZSkuCj4gPj4gSSBleHBl
Y3RlZCB0aGF0IGRlY2xhcmluZyB0aGUgcmVndWxhdG9ycyB1bmRlciB0aGUgUE1JQyBvbiBpMmM4
IHdhcyBlbm91Z2gKPiA+PiB0byBlbmFibGUgdGhlbSwgYnV0IEknbSBoYXBweSB0byBiZSBjb3Jy
ZWN0ZWQuCj4gPiBEZWNsYXJpbmcgdGhlbSBkb2Vzbid0IG1lYW4gZW5hYmxlIHRoZW0uIFJlZ3Vs
YXRvciBzdWJzeXN0ZW0gbWFpbnRhaW5zIGEKPiA+IGVuYWJsZSByZWZlcmVuY2UgY291bnQsIGFu
ZCB3aGVuIGl0IGRvd25jb3VudHMgdG8gemVybywgdGhlIHJlZ3VsYXRvcgo+ID4gZ2V0cyBkaXNh
YmxlZC4KPiA+Cj4gPiBJZiBubyBkcml2ZXIgYWNxdWlyZXMgb25lIHJlZ3VsYXRvciwgaXQgZ2V0
cyBkaXNhYmxlZCBhZnRlciAzMHMgc2luY2UKPiA+IHRoZSByZWd1bGF0b3Igc3Vic3lzdGVtIGlz
IGluaXRpYWxpemVkLCBzZWUgcmVndWxhdG9yX2luaXRfY29tcGxldGUoKQo+ID4gYW5kIHJlZ3Vs
YXRvcl9pbml0X2NvbXBsZXRlX3dvcmtfZnVuY3Rpb24uCj4gPgo+ID4gT24gQlBJIEYzLCBTRCBp
cyBzdXBwbGllZCBieSBidWNrNCBvZiB0aGUgUE1JQy4gSXQncyBtYXJrZWQgYXMKPiA+IHJlZ3Vs
YXRvci1hbHdheXMtb24sIHNvIHdvdWxkbid0IGJlIGRpc2FibGVkIGFuZCB0aGVuIGNhdXNlIGlz
c3VlcyBmb3IKPiA+IHRoZSBTRCBjYXJkLCBidXQgdGhpcyBkb2Vzbid0IG1lYW4gaXQncyBva2F5
IHRvIG9taXQgdGhlIGNvcnJlY3QKPiA+IHJlZ3VsYXRvciBzdXBwbGllciBvZiBTRC4KPgo+IEdv
b2QgdG8ga25vdyEKPiBTdXJwcmlzaW5nbHksIHdoZW4gSSBhZGQgdGhpcyB0byB0aGUgInNkaGNp
MCIgbm9kZToKPgo+IHZtbWMtc3VwcGx5ID0gPCZidWNrNF8zdjM+Owo+Cj4gKGFmdGVyIGNyZWF0
aW5nIHRoZSBsYWJlbCwgb2YgY291cnNlKSwgdGhlIGRldmljZSBhbmQgaXRzIHBhcnRpdGlvbiBu
bwo+IGxvbmdlciBzaG93IHVwIGluIC9wcm9jL3BhcnRpdGlvbnMhCj4KPiBJIHdhcyBob3BlZnVs
IGJlY2F1c2UgcmVhZC1vbmx5IG1vZGUgYWxyZWFkeSBzZWVtcyB0byB3b3JrLCBidXQgbWF5YmUK
PiBpbmRlZWQgdGhpbmdzIGFyZSBtb3JlIGNvbXBsaWNhdGVkLgo+ID4KPiA+Pj4gdm1tYy1zdXBw
bHkgc3BlY2lmaWVzIHRoZSBjYXJkJ3MgcG93ZXIgc3VwcGx5LiBBbmQgaWYgeW91IHdhbnQgdG8g
ZW5hYmxlCj4gPj4+IFNEUiBtb2RlcyB3aGljaCBtYW5kYXRlIDEuOHYgSU8gbGV2ZWwsIHZxbW1j
LXN1cHBseSBpcyBhbHNvIG5lY2Vzc2FyeQo+ID4+PiBmb3Igc3dpdGNoaW5nIGJldHdlZW4gMS44
diBhbmQgMy4zdi4KPiA+Pgo+ID4+IEkgd2FzIHRoaW5raW5nIHRvIGdldCBzdGFydGVkIHdpdGhv
dXQgdGhlIFNEUiBtb2RlcyBmaXJzdCwgdG8gbWFrZSBzdXJlCj4gPj4gYmFzaWMgb3BlcmF0aW9u
IHdvcmtzIGZpcnN0LiBXb3VsZCB0aGF0IHdvcms/Cj4gPiBZZXMuCj4gPgo+ID4gRllJLCBmb3Ig
U0RSMTA0IG1vZGUsIHlvdSBtYXkgbmVlZCB0byBpbXBsZW1lbnQgc29tZSB0dW5pbmcgbG9naWNb
MV0gYXMKPiA+IGluZGljYXRlZCBieSB2ZW5kb3IgZHJpdmVyLAo+ID4KPiA+ICAgICAgIC8qCj4g
PiAgICAgICAgKiBUdW5pbmcgaXMgcmVxdWlyZWQgZm9yIFNEUjUwL1NEUjEwNCwgSFMyMDAvSFM0
MDAgY2FyZHMgYW5kCj4gPiAgICAgICAgKiBpZiBjbG9jayBmcmVxdWVuY3kgaXMgZ3JlYXRlciB0
aGFuIDEwME1IeiBpbiB0aGVzZSBtb2Rlcy4KPiA+ICAgICAgICAqLwo+ID4KPiA+IFRob3VnaCBp
biBtYWlubGluZSB0aGUgZU1NQyBvbiBCUEktRjMgYWxyZWFkeSBtYWtlcyB1c2Ugb2YgSFM0MDAg
bW9kZQo+ID4gd2l0aG91dCB0dW5pbmcuIE5vIGlkZWEgd2hhdCBoYXBwZW5lZCBoZXJlLCBvciBp
dCBqdXN0IGhhcHBlbnMgdG8gd29yawo+ID4gd2VsbC4KPiA+Cj4gPiBBbHNvLCB0aGUgcGluIGNv
bnRyb2xsZXIgb24gSzEgU29DIHNlZW1zIHRvIGhhdmUgc29tZSB1bmRvY3VtZW50ZWQKPiA+IHJl
Z2lzdGVycyB0byBzZWxlY3QgdGhlIElPIHZvbHRhZ2Ugb2YgU0QgcGlucywgd2hpY2ggc2hvdWxk
IGJlIGFkanVzdGVkCj4gPiB3aGVuIHN3aXRjaGluZyBJTyB2b2x0YWdlWzJdLgo+ID4KPiA+IEkg
dGhpbmsgdGhlc2UgcGlucyBzaG91bGQgYmUgaW1wbGVtZW50ZWQgaW4gdGhlIHBpbmN0cmwgZHJp
dmVyLCB0aGVuIHlvdQo+ID4gY291bGQgY3JlYXRlIHR3byBwaW5jdHJsIHN0YXRlcywgb25lIGZv
ciAxLjh2IG9wZXJhdGlvbiwgb25lIGZvciAzLjN2LAo+ID4gYW5kIHN3aXRjaCBiZXR3ZWVuIHRo
ZW0gdGhyb3VnaCBwaW5jdHJsX2xvb2t1cF9zdGF0ZSgpIHdoZW4gY2hhbmdpbmcgSU8KPiA+IHZv
bHRhZ2UuCj4gPgo+ID4gVGhlIGxhc3QgdGhpbmcgdG8gbWVudGlvbiBpcyB0aGF0IHRoZSB0aHJl
ZSBNTUMgY29udHJvbGxlcnMgb24gSzEgYXJlbid0Cj4gPiBzYW1lLCBUaGUgb25lIHVzZWQgZm9y
IGVNTUMgaXMgdGhlIG9ubHkgb25lIHRoYXQgaGFzIGEgcGh5IChib3RoIFNEIGFuZAo+ID4gU0RJ
TyBjb250cm9sbGVycyBhcmUgbWFya2VkIGFzIFNESENJX1FVSVJLMl9CUk9LRU5fUEhZX01PRFVM
RVszXSksIHRodXMKPiA+IGhhdmUgZGlmZmVyZW50IHJlc2V0IGFuZCB0dW5pbmcgbG9naWNzLgo+
Cj4gV293LCB0aGF0J3Mgc3VycHJpc2luZy4KPiBodHRwczovL2RldmVsb3Blci5zcGFjZW1pdC5j
b20vZG9jdW1lbnRhdGlvbj90b2tlbj1XWk52d0ZEa1lpbll4MGs5anpQY01LNVduSWUjMTIuNS1z
ZCUyRmVtbWMKPiBkb2Vzbid0IHNlZW0gdG8gbWVudGlvbiB0aGlzICh0aG91Z2ggSSBkaWRuJ3Qg
Y2hlY2sgdmVyeSBjYXJlZnVsbHkgeWV0KS4KPiA+Cj4gPiBZb3UgcHJvYmFibHkgbmVlZCB0byBj
cmVhdGUgbmV3IGNvbXBhdGlibGVzIGZvciB0aGUgU0QgYW5kIFNESU8KPiA+IGNvbnRyb2xsZXJz
IGluc3RlYWQgb2YgcmUtdXNpbmcgc3BhY2VtaXQsazEtc2RoY2ksIGFuZCB3cml0ZSBjb3JyZWN0
Cj4gPiBzZGhjaV9zcGFjZW1pdF9yZXNldCgpIGZvciBjb250cm9sbGVycyB3aXRob3V0IHBoeS4g
VGhpcyBpcyBwcm9iYWJseQo+ID4gbmVjZXNzYXJ5IGV2ZW4gaWYgeW91IGRvbid0IGltcGxlbWVu
dCBTRFIgbW9kZXMuCj4gPgo+ID4+IFdvdWxkIHlvdSBoYXZlIGJvYXJkIGV4YW1wbGVzIHRvIHJl
Y29tbWVuZCwgd2l0aCBhbiBNTUMgY29udHJvbGxlciBvcGVyYXRpbmcKPiA+PiBpbiBhIHdheSBz
aW1pbGFyIHRvIHRoZSBvbmUgb24gU3BhY2VtaVQgSzE/Cj4gPiBBbGwgc2QvZW1tYyBjb250cm9s
bGVycyB3b3JrIHNpbWlsYXJseS4uLiB5b3UgbWF5IHdhbnQgdG8gdGFrZSBhIGxvb2sgYXQKPiA+
IG1tYy1jb250cm9sbGVyLWNvbW1vbi55YW1sIGZvciBjb21tb24gcHJvcGVydGllcy4KPgo+IFJp
Z2h0LCBJJ20gYWxyZWFkeSB1c2luZyBpdCA6KQo+Cj4gSSdsbCBiZSBwYXRpZW50IGFuZCB0cnkg
dG8gcHJvZ3Jlc3Mgc3RlcCBieSBzdGVwLiBNeSB0aW1lIGlzIHF1aXRlCj4gbGltaXRlZCB0aGVz
ZSBkYXlzLCBzbyBldmVyeW9uZSBpcyB3ZWxjb21lIHRvIHRyeSBhbmQgbWFrZSB0aGlzIHdvcmsu
Cj4gVGhhbmtzIGFnYWluIGZvciBldmVyeXRoaW5nCj4gQ2hlZXJzCj4gTWljaGFlbC4KPgo+IC0t
Cj4gTWljaGFlbCBPcGRlbmFja2VyCj4gUm9vdCBDb21taXQKPiBZb2N0byBQcm9qZWN0IGFuZCBP
cGVuRW1iZWRkZWQgVHJhaW5pbmcgY291cnNlIC0gTGVhcm4gYnkgZG9pbmc6Cj4gaHR0cHM6Ly9y
b290Y29tbWl0LmNvbS90cmFpbmluZy95b2N0by8KPgo+CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
