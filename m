Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B30E606A32C
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Nov 2026 10:19:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=c9GWOOOU;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=icenowy.me header.i=@icenowy.me header.a=rsa-sha256 header.s=zmail2 header.b=Oi4ByOSX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=NsPQEXjI7jsHCRpwHsy7ReQZq16Ko8czbaIkgg8dP50=; b=c9GWOOOUOdNAyv9/smItjNJUjj
	7R/0N0baIHtXXyYZr/3Xoda9d0TOiJ6+6I4fLfwYTWOSbPG/5shzaHMwyzk2Gbahyjgw1M1EHTArX
	srT2bKlqhMtVJQKVkEMKxi41bnrq7YRzmNRzq/y0rdsPidahjXrhWQdh56pOjLevwD+D27NsgfcrP
	wSFT8MRCPnnII8IjIh0h3csgvmKi7uYkUh3hNZ77PIB4Xi3q80auh1DI0vSQRXgopAXnLNDIiFbm7
	eJixKqnhvt/FJ66IY71UF6o7ep8DoyEmSORlm/CxbRThxhUfuOnJC1krSvEGtzs1y6EDCbkKTdHKH
	W9mXTKrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTcku-00000008XZo-0Oe7;
	Wed, 18 Nov 2026 10:19:08 +0000
Received: from sender5-op-o15.zoho.com ([165.173.182.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTckr-00000008XZQ-1m6O;
	Wed, 18 Nov 2026 10:19:06 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794997111; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=duM/gO9A/sLm4uIjFeWEgFv+8mgswwB0RU3N1Ifzp2Ah6TAeu968wyO74dJF0VYXVz3aleUMsIbdB2IRen5xWjvuSf4dT/68uWQL6NGtg1MUmRz+LM6V78k2Atf1PqxZyXV1JL94kL36cHlI9zB0YQQTY7hS5dZt8UeeHoPlkjQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794997111; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mkIlP/VFkdFXEzDXzF49yA7qSDhA59GiLbzlhR/mvdk=; 
	b=UxNUkRRwALdBIqd+u0/1SRXfSlX+uHGECmIwZzaX1DuSs2pa10TpsUGZHRPbOovb+wmYPA5elYCOsL/zzhj7Ja/70TCDe9GHaSKebPGQ1xW8xDVoRQHqVqjrMJ5ZyDw58na/G9/5HF6c3A/XsCDs6iAkC4ALddga4NTtRLnIVwc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: a=rsa-sha256; b=Oi4ByOSXHxLX391vOuMr/ZKJCm3wX0/iKuyFiAVU8SQ65OQFej2WozQWNQhfeuQDKv6l7/BbgNydDlEIBiQg74Tb/vXKn31Guesh8GqcgI2stI6Kq1Kb9Ig8qZSjrw/TeDA8bfWI/eUtCnU+lwOcCAVfvSKix2fhpltCrtBzzXj8pu2W1CpFQNXcijLLQgLIu1Mi5Dd8eR4esbk0nYSsFbI3URs5BaQVssiEjjdppL6Y7FWiQSiOc1epm8U5ye3iBb58oenDahc2hdDesBKYIoXQUCPxxSsBJff/KGn94iCE0+QT20jdhbxNSL5wAsi+0SpyMebfRQt8RwGtWvHQrw==; c=relaxed/relaxed; s=zmail2; d=icenowy.me; v=1; bh=mkIlP/VFkdFXEzDXzF49yA7qSDhA59GiLbzlhR/mvdk=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794997109359888.2617794708957;
	Wed, 18 Nov 2026 02:18:29 -0800 (PST)
Message-ID: <bffbf989f2c99aa8c463719347930aca44962615.camel@icenowy.me>
Subject: Re: [PATCH v2 07/17] drm/spacemit: add Saturn DPU register model
From: Icenowy Zheng <uwu@icenowy.me>
To: Guodong Xu <docular.xu@gmail.com>
Cc: Cody Kang <codykang.hk@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard	 <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring	 <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley	
 <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, Vinod Koul
 <vkoul@kernel.org>,  Neil Armstrong <neil.armstrong@linaro.org>, Haylen Chu
 <heylenay@4d2.org>, Michael Turquette	 <mturquette@baylibre.com>, Stephen
 Boyd <sboyd@kernel.org>, Brian Masney	 <bmasney@redhat.com>, Philipp Zabel
 <p.zabel@pengutronix.de>, Paul Walmsley	 <pjw@kernel.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou	 <aou@eecs.berkeley.edu>, Alexandre Ghiti
 <alex@ghiti.fr>, Yao Zi <me@ziyao.cc>,  Uwe =?ISO-8859-1?Q?Kleine-K=F6nig?=
	 <u.kleine-koenig@baylibre.com>, dri-devel@lists.freedesktop.org, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-clk@vger.kernel.org
Date: Wed, 18 Nov 2026 18:18:11 +0800
In-Reply-To: <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
References: <20260809-k3-display-v2-0-327d7910bf71@gmail.com>
	 <20260809-k3-display-v2-7-327d7910bf71@gmail.com>
	 <edd7ae1b38ebc687d0b2bfb2509c40fb8a45e625.camel@icenowy.me>
	 <19ceb44df3141049a955c2c30fe64766.docular.xu@gmail.com>
User-Agent: Evolution 3.58.3 
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_021905_524152_89D75B73 
X-CRM114-Status: GOOD (  13.70  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

5ZyoIDIwMjYtMTEtMTfkuoznmoQgMTY6NDggLTA1MDDvvIxHdW9kb25nIFh15YaZ6YGT77yaCj4g
SGkgSWNlbm93eSwKPiAKPiBPbiBUaHUsIDAzIFNlcCAyMDI2IDIwOjA4OjEwICswODAwLCBJY2Vu
b3d5IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjYtMDgtMDnml6XnmoQgMjE6MTQgKzA4MDDvvIxD
b2R5IEthbmcgdmlhIEI0IFJlbGF55YaZ6YGT77yaCj4gPiA+IMKgZHJpdmVycy9ncHUvZHJtL3Nw
YWNlbWl0L2RwdS9zYXR1cm5fcmVncy9kcHVfaW50LmggfMKgIDI1ICsrCj4gPiAKPiA+IElzIHRo
ZSBzbGlnaHRseSBkaWZmZXJlbnQgSzEgU2F0dXJuIERQVSByZWdpc3RlcnMgY29uc2lkZXJlZD8K
PiAKPiBJIGNvbXBhcmVkIHRoZW0gd2l0aCB0aGUgSzEgQlNQIHlvdSBtZW50aW9uZWQgb2ZmbGlu
ZSBbMV0uIEp1ZGdpbmcgYnkKPiB0aGUgYmxvY2ssIGZpZWxkIGFuZCBpbnRlcnJ1cHQgbWFjcm8g
bmFtZXMsIEkgYWdyZWUgd2l0aCB5b3UgdGhhdCB0aGUKPiBLMSBhbmQgdGhlIEszIHVzZSBzaW1p
bGFyIElQLiBCdXQgdGhlcmUgYXJlIGFsc28gaW1wb3J0YW50Cj4gZGlmZmVyZW5jZXMgYmV0d2Vl
biB0aGUgSzEgYW5kIEszIHJlZ2lzdGVycywgd2hpY2ggaXMgd2h5IEkgd291bGQgbm90Cj4gcHJv
cG9zZSByZXVzaW5nIHRoZXNlIHRhYmxlcy4KPiAKPiBGb3IgZXhhbXBsZSwgdGhlIGJsb2NrcyBz
aXQgYXQgZGlmZmVyZW50IGFkZHJlc3NlcywgYW5kIG1vc3QgZmllbGRzCj4gYXJlIGF0IGEgZGlm
ZmVyZW50IHdvcmQgb3IgYml0LiBJbiBkcHVfaW50LmgsIENGR19SRFlfQ0xSIGlzIGJpdCA0IG9u
Cj4gdGhlIEsxIGFuZCBiaXQgNSBvbiB0aGUgSzMsIGFuZCB0aGUgdW5kZXJydW4gYml0IGlzIDkg
YW5kIDguCgpZZXMsIHRoaXMgSVAgd2VpcmRseSBkb2Vzbid0IGNvbnNpZGVyIHJlZ2lzdGVyIG1h
cCBjb21wYXRpYmxpdHkgYXQgYWxsLgoKPiAKPiBJTUhPIGEgSzEgcG9ydCBzaG91bGQgYWRkIGl0
cyBvd24gY29tcGF0aWJsZSwgaXRzIG93biBmaWVsZCBoZWFkZXIKCldlbGwgSSBkb24ndCB0aGlu
ayBmaWVsZCBoZWFkZXJzIHdvdWxkIHdvcmsgZm9yIGEgbWFpbmxpbmVkIGRyaXZlcjsKbWF5YmUg
dGhpbmdzIGxpa2UgcmVnbWFwX2ZpZWxkIGNvdWxkIGJlIHVzZWQgdG8gbWl0aWdhdGUgdGhlCmRp
ZmZlcmVuY2UuCgpTdXJlbHkgYSBjb21wYXRpYmxlIHN0cmluZyBmb3IgSzEgd291bGQgYmUgbmVl
ZGVkLCBhbmQgaXQgbWlnaHQgdGhlbgpzZXQgYSBkZXZpY2UgaW5mbyBzdHJ1Y3R1cmUgYXMgbWF0
Y2ggZGF0YSwgY29udGFpbmluZyB0aGUgZGV2aWNlCmNhcGFiaWxpdHkgYW5kIHJlZ21hcF9maWVs
ZCBsaXN0LgoKVGhhbmtzLApJY2Vub3d5Cgo+IGFuZCBpdHMgb3duIGJhY2tlbmQgZmlsZSBuZXh0
IHRvIHRoZSBLMyBvbmVzLiBXaGF0IGRvIHlvdSB0aGluaz8KPiBIb3BlZnVsbHkgeW91IGFncmVl
IHdpdGggbWUuCj4gCj4gWzFdCj4gaHR0cHM6Ly9naXRodWIuY29tL3NwYWNlbWl0LWNvbS9saW51
eC02LjYvdHJlZS9rMS1ibC12Mi4yLnkvZHJpdmVycy9ncHUvZHJtL3NwYWNlbWl0L2RwdS9zYXR1
cm5fcmVncwo+IAo+IEd1b2RvbmcKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5p
bmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8v
bGludXgtcmlzY3YK
