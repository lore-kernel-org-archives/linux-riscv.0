Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C067C77B60
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Mar 2023 16:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TWt2P+HPHL0ORKiEdDbRW/lh4PGaQgIa3gRCIGBKCsM=; b=TywrkLGvL/OWto
	FmAwlI3UdhSDK7JJ5JqshUxcixZ+WtvmsoSNwZr3mXAUL0JQePLOCaXJuvF56IGXigSBKVBPKF2Wx
	prG9pwcg9G7cbw5hRzsOSmCgKckAc6Yiwh/QOzPDqGfYEXeYOXEMTIwDyP2zMp2AdSbDaaxs1DSPd
	Xu+lPMwT+NCwXA3C6ISjajGARIttvPodo/ZLHn4LA7z09TAF+8PuHIpupTmvZ7C8kcA6BnoYduxtS
	A4/nSi2J+eUqRmUv86EL36p5xMVB3d3vecEo49doSBBIZ3DZVm5haGb+DOHfkxV/E7Cd6TLmeWXCz
	42y/Av5qIaYKGmgVHCeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1phvDv-004UnZ-0E;
	Thu, 30 Mar 2023 16:34:03 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1phvDs-004UmK-18;
	Thu, 30 Mar 2023 16:34:00 +0000
Message-ID: <4dbba30e-9c7a-ec73-8a5b-deda182e7f08@infradead.org>
Date: Thu, 30 Mar 2023 09:33:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH] iommu: PGTABLE_LPAE is also for RISCV
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-kernel@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, iommu@lists.linux.dev,
 Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org,
 geert+renesas@glider.be
References: <20230330060105.29460-1-rdunlap@infradead.org>
 <e1b6f12a-899b-4985-8725-556bcb5d0991@spud>
 <CAMuHMdW2r1f7C_BdXn9BnDktLwHjBA_0Kvq6OeLJ1sZ7azhqkg@mail.gmail.com>
 <b712f5c8-9486-8e4a-63cd-6b176572244f@infradead.org>
 <CAMuHMdX_=T9EB=rE_p9XO2-MtaV3jNkX76_PxYd9wi17NhaYHQ@mail.gmail.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAMuHMdX_=T9EB=rE_p9XO2-MtaV3jNkX76_PxYd9wi17NhaYHQ@mail.gmail.com>
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

SGktLQoKT24gMy8zMC8yMyAwOToxMSwgR2VlcnQgVXl0dGVyaG9ldmVuIHdyb3RlOgo+IEhpIFJh
bmR5LAo+IAo+IE9uIFRodSwgTWFyIDMwLCAyMDIzIGF0IDU6NDjigK9QTSBSYW5keSBEdW5sYXAg
PHJkdW5sYXBAaW5mcmFkZWFkLm9yZz4gd3JvdGU6Cj4+IE9uIDMvMzAvMjMgMDA6MzEsIEdlZXJ0
IFV5dHRlcmhvZXZlbiB3cm90ZToKPj4+IE9uIFRodSwgTWFyIDMwLCAyMDIzIGF0IDg6MjXigK9B
TSBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90ZToKPj4+PiBP
biBXZWQsIE1hciAyOSwgMjAyMyBhdCAxMTowMTowNVBNIC0wNzAwLCBSYW5keSBEdW5sYXAgd3Jv
dGU6Cj4+Pj4+IE9uIHJpc2N2NjQsIGxpbnV4LW5leHQtMjAyMzMwMzAgKGFuZCBmb3Igc2V2ZXJh
bCBkYXlzIGVhcmxpZXIpLAo+Pj4+PiB0aGVyZSBpcyBhIGtjb25maWcgd2FybmluZzoKPj4+Pj4K
Pj4+Pj4gV0FSTklORzogdW5tZXQgZGlyZWN0IGRlcGVuZGVuY2llcyBkZXRlY3RlZCBmb3IgSU9N
TVVfSU9fUEdUQUJMRV9MUEFFCj4+Pj4+ICAgRGVwZW5kcyBvbiBbbl06IElPTU1VX1NVUFBPUlQg
Wz15XSAmJiAoQVJNIHx8IEFSTTY0IHx8IENPTVBJTEVfVEVTVCBbPW5dKSAmJiAhR0VORVJJQ19B
VE9NSUM2NCBbPW5dCj4+Pj4+ICAgU2VsZWN0ZWQgYnkgW3ldOgo+Pj4+PiAgIC0gSVBNTVVfVk1T
QSBbPXldICYmIElPTU1VX1NVUFBPUlQgWz15XSAmJiAoQVJDSF9SRU5FU0FTIFs9eV0gfHwgQ09N
UElMRV9URVNUIFs9bl0pICYmICFHRU5FUklDX0FUT01JQzY0IFs9bl0KPj4+Pj4KPj4+Pj4gYW5k
IGJ1aWxkIGVycm9yczoKPj4+Pj4KPj4+Pj4gcmlzY3Y2NC1saW51eC1sZDogZHJpdmVycy9pb21t
dS9pby1wZ3RhYmxlLWFybS5vOiBpbiBmdW5jdGlvbiBgLkwxNDAnOgo+Pj4+PiBpby1wZ3RhYmxl
LWFybS5jOiguaW5pdC50ZXh0KzB4MWU4KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgYWxsb2Nf
aW9fcGd0YWJsZV9vcHMnCj4+Pj4+IHJpc2N2NjQtbGludXgtbGQ6IGRyaXZlcnMvaW9tbXUvaW8t
cGd0YWJsZS1hcm0ubzogaW4gZnVuY3Rpb24gYC5MMTY4JzoKPj4+Pj4gaW8tcGd0YWJsZS1hcm0u
YzooLmluaXQudGV4dCsweGFiMCk6IHVuZGVmaW5lZCByZWZlcmVuY2UgdG8gYGZyZWVfaW9fcGd0
YWJsZV9vcHMnCj4+Pj4+IHJpc2N2NjQtbGludXgtbGQ6IGRyaXZlcnMvaW9tbXUvaXBtbXUtdm1z
YS5vOiBpbiBmdW5jdGlvbiBgLkwxNDAnOgo+Pj4+PiBpcG1tdS12bXNhLmM6KC50ZXh0KzB4YmM0
KTogdW5kZWZpbmVkIHJlZmVyZW5jZSB0byBgZnJlZV9pb19wZ3RhYmxlX29wcycKPj4+Pj4gcmlz
Y3Y2NC1saW51eC1sZDogZHJpdmVycy9pb21tdS9pcG1tdS12bXNhLm86IGluIGZ1bmN0aW9uIGAu
TDAgJzoKPj4+Pj4gaXBtbXUtdm1zYS5jOigudGV4dCsweDE0NWUpOiB1bmRlZmluZWQgcmVmZXJl
bmNlIHRvIGBhbGxvY19pb19wZ3RhYmxlX29wcycKPj4+Pj4KPj4+Pj4gQWRkIFJJU0NWIGFzIGFu
IGFsbG93ZWQgQVJDSCBkZXBlbmRlbmN5IHRvIGZpeCB0aGVzZSBwcm9ibGVtcy4KPj4+Pj4KPj4+
Pj4gRml4ZXM6IGQyODZhNThiYzhmNCAoImlvbW11OiBUaWR5IHVwIGlvLXBndGFibGUgZGVwZW5k
ZW5jaWVzIikKPj4+Pj4gU2lnbmVkLW9mZi1ieTogUmFuZHkgRHVubGFwIDxyZHVubGFwQGluZnJh
ZGVhZC5vcmc+Cj4+Pj4+IENjOiBKb2VyZyBSb2VkZWwgPGpvcm9AOGJ5dGVzLm9yZz4KPj4+Pj4g
Q2M6IFdpbGwgRGVhY29uIDx3aWxsQGtlcm5lbC5vcmc+Cj4+Pj4+IENjOiBSb2JpbiBNdXJwaHkg
PHJvYmluLm11cnBoeUBhcm0uY29tPgo+Pj4+PiBDYzogaW9tbXVAbGlzdHMubGludXguZGV2Cj4+
Pj4+IENjOiBDb25vciBEb29sZXkgPGNvbm9yQGtlcm5lbC5vcmc+Cj4+Pj4+IENjOiBsaW51eC1y
aXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCj4+Pj4+IC0tLQo+Pj4+PiAgZHJpdmVycy9pb21tdS9L
Y29uZmlnIHwgICAgMiArLQo+Pj4+PiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAx
IGRlbGV0aW9uKC0pCj4+Pj4+Cj4+Pj4+IGRpZmYgLS0gYS9kcml2ZXJzL2lvbW11L0tjb25maWcg
Yi9kcml2ZXJzL2lvbW11L0tjb25maWcKPj4+Pj4gLS0tIGEvZHJpdmVycy9pb21tdS9LY29uZmln
Cj4+Pj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvS2NvbmZpZwo+Pj4+PiBAQCAtMzIsNyArMzIsNyBA
QCBjb25maWcgSU9NTVVfSU9fUEdUQUJMRQo+Pj4+PiAgY29uZmlnIElPTU1VX0lPX1BHVEFCTEVf
TFBBRQo+Pj4+PiAgICAgICBib29sICJBUk12Ny92OCBMb25nIERlc2NyaXB0b3IgRm9ybWF0Igo+
Pj4+Cj4+Pj4gSSdtIHByb2JhYmx5IG1pc3Npbmcgc29tZXRoaW5nIGhlcmUsIGJ1dCB3aHkgd291
bGQgd2Ugd2FudCB0byBlbmFibGUKPj4+PiAiQVJNdjcvdjggTG9uZyBEZXNjcmlwdG9yIEZvcm1h
dCIgb24gUklTQy1WPwo+Pj4KPj4+IEluZGVlZCwgd2Ugc2hvdWxkIG5vdCBlbmFibGUgaXQsIHVu
bGVzcyBjb21waWxlLXRlc3RpbmcuCj4+Pgo+Pj4+IFdvdWxkIGl0IG5vdCBiZSBiZXR0ZXIgdG8g
bWFrZSB0aGUgUmVuZXNhcyBkZXBlbmQgb24sIHJhdGhlciB0aGFuCj4+Pj4gc2VsZWN0IHRoZSBv
cHRpb24/IEl0IGRvZXMgc2VlbSBoaWdobHkgYXJjaCBzcGVjaWZpYywgYW5kIEkgZmVlbCBsaWtl
Cj4+Pj4gR2VlcnQgcHJldmlvdXNseSBtZW50aW9uZWQgdGhhdCB0aGUgUlovRml2ZSAodGhlaXIg
UklTQy1WIG9mZmVyaW5nKQo+Pj4+IGRpZG4ndCB1c2UgaXQuCj4+Pgo+Pj4gSSB0aGluayB0aGUg
SVBNTVVfVk1TQSBkZXBlbmRlbmN5IHNob3VsZCBnYWluCj4+Pgo+Pj4gICAgICAgICBkZXBlbmRz
IG9uIEFSTSB8fCBBUk02NCB8fCBDT01QSUxFX1RFU1QKPj4KPj4gc28gbGlrZSB0aGlzPwo+PiBP
ciBkaWQgeW91IG1lYW4gdG8gZHJvcCB0aGUgQVJDSF9SRU5FU0FTIHBhcnQgYWxzbz8KPj4KPj4K
Pj4gIGNvbmZpZyBJUE1NVV9WTVNBCj4+ICAgICAgICAgYm9vbCAiUmVuZXNhcyBWTVNBLWNvbXBh
dGlibGUgSVBNTVUiCj4+IC0gICAgICAgZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQ09NUElM
RV9URVNUCj4+ICsgICAgICAgZGVwZW5kcyBvbiBBUkNIX1JFTkVTQVMgfHwgQVJNIHx8IEFSTTY0
IHx8IENPTVBJTEVfVEVTVAo+IAo+IE5vLCB5b3Ugd2FudCAiZGVwZW5kcyBvbiAoQVJDSF9SRU5F
U0FTICYmIChBUk0gfHwgQVJNNjQpKSB8fCBDT01QSUxFX1RFU1QiLAo+IHdoaWNoIGlzIGEgYml0
IGhhcmQgdG8gcmVhZC4KPiAKPiBIZW5jZSBJIHJlYWxseSBtZWFudCBhZGRpbmcgdGhhdCBsaW5l
LCBpLmUuOgo+IAo+ICAgICAgY29uZmlnIElQTU1VX1ZNU0EKPiAgICAgICAgICAgIGJvb2wgIlJl
bmVzYXMgVk1TQS1jb21wYXRpYmxlIElQTU1VIgo+ICAgICAgICAgICAgZGVwZW5kcyBvbiBBUkNI
X1JFTkVTQVMgfHwgQ09NUElMRV9URVNUCj4gICAgICsgICAgICBkZXBlbmRzIG9uIEFSTSB8fCBB
Uk02NCB8fCBDT01QSUxFX1RFU1QKPiAKCk9LLCB0aGF0IGZpeGVzIHRoZSBrY29uZmlnIHdhcm5p
bmcgYW5kIHRoZSBidWlsZCBlcnJvcnMuCkkgY2FuIHJlYWQgdGhlIGZpcnN0IG1ldGhvZCBlYXNp
ZXIgdGhhdCB0aGUgc2Vjb25kIG9uZSwgYnV0IEknbGwKZ28gd2l0aCB5b3VyIHN1Z2dlc3Rpb24u
IEhvcGVmdWxseSBubyBvbmUgd2lsbCBjb21lIGFsb25nIGFuZAoiZml4IGl0IHVwIiBidXQgaW5z
dGVhZCBtdWNrIGl0IHVwLgoKVGhhbmtzLgotLSAKflJhbmR5CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
