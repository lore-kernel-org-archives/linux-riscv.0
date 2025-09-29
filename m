Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CCF7CAC5B5
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Sep 2025 14:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X6QMXco2WCqDuwppM4T3eiUVQRrOGmWZaXTpcuODBV0=; b=m4xVHYqbDkhjDc
	rwYlMUMxuDxpZGRPdRx7Qr6yWTn7XuVlIGCPtdMlA8/egkf+1sYmRdSuFMW70qP+17Yn39UkIYt+1
	u902XlVPYw3HxJ79Ubo4vFinFQ8i0m2fR7/7h0M2kOLQdTyr4ItNRFTzJNWQ5zmo749fAAMtqGrMr
	R+uyW7Fi+5yr2S5tx2I4mVXgew+gtskWRXW0WJNzjG7lm+4bgOnHCHc/JTyyAqWmvRrOWB8CXwLdL
	YfNX5D1JnjnSYDY2tWKeL2DVB/FjOvrm/DgkrK+4/S8YIRLAuV7pTFANUEE3cgyGXlATY1w0uVdNs
	iXqhg6DDQo2Lu3NjHAYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EpM-00000002ezI-21fz;
	Mon, 29 Sep 2025 14:26:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3EpL-00000002eyI-27Jn
	for linux-riscv@lists.infradead.org;
	Mon, 29 Sep 2025 14:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DC3EA62555;
	Mon, 29 Sep 2025 14:26:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41B7CC4CEF4;
	Mon, 29 Sep 2025 14:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1759155966;
	bh=hTD3Nt4DpaJRy7P/xGnOsnI2J/j1t6BOJMHTcrErYBM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QNfA+TYysm0r/r7mJIUX1cdDvGFGBTYzwOKXfuZgsoVZioa6sP+OU8gDYuRo+zqpu
	 Rx2oqwpImf+kGSC0dtL0SGLVSUn+VAayC8BnlCCLcD6MybTCv/DakzG8I8UcBDFc/1
	 d9cIWsyVYAT2IiatXZ/oNPEf0jt7+4+oMT/u7y37tGTWIj7jOm5hWxyudkcSil0ONf
	 JBlkyG29FZqqyaYUt1SuDxXmD/oYcLtTCpm9Vub3AQAwtV/al/GcCpEXU11zDmtD2l
	 bHeSrIl1E3dFC6gsYuLc0wd4CS1PNoV8/TZO/F40ekErsZSM7nbJrJk7UgBj6cRZ6v
	 jFhxV5Lirvcgg==
Date: Mon, 29 Sep 2025 19:55:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Bjorn Helgaas <helgaas@kernel.org>
Cc: Randolph Lin <randolph@andestech.com>, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	jingoohan1@gmail.com, lpieralisi@kernel.org, kwilczynski@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, krzk+dt@kernel.org, conor+dt@kernel.org, alex@ghiti.fr, 
	aou@eecs.berkeley.edu, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	ben717@andestech.com, inochiama@gmail.com, thippeswamy.havalige@amd.com, 
	namcao@linutronix.de, shradha.t@samsung.com, randolph.sklin@gmail.com, 
	tim609@andestech.com
Subject: Re: [PATCH v3 1/5] PCI: dwc: Skip failed outbound iATU and continue
Message-ID: <ihappv6m5k7hvbfn7h65j7e52jqben7mgrvg7sem3hskfzgxyn@meq5xq33hgpc>
References: <aNPq42O1Ml3ppF2M@swlinux02>
 <20250926211023.GA2128495@bhelgaas>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250926211023.GA2128495@bhelgaas>
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

T24gRnJpLCBTZXAgMjYsIDIwMjUgYXQgMDQ6MTA6MjNQTSAtMDUwMCwgQmpvcm4gSGVsZ2FhcyB3
cm90ZToKPiBPbiBXZWQsIFNlcCAyNCwgMjAyNSBhdCAwODo1ODoxMVBNICswODAwLCBSYW5kb2xw
aCBMaW4gd3JvdGU6Cj4gPiBPbiBUdWUsIFNlcCAyMywgMjAyNSBhdCAwOTo0MjoyM0FNIC0wNTAw
LCBCam9ybiBIZWxnYWFzIHdyb3RlOgo+ID4gPiBPbiBUdWUsIFNlcCAyMywgMjAyNSBhdCAwNzoz
Njo0M1BNICswODAwLCBSYW5kb2xwaCBMaW4gd3JvdGU6Cj4gPiA+ID4gUHJldmlvdXNseSwgb3V0
Ym91bmQgaUFUVSBwcm9ncmFtbWluZyBpbmNsdWRlZCByYW5nZSBjaGVja3MKPiA+ID4gPiBiYXNl
ZCBvbiBoYXJkd2FyZSBsaW1pdGF0aW9ucy4gSWYgYSBjb25maWd1cmF0aW9uIGRpZCBub3QgbWVl
dAo+ID4gPiA+IHRoZXNlIGNvbnN0cmFpbnRzLCB0aGUgbG9vcCB3b3VsZCBzdG9wIGltbWVkaWF0
ZWx5Lgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBwYXRjaCB1cGRhdGVzIHRoZSBiZWhhdmlvciB0byBl
bmhhbmNlIGZsZXhpYmlsaXR5LiBJbnN0ZWFkCj4gPiA+ID4gb2Ygc3RvcHBpbmcgYXQgdGhlIGZp
cnN0IGlzc3VlLCBpdCBub3cgbG9ncyBhIHdhcm5pbmcgd2l0aAo+ID4gPiA+IGRldGFpbHMgb2Yg
dGhlIGFmZmVjdGVkIHdpbmRvdyBhbmQgcHJvY2VlZHMgdG8gcHJvZ3JhbSB0aGUKPiA+ID4gPiBy
ZW1haW5pbmcgaUFUVSBlbnRyaWVzLgo+ID4gPiA+Cj4gPiA+ID4gVGhpcyBlbmFibGVzIHBhcnRp
YWwgY29uZmlndXJhdGlvbiB0byBjb21wbGV0ZSBpbiBjYXNlcyB3aGVyZQo+ID4gPiA+IHNvbWUg
aUFUVSB3aW5kb3dzIG1heSBub3QgbWVldCByZXF1aXJlbWVudHMsIGltcHJvdmluZyBvdmVyYWxs
Cj4gPiA+ID4gY29tcGF0aWJpbGl0eS4KPiA+ID4gCj4gPiA+IEl0J3Mgbm90IHJlYWxseSBjbGVh
ciB3aHkgdGhpcyBpcyBuZWVkZWQuICBJIGFzc3VtZSBpdCdzIHJlbGF0ZWQKPiA+ID4gdG8gZHJv
cHBpbmcgcWlsYWlfcGNpZV9vdXRib3VuZF9hdHVfYWRkcl92YWxpZCgpLgo+ID4gCj4gPiBZZXMs
IEkgd2FudCB0byBkcm9wIHRoZSBwcmV2aW91cyBhdHVfYWRkcl92YWxpZCBmdW5jdGlvbi4KPiA+
IAo+ID4gPiBJIGd1ZXNzIGR3X3BjaWVfcHJvZ19vdXRib3VuZF9hdHUoKSBtdXN0IHJldHVybiBh
biBlcnJvciBmb3Igb25lCj4gPiA+IG9mIHRoZSBRaUxhaSByYW5nZXM/ICBXaGljaCBvbmUsIGFu
ZCB3aGF0IGV4YWN0bHkgaXMgdGhlIHByb2JsZW0/Cj4gPiA+IEkgc3RpbGwgc3VzcGVjdCBzb21l
dGhpbmcgd3JvbmcgaW4gdGhlIGRldmljZXRyZWUgZGVzY3JpcHRpb24uCj4gPiAKPiA+IFRoZSBt
YWluIGlzc3VlIGlzIG5vdCB0aGUgcmV0dXJuZWQgZXJyb3I7IGp1c3QgbmVlZCB0byBhdm9pZAo+
ID4gdGVybWluYXRpbmcgdGhlIHByb2Nlc3Mgd2hlbiB0aGUgY29uZmlndXJhdGlvbiBleGNlZWRz
IHRoZQo+ID4gaGFyZHdhcmXigJlzIGV4cGVjdGVkIGxpbWl0cy4KPiA+IAo+ID4gVGhlcmUgYXJl
IHR3byBtZXRob2RzIHRvIGZpeCB0aGUgaXNzdWUgb24gdGhlIFFpbGFpIFNvQzoKPiA+IAo+ID4g
MS4gU2ltcGx5IHNraXAgdGhlIGVudHJpZXMgdGhhdCBkbyBub3QgbWF0Y2ggdGhlIGRlc2lnbndh
cmUgaGFyZHdhcmUKPiA+IGlBVFUgbGltaXRhdGlvbnMuICBBbiBlcnJvciB3aWxsIGJlIHJldHVy
bmVkLCBidXQgaXQgY2FuIGJlIGlnbm9yZWQuCj4gPiBPbiB0aGUgUWlsYWkgU29DLCB0aGUgaUFU
VSBsaW1pdGF0aW9uIGlzIHRoZSA0R0IgYm91bmRhcnkuIFFpbGFpIFNvQwo+ID4gb25seSBuZWVk
IHRvIGNvbmZpZ3VyZSBpQVRVIHN1cHBvcnQgdG8gdHJhbnNsYXRlIGFkZHJlc3NlcyBiZWxvdyB0
aGUKPiA+ICIzMi1iaXRzIiBhZGRyZXNzIHJhbmdlLiBBbHRob3VnaCA2NC1iaXRzIGFkZHJlc3Nl
cyBkbyBub3QgbWF0Y2ggdGhlCj4gPiBkZXNpZ253YXJlIGhhcmR3YXJlIGlBVFUgbGltaXRhdGlv
bnMsIHRoZXJlIGlzIG5vIG5lZWQgdG8gY29uZmlndXJlCj4gPiA2NC1iaXRzIGFkZHJlc3Nlcywg
c2luY2UgdGhlIGNvbm5lY3Rpb24gaXMgaGFyZC13aXJlZC4KPiA+IAoKV2h5IGRvZXMgdGhlIERU
IHN1cHBsaWVzIGJyb2tlbiAncmFuZ2VzJyBpbiB0aGUgZmlyc3QgcGxhY2U/IERUIGRlc2NyaWJl
cyB0aGUKaGFyZHdhcmUgYW5kIGlmIHRoZSBoYXJkd2FyZSBvbmx5IHN1cHBvcnRzIDMyYml0IE9C
IHdpbmRvdywgdGhlbiBEVCBoYXMgdG8Kc3VwcGx5IHRoZSByYW5nZSBhY2NvcmRpbmdseS4gSXQg
aXMgbm90IGN1cnJlbnRseSBjbGVhciBvbiB3aGF0IGlzc3VlIHlvdSBhcmUKdHJ5aW5nIHRvIHNv
bHZlIGJ5IHNraXBwaW5nIHRoZSByYW5nZSBjaGVjayBmb3IgYnJva2VuIHJlc291cmNlcy4KCj4g
PiAyLiBTZXQgdGhlIGRldmljZXRyZWUgb25seSAyIHZpZXdwb3J0IGZvciBpQVRVIGFuZCBmb3Jj
ZSB1c2luZwo+ID4gZGV2aWNldHJlZSB2YWx1ZS4gIFRoaXMgaXMgYSB3b3JrYXJvdW5kIGluIHRo
ZSBkZXZpY2V0cmVlLCBidXQgdGhlCj4gPiBmaXggbG9naWMgaXMgbm90IGVhc3kgdG8gZG9jdW1l
bnQuICBJbnN0ZWFkLCB3ZSBzaG91bGQgZW5mb3JjZSB0aGUKPiA+IHVzZSBvZiB0aGUgdmlld3Bv
cnQgZGVmaW5lZCBpbiB0aGUgZGV2aWNldHJlZSBhbmQgbW9kaWZ5IHRoZQo+ID4gZGVzaWdud2Fy
ZSBnZW5lcmljIGNvZGUgYWNjb3JkaW5nbHkg4oCUIHVzaW5nIHRoZSB2aWV3cG9ydCB2YWx1ZXMg
ZnJvbQo+ID4gdGhlIGRldmljZXRyZWUgaW5zdGVhZCBvZiByZWFkaW5nIHRoZW0gZnJvbSB0aGUg
ZGVzaWdud2FyZQo+ID4gcmVnaXN0ZXJzLiAgU2luY2Ugb25seSB0d28gdmlld3BvcnRzIGFyZSBh
dmFpbGFibGUgZm9yIGlBVFUsIHdlCj4gPiBzaG91bGQgcmVzZXJ2ZSBvbmUgZm9yIHRoZSBjb25m
aWd1cmF0aW9uIHJlZ2lzdGVycyBhbmQgdGhlIG90aGVyIGZvcgo+ID4gMzItYml0IGFkZHJlc3Mg
YWNjZXNzLiAgVGhlcmVmb3JlLCByZXZlcnNlIGxvZ2ljIHN0aWxsIG5lZWRzIHRvIGJlCj4gPiBh
ZGRlZCB0byB0aGUgZGVzaWdud2FyZSBnZW5lcmljIGNvZGUuCj4gPiAKCidudW0tdmlld3BvcnQn
IHByb3BlcnR5IGlzIGRlcHJlY2F0ZWQuIFNvIHNob3VsZCBub3QgYmUgdXNlZCBpbiBuZXcgRFRz
LgoKLSBNYW5pCgotLSAK4K6u4K6j4K6/4K614K6j4K+N4K6j4K6p4K+NIOCumuCupOCuvuCumuCu
v+CuteCuruCvjQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
