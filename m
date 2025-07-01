Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8706C8303D
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 10:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZuhuvrHnnwQa74yr0slIYlRbWfgj40e4LEBMHP5q0KU=; b=P8ZX0DqgXzu0sG
	2sRF5KqrNxcDbnQNfDh3bVuoRDTNntXWN/D8DFp9rcd/tZf0KB5GfGGWwhtwitWwvKEpxT0gBAKjP
	U5rs7ZsCzMUr1AbiQ27ih0lSBr9p3QPADRo53aUcjpqyMCn9saz0jvhEw2hPWdxuJf+d/V82+mAk4
	fB0KRUVLjZGxzL7gDkwgLj1MieHeimmsGL1A/r38k0CGTB5y4Q9JNQ/J2OOzM258c0WegKy+yDwNG
	ZkDKf7ydlMi8atMQQ/jDamnyYuWCI+w8GAc8YSAsujqbuFDrhdpMcu6/JPbsBgclGdyxJzbRen8xk
	H8WG1y36lym4LiaLy6NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXty-00000004hYe-2bzd;
	Tue, 01 Jul 2025 10:07:46 +0000
Received: from mail-yb1-xb35.google.com ([2607:f8b0:4864:20::b35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWXqu-00000004gGM-11F7
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 10:04:37 +0000
Received: by mail-yb1-xb35.google.com with SMTP id 3f1490d57ef6-e8601ce24c9so2299156276.1
        for <linux-riscv@lists.infradead.org>; Tue, 01 Jul 2025 03:04:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751364275; x=1751969075; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tI2TEX0v6p76uLE+ptZngTvOHJFtlrTXX6bq47hMyoo=;
        b=PWPodCZOGloB8NhkgV+fvuL9gqihKmkxwdKHK8K+FWpm7doBW89+LHTF6BXFCsZej1
         RVtnSoerpn8jchigJ16zPzvaCILOPqmaE+OxLCJaDvRO/eJx+7MbKgfIgMCwMK+wV+9C
         CmCwC2kmZp/fxzkhu1E6obe+7VCXMANNh8hjQq9mzFNZHcG9xukuYj5cAZDqLLEl0b5K
         KpBCCEaHjbM0Rxn3QScmp0It5dQ92ByfKZJuuvBsORQYGfKttld5YkYHrsLikn4ycAza
         0OggsCyPK0/PvGZyxAI8UfH89b8OCHOFsj6d0MCHjMSwdpDDYIY46fpsCFv9Tl1WcA+9
         tF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751364275; x=1751969075;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tI2TEX0v6p76uLE+ptZngTvOHJFtlrTXX6bq47hMyoo=;
        b=TObC5LnTvcwVoAo98dCg/tpM7rl5sepCE7tdapxW6zoQhr03OXdy/PeZXRipl/+uIl
         GflrakeBpCvJB296i9CSdlczuLjwsCWtEAslQ6gM1ExSwd06oVI32L8H7LTST2wRgqK7
         l1K/galWCw0EEBVWKjeLcaDaSQ0o77RU8LdwTruuajVnFuRL6QF9x2SowaqBYiWHSv7r
         Wr5NxdKMMW8GgpgllQuF0udSmODTDgO6QsTgxscCRJPD5kwqjqpG6R4rrscWTDzqRUZA
         tBl1jjsMXAyxTcA59EIkUNNudIBIvTpa/S9hopLHQbdtqQzxfm8x2cCIXOM46ES4bpz4
         kzXA==
X-Forwarded-Encrypted: i=1; AJvYcCVA1brDtRI9NAw6DREw/CsnnMDmOQisRAurOpa2U18rtmQooPCoQcajESZQe0z73ZCEIVchNob93mKESg==@lists.infradead.org
X-Gm-Message-State: AOJu0YziqK1cWMxmxQ7NCYUpfT5gnSFIQhff4MpEgLyZPSnezZxFg/EF
	+9yTnuDda4JSQPRvDNlFKZuEh9JYuJer0mw0MS+H+AWYgMaBjHQpHa8dpscMZvsFBxjazON6MIN
	dmq3YBN1LBC7/qvC5oqtsHJFQCcNEPlR2nE7/tF4vDg==
X-Gm-Gg: ASbGncsrhTU2YEO6Bo+uH9Maqqtx676i1V4H8uVlwq6fMMADu4fJL2wn4MA8eFKehW9
	uPHMMw+gKJa3cd4HlTo+0ms26z6sTZn5iqw0sc2c6CqCFHovd3ByTbv8lMvFNEoAaok3GQ/uVYT
	hSw92R243xaHVVIvL/61wsAjdf9vArNWVv+o2M7UYW519NxpZkVd1OhjBE6wg=
X-Google-Smtp-Source: AGHT+IFFvhwLw/jJrBvk5mcq4A9/NKoJsPfn9jlPFZrZKY33NEca9HgiwrZDw7XbN2a2/VI+7HKKIkBzK0LvZEqayRQ=
X-Received: by 2002:a05:690c:38b:b0:709:1529:c24f with SMTP id
 00721157ae682-7151713cdcemr231087327b3.4.1751364275152; Tue, 01 Jul 2025
 03:04:35 -0700 (PDT)
MIME-Version: 1.0
References: <20250701-working_dma_0701_v2-v2-0-ab6ee9171d26@riscstar.com>
 <20250701-working_dma_0701_v2-v2-7-ab6ee9171d26@riscstar.com>
 <ebc16dbe-2405-4956-91a0-bcce9f199326@kernel.org> <CAH1PCMa2dB1fefzGgo-kKfgAdou_KaDSvTDsvYPjsGKODHETCA@mail.gmail.com>
 <d3d73135-15d8-487d-a55a-44f1f98db930@kernel.org>
In-Reply-To: <d3d73135-15d8-487d-a55a-44f1f98db930@kernel.org>
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 1 Jul 2025 18:04:24 +0800
X-Gm-Features: Ac12FXwHr2IIx2UMlAjmgrdgoDgmw39WTy6GMM6om5RG4oXPV4Hi_Mb50OUfJEU
Message-ID: <CAH1PCMa35n4dnJ94-EHGrJyU3kztQYO8_v2CkD=rid466zv3+A@mail.gmail.com>
Subject: Re: [PATCH v2 7/8] riscv: dts: spacemit: Enable PDMA0 on Banana Pi F3
 and Milkv Jupiter
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
	=?UTF-8?Q?Duje_Mihanovi=C4=87?= <duje.mihanovic@skole.hr>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Alex Elder <elder@riscstar.com>, 
	Vivian Wang <wangruikang@iscas.ac.cn>, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_030436_282981_7C336645 
X-CRM114-Status: GOOD (  14.42  )
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

T24gVHVlLCBKdWwgMSwgMjAyNSBhdCA1OjAy4oCvUE0gS3J6eXN6dG9mIEtvemxvd3NraSA8a3J6
a0BrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIDAxLzA3LzIwMjUgMTA6NDgsIEd1b2RvbmcgWHUg
d3JvdGU6Cj4gPiBPbiBUdWUsIEp1bCAxLCAyMDI1IGF0IDM6MzbigK9QTSBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnprQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4+Cj4gPj4gT24gMDEvMDcvMjAyNSAw
NzozNywgR3VvZG9uZyBYdSB3cm90ZToKPiA+Pj4gRW5hYmxlIHRoZSBQRE1BMCBvbiB0aGUgU3Bh
Y2VtaVQgSzEtYmFzZWQgQmFuYW5hIFBpIEYzIGFuZCBNaWxrdiBKdXBpdGVyCj4gPj4+IGJvYXJk
cyBieSBzZXR0aW5nIGl0cyBzdGF0dXMgdG8gIm9rYXkiLgo+ID4+Pgo+ID4+PiBTaWduZWQtb2Zm
LWJ5OiBHdW9kb25nIFh1IDxndW9kb25nQHJpc2NzdGFyLmNvbT4KPiA+Pj4gLS0tCj4gPj4+IHYy
OiBhZGRlZCBwZG1hMCBlbmFibGVtZW50IG9uIE1pbGt2IEp1cGl0ZXIKPiA+Pj4gLS0tCj4gPj4+
ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cyAgIHwgNCAr
KysrCj4gPj4+ICBhcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLW1pbGt2LWp1cGl0ZXIu
ZHRzIHwgNCArKysrCj4gPj4+ICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKQo+ID4+
Pgo+ID4+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1iYW5h
bmFwaS1mMy5kdHMgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYz
LmR0cwo+ID4+PiBpbmRleCBmZTIyYzc0N2M1MDEyZmU1NmQ0MmFjOGE3ZWZkYmJkYjY5NGYzMWI2
Li4zOTEzMzQ1MGUwN2YyY2I5Y2IyMjQ3ZGMwMjg0ODUxZjhjNTUwMzFiIDEwMDY0NAo+ID4+PiAt
LS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+ID4+
PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3NwYWNlbWl0L2sxLWJhbmFuYXBpLWYzLmR0cwo+
ID4+PiBAQCAtNDUsMyArNDUsNyBAQCAmdWFydDAgewo+ID4+PiAgICAgICBwaW5jdHJsLTAgPSA8
JnVhcnQwXzJfY2ZnPjsKPiA+Pj4gICAgICAgc3RhdHVzID0gIm9rYXkiOwo+ID4+PiAgfTsKPiA+
Pj4gKwo+ID4+PiArJnBkbWEwIHsKPiA+Pgo+ID4+Cj4gPj4gRG9lcyBub3QgbG9vayBsaWtlIHBs
YWNlZCBhY2NvcmRpbmcgdG8gRFRTIGNvZGluZyBzdHlsZS4gV2hhdCBzb3J0IG9mCj4gPj4gb3Jk
ZXJpbmcgU3BhY2VtaXQgZm9sbG93cz8KPiA+Pgo+ID4KPiA+IEFncmVlZC4gV2Ugc2hvdWxkIGVz
dGFibGlzaCBhIGNvbnNpc3RlbnQgb3JkZXJpbmcgcnVsZSBmb3IgU3BhY2VtaVQgYm9hcmQKPgo+
Cj4gSXNuJ3QgdGhlcmUgYSBzdHlsZSBhbHJlYWR5PyBPciB3aGF0IGlzIHRoZSBzdHlsZSBmb3Ig
UmlzYy12IGFyY2g/Cj4KClBlciBteSBjaGVja2luZywgaXQncyBub3QgY29uc2lzdGVudCBmb3Ig
YXJjaC9yaXNjdi4KClNpRml2ZSBib2FyZHMgKGhpZml2ZS11bmxlYXNoZWQtYTAwLmR0cyBhbmQK
aGlmaXZlLXVubWF0Y2hlZC1hMDAuZHRzKSBhcmUgbm90IGFscGhhYmV0aWNhbC4KCk1vc3Qgb3Ro
ZXIgUklTQy1WIHZlbmRvcnMgKFN0YXJGaXZlLCBNaWNyb2NoaXAsIFNvcGhnbyBNaWxrLVYgRHVv
LCBldGMuKQp1c2UgYWxwaGFiZXRpY2FsIG9yZGVyaW5nLiBUaGF0J3MgdGhlIG1ham9yaXR5LiBS
aWdodD8KCi1HdW9kb25nCgo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcg
bGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRl
YWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
