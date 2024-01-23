Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1941BC47258
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jan 2024 13:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=07D2mVW3H+Rl7d8WYoqrA9uILwS/UGHKqoTpNpG0GlY=; b=Ea+Xe//pHPhJRP
	TucdXZ4OULZjoQmj9TwkAK7tv34phem7g/k0xsNUqSEjWr93Y/jk1CAK5sqoTNQ01z5A0zIDNfr03
	bp5EhyJDxbVT+nuSjgagSawh028xqaeqAEkUgcLazPbfRXd3nZzsY9DJBkOd2skn5oJuLjXo6edTA
	0MGpePQ5ftJXWV2OZj8F2qZeFZMzrTVVVakG3JK+EJNu2eG2TH2pCKMdYcV+v24HPzZ13RH2hAbSX
	IubmEl6mTZn5lXJuAdkBzKqiYNxc1fnczrZpLsc3jhfGz5ElISvP2mN2nlZbCASzdq8dVpgJSoWFM
	7iOdEYMr9LRwE/9IaeJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rSGpY-00Gbte-2E;
	Tue, 23 Jan 2024 13:28:44 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rSGpV-00Gbs8-1Y;
	Tue, 23 Jan 2024 13:28:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bDhJF4aVPbj4qdYQrzDaOMUJoNeiDqHjPb9iFMH77ME=; b=IdnEp3jBKIndIWP5XIcwMJoMZK
	VXAFBeu/Bv043OgntYF4+y/xj9qap4lxUJj/TR17iVnq4OTkxCGofK+sQd0TfJJd2l7haKwWUVxfU
	ZJf9cDAC9ySAxC+NkZQn2KbyP01YUyuVx2Wd9QLC1WmInPbkvTtHosurY6tHla6fMQSlKB+iOcLw0
	3z1303J4SsJlIPCGZI1Q5n/8BCxks6XJq2hl5U000/f/yLcwbfqMyQRfn7uwgnT5Eo4Oy/uzxSGIX
	3OtPDik/U9GB1G5G40b6fP6tQ/K61kRvCxs7BJHtd+K/BfdeBoFp6jBvSaRd+AiGP0aW5GW3rJGXs
	1F0TkSkg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:42766)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1rSGpM-0002S5-2a;
	Tue, 23 Jan 2024 13:28:32 +0000
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1rSGpL-0001z0-LP; Tue, 23 Jan 2024 13:28:31 +0000
Date: Tue, 23 Jan 2024 13:28:31 +0000
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-pm@vger.kernel.org,
	loongarch@lists.linux.dev, linux-acpi@vger.kernel.org,
	linux-arch@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, kvmarm@lists.linux.dev,
	x86@kernel.org, acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org, linux-parisc@vger.kernel.org,
	Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com, justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: Re: [PATCH RFC v3 05/21] ACPI: Rename ACPI_HOTPLUG_CPU to include
 'present'
Message-ID: <Za++/11n5KA1VS3p@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
 <E1rDOgD-00Dvk2-3h@rmk-PC.armlinux.org.uk>
 <CAJZ5v0g9nfLrEf9u4Ksw6BOWJQ9iv8Z-O8RsLU6jR5zk0ahxRw@mail.gmail.com>
 <20240122180013.000016d5@Huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240122180013.000016d5@Huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240123_052841_517422_E690C1E0 
X-CRM114-Status: GOOD (  35.17  )
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

T24gTW9uLCBKYW4gMjIsIDIwMjQgYXQgMDY6MDA6MTNQTSArMDAwMCwgSm9uYXRoYW4gQ2FtZXJv
biB3cm90ZToKPiBPbiBNb24sIDE4IERlYyAyMDIzIDIxOjM1OjE2ICswMTAwCj4gIlJhZmFlbCBK
LiBXeXNvY2tpIiA8cmFmYWVsQGtlcm5lbC5vcmc+IHdyb3RlOgo+IAo+ID4gT24gV2VkLCBEZWMg
MTMsIDIwMjMgYXQgMTo0OeKAr1BNIFJ1c3NlbGwgS2luZyA8cm1rK2tlcm5lbEBhcm1saW51eC5v
cmcudWs+IHdyb3RlOgo+ID4gPgo+ID4gPiBGcm9tOiBKYW1lcyBNb3JzZSA8amFtZXMubW9yc2VA
YXJtLmNvbT4KPiA+ID4KPiA+ID4gVGhlIGNvZGUgYmVoaW5kIEFDUElfSE9UUExVR19DUFUgYWxs
b3dzIGEgbm90LXByZXNlbnQgQ1BVIHRvIGJlY29tZQo+ID4gPiBwcmVzZW50LiAgCj4gPiAKPiA+
IFJpZ2h0Lgo+ID4gCj4gPiA+IFRoaXMgaXNuJ3QgdGhlIG9ubHkgdXNlIG9mIEhPVFBMVUdfQ1BV
LiBPbiBhcm02NCBhbmQgcmlzY3YKPiA+ID4gQ1BVcyBjYW4gYmUgdGFrZW4gb2ZmbGluZSBhcyBh
IHBvd2VyIHNhdmluZyBtZWFzdXJlLiAgCj4gPiAKPiA+IEJ1dCBzdGlsbCB0aGVyZSBpcyB0aGUg
Y2FzZSBpbiB3aGljaCBhIG5vbi1wcmVzZW50IENQVSBjYW4gYmVjb21lCj4gPiBwcmVzZW50LCBp
c24ndCBpdCB0aGVyZT8KPiAKPiBOb3QgeWV0IGRlZmluZWQgYnkgdGhlIGFyY2hpdGVjdHVyZXMg
KGFuZCBJJ20gYXNzdW1pbmcgaXQgcHJvYmFibHkgbmV2ZXIgd2lsbCBiZSkuCj4gCj4gVGhlIG9y
aWdpbmFsIHByb3Bvc2FsIHdlIHRvb2sgdG8gQVJNIHdhcyB0byBkbyBleGFjdGx5IHRoYXQgLSB0
aGV5IHB1c2hlZAo+IGJhY2sgaGFyZCBvbiB0aGUgYmFzaXMgdGhlcmUgd2FzIG5vIGFyY2hpdGVj
dHVyYWxseSBzYWZlIHdheSB0byBpbXBsZW1lbnQgaXQuCj4gVG9vIG11Y2ggb2YgdGhlIEFSTSBh
cmNoIGhhcyB0byBleGlzdCBmcm9tIHRoZSBzdGFydCBvZiB0aW1lLgo+IAo+IGh0dHBzOi8vbG9y
ZS5rZXJuZWwub3JnL2xpbnV4LWFybS1rZXJuZWwvY2JhYTZkNjgtNjE0My1lMDEwLTVmM2MtZWM2
MmY4NzlhZDk1QGFybS5jb20vCj4gaXMgb25lIG9mIHRoZSByZWxldmFudCB0aHJlYWRzIG9mIHRo
ZSBrZXJuZWwgc2lkZSBvZiB0aGF0IGRpc2N1c3Npb24uCj4gCj4gTm90IHRvIHB1dCBzcGVjaWZp
YyB3b3JkcyBpbnRvIHRoZSBBUk0gYXJjaGl0ZWN0cyBtb3V0aHMsIGJ1dCB0aGUKPiBzaG9ydCBk
ZXNjcmlwdGlvbiBpcyB0aGF0IHRoZXJlIGlzIGN1cnJlbnRseSBubyBkZW1hbmQgZm9yIHdvcmtp
bmcKPiBvdXQgaG93IHRvIG1ha2UgcGh5c2ljYWwgQ1BVIGhvdHBsdWcgcG9zc2libGUsIGFzIHN1
Y2ggdGhleSB3aWxsIG5vdAo+IHByb3ZpZGUgYW4gYXJjaGl0ZWN0dXJhbGx5IGNvbXBsaWFudCB3
YXkgdG8gZG8gaXQgZm9yIHZpcnR1YWwgQ1BVIGhvdHBsdWcgYW5kCj4gYW5vdGhlciBtZWFucyBp
cyBuZWVkZWQgKHdoaWNoIGlzIHdoeSB0aGlzIHNlcmllcyBkb2Vzbid0IHVzZSB0aGUgcHJlc2Vu
dCBiaXQKPiBmb3IgdGhhdCBwdXJwb3NlIGFuZCB3ZSBoYXZlIHRoZSBPbmxpbmUgY2FwYWJsZSBi
aXQgaW4gTUFEVC9HSUNDKQo+IAo+IEl0IHdhcyBhICdmdW4nIGRhbmNlIG9mIHNldmVyYWwgeWVh
cnMgdG8gZ2V0IHRvIHRoYXQgY2xhcmlmaWNhdGlvbi4KPiBBcyBhbm90aGVyIGZ1biBmYWN0LCB0
aGUgc2FtZSBpcyBkZWZpbmVkIGZvciB4ODYsIGJ1dCBJIGRvbid0IHRoaW5rCj4gYW55b25lIGhh
cyB1c2VkIGl0IHlldCAoR0lDQyBmb3IgQVJNIGhhcyBhbiBvbmxpbmUgY2FwYWJsZSBiaXQgaW4g
dGhlIGZsYWdzIHRvCj4gZW5hYmxlIHRoaXMsIHdoaWNoIHdhcyByZW1hcmthYmx5IHNpbWlsYXIg
dG8gdGhlIG9ubGluZSBjYXBhYmxlIGJpdCBpbiB0aGUKPiBmbGFncyBvZiB0aGUgTG9jYWwgQVBJ
QyBlbnRyaWVzIGFzIGFkZGVkIGZhaXJseSByZWNlbnRseSkuCj4gCj4gPiAKPiA+ID4gT24gYXJt
NjQgYW4gb2ZmbGluZSBDUFUgbWF5IGJlIGRpc2FibGVkIGJ5IGZpcm13YXJlLCBwcmV2ZW50aW5n
IGl0IGZyb20KPiA+ID4gYmVpbmcgYnJvdWdodCBiYWNrIG9ubGluZSwgYnV0IGl0IHJlbWFpbnMg
cHJlc2VudCB0aHJvdWdob3V0Lgo+ID4gPgo+ID4gPiBBZGRpbmcgY29kZSB0byBwcmV2ZW50IHVz
ZXItc3BhY2UgdHJ5aW5nIHRvIG9ubGluZSB0aGVzZSBkaXNhYmxlZCBDUFVzCj4gPiA+IG5lZWRz
IHNvbWUgYWRkaXRpb25hbCB0ZXJtaW5vbG9neS4KPiA+ID4KPiA+ID4gUmVuYW1lIHRoZSBLY29u
ZmlnIHN5bWJvbCBDT05GSUdfQUNQSV9IT1RQTFVHX1BSRVNFTlRfQ1BVIHRvIHJlZmxlY3QKPiA+
ID4gdGhhdCBpdCBtYWtlcyBwb3NzaWJsZSBDUFVzIHByZXNlbnQuICAKPiA+IAo+ID4gSG9uZXN0
bHksIEkgZG9uJ3QgdGhpbmsgdGhhdCB0aGlzIGNoYW5nZSBpcyBuZWNlc3Nhcnkgb3IgZXZlbiB1
c2VmdWwuCj4gCj4gV2hpbHN0IGl0J3MgYW4gYXR0ZW1wdCB0byBhdm9pZCBmdXR1cmUgY29uZnVz
aW9uLCB0aGUgcmVuYW1lIGlzCj4gbm90IHNvbWV0aGluZyBJIHJlYWxseSBjYXJlIGFib3V0IHNv
IG15IGFkdmljZSB0byBSdXNzZWxsIGlzIGRyb3AKPiBpdCB1bmxlc3MgeW91IGFyZSBhdHRhY2hl
ZCB0byBpdCEKCldoaWxlIEkgYWdyZWUgdGhhdCBpdCBpc24ndCBhIG5lY2Vzc2l0eSwgSSBkb24n
dCBmdWxseSBhZ3JlZSB0aGF0IGl0Cmlzbid0IHVzZWZ1bC4KCk9uZSBvZiB0aGUgaXNzdWVzIHdp
bGwgYmUgdGhhdCB3aGlsZSBBcm02NCB3aWxsIHN1cHBvcnQgaG90cGx1ZyB2Q1BVLAppdCB3b24n
dCBiZSBzZXR0aW5nIEFDUElfSE9UUExVR19DUFUgYmVjYXVzZSBpdCBkb2Vzbid0IHN1cHBvcnQK
dGhlIHByZXNlbnQgYml0IGNoYW5naW5nLiBTbyBJIGNhbiBzZWUgd2h5IEphbWVzIGRlY2lkZWQg
dG8gcmVuYW1lCml0IC0gYmVjYXVzZSB3aXRoIEFybTY0J3MgaG90cGx1ZyB2Q1BVLCB0aGUgaWRl
YSB0aGF0IEFDUElfSE9UUExVR19DUFUKc29tZWhvdyBlbmFibGVzIGhvdHBsdWcgQ1BVIHN1cHBv
cnQgaXMgbm93IG5vIGxvbmdlciB0cnVlLgoKS2VlcGluZyBpdCBhcyBBQ1BJX0hPVFBMVUdfQ1BV
IG1ha2VzIHRoZSBjb2RlIGxlc3Mgb2J2aW91cywgYmVjYXVzZSBpdApsZWFkcyBvbmUgdG8gYXNz
dW1lIHRoYXQgaXQgb3VnaHQgdG8gYmUgZW5hYmxlZCBmb3IgQXJtNjQncwppbXBsZW1lbnRhdGlu
b24sIGFuZCB0aGF0IGNvdWxkIHdlbGwgY2F1c2UgaXNzdWVzIGluIHRoZSBmdXR1cmUgaWYKcGVv
cGxlIG1ha2UgdGhlIGFzc3VtcHRpb24gdGhhdCAiQUNQSV9IT1RQTFVHX0NQVSIgbWVhbnMgaG90
cGx1ZyBDUFUKaXMgc3VwcG9ydGVkIGluIEFDUEkuIEl0IGRvZXNuJ3QgYW55bW9yZS4KCi0tIApS
TUsncyBQYXRjaCBzeXN0ZW06IGh0dHBzOi8vd3d3LmFybWxpbnV4Lm9yZy51ay9kZXZlbG9wZXIv
cGF0Y2hlcy8KRlRUUCBpcyBoZXJlISA4ME1icHMgZG93biAxME1icHMgdXAuIERlY2VudCBjb25u
ZWN0aXZpdHkgYXQgbGFzdCEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZy
YWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGlu
dXgtcmlzY3YK
