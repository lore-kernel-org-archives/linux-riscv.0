Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2FFCEACEF
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Nov 2025 13:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HCmYcwwWgBljB14S7SUGyPlUGSHubn2Qmb7bxMKB3iE=; b=cKXC4m9OcpW2zh
	3EGjxgK9Y0OnWXn059llig//uzz6KpEDoHmB+ziA3nduY8YS6OcArQj+V23+Wc/+u8+R8aE+ZDvNs
	f/5snSo/RRyZ1RThc05wJ8FTd1npB0prnbj9pKd0fXBBnFi84gz2XatnndG2F1HROhRTjh8Guh0a3
	x1a6yU6sBcQ2Zoui51pDdmI+VZ4aSQWRJ9Q9OKkT918JravZ1ferdXu86Sulnm+VrTSFnPmlSFzvp
	nNRkFwUXCjc1pRQx4QL3EjyRTHlawJTVjjlXJzaeyCA5fTQaHLUEpm40yhlmo9IyLaIcmiBsIhtGS
	CshggDAw30u/BUhCPP2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz6f-0000000GAO2-37mk;
	Mon, 17 Nov 2025 13:17:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKz6d-0000000GANS-07LQ
	for linux-riscv@lists.infradead.org;
	Mon, 17 Nov 2025 13:17:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F3F643726;
	Mon, 17 Nov 2025 13:17:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1280AC113D0;
	Mon, 17 Nov 2025 13:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763385438;
	bh=xxRVdtfTiOQTO2jyXwimxqWcnuxgrlQL288pVe0i6qw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c550pCdkJK+yNP+DqSVvgoIJBsW5teGVE/5W3xmfUaLaCBThmuk6hVhdtUlBiF7by
	 9jlT5Jh/yvA9YhcGpMQ1u8uASYsLwvKT/uRST5Roi8Vnlnh7fVWaCNufPO1LAeHX+K
	 n6EmpyuEPUAfZYq8ZnhIQIqr+8k42SYM12NdHdlzkmgi9KIuJj+NrXzcW2YzbvHR3D
	 KmiQIlFhd8FdBdGNGaGf43d6sPx9z9hcSecSYDWUaJrXRm1FMTkgYxMi1SJZud2CXv
	 mewJQAaui7JyPnt0PCiMXwbLgR+Sfucy+bp71fdeTcqLiMHSpEPXhb1fs3ggQMNVgT
	 ABimt9Z0vvmuA==
Date: Mon, 17 Nov 2025 18:47:00 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Vitor Soares <ivitro@gmail.com>
Cc: Alex Elder <elder@riscstar.com>, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, robh@kernel.org, bhelgaas@google.com, dlan@gentoo.org, 
	aurelien@aurel32.net, johannes@erdfelt.com, p.zabel@pengutronix.de, 
	christian.bruel@foss.st.com, thippeswamy.havalige@amd.com, krishna.chundru@oss.qualcomm.com, 
	mayank.rana@oss.qualcomm.com, qiang.yu@oss.qualcomm.com, shradha.t@samsung.com, 
	inochiama@gmail.com, guodong@riscstar.com, linux-pci@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 5/7] PCI: spacemit: Add SpacemiT PCIe host driver
Message-ID: <7f5r2lnlrsltowfninu76bivebgwkr5i3pdorj3hywg22mtmdz@m35cpser6opt>
References: <20251113214540.2623070-1-elder@riscstar.com>
 <20251113214540.2623070-6-elder@riscstar.com>
 <f55e2df3fcd025148b7262c3753e5136cc324b09.camel@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f55e2df3fcd025148b7262c3753e5136cc324b09.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_051719_110022_6F12B40B 
X-CRM114-Status: GOOD (  23.82  )
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

T24gTW9uLCBOb3YgMTcsIDIwMjUgYXQgMDE6MDE6MDRQTSArMDAwMCwgVml0b3IgU29hcmVzIHdy
b3RlOgoKWy4uLl0KCj4gPiArc3RhdGljIGludCBrMV9wY2llX3Byb2JlKHN0cnVjdCBwbGF0Zm9y
bV9kZXZpY2UgKnBkZXYpCj4gPiArewo+ID4gK8KgwqDCoMKgwqDCoMKgc3RydWN0IGRldmljZSAq
ZGV2ID0gJnBkZXYtPmRldjsKPiA+ICvCoMKgwqDCoMKgwqDCoHN0cnVjdCBrMV9wY2llICprMTsK
PiA+ICvCoMKgwqDCoMKgwqDCoGludCByZXQ7Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBrMSA9
IGRldm1fa3phbGxvYyhkZXYsIHNpemVvZigqazEpLCBHRlBfS0VSTkVMKTsKPiA+ICvCoMKgwqDC
oMKgwqDCoGlmICghazEpCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmV0dXJu
IC1FTk9NRU07Cj4gPiArCj4gPiArwqDCoMKgwqDCoMKgwqBrMS0+cG11ID0gc3lzY29uX3JlZ21h
cF9sb29rdXBfYnlfcGhhbmRsZV9hcmdzKGRldl9vZl9ub2RlKGRldiksCj4gPiArwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCBTWVNDT05fQVBNVSwgMSwK
PiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICZr
MS0+cG11X29mZik7Cj4gPiArwqDCoMKgwqDCoMKgwqBpZiAoSVNfRVJSKGsxLT5wbXUpKQo+ID4g
K8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoHJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwg
UFRSX0VSUihrMS0+cG11KSwKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJmYWlsZWQgdG8gbG9va3VwIFBN
VSByZWdpc3RlcnNcbiIpOwo+ID4gKwo+ID4gK8KgwqDCoMKgwqDCoMKgazEtPmxpbmsgPSBkZXZt
X3BsYXRmb3JtX2lvcmVtYXBfcmVzb3VyY2VfYnluYW1lKHBkZXYsICJsaW5rIik7Cj4gPiArwqDC
oMKgwqDCoMKgwqBpZiAoSVNfRVJSKGsxLT5saW5rKSkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIFBUUl9FUlIoazEtPmxpbmspLAo+
ID4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqAgImZhaWxlZCB0byBtYXAgXCJsaW5rXCIgcmVnaXN0ZXJzXG4iKTsK
PiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDCoGsxLT5wY2kuZGV2ID0gZGV2Owo+ID4gK8KgwqDCoMKg
wqDCoMKgazEtPnBjaS5vcHMgPSAmazFfcGNpZV9vcHM7Cj4gPiArwqDCoMKgwqDCoMKgwqBrMS0+
cGNpLnBwLm51bV92ZWN0b3JzID0gTUFYX01TSV9JUlFTOwo+ID4gK8KgwqDCoMKgwqDCoMKgZHdf
cGNpZV9jYXBfc2V0KCZrMS0+cGNpLCBSRVFfUkVTKTsKPiA+ICsKPiA+ICvCoMKgwqDCoMKgwqDC
oGsxLT5wY2kucHAub3BzID0gJmsxX3BjaWVfaG9zdF9vcHM7Cj4gPiArCj4gPiArwqDCoMKgwqDC
oMKgwqAvKiBIb2xkIHRoZSBQSFkgaW4gcmVzZXQgdW50aWwgd2Ugc3RhcnQgdGhlIGxpbmsgKi8K
PiA+ICvCoMKgwqDCoMKgwqDCoHJlZ21hcF9zZXRfYml0cyhrMS0+cG11LCBrMS0+cG11X29mZiAr
IFBDSUVfQ0xLX1JFU0VUX0NPTlRST0wsCj4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoEFQUF9IT0xEX1BIWV9SU1QpOwo+ID4gKwo+ID4gK8KgwqDCoMKg
wqDCoMKgcmV0ID0gZGV2bV9yZWd1bGF0b3JfZ2V0X2VuYWJsZShkZXYsICJ2cGNpZTN2MyIpOwo+
ID4gK8KgwqDCoMKgwqDCoMKgaWYgKHJldCkKPiA+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqByZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwKPiA+ICvCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJm
YWlsZWQgdG8gZ2V0IFwidnBjaWUzdjNcIiBzdXBwbHlcbiIpOwo+ID4gKwo+IAo+IEhpLAo+IAo+
IFdoaWxlIGludmVzdGlnYXRpb24gYSBzaW1pbGFyIFBDSWUgc2V0dXAsIEkgY29tZSBhY3Jvc3Mg
dGhpcyBwYXRjaCBzZXJpZXMgYW5kCj4gaGFkIGEgcXVlc3Rpb24gcmVnYXJkaW5nIHJlZ3VsYXRv
ciBoYW5kbGluZy4KPiAKPiBJbiB0aGUgcGF0Y2gsIHRoZSBob3N0IGNvbnRyb2xsZXIgZXhwbGlj
aXRseSBlbmFibGVzIHRoZSB2cGNpZTN2My4gSG93ZXZlciwgdGhlCj4gcGNpLXB3Y3RybC1zbG90
IGRyaXZlciAoY29tcGF0aWJsZSBwY2ljbGFzcywwNjA0KSBpcyBhbHNvIGluc3RhbnRpYXRlZCB2
aWEKPiBkZXZpY2UgdHJlZSBhbmQgaXMgc3VwcG9zZWQgdG8gbWFuYWdlIHRoZSBzbG90IHN1cHBs
eS4KPiAKPiBJJ20gd29uZGVyaW5nIHdoZXRoZXIgaXQncyBhY3R1YWxseSBuZWNlc3NhcnkgdG8g
ZW5hYmxlIHRoZSByZWd1bGF0b3IgaW4gdGhlCj4gaG9zdCBjb250cm9sbGVyLCBzaW5jZSB0aGUg
c2xvdCBkcml2ZXIgc2hvdWxkIGFscmVhZHkgdGFrZSBjYXJlIG9mIGl0LiBIb3dldmVyLAo+IGlu
IG15IHRlc3RzLCB0aGUgZW5kcG9pbnQgaXMgbm90IGRpc2NvdmVyZWQgdW5sZXNzIHRoZSBob3N0
IGRyaXZlciBlbmFibGVzIHRoZQo+IHJlZ3VsYXRvciBlYXJseS4gSXQncyBub3QgZW50aXJlbHkg
Y2xlYXIgd2hldGhlciB0aGlzIGlzIGR1ZSB0byB0aGUgUEhZIGFuZAo+IHJlc2V0IHNlcXVlbmNl
LCBvciB0aGUgdGltaW5nIG9mIHRoZSB2cGNpZTN2MyByZWd1bGF0b3IgYWN0aXZhdGlvbi4KPiAK
PiBATWFuaXZhbm5hbjogSW4gdGhlIHBhdGNoLCB0aGUgaG9zdCBjb250cm9sbGVyIGRyaXZlciBl
bmFibGVzIHRoZSB2cGNpZTN2Mwo+IHJlZ3VsYXRvciwgZXZlbiB0aG91Z2ggdGhlIHBjaS1wd3Jj
dHJsLXNsb3QgZHJpdmVyIChwY2ljbGFzcywwNjA0KSBpcyBzdXBwb3NlZAo+IHRvIG1hbmFnZSBp
dC4gSXMgdGhpcyBkdXBsaWNhdGlvbiBpbnRlbnRpb25hbCwgb3IgaXMgdGhlcmUgYSBwcmVmZXJy
ZWQgd2F5IHRvCj4gZW5zdXJlIHRoZSBzdXBwbHkgaXMgYWN0aXZlIGJlZm9yZSBidXMgc2Nhbm5p
bmc/IEFueSBndWlkYW5jZSB3b3VsZCBiZQo+IGFwcHJlY2lhdGVkLgo+IAoKWWVzLCB0aGUgcmVn
dWxhdG9yIGhhbmRsaW5nIGlzIGR1cGxpY2F0ZWQgbm93LiBUaGlzIGlzIGR1ZSB0byBtaXNzaW5n
IFBFUlNUIwpoYW5kbGluZyBpbiB0aGUgcHdyY3RybC1zbG90IGRyaXZlci4gV2UgYXJlIHdvcmtp
bmcgb24gYSBzZXJpZXMgdG8gYmUgcG9zdGVkCnRoaXMgd2VlayB0aGF0IHdpbGwgZml4IHRoaXMg
aXNzdWUsIGJ1dCB1bnRpbCB0aGVuLCBwd3JjdHJsLXNsb3QgZHJpdmVyIGlzIG5vdApyZWxpYWJs
ZSB0byBwb3dlciB1cCB0aGUgZW5kcG9pbnQuIFNvIEkndmUgYXNrZWQgQWxleCB0byBoYW5kbGUg
dGhlIHJlZ3VsYXRvcgphbmQgUEVSU1QjIGluIHRoZSBjb250cm9sbGVyIGRyaXZlciBmb3Igbm93
LiBPbmNlIG15IHJld29yayBzZXJpZXMgZ2V0cyBtZXJnZWQsCnRoaXMgcGFydCBjYW4gYmUgZHJv
cHBlZCBmcm9tIHRoZSBjb250cm9sbGVyIGRyaXZlciBhbmQgdGhlcmUgaXMgbm8gY2hhbmdlCnJl
cXVpcmVkIGluIHRoZSBiaW5kaW5nL2R0cy4KCi0gTWFuaQoKLS0gCuCuruCuo+Cuv+CuteCuo+Cv
jeCuo+CuqeCvjSDgrprgrqTgrr7grprgrr/grrXgrq7gr40KCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51
eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21h
aWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
