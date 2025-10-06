Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6E88CCA471
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Oct 2025 07:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oaIk80p5PNewcjjrjYFh8Ih1YkBhU+a8jJ3mslWC4+E=; b=aAPLL+bMDmn5Sb
	fuGa1svfBcTsnVRUDTdMEe0wo/CD0K9XPGUvW0mguqihFsUPUrBIqEN6oqRBrxeGnSZXPKm3DVzFi
	H68qsKI+E35CquAkPb6fHEBYnSYVutdp1ss6pEpzqGYqP0BzByE5l0Ukz//Qc1Krjc4WG7hUxGcsO
	vF6xtLkiArXB/qO2b9UXlWIPCWrTxrkFz0Uu0luFikOjJLvkZfcXky9Xw3KtDqyURepZuJyQGIDFv
	qCYhfr0W8a1s95ZQQi/BIHixlH1cIbWw7hdqkyuCXYu23NqUD3YZh5TNY6JohQuODb0SQXPJZZLV/
	a7dujs/Bjevrz3FHSSUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5fkg-0000000H5v9-450d;
	Mon, 06 Oct 2025 07:35:22 +0000
Received: from mail-vk1-f176.google.com ([209.85.221.176])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5fkd-0000000H5uf-0YGB
	for linux-riscv@lists.infradead.org;
	Mon, 06 Oct 2025 07:35:21 +0000
Received: by mail-vk1-f176.google.com with SMTP id 71dfb90a1353d-54aa30f4093so1731134e0c.3
        for <linux-riscv@lists.infradead.org>; Mon, 06 Oct 2025 00:35:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759736117; x=1760340917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gi/dIonYfUmmwW2Vuh6lMeec+QtJMKdHIzm0Sdbs67c=;
        b=C4U9+Zkqiuve5lP9ECFFiY8UHgnCUHSNJO2q675c/bfTKUooUrnN8Trm/Aw0ssgu63
         Ql+I/Ci6QRl/JPA3YST7/8hG8H9ffEtR6otPRE9Y+vkY5hOl/McxLy70kB70tizzfGh7
         +85iIZBpvhH9l90Ktq2Lc39XfkPck2Pi1H2u2xofUjHLrHr/UKvaTn+GJv4FcrhYP9PN
         LL6Bv5+9/h7I5idp5vuw/OLZyqM6x7LeuXtXae+AUucYhC//+YZ/P3dznudybrhj3ktw
         k8zlGcGDvL8aW426VTmOityw1k09jWMA+FekJijLvPChlAWm8yF3a1kF3VH5uazYZv9F
         uOIQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+ke8Fw5tY2oP9JVCQHf0c2vagdyA/FiyUATvdyDqtj7LeTIm0v4KdGUg/6zqYpqJ861/CS6WWQTo4KQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxyPFbNpGQ/DvksBdlj1VYhDVbHPOLYsACGnf9ZkJI61t9305BF
	nug5c5NJltJ/0Frgrm9jdpk5tTQ9knfw2kHk5n6twYLukUvC8vVwG3NxKCCouCv7
X-Gm-Gg: ASbGnctb+ALmUjOeBlS+AQbNEFmHsF+c4IYrARB5UVryi1cY+wJToqEDqloybgM4VbJ
	ktqfSHJ54Fuc4+H58X3hG8/HlifBojjclls9rmE5HgSVfVSqFYWlFQDLkkIDKJTeF6KjK7gMKTY
	ShlwLrNfhzQ2cvcfGc6NXUGyYwttEr8akXW8/zaxyPxXKQDxKqAZexN41O3roJAUHoMyBBrqmN6
	ObKR8BwAQ2W7e3P7eULXbeZH0oJGULENh5E2H2l/B0l2d9PLvWljjwULFvJY7qCIrpRBLzhWZBg
	MWW6LsrZSkTq3fKk4ebQKSc0A/moeq8jh/tXXFmx2X3KsLXNQv7AsDiqA1aJYv48crAGux+T+/p
	0g1dkhpl+ZsgtQN/U0uixE1uNGsNnDHDcnM6hc7Tvj1vhlroxSglaXJkyd5G2BI407n5mOnMbow
	Mx38EmIO/0
X-Google-Smtp-Source: AGHT+IEZKF6M+eKMeUNwrQLWEnKKy6jtfLNMoWLtEDuQHVqasJv7dBvLzxN/ihD+5aOIDWeC+/xzZg==
X-Received: by 2002:a05:6122:3c4f:b0:530:7bd4:1761 with SMTP id 71dfb90a1353d-5524ea0edc3mr3575902e0c.11.1759736117013;
        Mon, 06 Oct 2025 00:35:17 -0700 (PDT)
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com. [209.85.217.50])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523cf3e877sm2832246e0c.16.2025.10.06.00.35.16
        for <linux-riscv@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Oct 2025 00:35:16 -0700 (PDT)
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-5ccccc1f7caso2556862137.1
        for <linux-riscv@lists.infradead.org>; Mon, 06 Oct 2025 00:35:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWmS77punOIZzJBcFwWOBAM/x+dlFdOaSZueSMFdCno6/osNy3mUrbF2S6hXZRYGFufB0vbVgl1PAIvXA==@lists.infradead.org
X-Received: by 2002:a05:6102:3e2a:b0:528:d2ad:1f54 with SMTP id
 ada2fe7eead31-5d41d0491aemr3884804137.8.1759736116168; Mon, 06 Oct 2025
 00:35:16 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1759485668.git.geert+renesas@glider.be> <98e13934d06116d5c116bd2b2187842ec3a8c11a.1759485668.git.geert+renesas@glider.be>
 <CAL_JsqJACXgfgLBn4bpz9uG2zEsoH+FX+8wHmTSj2rLVV59=hg@mail.gmail.com>
In-Reply-To: <CAL_JsqJACXgfgLBn4bpz9uG2zEsoH+FX+8wHmTSj2rLVV59=hg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 6 Oct 2025 09:35:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWBGzLmpNeYtSe7SW64X7EQ8chUxrjKQpfhBdz0tHTRdA@mail.gmail.com>
X-Gm-Features: AS18NWCQxcI8Hk_xi-9INpQRnbcE9GVTQoTyTKCepWEClduajoLppt0iBQuvTmQ
Message-ID: <CAMuHMdWBGzLmpNeYtSe7SW64X7EQ8chUxrjKQpfhBdz0tHTRdA@mail.gmail.com>
Subject: Re: [PATCH/RFC 1/2] of/irq: Ignore interrupt parent for nodes without interrupts
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel@sholland.org>, Marc Zyngier <maz@kernel.org>, 
	Saravana Kannan <saravanak@google.com>, Magnus Damm <magnus.damm@gmail.com>, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_003519_182208_E2014EBA 
X-CRM114-Status: GOOD (  21.93  )
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

SGkgUm9iLAoKT24gRnJpLCAzIE9jdCAyMDI1IGF0IDE1OjMzLCBSb2IgSGVycmluZyA8cm9iaEBr
ZXJuZWwub3JnPiB3cm90ZToKPiBPbiBGcmksIE9jdCAzLCAyMDI1IGF0IDU6MDjigK9BTSBHZWVy
dCBVeXR0ZXJob2V2ZW4KPiA8Z2VlcnQrcmVuZXNhc0BnbGlkZXIuYmU+IHdyb3RlOgo+ID4gVGhl
IERldmljZXRyZWUgU3BlY2lmaWNhdGlvbiBzdGF0ZXM6Cj4gPgo+ID4gICAgIFRoZSByb290IG9m
IHRoZSBpbnRlcnJ1cHQgdHJlZSBpcyBkZXRlcm1pbmVkIHdoZW4gdHJhdmVyc2FsIG9mIHRoZQo+
ID4gICAgIGludGVycnVwdCB0cmVlIHJlYWNoZXMgYW4gaW50ZXJydXB0IGNvbnRyb2xsZXIgbm9k
ZSB3aXRob3V0IGFuCj4gPiAgICAgaW50ZXJydXB0cyBwcm9wZXJ0eSBhbmQgdGh1cyBubyBleHBs
aWNpdCBpbnRlcnJ1cHQgcGFyZW50Lgo+ID4KPiA+IEhvd2V2ZXIsIG9mX2lycV9pbml0KCkgZ3Jh
dHVpdG91c2x5IGFzc3VtZXMgdGhhdCBhIG5vZGUgd2l0aG91dAo+ID4gaW50ZXJydXB0cyBoYXMg
YW4gYWN0dWFsIGludGVycnVwdCBwYXJlbnQgaWYgaXQgZmluZHMgYW4KPiA+IGludGVycnVwdC1w
YXJlbnQgcHJvcGVydHkgaGlnaGVyIHVwIGluIHRoZSBkZXZpY2UgdHJlZS4gIEhlbmNlIHdoZW4g
c3VjaAo+ID4gYSBwcm9wZXJ0eSBpcyBwcmVzZW50IChlLmcuIGluIHRoZSByb290IG5vZGUpLCB0
aGUgcm9vdCBpbnRlcnJ1cHQKPiA+IGNvbnRyb2xsZXIgbWF5IG5vdCBiZSBkZXRlY3RlZCBhcyBz
dWNoLCBjYXVzaW5nIGEgcGFuaWM6Cj4gPgo+ID4gICAgIE9GOiBvZl9pcnFfaW5pdDogY2hpbGRy
ZW4gcmVtYWluLCBidXQgbm8gcGFyZW50cwo+ID4gICAgIEtlcm5lbCBwYW5pYyAtIG5vdCBzeW5j
aW5nOiBObyBpbnRlcnJ1cHQgY29udHJvbGxlciBmb3VuZC4KPiA+Cj4gPiBDb21taXQgZTkxMDMz
NjIxZDU2ZTA1NSAoIm9mL2lycTogVXNlIGludGVycnVwdHMtZXh0ZW5kZWQgdG8gZmluZAo+ID4g
cGFyZW50IikgYWxyZWFkeSBmaXhlZCBhIGZpcnN0IHBhcnQsIGJ5IGNoZWNraW5nIGZvciB0aGUg
cHJlc2VuY2Ugb2YgYW4KPiA+IGludGVycnVwdHMtZXh0ZW5kZWQgcHJvcGVydHkuICBGaXggdGhl
IHNlY29uZCBwYXJ0IGJ5IG9ubHkgY2FsbGluZwo+ID4gb2ZfaXJxX2ZpbmRfcGFyZW50KCkgd2hl
biBhbiBpbnRlcnJ1cHRzIHByb3BlcnR5IGlzIHByZXNlbnQuCj4KPiBTZWVtcyByZWFzb25hYmxl
LiBXaHkgdGhlIFJGQyB0YWc/CgpQZXJoYXBzIHlvdSBtaWdodCBvYmplY3QgdG8gcHV0dGluZyBp
bnRlcnJ1cHQtcGFyZW50IGluIHRoZSByb290IG5vZGUKaWYgaXQgZG9lcyBub3QgcG9pbnQgdG8g
dGhlIHJvb3QgaW50ZXJydXB0IGNvbnRyb2xsZXIsIG9yIGlmIGl0IGRvZXMKbm90IGhlbHAgdG8g
c2ltcGxpZnkgaW50ZXJydXB0cy1leHRlbmRlZCB0byBpbnRlcnJ1cHRzIChsaWtlIGUuZy4gZm9y
CkFSTSBhcmNoIHRpbWVyKT8KClRoYW5rcyEKCkdye29ldGplLGVldGluZ31zLAoKICAgICAgICAg
ICAgICAgICAgICAgICAgR2VlcnQKCi0tIApHZWVydCBVeXR0ZXJob2V2ZW4gLS0gVGhlcmUncyBs
b3RzIG9mIExpbnV4IGJleW9uZCBpYTMyIC0tIGdlZXJ0QGxpbnV4LW02OGsub3JnCgpJbiBwZXJz
b25hbCBjb252ZXJzYXRpb25zIHdpdGggdGVjaG5pY2FsIHBlb3BsZSwgSSBjYWxsIG15c2VsZiBh
IGhhY2tlci4gQnV0CndoZW4gSSdtIHRhbGtpbmcgdG8gam91cm5hbGlzdHMgSSBqdXN0IHNheSAi
cHJvZ3JhbW1lciIgb3Igc29tZXRoaW5nIGxpa2UgdGhhdC4KICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAtLSBMaW51cyBUb3J2YWxkcwoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2
QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9saW51eC1yaXNjdgo=
