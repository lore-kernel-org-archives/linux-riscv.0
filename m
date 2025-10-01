Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3CCACAC5BB
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Oct 2025 14:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Uru7ZpIiaDq9CqSnUHf3uBlKiWu8iTK30fiap/0HqAU=; b=FX75iHo6Pj8wOE
	ZY8u4GcfqVyX2ifd22GGBTjrHz/7FIv/n65/qXORMVi1f3k80ORHgkdki23y6zEdT2RJyyzU5ttPV
	9J1JWzwrAeREQrXHBgHZxMN+nnvIExIAi6vwW9QhvUWDgUUUE4dQc73wIolt34qr0TPX2tllbYNUG
	Bu8e50rxGZ2A4UxT3bPZClJqHVvF6taE19putuFO/ANpndGyss2ICSQ3R3FdEhQqnxjr3M6g8kwOz
	X5ktxonaAQIhJgmr+0X3VGLTaOmXlojZuyi+oAfAU/y8Uj2kHFz+Wur5aSseJRYdoyG2bfRyf3Bcr
	fD1TRc6GxQKspnSdnNkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xhv-000000089oU-228G;
	Wed, 01 Oct 2025 14:21:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3xht-000000089o7-0Gta
	for linux-riscv@lists.infradead.org;
	Wed, 01 Oct 2025 14:21:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 83BED44D82;
	Wed,  1 Oct 2025 14:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00075C4CEF1;
	Wed,  1 Oct 2025 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759328483;
	bh=J2fqNDAd1wRU864eSpkfrd999qUHOFK/4c5fDl4Dl/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ppq0wNVCZl49QUnuNWMqJMVyXU2DqLrdlPDr8cnmvrzwqvtM5wRv7ff6hocv7/oFC
	 Pfun6y0oKel+L98l7ayCFYyz7gHiItSbbxHUUtaCdQhFIxs2vPPbcXsq+EIFIbRhFa
	 iLE5/2QhcQuTkHZH8tODay3K7NUSDmYXr+PyGqJV14OxlA0p1TnzejJp2Wgnev6pwc
	 CFEYxRtp71kJYY01z0L9yJlmffr//QTNB4lWqO61W6pigaWm5l1ZI1dMiqnysVT6Se
	 3jC2aExEmObG4DxPaJ/ZTTtf2ZJUpazGiym+nDMHQT9cI4HcNxbhTp2jxAU1c4jgVj
	 Yn4tNZoh85oHA==
Date: Wed, 1 Oct 2025 11:21:20 -0300
From: Arnaldo Carvalho de Melo <acme@kernel.org>
To: Leo Yan <leo.yan@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	James Clark <james.clark@linaro.org>, linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org, llvm@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/8] perf build: Support building with Clang
Message-ID: <aN044EY-Ds9-E6iz@x1>
References: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250930-perf_build_android_ndk-v2-0-2ea440b7ef01@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_072125_126043_841839BC 
X-CRM114-Status: GOOD (  13.30  )
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

T24gVHVlLCBTZXAgMzAsIDIwMjUgYXQgMDU6NTQ6NDhQTSArMDEwMCwgTGVvIFlhbiB3cm90ZToK
PiBUaGlzIHNlcmllcyBhZGRzIHN1cHBvcnQgZm9yIGJ1aWxkaW5nIHBlcmYgd2l0aCBDbGFuZywg
Zm9sbG93aW5nIHRoZQo+IGRpc2N1c3Npb24gaW4gWzFdLiBCZWNhdXNlIHRoZSBBbmRyb2lkIE5E
SyB1c2VzIENsYW5nIGJ5IGRlZmF1bHQsCj4gZW5hYmxpbmcgQ2xhbmcgYnVpbGRzIG5hdHVyYWxs
eSBjb3ZlcnMgQW5kcm9pZCBhcyB3ZWxsLgo+IAo+IFRoZSBzZXJpZXMgaXMgb3JnYW5pemVkIGFz
IGZvbGxvd3M6Cj4gCj4gICAtIFBhdGNoZXMgMeKAkzI6IEZpeCB0d28gYnVncyBmb3VuZCB3aXRo
IENsYW5nLgo+ICAgLSBQYXRjaGVzIDPigJM2OiBDb3JyZWN0IENST1NTX0FSQ0ggYW5kIGRpc21p
c3MgQ2xhbmcgYnVpbGQgd2FybmluZ3MuCj4gICAtIFBhdGNoZXMgN+KAkzg6IEVuYWJsZSBDbGFu
ZyBpbiB0aGUgTWFrZWZpbGUgYW5kIHVwZGF0ZSB0aGUKPiAgICAgZG9jdW1lbnRhdGlvbi4KPiAK
PiBUZXN0aW5nOgo+IAo+ICAgLSBDbGFuZyAxNS4wLjcgb24gVWJ1bnR1IDIyLjA0LjU6IG5hdGl2
ZSBhbmQgY3Jvc3MtY29tcGlsaW5nIChhYXJjaDY0KQo+ICAgLSBDbGFuZyAxOC4xLjMgb24gVWJ1
bnR1IDI0LjA0LjI6IG5hdGl2ZSBhbmQgY3Jvc3MtY29tcGlsaW5nIChhYXJjaDY0KQo+ICAgLSBB
bmRyb2lkIE5ESyByMjdkIChsYXRlc3QgTFRTKTogY3Jvc3MtY29tcGlsaW5nIChhYXJjaDY0KQoK
ICBMRCAgICAgIC90bXAvYnVpbGQvcGVyZi91dGlsL3BlcmYtdXRpbC1pbi5vCiAgTEQgICAgICAv
dG1wL2J1aWxkL3BlcmYvcGVyZi11dGlsLWluLm8KICBBUiAgICAgIC90bXAvYnVpbGQvcGVyZi9s
aWJwZXJmLXV0aWwuYQogIENDICAgICAgL3RtcC9idWlsZC9wZXJmL3BtdS1ldmVudHMvcG11LWV2
ZW50cy5vCiAgTEQgICAgICAvdG1wL2J1aWxkL3BlcmYvcG11LWV2ZW50cy9wbXUtZXZlbnRzLWlu
Lm8KICBBUiAgICAgIC90bXAvYnVpbGQvcGVyZi9saWJwbXUtZXZlbnRzLmEKICBMSU5LICAgIC90
bXAvYnVpbGQvcGVyZi9wZXJmCm1ha2U6IExlYXZpbmcgZGlyZWN0b3J5ICcvZ2l0L3BlcmYtNi4x
Ny4wLXJjNi90b29scy9wZXJmJworIHJtIC1yZiAvdG1wL2J1aWxkL3BlcmYKKyBta2RpciAvdG1w
L2J1aWxkL3BlcmYKKyBtYWtlICdBUkNIPScgJ0NST1NTX0NPTVBJTEU9JyAnRVhUUkFfQ0ZMQUdT
PScgLUMgdG9vbHMvcGVyZiAnTz0vdG1wL2J1aWxkL3BlcmYnICdDQz1jbGFuZycKbWFrZTogRW50
ZXJpbmcgZGlyZWN0b3J5ICcvZ2l0L3BlcmYtNi4xNy4wLXJjNi90b29scy9wZXJmJwogIEJVSUxE
OiAgIERvaW5nICdtYWtlIC1qMjgnIHBhcmFsbGVsIGJ1aWxkCk1ha2VmaWxlLmNvbmZpZzo0OTQ6
ICoqKiBObyBnbnUvbGliYy12ZXJzaW9uLmggZm91bmQsIHBsZWFzZSBpbnN0YWxsIGdsaWJjLWRl
dltlbF0uICBTdG9wLgptYWtlWzFdOiAqKiogW01ha2VmaWxlLnBlcmY6Mjg5OiBzdWItbWFrZV0g
RXJyb3IgMgptYWtlOiAqKiogW01ha2VmaWxlOjc2OiBhbGxdIEVycm9yIDIKbWFrZTogTGVhdmlu
ZyBkaXJlY3RvcnkgJy9naXQvcGVyZi02LjE3LjAtcmM2L3Rvb2xzL3BlcmYnCisgZXhpdCAxCnRv
b2xzYnVpbGRlckBmaXZlOn4kIGNhdCBkbS5sb2cvYWxwaW5lXDozLjIyCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxp
c3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFk
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
