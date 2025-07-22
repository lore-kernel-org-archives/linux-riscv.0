Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7B12C83F25
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Jul 2025 00:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0E7K6TbHqixxuahN/+ZevO0iNkgpGSMMaugBawV/8NE=; b=bFmounf8Mvc1j9
	PtQYhv5sY6/0R7Mvd1pKrq+1W6Szlz+hkEm7/YUU/IXKkgfQlKnKI6bRhJG0mm+IkM50pZou7f4gl
	v4owTZ4Ma9cfmV+hAmJMHAO1BSJ0fBkBxF6CGXXMfJ0BUR/bp9NSq3X9sxxVQ8wdc+2toiig7UhsO
	g55uJKyieKdX6eUj7FX/T7xwyxqbbIK04jfJreMaEf8HbiABnr80HjSOMHa+IwpE9lG8TyW3w3L4g
	uqya9MVzDlTziIpTOzusO6JKyzYWzwH+9vNQ0k+ESOo8yQrbxWauQAg8bwSexL6QS5v0PybhbEAue
	f7j/zSgclmgUecQ6DSvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue0yY-00000000xi2-0J8A;
	Tue, 22 Jul 2025 00:35:22 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ue0yU-00000000xhc-44ic
	for linux-riscv@lists.infradead.org;
	Tue, 22 Jul 2025 00:35:20 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 46DFF2082C;
	Tue, 22 Jul 2025 02:35:14 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2AWGV58KjTtc; Tue, 22 Jul 2025 02:35:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1753144513; bh=NVJSthHoVBfvJ0DprsxJsTID3or77ayMtN3PtiGsObQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=kuqp7SvqE3+gsACQYmTXKrC6X6J/IBJVAvyya0mbiIsDkonQbEAg4tHtU90nE2fOO
	 maPB8WmFiNZIQBVtbQ5nZ1VKVgu8ehAoh0wGLNES47exI9ghg7zuUL54J4gtoTdMz5
	 tJYNXt4HOTIzqW9tNieEM2P/1o7t0VXzKJeO0orz4Bkz5+SPeuGo15x0CxAontFdWS
	 I/D91B2ADLRNe+Bu1Ta0N7jG3yVEU8LxLvF6XW7tawKRh0QjJP2JNDny4uwpMZXphy
	 uaoLs/SQ3vpfwD+kycJR2prgJzg5LDK+22uzpxHx+3Y2p1pbHW2o3yIcylVoF1fzU3
	 34If+OcvH0l6w==
Date: Tue, 22 Jul 2025 00:34:46 +0000
From: Yao Zi <ziyao@disroot.org>
To: Ze Huang <huang.ze@linux.dev>, Alex Elder <elder@ieee.org>,
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
Message-ID: <aH7cpr0faRPVnxXL@pie>
References: <20250712-dwc3_generic-v6-0-cc87737cc936@linux.dev>
 <20250712-dwc3_generic-v6-2-cc87737cc936@linux.dev>
 <d2e9a521-568e-433d-a59b-9b98138ace2b@ieee.org>
 <aHyN3-uoHofF8Hg3@monica.localdomain>
 <aH4tpgVPbf9DOzSe@monica.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <aH4tpgVPbf9DOzSe@monica.localdomain>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250721_173519_441786_C829AFAF 
X-CRM114-Status: GOOD (  31.28  )
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

T24gTW9uLCBKdWwgMjEsIDIwMjUgYXQgMDg6MDg6MDZQTSArMDgwMCwgWmUgSHVhbmcgd3JvdGU6
Cj4gT24gU3VuLCBKdWwgMjAsIDIwMjUgYXQgMDI6MzQ6MDdQTSArMDgwMCwgWmUgSHVhbmcgd3Jv
dGU6Cj4gPiBPbiBUdWUsIEp1bCAxNSwgMjAyNSBhdCAwMzo1MDo1NFBNIC0wNTAwLCBBbGV4IEVs
ZGVyIHdyb3RlOgo+ID4gPiBPbiA3LzEyLzI1IDI6NDkgQU0sIFplIEh1YW5nIHdyb3RlOgo+ID4g
PiA+IFRvIHN1cHBvcnQgZmxhdHRlbmVkIGR3YzMgZHQgbW9kZWwgYW5kIGRyb3AgdGhlIGdsdWUg
bGF5ZXIsIGludHJvZHVjZSB0aGUKPiA+ID4gPiBgZHdjMy1nZW5lcmljYCBkcml2ZXIuIFRoaXMg
ZW5hYmxlcyBkaXJlY3QgYmluZGluZyBvZiB0aGUgRFdDMyBjb3JlIGRyaXZlcgo+ID4gPiA+IGFu
ZCBvZmZlcnMgYW4gYWx0ZXJuYXRpdmUgdG8gdGhlIGV4aXN0aW5nIGdsdWUgZHJpdmVyIGBkd2Mz
LW9mLXNpbXBsZWAuCj4gPiA+IAo+ID4gPiBJJ20gbm90IGZhbWlsaWFyIHdpdGggZHdjLW9mLXNp
bXBsZS5jLCBhbmQgd29uJ3QgY29tbWVudCBvbgo+ID4gPiBob3cgdGhpcyBkaWZmZXJzIGZyb20g
dGhhdCAob3IgZG9lcyBub3QpLgo+ID4gPiAKPiA+ID4gR2l2ZW4geW91J3JlIGltcGxlbWVudGlu
ZyBhbiBhbHRlcm5hdGl2ZSB0aG91Z2gsIGNhbiB5b3UgZXhwbGFpbgo+ID4gPiBpbiBhIGxpdHRs
ZSBtb3JlIGRldGFpbCB3aGF0J3MgZGlmZmVyZW50IGJldHdlZW4gdGhlIHR3bz8gIFdoeQo+ID4g
PiB3b3VsZCBzb21lb25lIGNob29zZSB0byB1c2UgdGhpcyBkcml2ZXIgcmF0aGVyIHRoYW4gdGhl
IG90aGVyIG9uZT8KPiA+IAo+ID4gVGhleSBhcmUgYmFzaWNhbGx5IHRoZSBzYW1lLgo+ID4gCj4g
PiBkd2MtZ2VuZXJpYyB1c2UgYSBwbGFpbiBkdCBub2RlIHdoaWxlIGR3Yy1vZi1zaW1wbGUgd2ls
bCBuZXN0IHRoZSBkd2MzCj4gPiBub2RlIGFzIGl0cyBjaGlsZC4KPiA+IAo+ID4gQm90aCB3aWxs
IHVzZSBkd2MzX2NvcmVfcHJvYmUoKSB0byBmaW5pc2ggdGhlIHByb2JlIHByb2Nlc3MuIEJ1dCBu
b3cgd2UKPiA+IGNhbiBzaW1wbGlmeSB0aGUgcHJvY2VzcyBieSBqdXN0IGNhbGxpbmcgaXQsIGlu
c3RlYWQgb2YgY2FsbGluZwo+ID4gb2ZfcGxhdGZvcm1fcG9wdWxhdGUoKSBhbmQgY3JlYXRlIGFu
b3RoZXIgc25wcyxkd2MzIGRldmljZSBkcml2ZXIuCj4gCj4gWy4uLl0KPiAKPiA+ID4gPiArCXJl
dCA9IHJlc2V0X2NvbnRyb2xfYXNzZXJ0KGR3YzMtPnJlc2V0cyk7Cj4gPiA+ID4gKwlpZiAocmV0
KQo+ID4gPiA+ICsJCXJldHVybiBkZXZfZXJyX3Byb2JlKGRldiwgcmV0LCAiZmFpbGVkIHRvIGFz
c2VydCByZXNldHNcbiIpOwo+ID4gPiA+ICsKPiA+ID4gPiArCXJldCA9IGRldm1fYWRkX2FjdGlv
bl9vcl9yZXNldChkZXYsIGR3YzNfZ2VuZXJpY19yZXNldF9jb250cm9sX2Fzc2VydCwgZHdjMy0+
cmVzZXRzKTsKPiA+ID4gPiArCWlmIChyZXQpCj4gPiA+ID4gKwkJcmV0dXJuIHJldDsKPiA+ID4g
Cj4gPiA+IFRoZSByZS1hc3NlcnQgc2hvdWxkbid0IGJlIHNldCB1cCB1bmxlc3MgdGhlIGRlYXNz
ZXJ0IGJlbG93Cj4gPiA+IHN1Y2NlZWRzLgo+ID4gPiAKPiA+IAo+ID4gV2lsbCBtb3ZlIGJlaGlu
ZCB0aGUgZGVhc3NlcnQuCj4gPiAKPiA+ID4gPiArCXVzbGVlcF9yYW5nZSgxMCwgMTAwMCk7Cj4g
PiA+IAo+ID4gPiBUaGlzIHNlZW1zIGxpa2UgYSBsYXJnZSByYW5nZS4gIFlvdSBjb3VsZCBqdXN0
IGRvIG1zbGVlcCgxKTsKPiA+ID4gQWxzbywgY2FuIHlvdSBhZGQgYSBjb21tZW50IGV4cGxhaW5p
bmcgd2h5IGEgZGVsYXkgaXMgbmVlZGVkLAo+ID4gPiBhbmQgd2h5IDEgbWlsbGlzZWNvbmQgaXMg
dGhlIHJpZ2h0IGFtb3VudCBvZiB0aW1lIHRvIHNsZWVwPwo+ID4gPiAKPiA+IAo+ID4gSSB3aWxs
IGNoZWNrIHRoZSByYW5nZSB3aXRoIHNwYWNlbWl0IGFuZCByZXBseSBzb29uLgo+ID4gCj4gCj4g
dGhlIHJlc2V0cyBhcmUgYXN5bmNocm9ub3VzIHdpdGggbm8gc3RyaWN0IHRpbWluZy4gQnV0IHRv
IGJlIHNhZmUsIGVhY2gKPiByZXNldCBzaG91bGQgc3RheSBhY3RpdmUgZm9yIGF0IGxlYXN0IDHi
gK/CtXMuIEnigJlsbCBzd2l0Y2ggdG8gYSB1ZGVsYXkoMikKPiBhbmQgYWRkIGNvbW1lbnQgYWNj
b3JkaW5nbHkuCgpUaGlzIG1heSBiZSBhIGxpdHRsZSBmYXJzaWdodDogZG8geW91IHRoaW5rIGl0
J3MgYmV0dGVyIHRvIG1ha2UgdGhlCnJlc2V0IHRpbWluZyBwYXJ0IG9mIHRoZSBvZl9tYXRjaF9k
YXRhPyBUaGlzIGlzIG1vcmUgZmxleGlibGUgYW5kCnJlZHVjZXMgZnV0dXJlIGJ1cmRlbiB3aGVu
IGludHJvZHVjaW5nIGEgbmV3IHBsYXRmb3JtIHRoYXQgY29tZXMgd2l0aCBhCmRpZmZlcmVudCBy
ZXNldCB0aW1pbmcsIHdoaWNoIGlzIGEgdmVyeSBsaWtlbHkgY2FzZSB3ZSdsbCBmYWNlIHNpbmNl
Cml0J3MgYSAiZ2VuZXJpYyIgZHJpdmVyLgoKPiA+ID4gPiArCXJldCA9IHJlc2V0X2NvbnRyb2xf
ZGVhc3NlcnQoZHdjMy0+cmVzZXRzKTsKPiA+ID4gPiArCWlmIChyZXQpCj4gPiA+ID4gKwkJcmV0
dXJuIGRldl9lcnJfcHJvYmUoZGV2LCByZXQsICJmYWlsZWQgdG8gZGVhc3NlcnQgcmVzZXRzXG4i
KTsKPiA+ID4gPiArCj4gPiA+ID4gKwlyZXQgPSBkZXZtX2Nsa19idWxrX2dldF9hbGwoZHdjMy0+
ZGV2LCAmZHdjMy0+Y2xrcyk7Cj4gPiA+ID4gKwlpZiAocmV0IDwgMCkKPiA+ID4gPiArCQlyZXR1
cm4gZGV2X2Vycl9wcm9iZShkZXYsIHJldCwgImZhaWxlZCB0byBnZXQgY2xvY2tzXG4iKTsKPiA+
ID4gCj4gPiA+IENhbGwgZGV2bV9jbGtfYnVsa19nZXRfYWxsX2VuYWJsZWQoKSBpbnN0ZWFkIG9m
IGRvaW5nIHRoZSB0d28KPiA+ID4gc3RlcHMgc2VwYXJhdGVseSBoZXJlLgo+ID4gPiAKPiA+IAo+
ID4gV2lsbCBkbywgdGhhbmtzLgo+ID4gCj4gPiA+IAkJCQkJLUFsZXgKPiAKClJlZ2FyZHMsCllh
byBaaQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
