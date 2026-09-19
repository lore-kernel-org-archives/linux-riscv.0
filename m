Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD9FC982DA
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 10:00:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jA9/R2Z9X5GaUcwg9uiYZEm+B7+MArwtc8AC0UuimW0=; b=BAgdRpfKPnfP+o
	IC68oo4tNkMkPY+ZcsLrVDkSEn+RUTcDrxeUo6t2E4fPGSi94HDsegwt0QiA5A7AJ0cC9ryZJf/B6
	5PkMLV9pnliHbu0n6XogDUU7iTyWKmphzIC6X52QWTm9eRTTsWiMXyZmaCww5vO+0rZNbG6y9vMeu
	cAU8lBcYdyCYIBTUklYXqprZtraaiK1tQssgB2PnVONFimqSSs3vszW7CmMNcmppz91t89TmM6wke
	z87LrqrpqC7XjeDiR4PO3U5O5ZDUvs0KoFGGG+Hf2Mg5ujSg5HTIT3BZbzLqMfyZ+uPFP/2vSoTjh
	hAr1srJPc8m7lL64t9EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rrB-0000000G9eH-3586;
	Sat, 19 Sep 2026 09:59:41 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7rrA-0000000G9e2-3e80
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 09:59:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0E9A66022F;
	Sat, 19 Sep 2026 09:59:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A7001F000FF;
	Sat, 19 Sep 2026 09:59:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789811979;
	bh=/juClfc4zjT8s6+Co2KTVBIDitHQE/UNTvknaxZvdOM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=S94yuSIUbbRQq28E4TYRleHABaLUUTRhLwQH2EtuoP9MYA9wsvlhSoauVUCUjXbCI
	 VjNnHRaPzNiwD3CxTtVH87PEPbRQgUHutJBuunGsRT9EWCAZ+H2z1RNBSz+tZ5vVUN
	 nFesC2vONliha9KN9j0Iaf1FubzEEHpRxH9GDxOfAhoGaqbcxnmQ9i2UAUh8lRfsiR
	 yQhQqs0ddj4bauxUA87ii9I0JmEDTzBTaMqiliBY/cixpZuG9TsU6SlgEgBzV68Qou
	 0L2XBtzs9SIhC8+7adEM2nBi2aZAZxwGcqVGnLxxZnMX3Mafzsp0uLKyh5lGCYaBEy
	 ksIvHim59WWwQ==
Date: Sat, 19 Sep 2026 09:59:36 +0000
From: Yixun Lan <dlan@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
Message-ID: <20260919095936-GKA322102@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
 <a4359efeee2220903a05a2383a651ec8ec7284b7.camel@icenowy.me>
 <20260918230107-GKC297024@kernel.org>
 <33b33b2b79763d410bc2e5b4ef46c305aaf6f7c8.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <33b33b2b79763d410bc2e5b4ef46c305aaf6f7c8.camel@icenowy.me>
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

SGkgSWNlbm93eSwKCk9uIDE0OjU3IFNhdCAxOSBTZXAgICAgICwgSWNlbm93eSBaaGVuZyB3cm90
ZToKPiDlnKggMjAyNi0wOS0xOOS6lOeahCAyMzowMSArMDAwMO+8jFlpeHVuIExhbuWGmemBk++8
mgo+ID4gSGkgSWNlbm93eSwgCj4gPiAKPiA+IE9uIDE3OjAwIEZyaSAxOCBTZXDCoMKgwqDCoCAs
IEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+IOWcqCAyMDI2LTA5LTE45LqU55qEIDAyOjQwICsw
MDAw77yMWWl4dW4gTGFu5YaZ6YGT77yaCj4gPiA+ID4gwqAgU3BhY2VtaVQncyBQTVUgKFBvd2Vy
IE1hbmFnZW1lbnQgVW5pdCkgY29uc2lzdCBvZiBzZXZlcmFsIHBvd2VyCj4gPiA+ID4gZG9tYWlu
cwo+ID4gPiA+IHdoaWNoIGNhbiBiZSBtYW5hZ2VkIGluZGVwZW5kZW50bHksIGRlcGVuZGluZyBv
biBkaWZmZXJlbnQKPiA+ID4gPiBhcHBsaWNhdGlvbgo+ID4gPiA+IHNjZW5hcmlvLCBlYWNoIGRv
bWFpbiBjYW4gYmUgcG93ZXJlZCBvbi9vZmYgZm9yIHNhdmluZyBwb3dlci4KPiA+ID4gPiAKPiA+
ID4gPiDCoCBUaGUgZHJpdmVyIGlzIGltcGxlbWVudGVkIGJhc2VkIG9uIExpbnV4IEdlbmVyaWMg
UE0gRG9tYWluCj4gPiA+ID4gZnJhbWV3b3JrLgo+ID4gPiA+IEZyb20gYSBoYXJkd2FyZSBwZXJz
cGVjdGl2ZSwgZWl0aGVyIG9mIHR3byBkaXN0aW5jdCBwb3dlci1vbgo+ID4gPiA+IHNlcXVlbmNl
cwo+ID4gPiA+IGFyZSBzdXBwb3J0ZWQsIGluIHNvZnR3YXJlIG1vZGUgKFNXIG1vZGUpLCB0aGUg
ZHJpdmVyIGlzCj4gPiA+ID4gcmVzcG9uc2libGUKPiA+ID4gPiBmb3IKPiA+ID4gPiBjb250cm9s
bGluZyB0aGUgc3RhdGVzIG9mIGJpdHMgc3VjaCBhcyBzbGVlcDEsIHNsZWVwMiwgaXNvbGF0aW9u
Cj4gPiA+ID4gYW5kCj4gPiA+ID4gcHdyX3N0YXRlLCB3aGlsZSBpbiBoYXJkd2FyZSBtb2RlIChI
VyBtb2RlKSwgdGhlIFBNVSBoYXJkd2FyZQo+ID4gPiA+IHdpbGwKPiA+ID4gPiBjb21wbGV0ZQo+
ID4gPiA+IHRoZSBzZXF1ZW5jZSBhdXRvbWF0aWNhbGx5IHdpdGhvdXQgcmVxdWlyaW5nIHNvZnR3
YXJlCj4gPiA+ID4gaW50ZXJ2ZW50aW9uLgo+ID4gPiAKPiA+ID4gSSB0aGluayB0aGVyZSBhbHNv
IGV4aXN0cyBzb2x1dGlvbnMgZm9yIEszIHRoYXQgdXNlcyBSUE1JIHBvd2VyCj4gPiA+IGRvbWFp
bnMsIGFuZCBsZXQgdGhlaXIgRVNPUyBmaXJtd2FyZSB0byBhY2Nlc3MgdGhlIGhhcmR3YXJlLgo+
ID4gPiAKPiA+IFllcywgSSdtIGF3YXJlIG9mIHRoYXQKPiA+IAo+ID4gPiBXaGF0J3MgdGhlIHJl
bGF0aW9uc2hpcCBvZiB0aGlzIGltcGxlbWVudGF0aW9uIHdpdGggdGhlIEVTT1MKPiA+ID4gaW1w
bGVtZW50YXRpb24/IFNob3VsZCB0aGUgRVNPUyBwYXJ0IGJlIGRpc2FibGVkIHRvIHVzZSB0aGlz
Cj4gPiA+IGltcGxlbWVudGF0aW9uPwo+ID4gPiAKPiA+IEkgc2hvdWxkIHNheSwgaXQncyBhIG11
dHVhbGx5IGV4Y2x1c2l2ZSBzb2x1dGlvbiwgc28geWVzLCB0aGUgRVNPUwo+ID4gcGFydAo+ID4g
c2hvdWxkIGJlIGRpc2FibGVkIGluIG9yZGVyIHRvIHVzZSB0aGlzIHZlcnNpb24KPiA+IAo+ID4g
VGhlIG1vdGl2YXRpb24gb2YgdGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gc3VwcG9ydCBkcm0vZGlz
cGxheQo+ID4gZHJpdmVyJ3MKPiA+IFBNIHJlcXVpcmVtZW50LCB3aGlsZSBhdm9pZCBnb2luZyB3
aXRoIHZlbmRvcidzIGNvbXBsaWNhdGVkIFJQTUkKPiA+IHNvbHV0aW9uCj4gPiB3aGljaCBpc24n
dCBtYWlubGluZSByZWFkeQo+IAo+IElzIHRoaXMgYSBsb25nLXRlcm0gc29sdXRpb24sIG9yIGEg
dGVtcG9yYXJ5IG9uZT8KPiAKRm9yIHVwc3RyZWFtLCBJJ2Qgc2F5IHdlIHByb2JhYmx5IHdpbGwg
c3RpY2sgdG8gdGhpcyBzb2x1dGlvbiBmb3IKbG9uZyB0aW1lLCB3b24ndCBzYXkgaXQgJ2ZvcmV2
ZXInLCBzZWUgY29tbWVudCBiZWxvdy4uCgo+IElmIGl0J3MgYSB0ZW1wb3JhcnkgY29uZmxpY3Rp
bmcgb25lLCBJIGRvbid0IHRoaW5rIGl0J3Mgd29ydGggcGlja2luZwo+IGF0IGFsbC4KPiAKV2Vs
bCwgY2hlY2tlZCBjdXJyZW50IExpbnV4IGtlcm5lbCBzdGF0dXMsIHRoZXJlIGlzIG5vIFJQTUkg
UE0gc29sdXRpb24gCmltcGxlbWVudGVkIGFsdGhvdWdoIHRoZXJlIGlzIGRvY3VtZW50YXRpb24g
aW4gcmlzY3YtcnBtaSBzcGVjWzFdCgpPbiB0aGUgb3RoZXIgaGFuZCwgSSBzZWUgbm8gcHJvYmxl
bSB0byBzd2l0Y2ggdG8gUlBNSSBzb2x1dGlvbiBvbmNlIGl0CmJlY2FtZSBtYXR1cmUsIGl0J3Mg
dmVyeSBzaW1pbGFyIHRvIHR3byBzb2x1dGlvbiBvZiBjbG9jayBDTEtfQ0NVIHZzIENMS19SUE1J
Li4gCgpMaW5rOiBodHRwczovL2dpdGh1Yi5jb20vcmlzY3Ytbm9uLWlzYS9yaXNjdi1ycG1pL2Js
b2IvbWFpbi9zcmMvc3J2Z3JwLWRldmljZS1wb3dlci5hZG9jIFsxXQotLSAKWWl4dW4gTGFuIChk
bGFuKQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGlu
dXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0
cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
