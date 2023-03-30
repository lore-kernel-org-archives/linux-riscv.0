Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91191C761A6
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 10:43:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjLn09FG4ZlG+oyCoy9yHDtLMRRXqYHE709U3sX56qs=; b=S+xpjnYHoiBBAZ
	p1l6rWsva+lZB8ly2kdTAkGsqq/VUA/6ZNeexE6ZurlE+xKxbSZrr+7eWQT0lyUgNpjeQeF2+wztc
	+CTGLY1GsGAyg2U2AYHw8KnDrf2y+ymMDCSWN50WkkXZLCb/uEjo214cp/VqfkC4dYG6gpLKrhPTc
	IXinNhvQ/hykp+gTCFdIv1zYMf74q7FxOXWl1pbyhb47gqOxa4tsrFI97ZWVrpwOkyIHlNXHw73yj
	WzXzEN4GM0NYEM86lx3vKKPyP/Jv8RfdYKNXpJ91yPDqgIYtlGE1ZDMyRN2lYXC0r8cmkjM7sU+MD
	TLxC4QI2ZXr9wouPVKAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phpks-003Vot-0p;
	Thu, 30 Mar 2023 10:43:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phpko-003Vn2-3B
	for linux-riscv@lists.infradead.org;
	Thu, 30 Mar 2023 10:43:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 185102F4;
	Thu, 30 Mar 2023 03:44:21 -0700 (PDT)
Received: from [10.57.54.254] (unknown [10.57.54.254])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 419A43F663;
	Thu, 30 Mar 2023 03:43:35 -0700 (PDT)
Message-ID: <068c45ae-dd60-7ab6-ee08-64f95a85f510@arm.com>
Date: Thu, 30 Mar 2023 11:43:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
Content-Language: en-GB
To: Geert Uytterhoeven <geert@linux-m68k.org>,
 Conor Dooley <conor.dooley@microchip.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 iommu@lists.linux.dev, Conor Dooley <conor@kernel.org>,
 linux-riscv@lists.infradead.org, geert+renesas@glider.be
References: <20230330060105.29460-1-rdunlap@infradead.org>
 <e1b6f12a-899b-4985-8725-556bcb5d0991@spud>
 <CAMuHMdW2r1f7C_BdXn9BnDktLwHjBA_0Kvq6OeLJ1sZ7azhqkg@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
In-Reply-To: <CAMuHMdW2r1f7C_BdXn9BnDktLwHjBA_0Kvq6OeLJ1sZ7azhqkg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230330_034339_116998_F7AF5C7E 
X-CRM114-Status: GOOD (  19.36  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gMjAyMy0wMy0zMCAwODozMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIENvbm9y
LAo+IAo+IE9uIFRodSwgTWFyIDMwLCAyMDIzIGF0IDg6MjXigK9BTSBDb25vciBEb29sZXkgPGNv
bm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPj4gT24gV2VkLCBNYXIgMjksIDIwMjMg
YXQgMTE6MDE6MDVQTSAtMDcwMCwgUmFuZHkgRHVubGFwIHdyb3RlOgo+Pj4gT24gcmlzY3Y2NCwg
bGludXgtbmV4dC0yMDIzMzAzMCAoYW5kIGZvciBzZXZlcmFsIGRheXMgZWFybGllciksCj4+PiB0
aGVyZSBpcyBhIGtjb25maWcgd2FybmluZzoKPj4+Cj4+PiBXQVJOSU5HOiB1bm1ldCBkaXJlY3Qg
ZGVwZW5kZW5jaWVzIGRldGVjdGVkIGZvciBJT01NVV9JT19QR1RBQkxFX0xQQUUKPj4+ICAgIERl
cGVuZHMgb24gW25dOiBJT01NVV9TVVBQT1JUIFs9eV0gJiYgKEFSTSB8fCBBUk02NCB8fCBDT01Q
SUxFX1RFU1QgWz1uXSkgJiYgIUdFTkVSSUNfQVRPTUlDNjQgWz1uXQo+Pj4gICAgU2VsZWN0ZWQg
YnkgW3ldOgo+Pj4gICAgLSBJUE1NVV9WTVNBIFs9eV0gJiYgSU9NTVVfU1VQUE9SVCBbPXldICYm
IChBUkNIX1JFTkVTQVMgWz15XSB8fCBDT01QSUxFX1RFU1QgWz1uXSkgJiYgIUdFTkVSSUNfQVRP
TUlDNjQgWz1uXQo+Pj4KPj4+IGFuZCBidWlsZCBlcnJvcnM6Cj4+Pgo+Pj4gcmlzY3Y2NC1saW51
eC1sZDogZHJpdmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5vOiBpbiBmdW5jdGlvbiBgLkwxNDAn
Ogo+Pj4gaW8tcGd0YWJsZS1hcm0uYzooLmluaXQudGV4dCsweDFlOCk6IHVuZGVmaW5lZCByZWZl
cmVuY2UgdG8gYGFsbG9jX2lvX3BndGFibGVfb3BzJwo+Pj4gcmlzY3Y2NC1saW51eC1sZDogZHJp
dmVycy9pb21tdS9pby1wZ3RhYmxlLWFybS5vOiBpbiBmdW5jdGlvbiBgLkwxNjgnOgo+Pj4gaW8t
cGd0YWJsZS1hcm0uYzooLmluaXQudGV4dCsweGFiMCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8g
YGZyZWVfaW9fcGd0YWJsZV9vcHMnCj4+PiByaXNjdjY0LWxpbnV4LWxkOiBkcml2ZXJzL2lvbW11
L2lwbW11LXZtc2EubzogaW4gZnVuY3Rpb24gYC5MMTQwJzoKPj4+IGlwbW11LXZtc2EuYzooLnRl
eHQrMHhiYzQpOiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvIGBmcmVlX2lvX3BndGFibGVfb3BzJwo+
Pj4gcmlzY3Y2NC1saW51eC1sZDogZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLm86IGluIGZ1bmN0
aW9uIGAuTDAgJzoKPj4+IGlwbW11LXZtc2EuYzooLnRleHQrMHgxNDVlKTogdW5kZWZpbmVkIHJl
ZmVyZW5jZSB0byBgYWxsb2NfaW9fcGd0YWJsZV9vcHMnCj4+Pgo+Pj4gQWRkIFJJU0NWIGFzIGFu
IGFsbG93ZWQgQVJDSCBkZXBlbmRlbmN5IHRvIGZpeCB0aGVzZSBwcm9ibGVtcy4KPj4+Cj4+PiBG
aXhlczogZDI4NmE1OGJjOGY0ICgiaW9tbXU6IFRpZHkgdXAgaW8tcGd0YWJsZSBkZXBlbmRlbmNp
ZXMiKQo+Pj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJhZGVhZC5v
cmc+Cj4+PiBDYzogSm9lcmcgUm9lZGVsIDxqb3JvQDhieXRlcy5vcmc+Cj4+PiBDYzogV2lsbCBE
ZWFjb24gPHdpbGxAa2VybmVsLm9yZz4KPj4+IENjOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBo
eUBhcm0uY29tPgo+Pj4gQ2M6IGlvbW11QGxpc3RzLmxpbnV4LmRldgo+Pj4gQ2M6IENvbm9yIERv
b2xleSA8Y29ub3JAa2VybmVsLm9yZz4KPj4+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCj4+PiAtLS0KPj4+ICAgZHJpdmVycy9pb21tdS9LY29uZmlnIHwgICAgMiArLQo+Pj4g
ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKPj4+Cj4+PiBk
aWZmIC0tIGEvZHJpdmVycy9pb21tdS9LY29uZmlnIGIvZHJpdmVycy9pb21tdS9LY29uZmlnCj4+
PiAtLS0gYS9kcml2ZXJzL2lvbW11L0tjb25maWcKPj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvS2Nv
bmZpZwo+Pj4gQEAgLTMyLDcgKzMyLDcgQEAgY29uZmlnIElPTU1VX0lPX1BHVEFCTEUKPj4+ICAg
Y29uZmlnIElPTU1VX0lPX1BHVEFCTEVfTFBBRQo+Pj4gICAgICAgIGJvb2wgIkFSTXY3L3Y4IExv
bmcgRGVzY3JpcHRvciBGb3JtYXQiCj4+Cj4+IEknbSBwcm9iYWJseSBtaXNzaW5nIHNvbWV0aGlu
ZyBoZXJlLCBidXQgd2h5IHdvdWxkIHdlIHdhbnQgdG8gZW5hYmxlCj4+ICJBUk12Ny92OCBMb25n
IERlc2NyaXB0b3IgRm9ybWF0IiBvbiBSSVNDLVY/Cj4gCj4gSW5kZWVkLCB3ZSBzaG91bGQgbm90
IGVuYWJsZSBpdCwgdW5sZXNzIGNvbXBpbGUtdGVzdGluZy4KPiAKPj4gV291bGQgaXQgbm90IGJl
IGJldHRlciB0byBtYWtlIHRoZSBSZW5lc2FzIGRlcGVuZCBvbiwgcmF0aGVyIHRoYW4KPj4gc2Vs
ZWN0IHRoZSBvcHRpb24/IEl0IGRvZXMgc2VlbSBoaWdobHkgYXJjaCBzcGVjaWZpYywgYW5kIEkg
ZmVlbCBsaWtlCj4+IEdlZXJ0IHByZXZpb3VzbHkgbWVudGlvbmVkIHRoYXQgdGhlIFJaL0ZpdmUg
KHRoZWlyIFJJU0MtViBvZmZlcmluZykKPj4gZGlkbid0IHVzZSBpdC4KPiAKPiBJIHRoaW5rIHRo
ZSBJUE1NVV9WTVNBIGRlcGVuZGVuY3kgc2hvdWxkIGdhaW4KPiAKPiAgICAgICAgICBkZXBlbmRz
IG9uIEFSTSB8fCBBUk02NCB8fCBDT01QSUxFX1RFU1QKCkluZGVlZCwgSSB0aG91Z2h0IHdlJ2Qg
c2V0dGxlZCBvbiBzb21ldGhpbmcgbGlrZSB0aGF0IGluIHRoZSBwcmV2aW91cyAKdGhyZWFkKHMp
IG9uIEFSQ0hfUkVORVNBUyB2cy4gUlYzMiwgYnV0IEkgZ3Vlc3Mgbm9ib2R5IGdvdCByb3VuZCB0
byAKYWN0dWFsbHkgcmVzcGluaW5uZyB0aGUgcGF0Y2ggKHBvc3NpYmx5IHNpbmNlIG15IHJlZmFj
dG9yaW5nIGhlcmUgZW5kZWQgCnVwIHBhcGVyaW5nIG92ZXIgdGhlIGltbWVkaWF0ZSBSVjMyIGlz
c3VlKS4KCkNoZWVycywKUm9iaW4uCgo+Pj4gICAgICAgIHNlbGVjdCBJT01NVV9JT19QR1RBQkxF
Cj4+PiAtICAgICBkZXBlbmRzIG9uIEFSTSB8fCBBUk02NCB8fCBDT01QSUxFX1RFU1QKPj4+ICsg
ICAgIGRlcGVuZHMgb24gQVJNIHx8IEFSTTY0IHx8IFJJU0NWIHx8IENPTVBJTEVfVEVTVAo+Pj4g
ICAgICAgIGRlcGVuZHMgb24gIUdFTkVSSUNfQVRPTUlDNjQgICAgIyBmb3IgY21weGNoZzY0KCkK
Pj4+ICAgICAgICBoZWxwCj4+PiAgICAgICAgICBFbmFibGUgc3VwcG9ydCBmb3IgdGhlIEFSTSBs
b25nIGRlc2NyaXB0b3IgcGFnZXRhYmxlIGZvcm1hdC4KPiAKPiBHcntvZXRqZSxlZXRpbmd9cywK
PiAKPiAgICAgICAgICAgICAgICAgICAgICAgICAgR2VlcnQKPiAKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdAps
aW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3Jn
L21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
