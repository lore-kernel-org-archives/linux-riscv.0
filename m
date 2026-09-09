Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A509C79FBD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 17:58:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uElGpCbYRFpV2bBg9v3wisihEPKwD821DC/w3GMXRY=; b=ashGqHucagh9+o
	0qCN3kitkpP2cCOMI4sCP3gI81FYeiCGynO7haNtVn1LLsrm8ucYEAFubXuAmzvdZzSyUwcX8ay95
	pdJ5JAk5Cocic4cnoGJTBvs7BQiouWyVoN1gb2D4EWIMnaEnCj6McrEW1LMBDzyx7bB6XAHdfXw8X
	XBDG7rS7Mh6FfYMdBlvMU/zhLvr4WcbtKbcemd/o4Bf/OzkO18FjurL2Bw8iopG4ChmdTYWk1kvCW
	QvxPuOXkdmwOJ3nbY0Y3hz/pbBqe5so1+bfMH1Tn3VDzWeYJNWOUzae3GBhyXF078NykVAScOBFQi
	EVt6fmj1uOyYJjbYFLqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYo-0000000CYjR-0Xfc;
	Wed, 09 Sep 2026 17:58:14 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4MYm-0000000CYgK-0EKP;
	Wed, 09 Sep 2026 17:58:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=W1u4isHAY9FR5rPW9RRCXL4X5BSB1AJKJjDnU2w1M2Q=; b=RZfgcSvfKU/UbKLlEgr9nyReMU
	PYMdCxU6Ww3NM49d97yfo3ToM1HSWNpbtLQ3axynZjcqFXq9POHCvoh/FEJzMzjPBjjgISh0zYiDi
	DsqNAWHlO7RKhqCsSulAmlVOGN/FqzkAYqf7GGg/0Lu7ODlElP49acsaf4wXiuoQ8zwn8ljzBAawo
	/Nmog9ICCV6KuigtIWRh05rhAV+a9RnG1zDVI7SpD+0VJSsMBSUI3a1lvvxd8Db/MOc9bSVvV3n8Y
	AYz/xO4qtC17dauM6pFmPPMwV8+qSrY1aA5L4fS1F5IkPFtjcdl6kncNPEI5Q2QZIlS8a+ZvsyN7Y
	ve9JD+ag==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4MYe-00000001WBd-1ilY;
	Wed, 09 Sep 2026 17:58:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 60E561576;
	Wed,  9 Sep 2026 10:57:55 -0700 (PDT)
Received: from [10.211.55.7] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6B7053F528;
	Wed,  9 Sep 2026 10:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=foss.arm.com; s=main;
	t=1788976679; bh=j8s/pkdPWtkxGrVAkD2rab4CbgigKfGGO1TTpT60Ytc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=RPs4/Neb/y37OUPUAPtmTMK+coFcLiQBrF3yVred7gBeaz/MeVjBz12tCr7F47QPm
	 ABzvTt3YlvzFcd7TnQG0PSz8uyeNCufAq99j1K3rmmTkkA378Od8fbwEHJ6LKmH70i
	 MWzZAmfduRv183pVWxmOljB8e4xFyytHY7XinDH4=
Message-ID: <0ef9f4ab-4c9f-4089-bed3-f7726ec97804@foss.arm.com>
Date: Wed, 9 Sep 2026 12:57:57 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Shadow Stack Locking Semantics between arch's
To: Mark Brown <broonie@kernel.org>, Jesse Huang <jesse.huang@sifive.com>
Cc: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 linux-arm-kernel@lists.infradead.org,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 linux-hardening@vger.kernel.org, linux-api@vger.kernel.org,
 dave.hansen@linux.intel.com, rick.p.edgecombe@intel.com, debug@rivosinc.com,
 andrew@sifive.com, kito.cheng@sifive.com
References: <a1946d93-370e-4ca9-85d6-60b4a20ffd47@arm.com>
 <3bb672e0-7bc3-434f-904e-aa00394dd01f@foss.arm.com>
 <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
Content-Language: en-US
From: Bill Roberts <bill.roberts@foss.arm.com>
In-Reply-To: <d20ccb74-69ed-45d7-a810-846904873588@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_185804_864454_890E5128 
X-CRM114-Status: GOOD (  34.73  )
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

PHNuaXA+ICsgSmVzc2UsIGhlIGlzIHdvcmtpbmcgb24gdGhlIGdsaWJjIHNpZGUgKyBDQyBhIGZl
dyBvdGhlcnMgb24gCnRoYXQgdGhyZWFkIGFzIHN1Ym1pdHRlZCBvbiB0aGUgZ2xpYmMgc2lkZSBm
cm9tIHNpZml2ZS4gU29ycnkgZm9yIHRoZSAKZGVsYXksIEkgd2FzIGF3YXkgb24gdmFjYXRpb24u
Cgo+PiB1bnNpZ25lZCBsb25nIGxvY2tlZCA9IDB4MjsgLy8gS2VybmVsIFRhc2sgU3RhdGUgLT4g
TE9DSyBXUklURQo+PiB1bnNpZ25lZCBsb25nIGN1cl92YWwgPSAweDM7IC8vIEtlcm5lbCBUYXNr
IFN0YXRlIC0+IFdSSVRFIGFuZCBTSEFET1dTVEFDSwo+PiBFTkFCTEVECj4+IHVuc2lnbmVkIGxv
bmcgbmV3X3ZhbCA9IDB4MDsgLy8gVXNlcnNwYWNlIEZlYXR1cmUgQ2hhbmdlIHZpYSBzeXNjYWxs
IC0+Cj4+IERJU0FCTEUKPj4gfCB4ODYtNjQgfCByaXNjLXYgfCBhcm02NCB8Cj4+IHwgLS0tLS0t
LS0tLSB8IC0tLS0tLS0tIHwgLS0tLS0tLS0tIHwKPj4gfCBXb3Jrc8KgIHwgRmFpbHPCoCB8IEZh
aWxzwqAgwqAgwqB8Cj4gSSB3b3VsZCBub3QgaGF2ZSBleHBlY3RlZCB0aGF0IGNvbWJpbmF0aW9u
IHRvIHdvcmsgYXQgYWxsIHdpdGggdGhlCj4gcHJjdGwoKSAoYXMgb3Bwb3NlZCB0byBhcmNoX3By
Y3RsKCkpIGludGVyZmFjZSBUQkgsIGlmIHlvdSd2ZSBsb2NrZWQKPiB3cml0ZSBvbiB5b3Ugc2hv
dWxkbid0IGJlIGFibGUgdG8gZGlzYWJsZSBpdC4gIFRoZSByZWFzb24gdGhhdCB3b3JrcyBvbgo+
IHg4NiBhdCB0aGUgbWludXRlIGlzIHRoYXQgZm9yIHg4NiB5b3UgY2FuIG9ubHkgY2hhbmdlIG9u
ZSBiaXQgYXQgYSB0aW1lCj4gc28gdGhlIG5ldyB2YWx1ZSB3aGVuIGRpc2FibGluZyBpcyBlZmZl
Y3RpdmVseSAweDIsIG5vdCAweDAuClllcywgdGhpcyBpcyBleGFjdGx5IHdoYXQgSSBhbSBwb2lu
dGluZyBvdXQuIEltcGxlbWVudGF0aW9uIGFzaWRlLCBpcyB0aGF0CnRoZSBiZWhhdmlvciB3ZSB3
YW50Pwo+Cj4+IEkgYW0gcHJvcG9zaW5nIGFuZCBoYXZlIHF1ZXN0aW9ucyBvdmVyIHRoZSBmb2xs
b3dpbmc6Cj4+IDEuIFdoYXQgc2hvdWxkIHRoZSBiZWhhdmlvciBiZSBpZiB5b3UgaGFkIHdyaXRl
IGxvY2tlZCBhbmQgZGlzYWJsZSB0aGUKPj4gc2hhZG93IHN0YWNrPwo+PiAgwqAgLSBJIGNhbiBh
cmd1ZSBib3RoIHdheXMgaGVyZSwgLUVQRVJNIG9yIHN1Y2Nlc3MuIEkgdGhpbmsgSSBhbmQgbW9z
dCBhcmNoZXMKPj4gbGVhZCB0byBmYWlsdXJlLgo+IEdpdmVuIHRoYXQgUklTQy1WIGRvZXNuJ3Qg
c3VwcG9ydCBjb250cm9sIG9mIHdyaXRlcyBpdCdzIG1vb3QgdGhlcmUKPiBhdCB0aGUgbWludXRl
LCBhbmQgeDg2IGN1cnJlbnRseSB1c2VzIGFyY2hfcHJjdGwoKSBzbyB3aWxsIG5lZWQgYW4KPiBh
ZGRpdGlvbmFsIEFQSSwgaXQgc2VlbXMgdGhlIHBhdGggb2YgbGVhc3QgcmVzaXN0YW5jZSBpcyB0
byBhbGxvdyBpdC4KPiBUaGlzIGFsc28gYXZvaWRzIGxvY2tpbmcgd3JpdGVzIChvciBwdXNoZXMs
IGZvciBhcm02NCkgb24gZWZmZWN0aXZlbHkKPiBhbHNvIGxvY2tpbmcgZW5hYmxlIHdoaWNoIHNl
ZW1zIG5lYXRlci4KPgo+PiAyLiByaXNjdiBzaG91bGQgY2hlY2sgdGhhdCB0aGUgbG93IGJpdCBp
cyBzZXQgaW4gbG9ja2luZyBub3QganVzdCB0aGF0IGl0cwo+PiAwLCBpdCBzaG91bGQgYmUgMQo+
IEkgdGhpbmsgZm9yIEFCSSBjb21wYXRpYmlsaXR5IFJJU0MtViB3aWxsIGhhdmUgdG8gY29udGlu
dWUgYWNjZXB0aW5nIDAKPiBhcyBiZWluZyBlcXVpdmFsZW50IHRvIGxvY2tpbmcgUFJfU0hBRE9X
X1NUQUNLX0VOQUJMRSAob3IgZXZlcnl0aGluZywKPiBidXQgaXQgb25seSBzdXBwb3J0cyB0aGF0
IG9uZSBiaXQgcmlnaHQgbm93KS4KClRMO0RSIC0gTm8gdXNlcnMsIGxldHMgZml4IGl0IGJlZm9y
ZSByaXNjLXYgbGFuZHMgdGhlIHVzZXJzcGFjZSBzaWRlIElJVUMKCkkgY2FuJ3QgZmluZCBhbnkg
bGliYydzIHRoYXQgc3VwcG9ydCB0aGlzIGZvciByaXNjLXYuIEl0IGFwcGVhcnMgdGhlIGdsaWJj
CnBhdGNoZXMgd2VyZSBub3QgbWVyZ2VkIGFuZCBJIGNvbW1lbnRlZCBvbiB0aG9zZSBwYXRjaGVz
IGp1c3Qgbm93CnRoYXQgdGhlIGludGVyZmFjZSBpcyB3cm9uZzoKIMKgIC0gCmh0dHBzOi8vaW5i
b3guc291cmNld2FyZS5vcmcvbGliYy1hbHBoYS84YTVlMjFkMC0wNjI4LTQ5MTAtOWFkOC0xNjVj
ODI5ZTk2ODBAZm9zcy5hcm0uY29tLwoKQWRkaXRpb25hbGx5LCBzdHJlc3MtbmcgZG9lcyBpdCAi
Z2VuZXJpY2FsbHkiLCBhbmQgaXQgd291bGQgYmUgYnJva2VuIG9uIAphIHJpc2N2IHN5c3RlbToK
IMKgIC0gCmh0dHBzOi8vc291cmNlcy5kZWJpYW4ub3JnL3NyYy9zdHJlc3MtbmcvMC4yMi4wMC0y
L3N0cmVzcy1wcmN0bC5jP2hsPTExNDQjTDExNDQKClRoaXMgaXMgYSBidWcgYW5kIG5ldmVyIGZv
bGxvd2VkIHRoZSBjb252ZW50aW9uIHRvIGJlZ2luIHdpdGguIFNvIHJpc2MtdiBpcwpub24tY29t
cGxpYW50IHRvIHRoZSBzcGVjIGFuZCB0aGlzIGVmZmVjdGl2ZWx5IHByZXZlbnRzIHRoZSBhIHRy
dWUgCnVuaWZpY2F0aW9uCm9mIGEgZ2VuZXJpYyBwcmN0bCBpbnRlcmZhY2UuIFRoZSBiZWhhdmlv
ciBvbiByaXNjdiBkb2Vzbid0IGFkaGVyZSB0byAKdGhlcmUgb3duIGRvY3M6CgogwqAgLSAKaHR0
cHM6Ly9jZG4ua2VybmVsLm9yZy9kb2MvaHRtbC9sYXRlc3QvYXJjaC9yaXNjdi96aWNmaXNzLmh0
bWwjcHJjdGwtZW5hYmxpbmcKCj4KPj4gMy4gcmlzY3Ygc2hvdWxkIHJldHVybiAtRVBFUk0gdnMg
LUVJTlZBTAo+IElmIHlvdSBtZWFuIGZvciBhcmNoX2xvY2tfc2hhZG93X3N0YWNrX3N0YXR1cygp
IEkgdGhpbmsgLUVJTlZBTCBpcyBhCj4gc2Vuc2libGUgZXJyb3IgY29kZSB3aGVuIHRoZSBzeXN0
ZW0gb3IgdGFzayBkb2VzIG5vdCBzdXBwb3J0IHNoYWRvdwo+IHN0YWNrcywgSSdtIG5vdCBzdXJl
IHdlIHNob3VsZCByZXR1cm4gLUVQRVJNIGF0IGFsbC4gIE9uIGFybTY0IHdlCj4gc3VwcG9ydCBs
b2NraW5nIGFueSBiaXQsIG5vdCBqdXN0IHRoZSBvbmVzIHRoYXQgd2UgY3VycmVudGx5IGtub3cg
YWJvdXQuCj4gVGhpcyBpcyBmb3IgZnV0dXJlIHByb29maW5nLCB1c2Vyc3BhY2UgY2FuIGxvY2sg
dW5rbm93biBmbGFncy4KCk5vLCBJIG1lYW4gd2hlbiBzZXR0aW5nIGEgbG9ja2VkIGJpdCB2aWEg
cHJjdGwgCmFuZMKgUFJfU0VUX1NIQURPV19TVEFDS19TVEFUVVMuCkN1cnJlbnRseSwgdGhlIGVy
cm9yIGNvZGVzIGZvciBjaGFuZ2luZyBhIGxvY2tlZCBiaXQ6Cng4NjogRVBFUk0KYXJtNjQ6IEVC
VVNZIChXaGljaCB3ZSBkaXNjdXNzZWQgb2ZmbGluZSBhYm91dCBjaGFuZ2luZyB0byBFUEVSTSkK
cmlzYy12OgoKPj4gSWYgd2UgY2FuIGFsbCBhZ3JlZSBvbiBpdGVtIDEsIHRoYXQgbG9ja2VkIGJp
dHMgY2hlY2sgY2FuIGJlIHJlZmFjdG9yZWQgYW5kCj4+IHNoYXJlZCBpbiBvbmUgb2YKPj4gdHdv
IHdheXM6Cj4+IDEuIHdpdGhpbiBwcmN0bCBpdHNlbGYsIGJlZm9yZSB0aGUgYXJjaCBob29rIGlz
IGNhbGxlZCwgd2Ugd291bGQgbmVlZAo+PiBoZWxwZXJzIHBlci1hcmNoIHRvIGV4dHJhY3QgdGhl
IHRocmVhZCBmZWF0dXJlcyBhbmQgbG9jayBiaXRzCj4+IDIuIGFzIGEgaGVscGVyIHdoZXJlIGZv
bGtzIGp1c3QgcGFzcyB0aGUgdW5zaWduZWQgbG9uZyBvZiB0aGUgYml0cyB0byBnZXQKPj4gdGhl
IHJlc3VsdAo+IEZvciBtZSBvcHRpb24gMSBzZWVtcyBhIGJpdCBuaWNlciwgYW5kIG1vdmVzIG1v
cmUgb2YgdGhlIGltcGxlbWVudGF0aW9uCj4gaW50byBnZW5lcmljIGNvZGUgd2hpY2ggaXMgc29t
ZXRoaW5nIHdlIHNob3VsZCByZWFsbHkgYmUgZG9pbmcgaW4KPiBnZW5lcmFsIHdpdGggdGhlIHNo
YWRvdyBzdGFjayBzdXBwb3J0IC0gdGhlcmUncyBhIGxvdCBvZiBjcm9zcyBhcmNoCj4gZHVwbGlj
YXRpb24gYXQgdGhlIG1pbnV0ZS4gIEl0IGhhcyBiZWVuIG9uIG15IGxpc3QgdG8gbG9vayBhdCB0
aGlzCj4gcmVwaXRpdGlvbiBhdCBzb21lIHBvaW50LCBpdCBoYWQgYmVlbiBoZWxkIHVwIGJ5IHRo
ZSBjbG9uZTMoKSBzdHVmZiBidXQKPiB0aGF0IHNlZW1zIHRvIGhhdmUgZGllZCBhIGRlYXRoIGZv
ciBub3cuCkFncmVlZCwgaXQncyBtb3JlIHdvcmssIGJ1dCBJIGxpa2UgaXQgYmV0dGVyLgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
