Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B91D6406D
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Dec 2025 03:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rw7AjdL6H0pC9pmvv1GipRla6on7t+UfmuTFRU72zzk=; b=ejJMIYhNgf2rBw
	c7iuGtCnmsW1zhAc7V2/IDk8Bb1lTFniHlrcNSZneuoy26pypUBor+hj6Z+w1e115SbnaUutAi37r
	qsTaEYA0I1fn5whTr0INGl19iJbi6DXu3s7/TtTo9zWzrAYOodfTXxYKk7QAvtvTf+Bf00g1KphYz
	m3GlHqU18IFFtXzcGky1bxDz8JUGbNwGVHnYA8LDTqg3RdvLrzlA3ZGeaYjLsnp9yVOTmd+3yigpe
	Dk/+2IGhg8VioQYmroN4atqVGDhlFU9zrR1tBFLoptW9JtHeyeMsTKn9Lwcwb70SL1WRstkGZ6MPB
	eAQWtfP2lF6KwOIYpyLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vViNE-000000067SX-0Az9;
	Wed, 17 Dec 2025 03:38:48 +0000
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vViN7-000000067S8-2G4t
	for linux-riscv@lists.infradead.org;
	Wed, 17 Dec 2025 03:38:44 +0000
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-78d6dc596eeso44000057b3.0
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 19:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765942720; x=1766547520; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7TH6F5a+vmttqLO62jmTQVj+LKt91ZrffUns0UWLXns=;
        b=Kg0CFL+/Ugna+KcRX311Bt1VQjwsPo354iRrs/ufhqHix4KliVTlu4Uume1jLDK1sP
         G3mtN52HKpUOZdU29P0fDo+pG+hkGZO04NKQckw0Fk8pdN1uUO58Ms6ya4pj1PTZuugo
         nVi+60OE6u2S+dPwNA/kjWgXMlyCiHK3Jb/EDPGpBcC5YkQEv99Y7xq4Hqt+xSKctZ63
         Qx6+o7N5ms+Ip2sEXYFuC0FH7JC6bv46vJ/80AbAgAnvgS/uQlOqrFWDiymrQbcPnytx
         TwKDQaZ6z4j5tTt02NO+PvaICGXr/rJnymhwgO2DWuHfxEfCcCBNnEod0IH1vqN/GUmr
         cTPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765942720; x=1766547520;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7TH6F5a+vmttqLO62jmTQVj+LKt91ZrffUns0UWLXns=;
        b=BjF68o0blbtZrjRK4ZGil+/ffXPXtpyUL097/+en3zeaePDP67JYxrgigFWjG8qZAt
         nz26UVgPh/wWsvvw9hSVkHR/EIReOtaVPjegL/4e0oJfA5cNZSBrqZjHJ2AKNDqrLBa3
         LUI5I7j8KOgSQjp4SnhyqvuwY8Qt6x0OJcoiFmtguXQFa02k7VEacEFg6YYKn6n5UWOP
         4bhCgu2ea4q7wVRbFkYrlnS/FPBS3Z45awZlkw3+atGqUAbGWQL8OS5svRRnYN4wbBff
         s8zPKVAv4IHLxcDylXlt/0Yw/CIcEelr3tHBLXhRrDAblp+vIGXCiuwwcOI3UxARodTn
         d91w==
X-Forwarded-Encrypted: i=1; AJvYcCWkQo5pdBa69SzafG4SlSxEhjYC4NO7P6YMC6IM6JTifOFduwQa/28HttXhTkssvovWJVKSI6Knlq+AzA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw/A51ne7fEGCxRkJv8WRVoReN5k3OAtBEj6IPxC6dfwrkAuPYz
	U37ueMKl/2N5LQnHGYUwoxSmUhTjdttZeKO5leYxzoDrrC/5M/x9FUlocZhMr9krds5DIININSf
	hefyV/Iu0z8zy9O3Mb4KiKzKcs/x+hZPLrXxqMRPKd/pIPmnAvzMQMkvjfQ==
X-Gm-Gg: AY/fxX5Kr3IaSoUBxgqlSYapdvm3s50lyMqM+g4vOQT6g/bJWA/TNY44Irfd3MxR3eI
	bKdnPbdyMd0LMnkYoC1pnUHa0ArSPR++RYrGIT6HlSFfjxWQvMMjGUCOD60dED/yFTimKS84Qk2
	WwwunLM7+XEkD3sJ93iLOVAedFXFWB1PPx4lBkhrS8BsTIgynCDQxkEtraJBXdjFW3FlC0mAukQ
	kLm+PozeS8FPWOc4USriz/tHsOiqap7BcD9Ex14ty8Hl468uNc82O5ZyGbewuGaf+s4+COVv0sE
	miwuBTmcshldTDz+KnIpgkXYGIG31vB4X60EwiKy32whYcXbo9plTEA=
X-Google-Smtp-Source: AGHT+IGa7io/fWTaKLPtHu4hL2REwdTwIrx+nIg3I9tnzS6/9scQa0HmxED/Tl79m0mGkX+RuCXaoxmwdtXcYdb4V4k=
X-Received: by 2002:a05:690c:6c8d:b0:787:ef99:1e82 with SMTP id
 00721157ae682-78e66e50910mr129319847b3.38.1765942720296; Tue, 16 Dec 2025
 19:38:40 -0800 (PST)
MIME-Version: 1.0
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
 <20251216-k3-basic-dt-v1-1-a0d256c9dc92@riscstar.com> <20251216151602-GYB1937017@gentoo.org>
In-Reply-To: <20251216151602-GYB1937017@gentoo.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Wed, 17 Dec 2025 11:38:28 +0800
X-Gm-Features: AQt7F2pID3WWQ9Vri5EMfO_v0JvS2MCRf6LsnJZs9APTGewWq7PKaU-MP0eF9bU
Message-ID: <CAH1PCMZ7rA50ns6EFfX2BcouVYX6L+mYkUSYeGjp+fPNLc62gA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: riscv: add SpacemiT X100 CPU compatible
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, Yangyu Chen <cyy@cyyself.name>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Conor Dooley <conor@kernel.org>, 
	Heinrich Schuchardt <xypron.glpk@gmx.de>, Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	linux-serial@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_193843_668696_99EBAC4A 
X-CRM114-Status: GOOD (  19.52  )
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

T24gVHVlLCBEZWMgMTYsIDIwMjUgYXQgMTE6MTbigK9QTSBZaXh1biBMYW4gPGRsYW5AZ2VudG9v
Lm9yZz4gd3JvdGU6Cj4KPiBIaSBHdW9kb25nLAo+Cj4gT24gMjE6MzIgVHVlIDE2IERlYyAgICAg
LCBHdW9kb25nIFh1IHdyb3RlOgo+ID4gQWRkIGNvbXBhdGlibGUgc3RyaW5nIGZvciB0aGUgU3Bh
Y2VtaVQgWDEwMCAoUlZBMjMgY29tcGxpYW50KSBjb3JlLgo+ID4KPiA+IExpbms6IGh0dHBzOi8v
d3d3LnNwYWNlbWl0LmNvbS9lbi9zcGFjZW1pdC14MTAwLWNvcmUvCj4gaXQgd291bGQgYmUgYmV0
dGVyIGlmIHlvdSBjYW4gcHV0IG1vcmUgZGVzY3JpcHRpb24gaW50byBjb21taXQgbWVzc2FnZQo+
IGFzIEkgZG9uJ3QgdHJ1c3QgdGhlIGxpbmsgdG9vIG11Y2gsIGl0IG1heSB2YW5pc2ggb3IgY2hh
bmdlIGluIHRoZSBmdXR1cmU/Li4KClRoYW5rcyBZaXh1biBmb3IgdGhlIGZlZWRiYWNrLgpJIHVu
ZGVyc3RhbmQgeW91ciBjb25jZXJucy4gSSB3aWxsIGV4cGFuZCB0aGUgY29tbWl0IG1lc3NhZ2Ug
d2l0aCBtb3JlCmluZm9ybWF0aW9uIGFib3V0IFgxMDAgY29yZSBmZWF0dXJlcyBzbyB3ZSBkb24n
dCByZWx5IHNvbGVseSBvbiB0aGUgbGluay4KCj4KPiBiZXNpZGVzLCBpZiBJIHJlbWVtYmVyIGNv
cnJlY3RseSwgdGhlcmUgYXJlIHN0aWxsIGZldyBvcHRpb25hbAo+IGV4dGVuc2lvbnMgdGhhdCBu
b3Qgc3VwcG9ydGVkIGJ5IHgxMDAsIGl0J3Mgd29ydGggdG8gbGlzdCBoZXJlIHRvCj4gbGV0IGNv
bW11bml0eSBrbm93Li4KCkkgd291bGQgcHJlZmVyIG5vdCB0byBsaXN0IHRoZSB1bnN1cHBvcnRl
ZCBvcHRpb25hbCBleHRlbnNpb25zIGV4cGxpY2l0bHkuCkJhc2ljYWxseSB0aGVyZSBhcmUgdHdv
IHJlYXNvbnMuIFNpbmNlIHRoZSBSSVNDLVYgc3BlY2lmaWNhdGlvbiBpbmNsdWRlcyBhCnZhc3Qg
bnVtYmVyIG9mIG9wdGlvbmFsIGV4dGVuc2lvbnMsIGFuZCB0aGV5IGFyZSBjYXRlZ29yaXplZCBp
biBmb3VyIGdyb3VwcwoobG9jYWxpemVkIG9wdGlvbnMsIGRldmVscG1lbnQgb3B0aW9ucywgZXhw
YW5zaW9uIG9wdGlvbnMsIGFuZCB0cmFuc2l0b3J5Cm9wdGlvbnMpLCBsaXN0aW5nIGV2ZXJ5dGhp
bmcgbm90IHN1cHBvcnRlZCB3b3VsZCBiZSBxdWl0ZSBsZW5ndGh5IElNSE8uClNlY29uZGx5LCBs
b29raW5nIGF0IHByZXZpb3VzIGNvbW1pdHMgZm9yIG90aGVyIFJJU0MtViBDUFVzLCBpdCBkb2Vz
bid0IHNlZW0KdG8gYmUgdGhlIGNvbnZlbnRpb24gdG8gbGlzdCB1bnN1cHBvcnRlZCBleHRlbnNp
b25zLgoKSSB3aWxsIGV4cGFuZCB0aGUgY29tbWl0IG1lc3NhZ2UgdG8gc3RhdGUgWDEwMCBzdXBw
b3J0cyBhbGwgX21hbmRhdG9yeV8KZXh0ZW5zaW9ucyBwZXIgZGVmaW5lZCBieSB0aGUgUlZBMjMg
cHJvZmlsZS4KCkkgaG9wZSB0aGlzIGFwcHJvYWNoIGlzIGFjY2VwdGFibGUuCgpCUiwKR3VvZG9u
ZwoKPgo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEd1b2RvbmcgWHUgPGd1b2RvbmdAcmlzY3N0YXIu
Y29tPgo+ID4gLS0tCj4gPiAgRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2
L2NwdXMueWFtbCB8IDEgKwo+ID4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+ID4K
PiA+IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvcmlzY3Yv
Y3B1cy55YW1sIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL3Jpc2N2L2NwdXMu
eWFtbAo+ID4gaW5kZXggZDczM2MwYmQ1MzRmYjYzZWQ3YzBlYWRhOTdjNDI4MzI0MzFmMWZjMS4u
Y2NlODcwOTJkYzc3NDlmNDkwNjYxNTRkOWEyNTZhZjZjN2I2YzE5ZiAxMDA2NDQKPiA+IC0tLSBh
L0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+ICsr
KyBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9yaXNjdi9jcHVzLnlhbWwKPiA+
IEBAIC02Miw2ICs2Miw3IEBAIHByb3BlcnRpZXM6Cj4gPiAgICAgICAgICAgICAgICAtIHNpZml2
ZSx1NzQKPiA+ICAgICAgICAgICAgICAgIC0gc2lmaXZlLHU3NC1tYwo+ID4gICAgICAgICAgICAg
ICAgLSBzcGFjZW1pdCx4NjAKPiA+ICsgICAgICAgICAgICAgIC0gc3BhY2VtaXQseDEwMAo+ID4g
ICAgICAgICAgICAgICAgLSB0aGVhZCxjOTA2Cj4gPiAgICAgICAgICAgICAgICAtIHRoZWFkLGM5
MDgKPiA+ICAgICAgICAgICAgICAgIC0gdGhlYWQsYzkxMAo+ID4KPiA+IC0tCj4gPiAyLjQzLjAK
PiA+Cj4KPiAtLQo+IFlpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
