Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AED2C83F1A
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Jul 2025 13:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+jyP6ZxSGuGx6ZeM33bcPh7rg0aJCqBvt13yVVODpwg=; b=qnlGpQXsfe+nhL
	0ZGImJzpcy81B+6lJeXkSD17TSVNQRzt39mxSOtlbrjoPZG5NNqms/JEiJ8Nf69PLeeZUWbz+JJYb
	6xWgCVPPBZcvq/KcG/j0h+CeZehZPsNTU7iKqRz9hhzTTTuuXWOIq6xNI/7U07HnI7vtTITEb8V2S
	j/ombiTYmp5gZJrs9kk7MbqOcjT18TWoiYuCVd7AovMpOfZOMcWeXinNa+uxACJzgEo523wZ/5Ek9
	7sALvx7TShTGDIQAKqfBgP9+23js6LHJD0p7tiHJtEUOduNr51pC+adWTm5Be+oflhUDUAFJNnC3x
	zR5JP2fAGybxJF11ssVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udqVx-0000000HNer-1KUz;
	Mon, 21 Jul 2025 13:25:09 +0000
Received: from out-173.mta0.migadu.com ([91.218.175.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1udpJW-0000000HDTm-2Ocv
	for linux-riscv@lists.infradead.org;
	Mon, 21 Jul 2025 12:08:16 +0000
Date: Mon, 21 Jul 2025 20:08:06 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1753099692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8CiyT1LW8S2cprjOA7fuHy478wU5+FE3KPTv6t/QXyg=;
	b=TaILfvtul8thQUWdU4h/uwNOkqNqAJ/O9St/9Gyyvw2qOPqG6+/08lRNgo4p+1iEBqMIb1
	jn0o+aou5/+r7/hOr3YnGuvvCGps0mC/HxKpt+TIfKVEPPKGNa9RNZn318dsUI+9JMtAiX
	24dr4T43X39mGq5d4DvYRTxpoTHFBPM=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ze Huang <huang.ze@linux.dev>
To: Alex Elder <elder@ieee.org>, Ze Huang <huang.ze@linux.dev>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
	Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/2] usb: dwc3: add generic driver to support flattened
Message-ID: <aH4tpgVPbf9DOzSe@monica.localdomain>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
 <20250712-dwc3_generic-v6-2-cc87737cc936@linux.dev>
 <d2e9a521-568e-433d-a59b-9b98138ace2b@ieee.org>
 <aHyN3-uoHofF8Hg3@monica.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aHyN3-uoHofF8Hg3@monica.localdomain>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_050814_822619_E7EF6C13 
X-CRM114-Status: GOOD (  27.72  )
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

T24gU3VuLCBKdWwgMjAsIDIwMjUgYXQgMDI6MzQ6MDdQTSArMDgwMCwgWmUgSHVhbmcgd3JvdGU6
Cj4gT24gVHVlLCBKdWwgMTUsIDIwMjUgYXQgMDM6NTA6NTRQTSAtMDUwMCwgQWxleCBFbGRlciB3
cm90ZToKPiA+IE9uIDcvMTIvMjUgMjo0OSBBTSwgWmUgSHVhbmcgd3JvdGU6Cj4gPiA+IFRvIHN1
cHBvcnQgZmxhdHRlbmVkIGR3YzMgZHQgbW9kZWwgYW5kIGRyb3AgdGhlIGdsdWUgbGF5ZXIsIGlu
dHJvZHVjZSB0aGUKPiA+ID4gYGR3YzMtZ2VuZXJpY2AgZHJpdmVyLiBUaGlzIGVuYWJsZXMgZGly
ZWN0IGJpbmRpbmcgb2YgdGhlIERXQzMgY29yZSBkcml2ZXIKPiA+ID4gYW5kIG9mZmVycyBhbiBh
bHRlcm5hdGl2ZSB0byB0aGUgZXhpc3RpbmcgZ2x1ZSBkcml2ZXIgYGR3YzMtb2Ytc2ltcGxlYC4K
PiA+IAo+ID4gSSdtIG5vdCBmYW1pbGlhciB3aXRoIGR3Yy1vZi1zaW1wbGUuYywgYW5kIHdvbid0
IGNvbW1lbnQgb24KPiA+IGhvdyB0aGlzIGRpZmZlcnMgZnJvbSB0aGF0IChvciBkb2VzIG5vdCku
Cj4gPiAKPiA+IEdpdmVuIHlvdSdyZSBpbXBsZW1lbnRpbmcgYW4gYWx0ZXJuYXRpdmUgdGhvdWdo
LCBjYW4geW91IGV4cGxhaW4KPiA+IGluIGEgbGl0dGxlIG1vcmUgZGV0YWlsIHdoYXQncyBkaWZm
ZXJlbnQgYmV0d2VlbiB0aGUgdHdvPyAgV2h5Cj4gPiB3b3VsZCBzb21lb25lIGNob29zZSB0byB1
c2UgdGhpcyBkcml2ZXIgcmF0aGVyIHRoYW4gdGhlIG90aGVyIG9uZT8KPiAKPiBUaGV5IGFyZSBi
YXNpY2FsbHkgdGhlIHNhbWUuCj4gCj4gZHdjLWdlbmVyaWMgdXNlIGEgcGxhaW4gZHQgbm9kZSB3
aGlsZSBkd2Mtb2Ytc2ltcGxlIHdpbGwgbmVzdCB0aGUgZHdjMwo+IG5vZGUgYXMgaXRzIGNoaWxk
Lgo+IAo+IEJvdGggd2lsbCB1c2UgZHdjM19jb3JlX3Byb2JlKCkgdG8gZmluaXNoIHRoZSBwcm9i
ZSBwcm9jZXNzLiBCdXQgbm93IHdlCj4gY2FuIHNpbXBsaWZ5IHRoZSBwcm9jZXNzIGJ5IGp1c3Qg
Y2FsbGluZyBpdCwgaW5zdGVhZCBvZiBjYWxsaW5nCj4gb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKSBh
bmQgY3JlYXRlIGFub3RoZXIgc25wcyxkd2MzIGRldmljZSBkcml2ZXIuCgpbLi4uXQoKPiA+ID4g
KwlyZXQgPSByZXNldF9jb250cm9sX2Fzc2VydChkd2MzLT5yZXNldHMpOwo+ID4gPiArCWlmIChy
ZXQpCj4gPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGFz
c2VydCByZXNldHNcbiIpOwo+ID4gPiArCj4gPiA+ICsJcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29y
X3Jlc2V0KGRldiwgZHdjM19nZW5lcmljX3Jlc2V0X2NvbnRyb2xfYXNzZXJ0LCBkd2MzLT5yZXNl
dHMpOwo+ID4gPiArCWlmIChyZXQpCj4gPiA+ICsJCXJldHVybiByZXQ7Cj4gPiAKPiA+IFRoZSBy
ZS1hc3NlcnQgc2hvdWxkbid0IGJlIHNldCB1cCB1bmxlc3MgdGhlIGRlYXNzZXJ0IGJlbG93Cj4g
PiBzdWNjZWVkcy4KPiA+IAo+IAo+IFdpbGwgbW92ZSBiZWhpbmQgdGhlIGRlYXNzZXJ0Lgo+IAo+
ID4gPiArCXVzbGVlcF9yYW5nZSgxMCwgMTAwMCk7Cj4gPiAKPiA+IFRoaXMgc2VlbXMgbGlrZSBh
IGxhcmdlIHJhbmdlLiAgWW91IGNvdWxkIGp1c3QgZG8gbXNsZWVwKDEpOwo+ID4gQWxzbywgY2Fu
IHlvdSBhZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgd2h5IGEgZGVsYXkgaXMgbmVlZGVkLAo+ID4g
YW5kIHdoeSAxIG1pbGxpc2Vjb25kIGlzIHRoZSByaWdodCBhbW91bnQgb2YgdGltZSB0byBzbGVl
cD8KPiA+IAo+IAo+IEkgd2lsbCBjaGVjayB0aGUgcmFuZ2Ugd2l0aCBzcGFjZW1pdCBhbmQgcmVw
bHkgc29vbi4KPiAKCnRoZSByZXNldHMgYXJlIGFzeW5jaHJvbm91cyB3aXRoIG5vIHN0cmljdCB0
aW1pbmcuIEJ1dCB0byBiZSBzYWZlLCBlYWNoCnJlc2V0IHNob3VsZCBzdGF5IGFjdGl2ZSBmb3Ig
YXQgbGVhc3QgMeKAr8K1cy4gSeKAmWxsIHN3aXRjaCB0byBhIHVkZWxheSgyKQphbmQgYWRkIGNv
bW1lbnQgYWNjb3JkaW5nbHkuCgo+ID4gPiArCXJldCA9IHJlc2V0X2NvbnRyb2xfZGVhc3NlcnQo
ZHdjMy0+cmVzZXRzKTsKPiA+ID4gKwlpZiAocmV0KQo+ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9w
cm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBkZWFzc2VydCByZXNldHNcbiIpOwo+ID4gPiArCj4g
PiA+ICsJcmV0ID0gZGV2bV9jbGtfYnVsa19nZXRfYWxsKGR3YzMtPmRldiwgJmR3YzMtPmNsa3Mp
Owo+ID4gPiArCWlmIChyZXQgPCAwKQo+ID4gPiArCQlyZXR1cm4gZGV2X2Vycl9wcm9iZShkZXYs
IHJldCwgImZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsKPiA+IAo+ID4gQ2FsbCBkZXZtX2Nsa19i
dWxrX2dldF9hbGxfZW5hYmxlZCgpIGluc3RlYWQgb2YgZG9pbmcgdGhlIHR3bwo+ID4gc3RlcHMg
c2VwYXJhdGVseSBoZXJlLgo+ID4gCj4gCj4gV2lsbCBkbywgdGhhbmtzLgo+IAo+ID4gCQkJCQkt
QWxleAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
