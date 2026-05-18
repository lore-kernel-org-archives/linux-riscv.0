Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD70CD4F52
	for <linux-riscv@archiver.kernel.org>; Mon, 18 May 2026 11:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WOWEGuR9V3PHTWU7w8Q7lwlzBkd7HPQJO6o4vmKWE2M=; b=vkIAVImsW1LJ+B
	7A29P2MuAmJs3Ign1fa2JE9+m40cAeelKjEw1G5slQJGqA6+o7CLeAoQ3KwsR7vaTFjyK2M6ulAm/
	SZcDf7hHFgFNx6m3XnlufLItIDSw+2kOqudD63eORU4lC0DbK5NqIbFku3NTppCcNdcKG1poSqFaO
	7gGj7x/MM7wVin/t0eWr91ozQPoEVdNlwtvFvSOUfjmTx5vCLconU6LfTT4xZ8r8NR2jNcaUN1K5f
	Fmm3Hal+tIvKS8Ksp2eNcv1qWGyqQcIwNz+0hNaDS3GJx+n/9de/xMgl2j7iiuHmynAXJQWOV9nng
	abwBUpB97ovQDh/iQ74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwN8-0000000FTb0-1QzT;
	Mon, 18 May 2026 11:42:58 +0000
Received: from mail-oa1-x2f.google.com ([2001:4860:4864:20::2f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwN5-0000000FTaJ-2B6f
	for linux-riscv@lists.infradead.org;
	Mon, 18 May 2026 11:42:56 +0000
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-43ab7bfaa18so310047fac.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 May 2026 04:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779104574; cv=none;
        d=google.com; s=arc-20240605;
        b=ZJnFycf+1a0Lkv0yiWHuoqQNPr4g/IzyFQZh7YS6rNVyPu0J6OwDafYRnYja0jE9dZ
         xnzaWO7tIKG9Df0uIeEOxC65Z2CKXBq9qgusMzi8SGsxjYghPmO2wbGf29//PyqXueW5
         qPgJLPTGHRgp1xm9bi+358h3LOgCcWX9zI7K9UHSzVf6/s+bTjsYmGdEGplshJEt0ZU/
         8UplctzPTJIiTEok7jfphcGDa+bzij9M7IUAoFvgwLCUQE04EUgNSqxVpHJIiT98NTKm
         Gli7IAinxTq01JMk4ZAejvqSvhmchAf0Q+2UHN0dWJtUA/BfXWysGc4zb6IB1F+Ry+YI
         4XWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        fh=JnA5Ctumvfpv1alBd1KTTjFRWfRU7YL25C81E+KcqQ8=;
        b=LcUos+f+6RP5AU0oTYAg1MaYx8IgWDnbEj4BfETtbfiwBz/T4QhN+fo717iSE9tUS+
         CI0d8PsKrMeXzCfxpeE8XQgXua3l2/NLbqqtv1kNjjA5YC7f04r/CxpKSkD05Tx/Aw2f
         qIGJOqEvGIJPQ82Kze/apA8MmeLkwTL5HimSF4TRQD2cuAfpBT2rUbPSSJoX3Jy1bBpt
         bQYJ09VnwCoTg6e3eBE8X/Z/1RGc8ijkzHKEKWaQiU9NmMBF+hew4r3yK/rTl7VmXrZR
         uR1N3MB5Upy+vfYWoq0fGjI2GxeZqOf8A81HEuWVglhMRx1HhvICLl4mAKibVdrF0E/S
         fdeg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779104574; x=1779709374; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        b=Ealvrn9V2rzurf5mEY8pyYa/9wh+RO/raw7f9E7KOVXL7xZLPjkl55AIOFp0Q827qR
         qYqv7QIApSPnFpqzYFs927B2WEJ33YL/ntUpe69jGhHjC25ULN/JGKncLppxjgKfEIpg
         l8YQBdI/vU8F4ZvQ/1UNXapQUq+iQ3mE7prxZdrYaxEGcG6RbJa3erwqZ3SMT3XcqRaR
         99QS+AgKyxDckUH6r0/Cy0a86OZ+aZnVwjQDt4NpZwQ/xq0aTkfBOtig5V6xdV+ecj2q
         9VxG3wlhSWYKkGkbFshctupgDsA4wGHpQDuLIigNbmUl8/nAnNFriTDZWGvcqjmveIJo
         CZ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779104574; x=1779709374;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZSVFgnDLqoibhkNbK9QZ3coCLRNq5Ci4ji9hjqvuAE=;
        b=GRAkHkWgsEky4Izhasc2GY94yNDzmrN0isjIMzUnAb/osYaHcZYsncwBI3iATc791h
         bS2y0c4rNHeWT25+J7nzvOfOetGZ43qnLiL0UOA6i3WsDgMuDHXtBvkD4OdUX+Gx1x2N
         0ptuGZnGAlAiNL1LoOltiKJ9JhXXs3lB98l8hi0W2Wi3SzrWYHdA/pbyUBfTnGu/lRr8
         Ew8OSUCUoW02YmSuirEbbxB2pH4W2oumsfEnG2cinet3nccm1dlTuLJX1PAzA8iX/9El
         6yVXct6lQy3BNI0byZXiEnZwuLAhpXHq7OBNmnxdmZnTaJyR7MeY57hr5tBdu/RdNnFP
         m5HQ==
X-Forwarded-Encrypted: i=1; AFNElJ/FTMGCydZQx4dLCjyaRiUWx+DsGZlU14ln7YkxJtwfyPJY2MyK4aI2oqB3GYG2sVGcXynK9Ms2q2GqqA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFgtEBa+wet8YGhDh7XlPstG323JEnEigzZa3EHBO2R7j3/1y+
	ExCcuICjzcLq8u/OQkWba7monMitHHt0otnLiRlxP9GJNmqValEZDvK1edlfKjR7220kLlr7c9H
	2r58Nyhux8ly2Rq8tiXp1SZK7yVEdNyM=
X-Gm-Gg: Acq92OHKqJfdypX1lGl6BgZ5N4EoAN84Nt7SBQD8HfIMXh0L9o/L1m25uvTrCZRooNt
	Wx2NQ1i0Y9L+DrXhFLvzCOmhIEu8fwJnLQpWzXUo2+gcJm2yUgY5mGnEWp7nx7nPDkOjmiLHLrP
	PehogF8RXA+3tjUxRhaIHlM93Q3Slfdh7VY4tN34omxjGRRonPddSt6Rn8bROqq3eA+UR8Cp3Bg
	5TcN1u7ePbDFTYOkSqQhmcanqBGC4BCMcGHZn5+nDuXACT2/hV8wOawcKHAs3HXA2cxk7buXBXe
	5y9vLDRZ5+qpFeoYskwha/y2OQ==
X-Received: by 2002:a05:6870:c233:b0:42c:711:a235 with SMTP id
 586e51a60fabf-43a2de6d4e8mr9184021fac.35.1779104574383; Mon, 18 May 2026
 04:42:54 -0700 (PDT)
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-2-438f2e0513ff@gmail.com> <20260517-cartoon-slather-ec5ad7605449@spud>
 <20260517-pulsate-shining-547432ab2ca0@spud>
In-Reply-To: <20260517-pulsate-shining-547432ab2ca0@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 19:42:43 +0800
X-Gm-Features: AVHnY4K5bYIE3B-YL63O3FZeaOtgyPunJ0_rHmAr8AXg2dK5L-d96T8-eA1kvlE
Message-ID: <CAJsYDV+-VprPUK_CJsEpEa8ifphmp3ztHga__H=QWLoq8Jv4yw@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add binding header for sf21-topcrm
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_044255_587137_A98E2A20 
X-CRM114-Status: GOOD (  16.06  )
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

T24gTW9uLCBNYXkgMTgsIDIwMjYgYXQgNDo1MuKAr0FNIENvbm9yIERvb2xleSA8Y29ub3JAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBTdW4sIE1heSAxNywgMjAyNiBhdCAwOTo0NzoyNlBNICsw
MTAwLCBDb25vciBEb29sZXkgd3JvdGU6Cj4gPiBPbiBTdW4sIE1heSAxNywgMjAyNiBhdCAxMDox
Mjo1NlBNICswODAwLCBDaHVhbmhvbmcgR3VvIHdyb3RlOgo+ID4gPiArI2RlZmluZSBTRjIxX0NM
S19QQ0lFX1JFRlAgICAgICAgICAzMAo+ID4gPiArI2RlZmluZSBTRjIxX0NMS19NQVggICAgICAg
ICAgICAgICAgICAgICAgIDMxCj4gPgo+ID4gPiArI2RlZmluZSBTRjIxX1JFU0VUX0lST00gICAg
ICAgICAgICAgICAgICAgIDE3Cj4gPiA+ICsjZGVmaW5lIFNGMjFfUkVTRVRfTUFYICAgICAgICAg
ICAgICAgICAgICAgMTgKPiA+Cj4gPgo+ID4gSGF2aW5nIF9NQVggaXMgbm90IHBlcm1pdHRlZCwg
YnV0IGlzIGFsc28gcmVhbGx5IGNvbmZ1c2luZyB0aGF0ICJtYXgiCj4gPiBhcHBlYXJzIHRvIGJl
IG1heCsxLCBzbyBhY3R1YWxseSByZXByZXNlbnRzIHRoZSBjb3VudCBub3QgdGhlIG1heD8KPgo+
IFRvIGJlIGNsZWFyLCBpZiB5b3UgbmVlZCBhIGRlZmluZSBsaWtlIHRoaXMsIHB1dCBpdCBpbiB0
aGUgZHJpdmVyLgo+IEJpbmRpbmdzIGhhdmluZyBhICJfTUFYIiBvciAiTlVNX0NMS1MiIGRvZXNu
J3QgbWFrZSBzZW5zZSwKClN1cmUuIEknbGwgbW92ZSBpdCB0byB0aGUgZHJpdmVyIGFuZCByZW5h
bWUgaXQgaW4gdjIuCgo+IGFuZCBoYWxmIHRoZQo+IHRpbWUgdGhpcyBudW1iZXIgZW5kcyB1cCBj
aGFuZ2luZyBhbnl3YXkuCgpUaGlzIG9uZSB3aWxsIGRlZmluaXRlbHkgY2hhbmdlIGxhdGVyIGZv
ciB0aGUgdHdvIGNsb2NrcyBJIGNhbid0IHRlc3QgeWV0LgoKPiBBbHNvLCBzcXVhc2ggdGhpcyB3
aXRoIHRoZSBwYXRjaCBhZGRpbmcgdGhlIGNsb2NrIGJpbmRpbmcuCgpPSy4gSSdsbCBkbyBzbyBp
biB2Mi4KCi0tIApSZWdhcmRzLApDaHVhbmhvbmcgR3VvCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
