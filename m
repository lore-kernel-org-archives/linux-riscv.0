Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E3BC369BD
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Apr 2025 15:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:From:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=L6puTe1yvIzGpKnXUrSEIECTzi70Wdi9zhfWzbwHZ88=; b=i5ZK1oaixYmN6J
	KbyNan/A9VFC8XZ+MLroIxiXNLc5+TVWTzR45I4snQNTdzzs4Ry5cPG9wDbIPgsJnUEswXvm2c69n
	tDy0u5B8+HWn4MMZ6sTBqlIcqZS0RM49R3TYmqNnp7PUAuI3ypf2F28x78qD3nb9jeOSUtzujDiw3
	xYRxtexp0iyo/uGJgQJS6L94MD+dBYgvepLN6fs4ROBG6u46F9HfWl1fFmHaCmXUg2HlGqYUpyoDN
	pOoVUsl3Eu6LmEeIUaAj5YUhFNe8qX6F7+UO1KqpO9yeE3+SEOChnUtKtLFcBil64NFH40Ku08bUc
	FxsYgZU0z6JLD7pmfUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u54SV-0000000A2FZ-2eKh;
	Wed, 16 Apr 2025 15:13:51 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u53hQ-00000009sSl-0oKm
	for linux-riscv@lists.infradead.org;
	Wed, 16 Apr 2025 14:25:15 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250416142506euoutp02581634b4595e7430a2e4793c31d3e7d4~20qPc1gtS2847428474euoutp02C
	for <linux-riscv@lists.infradead.org>; Wed, 16 Apr 2025 14:25:06 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250416142506euoutp02581634b4595e7430a2e4793c31d3e7d4~20qPc1gtS2847428474euoutp02C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1744813506;
	bh=shUz1heMGc/0v/n7nVwvI1VZPkVH2FhMEMQCajNspuE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=BpubTfbnQgjjSza7H4yjO/XIeP8cXOxKjl0xBMHGiUDLBUbzqldxyeSmsHvLIMiq2
	 Zstd/bo4e6yO78TwiJ5P+KRPHgxU81vlaVylfS0g/1XaD4Fc1vIpekKmV9s2jXubY5
	 R2bPCt4tkJHYCvgSjOoQH78oAb3MAAOxCqagHmTA=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250416142506eucas1p19fe6562f1fa472d4cdf730e6001208f4~20qOyJNCI0172801728eucas1p16;
	Wed, 16 Apr 2025 14:25:06 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id C1.88.20409.1CDBFF76; Wed, 16
	Apr 2025 15:25:06 +0100 (BST)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250416142505eucas1p2fffb9ed80d3741d3f8f0c32fa47d1b82~20qOTfI982575125751eucas1p2H;
	Wed, 16 Apr 2025 14:25:05 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250416142505eusmtrp1a1daf89c1b4ba691b759c376629cb1b0~20qOSm5Po0635206352eusmtrp1r;
	Wed, 16 Apr 2025 14:25:05 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-e3-67ffbdc124c3
Received: from eusmtip1.samsung.com ( [203.254.199.221]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id CD.B1.19654.1CDBFF76; Wed, 16
	Apr 2025 15:25:05 +0100 (BST)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250416142504eusmtip179c28fc737df25cb9be21b56335766a6~20qNAXxzq1603616036eusmtip1y;
	Wed, 16 Apr 2025 14:25:04 +0000 (GMT)
Message-ID: <60914de9-f507-4099-be53-ea1fc282c537@samsung.com>
Date: Wed, 16 Apr 2025 16:25:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/21] drm/imagination: Add reset controller support
 for GPU initialization
To: frank.binns@imgtec.com, matt.coster@imgtec.com
Cc: p.zabel@pengutronix.de, m.szyprowski@samsung.com,
	linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org,
	mripard@kernel.org, linux-kernel@vger.kernel.org, tzimmermann@suse.de,
	linux-riscv@lists.infradead.org, airlied@gmail.com, simona@ffwll.ch,
	aou@eecs.berkeley.edu, dri-devel@lists.freedesktop.org,
	ulf.hansson@linaro.org, linux-pm@vger.kernel.org, jszhang@kernel.org,
	palmer@dabbelt.com, guoren@kernel.org, maarten.lankhorst@linux.intel.com,
	wefu@redhat.com, paul.walmsley@sifive.com, jassisinghbrar@gmail.com,
	drew@pdp7.com, robh@kernel.org, sboyd@kernel.org, mturquette@baylibre.com,
	krzk+dt@kernel.org
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20250219140239.1378758-14-m.wilczynski@samsung.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA02SbUxTVxjHd+69vbd0K7sWNo5MR1K3ZRsTGWHxiMZh4rL7ZTr8AMZl2Gpv
	KpEW1sLGHAnMAiqUQXEKlg6Yc0IIHeN1wKiM2lHkpYrKi4QWiDVQxstqAccQGOXOjW+/83/+
	z/k/z8nh46JfyUB+nDKJVSml8WJSQDR2LNl2mk1r8tD7Ghx1Dl7FUMOynkJVJhuGSi02HnLc
	rcfQ/YU5Ev306A6FJk1fE2ig4jsKaTqqSeTSO0jk1jp46F6LgUSeXAtAjZ4MEhktdgp9724g
	0LWmFoCyLlznob6uD5Dd0Ukg1z0tjrL0L6K11iYKrQ7UEKh4to1C9dM6HrIaY1BG27dE5HZm
	biiTYqZdLoK5eX6eYkyLZQTTrLdTjLa5BzC1lRdIZmSglWRKbkUxozlWjKm7lsZkGDswJm8l
	lJm70U8y39RXAuauZpD6WHRMsE/Gxsd9zqp27ZcITuVop8hE4wspmjs/gnSgE2QDHz6kw6F1
	ScfzsoiuANDSfiQbCNZ5HsDf+h9TXMEDoLY86lnD5eUiHmcqXzedHQfcYQbAh08XMK9LSO+H
	cw7DBhP063BqwkZy+hZ464qT8PJLdBAcHS7aSPCjZXBwbRR42Z8OgznpGYT3UpzO5kFTS/VG
	AacD4LCzdONSct00Vl66Pgaf70MfgFdqYzlLENQ0FOPeXkj3CmDh9Zs8buyD8E+XBnDsB6es
	9RTH22D3RS3BcQIca3iMc5wKm7XWf3kvHLH9TXqzcPotWN2yi5MPwPTZPswrQ9oXDs1s4Ubw
	hQWNhTgnC+H5LBHnfgNe0ub+F2qraMTygVi/6VH0m3bUb1pG/39uGSAqQQCbrFbIWXWYkv0i
	RC1VqJOV8pCTCYpasP6/u1et802gfModYgYYH5gB5ONif6Ft96pcJJRJvzzDqhKOq5LjWbUZ
	vMInxAHCq22ZchEtlyaxp1k2kVU9q2J8n8B0LLJQKIt+P9gjyOIfeijBHvQk1Sk+2arbcbvb
	/fS1Avt8TVFY3YSfaWDnZxMpsZRlz+HQ3DbXV2eqfkbsSpDnyavFEl2MIF9RdvbNscXdCrt4
	bU/CDVnmovFJQ7T9r99jpiMkk+UDNQcvnavk/dI1XoWUXZOBNTNbH7zcviNvqUjtLH5HdzHC
	VlG3fTjV0Os5asxxrj5K7ZuMPLZymddaGJE1Hjx9Ynnwo5K05xbjJO7Skfay8NgTf5j3OmaP
	FCQesoQP5UTJbB/6LzkzJUc7e94zLEyc7Ld+6ru2+MO59pLT+Z2hjpZKezRIsVdvG+/1Sdt3
	2JB3O/J5hcifDQk+3tcfLibUp6Tvvo2r1NJ/AMaqa21OBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRjvu71738Gx42WM4z2uRHdy3Vm+bIOx7zwk7drdm16X/lFdFtmE
	143cGO2HaXclNWbIKEQ9nBMZKJoQk6QxkRzImiCosFSGURteUroFLcLsZMYa23Xx3+eez6/n
	nnvYTO4YK4tdVq6nteVyFR9NRq4tDvnXDriiCsHlqWx4deIkA3ZHrBjscI0yoM0zyoKBmw4G
	vP1XGIXnfvFi8IHrEwT6zp7AoHGwE4VBawCFc7UBFrzV24jC+c89ADrnq1Bo9/gx2DLXjcDW
	nl4A9x84w4Lfj8igP3AVgcFbtUy435oKo5d6MLjoO4/A47/3Y9AxU8+CQ/Y3YFX/EWTDM1T4
	jgmjZoJBhPqu+iFGuR41I9RFqx+jai9eB1RX+wGU+sl3CaWahrdSU+YhBvVN6z6qyj7IoOr+
	EVDhvnGU+sLRDqibxglsC3cbWajVGPT0SqVGp1/Pf0sIRaRQCklRvpQU5kmK14nE/NyiwlJa
	Vbab1uYWvUsqzbUhtMKessfoPQ0qQX1yDUhiE3g+0RCxsGpAMpuLnwZEzY0QSBBPEz5zEEng
	dOKJrwZNiH4DxLDVHSc4eBERDjQyljCC5xCh+6NoYp5GDB+bjmsy8GxiatKCLeF0vJSYiE7F
	C3i4iDBXViFLoUy8hkVM986ARMMIIFofm+IqJp5JTE7b4g1ozHH3S1tsVzY7Cd9IHOt6Zwky
	8WeJziZuQp1NGLuPMw8CrnXZGtZlQdb/HdZljmaAtAMebdCpFWqdiNTJ1TpDuYIs0ai7QOyz
	nIOPHT2gLTRHugGDDdyAYDP5PM6oZFHB5ZTK935IazXbtQYVrXMDcewU9cysjBJN7DXL9duF
	BQKxML9AKhBLC/L4mRz09thOLq6Q6+ldNF1Ba//zMdhJWZUMBe/RhRu1Ty1+fXj2R62gEvS5
	nKslppSo4H2Kfv0DR15K6uTz69X3VXV/SNddf+9BGJmrJv9Ene49TEvftcD5wc41/W92HLqL
	oNTagVNve3wl3isPF7ZFGzc7J8dsfY0tfnuhbNVXv86zHRRd3XnH/Gqyvvijww2Zr/2wcOiM
	TGLyXvlsc1rGt+KBFQt9nLKNxgrZuaNP+G2Wv2eP0htcz6168VOTR5W9e4f1ZEPW+I6ijoOp
	FwwFL4w0paWckpxAc/faxiI5ZBGxRRk5+/J4pE6TuikHbl2Z3nvZ8jMv9NKmthWzO8eR1cWv
	fHykZVq4Sylr2Fd/L83v9jbfG5FIOWGSj+iUcuEaplYn/xdqyz204gMAAA==
X-CMS-MailID: 20250416142505eucas1p2fffb9ed80d3741d3f8f0c32fa47d1b82
X-Msg-Generator: CA
X-RootMTR: 20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
	<CGME20250219140306eucas1p19ba425ddb1e499ef1014b1665be9de8e@eucas1p1.samsung.com>
	<20250219140239.1378758-14-m.wilczynski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_072512_496140_8A1EDFE0 
X-CRM114-Status: GOOD (  16.46  )
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

CgpPbiAyLzE5LzI1IDE1OjAyLCBNaWNoYWwgV2lsY3p5bnNraSB3cm90ZToKPiBBbGwgSU1HIFJv
Z3VlIEdQVXMgaW5jbHVkZSBhIHJlc2V0IGxpbmUgdGhhdCBwYXJ0aWNpcGF0ZXMgaW4gdGhlCj4g
cG93ZXItdXAgc2VxdWVuY2UuIE9uIHNvbWUgU29DcyAoZS5nLiwgVC1IZWFkIFRIMTUyMCBhbmQg
QmFuYW5hIFBpCj4gQlBJLUYzKSwgdGhpcyByZXNldCBsaW5lIGlzIGV4cG9zZWQgYW5kIG11c3Qg
YmUgZHJpdmVuIGV4cGxpY2l0bHkgdG8KPiBlbnN1cmUgcHJvcGVyIGluaXRpYWxpemF0aW9uLiAg
T24gb3RoZXJzLCBzdWNoIGFzIHRoZSBjdXJyZW50bHkKPiBzdXBwb3J0ZWQgVEkgU29DLCB0aGUg
cmVzZXQgbG9naWMgaXMgaGFuZGxlZCBpbiBoYXJkd2FyZSBvciBmaXJtd2FyZQo+IHdpdGhvdXQg
ZXhwb3NpbmcgdGhlIGxpbmUgZGlyZWN0bHkuIEluIHBsYXRmb3JtcyB3aGVyZSB0aGUgcmVzZXQg
bGluZSBpcwo+IGV4dGVybmFsbHkgYWNjZXNzaWJsZSwgaWYgaXQgaXMgbm90IGRyaXZlbiBjb3Jy
ZWN0bHksIHRoZSBHUFUgbWF5IHJlbWFpbgo+IGluIGFuIHVuZGVmaW5lZCBzdGF0ZSwgbGVhZGlu
ZyB0byBpbnN0YWJpbGl0eSBvciBwZXJmb3JtYW5jZSBpc3N1ZXMuCj4gCj4gVGhpcyBjb21taXQg
YWRkcyBhIGRlZGljYXRlZCByZXNldCBjb250cm9sbGVyIHRvIHRoZSBkcm0vaW1hZ2luYXRpb24K
PiBkcml2ZXIuICBCeSBtYW5hZ2luZyB0aGUgcmVzZXQgbGluZSAod2hlcmUgYXBwbGljYWJsZSkg
YXMgcGFydCBvZiBub3JtYWwKPiBHUFUgYnJpbmctdXAsIHRoZSBkcml2ZXIgZW5zdXJlcyByZWxp
YWJsZSBpbml0aWFsaXphdGlvbiBhY3Jvc3MKPiBwbGF0Zm9ybXMgcmVnYXJkbGVzcyBvZiB3aGV0
aGVyIHRoZSByZXNldCBpcyBjb250cm9sbGVkIGV4dGVybmFsbHkgb3IKPiBoYW5kbGVkIGludGVy
bmFsbHkuCj4gCj4gU2lnbmVkLW9mZi1ieTogTWljaGFsIFdpbGN6eW5za2kgPG0ud2lsY3p5bnNr
aUBzYW1zdW5nLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9ncHUvZHJtL2ltYWdpbmF0aW9uL3B2cl9k
ZXZpY2UuYyB8IDIxICsrKysrKysrKysrKysrKysrKysrKwo+ICBkcml2ZXJzL2dwdS9kcm0vaW1h
Z2luYXRpb24vcHZyX2RldmljZS5oIHwgIDkgKysrKysrKysrCj4gIGRyaXZlcnMvZ3B1L2RybS9p
bWFnaW5hdGlvbi9wdnJfcG93ZXIuYyAgfCAyMiArKysrKysrKysrKysrKysrKysrKystCj4gIDMg
ZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+IAoKSGkgTWF0
dCwKClRoaXMgY29tbWl0LCBhbG9uZyB3aXRoIHRoZSBjb3JyZXNwb25kaW5nIGNoYW5nZSBpbiB0
aGUgRFQgYmluZGluZ3MsCmRvZXNu4oCZdCBhcHBlYXIgdG8gY29uZmxpY3Qgd2l0aCB0aGUgd29y
ayB5b3UncmUgZG9pbmcgZm9yIFJvZ3VlIHNlcmllcwplbmFibGVtZW50LgoKV291bGQgeW91IHBy
ZWZlciBpZiBJIHJlLXNlbmQgdGhlbSBhcyBhIG1pbmktc2VyaWVzIHNvIHlvdSBjYW4gY29uc2lk
ZXIKcGlja2luZyB0aGVtIHVwIGZvciB0aGUgbmV4dCBrZXJuZWwgcmVsZWFzZT8KClJlZ2FyZHMs
Ck1pY2hhxYIKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
CmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3Jn
Cmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
