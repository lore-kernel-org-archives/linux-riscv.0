Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68F69C5AE59
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jun 2025 20:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bWjfI2fSDBJRfPQFw6kJeJe8f3oAa/Kz80sB45uXF0U=; b=XP6tVTGDkNdEY2
	EFSHLNo3KqMSmeYa6G7J2Dew/Depz1s1HYGyrbfd7+osXx37eS9tmuG3pJHo2jSVAtX2qEYTWWOuT
	73gXkBGbPgFP5s43V2ouWoy7avswCpYmypW/Vt/v3HDbl6blTjTYUKYT5vm1Tch27QqtS/sQyobdh
	f6zCm/SpcABzuy/pWTfmtFMQJsLmvOisx8TtFSNYyX+FQCmVeLn4Ks08xazNesfK/0v9ZT0mPAbmO
	1NLNkC1Ct5e8DpNPaMbjAAGK5iaL0f15Nb+TrHg7ylCfe/Ak4rXY0Q4wpMtBv6l5B0OoSnxXY7u0v
	0EwLNJpSppY6SJWDjaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXuz-0000000BlCw-0P5j;
	Tue, 03 Jun 2025 20:07:29 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMXuw-0000000BlBy-0CT3
	for linux-riscv@lists.infradead.org;
	Tue, 03 Jun 2025 20:07:27 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250603200720euoutp02b29cd6ae990b23ada02a6faf2f9cab59~FoSvxobs11172511725euoutp02C
	for <linux-riscv@lists.infradead.org>; Tue,  3 Jun 2025 20:07:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250603200720euoutp02b29cd6ae990b23ada02a6faf2f9cab59~FoSvxobs11172511725euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748981240;
	bh=I9G0dsh/HfxzQk/gcXna/50vSZKPGGK2LiIfw6uO1nQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=bjuGfDzUTy9cQ6Kctw7U5Gy8ojzufrQV+RTuK64u0KEuaHzOte1gio3BTTwqhy67c
	 25f587mHCzCk+ItozavpLgjWs2vw2y8ghqsR+ctUI+UZA3OoB0cFZh0oLduJOAiZoo
	 8/Qyi4rGJptYEHgAoBaZcmrTpwv6r7i01HEhLaVg=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250603200719eucas1p2a1693746bd398be6f5fd7a661b40a5c8~FoSvDD3kN0233102331eucas1p29;
	Tue,  3 Jun 2025 20:07:19 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250603200718eusmtip2fffef2b43712841199296d3e62877bda~FoSuBeEet2231322313eusmtip2g;
	Tue,  3 Jun 2025 20:07:18 +0000 (GMT)
Message-ID: <471578ae-5605-4051-af46-bae83bf4f44f@samsung.com>
Date: Tue, 3 Jun 2025 22:07:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] dt-bindings: power: Add T-HEAD TH1520 GPU power
 sequencer
To: Bartosz Golaszewski <brgl@bgdev.pl>, Krzysztof Kozlowski
	<krzk@kernel.org>
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Philipp Zabel
	<p.zabel@pengutronix.de>, Frank Binns <frank.binns@imgtec.com>, Matt Coster
	<matt.coster@imgtec.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson <ulf.hansson@linaro.org>, Marek
	Szyprowski <m.szyprowski@samsung.com>, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAMRc=Mc-jjULmc=3fS0qZgXbq9Sgfg8JBoH7peWML1PdyyyH+A@mail.gmail.com>
X-CMS-MailID: 20250603200719eucas1p2a1693746bd398be6f5fd7a661b40a5c8
X-Msg-Generator: CA
X-RootMTR: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
X-EPHeader: CA
X-CMS-RootMailID: 20250529222403eucas1p1923fe09240be34e3bbadf16822574d75
References: <CGME20250529222403eucas1p1923fe09240be34e3bbadf16822574d75@eucas1p1.samsung.com>
	<20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<20250530-apr_14_for_sending-v3-1-83d5744d997c@samsung.com>
	<CAMRc=Me9cWfe2mL=Q6JQbAFjpd55MOBZuAWC793Us0criiQr4Q@mail.gmail.com>
	<4519844e-b1c0-40a7-b856-a6e4a80c6334@samsung.com>
	<20250603-cuddly-certain-mussel-4fbe96@kuoka>
	<CAMRc=MfXashaEscE1vF_P6cs9iOCBerfNFiB4yC+TX76fZ87nA@mail.gmail.com>
	<CAMRc=Mc-jjULmc=3fS0qZgXbq9Sgfg8JBoH7peWML1PdyyyH+A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_130726_354269_6464E65D 
X-CRM114-Status: GOOD (  14.44  )
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

CgpPbiA2LzMvMjUgMTY6NDksIEJhcnRvc3ogR29sYXN6ZXdza2kgd3JvdGU6Cj4gT24gVHVlLCBK
dW4gMywgMjAyNSBhdCAzOjM14oCvUE0gQmFydG9zeiBHb2xhc3pld3NraSA8YnJnbEBiZ2Rldi5w
bD4gd3JvdGU6Cj4+Pj4KPj4+PiBUaGUgY29tcGF0aWJsZSBzdHJpbmcgY291bGQgYmUgdXBkYXRl
ZCBsaWtlIHNvOgo+Pj4+ICJ0aGVhZCx0aDE1MjAtYW9uLXB3cnNlcSIKPj4+Cj4+PiBTaG91bGQg
bm90IGJlIHNlcGFyYXRlIG5vZGUsIHlvdSBhbHJlYWR5IGhhdmUgb25lIGZvciBBT04uCj4+Pgo+
Pgo+PiBBZ3JlZWQuIEFuZCBhcyBmYXIgYXMgaW1wbGVtZW50YXRpb24gZ29lcywgeW91IGNhbiBo
YXZlIHRoZSBzYW1lCj4+IGRyaXZlciBiZSBhIFBNIGRvbWFpbiBBTkQgcHdyc2VxIHByb3ZpZGVy
LiBJdCBqdXN0IGhhcyB0byBiaW5kIHRvIHRoZQo+PiBkZXZpY2Ugbm9kZSB0aGF0IHJlcHJlc2Vu
dHMgYW4gYWN0dWFsIGNvbXBvbmVudCwgbm90IGEgbWFkZS11cAo+PiAiY29udmVuaWVuY2UiIG5v
ZGUuCj4+Cj4gCj4gSSdtIHNlZWluZyB0aGF0IHRoZXJlJ3MgYWxyZWFkeSBhIG1haW4gZHJpdmVy
IHVuZGVyCj4gZHJpdmVycy9wbWRvbWFpbi90aGVhZC90aDE1MjAtcG0tZG9tYWlucy5jIGFuZCBh
ICJsb2dpY2FsIHN1Yi1kcml2ZXIiCj4gdW5kZXIgZHJpdmVycy9maXJtd2FyZS90aGVhZCx0aDE1
MjAtYW9uLmMgd2hpY2ggZXhwb3Nlcwo+IHRoMTUyMF9hb25faW5pdCgpIGNhbGxlZCBieSB0aGUg
Zm9ybWVyLiBNYXliZSBqdXN0IGZvbGxvdyB0aGF0Cj4gcGF0dGVybiwgYWRkIGEgbW9kdWxlIHVu
ZGVyIGRyaXZlcnMvcG93ZXIvc2VxdWVuY2luZy8gY2FsbGVkCj4gcHdyc2VxLXRoMTUyMC1wd3Jz
ZXEuYyBhbmQgY2FsbCBpdHMgaW5pdCBmdW5jdGlvbiBmcm9tIHRoZSBwbS1kb21haW5zCj4gbW9k
dWxlPwoKUmlnaHQsIHNvcnJ5IEkgaGF2ZW4ndCBub3RpY2VkIHRoaXMgYW5kIHJlc3BvbmRlZCB0
byBwcmV2aW91cyBtZXNzYWdlLgpUaGFua3MgZm9yIHRoZSBkaXJlY3Rpb24gIQoKPiAKPiBCYXJ0
Cj4gCgpCZXN0IHJlZ2FyZHMsCi0tIApNaWNoYWwgV2lsY3p5bnNraSA8bS53aWxjenluc2tpQHNh
bXN1bmcuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
