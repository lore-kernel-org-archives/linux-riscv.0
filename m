Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 853ABC54ED1
	for <linux-riscv@archiver.kernel.org>; Tue, 27 May 2025 16:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TKkWQdr6j8LvWB1lZ1yJb2Hkz7IBRByT9UnIAanoNzc=; b=qOhak/+j4xW7ua
	DXRxic9+b8Dvd9Xsty3SPyX9PT2rINw//AYMlB2ANTzZsdWdSP1et1zt1Hap3WBDze16+v8V8r6sv
	Rg4GwIROgozrxBxI2FUU3OHbgxM/JsPiGJVJIHdAD/5MR10JSCHrkJWHWKl1SX6Z1sZtEcrljoG/k
	FtBLKJ/6pO9a75ZtpiTiBm1DPDKlXTIPqBYP6B+9vzBocvfU7m/Ms37n9o0hUma22macVONLgLm+e
	pmDWgyhopYtcSb6qgpzILKKx0Kmq/0fewWY6rmuCYw3N4ola9kF107rYDdg0aagi3b4CoGQF3SDKH
	U0OBupDo2W2RYI2WWFsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxPA-0000000BBdg-2W6b;
	Tue, 27 May 2025 16:43:56 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJxNn-0000000BBTt-3UXL
	for linux-riscv@lists.infradead.org;
	Tue, 27 May 2025 16:42:34 +0000
Received: from [198.18.0.1] (10.88.157.134 [34.28.57.145])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1697939e2;
	Wed, 28 May 2025 00:42:00 +0800 (GMT+08:00)
Message-ID: <d855eedf-099f-4396-a79b-ee51b3bf24cb@whut.edu.cn>
Date: Wed, 28 May 2025 00:41:56 +0800
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [PATCH v4 2/4] dt-bindings: soc: spacemit: Add K1 MBUS controller
To: Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, linux-usb@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20250526-b4-k1-dwc3-v3-v4-0-63e4e525e5cb@whut.edu.cn>
 <20250526-b4-k1-dwc3-v3-v4-2-63e4e525e5cb@whut.edu.cn>
 <20250527-energetic-pink-cricket-a282fd@kuoka>
 <aDWeQfqKfxrgTA__@jean.localdomain> <20250527162539.GA423198-robh@kernel.org>
Content-Language: en-US
From: Ze Huang <huangze@whut.edu.cn>
In-Reply-To: <20250527162539.GA423198-robh@kernel.org>
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDSExPVkMaT0IeTUJLHxpCQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlIT1VJQ1VOTFVKT05ZV1kWGg8SFR0UWUFZT0tIVUpLSUJNS0pVSktLVUtZBg
	++
X-HM-Tid: 0a97129f4caf03a1kunm0054c905d0011
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PhA6Qio4LTErDFY4NysBEhIM
	LRdPChpVSlVKTE9DSE1PSkhJQ0hMVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlI
	T1VJQ1VOTFVKT05ZV1kIAVlBSElDSzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_094232_044428_B23849C3 
X-CRM114-Status: GOOD (  15.36  )
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

T24gNS8yOC8yNSAxMjoyNSBBTSwgUm9iIEhlcnJpbmcgd3JvdGU6Cj4gT24gVHVlLCBNYXkgMjcs
IDIwMjUgYXQgMDc6MTM6MDVQTSArMDgwMCwgWmUgSHVhbmcgd3JvdGU6Cj4+IE9uIFR1ZSwgTWF5
IDI3LCAyMDI1IGF0IDA4OjUxOjE5QU0gKzAyMDAsIEtyenlzenRvZiBLb3psb3dza2kgd3JvdGU6
Cj4+PiBPbiBNb24sIE1heSAyNiwgMjAyNSBhdCAxMDo0MDoxOFBNIEdNVCwgWmUgSHVhbmcgd3Jv
dGU6Cj4+Pj4gU29tZSBkZXZpY2VzIG9uIHRoZSBTcGFjZW1pVCBLMSBTb0MgcGVyZm9ybSBETUEg
dGhyb3VnaCBhIG1lbW9yeSBidXMKPj4+PiAoTUJVUykgdGhhdCBpcyBub3QgdGhlaXIgaW1tZWRp
YXRlIHBhcmVudCBpbiB0aGUgZGV2aWNlIHRyZWUuIFRoaXMgYnVzCj4+Pj4gdXNlcyBhIGRpZmZl
cmVudCBhZGRyZXNzIG1hcHBpbmcgdGhhbiB0aGUgQ1BVLgo+Pj4+Cj4+Pj4gVG8gZXhwcmVzcyB0
aGlzIHRvcG9sb2d5IHByb3Blcmx5LCBkZXZpY2VzIGFyZSBleHBlY3RlZCB0byB1c2UgdGhlCj4+
Pj4gaW50ZXJjb25uZWN0cyB3aXRoIG5hbWUgImRtYS1tZW0iIHRvIHJlZmVyZW5jZSB0aGUgTUJV
UyBjb250cm9sbGVyLgo+Pj4gSSBkb24ndCBnZXQgaXQsIHNvcnJ5LiBEZXZpY2VzIHBlcmZvcm1p
bmcgRE1BIHRocm91Z2ggZm9vLWJhciBzaG91bGQgdXNlCj4+PiBkbWFzIHByb3BlcnR5IGZvciBm
b28tYmFyIERNQSBjb250cm9sbGVyLiBJbnRlcmNvbm5lY3RzIGlzIG5vdCBmb3IgdGhhdC4KPj4+
Cj4+IEhpIEtyenlzenRvZiwKPj4KPj4gU29ycnkgZm9yIG5vdCBjbGFyaWZ5aW5nIHRoaXMgZWFy
bGllciAtIGxldCBtZSBwcm92aWRlIHNvbWUgY29udGV4dC4KPj4KPj4gVGhlIHB1cnBvc2Ugb2Yg
dGhpcyBub2RlIGlzIHRvIGRlc2NyaWJlIHRoZSBhZGRyZXNzIHRyYW5zbGF0aW9uIHVzZWQgZm9y
IERNQQo+PiBkZXZpY2UgdG8gbWVtb3J5IHRyYW5zYWN0aW9ucy4gSeKAmW0gdXNpbmcgdGhlICJp
bnRlcmNvbm5lY3RzIiBwcm9wZXJ0eSB3aXRoIHRoZQo+PiByZXNlcnZlZCBuYW1lICJkbWEtbWVt
IiBbMV0gaW4gY29uc3VtZXIgZGV2aWNlcyB0byBleHByZXNzIHRoaXMgcmVsYXRpb25zaGlwLgo+
PiBUaGUgYWN0dWFsIHRyYW5zbGF0aW9uIGlzIGhhbmRsZWQgYnkgdGhlIGBvZl90cmFuc2xhdGVf
ZG1hX2FkZHJlc3MoKWAgWzJdLgo+PiBUaGlzIHN1cHBvcnQgd2FzIGludHJvZHVjZWQgaW4gdGhl
IHNlcmllcyBsaW5rZWQgaW4gWzNdLgo+Pgo+PiBUaGlzIHNldHVwIGlzIHNpbWlsYXIgdG8gd2hh
dCB3ZSBzZWUgb24gcGxhdGZvcm1zIGxpa2UgQWxsd2lubmVyIHN1bjVpLAo+PiBzdW44aS1yNDAs
IGFuZCBOVklESUEgVGVncmEuIFs0XVs1XQo+Pgo+PiBJIGNvbnNpZGVyZWQgcmV1c2luZyB0aGUg
ZXhpc3RpbmcgQWxsd2lubmVyIE1CVVMgZHJpdmVyIGFuZCBiaW5kaW5ncy4KPj4gSG93ZXZlciwg
dGhlIEFsbHdpbm5lciBNQlVTIGluY2x1ZGVzIGFkZGl0aW9uYWwgZnVuY3Rpb25hbGl0eSBzdWNo
IGFzCj4+IGJhbmR3aWR0aCBtb25pdG9yaW5nIGFuZCBmcmVxdWVuY3kgY29udHJvbCAtIGZlYXR1
cmVzIHRoYXQgYXJlIGVpdGhlcgo+PiBhYnNlbnQgb3IgdW5kb2N1bWVudGVkIG9uIHRoZSBTcGFj
ZW1pVCBLMSBTb0MuCj4gVGhlIGludGVyY29ubmVjdCBiaW5kaW5nIGlzIGZvciB3aGVuIHlvdSBo
YXZlIHRob3NlIHNvZnR3YXJlIGNvbnRyb2xzLgo+IElmIHlvdSBvbmx5IGhhdmUgYWRkcmVzcyB0
cmFuc2xhdGlvbiwgdGhlbiAnZG1hLXJhbmdlcycgaW4gYSBwYXJlbnQgbm9kZQo+IGlzIGFsbCB5
b3UgbmVlZC4KPgo+IFJvYgoKRGlmZmVyZW50IGRldmljZXMgb24gdGhlIFNvQyBtYXkgaGF2ZSBk
aXN0aW5jdCBETUEgYWRkcmVzcyB0cmFuc2xhdGlvbnMuCkEgY29tbW9uIGRtYS1yYW5nZXMgaW4g
dGhlIHBhcmVudCBub2RlIG1heSBub3QgcmVwcmVzZW50IHRoaXMgYWNjdXJhdGVseS4KCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1h
aWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5p
bmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
