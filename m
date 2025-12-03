Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CB3ED12691
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IMfiUbT9lnzgtlQGHIiIyhH7eg4x5MUQs69D9n89Hkg=; b=CPjNnmke9NjFVP
	EUvXpymIVmATDs6rSUMGXJWKRV8RCk+//36TrMkvsf/f2b/Ut3dEipqgj6SLT+aroJsz+3q1f6qLw
	tIDLHKZAKBO3qNbb8oLN60/b+oxRROE0jBI0Od4uMqXRlxyOhPlksp+yt1PIS+VTgBJslddREmlqG
	ZICzKRGctevwlEwxymB6z3m5grnGBYuFGtoaHkP7lVLFHse61Yq17M7Gj1PkNq+zPw5X5642nwkoB
	8PBIh46Xkf5/IyQ6kVxdt0utPT+ZdgZkSbJdEKwCaihfJMqPBcJWkMTRxNjQbryVqXub6uZdT3LqT
	WXv2N5Dqpa8DovEPOtyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjcl-00000006QlM-3UyS;
	Wed, 03 Dec 2025 09:58:15 +0000
Received: from mail-ua1-f46.google.com ([209.85.222.46])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQjcj-00000006Qkm-19Si
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:58:14 +0000
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-93539c5e2b5so472071241.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 01:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764755892; x=1765360692;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wEiUmc2Mo7T6/EfgHh7KJK7Yklp38OsDecqZ5en7MfQ=;
        b=rIEt/6LuAjjvLfdAgd/DLAi9qBy33/rByPTb9dB0B57uslT6VlMH7Z59x/OgezQWas
         tqjVSCoyjgldnEPlzJtyuubdQiPTWdys19riLf7fH0I8VAHa+IH5EPfm0gCOE+Qr78os
         MlD66HoimDpDisUDKEvRolf6ElTs6zQhA0lG3T/cTItwbyxjouGbKmlQM0JPldkt9kDV
         6FUEenHZ7OsINjAsW/ygk5o5Zz1AltlBOAzZWvNkOId8w7gRN3blRRyus9GXWe4lHm8K
         dnH05XOGtqKICwCMzuTi9Ls7aPB37yAHzyFEuCwxt42rPYjPHBraBKJfpW2/7kkPPD3D
         RTzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnAus9Uf/deIH1PmM9jLIFDQtgHy40ChfK4I6w/qsIeZzOOYuAt+IyazmW7PR26lyq5TeY0gqNOlE/nQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwWNpYmewOxlZ53o0J3LxMz2zRF/qGpN18WQdlNz7eYpGt7QHVo
	vkN9zUC15fd8X5M/Z/hz6yZ5KnOtPbrTSxCXeFea53xcIg3oOSDj5DMNbDxssBHw
X-Gm-Gg: ASbGncth7Yjz+WCssgDyXM3mHDYD+t07+ju3VzExlZMBA0gPyy304T2ZmPTDsaGLpN5
	jCiPdWNFrxOCWzGdmP7I/QGHA8J7jpGNAIAJFu65tcNacY+AVQCUAUN4Q26SzTGX93FH3CLozkT
	Duiuq1l+ZQ0G2GNAqD/ECr8EBi0g7tf7+5ZbMd7Eh9T7/Ju50oagTADY5Jb98nr55u90bqrtnS5
	utljY5T0W6y7PFIEF77Q0jv3cSHoDmi6anNstUZBPwtqRZliuqGVXr+mv7b6x/DYsXTyH2oAGPu
	TiOPXZzV3k0atp68tbXWxhhG5dQQ5mwAiMVeP0hsj9GhSutM7dgCXQHrz6i0zZ7sCZAXA9nbbcc
	Ia144yhpIlDNMc4xTpSeqwDzSOQys9L+30jehAtB9yDbisPx+INcasqm1UeoXc3juib/mmoMHtH
	CoHYmuinepwUvPqzbrQlMZqNv25ef/h73O7ziqNwCzfRDd3Kra76SF
X-Google-Smtp-Source: AGHT+IHdb8jG8GWoEpozxEjJxXjLoCpYho0K9p8c+ui9cqoyHf7a/RagJS0aJvWkWzqbxv4XHVk5rQ==
X-Received: by 2002:a05:6102:3e96:b0:5dd:c484:957a with SMTP id ada2fe7eead31-5e40c823dd1mr3167054137.21.1764755891686;
        Wed, 03 Dec 2025 01:58:11 -0800 (PST)
Received: from mail-vk1-f172.google.com (mail-vk1-f172.google.com. [209.85.221.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-93cd75f3948sm7556095241.9.2025.12.03.01.58.10
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 03 Dec 2025 01:58:10 -0800 (PST)
Received: by mail-vk1-f172.google.com with SMTP id 71dfb90a1353d-55b0d4b560aso524293e0c.0
        for <linux-riscv@lists.infradead.org>; Wed, 03 Dec 2025 01:58:10 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWi4HF8CJ1MRVXoa6539YR2mIitz9swtQ5DGwvKcPtPP4/EPmwLX7hv9LOJXpYxw1inJh3pGPigLdDj2Q==@lists.infradead.org
X-Received: by 2002:a05:6102:a49:b0:5d4:1499:99a4 with SMTP id
 ada2fe7eead31-5e40c7f3573mr2813640137.13.1764755889796; Wed, 03 Dec 2025
 01:58:09 -0800 (PST)
MIME-Version: 1.0
References: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
 <dyaqe3ssrn65r5xndlwe7tlbiw2lbwvu3q3lzusfgr5mgycp6h@gfzyxk7uyva7>
 <CAL_JsqJ4q2=UJbuhfbvsbr2T+SRGXsPSXCLk6iXZid_qwYrN4g@mail.gmail.com>
 <bgieskezxsscyg65ihbzq45opwfjavcfut7bz7ywsvufeeaoqe@47hx5fvmsi22>
 <CAL_JsqJ9YUe6cy0YEMLvQhGTGmog6onTA9W5owQBP4q1viijug@mail.gmail.com> <5rzkayfk4o37v3xakexmjtkahb4wey2lsaiw2l3qobva5ajhr2@u3lrgkdjgk3x>
In-Reply-To: <5rzkayfk4o37v3xakexmjtkahb4wey2lsaiw2l3qobva5ajhr2@u3lrgkdjgk3x>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 3 Dec 2025 10:57:58 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWumcKQaU0hym7xdOzwYZWzhNRtH9RU45ZsLtShkkO53A@mail.gmail.com>
X-Gm-Features: AWmQ_blCEK01_Lczu_uMObyo4dsIf5LXvG5VyIcPEzsBrrm0vi_AIT5ljCOk_wo
Message-ID: <CAMuHMdWumcKQaU0hym7xdOzwYZWzhNRtH9RU45ZsLtShkkO53A@mail.gmail.com>
Subject: Re: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Ioana Ciornei <ioana.ciornei@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Saravana Kannan <saravanak@google.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Magnus Damm <magnus.damm@gmail.com>, devicetree@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_015813_324991_E326D548 
X-CRM114-Status: GOOD (  40.52  )
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

SGkgSW9uYW5hLAoKT24gV2VkLCAzIERlYyAyMDI1IGF0IDEwOjQ4LCBJb2FuYSBDaW9ybmVpIDxp
b2FuYS5jaW9ybmVpQG54cC5jb20+IHdyb3RlOgo+IE9uIFR1ZSwgRGVjIDAyLCAyMDI1IGF0IDAz
OjE5OjE3UE0gLTA2MDAsIFJvYiBIZXJyaW5nIHdyb3RlOgo+ID4gT24gVHVlLCBEZWMgMiwgMjAy
NSBhdCAxMDozNuKAr0FNIElvYW5hIENpb3JuZWkgPGlvYW5hLmNpb3JuZWlAbnhwLmNvbT4gd3Jv
dGU6Cj4gPiA+IE9uIE1vbiwgRGVjIDAxLCAyMDI1IGF0IDA2OjA5OjE5QU0gLTA2MDAsIFJvYiBI
ZXJyaW5nIHdyb3RlOgo+ID4gPiA+IE9uIEZyaSwgTm92IDI4LCAyMDI1IGF0IDEwOjQz4oCvQU0g
SW9hbmEgQ2lvcm5laSA8aW9hbmEuY2lvcm5laUBueHAuY29tPiB3cm90ZToKPiA+ID4gPiA+IE9u
IEZyaSwgTm92IDE0LCAyMDI1IGF0IDExOjQ3OjU0QU0gKzAxMDAsIEdlZXJ0IFV5dHRlcmhvZXZl
biB3cm90ZToKPiA+ID4gPiA+ID4gVGhlIERldmljZXRyZWUgU3BlY2lmaWNhdGlvbiBzdGF0ZXM6
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+ICAgICBUaGUgcm9vdCBvZiB0aGUgaW50ZXJydXB0IHRy
ZWUgaXMgZGV0ZXJtaW5lZCB3aGVuIHRyYXZlcnNhbCBvZiB0aGUKPiA+ID4gPiA+ID4gICAgIGlu
dGVycnVwdCB0cmVlIHJlYWNoZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgbm9kZSB3aXRob3V0
IGFuCj4gPiA+ID4gPiA+ICAgICBpbnRlcnJ1cHRzIHByb3BlcnR5IGFuZCB0aHVzIG5vIGV4cGxp
Y2l0IGludGVycnVwdCBwYXJlbnQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IEhvd2V2ZXIsIG9m
X2lycV9pbml0KCkgZ3JhdHVpdG91c2x5IGFzc3VtZXMgdGhhdCBhIG5vZGUgd2l0aG91dAo+ID4g
PiA+ID4gPiBpbnRlcnJ1cHRzIGhhcyBhbiBhY3R1YWwgaW50ZXJydXB0IHBhcmVudCBpZiBpdCBm
aW5kcyBhbgo+ID4gPiA+ID4gPiBpbnRlcnJ1cHQtcGFyZW50IHByb3BlcnR5IGhpZ2hlciB1cCBp
biB0aGUgZGV2aWNlIHRyZWUuICBIZW5jZSB3aGVuIHN1Y2gKPiA+ID4gPiA+ID4gYSBwcm9wZXJ0
eSBpcyBwcmVzZW50IChlLmcuIGluIHRoZSByb290IG5vZGUpLCB0aGUgcm9vdCBpbnRlcnJ1cHQK
PiA+ID4gPiA+ID4gY29udHJvbGxlciBtYXkgbm90IGJlIGRldGVjdGVkIGFzIHN1Y2gsIGNhdXNp
bmcgYSBwYW5pYzoKPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gICAgIE9GOiBvZl9pcnFfaW5pdDog
Y2hpbGRyZW4gcmVtYWluLCBidXQgbm8gcGFyZW50cwo+ID4gPiA+ID4gPiAgICAgS2VybmVsIHBh
bmljIC0gbm90IHN5bmNpbmc6IE5vIGludGVycnVwdCBjb250cm9sbGVyIGZvdW5kLgo+ID4gPiA+
ID4gPgo+ID4gPiA+ID4gPiBDb21taXQgZTkxMDMzNjIxZDU2ZTA1NSAoIm9mL2lycTogVXNlIGlu
dGVycnVwdHMtZXh0ZW5kZWQgdG8gZmluZAo+ID4gPiA+ID4gPiBwYXJlbnQiKSBhbHJlYWR5IGZp
eGVkIGEgZmlyc3QgcGFydCwgYnkgY2hlY2tpbmcgZm9yIHRoZSBwcmVzZW5jZSBvZiBhbgo+ID4g
PiA+ID4gPiBpbnRlcnJ1cHRzLWV4dGVuZGVkIHByb3BlcnR5LiAgRml4IHRoZSBzZWNvbmQgcGFy
dCBieSBvbmx5IGNhbGxpbmcKPiA+ID4gPiA+ID4gb2ZfaXJxX2ZpbmRfcGFyZW50KCkgd2hlbiBh
biBpbnRlcnJ1cHRzIHByb3BlcnR5IGlzIHByZXNlbnQuCj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+
IFNpZ25lZC1vZmYtYnk6IEdlZXJ0IFV5dHRlcmhvZXZlbiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIu
YmU+Cgo+ID4gPiA+ID4gVGhpcyBjaGFuZ2UgaXJxLWxzLWV4dGlycSBhbmQgY29tbWl0IDZiYTUx
YjdiMzRjYSAoIm9mL2lycTogSGFuZGxlCj4gPiA+ID4gPiBleHBsaWNpdCBpbnRlcnJ1cHQgcGFy
ZW50IikgZG9lcyBub3QgaGVscCB3aXRoIHRoZSBpc3N1ZS4KCj4gPiA+IEkganVzdCB0cmllZCBj
b252ZXJ0aW5nIGxzLWV4dGlycSB0byBhIHByb3BlciBwbGF0Zm9ybSBkcml2ZXIgYW5kIGl0J3MK
PiA+ID4gcHJldHR5IHN0cmFpZ2h0Zm9yd2FyZC4gVGhlIHByb2JsZW0gaXMgZ2V0dGluZyB0aGF0
IGRyaXZlciB0byBwcm9iZSBvbgo+ID4gPiB0aGUgbHMtZXh0aXJxIGR0IG5vZGUgc2luY2Ugb2Zf
cGxhdGZvcm1fcG9wdWxhdGUoKSBpcyBub3QgY2FsbGVkIG9uIGl0cwo+ID4gPiBwYXJlbnQgbm9k
ZS4KPiA+ID4KPiA+ID4gSSB3b3VsZCBhdm9pZCBjaGFuZ2luZyB0aGUgRFQgYW5kIGFkZGluZyBh
ICJzaW1wbGUtYnVzIiBjb21wYXRpYmxlIHRvCj4gPiA+IHRoZSBwYXJlbnQgbm9kZXMuIFRoZSBv
dGhlciBvcHRpb24gaXMgdG8gYWRkIGFub3RoZXIgc2ltcGxlIGRyaXZlciB3aGljaAo+ID4gPiBq
dXN0IGNhbGxzIG9mX3BsYXRmb3JtX3BvcHVsYXRlKCkgZm9yIGFsbCBjb21wYXRpYmxlIHN0cmlu
Z3MgZGVmaW5lZCBpbgo+ID4gPiBmc2wsbGF5ZXJzY2FwZS1zY2ZnLnlhbWwuCj4gPgo+ID4gVGhl
IHNpbXBsZXN0IHNvbHV0aW9uIG1pZ2h0IGJlIGFkZGluZyAnc3lzY29uJyB0byB0aGUgZGVmYXVs
dCBtYXRjaAo+ID4gbGlzdCBmb3Igb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKS4gVGhhdCdzIGtpbmQg
b2YgYSBiaWcgaGFtbWVyIHRob3VnaAo+ID4gYW5kIGNvdWxkIGJyZWFrIHNvbWV0aGluZy4gTm90
IHN1cmUsIGJ1dCBJJ20gd2lsbGluZyB0byBzdGljayB0aGF0IGluCj4gPiBsaW51eC1uZXh0IGFu
ZCBzZWUuCj4gPgo+ID4gQW5vdGhlciBvcHRpb24gaXMgaGlqYWNrIHRoZSBzaW1wbGUtcG0tYnVz
IGRyaXZlciB3aGljaCBhbHJlYWR5IGRvZXMKPiA+IGp1c3Qgd2hhdCB5b3Ugc2FpZC4KPgo+IEkg
d291bGQgcHJlZmVyIHRoZSBzZWNvbmQgb3B0aW9uIHNpbmNlIHRoYXQgZG9lc24ndCBpbXBhY3Qg
b3RoZXIKPiBwbGF0Zm9ybXMuCj4KPiBHZWVydCwgc2luY2UgeW91IGFyZSB0aGUgbW9kdWxlIGF1
dGhvciwgYXJlIHlvdSBvayB3aXRoIHRoZSBmb2xsb3dpbmcKPiBkaWZmPwo+Cj4gLS0tIGEvZHJp
dmVycy9idXMvc2ltcGxlLXBtLWJ1cy5jCj4gKysrIGIvZHJpdmVycy9idXMvc2ltcGxlLXBtLWJ1
cy5jCj4gQEAgLTE0Miw2ICsxNDIsMTIgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBvZl9kZXZpY2Vf
aWQgc2ltcGxlX3BtX2J1c19vZl9tYXRjaFtdID0gewo+ICAgICAgICAgeyAuY29tcGF0aWJsZSA9
ICJzaW1wbGUtbWZkIiwgICAuZGF0YSA9IE9OTFlfQlVTIH0sCj4gICAgICAgICB7IC5jb21wYXRp
YmxlID0gImlzYSIsICAgICAgICAgIC5kYXRhID0gT05MWV9CVVMgfSwKPiAgICAgICAgIHsgLmNv
bXBhdGlibGUgPSAiYXJtLGFtYmEtYnVzIiwgLmRhdGEgPSBPTkxZX0JVUyB9LAo+ICsgICAgICAg
eyAuY29tcGF0aWJsZSA9ICJmc2wsbHMxMDIxYS1zY2ZnIiwgfSwKPiArICAgICAgIHsgLmNvbXBh
dGlibGUgPSAiZnNsLGxzMTA0M2Etc2NmZyIsIH0sCj4gKyAgICAgICB7IC5jb21wYXRpYmxlID0g
ImZzbCxsczEwNDZhLXNjZmciLCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMx
MDg4YS1pc2MiLCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2wsbHMyMDgwYS1pc2Mi
LCB9LAo+ICsgICAgICAgeyAuY29tcGF0aWJsZSA9ICJmc2wsbHgyMTYwYS1pc2MiLCB9LAo+ICAg
ICAgICAgeyAvKiBzZW50aW5lbCAqLyB9Cj4gIH07Cj4gIE1PRFVMRV9ERVZJQ0VfVEFCTEUob2Ys
IHNpbXBsZV9wbV9idXNfb2ZfbWF0Y2gpOwoKRmluZSBmb3IgbWUuCgpBbHRlcm5hdGl2ZWx5LCB0
aGVzZSBjb3VsZCBiZSBhZGRlZCB0byB0aGUgbWF0Y2hfdGFibGVbXSBpbgpkcml2ZXJzL29mL3Bs
YXRmb3JtLmM6b2ZfcGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZSgpPwoKR3J7b2V0amUsZWV0aW5n
fXMsCgogICAgICAgICAgICAgICAgICAgICAgICBHZWVydAoKLS0gCkdlZXJ0IFV5dHRlcmhvZXZl
biAtLSBUaGVyZSdzIGxvdHMgb2YgTGludXggYmV5b25kIGlhMzIgLS0gZ2VlcnRAbGludXgtbTY4
ay5vcmcKCkluIHBlcnNvbmFsIGNvbnZlcnNhdGlvbnMgd2l0aCB0ZWNobmljYWwgcGVvcGxlLCBJ
IGNhbGwgbXlzZWxmIGEgaGFja2VyLiBCdXQKd2hlbiBJJ20gdGFsa2luZyB0byBqb3VybmFsaXN0
cyBJIGp1c3Qgc2F5ICJwcm9ncmFtbWVyIiBvciBzb21ldGhpbmcgbGlrZSB0aGF0LgogICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgIC0tIExpbnVzIFRvcnZhbGRzCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
