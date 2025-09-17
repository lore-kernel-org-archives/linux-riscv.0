Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4C8DCAC598
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Sep 2025 09:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6T5EGvNNYIsYOntbo5xdd9BgjqnBW3Q9GGNUDqCxRTM=; b=dPTgcogupaYOEl
	3xcRGTv1XU/KV8f6UPO1C2FJyQqja00+fuK2Gc9wQ1+sIfuY94Y8b6yv+1AL/KiCJ6zR9kb86W8CY
	SHVJIDqGhYqxufnWOy2nvYxIuogqtk6n999wbG4/I2racRZTzweFsWmFMuGNq7ADDqVXg7G6TWS6h
	oVa8Vw6wk5+IB/BZG5VzBTAm2Q43D4NcadUgkYNE6Ca4Rk+rJIKl9FLTaUl49pR624iFR6+tgUslF
	gEJI9pK0fNuJdUftvrix2ZysNamwkDDmTyIPwJw7yN9bNznxCwXKUnJ6oytVmefxXX8KMCQW9zfhX
	PYsNMjXw2WtT8rVKWlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyo6f-0000000AjoM-0Pis;
	Wed, 17 Sep 2025 09:05:41 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyo6c-0000000AjnN-074M
	for linux-riscv@lists.infradead.org;
	Wed, 17 Sep 2025 09:05:39 +0000
Received: from localhost (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2D9C6340FEC;
	Wed, 17 Sep 2025 09:05:35 +0000 (UTC)
Date: Wed, 17 Sep 2025 17:05:32 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>,
	paul.walmsley@sifive.com, palmer@dabbelt.com, alex@ghiti.fr,
	aou@eecs.berkeley.edu, conor+dt@kernel.org, krzk+dt@kernel.org,
	robh@kernel.org, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] riscv: dts: spacemit: add UART pinctrl combinations
Message-ID: <20250917090532-GYA1265528@gentoo.org>
References: <20250917065907.160615-1-hendrik.hamerlinck@hammernet.be>
 <F213A85E78015F1A+aMpnVc9S_ynYGDF8@LT-Guozexi>
 <b76520ff-f039-465c-a58d-8f0f37bd1664@hammernet.be>
 <A00BFAFA3FC941AF+aMp0kSc6UkR4QUn4@LT-Guozexi>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <A00BFAFA3FC941AF+aMp0kSc6UkR4QUn4@LT-Guozexi>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_020538_088770_D466B622 
X-CRM114-Status: GOOD (  34.62  )
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

SGkgVHJveSwKCk9uIDE2OjQyIFdlZCAxNyBTZXAgICAgICwgVHJveSBNaXRjaGVsbCB3cm90ZToK
PiBPbiBXZWQsIFNlcCAxNywgMjAyNSBhdCAxMDoxNzoxNkFNICswMjAwLCBIZW5kcmlrIEhhbWVy
bGluY2sgd3JvdGU6Cj4gPiBIZWxsbyBUcm95LAo+ID4gCj4gPiBUaGFuayB5b3UgZm9yIHJldmll
d2luZy4KPiA+IAo+ID4gT24gOS8xNy8yNSAwOTo0NiwgVHJveSBNaXRjaGVsbCB3cm90ZToKPiA+
ID4gSGkgSGVuZHJpaywgVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+ID4gPgo+ID4gPiBPbiBXZWQs
IFNlcCAxNywgMjAyNSBhdCAwODo1OTowN0FNICswMjAwLCBIZW5kcmlrIEhhbWVybGluY2sgd3Jv
dGU6Cj4gPiA+PiBBZGQgVUFSVCBwaW5jdHJsIGNvbmZpZ3VyYXRpb25zIGJhc2VkIG9uIHRoZSBT
b0MgZGF0YXNoZWV0IGFuZCB0aGUKPiA+ID4+IGRvd25zdHJlYW0gQmlhbmJ1IExpbnV4IHRyZWUu
IFRoZSBkcml2ZSBzdHJlbmd0aCB2YWx1ZXMgd2VyZSB0YWtlbiBmcm9tCj4gPiA+PiB0aGUgZG93
bnN0cmVhbSBpbXBsZW1lbnRhdGlvbiwgd2hpY2ggdXNlcyBtZWRpdW0gZHJpdmUgc3RyZW5ndGgu
Cj4gPiA+PiBDVFMvUlRTIGFyZSBtb3ZlZCB0byBzZXBhcmF0ZSAqLWN0cy1ydHMtY2ZnIHN0YXRl
cyBzbyBib2FyZHMgY2FuIGVuYWJsZQo+ID4gPj4gaGFyZHdhcmUgZmxvdyBjb250cm9sIGNvbmRp
dGlvbmFsbHkuCj4gPiA+Pgo+ID4gPj4gU2lnbmVkLW9mZi1ieTogSGVuZHJpayBIYW1lcmxpbmNr
IDxoZW5kcmlrLmhhbWVybGluY2tAaGFtbWVybmV0LmJlPgo+ID4gPj4gUmV2aWV3ZWQtYnk6IFlp
eHVuIExhbiA8ZGxhbkBnZW50b28ub3JnPgo+ID4gPj4gLS0tCj4gPiA+PiBDaGFuZ2VzIGluIHY0
Ogo+ID4gPj4gLSBFeHBsaWNpdGx5IHVzZSAwIGFzIGJpYXMtcHVsbC11cCB2YWx1ZQo+ID4gPj4K
PiA+ID4+IENoYW5nZXMgaW4gdjM6Cj4gPiA+PiAtIEFkZGVkIC9vbWl0LWlmLW5vLXJlZi8gdG8g
cGluY3RybCBzdGF0ZXMgdG8gcmVkdWNlIERUIHNpemUKPiA+ID4+Cj4gPiA+PiBDaGFuZ2VzIGlu
IHYyOgo+ID4gPj4gLSBTcGxpdCBjdHMvcnRzIGludG8gc2VwYXJhdGUgcGluY3RybCBjb25maWdz
IGFzIHN1Z2dlc3RlZAo+ID4gPj4gLSBSZW1vdmVkIG9wdGlvbnMgZnJvbSBib2FyZCBEVFMgZmls
ZXMgdG8ga2VlcCB0aGVtIGNsZWFuZXIKPiA+ID4+IC0tLQo+ID4gPj4gIGFyY2gvcmlzY3YvYm9v
dC9kdHMvc3BhY2VtaXQvazEtcGluY3RybC5kdHNpIHwgNDMwICsrKysrKysrKysrKysrKysrKy0K
PiA+ID4+ICAxIGZpbGUgY2hhbmdlZCwgNDI4IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0p
Cj4gPiA+Pgo+ID4gPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3BhY2VtaXQv
azEtcGluY3RybC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zcGFjZW1pdC9rMS1waW5jdHJs
LmR0c2kKPiA+ID4+ICsJL29taXQtaWYtbm8tcmVmLwo+ID4gPj4gKwl1YXJ0Ml8wX2N0c19ydHNf
Y2ZnOiB1YXJ0Mi0wLWN0cy1ydHMtY2ZnIHsKPiA+ID4+ICsJCXVhcnQyLTAtcGlucyB7Cj4gPiA+
PiArCQkJcGlubXV4ID0gPEsxX1BBRENPTkYoMjMsIDEpPiwJLyogdWFydDJfY3RzICovCj4gPiA+
PiArCQkJCSA8SzFfUEFEQ09ORigyNCwgMSk+OwkvKiB1YXJ0Ml9ydHMgKi8KPiA+ID4+ICsJCQli
aWFzLXB1bGwtdXAgPSA8MD47Cj4gPiA+PiArCQkJZHJpdmUtc3RyZW5ndGggPSA8MzI+Owo+ID4g
Pj4gKwkJfTsKPiA+ID4+ICsJfTsKPiA+ID4gV2UgYXJlIGN1cnJlbnRseSB1c2luZyB0aGUgODI1
MCBVQVJUIGRyaXZlciwgYnV0IGhhcmR3YXJlIGZsb3cgY29udHJvbCBkb2VzIG5vdAo+ID4gPiB3
b3JrIHByb3Blcmx5IG9uIEsxLiBXZSBhcmUgY29uc2lkZXJpbmcgZml4aW5nIHRoaXMgd2hlbiB0
aW1lIHBlcm1pdHMuCj4gPiA+Cj4gPiA+IFNob3VsZCB3ZSBhZGQgYSBjb21tZW50IGhlcmUgdG8g
YXZvaWQgY29uZnVzaW5nIG90aGVycyB3aG8gbWF5IHJ1biBpbnRvIHRoaXM/Cj4gPiA+IElmIHNv
LCBJIHdpbGwgcmVtb3ZlIHRoZSBjb21tZW50IG9uY2UgdGhlIGlzc3VlIGhhcyBiZWVuIGZpeGVk
Lgo+ID4gTm90IHN1cmUgaWYgSeKAmW0gbWlzc2luZyBzb21ldGhpbmcsIGJ1dCBoYXJkd2FyZSBm
bG93IGNvbnRyb2wgc2VlbXMgdG8gd29yawo+ID4gd2l0aCB0aGUgYDgyNTBfb2ZgIGRyaXZlcj8K
PiA+IAo+ID4gT24gYm90aCBlbmRzIEkgY29uZmlndXJlZCB0aGUgcG9ydHMgd2l0aDoKPiA+IGBz
dHR5IC1GIC9kZXYvdHR5UzEgMTE1MjAwIGNydHNjdHMgLWl4b24gLWl4b2ZmIHJhdyAtZWNob2AK
PiA+IAo+ID4gV2l0aCB0aGlzIHNldHVwLCBkYXRhIHNlbnQgd2l0aCBlY2hvIG9ubHkgZ29lcyB0
aHJvdWdoIHdoZW4gdGhlIHBlZXIgaXMKPiA+IGFjdHVhbGx5IHJlYWRpbmcgb24gdGhlIG90aGVy
IHNpZGUsIHdoaWNoIGxvb2tzIGxpa2UgUlRTL0NUUyBpcwo+ID4gZnVuY3Rpb25pbmcgY29ycmVj
dGx5Lgo+IExldCBtZSBjbGFyaWZ5IG15IGVhcmxpZXIgcmVwbHkoSSBoYXZlIGRvdWJsZSBjaGVj
a2VkKToKPiBJdCBpcyBub3QgdGhhdCBoYXJkd2FyZSBmbG93IGNvbnRyb2wgZG9lcyBub3Qgd29y
ayBhdCBhbGwsCj4gYnV0IHJhdGhlciB0aGF0IGl0IGZhaWxzIGludGVybWl0dGVudGx5Lgo+IFRo
ZSBoaWdoZXIgdGhlIGJhdWQgcmF0ZSwgdGhlIHNvb25lciB0aGUgcHJvYmxlbSB0ZW5kcyB0byBz
aG93IHVwLgo+IAo+IEZyb20geW91ciBsb2cgSSBub3RpY2VkIHRoZSBiYXVkIHJhdGUgaXMgMTE1
MjAwLgo+IEF0IHRoaXMgcmF0ZSwgaXQgbWlnaHQgdGFrZSBhIGZ1bGwgZGF5IG9mIGNvbnRpbnVv
dXMgdGVzdGluZyBiZWZvcmUKPiB0aGUgaXNzdWUgYXBwZWFycyAodGhvdWdoIG9mIGNvdXJzZSBp
dCBjb3VsZCBhbHNvIGZhaWwgbXVjaCBzb29uZXIsIHNpbmNlIGl0IGlzIHByb2JhYmlsaXN0aWMp
Lgo+IAo+IFNvIEkgYW0gd29uZGVyaW5nIHdoZXRoZXIgd2Ugc2hvdWxkIGFkZCBhIGNvbW1lbnQg
aGVyZSwKPiBvciBpbnN0ZWFkIHB1dCB0aGUgbm90ZSBpbiB0aGUgVUFSVCBub2RlLgpObywgcGxl
YXNlIHN0YXJ0IGFub3RoZXIgdGhyZWFkIHRvIGFkZHJlc3MgdGhpcyBpc3N1ZSwgZmluZCBhIHNv
bHV0aW9uCmFuZCB0aGVuIGlkZWFsbHkgd29yayBvdXQgYSBwYXRjaCBmb3IgaXQsIGFkZGluZyBj
b21tZW50IGRvZXNuJ3QgcmVhbGx5IGhlbHAuCgpCZXNpZGVzLCB3aGF0IEhlbmRyaWsgZG9pbmcg
aGVyZSBpcyB0byBjb21wbGV0ZSB0aGUgZGVzY3JpcHRpb25zIG9mIFVBUlQgcGluY3RybAp3aGlj
aCBpcyBhIGRpZmZlcmVudCB0aGluZywgbGV0J3Mgbm90IG1peCB0aGVtIHRvZ2V0aGVyLgoKLS0g
CllpeHVuIExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
