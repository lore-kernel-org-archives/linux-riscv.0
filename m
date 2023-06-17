Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03E43EB64D9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Jun 2023 20:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouN+m8qVpHE6swL7jq83LyAwM327gMuVHrhk9hmdsBU=; b=2YLoAdmDGWjsTe
	Xl7B/oePThRU5TqiG1AhM1I7L6JU4P/y6h6LJNsJ6gfxg6wXfKtsFnhHchQfL+fqS107QtMgCVgxn
	tox7PWQK9ulH08+ZlkOVNkYCXQqr9Jl9N80/unCqmB/NGjoOvde+mLfR531A8+UyqRMxI0G0AlozP
	EyFr+mkr5ArW6Z+Q3/OJhCDqYhvXLljdSyX6mMDqS06dicNWCEEvuLfkS7k6WGikLCt1YxGSbcvIM
	GIQn2JqHgr+hKGNj8Uo9iNXDoRVDAFYyDYJ1gGp550kKZg2/eQCpoimVRLVTxuPpy5FBJmRblvexG
	TD4vw7roYR9Bsq22ht8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qAcCa-004Gxi-1q;
	Sat, 17 Jun 2023 20:07:16 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qAcCX-004Gx0-0A;
	Sat, 17 Jun 2023 20:07:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 098886121F;
	Sat, 17 Jun 2023 20:07:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF954C433C8;
	Sat, 17 Jun 2023 20:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687032431;
	bh=akUaIhagBcheMMLkG/7LBKRbSkqRUijdxyGkrwPVDr0=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=bAxpYRUC4lZprbJCp81S5RRf0u2D0S1f/fMGvnVAB+zygd2WT7pmA6APGe1teSDqt
	 XKPOD1zUbhMFLrLZanvb8Anbj367cMyHZ92M+00ps0ejbMK1adQl1ov6Y9blEfAI/T
	 vvR0WL0vy8HYnoeb0pwaeeGtxSA3kgRViMzYuoR2BK9LBjTryJ8wOdQSPIsBhhJXCu
	 G5NbyXdphy1Af85mGhOKuk7Y82Iw8kzxVtJzP64Jh3PdNn4Qj3HZYmaxH2mXMDVHxL
	 oCalc+H6WNnnLieSWTcbsmgexXfq33St9mvgv4/4MnEu6zQ80N0bX6RXJTSAvWkwd0
	 Z0q7ZwLgz7CFA==
Date: Sat, 17 Jun 2023 21:06:58 +0100
From: Jonathan Cameron <jic23@kernel.org>
To: Maxim Kiselev <bigunclemax@gmail.com>
Cc: linux-iio@vger.kernel.org, Andy Shevchenko <andy.shevchenko@gmail.com>,
 Lars-Peter Clausen <lars@metafoo.de>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Heiko Stuebner
 <heiko.stuebner@vrull.eu>, Cosmin Tanislav <demonsingur@gmail.com>, Haibo
 Chen <haibo.chen@nxp.com>, Leonard =?UTF-8?B?R8O2aHJz?=
 <l.goehrs@pengutronix.de>, Caleb Connolly <caleb.connolly@linaro.org>, Hugo
 Villeneuve <hvilleneuve@dimonoff.com>, Mike Looijmans
 <mike.looijmans@topic.nl>, ChiYuan Huang <cy_huang@richtek.com>, Ramona
 Bolboaca <ramona.bolboaca@analog.com>, Ibrahim Tilki
 <Ibrahim.Tilki@analog.com>, William Breathitt Gray
 <william.gray@linaro.org>, Arnd Bergmann <arnd@arndb.de>, ChiaEn Wu
 <chiaen_wu@richtek.com>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 1/3] iio: adc: Add Allwinner D1/T113s/R329/T507 SoCs
 GPADC
Message-ID: <20230617210658.43d5b787@jic23-huawei>
In-Reply-To: <CALHCpMgxNwz197qgiEueV9Y26LN7BBfYSGBHy6J4gOTFpiVUtw@mail.gmail.com>
References: <20230615205540.1803975-1-bigunclemax@gmail.com>
	<20230615205540.1803975-2-bigunclemax@gmail.com>
	<20230617144855.0388c4ff@jic23-huawei>
	<CALHCpMgxNwz197qgiEueV9Y26LN7BBfYSGBHy6J4gOTFpiVUtw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230617_130713_170963_0EFF3FC7 
X-CRM114-Status: GOOD (  23.92  )
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

T24gU2F0LCAxNyBKdW4gMjAyMyAyMTo1MjoxMiArMDMwMApNYXhpbSBLaXNlbGV2IDxiaWd1bmNs
ZW1heEBnbWFpbC5jb20+IHdyb3RlOgoKPiDRgdCxLCAxNyDQuNGO0L0uIDIwMjPigK/Qsy4g0LIg
MTY6NDksIEpvbmF0aGFuIENhbWVyb24gPGppYzIzQGtlcm5lbC5vcmc+Ogo+ID4KPiA+IE9uIFRo
dSwgMTUgSnVuIDIwMjMgMjM6NTU6MjAgKzAzMDAKPiA+IE1ha3NpbSBLaXNlbGV2IDxiaWd1bmNs
ZW1heEBnbWFpbC5jb20+IHdyb3RlOgo+ID4gIAo+ID4gPiBUaGUgR2VuZXJhbCBQdXJwb3NlIEFE
QyAoR1BBREMpIGNhbiBjb252ZXJ0IHRoZSBleHRlcm5hbCBzaWduYWwgaW50bwo+ID4gPiBhIGNl
cnRhaW4gcHJvcG9ydGlvbiBvZiBkaWdpdGFsIHZhbHVlLCB0byByZWFsaXplIHRoZSBtZWFzdXJl
bWVudCBvZgo+ID4gPiBhbmFsb2cgc2lnbmFsLCB3aGljaCBjYW4gYmUgYXBwbGllZCB0byBwb3dl
ciBkZXRlY3Rpb24gYW5kIGtleSBkZXRlY3Rpb24uCj4gPiA+Cj4gPiA+IFRoZW9yZXRpY2FsbHks
IHRoaXMgQURDIGNhbiBzdXBwb3J0IHVwIHRvIDE2IGNoYW5uZWxzLiBBbGwgU29DcyBiZWxvdwo+
ID4gPiBjb250YWluIHRoaXMgR1BBREMgSVAuIFRoZSBvbmx5IGRpZmZlcmVuY2UgYmV0d2VlbiB0
aGVtIGlzIHRoZSBudW1iZXIKPiA+ID4gb2YgYXZhaWxhYmxlIGNoYW5uZWxzOgo+ID4gPgo+ID4g
PiAgVDExMyAtIDEgY2hhbm5lbAo+ID4gPiAgRDEgICAtIDIgY2hhbm5lbHMKPiA+ID4gIFIzMjkg
LSA0IGNoYW5uZWxzCj4gPiA+ICBUNTA3IC0gNCBjaGFubmVscwo+ID4gPgo+ID4gPiBSZXZpZXdl
ZC1ieTogQW5keSBTaGV2Y2hlbmtvIDxhbmR5LnNoZXZjaGVua29AZ21haWwuY29tPgo+ID4gPiBT
aWduZWQtb2ZmLWJ5OiBNYWtzaW0gS2lzZWxldiA8YmlndW5jbGVtYXhAZ21haWwuY29tPgo+ID4g
PiAtLS0KPiA+ID4gIGRyaXZlcnMvaWlvL2FkYy9LY29uZmlnICAgICAgICAgICAgfCAgMTAgKysK
PiA+ID4gIGRyaXZlcnMvaWlvL2FkYy9NYWtlZmlsZSAgICAgICAgICAgfCAgIDEgKwo+ID4gPiAg
ZHJpdmVycy9paW8vYWRjL3N1bjIwaS1ncGFkYy1paW8uYyB8IDI3NiArKysrKysrKysrKysrKysr
KysrKysrKysrKysrKwo+ID4gPiAgMyBmaWxlcyBjaGFuZ2VkLCAyODcgaW5zZXJ0aW9ucygrKQo+
ID4gPiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvaWlvL2FkYy9zdW4yMGktZ3BhZGMtaWlv
LmMKPiA+ID4KPiA+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaWlvL2FkYy9LY29uZmlnIGIvZHJp
dmVycy9paW8vYWRjL0tjb25maWcKPiA+ID4gaW5kZXggZWIyYjA5ZWY1ZDViLi5kZWZmN2FlNzA0
Y2UgMTAwNjQ0Cj4gPiA+IC0tLSBhL2RyaXZlcnMvaWlvL2FkYy9LY29uZmlnCj4gPiA+ICsrKyBi
L2RyaXZlcnMvaWlvL2FkYy9LY29uZmlnCj4gPiA+IEBAIC0xMTIzLDYgKzExMjMsMTYgQEAgY29u
ZmlnIFNVTjRJX0dQQURDCj4gPiA+ICAgICAgICAgVG8gY29tcGlsZSB0aGlzIGRyaXZlciBhcyBh
IG1vZHVsZSwgY2hvb3NlIE0gaGVyZTogdGhlIG1vZHVsZSB3aWxsIGJlCj4gPiA+ICAgICAgICAg
Y2FsbGVkIHN1bjRpLWdwYWRjLWlpby4KPiA+ID4KPiA+ID4gK2NvbmZpZyBTVU4yMElfR1BBREMK
PiA+ID4gKyAgICAgdHJpc3RhdGUgIlN1cHBvcnQgZm9yIHRoZSBBbGx3aW5uZXIgU29DcyBHUEFE
QyIgIAo+ID4gSSBhcHBsaWVkIHRoaXMgYW5kIHN0YXJ0ZWQgYSBidWlsZCB0ZXN0IGJlZm9yZSBu
b3RpY2luZyB0aGF0IHRoaXMgS2NvbmZpZyBkZXNjcmlwdGlvbgo+ID4gaXMgdmVyeSB2YWd1ZSBh
bmQgbWF0Y2hlcyB0aGUgb25lIGZvciB0aGUgZXhpc3RpbmcgNGkgZHJpdmVyLi4uICAKPiAKPiBJ
bmRlZWQuIEkgbXVzdCBoYXZlIGZvcmdvdHRlbiB0byBjaGFuZ2UgdGhpcyBsaW5lIHdoZW4gY29w
eWluZyBmcm9tIHN1bjRpLi4uCj4gCj4gPiBUaGUgJ1N1cHBvcnQgZm9yIHRoZScgYml0IGFsc28g
aXNuJ3QgYXBwcm9wcmlhdGUgZm9yIHdoYXQgeW91IHNlZSBpbiBtYWtlIG1lbnVjb25maWcKPiA+
IG1lbnUgZXRjLiAgIFBsZWFzZSBjb21lIHVwIHdpdGggc29tZXRoaW5nIGRlc2NyaXB0aXZlLiBN
YXliZQo+ID4gInN1bjIwaSBhbmQgc2ltaWxhciBTb0MgR1BBREMiPwo+ID4KPiA+IEJvbnVzIHBv
aW50cyBpZiB5b3UgY2hhbmdlIHRoZSB0ZXh0IGZvciB0aGUgNGkgYXQgdGhlIHNhbWUgdGltZSB0
byBiZQo+ID4gbW9yZSBtZWFuaW5nZnVsLiBJIGNsZWFybHkgbWlzc2VkIHRoYXQgaW4gcmV2aWV3
IGEgbG9uZyB0aW1lIGFnbyEgIAo+IAo+IFNob3VsZCBJIGRvIHRoaXMgaW4gYSBzZXBhcmF0ZSBw
YXRjaD8KWWVzIHBsZWFzZS4KClRoYW5rcywKCkpvbmF0aGFuCgoKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
